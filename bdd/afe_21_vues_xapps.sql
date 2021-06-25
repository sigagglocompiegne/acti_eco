/*Amt_Fon_Eco V1.0*/
/*Creation des vues applicatives stockées dans le schéma x_apps */
/* afe_61_vues_xapps.sql */
/*PostGIS*/

/* Propriétaire : GeoCompiegnois - http://geo.compiegnois.fr/ */
/* Auteur : Grégory Bodet */



-- ####################################################################################################################################################
-- ###                                                                                                                                              ###
-- ###                                                              VUES APPLICATIVES                                                                ###
-- ###                                                                                                                                              ###
-- ####################################################################################################################################################


-- ########################################################### SCHEMA x_apps #########################

-- ########################################################### Synthèse des procédures en terme de programmation de logements #########################
							       
							       
-- View: x_apps.xapps_an_v_synt_proc

-- DROP VIEW x_apps.xapps_an_v_synt_proc;

CREATE OR REPLACE VIEW x_apps.xapps_an_v_synt_proc AS 
 WITH req_proc AS (
         SELECT geo_v_proc.idgeopo,
            geo_v_proc.idsite,
            geo_v_proc.l_surf_cess_ha,
            geo_v_proc.l_surf_ha,
            geo_v_proc.l_nb_log,
            geo_v_proc.l_nb_logind,
            geo_v_proc.l_nb_logindgr,
            geo_v_proc.l_nb_logcol,
            geo_v_proc.l_nb_logaide,
            geo_v_proc.l_nb_logaide_loc,
            geo_v_proc.l_nb_logaide_acc
           FROM m_urbanisme_reg.geo_v_proc
        ), req_surf AS (
         SELECT an_amt_lot_hab.idsite,
            sum(an_amt_lot_hab.surf)::double precision / 10000::double precision AS surf,
            sum(an_amt_lot_hab.nb_log_r)::integer AS nb_log_r,
            sum(an_amt_lot_hab.nb_logind_r)::integer AS nb_logind_r,
            sum(an_amt_lot_hab.nb_logindgr_r)::integer AS nb_logindgr_r,
            sum(an_amt_lot_hab.nb_logcol_r)::integer AS nb_logcol_r,
            sum(an_amt_lot_hab.nb_logaide_r)::integer AS nb_logaide_r,
            sum(an_amt_lot_hab.nb_logaide_loc_r)::integer AS nb_logaide_loc_r,
            sum(an_amt_lot_hab.nb_logaide_acc_r)::integer AS nb_logaide_acc_r
           FROM m_amenagement.an_amt_lot_hab
          WHERE an_amt_lot_hab.idsite IS NOT NULL
          GROUP BY an_amt_lot_hab.idsite
        ), date_rh AS (
         SELECT an_amt_lot_hab.idsite,
            max(an_amt_lot_hab.date_maj) AS date_maj_h
           FROM m_amenagement.an_amt_lot_hab
          WHERE an_amt_lot_hab.idsite IS NOT NULL
          GROUP BY an_amt_lot_hab.idsite
        )
 SELECT req_proc.idgeopo,
    req_proc.idsite,
        CASE
            WHEN req_surf.nb_log_r::double precision = 0::double precision OR req_surf.nb_log_r::double precision IS NULL OR req_proc.l_surf_ha = 0::double precision OR req_proc.l_surf_ha IS NULL THEN ''::character varying::text
            ELSE round((req_surf.nb_log_r::double precision / req_proc.l_surf_ha)::integer::numeric, 0)::character varying::text || ' log/ha'::text
        END AS densite_brute_p,
        CASE
            WHEN req_surf.nb_log_r::double precision = 0::double precision OR req_surf.nb_log_r::double precision IS NULL OR req_proc.l_surf_cess_ha = 0::numeric OR req_proc.l_surf_cess_ha IS NULL THEN ''::character varying::text
            ELSE round((req_surf.nb_log_r::double precision / req_proc.l_surf_cess_ha::double precision)::integer::numeric, 0)::character varying::text || ' log/ha'::text
        END AS densite_nette_p,
    req_proc.l_nb_log,
    req_proc.l_nb_logind,
    req_proc.l_nb_logindgr,
    req_proc.l_nb_logcol,
    req_proc.l_nb_logaide,
    req_proc.l_nb_logaide_loc,
    req_proc.l_nb_logaide_acc,
    req_surf.nb_log_r,
    req_surf.nb_logind_r,
    req_surf.nb_logindgr_r,
    req_surf.nb_logcol_r,
    req_surf.nb_logaide_r,
    req_surf.nb_logaide_loc_r,
    req_surf.nb_logaide_acc_r,
    date_rh.date_maj_h
   FROM req_proc
     JOIN req_surf ON req_proc.idsite::text = req_surf.idsite::text
     JOIN date_rh ON req_proc.idsite::text = date_rh.idsite::text;

ALTER TABLE x_apps.xapps_an_v_synt_proc
  OWNER TO sig_create;

COMMENT ON VIEW x_apps.xapps_an_v_synt_proc
  IS 'Vue de synthèse permettant de calculer le nombre de logements réalisés et de la comparer au prévisonnel pour les procédures d''aménagement (lien dans GEO avec geo_v_proc sur idsite)';


-- ########################################################### Bilan des procédures #########################

-- Materialized View: x_apps.xapps_an_vmr_bilan_procedure

-- DROP MATERIALIZED VIEW x_apps.xapps_an_vmr_bilan_procedure;

CREATE MATERIALIZED VIEW x_apps.xapps_an_vmr_bilan_procedure AS 
 WITH req_site AS (
         SELECT geo_objet_site.idsite
           FROM r_objet.geo_objet_site
        ), req_cession AS (
         SELECT geo_v_cession.idsite,
            sum(geo_v_cession.l_pvente_ht) AS l_pvente_ht,
            sum(geo_v_cession.l_mfrais_ttc) AS l_mfrais_ttc
           FROM m_foncier.geo_v_cession
          WHERE geo_v_cession.idsite IS NOT NULL
          GROUP BY geo_v_cession.idsite
        ), req_acqui AS (
         SELECT geo_fon_acqui.idsite,
            sum(geo_fon_acqui.m_acquiht) AS m_acquiht,
            sum(geo_fon_acqui.l_mfrais) AS l_mfrais
           FROM m_foncier.geo_fon_acqui
          WHERE geo_fon_acqui.idsite IS NOT NULL
          GROUP BY geo_fon_acqui.idsite
        ), date_c AS (
         SELECT geo_v_cession.idsite,
            max(geo_v_cession.date_maj) AS date_maj_c
           FROM m_foncier.geo_v_cession
          WHERE geo_v_cession.idsite IS NOT NULL
          GROUP BY geo_v_cession.idsite
        ), date_a AS (
         SELECT geo_fon_acqui.idsite,
            max(geo_fon_acqui.date_maj) AS date_maj_a
           FROM m_foncier.geo_fon_acqui
          WHERE geo_fon_acqui.idsite IS NOT NULL
          GROUP BY geo_fon_acqui.idsite
        ), nb_a AS (
         SELECT geo_fon_acqui.idsite,
            count(*) AS nb_a
           FROM m_foncier.geo_fon_acqui
          WHERE geo_fon_acqui.idsite IS NOT NULL
          GROUP BY geo_fon_acqui.idsite
        ), nb_c AS (
         SELECT geo_v_cession.idsite,
            count(*) AS nb_c
           FROM m_foncier.geo_v_cession
          WHERE geo_v_cession.idsite IS NOT NULL
          GROUP BY geo_v_cession.idsite
        ), nb_a_m_r AS (
         SELECT geo_fon_acqui.idsite,
            count(*) AS nb_a_m_r
           FROM m_foncier.geo_fon_acqui
          WHERE geo_fon_acqui.idsite IS NOT NULL AND geo_fon_acqui.m_acquiht IS NOT NULL
          GROUP BY geo_fon_acqui.idsite
        ), nb_c_m_r AS (
         SELECT geo_v_cession.idsite,
            count(*) AS nb_c_m_r
           FROM m_foncier.geo_v_cession
          WHERE geo_v_cession.l_pvente_ht IS NOT NULL AND geo_v_cession.idsite IS NOT NULL
          GROUP BY geo_v_cession.idsite
        ), nb_a_f_r AS (
         SELECT geo_fon_acqui.idsite,
            count(*) AS nb_a_f_r
           FROM m_foncier.geo_fon_acqui
          WHERE geo_fon_acqui.l_mfrais IS NOT NULL AND geo_fon_acqui.idsite IS NOT NULL
          GROUP BY geo_fon_acqui.idsite
        ), nb_c_f_r AS (
         SELECT geo_v_cession.idsite,
            count(*) AS nb_c_f_r
           FROM m_foncier.geo_v_cession
          WHERE geo_v_cession.l_mfrais_ttc IS NOT NULL AND geo_v_cession.idsite IS NOT NULL
          GROUP BY geo_v_cession.idsite
        )
 SELECT req_site.idsite,
    req_cession.l_pvente_ht,
    req_cession.l_mfrais_ttc,
    date_c.date_maj_c,
    req_acqui.m_acquiht,
    req_acqui.l_mfrais,
    date_a.date_maj_a,
        CASE
            WHEN nb_a.nb_a IS NULL THEN 0::bigint
            ELSE nb_a.nb_a
        END AS nb_a,
        CASE
            WHEN nb_c.nb_c IS NULL THEN 0::bigint
            ELSE nb_c.nb_c
        END AS nb_c,
        CASE
            WHEN nb_a_m_r.nb_a_m_r IS NULL THEN 0::bigint
            ELSE nb_a_m_r.nb_a_m_r
        END AS nb_a_m_r,
        CASE
            WHEN nb_c_m_r.nb_c_m_r IS NULL THEN 0::bigint
            ELSE nb_c_m_r.nb_c_m_r
        END AS nb_c_m_r,
        CASE
            WHEN nb_a_f_r.nb_a_f_r IS NULL THEN 0::bigint
            ELSE nb_a_f_r.nb_a_f_r
        END AS nb_a_f_r,
        CASE
            WHEN nb_c_f_r.nb_c_f_r IS NULL THEN 0::bigint
            ELSE nb_c_f_r.nb_c_f_r
        END AS nb_c_f_r
   FROM req_site
     LEFT JOIN req_cession ON req_site.idsite::text = req_cession.idsite::text
     LEFT JOIN date_c ON req_site.idsite::text = date_c.idsite::text
     LEFT JOIN req_acqui ON req_site.idsite::text = req_acqui.idsite::text
     LEFT JOIN date_a ON req_site.idsite::text = date_a.idsite::text
     LEFT JOIN nb_a ON req_site.idsite::text = nb_a.idsite::text
     LEFT JOIN nb_c ON req_site.idsite::text = nb_c.idsite::text
     LEFT JOIN nb_a_m_r ON req_site.idsite::text = nb_a_m_r.idsite::text
     LEFT JOIN nb_c_m_r ON req_site.idsite::text = nb_c_m_r.idsite::text
     LEFT JOIN nb_a_f_r ON req_site.idsite::text = nb_a_f_r.idsite::text
     LEFT JOIN nb_c_f_r ON req_site.idsite::text = nb_c_f_r.idsite::text
WITH DATA;

ALTER TABLE x_apps.xapps_an_vmr_bilan_procedure
  OWNER TO sig_create;

COMMENT ON MATERIALIZED VIEW x_apps.xapps_an_vmr_bilan_procedure
  IS 'Vue matérialisée pour gérer un bilan foncier pour introduire dans la fiche d''information des procédures d''aménagements (en test, à voir avec le pôle sur cette oportunité ?)
Cette vue est rafraichie toutes les nuits par une tache CRON sur le serveur sig-sgbd.';

-- Index: x_apps.idx_xapps_an_vmr_bilan_procedure_idsite

-- DROP INDEX x_apps.idx_xapps_an_vmr_bilan_procedure_idsite;

CREATE INDEX idx_xapps_an_vmr_bilan_procedure_idsite
  ON x_apps.xapps_an_vmr_bilan_procedure
  USING btree
  (idsite COLLATE pg_catalog."default");



-- ########################################################### Synthèse des pôles #########################

-- Materialized View: x_apps.xapps_an_vmr_synt_pole_api

-- DROP MATERIALIZED VIEW x_apps.xapps_an_vmr_synt_pole_api;

CREATE MATERIALIZED VIEW x_apps.xapps_an_vmr_synt_pole_api AS 
 WITH req_a AS (
         SELECT geo_sa_pole.idpole,
            geo_sa_pole.nom_pole,
            now() AS date_extract
           FROM m_economie.geo_sa_pole
        ), req_e AS (
         SELECT DISTINCT p.idpole,
                CASE
                    WHEN count(a_1.idsite) IS NOT NULL THEN count(a_1.idsite)::character varying
                    ELSE 'Non disponible'::character varying
                END AS nbsite
           FROM m_economie.an_sa_site a_1,
            m_economie.geo_sa_pole p
          WHERE a_1.idpole::text = p.idpole::text
          GROUP BY p.idpole
        ), req_f AS (
         SELECT geo_sa_pole.idpole,
            count(*) AS nb_etab_sirene
           FROM m_economie.an_sa_etab,
            x_apps.xapps_an_v_site_liste,
            m_economie.geo_sa_pole,
            s_sirene.an_etablissement_api
          WHERE an_sa_etab.idsite::text = xapps_an_v_site_liste.idsite::text AND xapps_an_v_site_liste.idpole::text = geo_sa_pole.idpole::text AND an_sa_etab.idsiret::text = an_etablissement_api.siret::text AND an_etablissement_api.etatadministratifetablissement::text = 'A'::text AND an_sa_etab.l_compte = true
          GROUP BY geo_sa_pole.idpole
        ), req_g AS (
         SELECT geo_sa_pole.idpole,
            count(*) AS nb_etab_spe
           FROM m_economie.geo_sa_etabp,
            m_economie.geo_sa_pole
          WHERE geo_sa_etabp.l_compte = true AND st_intersects(geo_sa_etabp.geom, geo_sa_pole.geom)
          GROUP BY geo_sa_pole.idpole
        ), req_h AS (
         SELECT geo_sa_pole.idpole,
            sum(an_sa_etab.eff_etab)::integer AS eff_globaux_sirene
           FROM m_economie.an_sa_etab,
            x_apps.xapps_an_v_site_liste,
            m_economie.geo_sa_pole,
            s_sirene.an_etablissement_api
          WHERE an_sa_etab.idsite::text = xapps_an_v_site_liste.idsite::text AND xapps_an_v_site_liste.idpole::text = geo_sa_pole.idpole::text AND an_sa_etab.idsiret::text = an_etablissement_api.siret::text AND an_etablissement_api.etatadministratifetablissement::text = 'A'::text AND an_sa_etab.l_compte = true
          GROUP BY geo_sa_pole.idpole
        ), req_i AS (
         SELECT geo_sa_pole.idpole,
            sum(geo_sa_etabp.eff_etab)::integer AS eff_globaux_etabp
           FROM m_economie.geo_sa_etabp,
            m_economie.geo_sa_pole
          WHERE geo_sa_etabp.l_compte = true AND st_intersects(geo_sa_etabp.geom, geo_sa_pole.geom)
          GROUP BY geo_sa_pole.idpole
        ), req_j AS (
         SELECT geo_sa_pole.idpole,
                CASE
                    WHEN sum(an_sa_lot.surf) IS NOT NULL THEN
                    CASE
                        WHEN length(sum(an_sa_lot.surf)::character varying::text) >= 1 AND length(sum(an_sa_lot.surf)::character varying::text) <= 3 THEN sum(an_sa_lot.surf)::character varying::text || ' m²'::text
                        WHEN length(sum(an_sa_lot.surf)::character varying::text) = 4 THEN replace(to_char(sum(an_sa_lot.surf), 'FM9G999'::text), ','::text, ' '::text) || ' m²'::text
                        WHEN length(sum(an_sa_lot.surf)::character varying::text) = 5 THEN replace(to_char(sum(an_sa_lot.surf), 'FM99G999'::text), ','::text, ' '::text) || ' m²'::text
                        WHEN length(sum(an_sa_lot.surf)::character varying::text) = 6 THEN replace(to_char(sum(an_sa_lot.surf), 'FM999G999'::text), ','::text, ' '::text) || ' m²'::text
                        WHEN length(sum(an_sa_lot.surf)::character varying::text) = 7 THEN replace(to_char(sum(an_sa_lot.surf), 'FM9G999G999'::text), ','::text, ' '::text) || ' m²'::text
                        WHEN length(sum(an_sa_lot.surf)::character varying::text) = 8 THEN replace(to_char(sum(an_sa_lot.surf), 'FM99G999G999'::text), ','::text, ' '::text) || ' m²'::text
                        ELSE NULL::text
                    END
                    ELSE 'Non disponible'::text
                END AS surf_dispo_vente
           FROM m_economie.an_sa_lot,
            m_economie.geo_sa_pole,
            r_objet.geo_objet_fon_lot,
            m_amenagement.an_amt_lot_stade
          WHERE (an_amt_lot_stade.l_comm2::text = '11'::text OR an_amt_lot_stade.l_comm2::text = '12'::text) AND an_sa_lot.idgeolf = geo_objet_fon_lot.idgeolf AND geo_objet_fon_lot.idgeolf = an_amt_lot_stade.idgeolf AND st_intersects(geo_sa_pole.geom, st_pointonsurface(geo_objet_fon_lot.geom)) = true
          GROUP BY geo_sa_pole.idpole
        ), req_k AS (
         SELECT geo_sa_pole.idpole,
                CASE
                    WHEN sum(an_sa_lot.surf) IS NOT NULL THEN
                    CASE
                        WHEN length(sum(an_sa_lot.surf)::character varying::text) >= 1 AND length(sum(an_sa_lot.surf)::character varying::text) <= 3 THEN sum(an_sa_lot.surf)::character varying::text || ' m²'::text
                        WHEN length(sum(an_sa_lot.surf)::character varying::text) = 4 THEN replace(to_char(sum(an_sa_lot.surf), 'FM9G999'::text), ','::text, ' '::text) || ' m²'::text
                        WHEN length(sum(an_sa_lot.surf)::character varying::text) = 5 THEN replace(to_char(sum(an_sa_lot.surf), 'FM99G999'::text), ','::text, ' '::text) || ' m²'::text
                        WHEN length(sum(an_sa_lot.surf)::character varying::text) = 6 THEN replace(to_char(sum(an_sa_lot.surf), 'FM999G999'::text), ','::text, ' '::text) || ' m²'::text
                        WHEN length(sum(an_sa_lot.surf)::character varying::text) = 7 THEN replace(to_char(sum(an_sa_lot.surf), 'FM9G999G999'::text), ','::text, ' '::text) || ' m²'::text
                        WHEN length(sum(an_sa_lot.surf)::character varying::text) = 8 THEN replace(to_char(sum(an_sa_lot.surf), 'FM99G999G999'::text), ','::text, ' '::text) || ' m²'::text
                        ELSE NULL::text
                    END
                    ELSE 'Non disponible'::text
                END AS surf_dedie_act
           FROM m_economie.an_sa_lot,
            m_economie.geo_sa_pole,
            r_objet.geo_objet_fon_lot,
            m_amenagement.an_amt_lot_stade
          WHERE geo_objet_fon_lot.l_voca::text = '20'::text AND an_sa_lot.idgeolf = geo_objet_fon_lot.idgeolf AND geo_objet_fon_lot.idgeolf = an_amt_lot_stade.idgeolf AND st_intersects(geo_sa_pole.geom, st_pointonsurface(geo_objet_fon_lot.geom)) = true
          GROUP BY geo_sa_pole.idpole
        ), req_l AS (
         SELECT geo_sa_pole.idpole,
                CASE
                    WHEN sum(an_sa_lot.surf) IS NOT NULL THEN
                    CASE
                        WHEN length(sum(an_sa_lot.surf)::character varying::text) >= 1 AND length(sum(an_sa_lot.surf)::character varying::text) <= 3 THEN sum(an_sa_lot.surf)::character varying::text || ' m²'::text
                        WHEN length(sum(an_sa_lot.surf)::character varying::text) = 4 THEN replace(to_char(sum(an_sa_lot.surf), 'FM9G999'::text), ','::text, ' '::text) || ' m²'::text
                        WHEN length(sum(an_sa_lot.surf)::character varying::text) = 5 THEN replace(to_char(sum(an_sa_lot.surf), 'FM99G999'::text), ','::text, ' '::text) || ' m²'::text
                        WHEN length(sum(an_sa_lot.surf)::character varying::text) = 6 THEN replace(to_char(sum(an_sa_lot.surf), 'FM999G999'::text), ','::text, ' '::text) || ' m²'::text
                        WHEN length(sum(an_sa_lot.surf)::character varying::text) = 7 THEN replace(to_char(sum(an_sa_lot.surf), 'FM9G999G999'::text), ','::text, ' '::text) || ' m²'::text
                        WHEN length(sum(an_sa_lot.surf)::character varying::text) = 8 THEN replace(to_char(sum(an_sa_lot.surf), 'FM99G999G999'::text), ','::text, ' '::text) || ' m²'::text
                        ELSE NULL::text
                    END
                    ELSE 'Non disponible'::text
                END AS surf_reserve_projet
           FROM m_economie.an_sa_lot,
            m_economie.geo_sa_pole,
            r_objet.geo_objet_fon_lot,
            m_amenagement.an_amt_lot_stade
          WHERE (an_amt_lot_stade.l_comm2::text = '31'::text OR an_amt_lot_stade.l_comm2::text = '32'::text) AND geo_objet_fon_lot.l_voca::text = '20'::text AND an_sa_lot.idgeolf = geo_objet_fon_lot.idgeolf AND geo_objet_fon_lot.idgeolf = an_amt_lot_stade.idgeolf AND st_intersects(geo_sa_pole.geom, st_pointonsurface(geo_objet_fon_lot.geom)) = true
          GROUP BY geo_sa_pole.idpole
        ), req_m AS (
         SELECT geo_sa_pole.idpole,
            st_area(geo_sa_pole.geom) AS surf_tot
           FROM m_economie.geo_sa_pole
        )
 SELECT a.idpole AS "Identifiant du pôle",
    a.nom_pole AS "Libellé du pôle",
    now() AS "Date d'extraction des données",
    e.nbsite AS "Nombre de sites contenus dans le pôle",
        CASE
            WHEN f.nb_etab_sirene::integer > 0 AND g.nb_etab_spe::integer > 0 THEN (f.nb_etab_sirene::integer + g.nb_etab_spe::integer)::text
            WHEN f.nb_etab_sirene::integer > 0 AND g.nb_etab_spe::integer IS NULL THEN f.nb_etab_sirene::text
            WHEN f.nb_etab_sirene::integer IS NULL AND g.nb_etab_spe::integer > 0 THEN g.nb_etab_spe::text
            ELSE 'Non disponible'::text
        END AS "Nombre d'entreprises",
        CASE
            WHEN h.eff_globaux_sirene > 0 AND i.eff_globaux_etabp > 0 THEN (h.eff_globaux_sirene + i.eff_globaux_etabp)::text
            WHEN h.eff_globaux_sirene > 0 AND i.eff_globaux_etabp IS NULL THEN h.eff_globaux_sirene::text
            WHEN h.eff_globaux_sirene IS NULL AND i.eff_globaux_etabp > 0 THEN i.eff_globaux_etabp::text
            ELSE 'Non disponible'::text
        END AS "Nombre d'emplois",
    m.surf_tot AS "Surface totale",
        CASE
            WHEN j.surf_dispo_vente IS NULL THEN 'Non disponible'::text
            ELSE j.surf_dispo_vente
        END AS "Surface disponible à la vente",
        CASE
            WHEN k.surf_dedie_act IS NULL THEN 'Non disponible'::text
            ELSE k.surf_dedie_act
        END AS "Surface dédiée à l'activité",
        CASE
            WHEN l.surf_reserve_projet IS NULL THEN 'Non disponible'::text
            ELSE l.surf_reserve_projet
        END AS "Surface réservée pour des projets en cours"
   FROM req_a a
     LEFT JOIN req_e e ON a.idpole::text = e.idpole::text
     LEFT JOIN req_f f ON a.idpole::text = f.idpole::text
     LEFT JOIN req_g g ON a.idpole::text = g.idpole::text
     LEFT JOIN req_h h ON a.idpole::text = h.idpole::text
     LEFT JOIN req_i i ON a.idpole::text = i.idpole::text
     LEFT JOIN req_j j ON a.idpole::text = j.idpole::text
     LEFT JOIN req_k k ON a.idpole::text = k.idpole::text
     LEFT JOIN req_l l ON a.idpole::text = l.idpole::text
     LEFT JOIN req_m m ON a.idpole::text = m.idpole::text
WITH DATA;

ALTER TABLE x_apps.xapps_an_vmr_synt_pole_api
  OWNER TO sig_create;

COMMENT ON MATERIALIZED VIEW x_apps.xapps_an_vmr_synt_pole_api
  IS 'Vue matérialisée présentant les données de synthèses à l''échelle du pôle (données sur l''environnement économique et statistiques foncières présentes sur le fiche d''information du pôle dans l''application métier GEO). Cette vue est rafraichie toutes les nuits par une tache CRON sur le serveur sig-sgbd.';

-- ########################################################### Synthèse des sites d'activités #########################
-- Materialized View: x_apps.xapps_an_vmr_synt_site_act_api

-- View: x_apps.xapps_an_vmr_synt_site_act_api

--DROP MATERIALIZED VIEW x_apps.xapps_an_vmr_synt_site_act_api;

CREATE MATERIALIZED VIEW x_apps.xapps_an_vmr_synt_site_act_api
TABLESPACE pg_default
AS

 WITH req_a AS (
         SELECT an_sa_site.idsite,
            an_sa_site.site_nom,
                CASE
                    WHEN an_sa_site.dest::text = '00'::text THEN 'Non renseigné'::text
                    WHEN an_sa_site.dest::text = '10'::text THEN 'Artisanat'::text
                    WHEN an_sa_site.dest::text = '20'::text THEN 'Industrie ou R&D'::text
                    WHEN an_sa_site.dest::text = '30'::text THEN 'Tertiaire'::text
                    WHEN an_sa_site.dest::text = '40'::text THEN 'Transport et logistique'::text
                    WHEN an_sa_site.dest::text = '50'::text THEN 'Commerce'::text
                    WHEN an_sa_site.dest::text = '60'::text THEN 'Agriculture'::text
                    WHEN an_sa_site.dest::text = '70'::text THEN 'Service/Négoce'::text
                    ELSE NULL::text
                END AS dest,
                CASE
                    WHEN an_sa_site.site_voca::text = '00'::text THEN 'Pas de vocation'::text
                    WHEN an_sa_site.site_voca::text = '10'::text THEN 'ZI - zone industrielle'::text
                    WHEN an_sa_site.site_voca::text = '20'::text THEN 'ZA - zone artisanale'::text
                    WHEN an_sa_site.site_voca::text = '30'::text THEN 'ZC - zone commerciale'::text
                    WHEN an_sa_site.site_voca::text = '40'::text THEN 'ZM - zone mixte'::text
                    ELSE NULL::text
                END AS voca,
            now() AS date_extract
           FROM m_economie.an_sa_site
          ORDER BY an_sa_site.site_nom
        ), req_f AS (
 		SELECT an_sa_site.idsite,
            count(*) AS nb_etab_sirene
           FROM m_economie.an_sa_etab,
            m_economie.an_sa_site,s_sirene.an_etablissement_api
          WHERE an_sa_etab.idsite::text = an_sa_site.idsite::text AND an_sa_etab.l_compte = true AND an_sa_etab.idsiret=an_etablissement_api.siret
		  AND an_etablissement_api.etatadministratifetablissement = 'A' 
          GROUP BY an_sa_site.idsite
        ), req_g AS (
         SELECT an_sa_site.idsite,
            count(*) AS nb_etab_spe
           FROM m_economie.geo_sa_etabp,
            m_economie.an_sa_site
          WHERE an_sa_site.idsite::text = geo_sa_etabp.idsite::text AND geo_sa_etabp.l_compte = true
          GROUP BY an_sa_site.idsite
        ), req_h AS (
         SELECT an_sa_site.idsite,
            sum(an_sa_etab.eff_etab)::integer AS eff_globaux_sirene
           FROM m_economie.an_sa_etab,
            m_economie.an_sa_site,s_sirene.an_etablissement_api
          WHERE an_sa_etab.idsite::text = an_sa_site.idsite::text AND an_sa_etab.l_compte = true AND an_sa_etab.idsiret=an_etablissement_api.siret
		  AND an_etablissement_api.etatadministratifetablissement = 'A' 
          GROUP BY an_sa_site.idsite
        ), req_i AS (
         SELECT an_sa_site.idsite,
            sum(geo_sa_etabp.eff_etab)::integer AS eff_globaux_etabp
           FROM m_economie.geo_sa_etabp,
            m_economie.an_sa_site
          WHERE an_sa_site.idsite::text = geo_sa_etabp.idsite::text AND geo_sa_etabp.l_compte = true
          GROUP BY an_sa_site.idsite
        ), req_j AS (
         SELECT geo_v_site_eco.idsite,
                CASE
                    WHEN sum(an_sa_lot.surf) IS NOT NULL THEN
                    CASE
                        WHEN length(sum(an_sa_lot.surf)::character varying::text) >= 1 AND length(sum(an_sa_lot.surf)::character varying::text) <= 3 THEN sum(an_sa_lot.surf)::character varying::text || ' m²'::text
                        WHEN length(sum(an_sa_lot.surf)::character varying::text) = 4 THEN replace(to_char(sum(an_sa_lot.surf), 'FM9G999'::text), ','::text, ' '::text) || ' m²'::text
                        WHEN length(sum(an_sa_lot.surf)::character varying::text) = 5 THEN replace(to_char(sum(an_sa_lot.surf), 'FM99G999'::text), ','::text, ' '::text) || ' m²'::text
                        WHEN length(sum(an_sa_lot.surf)::character varying::text) = 6 THEN replace(to_char(sum(an_sa_lot.surf), 'FM999G999'::text), ','::text, ' '::text) || ' m²'::text
                        WHEN length(sum(an_sa_lot.surf)::character varying::text) = 7 THEN replace(to_char(sum(an_sa_lot.surf), 'FM9G999G999'::text), ','::text, ' '::text) || ' m²'::text
                        WHEN length(sum(an_sa_lot.surf)::character varying::text) = 8 THEN replace(to_char(sum(an_sa_lot.surf), 'FM99G999G999'::text), ','::text, ' '::text) || ' m²'::text
                        ELSE NULL::text
                    END
                    ELSE 'Non disponible'::text
                END AS surf_dispo_vente
           FROM m_economie.an_sa_lot,
            m_economie.geo_v_site_eco,
            r_objet.geo_objet_fon_lot,
            m_amenagement.an_amt_lot_stade
          WHERE (an_amt_lot_stade.l_comm2::text = '11'::text OR an_amt_lot_stade.l_comm2::text = '12'::text) AND an_sa_lot.idgeolf = geo_objet_fon_lot.idgeolf AND an_amt_lot_stade.idgeolf = geo_objet_fon_lot.idgeolf AND st_intersects(geo_v_site_eco.geom, st_pointonsurface(geo_objet_fon_lot.geom)) = true
          GROUP BY geo_v_site_eco.idsite
        ), req_k AS (
         SELECT geo_v_site_eco.idsite,
                CASE
                    WHEN sum(an_sa_lot.surf) IS NOT NULL THEN
                    CASE
                        WHEN length(sum(an_sa_lot.surf)::character varying::text) >= 1 AND length(sum(an_sa_lot.surf)::character varying::text) <= 3 THEN sum(an_sa_lot.surf)::character varying::text || ' m²'::text
                        WHEN length(sum(an_sa_lot.surf)::character varying::text) = 4 THEN replace(to_char(sum(an_sa_lot.surf), 'FM9G999'::text), ','::text, ' '::text) || ' m²'::text
                        WHEN length(sum(an_sa_lot.surf)::character varying::text) = 5 THEN replace(to_char(sum(an_sa_lot.surf), 'FM99G999'::text), ','::text, ' '::text) || ' m²'::text
                        WHEN length(sum(an_sa_lot.surf)::character varying::text) = 6 THEN replace(to_char(sum(an_sa_lot.surf), 'FM999G999'::text), ','::text, ' '::text) || ' m²'::text
                        WHEN length(sum(an_sa_lot.surf)::character varying::text) = 7 THEN replace(to_char(sum(an_sa_lot.surf), 'FM9G999G999'::text), ','::text, ' '::text) || ' m²'::text
                        WHEN length(sum(an_sa_lot.surf)::character varying::text) = 8 THEN replace(to_char(sum(an_sa_lot.surf), 'FM99G999G999'::text), ','::text, ' '::text) || ' m²'::text
                        ELSE NULL::text
                    END
                    ELSE 'Non disponible'::text
                END AS surf_dedie_act
           FROM m_economie.an_sa_lot,
            m_economie.geo_v_site_eco,
            r_objet.geo_objet_fon_lot,
            m_amenagement.an_amt_lot_stade
          WHERE geo_objet_fon_lot.l_voca::text = '20'::text AND an_sa_lot.idgeolf = geo_objet_fon_lot.idgeolf AND an_amt_lot_stade.idgeolf = geo_objet_fon_lot.idgeolf AND st_intersects(geo_v_site_eco.geom, st_pointonsurface(geo_objet_fon_lot.geom)) = true
          GROUP BY geo_v_site_eco.idsite
        ), req_k1 AS (
         SELECT geo_v_site_eco.idsite,
                CASE
                    WHEN sum(an_sa_lot.surf) IS NOT NULL THEN
                    CASE
                        WHEN length(sum(an_sa_lot.surf)::character varying::text) >= 1 AND length(sum(an_sa_lot.surf)::character varying::text) <= 3 THEN sum(an_sa_lot.surf)::character varying::text || ' m²'::text
                        WHEN length(sum(an_sa_lot.surf)::character varying::text) = 4 THEN replace(to_char(sum(an_sa_lot.surf), 'FM9G999'::text), ','::text, ' '::text) || ' m²'::text
                        WHEN length(sum(an_sa_lot.surf)::character varying::text) = 5 THEN replace(to_char(sum(an_sa_lot.surf), 'FM99G999'::text), ','::text, ' '::text) || ' m²'::text
                        WHEN length(sum(an_sa_lot.surf)::character varying::text) = 6 THEN replace(to_char(sum(an_sa_lot.surf), 'FM999G999'::text), ','::text, ' '::text) || ' m²'::text
                        WHEN length(sum(an_sa_lot.surf)::character varying::text) = 7 THEN replace(to_char(sum(an_sa_lot.surf), 'FM9G999G999'::text), ','::text, ' '::text) || ' m²'::text
                        WHEN length(sum(an_sa_lot.surf)::character varying::text) = 8 THEN replace(to_char(sum(an_sa_lot.surf), 'FM99G999G999'::text), ','::text, ' '::text) || ' m²'::text
                        ELSE NULL::text
                    END
                    ELSE 'Non disponible'::text
                END AS surf_reserve_projet
           FROM m_economie.an_sa_lot,
            m_economie.geo_v_site_eco,
            r_objet.geo_objet_fon_lot,
            m_amenagement.an_amt_lot_stade
          WHERE (an_amt_lot_stade.l_comm2::text = '31'::text OR an_amt_lot_stade.l_comm2::text = '32'::text) AND geo_objet_fon_lot.l_voca::text = '20'::text AND an_sa_lot.idgeolf = geo_objet_fon_lot.idgeolf AND an_amt_lot_stade.idgeolf = geo_objet_fon_lot.idgeolf AND st_intersects(geo_v_site_eco.geom, st_pointonsurface(geo_objet_fon_lot.geom)) = true
          GROUP BY geo_v_site_eco.idsite
        ), req_l2018 AS (
         SELECT h_an_sa_site.idsite,
            h_an_sa_site.nb_etab AS nb_etab_18,
            h_an_sa_site.eff_etab AS eff_etab_18
           FROM m_economie.h_an_sa_site
          WHERE h_an_sa_site.annee_h = 2018
        ), req_l2017 AS (
         SELECT h_an_sa_site.idsite,
            h_an_sa_site.nb_etab AS nb_etab_17,
            h_an_sa_site.eff_etab AS eff_etab_17
           FROM m_economie.h_an_sa_site
          WHERE h_an_sa_site.annee_h = 2017
        ), req_l2016 AS (
         SELECT h_an_sa_site.idsite,
            h_an_sa_site.nb_etab AS nb_etab_16,
            h_an_sa_site.eff_etab AS eff_etab_16
           FROM m_economie.h_an_sa_site
          WHERE h_an_sa_site.annee_h = 2016
        ), req_l2015 AS (
         SELECT h_an_sa_site.idsite,
            h_an_sa_site.nb_etab AS nb_etab_15,
            h_an_sa_site.eff_etab AS eff_etab_15
           FROM m_economie.h_an_sa_site
          WHERE h_an_sa_site.annee_h = 2015
        ), req_l2014 AS (
         SELECT h_an_sa_site.idsite,
            h_an_sa_site.nb_etab AS nb_etab_14,
            h_an_sa_site.eff_etab AS eff_etab_14
           FROM m_economie.h_an_sa_site
          WHERE h_an_sa_site.annee_h = 2014
        ), req_l2013 AS (
         SELECT h_an_sa_site.idsite,
            h_an_sa_site.nb_etab AS nb_etab_13,
            h_an_sa_site.eff_etab AS eff_etab_13
           FROM m_economie.h_an_sa_site
          WHERE h_an_sa_site.annee_h = 2013
        ), req_l2012 AS (
         SELECT h_an_sa_site.idsite,
            h_an_sa_site.nb_etab AS nb_etab_12,
            h_an_sa_site.eff_etab AS eff_etab_12
           FROM m_economie.h_an_sa_site
          WHERE h_an_sa_site.annee_h = 2012
        ), req_l2011 AS (
         SELECT h_an_sa_site.idsite,
            h_an_sa_site.nb_etab AS nb_etab_11,
            h_an_sa_site.eff_etab AS eff_etab_11
           FROM m_economie.h_an_sa_site
          WHERE h_an_sa_site.annee_h = 2011
        ), req_l2010 AS (
         SELECT h_an_sa_site.idsite,
            h_an_sa_site.nb_etab AS nb_etab_10,
            h_an_sa_site.eff_etab AS eff_etab_10
           FROM m_economie.h_an_sa_site
          WHERE h_an_sa_site.annee_h = 2010
        ), req_l2009 AS (
         SELECT h_an_sa_site.idsite,
            h_an_sa_site.nb_etab AS nb_etab_09,
            h_an_sa_site.eff_etab AS eff_etab_09
           FROM m_economie.h_an_sa_site
          WHERE h_an_sa_site.annee_h = 2009
        ), req_l2008 AS (
         SELECT h_an_sa_site.idsite,
            h_an_sa_site.nb_etab AS nb_etab_08,
            h_an_sa_site.eff_etab AS eff_etab_08
           FROM m_economie.h_an_sa_site
          WHERE h_an_sa_site.annee_h = 2008
        ), req_l2007 AS (
         SELECT h_an_sa_site.idsite,
            h_an_sa_site.nb_etab AS nb_etab_07,
            h_an_sa_site.eff_etab AS eff_etab_07
           FROM m_economie.h_an_sa_site
          WHERE h_an_sa_site.annee_h = 2007
        )
 SELECT a.idsite AS "Identifiant du site",
    a.site_nom AS "Libellé du site",
    a.dest AS "Destination du site",
    a.voca AS "Vocation du site",
    a.date_extract AS "Extraction des données le",
        CASE
            WHEN f.nb_etab_sirene::integer >= 0 AND g.nb_etab_spe::integer >= 0 THEN (f.nb_etab_sirene::integer + g.nb_etab_spe::integer)::text
            WHEN f.nb_etab_sirene::integer >= 0 AND g.nb_etab_spe::integer IS NULL THEN f.nb_etab_sirene::text
            WHEN f.nb_etab_sirene::integer IS NULL AND g.nb_etab_spe::integer >= 0 THEN g.nb_etab_spe::text
            ELSE 'Non disponible'::text
        END AS nb_etab,
        CASE
            WHEN h.eff_globaux_sirene >= 0 AND i.eff_globaux_etabp >= 0 THEN (h.eff_globaux_sirene + i.eff_globaux_etabp)::text
            WHEN h.eff_globaux_sirene >= 0 AND i.eff_globaux_etabp IS NULL THEN h.eff_globaux_sirene::text
            WHEN h.eff_globaux_sirene IS NULL AND i.eff_globaux_etabp >= 0 THEN i.eff_globaux_etabp::text
            ELSE 'Non disponible'::text
        END AS eff_etab,
        CASE
            WHEN j.surf_dispo_vente IS NOT NULL THEN j.surf_dispo_vente::character varying
            ELSE 'Aucune ou non disponible'::character varying
        END AS "Surface disponible à la vente",
        CASE
            WHEN k.surf_dedie_act IS NOT NULL THEN k.surf_dedie_act::character varying
            ELSE 'Aucune ou non disponible'::character varying
        END AS "Surface dédiée pour des activités",
        CASE
            WHEN k1.surf_reserve_projet IS NOT NULL THEN k1.surf_reserve_projet::character varying
            ELSE ' Aucune ou non disponible'::character varying
        END AS "Surface réservée pour des projets en cours",
        CASE
            WHEN l2018.nb_etab_18 IS NULL THEN 'Non disponible'::text
            ELSE l2018.nb_etab_18
        END AS nb_etab_18,
        CASE
            WHEN l2017.nb_etab_17 IS NULL THEN 'Non disponible'::text
            ELSE l2017.nb_etab_17
        END AS nb_etab_17,
        CASE
            WHEN l2018.eff_etab_18 IS NULL THEN 'Non disponible'::text
            ELSE l2018.eff_etab_18
        END AS eff_etab_18,
        CASE
            WHEN l2017.eff_etab_17 IS NULL THEN 'Non disponible'::text
            ELSE l2017.eff_etab_17
        END AS eff_etab_17,
        CASE
            WHEN l2016.nb_etab_16 IS NULL THEN 'Non disponible'::text
            ELSE l2016.nb_etab_16
        END AS nb_etab_16,
        CASE
            WHEN l2016.eff_etab_16 IS NULL THEN 'Non disponible'::text
            ELSE l2016.eff_etab_16
        END AS eff_etab_16,
        CASE
            WHEN l2015.nb_etab_15 IS NULL THEN 'Non disponible'::text
            ELSE l2015.nb_etab_15
        END AS nb_etab_15,
        CASE
            WHEN l2015.eff_etab_15 IS NULL THEN 'Non disponible'::text
            ELSE l2015.eff_etab_15
        END AS eff_etab_15,
        CASE
            WHEN l2014.nb_etab_14 IS NULL THEN 'Non disponible'::text
            ELSE l2014.nb_etab_14
        END AS nb_etab_14,
        CASE
            WHEN l2014.eff_etab_14 IS NULL THEN 'Non disponible'::text
            ELSE l2014.eff_etab_14
        END AS eff_etab_14,
        CASE
            WHEN l2013.nb_etab_13 IS NULL THEN 'Non disponible'::text
            ELSE l2013.nb_etab_13
        END AS nb_etab_13,
        CASE
            WHEN l2013.eff_etab_13 IS NULL THEN 'Non disponible'::text
            ELSE l2013.eff_etab_13
        END AS eff_etab_13,
        CASE
            WHEN l2012.nb_etab_12 IS NULL THEN 'Non disponible'::text
            ELSE l2012.nb_etab_12
        END AS nb_etab_12,
        CASE
            WHEN l2012.eff_etab_12 IS NULL THEN 'Non disponible'::text
            ELSE l2012.eff_etab_12
        END AS eff_etab_12,
        CASE
            WHEN l2011.nb_etab_11 IS NULL THEN 'Non disponible'::text
            ELSE l2011.nb_etab_11
        END AS nb_etab_11,
        CASE
            WHEN l2011.eff_etab_11 IS NULL THEN 'Non disponible'::text
            ELSE l2011.eff_etab_11
        END AS eff_etab_11,
        CASE
            WHEN l2010.nb_etab_10 IS NULL THEN 'Non disponible'::text
            ELSE l2010.nb_etab_10
        END AS nb_etab_10,
        CASE
            WHEN l2010.eff_etab_10 IS NULL THEN 'Non disponible'::text
            ELSE l2010.eff_etab_10
        END AS eff_etab_10,
        CASE
            WHEN l2009.nb_etab_09 IS NULL THEN 'Non disponible'::text
            ELSE l2009.nb_etab_09
        END AS nb_etab_09,
        CASE
            WHEN l2009.eff_etab_09 IS NULL THEN 'Non disponible'::text
            ELSE l2009.eff_etab_09
        END AS eff_etab_09,
        CASE
            WHEN l2008.nb_etab_08 IS NULL THEN 'Non disponible'::text
            ELSE l2008.nb_etab_08
        END AS nb_etab_08,
        CASE
            WHEN l2008.eff_etab_08 IS NULL THEN 'Non disponible'::text
            ELSE l2008.eff_etab_08
        END AS eff_etab_08,
        CASE
            WHEN l2007.nb_etab_07 IS NULL THEN 'Non disponible'::text
            ELSE l2007.nb_etab_07
        END AS nb_etab_07,
        CASE
            WHEN l2007.eff_etab_07 IS NULL THEN 'Non disponible'::text
            ELSE l2007.eff_etab_07
        END AS eff_etab_07
   FROM req_a a
     LEFT JOIN req_f f ON a.idsite::text = f.idsite::text
     LEFT JOIN req_g g ON a.idsite::text = g.idsite::text
     LEFT JOIN req_h h ON a.idsite::text = h.idsite::text
     LEFT JOIN req_i i ON a.idsite::text = i.idsite::text
     LEFT JOIN req_j j ON a.idsite::text = j.idsite::text
     LEFT JOIN req_k k ON a.idsite::text = k.idsite::text
     LEFT JOIN req_k1 k1 ON a.idsite::text = k1.idsite::text
     LEFT JOIN req_l2018 l2018 ON a.idsite::text = l2018.idsite::text
     LEFT JOIN req_l2017 l2017 ON a.idsite::text = l2017.idsite::text
     LEFT JOIN req_l2016 l2016 ON a.idsite::text = l2016.idsite::text
     LEFT JOIN req_l2015 l2015 ON a.idsite::text = l2015.idsite::text
     LEFT JOIN req_l2014 l2014 ON a.idsite::text = l2014.idsite::text
     LEFT JOIN req_l2013 l2013 ON a.idsite::text = l2013.idsite::text
     LEFT JOIN req_l2012 l2012 ON a.idsite::text = l2012.idsite::text
     LEFT JOIN req_l2011 l2011 ON a.idsite::text = l2011.idsite::text
     LEFT JOIN req_l2010 l2010 ON a.idsite::text = l2010.idsite::text
     LEFT JOIN req_l2009 l2009 ON a.idsite::text = l2009.idsite::text
     LEFT JOIN req_l2008 l2008 ON a.idsite::text = l2008.idsite::text
     LEFT JOIN req_l2007 l2007 ON a.idsite::text = l2007.idsite::text

WITH DATA;

ALTER TABLE x_apps.xapps_an_vmr_synt_site_act_api
    OWNER TO sig_create;

COMMENT ON MATERIALIZED VIEW x_apps.xapps_an_vmr_synt_site_act_api
    IS 'Vue matérialisée présentant les données de synthèses à l''échelle du site d''activité  (données sur l''environnement économique et statistiques foncières présentes sur le fiche d''information du site dans l''application métier GEO). Cette vue est rafraichie toutes les nuits par une tache CRON sur le serveur sig-sgbd.';

GRANT SELECT ON TABLE x_apps.xapps_an_vmr_synt_site_act_api TO read_sig;
GRANT ALL ON TABLE x_apps.xapps_an_vmr_synt_site_act_api TO sig_create;
GRANT INSERT, SELECT, UPDATE, DELETE ON TABLE x_apps.xapps_an_vmr_synt_site_act_api TO edit_sig;
GRANT ALL ON TABLE x_apps.xapps_an_vmr_synt_site_act_api TO create_sig;

CREATE INDEX "idx_xapps_an_vmr_synt_site_act_api_Identifiant_du_site"
    ON x_apps.xapps_an_vmr_synt_site_act_api USING btree
    ("Identifiant du site" COLLATE pg_catalog."default")
    TABLESPACE pg_default;
	

-- ########################################################### Synthèse des sites mixtes #########################

-- Materialized View: x_apps.xapps_an_vmr_synt_site_mixte_api
--DROP MATERIALIZED VIEW x_apps.xapps_an_vmr_synt_site_mixte_api;

CREATE MATERIALIZED VIEW x_apps.xapps_an_vmr_synt_site_mixte_api
TABLESPACE pg_default
AS
 WITH req_a AS (
         SELECT an_amt_site_mixte.idsite,
            an_amt_site_mixte.site_nom,
                CASE
                    WHEN an_amt_site_mixte.dest::text = '00'::text THEN 'Non renseigné'::text
                    WHEN an_amt_site_mixte.dest::text = '10'::text THEN 'Artisanat'::text
                    WHEN an_amt_site_mixte.dest::text = '20'::text THEN 'Industrie ou R&D'::text
                    WHEN an_amt_site_mixte.dest::text = '30'::text THEN 'Tertiaire'::text
                    WHEN an_amt_site_mixte.dest::text = '40'::text THEN 'Transport et logistique'::text
                    WHEN an_amt_site_mixte.dest::text = '50'::text THEN 'Commerce'::text
                    WHEN an_amt_site_mixte.dest::text = '60'::text THEN 'Agriculture'::text
                    WHEN an_amt_site_mixte.dest::text = '70'::text THEN 'Service/Négoce'::text
                    ELSE NULL::text
                END AS dest,
                CASE
                    WHEN an_amt_site_mixte.site_voca::text = '00'::text THEN 'Pas de vocation'::text
                    WHEN an_amt_site_mixte.site_voca::text = '10'::text THEN 'ZI - zone industrielle'::text
                    WHEN an_amt_site_mixte.site_voca::text = '20'::text THEN 'ZA - zone artisanale'::text
                    WHEN an_amt_site_mixte.site_voca::text = '30'::text THEN 'ZC - zone commerciale'::text
                    WHEN an_amt_site_mixte.site_voca::text = '40'::text THEN 'ZM - zone mixte'::text
                    ELSE NULL::text
                END AS voca,
            now() AS date_extract
           FROM m_amenagement.an_amt_site_mixte
          ORDER BY an_amt_site_mixte.site_nom
        ), req_f AS (
         SELECT an_amt_site_mixte.idsite,
            count(*) AS nb_etab_sirene
           FROM m_economie.an_sa_etab,
            m_amenagement.an_amt_site_mixte, s_sirene.an_etablissement_api
          WHERE an_sa_etab.idsite::text = an_amt_site_mixte.idsite::text AND an_sa_etab.l_compte = true AND an_sa_etab.idsiret::text = an_etablissement_api.siret::text AND an_etablissement_api.etatadministratifetablissement::text = 'A'::text
          GROUP BY an_amt_site_mixte.idsite
        ), req_g AS (
         SELECT an_amt_site_mixte.idsite,
            count(*) AS nb_etab_spe
           FROM m_economie.geo_sa_etabp,
            m_amenagement.an_amt_site_mixte
          WHERE geo_sa_etabp.l_compte = true AND an_amt_site_mixte.idsite::text = geo_sa_etabp.idsite::text
          GROUP BY an_amt_site_mixte.idsite
        ), req_h AS (
         SELECT an_amt_site_mixte.idsite,
            sum(an_sa_etab.eff_etab)::integer AS eff_globaux_sirene
           FROM m_amenagement.an_amt_site_mixte,
            m_economie.an_sa_etab, s_sirene.an_etablissement_api
          WHERE an_sa_etab.l_compte = true AND an_sa_etab.idsite::text = an_amt_site_mixte.idsite::text AND an_sa_etab.idsiret::text = an_etablissement_api.siret::text AND an_etablissement_api.etatadministratifetablissement::text = 'A'::text
          GROUP BY an_amt_site_mixte.idsite
        ), req_i AS (
         SELECT an_amt_site_mixte.idsite,
            sum(geo_sa_etabp.eff_etab)::integer AS eff_globaux_etabp
           FROM m_economie.geo_sa_etabp,
            m_amenagement.an_amt_site_mixte
          WHERE geo_sa_etabp.l_compte = true AND an_amt_site_mixte.idsite::text = geo_sa_etabp.idsite::text
          GROUP BY an_amt_site_mixte.idsite
        ), req_j AS (
         SELECT geo_v_site_mixte.idsite,
                CASE
                    WHEN sum(an_sa_lot.surf) IS NOT NULL THEN
                    CASE
                        WHEN length(sum(an_sa_lot.surf)::character varying::text) >= 1 AND length(sum(an_sa_lot.surf)::character varying::text) <= 3 THEN sum(an_sa_lot.surf)::character varying::text || ' m²'::text
                        WHEN length(sum(an_sa_lot.surf)::character varying::text) = 4 THEN replace(to_char(sum(an_sa_lot.surf), 'FM9G999'::text), ','::text, ' '::text) || ' m²'::text
                        WHEN length(sum(an_sa_lot.surf)::character varying::text) = 5 THEN replace(to_char(sum(an_sa_lot.surf), 'FM99G999'::text), ','::text, ' '::text) || ' m²'::text
                        WHEN length(sum(an_sa_lot.surf)::character varying::text) = 6 THEN replace(to_char(sum(an_sa_lot.surf), 'FM999G999'::text), ','::text, ' '::text) || ' m²'::text
                        WHEN length(sum(an_sa_lot.surf)::character varying::text) = 7 THEN replace(to_char(sum(an_sa_lot.surf), 'FM9G999G999'::text), ','::text, ' '::text) || ' m²'::text
                        WHEN length(sum(an_sa_lot.surf)::character varying::text) = 8 THEN replace(to_char(sum(an_sa_lot.surf), 'FM99G999G999'::text), ','::text, ' '::text) || ' m²'::text
                        ELSE NULL::text
                    END
                    ELSE 'Non disponible'::text
                END AS surf_dispo_vente
           FROM m_economie.an_sa_lot,
            m_amenagement.geo_v_site_mixte,
            r_objet.geo_objet_fon_lot,
            m_amenagement.an_amt_lot_stade
          WHERE (an_amt_lot_stade.l_comm2::text = '11'::text OR an_amt_lot_stade.l_comm2::text = '12'::text) AND an_sa_lot.idgeolf = geo_objet_fon_lot.idgeolf AND geo_objet_fon_lot.idgeolf = an_amt_lot_stade.idgeolf AND st_intersects(geo_v_site_mixte.geom, st_pointonsurface(geo_objet_fon_lot.geom)) = true
          GROUP BY geo_v_site_mixte.idsite
        ), req_k AS (
         SELECT geo_v_site_mixte.idsite,
                CASE
                    WHEN sum(an_sa_lot.surf) IS NOT NULL THEN
                    CASE
                        WHEN length(sum(an_sa_lot.surf)::character varying::text) >= 1 AND length(sum(an_sa_lot.surf)::character varying::text) <= 3 THEN sum(an_sa_lot.surf)::character varying::text || ' m²'::text
                        WHEN length(sum(an_sa_lot.surf)::character varying::text) = 4 THEN replace(to_char(sum(an_sa_lot.surf), 'FM9G999'::text), ','::text, ' '::text) || ' m²'::text
                        WHEN length(sum(an_sa_lot.surf)::character varying::text) = 5 THEN replace(to_char(sum(an_sa_lot.surf), 'FM99G999'::text), ','::text, ' '::text) || ' m²'::text
                        WHEN length(sum(an_sa_lot.surf)::character varying::text) = 6 THEN replace(to_char(sum(an_sa_lot.surf), 'FM999G999'::text), ','::text, ' '::text) || ' m²'::text
                        WHEN length(sum(an_sa_lot.surf)::character varying::text) = 7 THEN replace(to_char(sum(an_sa_lot.surf), 'FM9G999G999'::text), ','::text, ' '::text) || ' m²'::text
                        WHEN length(sum(an_sa_lot.surf)::character varying::text) = 8 THEN replace(to_char(sum(an_sa_lot.surf), 'FM99G999G999'::text), ','::text, ' '::text) || ' m²'::text
                        ELSE NULL::text
                    END
                    ELSE 'Non disponible'::text
                END AS surf_dedie_act
           FROM m_economie.an_sa_lot,
            m_amenagement.geo_v_site_mixte,
            r_objet.geo_objet_fon_lot,
            m_amenagement.an_amt_lot_stade
          WHERE geo_objet_fon_lot.l_voca::text = '20'::text AND an_sa_lot.idgeolf = geo_objet_fon_lot.idgeolf AND geo_objet_fon_lot.idgeolf = an_amt_lot_stade.idgeolf AND st_intersects(geo_v_site_mixte.geom, st_pointonsurface(geo_objet_fon_lot.geom)) = true
          GROUP BY geo_v_site_mixte.idsite
        ), req_k1 AS (
         SELECT geo_v_site_mixte.idsite,
                CASE
                    WHEN sum(an_sa_lot.surf) IS NOT NULL THEN
                    CASE
                        WHEN length(sum(an_sa_lot.surf)::character varying::text) >= 1 AND length(sum(an_sa_lot.surf)::character varying::text) <= 3 THEN sum(an_sa_lot.surf)::character varying::text || ' m²'::text
                        WHEN length(sum(an_sa_lot.surf)::character varying::text) = 4 THEN replace(to_char(sum(an_sa_lot.surf), 'FM9G999'::text), ','::text, ' '::text) || ' m²'::text
                        WHEN length(sum(an_sa_lot.surf)::character varying::text) = 5 THEN replace(to_char(sum(an_sa_lot.surf), 'FM99G999'::text), ','::text, ' '::text) || ' m²'::text
                        WHEN length(sum(an_sa_lot.surf)::character varying::text) = 6 THEN replace(to_char(sum(an_sa_lot.surf), 'FM999G999'::text), ','::text, ' '::text) || ' m²'::text
                        WHEN length(sum(an_sa_lot.surf)::character varying::text) = 7 THEN replace(to_char(sum(an_sa_lot.surf), 'FM9G999G999'::text), ','::text, ' '::text) || ' m²'::text
                        WHEN length(sum(an_sa_lot.surf)::character varying::text) = 8 THEN replace(to_char(sum(an_sa_lot.surf), 'FM99G999G999'::text), ','::text, ' '::text) || ' m²'::text
                        ELSE NULL::text
                    END
                    ELSE 'Non disponible'::text
                END AS surf_reserve_projet
           FROM m_economie.an_sa_lot,
            m_amenagement.geo_v_site_mixte,
            r_objet.geo_objet_fon_lot,
            m_amenagement.an_amt_lot_stade
          WHERE (an_amt_lot_stade.l_comm2::text = '31'::text OR an_amt_lot_stade.l_comm2::text = '32'::text) AND geo_objet_fon_lot.l_voca::text = '20'::text AND an_sa_lot.idgeolf = geo_objet_fon_lot.idgeolf AND an_amt_lot_stade.idgeolf = geo_objet_fon_lot.idgeolf AND st_intersects(geo_v_site_mixte.geom, st_pointonsurface(geo_objet_fon_lot.geom)) = true
          GROUP BY geo_v_site_mixte.idsite
        )
 SELECT a.idsite AS "Identifiant du site",
    a.site_nom AS "Libellé du site",
    a.dest AS "Destination du site",
    a.voca AS "Vocation du site",
    a.date_extract AS "Extraction des données le ",
        CASE
            WHEN f.nb_etab_sirene::integer > 0 AND g.nb_etab_spe::integer > 0 THEN (f.nb_etab_sirene::integer + g.nb_etab_spe::integer)::text
            WHEN f.nb_etab_sirene::integer > 0 AND g.nb_etab_spe::integer IS NULL THEN f.nb_etab_sirene::text
            WHEN f.nb_etab_sirene::integer IS NULL AND g.nb_etab_spe::integer > 0 THEN g.nb_etab_spe::text
            ELSE 'Non disponible'::text
        END AS nb_etab,
        CASE
            WHEN h.eff_globaux_sirene > 0 AND i.eff_globaux_etabp > 0 THEN (h.eff_globaux_sirene + i.eff_globaux_etabp)::text
            WHEN h.eff_globaux_sirene > 0 AND i.eff_globaux_etabp IS NULL THEN h.eff_globaux_sirene::text
            WHEN h.eff_globaux_sirene IS NULL AND i.eff_globaux_etabp > 0 THEN i.eff_globaux_etabp::text
            ELSE 'Non disponible'::text
        END AS eff_etab,
        CASE
            WHEN j.surf_dispo_vente IS NOT NULL THEN j.surf_dispo_vente::character varying
            ELSE 'Aucune ou non disponible'::character varying
        END AS "Surface disponible à la vente",
        CASE
            WHEN k.surf_dedie_act IS NOT NULL THEN k.surf_dedie_act::character varying
            ELSE 'Aucune ou non disponible'::character varying
        END AS "Surface dédiée pour des activités",
        CASE
            WHEN k1.surf_reserve_projet IS NOT NULL THEN k1.surf_reserve_projet::character varying
            ELSE ' Aucune ou non disponible'::character varying
        END AS "Surface réservée pour des projets en cours"
   FROM req_a a
     LEFT JOIN req_f f ON a.idsite::text = f.idsite::text
     LEFT JOIN req_g g ON a.idsite::text = g.idsite::text
     LEFT JOIN req_h h ON a.idsite::text = h.idsite::text
     LEFT JOIN req_i i ON a.idsite::text = i.idsite::text
     LEFT JOIN req_j j ON a.idsite::text = j.idsite::text
     LEFT JOIN req_k k ON a.idsite::text = k.idsite::text
     LEFT JOIN req_k1 k1 ON a.idsite::text = k1.idsite::text
WITH DATA;

ALTER TABLE x_apps.xapps_an_vmr_synt_site_mixte_api
    OWNER TO sig_create;

COMMENT ON MATERIALIZED VIEW x_apps.xapps_an_vmr_synt_site_mixte_api
    IS 'Vue matérialisée présentant les données de synthèses à l''échelle du site mixte  (données sur l''environnement économique et statistiques foncières présentes sur le fiche d''information du site dans l''application métier GEO). Cette vue est rafraichie toutes les nuits par une tache CRON sur le serveur sig-sgbd.';

GRANT SELECT ON TABLE x_apps.xapps_an_vmr_synt_site_mixte_api TO read_sig;
GRANT ALL ON TABLE x_apps.xapps_an_vmr_synt_site_mixte_api TO sig_create;
GRANT INSERT, SELECT, UPDATE, DELETE ON TABLE x_apps.xapps_an_vmr_synt_site_mixte_api TO edit_sig;
GRANT ALL ON TABLE x_apps.xapps_an_vmr_synt_site_mixte_api TO create_sig;

CREATE INDEX idx_xapps_an_vmr_synt_site_mixte_api_idsite
    ON x_apps.xapps_an_vmr_synt_site_mixte_api USING btree
    ("Identifiant du site" COLLATE pg_catalog."default")
    TABLESPACE pg_default;


-- ########################################################### Vue matérialisée d'export des établissements depuis GEO #########################

-- View: x_apps.xapps_geo_vmr_etab_api_export

-- DROP MATERIALIZED VIEW x_apps.xapps_geo_vmr_etab_api_export;

CREATE MATERIALIZED VIEW x_apps.xapps_geo_vmr_etab_api_export
TABLESPACE pg_default
AS

 WITH req_tot AS (
          WITH req_e AS (
                 SELECT DISTINCT e.idsiret,
                    e.idsite,
                    e.l_nom,
                    e.l_nom_dir,
                    e.l_titre,
                    e.date_maj_dir,
                    e.l_mail,
                    e.l_mail_dir,
                    e.l_tel,
                    e.l_tel_dir,
                    e.l_telp_dir,
                        CASE
                            WHEN e.eff_etab IS NOT NULL THEN e.eff_etab::character varying
                            ELSE 'n.r'::character varying
                        END AS eff_etab,
                    e.eff_etab AS eff_etab_n,
                    e.source_eff,
                    e.l_date_eff,
                    e.annee_eff,
                    e.l_compte,
                        CASE
                            WHEN se.site_nom IS NOT NULL THEN se.site_nom
                            WHEN sm.site_nom IS NOT NULL THEN sm.site_nom
                            ELSE NULL::character varying
                        END AS site,
                    l.idadresse
                   FROM m_economie.an_sa_etab e
                     LEFT JOIN m_economie.lk_adresseetablissement l ON e.idsiret::text = l.siret::text
                     LEFT JOIN m_economie.an_sa_site se ON se.idsite::text = e.idsite::text
                     LEFT JOIN m_amenagement.an_amt_site_mixte sm ON sm.idsite::text = e.idsite::text
                ), req_si AS (
                 SELECT DISTINCT s.siret,
                    s.numerovoieetablissement::text ||
                        CASE
                            WHEN s.indicerepetitionetablissement IS NULL OR s.indicerepetitionetablissement::text <> ''::text THEN s.indicerepetitionetablissement
                            ELSE ''::character varying
                        END::text AS numvoie,
                    (
                        CASE
                            WHEN s.typevoieetablissement IS NULL OR s.typevoieetablissement::text <> ''::text THEN s.typevoieetablissement
                            ELSE ''::character varying
                        END::text || ' '::text) || s.libellevoieetablissement::text AS libvoie,
                    s.codecommuneetablissement,
                    s.complementadresseetablissement AS complementadresse,
                    s.distributionspecialeetablissement AS boite_postale,
                    s.codepostaletablissement AS code_postal,
                    s.denominationusuelleetablissement,
                    s.enseigne1etablissement,
                    s.datecreationetablissement,
                    s.etatadministratifetablissement,
                    s.datederniertraitementetablissement,
                    ul.denominationunitelegale,
                    ul.denominationusuelle1unitelegale,
                    ul.nomunitelegale,
                    (ul.nomusageunitelegale::text || ' '::text) || ul.prenom1unitelegale::text AS personnephysique,
                    s.activiteprincipaleetablissement AS apet700,
                    n.valeur AS libapet700
                   FROM s_sirene.an_etablissement_api s
                     LEFT JOIN s_sirene.an_unitelegale_api ul ON s.siren::text = ul.siren::text
                     LEFT JOIN s_sirene.lt_nafrev2 n ON n.code::text = s.activiteprincipaleetablissement::text
                )
         SELECT DISTINCT e.idsiret,
            si.denominationusuelleetablissement,
            si.enseigne1etablissement,
            si.denominationunitelegale,
            si.denominationusuelle1unitelegale,
            si.nomunitelegale,
            si.personnephysique,
            e.l_nom,
            e.l_nom_dir,
            e.l_titre,
            e.date_maj_dir,
            e.l_mail,
            e.l_mail_dir,
            e.l_tel,
            e.l_tel_dir,
            e.l_telp_dir,
            si.apet700,
            si.libapet700,
            e.eff_etab,
            e.eff_etab_n,
            e.source_eff,
            e.l_date_eff,
            e.annee_eff::character varying AS annee_eff,
            e.l_compte,
                CASE
                    WHEN to_char(si.datecreationetablissement, 'YYYY'::text)::integer IS NULL THEN 0
                    ELSE to_char(si.datecreationetablissement, 'YYYY'::text)::integer
                END AS datecreationetablissement,
            si.etatadministratifetablissement,
                CASE
                    WHEN to_char(si.datederniertraitementetablissement, 'YYYY'::text)::integer IS NULL THEN 0
                    ELSE to_char(si.datederniertraitementetablissement, 'YYYY'::text)::integer
                END AS datederniertraitementetablissement,
            (((
                CASE
                    WHEN si.numvoie IS NOT NULL THEN si.numvoie || ' '::text
                    ELSE ' '::text
                END ||
                CASE
                    WHEN si.libvoie IS NOT NULL THEN si.libvoie || ' '::text
                    ELSE ' '::text
                END) ||
                CASE
                    WHEN si.complementadresse IS NOT NULL THEN (si.complementadresse::text || ' '::text)::character varying
                    ELSE ' '::character varying
                END::text) ||
                CASE
                    WHEN si.boite_postale IS NOT NULL THEN (si.boite_postale::text || ' '::text)::character varying
                    ELSE ' '::character varying
                END::text) ||
                CASE
                    WHEN si.code_postal IS NOT NULL THEN si.code_postal
                    ELSE ''::character varying
                END::text AS adresse_sirene,
            g.libgeo AS commune,
            g.lib_epci AS epci,
            e.site,
                CASE
                    WHEN e.idadresse IS NULL OR e.idadresse::text = ''::text THEN 'Etablissement non localisé à l''adresse'::character varying::text
                    ELSE ( SELECT (((((xapps_geo_vmr_adresse.numero::text ||
                            CASE
                                WHEN xapps_geo_vmr_adresse.repet IS NOT NULL THEN xapps_geo_vmr_adresse.repet
                                ELSE ' '::character varying
                            END::text) || xapps_geo_vmr_adresse.libvoie_c::text) ||
                            CASE
                                WHEN xapps_geo_vmr_adresse.complement IS NOT NULL THEN (' '::text || xapps_geo_vmr_adresse.complement::text) || ' '::text
                                ELSE ' '::text
                            END) || xapps_geo_vmr_adresse.codepostal::text) || ' '::text) || xapps_geo_vmr_adresse.commune::text
                       FROM x_apps.xapps_geo_vmr_adresse
                      WHERE xapps_geo_vmr_adresse.id_adresse = e.idadresse)
                END AS adresse_loc,
            CASE WHEN a.x_l93 IS NOT NULL THEN a.x_l93 ELSE 
	 			(SELECT round(st_x(st_pointonsurface(c.geom))::numeric,2) FROM r_osm.geo_vm_osm_commune_apc c WHERE c.insee = si.codecommuneetablissement) 
	 		    END AS x_l93,
            CASE WHEN a.y_l93 IS NOT NULL THEN a.y_l93 ELSE 
	 			(SELECT round(st_y(st_pointonsurface(c.geom))::numeric,2) FROM r_osm.geo_vm_osm_commune_apc c WHERE c.insee = si.codecommuneetablissement) 
	 		    END AS y_l93,
            
            a.geom
           FROM req_si si
             JOIN req_e e ON e.idsiret::text = si.siret::text
             LEFT JOIN x_apps.xapps_geo_vmr_adresse a ON e.idadresse = a.id_adresse
             LEFT JOIN r_administratif.an_geo g ON g.insee::text = si.codecommuneetablissement::text
	   
        UNION ALL
         SELECT sp.idsiret,
            'non renseignée'::character varying AS denominationusuelleetablissement,
            'non renseignée'::character varying AS enseigne1etablissement,
            'non renseignée'::character varying AS denominationunitelegale,
            'non renseignée'::character varying AS denominationusuelle1unitelegale,
            'non renseignée'::character varying AS nomunitelegale,
            'non renseignée'::character varying AS personnephysique,
            sp.l_nom,
            sp.l_nom_dir,
            sp.l_titre,
            sp.date_maj_dir,
            sp.l_mail,
            sp.l_mail_dir,
            sp.l_tel,
            sp.l_tel_dir,
            sp.l_telp_dir,
            'Non renseignée'::character varying AS apet700,
            'Non renseignée'::character varying AS libapet700,
            sp.eff_etab::character varying AS eff_etab,
            sp.eff_etab AS eff_etab_n,
            sp.source_eff,
            sp.date_eff AS l_date_eff,
            'non renseignée'::character varying AS annee_eff,
            sp.l_compte,
            0 AS datecreationetablissement,
            'A'::character varying AS etatadministratifetablissement,
            0 AS datederniertraitementetablissement,
            'Non renseignée'::character varying AS adresse_sirene,
            g.libgeo AS commune,
            g.lib_epci AS epci,
                CASE
                    WHEN se.site_nom IS NOT NULL THEN se.site_nom
                    WHEN sm.site_nom IS NOT NULL THEN sm.site_nom
                    ELSE NULL::character varying
                END AS site,
                CASE
                    WHEN sp.l_comp_ad IS NOT NULL THEN sp.l_comp_ad
                    ELSE 'Non renseignée'::character varying
                END AS adresse_loc,
            st_x(sp.geom) AS x_l93,
            st_y(sp.geom) AS y_l93,
            sp.geom
           FROM m_economie.geo_sa_etabp sp
             LEFT JOIN m_economie.an_sa_site se ON se.idsite::text = sp.idsite::text
             LEFT JOIN m_amenagement.an_amt_site_mixte sm ON sm.idsite::text = sp.idsite::text
             LEFT JOIN r_administratif.an_geo g ON g.insee::text = sp.insee::text
        )
 SELECT row_number() OVER () AS gid,
    req_tot.idsiret,
    req_tot.denominationusuelleetablissement,
    req_tot.enseigne1etablissement,
    req_tot.denominationunitelegale,
    req_tot.denominationusuelle1unitelegale,
    req_tot.nomunitelegale,
    req_tot.personnephysique,
    req_tot.l_nom,
    req_tot.l_nom_dir,
    req_tot.l_titre,
    req_tot.date_maj_dir,
    req_tot.l_mail,
    req_tot.l_mail_dir,
    req_tot.l_tel,
    req_tot.l_tel_dir,
    req_tot.l_telp_dir,
    req_tot.apet700,
    req_tot.libapet700,
    req_tot.eff_etab,
    req_tot.eff_etab_n,
    req_tot.source_eff,
    req_tot.l_date_eff,
    req_tot.annee_eff,
    req_tot.l_compte,
    req_tot.datecreationetablissement,
    req_tot.etatadministratifetablissement,
    req_tot.datederniertraitementetablissement,
    req_tot.adresse_sirene,
    req_tot.commune,
    req_tot.epci,
    req_tot.site,
    req_tot.adresse_loc,
    req_tot.x_l93,
    req_tot.y_l93,
    req_tot.geom
   FROM req_tot
   
WITH DATA;

ALTER TABLE x_apps.xapps_geo_vmr_etab_api_export
    OWNER TO create_sig;

COMMENT ON MATERIALIZED VIEW x_apps.xapps_geo_vmr_etab_api_export
    IS 'Vue géographique matérialisée (rafraichie ttes les nuits) composée des éléments sur les établissements actifs (API Sirene) permettant de gérer des exports de listes par commune, par site dans GEO (Recherche d''établissements par commune, par site)';



-- ########################################################### Vue (même que la vue matérialisée plus utilisé) d'export des établissements depuis GEO #########################

-- View: x_apps.xapps_geo_v_etab_api_export

-- DROP VIEW x_apps.xapps_geo_v_etab_api_export;

CREATE OR REPLACE VIEW x_apps.xapps_geo_v_etab_api_export
 AS
  WITH req_tot AS (
 WITH req_e AS (
         SELECT DISTINCT e.idsiret,
            e.idsite,
            e.l_nom,
            e.l_nom_dir,
            e.l_titre,
            e.date_maj_dir,
            e.l_mail,
            e.l_mail_dir,
            e.l_tel,
            e.l_tel_dir,
            e.l_telp_dir,
                CASE
                    WHEN e.eff_etab IS NOT NULL THEN e.eff_etab::character varying
                    ELSE 'n.r'::character varying
                END AS eff_etab,
            e.eff_etab AS eff_etab_n,
            e.source_eff,
            e.l_date_eff,
            e.annee_eff,
            e.l_compte,
                CASE
                    WHEN se.site_nom IS NOT NULL THEN se.site_nom
                    WHEN sm.site_nom IS NOT NULL THEN sm.site_nom
                    ELSE NULL::character varying
                END AS site,
            l.idadresse
           FROM m_economie.an_sa_etab e
             LEFT JOIN m_economie.lk_adresseetablissement l ON e.idsiret::text = l.siret::text
             LEFT JOIN m_economie.an_sa_site se ON se.idsite::text = e.idsite::text
             LEFT JOIN m_amenagement.an_amt_site_mixte sm ON sm.idsite::text = e.idsite::text
        ), req_si AS (
         SELECT DISTINCT s.siret,
            s.numerovoieetablissement::text ||
                CASE
                    WHEN s.indicerepetitionetablissement IS NULL OR s.indicerepetitionetablissement::text <> ''::text THEN s.indicerepetitionetablissement
                    ELSE ''::character varying
                END::text AS numvoie,
            (
                CASE
                    WHEN s.typevoieetablissement IS NULL OR s.typevoieetablissement::text <> ''::text THEN s.typevoieetablissement
                    ELSE ''::character varying
                END::text || ' '::text) || s.libellevoieetablissement::text AS libvoie,
            s.codecommuneetablissement,
            s.complementadresseetablissement AS complementadresse,
            s.distributionspecialeetablissement AS boite_postale,
            s.codepostaletablissement AS code_postal,
            s.denominationusuelleetablissement,
            s.enseigne1etablissement,
            s.datecreationetablissement,
            s.etatadministratifetablissement,
            s.datederniertraitementetablissement,
            ul.denominationunitelegale,
            ul.denominationusuelle1unitelegale,
            ul.nomunitelegale,
            (ul.nomusageunitelegale::text || ' '::text) || ul.prenom1unitelegale::text AS personnephysique,
            s.activiteprincipaleetablissement AS apet700,
            n.valeur AS libapet700
           FROM s_sirene.an_etablissement_api s
             LEFT JOIN s_sirene.an_unitelegale_api ul ON s.siren::text = ul.siren::text
             LEFT JOIN s_sirene.lt_nafrev2 n ON n.code::text = s.activiteprincipaleetablissement::text
        )
 SELECT DISTINCT e.idsiret,
    si.denominationusuelleetablissement,
    si.enseigne1etablissement,
    si.denominationunitelegale,
    si.denominationusuelle1unitelegale,
    si.nomunitelegale,
    si.personnephysique,
    e.l_nom,
    e.l_nom_dir,
    e.l_titre,
    e.date_maj_dir,
    e.l_mail,
    e.l_mail_dir,
    e.l_tel,
    e.l_tel_dir,
    e.l_telp_dir,
    si.apet700,
    si.libapet700,
    e.eff_etab,
    e.eff_etab_n,
    e.source_eff,
    e.l_date_eff,
    e.annee_eff::character varying AS annee_eff,
    e.l_compte,
        CASE
            WHEN to_char(si.datecreationetablissement, 'YYYY'::text)::integer IS NULL THEN 0
            ELSE to_char(si.datecreationetablissement, 'YYYY'::text)::integer
        END AS datecreationetablissement,
    si.etatadministratifetablissement,
        CASE
            WHEN to_char(si.datederniertraitementetablissement, 'YYYY'::text)::integer IS NULL THEN 0
            ELSE to_char(si.datederniertraitementetablissement, 'YYYY'::text)::integer
        END AS datederniertraitementetablissement,
    (((
        CASE
            WHEN si.numvoie IS NOT NULL THEN si.numvoie || ' '::text
            ELSE ' '::text
        END ||
        CASE
            WHEN si.libvoie IS NOT NULL THEN si.libvoie || ' '::text
            ELSE ' '::text
        END) ||
        CASE
            WHEN si.complementadresse IS NOT NULL THEN (si.complementadresse::text || ' '::text)::character varying
            ELSE ' '::character varying
        END::text) ||
        CASE
            WHEN si.boite_postale IS NOT NULL THEN (si.boite_postale::text || ' '::text)::character varying
            ELSE ' '::character varying
        END::text) ||
        CASE
            WHEN si.code_postal IS NOT NULL THEN si.code_postal
            ELSE ''::character varying
        END::text AS adresse_sirene,
    g.libgeo AS commune,
    g.lib_epci AS epci,
    e.site,
        CASE
            WHEN e.idadresse IS NULL OR e.idadresse::text = ''::text THEN 'Etablissement non localisé à l''adresse'::character varying::text
            ELSE ( SELECT (((((xapps_geo_vmr_adresse.numero::text ||
                    CASE
                        WHEN xapps_geo_vmr_adresse.repet IS NOT NULL THEN xapps_geo_vmr_adresse.repet
                        ELSE ' '::character varying
                    END::text) || xapps_geo_vmr_adresse.libvoie_c::text) ||
                    CASE
                        WHEN xapps_geo_vmr_adresse.complement IS NOT NULL THEN (' '::text || xapps_geo_vmr_adresse.complement::text) || ' '::text
                        ELSE ' '::text
                    END) || xapps_geo_vmr_adresse.codepostal::text) || ' '::text) || xapps_geo_vmr_adresse.commune::text
               FROM x_apps.xapps_geo_vmr_adresse
              WHERE xapps_geo_vmr_adresse.id_adresse = e.idadresse)
        END AS adresse_loc,
    a.x_l93,
    a.y_l93,
    a.geom
   FROM req_si si
     JOIN req_e e ON e.idsiret::text = si.siret::text
     LEFT JOIN x_apps.xapps_geo_vmr_adresse a ON e.idadresse = a.id_adresse
     LEFT JOIN r_administratif.an_geo g ON g.insee::text = si.codecommuneetablissement::text
UNION ALL
 SELECT sp.idsiret,
    'non renseignée'::character varying AS denominationusuelleetablissement,
    'non renseignée'::character varying AS enseigne1etablissement,
    'non renseignée'::character varying AS denominationunitelegale,
    'non renseignée'::character varying AS denominationusuelle1unitelegale,
    'non renseignée'::character varying AS nomunitelegale,
    'non renseignée'::character varying AS personnephysique,
    sp.l_nom,
    sp.l_nom_dir,
    sp.l_titre,
    sp.date_maj_dir,
    sp.l_mail,
    sp.l_mail_dir,
    sp.l_tel,
    sp.l_tel_dir,
    sp.l_telp_dir,
    'Non renseignée'::character varying AS apet700,
    'Non renseignée'::character varying AS libapet700,
    sp.eff_etab::character varying AS eff_etab,
    sp.eff_etab AS eff_etab_n,
    sp.source_eff,
    sp.date_eff AS l_date_eff,
    'non renseignée'::character varying AS annee_eff,
    sp.l_compte,
    0 AS datecreationetablissement,
    'A'::character varying AS etatadministratifetablissement,
    0 AS datederniertraitementetablissement,
    'Non renseignée'::character varying AS adresse_sirene,
    g.libgeo AS commune,
    g.lib_epci AS epci,
        CASE
            WHEN se.site_nom IS NOT NULL THEN se.site_nom
            WHEN sm.site_nom IS NOT NULL THEN sm.site_nom
            ELSE NULL::character varying
        END AS site,
        CASE
            WHEN sp.l_comp_ad IS NOT NULL THEN sp.l_comp_ad
            ELSE 'Non renseignée'::character varying
        END AS adresse_loc,
    st_x(sp.geom) AS x_l93,
    st_y(sp.geom) AS y_l93,
    sp.geom
   FROM m_economie.geo_sa_etabp sp
     LEFT JOIN m_economie.an_sa_site se ON se.idsite::text = sp.idsite::text
     LEFT JOIN m_amenagement.an_amt_site_mixte sm ON sm.idsite::text = sp.idsite::text
     LEFT JOIN r_administratif.an_geo g ON g.insee::text = sp.insee::text
       )
 SELECT row_number() OVER () AS gid,
    req_tot.idsiret,
    req_tot.denominationusuelleetablissement,
    req_tot.enseigne1etablissement,
    req_tot.denominationunitelegale,
    req_tot.denominationusuelle1unitelegale,
    req_tot.nomunitelegale,
    req_tot.personnephysique,
    req_tot.l_nom,
    req_tot.l_nom_dir,
    req_tot.l_titre,
    req_tot.date_maj_dir,
    req_tot.l_mail,
    req_tot.l_mail_dir,
    req_tot.l_tel,
    req_tot.l_tel_dir,
    req_tot.l_telp_dir,
    req_tot.apet700,
    req_tot.libapet700,
    req_tot.eff_etab,
    req_tot.eff_etab_n,
    req_tot.source_eff,
    req_tot.l_date_eff,
    req_tot.annee_eff,
    req_tot.l_compte,
    req_tot.datecreationetablissement,
    req_tot.etatadministratifetablissement,
    req_tot.datederniertraitementetablissement,
    req_tot.adresse_sirene,
    req_tot.commune,
    req_tot.epci,
    req_tot.site,
    req_tot.adresse_loc,
    req_tot.x_l93,
    req_tot.y_l93,
    req_tot.geom
   FROM req_tot
 ;
ALTER TABLE x_apps.xapps_geo_v_etab_api_export
    OWNER TO sig_create;
COMMENT ON VIEW x_apps.xapps_geo_v_etab_api_export
    IS 'Vue géographique composée des éléments sur les établissements actifs (API Sirene) permettant de gérer des exports de listes par commune, par site dans GEO (Recherche d''établissements par commune, par site)';

GRANT ALL ON TABLE x_apps.xapps_geo_v_etab_api_export TO sig_create;
GRANT SELECT ON TABLE x_apps.xapps_geo_v_etab_api_export TO read_sig;
GRANT INSERT, SELECT, UPDATE, DELETE ON TABLE x_apps.xapps_geo_v_etab_api_export TO edit_sig;
GRANT ALL ON TABLE x_apps.xapps_geo_v_etab_api_export TO create_sig;



-- ########################################################### Vue d'extraction des lots par stade de commercialisation #########################

-- View: x_apps.xapps_geo_v_lot_com

-- DROP VIEW x_apps.xapps_geo_v_lot_com;

CREATE OR REPLACE VIEW x_apps.xapps_geo_v_lot_com AS 
 SELECT row_number() OVER () AS gid,
    o.idgeolf,
        CASE
            WHEN e.l_comm2::text IS NOT NULL THEN e.l_comm2::text
            ELSE NULL::text
        END AS l_comm2,
    o.geom
   FROM r_objet.geo_objet_fon_lot o
     LEFT JOIN m_amenagement.an_amt_lot_stade e ON o.idgeolf = e.idgeolf;

ALTER TABLE x_apps.xapps_geo_v_lot_com
  OWNER TO sig_create;

COMMENT ON VIEW x_apps.xapps_geo_v_lot_com
  IS 'Vue géographique des lots par stade de commercialisation (réalisée pour affichage dans Geo dans les applications RESEAUX)';


-- ########################################################### Vue d'extraction des lots sans vocation renseignée #########################

-- View: x_apps.xapps_geo_v_lot_nr

-- DROP VIEW x_apps.xapps_geo_v_lot_nr;

CREATE OR REPLACE VIEW x_apps.xapps_geo_v_lot_nr AS 
 SELECT row_number() OVER () AS gid,
    o.idgeolf,
    o.src_geom AS ref_spa,
    o.op_sai,
    o.l_voca,
    o.geom
   FROM r_objet.geo_objet_fon_lot o
  WHERE o.l_voca::text = '00'::text;

ALTER TABLE x_apps.xapps_geo_v_lot_nr
  OWNER TO sig_create;

COMMENT ON VIEW x_apps.xapps_geo_v_lot_nr
  IS 'Vue géographique des lots dont la vocation n''est pas renseigné';


-- ########################################################### Vue gérant les étiquettes des lots mixtes #########################

-- View: x_apps.xapps_geo_v_lotmixte_etiq

-- DROP VIEW x_apps.xapps_geo_v_lotmixte_etiq;

CREATE OR REPLACE VIEW x_apps.xapps_geo_v_lotmixte_etiq AS 
 SELECT row_number() OVER () AS gid,
    l.idgeolf,
    l.l_lnom,
    l.l_surf_l,
    g.geom
   FROM m_amenagement.an_amt_lot_mixte l,
    r_objet.geo_objet_fon_lot g
  WHERE l.idgeolf = g.idgeolf;

ALTER TABLE x_apps.xapps_geo_v_lotmixte_etiq
  OWNER TO sig_create;

COMMENT ON VIEW x_apps.xapps_geo_v_lotmixte_etiq
  IS 'Vue applicative pour affichage des étiquettes des lots mixtes';


-- ########################################################### Vue d'exploitation des sites avec lots habitats dans GEO #########################

-- View: x_apps.xapps_geo_v_site_lot_hab

-- DROP VIEW x_apps.xapps_geo_v_site_lot_hab;

CREATE OR REPLACE VIEW x_apps.xapps_geo_v_site_lot_hab AS 
 SELECT DISTINCT o.idsite,
        CASE
            WHEN h.site_nom IS NOT NULL THEN upper(h.site_nom::text)
            WHEN m.site_nom IS NOT NULL THEN upper(m.site_nom::text)
            ELSE NULL::text
        END AS site_nom_maj,
    o.geom
   FROM r_objet.geo_objet_ope o
     LEFT JOIN m_amenagement.an_amt_site_habitat h ON o.idsite::text = h.idsite::text
     LEFT JOIN m_amenagement.an_amt_site_mixte m ON o.idsite::text = m.idsite::text
  WHERE "substring"(o.idsite::text, 6, 2) <> 'zz'::text
  ORDER BY o.idsite;

ALTER TABLE x_apps.xapps_geo_v_site_lot_hab
  OWNER TO sig_create;

COMMENT ON VIEW x_apps.xapps_geo_v_site_lot_hab
  IS 'Vue géométrique listant tous les sites (habitat et mixtes) contenant des lots habitats avec leur nom (usage GEO pour la remontée des résultats)';


-- ########################################################### Vue extrayant les ZAE avec les infos des sites d'activités #########################

-- View: x_apps.xapps_geo_v_zae

-- DROP VIEW x_apps.xapps_geo_v_zae;

CREATE OR REPLACE VIEW x_apps.xapps_geo_v_zae AS 
 SELECT o.gid,
    o.idsite,
    sa.idpole,
    sa.site_voca,
    sa.site_nom,
    sa.site_etat,
    sa.zae,
    sa.date_sai AS date_sai_att,
    sa.date_maj AS date_maj_att,
    sa.date_int,
    sa.op_sai AS op_sai_att,
    sa.org_sai AS org_sai_att,
    sa.typo,
    sa.dest,
    sa.p_implant,
    sa.z_mai_ouvr,
    sa.z_compet,
    sa.z_amng,
    sa.z_gest,
    sa.z_anim,
    sa.z_comm,
    sa.contact,
    sa.z_cession,
    sa.z_env,
    sa.z_paysage,
    sa.z_rehab,
    sa.z_epu,
    sa.z_dechet,
    sa.z_tr_slect,
    sa.res_ass,
    sa.res_pluvia,
    sa.res_eau,
    sa.res_gaz,
    sa.res_elect,
    sa.res_net,
    sa.res_db_net,
    sa.z_auto,
    sa.z_dst_auto,
    sa.z_tps_auto,
    sa.z_ar_f,
    sa.z_dst_ar_f,
    sa.z_ar_v,
    sa.z_dst_ar_v,
    sa.z_fr_f,
    sa.z_dst_fr_f,
    sa.z_fr_v,
    sa.z_dst_fr_v,
    sa.d_paris,
    sa.d_lille,
    sa.t_paris,
    sa.t_lille,
    sa.l_dauto,
    sa.l_dtgvhp,
    sa.l_ttgvhp,
    sa.l_dtgvcdg,
    sa.l_ttgvcdg,
    sa.l_tgcomp,
    sa.l_dtille,
    sa.l_ttille,
    sa.l_dcdg,
    sa.l_tcdg,
    sa.l_dlesquin,
    sa.l_tlesquin,
    sa.z_pmm,
    sa.z_dst_pmm,
    sa.serv_tc,
    sa.circ_douce,
    sa.serv_rest,
    sa.serv_crech,
    sa.serv_autre,
    sa.serv_collt,
    sa.z_aide_pb,
    sa.l_dated_aide_pb,
    sa.l_datef_aide_pb,
    sa.l_cc_aep_lib,
    sa.l_cc_aep_nom,
    sa.l_cc_aep_poste,
    sa.l_cc_aep_tel,
    sa.l_cc_aep_telp,
    sa.l_cc_aep_mail,
    sa.l_cc_elect_lib,
    sa.l_cc_elect_nom,
    sa.l_cc_elect_poste,
    sa.l_cc_elect_tel,
    sa.l_cc_elect_telp,
    sa.l_cc_elect_mail,
    sa.l_cc_gaz_lib,
    sa.l_cc_gaz_nom,
    sa.l_cc_gaz_poste,
    sa.l_cc_gaz_tel,
    sa.l_cc_gaz_telp,
    sa.l_cc_gaz_mail,
    sa.l_cc_tel_lib,
    sa.l_cc_tel_nom,
    sa.l_cc_tel_poste,
    sa.l_cc_tel_tel,
    sa.l_cc_tel_telp,
    sa.l_cc_tel_mail,
    o.surf,
    o.geom
   FROM m_economie.an_sa_site sa,
    r_objet.geo_objet_site o
  WHERE sa.idsite::text = o.idsite::text AND sa.zae = true;

ALTER TABLE x_apps.xapps_geo_v_zae
  OWNER TO sig_create;

COMMENT ON VIEW x_apps.xapps_geo_v_zae
  IS 'Vue géographique des ZAE uniquement (zone d''activités économiques de compétence intercommunale), permet d''exporter un shape pour l''open data et d''être utilisé dans les applications ou carte';


-- ########################################################### Vue extrayant les établissements #########################

-- Materialized View: x_apps.xapps_geo_vmr_etab_api

-- DROP MATERIALIZED VIEW x_apps.xapps_geo_vmr_etab_api;

CREATE MATERIALIZED VIEW x_apps.xapps_geo_vmr_etab_api AS 
 WITH req_t AS (
         SELECT DISTINCT row_number() OVER () AS gid,
            a_1.id_adresse,
            count(*) AS nb_etab_t
           FROM m_economie.an_sa_etab e,
            x_apps.xapps_geo_vmr_adresse a_1,
            m_economie.lk_adresseetablissement l
          WHERE l.idadresse = a_1.id_adresse AND l.siret::text = e.idsiret::text AND e.etatadministratifetablissement::text = 'A'::text AND e.l_compte IS TRUE
          GROUP BY a_1.id_adresse
        ), req_f AS (
         SELECT DISTINCT row_number() OVER () AS gid,
            a_1.id_adresse,
            count(*) AS nb_etab_f
           FROM m_economie.an_sa_etab e,
            x_apps.xapps_geo_vmr_adresse a_1,
            m_economie.lk_adresseetablissement l
          WHERE l.idadresse = a_1.id_adresse AND l.siret::text = e.idsiret::text AND e.etatadministratifetablissement::text = 'A'::text AND e.l_compte IS FALSE
          GROUP BY a_1.id_adresse
        ), req_a AS (
         SELECT DISTINCT a_1.id_adresse,
            count(*) AS nb_etab
           FROM m_economie.an_sa_etab e,
            x_apps.xapps_geo_vmr_adresse a_1,
            m_economie.lk_adresseetablissement l
          WHERE l.idadresse = a_1.id_adresse AND l.siret::text = e.idsiret::text AND e.etatadministratifetablissement::text = 'A'::text
          GROUP BY a_1.id_adresse
        )
 SELECT row_number() OVER () AS gid,
    a.id_adresse,
    (((((
        CASE
            WHEN a.etiquette::text IS NULL OR a.etiquette::text = ''::text THEN a.numero::text
            ELSE a.etiquette::text
        END || ' '::text) || btrim(a.libvoie_c::text)) || ' '::text) || a.codepostal::text) || ' '::text) || upper(unaccent_string(a.commune::text)) AS lib_adresse,
    req_a.nb_etab,
        CASE
            WHEN req_t.nb_etab_t > 0 THEN req_t.nb_etab_t
            ELSE 0::bigint
        END AS nb_etab_t,
        CASE
            WHEN req_f.nb_etab_f > 0 THEN req_f.nb_etab_f
            ELSE 0::bigint
        END AS nb_etab_f,
    a.etiquette,
    a.angle,
    a.geom
   FROM x_apps.xapps_geo_vmr_adresse a
     LEFT JOIN req_a ON req_a.id_adresse = a.id_adresse
     LEFT JOIN req_t ON req_t.id_adresse = req_a.id_adresse
     LEFT JOIN req_f ON req_f.id_adresse = req_a.id_adresse
WITH DATA;

ALTER TABLE x_apps.xapps_geo_vmr_etab_api
  OWNER TO sig_create;

COMMENT ON MATERIALIZED VIEW x_apps.xapps_geo_vmr_etab_api
  IS 'Vue matérialisé rafraichit à chaque intégration ou mise à jour de la table lk_adresseetablissement et dénombrant le nombre d''établissement par adresse (lien dans GEO pour avoir la liste des établissements et les modifier) (en cours de refonte suite migration API Sirene)';

-- Index: x_apps.idx_xapps_geo_vmr_etab_api_id_adresse

-- DROP INDEX x_apps.idx_xapps_geo_vmr_etab_api_id_adresse;

CREATE INDEX idx_xapps_geo_vmr_etab_api_id_adresse
  ON x_apps.xapps_geo_vmr_etab_api
  USING btree
  (id_adresse);



-- ########################################################### Vue extrayant les procédures #########################
																   
-- vue à intégrer dans les taches cron ou dans les triggers de la table gérant la source

-- Materialized View: x_apps.xapps_geo_vmr_proc

-- DROP MATERIALIZED VIEW x_apps.xapps_geo_vmr_proc;

CREATE MATERIALIZED VIEW x_apps.xapps_geo_vmr_proc AS 
 SELECT so.idgeopo,
    so.idsite,
    so.l_ope_nom,
    so.l_ope_alias,
    so.dest,
    so.z_proced,
    so.date_sai,
    so.date_maj,
    so.op_sai,
    so.l_ope_phase,
    so.l_ope_moa,
    so.l_conso_type,
    so.l_pr_urb,
    so.date_crea,
    so.l_pr_fon,
    so.l_pr_fon_date,
    so.l_surf_ha,
    so.l_existe,
    so.l_pr_fon_type,
    so.l_ref_compta,
    so.l_observ,
    o.sup_m2,
    so.l_surf_cess_ha,
    so.l_date_clo,
    so.l_nb_log,
    so.l_nb_logind,
    so.l_nb_logindgr,
    so.l_nb_logcol,
    so.l_nb_logaide,
    so.l_nb_logaide_loc,
    so.l_nb_logaide_acc,
    so.l_nom_cp,
    o.src_geom,
    o.geom,
    st_multi(st_buffer(o.geom, (-0.5)::double precision))::geometry(MultiPolygon,2154) AS geom1
   FROM m_urbanisme_reg.an_proced so,
    r_objet.geo_objet_ope o
  WHERE so.idgeopo = o.idgeopo AND o.proced = true
WITH DATA;

ALTER TABLE x_apps.xapps_geo_vmr_proc
  OWNER TO sig_create;

COMMENT ON MATERIALIZED VIEW x_apps.xapps_geo_vmr_proc
  IS 'Vue matérialisée des procédures pour la cartographie et dans dans le traitement pour la remontée dans la fiche de renseignements d''urbanisme dans GEO.
Vue rafraichie lors de la mise à jour des procédures';

-- Index: x_apps.idx_xapps_geo_vmr_proc_idsite

-- DROP INDEX x_apps.idx_xapps_geo_vmr_proc_idsite;

CREATE INDEX idx_xapps_geo_vmr_proc_idsite
  ON x_apps.xapps_geo_vmr_proc
  USING btree
  (idsite COLLATE pg_catalog."default");

-- ########################################################### Vue générant l'affichage des locaux #########################

-- Materialized View: x_apps.xapps_geo_vmr_local

-- DROP MATERIALIZED VIEW x_apps.xapps_geo_vmr_local;

CREATE MATERIALIZED VIEW x_apps.xapps_geo_vmr_local AS 
 SELECT DISTINCT lo.idgeoloc AS idgeo,
    (
        CASE
            WHEN length(btrim(lo.usage::text)) > 0 THEN lo.usage::text
            WHEN length(btrim(lo.l_occupp::text)) > 0 THEN lo.l_occupp::text
            ELSE string_agg(upper(
            CASE
                WHEN length(btrim(em.l_nom::text)) > 0 AND em.l_compte = true THEN em.l_nom
                WHEN length(btrim(ep.l_nom::text)) > 0 AND ep.l_compte = true THEN ep.l_nom
                WHEN length(btrim(s.enseigne1etablissement::text)) > 0 AND em.l_compte = true AND s.etatadministratifetablissement::text = 'A'::text THEN s.enseigne1etablissement
                WHEN length(btrim(s.denominationusuelleetablissement::text)) > 0 AND em.l_compte = true AND s.etatadministratifetablissement::text = 'A'::text THEN s.denominationusuelleetablissement
                WHEN length(btrim(ul.denominationunitelegale::text)) > 0 AND em.l_compte = true AND s.etatadministratifetablissement::text = 'A'::text THEN ul.denominationunitelegale
                WHEN length(btrim(ul.denominationusuelle1unitelegale::text)) > 0 AND em.l_compte = true AND s.etatadministratifetablissement::text = 'A'::text THEN ul.denominationusuelle1unitelegale
                WHEN length(btrim(ul.nomunitelegale::text)) > 0 AND em.l_compte = true AND s.etatadministratifetablissement::text = 'A'::text THEN ul.nomunitelegale
                WHEN length(btrim(ul.nomusageunitelegale::text)) > 0 AND em.l_compte = true AND s.etatadministratifetablissement::text = 'A'::text THEN ((ul.nomusageunitelegale::text || ' '::text) || ul.prenom1unitelegale::text)::character varying
                WHEN length(btrim(ul.pseudonymeunitelegale::text)) > 0 AND em.l_compte = true AND s.etatadministratifetablissement::text = 'A'::text THEN ul.pseudonymeunitelegale
                ELSE NULL::character varying
            END::text), chr(10) ORDER BY em.l_nom, s.enseigne1etablissement, s.denominationusuelleetablissement, ul.denominationunitelegale, ul.denominationusuelle1unitelegale, ul.nomunitelegale, ep.l_nom, lo.usage, lo.l_occupp)
        END || chr(10)) ||
        CASE
            WHEN length(lo.sup_m2::character varying::text) >= 1 AND length(lo.sup_m2::character varying::text) <= 3 THEN lo.sup_m2::character varying::text || ' m²'::text
            WHEN length(lo.sup_m2::character varying::text) = 4 THEN replace(to_char(lo.sup_m2, 'FM9G999'::text), ','::text, ' '::text) || ' m²'::text
            WHEN length(lo.sup_m2::character varying::text) = 5 THEN replace(to_char(lo.sup_m2, 'FM99G999'::text), ','::text, ' '::text) || ' m²'::text
            WHEN length(lo.sup_m2::character varying::text) = 6 THEN replace(to_char(lo.sup_m2, 'FM999G999'::text), ','::text, ' '::text) || ' m²'::text
            WHEN length(lo.sup_m2::character varying::text) = 7 THEN replace(to_char(lo.sup_m2, 'FM9G999G999'::text), ','::text, ' '::text) || ' m²'::text
            WHEN length(lo.sup_m2::character varying::text) = 8 THEN replace(to_char(lo.sup_m2, 'FM99G999G999'::text), ','::text, ' '::text) || ' m²'::text
            ELSE NULL::text
        END AS etiquette,
    lo.geom
   FROM m_economie.geo_sa_local lo
     LEFT JOIN (m_economie.lk_localsiret lk
     LEFT JOIN m_economie.geo_sa_etabp ep ON ep.idgeoet::text = lk.siret::text
     LEFT JOIN m_economie.an_sa_etab em ON em.idsiret::text = lk.siret::text
     LEFT JOIN s_sirene.an_etablissement_api s ON s.siret::text = lk.siret::text
     LEFT JOIN s_sirene.an_unitelegale_api ul ON ul.siren::text = "left"(lk.siret::text, 9)) ON lk.idgeoloc = lo.idgeoloc
  GROUP BY lo.idgeoloc, lo.geom, lo.usage, lo.l_occupp
UNION ALL
 SELECT lf.idgeolf AS idgeo,
        CASE
            WHEN length(btrim(string_agg(upper(
            CASE
                WHEN length(btrim(em.l_nom::text)) > 0 AND em.l_compte = true THEN em.l_nom
                WHEN length(btrim(ep.l_nom::text)) > 0 AND ep.l_compte = true THEN ep.l_nom
                WHEN length(btrim(s.enseigne1etablissement::text)) > 0 AND em.l_compte = true AND s.etatadministratifetablissement::text = 'A'::text THEN s.enseigne1etablissement
                WHEN length(btrim(s.denominationusuelleetablissement::text)) > 0 AND em.l_compte = true AND s.etatadministratifetablissement::text = 'A'::text THEN s.denominationusuelleetablissement
                WHEN length(btrim(ul.denominationunitelegale::text)) > 0 AND em.l_compte = true AND s.etatadministratifetablissement::text = 'A'::text THEN ul.denominationunitelegale
                WHEN length(btrim(ul.denominationusuelle1unitelegale::text)) > 0 AND em.l_compte = true AND s.etatadministratifetablissement::text = 'A'::text THEN ul.denominationusuelle1unitelegale
                WHEN length(btrim(ul.nomunitelegale::text)) > 0 AND em.l_compte = true AND s.etatadministratifetablissement::text = 'A'::text THEN ul.nomunitelegale
                WHEN length(btrim(ul.nomusageunitelegale::text)) > 0 AND em.l_compte = true AND s.etatadministratifetablissement::text = 'A'::text THEN ((ul.nomusageunitelegale::text || ' '::text) || ul.prenom1unitelegale::text)::character varying
                WHEN length(btrim(ul.pseudonymeunitelegale::text)) > 0 AND em.l_compte = true AND s.etatadministratifetablissement::text = 'A'::text THEN ul.pseudonymeunitelegale
                ELSE NULL::character varying
            END::text), chr(10) ORDER BY em.l_nom, s.enseigne1etablissement, s.denominationusuelleetablissement, ul.denominationunitelegale, ul.denominationusuelle1unitelegale, ul.nomunitelegale, ep.l_nom) || chr(10))::character varying::text) > 0 THEN (string_agg(upper(
            CASE
                WHEN length(btrim(em.l_nom::text)) > 0 AND em.l_compte = true THEN em.l_nom
                WHEN length(btrim(ep.l_nom::text)) > 0 AND ep.l_compte = true THEN ep.l_nom
                WHEN length(btrim(s.enseigne1etablissement::text)) > 0 AND em.l_compte = true AND s.etatadministratifetablissement::text = 'A'::text THEN s.enseigne1etablissement
                WHEN length(btrim(s.denominationusuelleetablissement::text)) > 0 AND em.l_compte = true AND s.etatadministratifetablissement::text = 'A'::text THEN s.denominationusuelleetablissement
                WHEN length(btrim(ul.denominationunitelegale::text)) > 0 AND em.l_compte = true AND s.etatadministratifetablissement::text = 'A'::text THEN ul.denominationunitelegale
                WHEN length(btrim(ul.denominationusuelle1unitelegale::text)) > 0 AND em.l_compte = true AND s.etatadministratifetablissement::text = 'A'::text THEN ul.denominationusuelle1unitelegale
                WHEN length(btrim(ul.nomunitelegale::text)) > 0 AND em.l_compte = true AND s.etatadministratifetablissement::text = 'A'::text THEN ul.nomunitelegale
                WHEN length(btrim(ul.nomusageunitelegale::text)) > 0 AND em.l_compte = true AND s.etatadministratifetablissement::text = 'A'::text THEN ((ul.nomusageunitelegale::text || ' '::text) || ul.prenom1unitelegale::text)::character varying
                WHEN length(btrim(ul.pseudonymeunitelegale::text)) > 0 AND em.l_compte = true AND s.etatadministratifetablissement::text = 'A'::text THEN ul.pseudonymeunitelegale
                ELSE NULL::character varying
            END::text), chr(10) ORDER BY em.l_nom, s.enseigne1etablissement, s.denominationusuelleetablissement, ul.denominationunitelegale, ul.denominationusuelle1unitelegale, ul.nomunitelegale) || chr(10)) ||
            CASE
                WHEN length(lf.sup_m2::character varying::text) >= 1 AND length(lf.sup_m2::character varying::text) <= 3 THEN lf.sup_m2::character varying::text || ' m²'::text
                WHEN length(lf.sup_m2::character varying::text) = 4 THEN replace(to_char(lf.sup_m2, 'FM9G999'::text), ','::text, ' '::text) || ' m²'::text
                WHEN length(lf.sup_m2::character varying::text) = 5 THEN replace(to_char(lf.sup_m2, 'FM99G999'::text), ','::text, ' '::text) || ' m²'::text
                WHEN length(lf.sup_m2::character varying::text) = 6 THEN replace(to_char(lf.sup_m2, 'FM999G999'::text), ','::text, ' '::text) || ' m²'::text
                WHEN length(lf.sup_m2::character varying::text) = 7 THEN replace(to_char(lf.sup_m2, 'FM9G999G999'::text), ','::text, ' '::text) || ' m²'::text
                WHEN length(lf.sup_m2::character varying::text) = 8 THEN replace(to_char(lf.sup_m2, 'FM99G999G999'::text), ','::text, ' '::text) || ' m²'::text
                ELSE NULL::text
            END
            ELSE (
            CASE
                WHEN length(btrim(lf.l_occupant::text)) > 0 THEN btrim(upper(lf.l_occupant::text))
                ELSE btrim(upper(lf.l_lnom::text))
            END || chr(10)) ||
            CASE
                WHEN length(lf.sup_m2::character varying::text) >= 1 AND length(lf.sup_m2::character varying::text) <= 3 THEN lf.sup_m2::character varying::text || ' m²'::text
                WHEN length(lf.sup_m2::character varying::text) = 4 THEN replace(to_char(lf.sup_m2, 'FM9G999'::text), ','::text, ' '::text) || ' m²'::text
                WHEN length(lf.sup_m2::character varying::text) = 5 THEN replace(to_char(lf.sup_m2, 'FM99G999'::text), ','::text, ' '::text) || ' m²'::text
                WHEN length(lf.sup_m2::character varying::text) = 6 THEN replace(to_char(lf.sup_m2, 'FM999G999'::text), ','::text, ' '::text) || ' m²'::text
                WHEN length(lf.sup_m2::character varying::text) = 7 THEN replace(to_char(lf.sup_m2, 'FM9G999G999'::text), ','::text, ' '::text) || ' m²'::text
                WHEN length(lf.sup_m2::character varying::text) = 8 THEN replace(to_char(lf.sup_m2, 'FM99G999G999'::text), ','::text, ' '::text) || ' m²'::text
                ELSE NULL::text
            END
        END AS etiquette,
    lf.geom
   FROM m_economie.geo_v_lot_eco lf
     LEFT JOIN (m_economie.lk_localsiret lk
     LEFT JOIN m_economie.an_sa_etab em ON em.idsiret::text = lk.siret::text
     LEFT JOIN s_sirene.an_etablissement_api s ON s.siret::text = lk.siret::text
     LEFT JOIN s_sirene.an_unitelegale_api ul ON ul.siren::text = "left"(lk.siret::text, 9)
     LEFT JOIN m_economie.geo_sa_etabp ep ON ep.idgeoet::text = lk.siret::text) ON lk.idgeoloc = lf.idgeolf
  WHERE NOT (EXISTS ( SELECT lo.idgeolf
           FROM m_economie.geo_sa_local lo
          WHERE lf.idgeolf = lo.idgeolf))
  GROUP BY lf.idgeolf, lf.geom, lf.sup_m2, lf.l_occupant, lf.l_lnom
  ORDER BY 1 DESC
WITH DATA;

ALTER TABLE x_apps.xapps_geo_vmr_local
  OWNER TO sig_create;


-- Index: x_apps.idx_xapps_geo_vmr_local_idgeo

-- DROP INDEX x_apps.idx_xapps_geo_vmr_local_idgeo;

CREATE INDEX idx_xapps_geo_vmr_local_idgeo
  ON x_apps.xapps_geo_vmr_local
  USING btree
  (idgeo);


-- ########################################################### Vue générant la liste des sites (activité et mixte (sans geom) #########################

-- View: x_apps.xapps_an_v_site_liste

-- DROP VIEW x_apps.xapps_an_v_site_liste;

CREATE OR REPLACE VIEW x_apps.xapps_an_v_site_liste AS 
 SELECT geo_v_site_eco.idsite,
    geo_v_site_eco.idpole,
    geo_v_site_eco.site_nom
   FROM m_economie.geo_v_site_eco
UNION ALL
 SELECT geo_v_site_mixte.idsite,
    geo_v_site_mixte.idpole,
    geo_v_site_mixte.site_nom
   FROM m_amenagement.geo_v_site_mixte;

ALTER TABLE x_apps.xapps_an_v_site_liste
  OWNER TO sig_create;
GRANT ALL ON TABLE x_apps.xapps_an_v_site_liste TO sig_create;
GRANT ALL ON TABLE x_apps.xapps_an_v_site_liste TO create_sig;
GRANT SELECT, UPDATE, INSERT, DELETE ON TABLE x_apps.xapps_an_v_site_liste TO edit_sig;
GRANT SELECT ON TABLE x_apps.xapps_an_v_site_liste TO read_sig;
COMMENT ON VIEW x_apps.xapps_an_v_site_liste
  IS 'Vue alphanumérique contenant la liste des sites économiques et mixtes pour affichage dans la fiche établissement dans GEO';
	

