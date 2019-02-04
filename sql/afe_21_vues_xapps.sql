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
            max(geo_v_cession.d_maj) AS date_maj_c
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

-- Materialized View: x_apps.xapps_an_vmr_synt_pole

-- DROP MATERIALIZED VIEW x_apps.xapps_an_vmr_synt_pole;

CREATE MATERIALIZED VIEW x_apps.xapps_an_vmr_synt_pole AS 
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
           FROM r_objet.geo_objet_etab,
            s_sirene.an_etablissement,
            m_economie.an_sa_etab,
            m_economie.geo_sa_pole
          WHERE an_etablissement.siret::text = geo_objet_etab.idsiret::text AND an_etablissement.siret::text = an_sa_etab.idsiret::text AND an_etablissement.l_vetab::text = '10'::text AND an_sa_etab.l_compte = true AND st_intersects(geo_objet_etab.geom, geo_sa_pole.geom)
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
           FROM r_objet.geo_objet_etab,
            s_sirene.an_etablissement,
            m_economie.geo_sa_pole,
            m_economie.an_sa_etab
          WHERE an_sa_etab.idsiret::text = geo_objet_etab.idsiret::text AND an_etablissement.siret::text = geo_objet_etab.idsiret::text AND an_etablissement.l_vetab::text = '10'::text AND an_sa_etab.l_compte = true AND st_intersects(geo_objet_etab.geom, geo_sa_pole.geom)
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

ALTER TABLE x_apps.xapps_an_vmr_synt_pole
  OWNER TO sig_create;

COMMENT ON MATERIALIZED VIEW x_apps.xapps_an_vmr_synt_pole
  IS 'Vue matérialisée présentant les données de synthèses à l''échelle du pôle (données sur l''environnement économique et statistiques foncières présentes sur le fiche d''information du pôle dans l''application métier GEO). Cette vue est rafraichie toutes les nuits par une tache CRON sur le serveur sig-sgbd.';

-- ########################################################### Synthèse des sites d'activités #########################

-- Materialized View: x_apps.xapps_an_vmr_synt_site_act

-- DROP MATERIALIZED VIEW x_apps.xapps_an_vmr_synt_site_act;

CREATE MATERIALIZED VIEW x_apps.xapps_an_vmr_synt_site_act AS 
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
           FROM m_economie.geo_v_etab,
            m_economie.an_sa_site
          WHERE geo_v_etab.idsite::text = an_sa_site.idsite::text AND geo_v_etab.l_compte = true
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
            sum(geo_v_etab.eff_etab)::integer AS eff_globaux_sirene
           FROM m_economie.geo_v_etab,
            m_economie.an_sa_site
          WHERE geo_v_etab.idsite::text = an_sa_site.idsite::text AND geo_v_etab.l_compte = true
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
    a.date_extract AS "Date d'extraction des données",
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
        END AS "Surface dédiée à l'activité",
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

ALTER TABLE x_apps.xapps_an_vmr_synt_site_act
  OWNER TO sig_create;

COMMENT ON MATERIALIZED VIEW x_apps.xapps_an_vmr_synt_site_act
  IS 'Vue matérialisée présentant les données de synthèses à l''échelle du site d''activité  (données sur l''environnement économique et statistiques foncières présentes sur le fiche d''information du site dans l''application métier GEO). Cette vue est rafraichie toutes les nuits par une tache CRON sur le serveur sig-sgbd.';


-- ########################################################### Synthèse des sites mixtes #########################

-- Materialized View: x_apps.xapps_an_vmr_synt_site_mixte

-- DROP MATERIALIZED VIEW x_apps.xapps_an_vmr_synt_site_mixte;

CREATE MATERIALIZED VIEW x_apps.xapps_an_vmr_synt_site_mixte AS 
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
           FROM m_economie.geo_v_etab,
            m_amenagement.an_amt_site_mixte
          WHERE geo_v_etab.idsite::text = an_amt_site_mixte.idsite::text AND geo_v_etab.l_compte = true
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
            sum(geo_v_etab.eff_etab)::integer AS eff_globaux_sirene
           FROM m_amenagement.an_amt_site_mixte,
            m_economie.geo_v_etab
          WHERE geo_v_etab.l_compte = true AND geo_v_etab.idsite::text = an_amt_site_mixte.idsite::text
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
    a.date_extract AS "Date d''extraction des données",
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
        END AS "Surface dédiée à l''activité",
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

ALTER TABLE x_apps.xapps_an_vmr_synt_site_mixte
  OWNER TO sig_create;

COMMENT ON MATERIALIZED VIEW x_apps.xapps_an_vmr_synt_site_mixte
  IS 'Vue matérialisée présentant les données de synthèses à l''échelle du site mixte  (données sur l''environnement économique et statistiques foncières présentes sur le fiche d''information du site dans l''application métier GEO). Cette vue est rafraichie toutes les nuits par une tache CRON sur le serveur sig-sgbd.';

-- Index: x_apps.idx_an_vmr_synt_site_mixte_idsite

-- DROP INDEX x_apps.idx_an_vmr_synt_site_mixte_idsite;

CREATE INDEX idx_an_vmr_synt_site_mixte_idsite
  ON x_apps.xapps_an_vmr_synt_site_mixte
  USING btree
  ("Identifiant du site" COLLATE pg_catalog."default");


-- ########################################################### Vue d'export des établissements depuis GEO #########################

-- View: x_apps.xapps_geo_v_etab_actif_export

-- DROP VIEW x_apps.xapps_geo_v_etab_actif_export;

CREATE OR REPLACE VIEW x_apps.xapps_geo_v_etab_actif_export AS 
 WITH req_o AS (
         SELECT geo_v_etab.idsiret,
            geo_v_etab.insee,
            geo_v_etab.commune,
            geo_v_etab.geom
           FROM m_economie.geo_v_etab
          WHERE geo_v_etab.l_compte = true
        ), req_e AS (
         SELECT e.idsiret,
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
                CASE
                    WHEN se.site_nom IS NOT NULL THEN se.site_nom
                    WHEN sm.site_nom IS NOT NULL THEN sm.site_nom
                    ELSE NULL::character varying
                END AS site
           FROM m_economie.an_sa_etab e
             LEFT JOIN m_economie.an_sa_site se ON se.idsite::text = e.idsite::text
             LEFT JOIN m_amenagement.an_amt_site_mixte sm ON sm.idsite::text = e.idsite::text
          WHERE e.l_compte = true
        ), req_si AS (
         SELECT an_etablissement.siret,
            an_etablissement.numvoie::character varying AS numvoie,
            (an_etablissement.typvoie::text || ' '::text) || an_etablissement.libvoie::text AS voie,
            an_etablissement.l1_nomen,
            an_etablissement.enseigne,
            an_etablissement.l4_voie,
            an_etablissement.l3_cadr,
            an_etablissement.l5_disp,
            an_etablissement.l6_post,
            an_etablissement.apet700,
            an_etablissement.libapet
           FROM s_sirene.an_etablissement
          WHERE an_etablissement.l_vetab::text = '10'::text
        )
 SELECT e.idsiret,
    si.l1_nomen,
    si.enseigne,
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
    si.libapet,
    e.eff_etab,
    e.eff_etab_n,
    e.source_eff,
    e.l_date_eff,
    e.annee_eff::character varying AS annee_eff,
    si.numvoie,
    si.voie,
    si.l4_voie,
    si.l3_cadr,
    si.l5_disp,
    si.l6_post,
    o.insee,
    o.commune,
    e.site,
    o.geom
   FROM req_o o,
    req_e e,
    req_si si
  WHERE o.idsiret::text = e.idsiret::text AND e.idsiret::text = si.siret::text
UNION
 SELECT sp.idsiret,
    'non renseignée'::character varying AS l1_nomen,
    'non renseignée'::character varying AS enseigne,
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
    'Non renseignée'::character varying AS libapet,
    sp.eff_etab::character varying AS eff_etab,
    sp.eff_etab AS eff_etab_n,
    sp.source_eff,
    sp.date_eff AS l_date_eff,
    'non renseignée'::character varying AS annee_eff,
    ''::character varying AS numvoie,
    ''::character varying AS voie,
    sp.l_comp_ad AS l4_voie,
    'non renseignée'::character varying AS l3_cadr,
    'non renseignée'::character varying AS l5_disp,
    'non renseignée'::character varying AS l6_post,
    sp.insee,
    sp.commune,
        CASE
            WHEN se.site_nom IS NOT NULL THEN se.site_nom
            WHEN sm.site_nom IS NOT NULL THEN sm.site_nom
            ELSE NULL::character varying
        END AS site,
    sp.geom
   FROM m_economie.geo_sa_etabp sp
     LEFT JOIN m_economie.an_sa_site se ON se.idsite::text = sp.idsite::text
     LEFT JOIN m_amenagement.an_amt_site_mixte sm ON sm.idsite::text = sp.idsite::text;

ALTER TABLE x_apps.xapps_geo_v_etab_actif_export
  OWNER TO sig_create;

COMMENT ON VIEW x_apps.xapps_geo_v_etab_actif_export
  IS 'Vue géométrique composée des éléments sur les établissements actifs permettant de gérer des exports de listes par commune, par site dans GEO (Recherche d''établissements par commune, par site)';


-- ########################################################### Vue d'extraction des établissements mis à jour depuis la dernière intégration de SIRENE #########################

-- View: x_apps.xapps_geo_v_etab_maj

-- DROP VIEW x_apps.xapps_geo_v_etab_maj;

CREATE OR REPLACE VIEW x_apps.xapps_geo_v_etab_maj AS 
 SELECT row_number() OVER () AS gid,
    o.idgeoet,
    o.insee,
    o.commune,
    o.l_nom_sirene,
    o.enseigne,
    e.dentree,
    e.l4_voie,
    o.geom
   FROM s_sirene.an_etablissement e,
    m_economie.an_sa_etab et,
    r_objet.geo_objet_etab o
  WHERE e.siret::text = o.idsiret::text AND et.idsiret::text = e.siret::text AND o.l_vetab::text = '10'::text AND e.dentree = '2018-12-01'::date AND et.l_compte = true;

ALTER TABLE x_apps.xapps_geo_v_etab_maj
  OWNER TO sig_create;

COMMENT ON VIEW x_apps.xapps_geo_v_etab_maj
  IS 'Vue géographique des établissements entrées dans la base lors de la dernière mise à jour';


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

-- Materialized View: x_apps.xapps_geo_vmr_etab

-- DROP MATERIALIZED VIEW x_apps.xapps_geo_vmr_etab;

CREATE MATERIALIZED VIEW x_apps.xapps_geo_vmr_etab AS 
 SELECT row_number() OVER () AS gid,
    o.idgeoet,
    o.code_geo,
    o.insee,
    o.commune,
    o.info_prec,
    e.idsiren,
    e.idsiret,
    e.idsite,
    e.date_sai,
    e.date_maj,
    o.op_sai AS op_sai_geo,
    e.op_sai,
    e.org_sai,
    e.decalage,
    e.l_nom,
    o.l_nom_sirene,
    o.enseigne,
    o.l4_voie,
    e.n_adres,
    e.filiale,
    e.capital,
    e.eff_ent,
    e.eff_etab,
    e.eff_etab_d,
    e.eff_ent_etp,
    e.eff_etab_etp,
    e.source_eff,
    e.annee_eff,
    e.l_date_eff,
    e.l_nom_dir,
    e.date_maj_dir,
    e.source_maj_dir,
    e.l_tel,
    e.l_mail,
    e.chiff_aff,
    e.annee_ca,
    e.usage_comm,
    e.etb_env,
    e.l_observ,
    e.l_compte,
    e.l_tel_dir,
    e.l_telp_dir,
    e.l_mail_dir,
    e.l_nom_aut,
    e.l_titre_aut,
    e.l_tel_aut,
    e.l_telp_aut,
    e.l_mail_aut,
    e.l_nom_drh,
    e.l_tel_drh,
    e.l_mail_drh,
    e.l_nom_ad,
    e.l_tel_ad,
    e.l_mail_ad,
    e.l_url,
    e.l_url_bil,
    e.l_comp_ad,
    e.apet700,
    e.libapet,
    e.l_titre,
    e.date_maj_drh,
    e.date_maj_ad,
    e.date_maj_aut,
    e.l_titre_drh,
    e.l_titre_ad,
    e.l_drh_ss,
    e.l_drh_ad,
    NULL::character varying(14) AS old_siret,
    NULL::integer AS old_id,
    o.geom
   FROM m_economie.an_sa_etab e,
    r_objet.geo_objet_etab o
  WHERE e.idgeoet = o.idgeoet AND o.l_vetab::text = '10'::text
WITH DATA;

ALTER TABLE x_apps.xapps_geo_vmr_etab
  OWNER TO sig_create;

COMMENT ON MATERIALIZED VIEW x_apps.xapps_geo_vmr_etab
  IS 'Vue matérialisée non éditable des établissements pour optimiser l''affichage de la lite des établissements dans les fiches sous GEO. Cette vue est rafraichie toutes les nuits par une tache cron. Après test cette vue n''est pas utilisée dans GEO (pas de gain de performance). A voir si à supprimer de la trache cron si plus utilisée.';

-- Index: x_apps.idx_xapps_geo_vmr_etab_idsite

-- DROP INDEX x_apps.idx_xapps_geo_vmr_etab_idsite;

CREATE INDEX idx_xapps_geo_vmr_etab_idsite
  ON x_apps.xapps_geo_vmr_etab
  USING btree
  (idsite COLLATE pg_catalog."default");


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


