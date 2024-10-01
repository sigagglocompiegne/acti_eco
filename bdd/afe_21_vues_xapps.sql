/*Amt_Fon_Eco V1.0*/
/*Creation des vues applicatives stockées dans le schéma x_apps */
/* afe_21_vues_xapps.sql */
/*PostGIS*/

/* Propriétaire : GeoCompiegnois - http://geo.compiegnois.fr/ */
/* Auteur : Grégory Bodet */



-- ####################################################################################################################################################
-- ###                                                                                                                                              ###
-- ###                                                              VUES APPLICATIVES                                                                ###
-- ###                                                                                                                                              ###
-- ####################################################################################################################################################


-- ########################################################### SCHEMA m_activite_eco ################################################################

-- ##################################################### xapps_an_v_etabloc_stat #####################################################################

-- View: m_activite_eco.xapps_an_v_etabloc_stat

-- DROP VIEW m_activite_eco.xapps_an_v_etabloc_stat;

CREATE OR REPLACE VIEW m_activite_eco.xapps_an_v_etabloc_stat
 AS
 WITH req_t AS (
         SELECT s.codecommuneetablissement,
            count(*) AS nb_etab_tot
           FROM m_activite_eco.an_eco_etab e,
            s_sirene.an_etablissement_api s
          WHERE e.idsiret::text = s.siret::text AND s.etatadministratifetablissement::text = 'A'::text
          GROUP BY s.codecommuneetablissement
        ), req_non_loc AS (
         SELECT s.codecommuneetablissement,
            count(*) AS nb_etab_nonloc
           FROM s_sirene.an_etablissement_api s,
            m_activite_eco.lk_adresseetablissement l
          WHERE s.siret::text = l.siret::text AND s.etatadministratifetablissement::text = 'A'::text AND l.idadresse IS NULL
          GROUP BY s.codecommuneetablissement
        ), req_t_compte AS (
         SELECT s.codecommuneetablissement,
            count(*) AS nb_etab_tot_compte
           FROM m_activite_eco.an_eco_etab e,
            s_sirene.an_etablissement_api s
          WHERE e.idsiret::text = s.siret::text AND s.etatadministratifetablissement::text = 'A'::text AND e.l_compte = true
          GROUP BY s.codecommuneetablissement
        ), req_non_loc_compte AS (
         SELECT s.codecommuneetablissement,
            count(*) AS nb_etab_nonloc_compte
           FROM m_activite_eco.an_eco_etab e,
            s_sirene.an_etablissement_api s,
            m_activite_eco.lk_adresseetablissement l
          WHERE s.siret::text = l.siret::text AND e.idsiret::text = s.siret::text AND e.l_compte = true AND s.etatadministratifetablissement::text = 'A'::text AND l.idadresse IS NULL
          GROUP BY s.codecommuneetablissement
        )
 SELECT req_t.codecommuneetablissement,
    g.libgeo AS libellecommuneetablissement,
    req_t.nb_etab_tot,
        CASE
            WHEN req_non_loc.nb_etab_nonloc IS NULL THEN 0::bigint
            ELSE req_non_loc.nb_etab_nonloc
        END AS nb_etab_nonloc,
        CASE
            WHEN req_non_loc.nb_etab_nonloc IS NULL THEN '0%'::character varying::text
            ELSE round((req_non_loc.nb_etab_nonloc::double precision / req_t.nb_etab_tot::double precision * 100::double precision)::numeric, 1) || '%'::character varying::text
        END AS tx_nonloc,
    req_t_compte.nb_etab_tot_compte,
        CASE
            WHEN req_non_loc_compte.nb_etab_nonloc_compte IS NULL THEN 0::bigint
            ELSE req_non_loc_compte.nb_etab_nonloc_compte
        END AS nb_etab_nonloc_compte,
        CASE
            WHEN req_non_loc_compte.nb_etab_nonloc_compte IS NULL THEN '0%'::character varying::text
            ELSE round((req_non_loc_compte.nb_etab_nonloc_compte::double precision / req_t_compte.nb_etab_tot_compte::double precision * 100::double precision)::numeric, 1) || '%'::character varying::text
        END AS tx_nonloc_compte
   FROM req_t
     LEFT JOIN r_administratif.an_geo g ON req_t.codecommuneetablissement::text = g.insee::text
     LEFT JOIN req_non_loc ON req_t.codecommuneetablissement::text = req_non_loc.codecommuneetablissement::text
     LEFT JOIN req_t_compte ON req_t_compte.codecommuneetablissement::text = req_t.codecommuneetablissement::text
     LEFT JOIN req_non_loc_compte ON req_non_loc_compte.codecommuneetablissement::text = req_t.codecommuneetablissement::text
  ORDER BY req_t.codecommuneetablissement;

COMMENT ON VIEW m_activite_eco.xapps_an_v_etabloc_stat
    IS 'Vue alphanumérique permettant de calculer des statistiques de localisation des établissements (SIRENE) à l''adresse par commune';

-- ########################################################### SCHEMA m_activite_eco ################################################################

-- ##################################################### xapps_an_v_photo_site_alaune #####################################################################

-- View: m_activite_eco.xapps_an_v_photo_site_alaune

-- DROP VIEW m_activite_eco.xapps_an_v_photo_site_alaune;

CREATE OR REPLACE VIEW m_activite_eco.xapps_an_v_photo_site_alaune
 AS
 SELECT x.r,
    x.gid,
    x.id,
    x.media,
    x.miniature,
    x.n_fichier,
    x.t_fichier,
    x.date_sai,
    x.date_maj,
    x.op_sai,
    x.op_maj,
    x.l_doc,
    x.t_doc,
    x.d_photo,
    x.alaune,
    x.alaunesite
   FROM ( SELECT row_number() OVER (PARTITION BY t.id ORDER BY t.id) AS r,
            t.gid,
            t.id,
            t.media,
            t.miniature,
            t.n_fichier,
            t.t_fichier,
            t.date_sai,
            t.date_maj,
            t.op_sai,
            t.op_maj,
            t.l_doc,
            t.t_doc,
            t.d_photo,
            t.alaune,
            t.alaunesite
           FROM m_activite_eco.an_eco_media t
          WHERE t.alaunesite = true) x
  WHERE x.r = 1
  ORDER BY x.id;

COMMENT ON VIEW m_activite_eco.xapps_an_v_photo_site_alaune
    IS 'Vue alphanumérique remontant les médias un seul média à la une définti par l''utilisateur';

-- ########################################################### SCHEMA m_activite_eco ################################################################

-- ##################################################### xapps_an_v_prixloc_stat #####################################################################

-- View: m_activite_eco.xapps_an_v_prixloc_stat

-- DROP VIEW m_activite_eco.xapps_an_v_prixloc_stat;

CREATE OR REPLACE VIEW m_activite_eco.xapps_an_v_prixloc_stat
 AS
 WITH req_site AS (
         SELECT geo_eco_site.idsite,
            geo_eco_site.site_nom
           FROM m_activite_eco.geo_eco_site
        ), req_pvm2_bureau AS (
         SELECT s_1.idsite,
            round(avg(l.pventem2)::numeric, 0) AS pv_bureau_m2
           FROM m_activite_eco.an_eco_loc_act l,
            m_activite_eco.lk_eco_loc_site s_1
          WHERE l.idloc::text = s_1.idloc::text AND l.typ2::text = '30'::text
          GROUP BY s_1.idsite
        ), req_pvm2_commerce AS (
         SELECT s_1.idsite,
            round(avg(l.pventem2)::numeric, 0) AS pv_commerce_m2
           FROM m_activite_eco.an_eco_loc_act l,
            m_activite_eco.lk_eco_loc_site s_1
          WHERE l.idloc::text = s_1.idloc::text AND l.typ2::text = '40'::text
          GROUP BY s_1.idsite
        ), req_pvm2_activite AS (
         SELECT s_1.idsite,
            round(avg(l.pventem2)::numeric, 0) AS pv_activite_m2
           FROM m_activite_eco.an_eco_loc_act l,
            m_activite_eco.lk_eco_loc_site s_1
          WHERE l.idloc::text = s_1.idloc::text AND l.typ2::text = '50'::text
          GROUP BY s_1.idsite
        ), req_lm2_bureau AS (
         SELECT s_1.idsite,
            round(avg(l.loyerm2)::numeric, 0) AS l_bureau_m2
           FROM m_activite_eco.an_eco_loc_act l,
            m_activite_eco.lk_eco_loc_site s_1
          WHERE l.idloc::text = s_1.idloc::text AND l.typ2::text = '30'::text
          GROUP BY s_1.idsite
        ), req_lm2_commerce AS (
         SELECT s_1.idsite,
            round(avg(l.loyerm2)::numeric, 0) AS l_commerce_m2
           FROM m_activite_eco.an_eco_loc_act l,
            m_activite_eco.lk_eco_loc_site s_1
          WHERE l.idloc::text = s_1.idloc::text AND l.typ2::text = '40'::text
          GROUP BY s_1.idsite
        ), req_lm2_activite AS (
         SELECT s_1.idsite,
            round(avg(l.loyerm2)::numeric, 0) AS l_activite_m2
           FROM m_activite_eco.an_eco_loc_act l,
            m_activite_eco.lk_eco_loc_site s_1
          WHERE l.idloc::text = s_1.idloc::text AND l.typ2::text = '50'::text
          GROUP BY s_1.idsite
        )
 SELECT s.idsite,
        CASE
            WHEN b.pv_bureau_m2 IS NULL THEN 'n.r'::text
            ELSE b.pv_bureau_m2::text
        END AS pv_bureau_m2,
        CASE
            WHEN c.pv_commerce_m2 IS NULL THEN 'n.r'::text
            ELSE c.pv_commerce_m2::text
        END AS pv_commerce_m2,
        CASE
            WHEN a.pv_activite_m2 IS NULL THEN 'n.r'::text
            ELSE a.pv_activite_m2::text
        END AS pv_activite_m2,
        CASE
            WHEN lb.l_bureau_m2 IS NULL THEN 'n.r'::text
            ELSE lb.l_bureau_m2::text
        END AS l_bureau_m2,
        CASE
            WHEN lc.l_commerce_m2 IS NULL THEN 'n.r'::text
            ELSE lc.l_commerce_m2::text
        END AS l_commerce_m2,
        CASE
            WHEN la.l_activite_m2 IS NULL THEN 'n.r'::text
            ELSE la.l_activite_m2::text
        END AS l_activite_m2,
    ((((((((((('<table border = 1>
	<tr><td>&nbsp;</td><td>Loyer HT/m²/an</td><td>Prix de vente/m²</td></tr>
	<tr><td>Bureau</td><td align="center">'::text ||
        CASE
            WHEN lb.l_bureau_m2 IS NULL THEN 'n.r'::text
            ELSE lb.l_bureau_m2::text
        END) || '</td><td align="center">'::text) ||
        CASE
            WHEN c.pv_commerce_m2 IS NULL THEN 'n.r'::text
            ELSE c.pv_commerce_m2::text
        END) || '</td></tr>
	<tr><td>Commerce</td><td align="center">'::text) ||
        CASE
            WHEN lc.l_commerce_m2 IS NULL THEN 'n.r'::text
            ELSE lc.l_commerce_m2::text
        END) || '</td><td align="center">'::text) ||
        CASE
            WHEN c.pv_commerce_m2 IS NULL THEN 'n.r'::text
            ELSE c.pv_commerce_m2::text
        END) || '</td></tr>
	<tr><td>Activité</td><td align="center">'::text) ||
        CASE
            WHEN la.l_activite_m2 IS NULL THEN 'n.r'::text
            ELSE la.l_activite_m2::text
        END) || '</td><td align="center">'::text) ||
        CASE
            WHEN a.pv_activite_m2 IS NULL THEN 'n.r'::text
            ELSE a.pv_activite_m2::text
        END) || '</td></tr>
	</table>'::text AS tableau_prix
   FROM req_site s
     LEFT JOIN req_pvm2_bureau b ON s.idsite::text = b.idsite::text
     LEFT JOIN req_pvm2_commerce c ON s.idsite::text = c.idsite::text
     LEFT JOIN req_pvm2_activite a ON s.idsite::text = a.idsite::text
     LEFT JOIN req_lm2_bureau lb ON s.idsite::text = lb.idsite::text
     LEFT JOIN req_lm2_commerce lc ON s.idsite::text = lc.idsite::text
     LEFT JOIN req_lm2_activite la ON s.idsite::text = la.idsite::text;

COMMENT ON VIEW m_activite_eco.xapps_an_v_prixloc_stat
    IS 'Vue alphanumérique calculant les prix moyens des bureaux, commerces et activités par site';

-- ########################################################### SCHEMA m_activite_eco ################################################################

-- ##################################################### xapps_an_v_repgdsecteur_site_act_api #####################################################################

-- View: m_activite_eco.xapps_an_v_repgdsecteur_site_act_api

-- DROP VIEW m_activite_eco.xapps_an_v_repgdsecteur_site_act_api;

CREATE OR REPLACE VIEW m_activite_eco.xapps_an_v_repgdsecteur_site_act_api
 AS
 WITH req_naf AS (
         SELECT lk.idsite,
            u.code AS code_gdsecteur,
            u.valeur AS lib_gdsecteur,
            count(*) AS nb_etab
           FROM s_sirene.an_etablissement_api s,
            m_activite_eco.lk_eco_etab_site lk,
            s_sirene.naf_n5n1 n15,
            s_sirene.naf4_ursaff n4,
            s_sirene.lt_urssaf u
          WHERE s.siret::text = lk.siret::text AND s.activiteprincipaleetablissement::text = n15.niv5::text AND n15.niv4::text = n4.naf4::text AND n4.codengs::text = u.code::text
          GROUP BY lk.idsite, u.code, u.valeur
          ORDER BY lk.idsite
        ), req_etab_tot AS (
         SELECT lk.idsite,
            count(*) AS nb_etab_tot
           FROM s_sirene.an_etablissement_api s,
            m_activite_eco.lk_eco_etab_site lk
          WHERE s.siret::text = lk.siret::text
          GROUP BY lk.idsite
        )
 SELECT row_number() OVER () AS gid,
    req_etab_tot.idsite,
    req_naf.code_gdsecteur,
    req_naf.lib_gdsecteur,
    req_naf.nb_etab,
    round(req_naf.nb_etab::numeric / req_etab_tot.nb_etab_tot::numeric * 100::numeric, 1) AS tx_gdsecteur
   FROM req_etab_tot,
    req_naf
  WHERE req_etab_tot.idsite::text = req_naf.idsite::text;

COMMENT ON VIEW m_activite_eco.xapps_an_v_repgdsecteur_site_act_api
    IS 'Vue alphanumérique présentant la répartition des établissements (SIRENE et hors SIRENE) par grands secteurs d''activité et par site d''activité.';


-- ########################################################### SCHEMA m_activite_eco ################################################################

-- ##################################################### xapps_an_v_synt_site_act_api #####################################################################

-- View: m_activite_eco.xapps_an_v_synt_site_act_api

-- DROP VIEW m_activite_eco.xapps_an_v_synt_site_act_api;

-- m_activite_eco.xapps_an_v_synt_site_act_api source

CREATE OR REPLACE VIEW m_activite_eco.xapps_an_v_synt_site_act_api
AS WITH req_a AS (
         SELECT geo_eco_site.idsite,
            geo_eco_site.site_nom,
                CASE
                    WHEN geo_eco_site.dest::text = '00'::text THEN 'Non renseigné'::text
                    WHEN geo_eco_site.dest::text = '10'::text THEN 'Artisanat'::text
                    WHEN geo_eco_site.dest::text = '20'::text THEN 'Industrie ou R&D'::text
                    WHEN geo_eco_site.dest::text = '30'::text THEN 'Tertiaire'::text
                    WHEN geo_eco_site.dest::text = '40'::text THEN 'Transport et logistique'::text
                    WHEN geo_eco_site.dest::text = '50'::text THEN 'Commerce'::text
                    WHEN geo_eco_site.dest::text = '60'::text THEN 'Agriculture'::text
                    WHEN geo_eco_site.dest::text = '70'::text THEN 'Service/Négoce'::text
                    ELSE NULL::text
                END AS dest,
                CASE
                    WHEN geo_eco_site.site_voca::text = '00'::text THEN 'Pas de vocation'::text
                    WHEN geo_eco_site.site_voca::text = '10'::text THEN 'ZI - zone industrielle'::text
                    WHEN geo_eco_site.site_voca::text = '20'::text THEN 'ZA - zone artisanale'::text
                    WHEN geo_eco_site.site_voca::text = '30'::text THEN 'ZC - zone commerciale'::text
                    WHEN geo_eco_site.site_voca::text = '40'::text THEN 'ZM - zone mixte'::text
                    ELSE NULL::text
                END AS voca,
            now() AS date_extract,
            round(geo_eco_site.surf_brt::numeric / 10000::numeric, 2) AS surf_site,
            geo_eco_site.p_implant,
                CASE
                    WHEN lt_eco_dest.valeur::text ~~ '%R&D%'::text THEN replace(lt_eco_dest.valeur::text, '&'::text, 'et'::text)::character varying
                    ELSE lt_eco_dest.valeur
                END AS dest_lib,
            geo_eco_site.epci,
                CASE
                    WHEN geo_eco_site.serv_tc IS TRUE AND geo_eco_site.serv_tc_g IS TRUE THEN 'Présence d''un service de transport en commun gratuit'::text
                    WHEN geo_eco_site.serv_tc IS TRUE AND geo_eco_site.serv_tc_g IS FALSE THEN 'Présence d''un service de transport en commun'::text
                    ELSE 'Pas d''offre de transport en commun'::text
                END AS offre_tc,
            ((((('<b>'::text || geo_eco_site.z_auto::text) || '</b> (échangeur '::text) || geo_eco_site.d_auto::text) || ' à '::text) || geo_eco_site.z_dst_auto) || ' km'::text AS acces_a,
            ((('<b>'::text || geo_eco_site.z_fr_v::text) || '</b> à '::text) || geo_eco_site.z_dst_fr_v) || ' km'::text AS acces_gare_v,
            ((('<b>'::text || geo_eco_site.z_fr_f::text) || '</b> à '::text) || geo_eco_site.z_dst_fr_f) || ' km'::text AS acces_gare_f
           FROM m_activite_eco.geo_eco_site
             LEFT JOIN m_activite_eco.lt_eco_dest ON geo_eco_site.site_voca::text = lt_eco_dest.code::text
          ORDER BY geo_eco_site.site_nom
        ), req_f AS (
         SELECT geo_eco_site.idsite,
            count(*) AS nb_etab_sirene
           FROM m_activite_eco.an_eco_etab,
            m_activite_eco.geo_eco_site,
            m_activite_eco.lk_eco_etab_site,
            s_sirene.an_etablissement_api
          WHERE geo_eco_site.idsite::text = lk_eco_etab_site.idsite::text AND lk_eco_etab_site.siret::text = an_eco_etab.idsiret::text AND an_eco_etab.idsiret::text = an_etablissement_api.siret::text AND an_eco_etab.l_compte = true AND an_etablissement_api.etatadministratifetablissement::text = 'A'::text
          GROUP BY geo_eco_site.idsite
        ), req_g AS (
         SELECT geo_eco_site.idsite,
            count(*) AS nb_etab_spe
           FROM m_activite_eco.geo_eco_etabp,
            m_activite_eco.geo_eco_site,
            m_activite_eco.lk_eco_etab_site
          WHERE geo_eco_site.idsite::text = lk_eco_etab_site.idsite::text AND lk_eco_etab_site.siret::text = geo_eco_etabp.idobjet::text AND geo_eco_etabp.l_compte = true
          GROUP BY geo_eco_site.idsite
        ), req_h AS (
         SELECT geo_eco_site.idsite,
            sum(an_eco_etab.eff_etab)::integer AS eff_globaux_sirene
           FROM m_activite_eco.an_eco_etab,
            m_activite_eco.lk_eco_etab_site,
            m_activite_eco.geo_eco_site,
            s_sirene.an_etablissement_api
          WHERE geo_eco_site.idsite::text = lk_eco_etab_site.idsite::text AND lk_eco_etab_site.siret::text = an_eco_etab.idsiret::text AND an_eco_etab.idsiret::text = an_etablissement_api.siret::text AND an_eco_etab.l_compte = true AND an_etablissement_api.etatadministratifetablissement::text = 'A'::text
          GROUP BY geo_eco_site.idsite
        ), req_i AS (
         SELECT geo_eco_site.idsite,
            sum(geo_eco_etabp.eff_etab)::integer AS eff_globaux_etabp
           FROM m_activite_eco.geo_eco_etabp,
            m_activite_eco.lk_eco_etab_site,
            m_activite_eco.geo_eco_site
          WHERE geo_eco_site.idsite::text = lk_eco_etab_site.idsite::text AND lk_eco_etab_site.siret::text = geo_eco_etabp.idobjet::text AND geo_eco_etabp.l_compte = true
          GROUP BY geo_eco_site.idsite
        ), req_j AS (
         SELECT geo_eco_site.idsite,
                CASE
                    WHEN sum(geo_objet_fon_lot.surf) IS NOT NULL THEN
                    CASE
                        WHEN length(sum(geo_objet_fon_lot.surf)::character varying::text) >= 1 AND length(sum(geo_objet_fon_lot.surf)::character varying::text) <= 3 THEN sum(geo_objet_fon_lot.surf)::character varying::text || ' m²'::text
                        WHEN length(sum(geo_objet_fon_lot.surf)::character varying::text) = 4 THEN replace(to_char(sum(geo_objet_fon_lot.surf), 'FM9G999'::text), ','::text, ' '::text) || ' m²'::text
                        WHEN length(sum(geo_objet_fon_lot.surf)::character varying::text) = 5 THEN replace(to_char(sum(geo_objet_fon_lot.surf), 'FM99G999'::text), ','::text, ' '::text) || ' m²'::text
                        WHEN length(sum(geo_objet_fon_lot.surf)::character varying::text) = 6 THEN replace(to_char(sum(geo_objet_fon_lot.surf), 'FM999G999'::text), ','::text, ' '::text) || ' m²'::text
                        WHEN length(sum(geo_objet_fon_lot.surf)::character varying::text) = 7 THEN replace(to_char(sum(geo_objet_fon_lot.surf), 'FM9G999G999'::text), ','::text, ' '::text) || ' m²'::text
                        WHEN length(sum(geo_objet_fon_lot.surf)::character varying::text) = 8 THEN replace(to_char(sum(geo_objet_fon_lot.surf), 'FM99G999G999'::text), ','::text, ' '::text) || ' m²'::text
                        ELSE NULL::text
                    END
                    ELSE '0 m²'::text
                END AS surf_dispo_vente,
                CASE
                    WHEN sum(geo_objet_fon_lot.surf) IS NOT NULL THEN sum(geo_objet_fon_lot.surf)
                    ELSE 0::bigint
                END AS surf_utile_vente
           FROM m_activite_eco.geo_eco_site,
            r_objet.geo_objet_fon_lot,
            m_amenagement.lk_amt_lot_site,
            m_amenagement.an_amt_lot_stade
          WHERE (an_amt_lot_stade.l_comm2::text = '11'::text OR an_amt_lot_stade.l_comm2::text = '12'::text) AND geo_objet_fon_lot.l_voca::text = '20'::text AND an_amt_lot_stade.idgeolf = geo_objet_fon_lot.idgeolf AND geo_eco_site.idsite::text = lk_amt_lot_site.idsite::text AND lk_amt_lot_site.idgeolf = geo_objet_fon_lot.idgeolf
          GROUP BY geo_eco_site.idsite
        ), req_k AS (
         SELECT geo_eco_site.idsite,
                CASE
                    WHEN sum(geo_objet_fon_lot.surf) IS NOT NULL THEN
                    CASE
                        WHEN length(sum(geo_objet_fon_lot.surf)::character varying::text) >= 1 AND length(sum(geo_objet_fon_lot.surf)::character varying::text) <= 3 THEN sum(geo_objet_fon_lot.surf)::character varying::text || ' m²'::text
                        WHEN length(sum(geo_objet_fon_lot.surf)::character varying::text) = 4 THEN replace(to_char(sum(geo_objet_fon_lot.surf), 'FM9G999'::text), ','::text, ' '::text) || ' m²'::text
                        WHEN length(sum(geo_objet_fon_lot.surf)::character varying::text) = 5 THEN replace(to_char(sum(geo_objet_fon_lot.surf), 'FM99G999'::text), ','::text, ' '::text) || ' m²'::text
                        WHEN length(sum(geo_objet_fon_lot.surf)::character varying::text) = 6 THEN replace(to_char(sum(geo_objet_fon_lot.surf), 'FM999G999'::text), ','::text, ' '::text) || ' m²'::text
                        WHEN length(sum(geo_objet_fon_lot.surf)::character varying::text) = 7 THEN replace(to_char(sum(geo_objet_fon_lot.surf), 'FM9G999G999'::text), ','::text, ' '::text) || ' m²'::text
                        WHEN length(sum(geo_objet_fon_lot.surf)::character varying::text) = 8 THEN replace(to_char(sum(geo_objet_fon_lot.surf), 'FM99G999G999'::text), ','::text, ' '::text) || ' m²'::text
                        ELSE NULL::text
                    END
                    ELSE '0 m²'::text
                END AS surf_dedie_act,
                CASE
                    WHEN sum(geo_objet_fon_lot.surf) IS NOT NULL THEN sum(geo_objet_fon_lot.surf)
                    ELSE 0::bigint
                END AS surf_utile_act
           FROM m_activite_eco.geo_eco_site,
            r_objet.geo_objet_fon_lot,
            m_amenagement.an_amt_lot_stade,
            m_amenagement.lk_amt_lot_site
          WHERE geo_eco_site.idsite::text = lk_amt_lot_site.idsite::text 
          AND lk_amt_lot_site.idgeolf = geo_objet_fon_lot.idgeolf 
          AND geo_objet_fon_lot.l_voca IN ('20','60')
          AND an_amt_lot_stade.idgeolf = geo_objet_fon_lot.idgeolf
          GROUP BY geo_eco_site.idsite
        ), req_k1 AS (
         SELECT geo_eco_site.idsite,
                CASE
                    WHEN sum(geo_objet_fon_lot.surf) IS NOT NULL THEN
                    CASE
                        WHEN length(sum(geo_objet_fon_lot.surf)::character varying::text) >= 1 AND length(sum(geo_objet_fon_lot.surf)::character varying::text) <= 3 THEN sum(geo_objet_fon_lot.surf)::character varying::text || ' m²'::text
                        WHEN length(sum(geo_objet_fon_lot.surf)::character varying::text) = 4 THEN replace(to_char(sum(geo_objet_fon_lot.surf), 'FM9G999'::text), ','::text, ' '::text) || ' m²'::text
                        WHEN length(sum(geo_objet_fon_lot.surf)::character varying::text) = 5 THEN replace(to_char(sum(geo_objet_fon_lot.surf), 'FM99G999'::text), ','::text, ' '::text) || ' m²'::text
                        WHEN length(sum(geo_objet_fon_lot.surf)::character varying::text) = 6 THEN replace(to_char(sum(geo_objet_fon_lot.surf), 'FM999G999'::text), ','::text, ' '::text) || ' m²'::text
                        WHEN length(sum(geo_objet_fon_lot.surf)::character varying::text) = 7 THEN replace(to_char(sum(geo_objet_fon_lot.surf), 'FM9G999G999'::text), ','::text, ' '::text) || ' m²'::text
                        WHEN length(sum(geo_objet_fon_lot.surf)::character varying::text) = 8 THEN replace(to_char(sum(geo_objet_fon_lot.surf), 'FM99G999G999'::text), ','::text, ' '::text) || ' m²'::text
                        ELSE NULL::text
                    END
                    ELSE '0 m²'::text
                END AS surf_reserve_projet,
                CASE
                    WHEN sum(geo_objet_fon_lot.surf) IS NOT NULL THEN sum(geo_objet_fon_lot.surf)
                    ELSE 0::bigint
                END AS surf_utile_projet
           FROM m_activite_eco.geo_eco_site,
            r_objet.geo_objet_fon_lot,
            m_amenagement.an_amt_lot_stade,
            m_amenagement.lk_amt_lot_site
          WHERE (an_amt_lot_stade.l_comm2::text = '31'::text OR an_amt_lot_stade.l_comm2::text = '32'::text) AND geo_objet_fon_lot.l_voca::text = '20'::text AND an_amt_lot_stade.idgeolf = geo_objet_fon_lot.idgeolf AND geo_eco_site.idsite::text = lk_amt_lot_site.idsite::text AND lk_amt_lot_site.idgeolf = geo_objet_fon_lot.idgeolf
          GROUP BY geo_eco_site.idsite
        ), req_k2 AS (
         SELECT geo_eco_site.idsite,
                CASE
                    WHEN sum(geo_objet_fon_lot.surf) IS NOT NULL THEN
                    CASE
                        WHEN length(sum(geo_objet_fon_lot.surf)::character varying::text) >= 1 AND length(sum(geo_objet_fon_lot.surf)::character varying::text) <= 3 THEN sum(geo_objet_fon_lot.surf)::character varying::text || ' m²'::text
                        WHEN length(sum(geo_objet_fon_lot.surf)::character varying::text) = 4 THEN replace(to_char(sum(geo_objet_fon_lot.surf), 'FM9G999'::text), ','::text, ' '::text) || ' m²'::text
                        WHEN length(sum(geo_objet_fon_lot.surf)::character varying::text) = 5 THEN replace(to_char(sum(geo_objet_fon_lot.surf), 'FM99G999'::text), ','::text, ' '::text) || ' m²'::text
                        WHEN length(sum(geo_objet_fon_lot.surf)::character varying::text) = 6 THEN replace(to_char(sum(geo_objet_fon_lot.surf), 'FM999G999'::text), ','::text, ' '::text) || ' m²'::text
                        WHEN length(sum(geo_objet_fon_lot.surf)::character varying::text) = 7 THEN replace(to_char(sum(geo_objet_fon_lot.surf), 'FM9G999G999'::text), ','::text, ' '::text) || ' m²'::text
                        WHEN length(sum(geo_objet_fon_lot.surf)::character varying::text) = 8 THEN replace(to_char(sum(geo_objet_fon_lot.surf), 'FM99G999G999'::text), ','::text, ' '::text) || ' m²'::text
                        ELSE NULL::text
                    END
                    ELSE '0 m²'::text
                END AS surf_dedie_equ
           FROM m_amenagement.an_amt_lot_equip,
            m_activite_eco.geo_eco_site,
            r_objet.geo_objet_fon_lot,
            m_amenagement.an_amt_lot_stade,
            m_amenagement.lk_amt_lot_site
          WHERE geo_eco_site.idsite::text = lk_amt_lot_site.idsite::text 
          AND lk_amt_lot_site.idgeolf = geo_objet_fon_lot.idgeolf 
          AND geo_objet_fon_lot.idgeolf = an_amt_lot_equip.idgeolf 
          AND geo_objet_fon_lot.l_voca::text = '10'::text AND an_amt_lot_stade.idgeolf = geo_objet_fon_lot.idgeolf
          GROUP BY geo_eco_site.idsite
        ), req_k3 AS (
         SELECT geo_eco_site.idsite,
                CASE
                    WHEN sum(geo_objet_fon_lot.surf) IS NOT NULL THEN
                    CASE
                        WHEN length(sum(geo_objet_fon_lot.surf)::character varying::text) >= 1 AND length(sum(geo_objet_fon_lot.surf)::character varying::text) <= 3 THEN sum(geo_objet_fon_lot.surf)::character varying::text || ' m²'::text
                        WHEN length(sum(geo_objet_fon_lot.surf)::character varying::text) = 4 THEN replace(to_char(sum(geo_objet_fon_lot.surf), 'FM9G999'::text), ','::text, ' '::text) || ' m²'::text
                        WHEN length(sum(geo_objet_fon_lot.surf)::character varying::text) = 5 THEN replace(to_char(sum(geo_objet_fon_lot.surf), 'FM99G999'::text), ','::text, ' '::text) || ' m²'::text
                        WHEN length(sum(geo_objet_fon_lot.surf)::character varying::text) = 6 THEN replace(to_char(sum(geo_objet_fon_lot.surf), 'FM999G999'::text), ','::text, ' '::text) || ' m²'::text
                        WHEN length(sum(geo_objet_fon_lot.surf)::character varying::text) = 7 THEN replace(to_char(sum(geo_objet_fon_lot.surf), 'FM9G999G999'::text), ','::text, ' '::text) || ' m²'::text
                        WHEN length(sum(geo_objet_fon_lot.surf)::character varying::text) = 8 THEN replace(to_char(sum(geo_objet_fon_lot.surf), 'FM99G999G999'::text), ','::text, ' '::text) || ' m²'::text
                        ELSE NULL::text
                    END
                    ELSE '0 m²'::text
                END AS surf_dedie_mixte
           FROM m_amenagement.an_amt_lot_mixt,
            m_activite_eco.geo_eco_site,
            r_objet.geo_objet_fon_lot,
            m_amenagement.an_amt_lot_stade,
            m_amenagement.lk_amt_lot_site
          WHERE geo_eco_site.idsite::text = lk_amt_lot_site.idsite::text AND lk_amt_lot_site.idgeolf = geo_objet_fon_lot.idgeolf AND geo_objet_fon_lot.idgeolf = an_amt_lot_mixt.idgeolf AND geo_objet_fon_lot.l_voca::text = '60'::text AND an_amt_lot_stade.idgeolf = geo_objet_fon_lot.idgeolf
          GROUP BY geo_eco_site.idsite
        ), req_k4 AS (
         SELECT geo_eco_site.idsite,
                CASE
                    WHEN sum(geo_objet_fon_lot.surf) IS NOT NULL THEN
                    CASE
                        WHEN length(sum(geo_objet_fon_lot.surf)::character varying::text) >= 1 AND length(sum(geo_objet_fon_lot.surf)::character varying::text) <= 3 THEN sum(geo_objet_fon_lot.surf)::character varying::text || ' m²'::text
                        WHEN length(sum(geo_objet_fon_lot.surf)::character varying::text) = 4 THEN replace(to_char(sum(geo_objet_fon_lot.surf), 'FM9G999'::text), ','::text, ' '::text) || ' m²'::text
                        WHEN length(sum(geo_objet_fon_lot.surf)::character varying::text) = 5 THEN replace(to_char(sum(geo_objet_fon_lot.surf), 'FM99G999'::text), ','::text, ' '::text) || ' m²'::text
                        WHEN length(sum(geo_objet_fon_lot.surf)::character varying::text) = 6 THEN replace(to_char(sum(geo_objet_fon_lot.surf), 'FM999G999'::text), ','::text, ' '::text) || ' m²'::text
                        WHEN length(sum(geo_objet_fon_lot.surf)::character varying::text) = 7 THEN replace(to_char(sum(geo_objet_fon_lot.surf), 'FM9G999G999'::text), ','::text, ' '::text) || ' m²'::text
                        WHEN length(sum(geo_objet_fon_lot.surf)::character varying::text) = 8 THEN replace(to_char(sum(geo_objet_fon_lot.surf), 'FM99G999G999'::text), ','::text, ' '::text) || ' m²'::text
                        ELSE NULL::text
                    END
                    ELSE '0 m²'::text
                END AS surf_dedie_esppu
           FROM m_amenagement.an_amt_lot_esppublic,
            m_activite_eco.geo_eco_site,
            r_objet.geo_objet_fon_lot,
            m_amenagement.an_amt_lot_stade,
            m_amenagement.lk_amt_lot_site
          WHERE geo_eco_site.idsite::text = lk_amt_lot_site.idsite::text AND lk_amt_lot_site.idgeolf = geo_objet_fon_lot.idgeolf AND geo_objet_fon_lot.idgeolf = an_amt_lot_esppublic.idgeolf AND geo_objet_fon_lot.l_voca::text = '50'::text AND an_amt_lot_stade.idgeolf = geo_objet_fon_lot.idgeolf
          GROUP BY geo_eco_site.idsite
        ), req_k5 AS (
         SELECT geo_eco_site.idsite,
                CASE
                    WHEN sum(geo_objet_fon_lot.surf) IS NOT NULL THEN
                    CASE
                        WHEN length(sum(geo_objet_fon_lot.surf)::character varying::text) >= 1 AND length(sum(geo_objet_fon_lot.surf)::character varying::text) <= 3 THEN sum(geo_objet_fon_lot.surf)::character varying::text || ' m²'::text
                        WHEN length(sum(geo_objet_fon_lot.surf)::character varying::text) = 4 THEN replace(to_char(sum(geo_objet_fon_lot.surf), 'FM9G999'::text), ','::text, ' '::text) || ' m²'::text
                        WHEN length(sum(geo_objet_fon_lot.surf)::character varying::text) = 5 THEN replace(to_char(sum(geo_objet_fon_lot.surf), 'FM99G999'::text), ','::text, ' '::text) || ' m²'::text
                        WHEN length(sum(geo_objet_fon_lot.surf)::character varying::text) = 6 THEN replace(to_char(sum(geo_objet_fon_lot.surf), 'FM999G999'::text), ','::text, ' '::text) || ' m²'::text
                        WHEN length(sum(geo_objet_fon_lot.surf)::character varying::text) = 7 THEN replace(to_char(sum(geo_objet_fon_lot.surf), 'FM9G999G999'::text), ','::text, ' '::text) || ' m²'::text
                        WHEN length(sum(geo_objet_fon_lot.surf)::character varying::text) = 8 THEN replace(to_char(sum(geo_objet_fon_lot.surf), 'FM99G999G999'::text), ','::text, ' '::text) || ' m²'::text
                        ELSE NULL::text
                    END
                    ELSE '0 m²'::text
                END AS surf_dedie_divers
           FROM m_amenagement.an_amt_lot_divers,
            m_activite_eco.geo_eco_site,
            r_objet.geo_objet_fon_lot,
            m_amenagement.an_amt_lot_stade,
            m_amenagement.lk_amt_lot_site
          WHERE geo_eco_site.idsite::text = lk_amt_lot_site.idsite::text AND lk_amt_lot_site.idgeolf = geo_objet_fon_lot.idgeolf AND geo_objet_fon_lot.idgeolf = an_amt_lot_divers.idgeolf AND geo_objet_fon_lot.l_voca::text = '40'::text AND an_amt_lot_stade.idgeolf = geo_objet_fon_lot.idgeolf
          GROUP BY geo_eco_site.idsite
        ), req_k6 AS (
         SELECT geo_eco_site.idsite,
                CASE
                    WHEN sum(geo_objet_fon_lot.surf) IS NOT NULL THEN
                    CASE
                        WHEN length(sum(geo_objet_fon_lot.surf)::character varying::text) >= 1 AND length(sum(geo_objet_fon_lot.surf)::character varying::text) <= 3 THEN sum(geo_objet_fon_lot.surf)::character varying::text || ' m²'::text
                        WHEN length(sum(geo_objet_fon_lot.surf)::character varying::text) = 4 THEN replace(to_char(sum(geo_objet_fon_lot.surf), 'FM9G999'::text), ','::text, ' '::text) || ' m²'::text
                        WHEN length(sum(geo_objet_fon_lot.surf)::character varying::text) = 5 THEN replace(to_char(sum(geo_objet_fon_lot.surf), 'FM99G999'::text), ','::text, ' '::text) || ' m²'::text
                        WHEN length(sum(geo_objet_fon_lot.surf)::character varying::text) = 6 THEN replace(to_char(sum(geo_objet_fon_lot.surf), 'FM999G999'::text), ','::text, ' '::text) || ' m²'::text
                        WHEN length(sum(geo_objet_fon_lot.surf)::character varying::text) = 7 THEN replace(to_char(sum(geo_objet_fon_lot.surf), 'FM9G999G999'::text), ','::text, ' '::text) || ' m²'::text
                        WHEN length(sum(geo_objet_fon_lot.surf)::character varying::text) = 8 THEN replace(to_char(sum(geo_objet_fon_lot.surf), 'FM99G999G999'::text), ','::text, ' '::text) || ' m²'::text
                        ELSE NULL::text
                    END
                    ELSE '0 m²'::text
                END AS surf_dedie_hab
           FROM m_amenagement.an_amt_lot_habitat,
            m_activite_eco.geo_eco_site,
            r_objet.geo_objet_fon_lot,
            m_amenagement.an_amt_lot_stade,
            m_amenagement.lk_amt_lot_site
          WHERE geo_eco_site.idsite::text = lk_amt_lot_site.idsite::text AND lk_amt_lot_site.idgeolf = geo_objet_fon_lot.idgeolf AND geo_objet_fon_lot.idgeolf = an_amt_lot_habitat.idgeolf AND geo_objet_fon_lot.l_voca::text = '30'::text AND an_amt_lot_stade.idgeolf = geo_objet_fon_lot.idgeolf
          GROUP BY geo_eco_site.idsite
        ), req_m AS (
         SELECT e.idsite,
            string_agg('• '::text || li.nom, '<br>'::text ORDER BY li.eff_etab DESC) AS liste_ent
           FROM m_activite_eco.geo_eco_site e,
            m_activite_eco.xapps_an_vmr_site_act_10 li
          WHERE e.idsite::text = li.idsite::text
          GROUP BY e.idsite
        ), req_p AS (
         SELECT e.idsite,
            string_agg(('<div align=center><img src="https://geo.compiegnois.fr/documents/metiers/eco/doc/site/'::text || m_1.n_fichier) || '" alt="" width=50% heigth=35%></img></div>'::text, '<br>'::text) AS url_photo
           FROM m_activite_eco.geo_eco_site e,
            m_activite_eco.an_eco_media m_1
          WHERE e.idsite::text = m_1.id AND m_1.alaunesite IS TRUE
          GROUP BY e.idsite
         LIMIT 1
        )
 SELECT a.idsite AS "Identifiant du site",
    a.site_nom AS "Libellé du site",
    a.dest AS "Destination du site",
    a.voca AS "Vocation du site",
    a.surf_site AS "Surface du site",
        CASE
            WHEN a.p_implant IS NOT NULL OR a.p_implant::text <> ''::text THEN a.p_implant
            ELSE 'inconnue'::character varying
        END AS "Début de commercialisation",
    m.liste_ent,
    p.url_photo,
    a.dest_lib,
    a.offre_tc,
    a.acces_a,
    a.acces_gare_v,
    a.acces_gare_f,
    a.date_extract AS "Extraction des données le",
        CASE
            WHEN f.nb_etab_sirene::integer >= 0 AND g.nb_etab_spe::integer >= 0 THEN (f.nb_etab_sirene::integer + g.nb_etab_spe::integer)::text
            WHEN f.nb_etab_sirene::integer >= 0 AND g.nb_etab_spe::integer IS NULL THEN f.nb_etab_sirene::text
            WHEN f.nb_etab_sirene::integer IS NULL AND g.nb_etab_spe::integer >= 0 THEN g.nb_etab_spe::text
            ELSE '0'::text
        END AS nb_etab,
        CASE
            WHEN h.eff_globaux_sirene >= 0 AND i.eff_globaux_etabp >= 0 THEN (h.eff_globaux_sirene + i.eff_globaux_etabp)::text
            WHEN h.eff_globaux_sirene >= 0 AND i.eff_globaux_etabp IS NULL THEN h.eff_globaux_sirene::text
            WHEN h.eff_globaux_sirene IS NULL AND i.eff_globaux_etabp >= 0 THEN i.eff_globaux_etabp::text
            ELSE '0'::text
        END AS eff_etab,
        CASE
            WHEN j.surf_dispo_vente IS NOT NULL THEN j.surf_dispo_vente::character varying
            ELSE 'Plus de disponibilités ou m² inconnu'::character varying
        END AS "Surface disponible à la vente",
        CASE
            WHEN k.surf_dedie_act IS NOT NULL THEN k.surf_dedie_act::character varying
            ELSE 'm² inconnu'::character varying
        END AS "Surface dédiée pour des activités",
        CASE
            WHEN k1.surf_reserve_projet IS NOT NULL THEN k1.surf_reserve_projet::character varying
            ELSE 'm² inconnu'::character varying
        END AS "Surface réservée pour des projets en cours",
        CASE
            WHEN j.surf_utile_vente IS NOT NULL THEN j.surf_utile_vente
            ELSE 0::bigint
        END +
        CASE
            WHEN k.surf_utile_act IS NOT NULL THEN k.surf_utile_act
            ELSE 0::bigint
        END +
        CASE
            WHEN k1.surf_utile_projet IS NOT NULL THEN k1.surf_utile_projet
            ELSE 0::bigint
        END AS surf_utile,
        CASE
            WHEN j.surf_utile_vente IS NOT NULL THEN j.surf_utile_vente
            ELSE 0::bigint
        END AS surf_vente,
        CASE
            WHEN k1.surf_utile_projet IS NOT NULL THEN k1.surf_utile_projet
            ELSE 0::bigint
        END AS surf_projet,
        CASE
            WHEN k2.surf_dedie_equ IS NOT NULL THEN k2.surf_dedie_equ::character varying
            ELSE 'm² inconnu'::character varying
        END AS "Surface dédiée pour des équipements",
        CASE
            WHEN k3.surf_dedie_mixte IS NOT NULL THEN k3.surf_dedie_mixte::character varying
            ELSE 'm² inconnu'::character varying
        END AS "Surface dédiée en mixité (économie/habitat)",
        CASE
            WHEN k4.surf_dedie_esppu IS NOT NULL THEN k4.surf_dedie_esppu::character varying
            ELSE 'm² inconnu'::character varying
        END AS "Surface dédiée pour espace public",
        CASE
            WHEN k5.surf_dedie_divers IS NOT NULL THEN k5.surf_dedie_divers::character varying
            ELSE 'm² inconnu'::character varying
        END AS "Surface dédiée en divers",
        CASE
            WHEN k6.surf_dedie_hab IS NOT NULL THEN k6.surf_dedie_hab::character varying
            ELSE 'm² inconnu'::character varying
        END AS "Surface dédiée en habitat",
    a.epci
   FROM req_a a
     LEFT JOIN req_f f ON a.idsite::text = f.idsite::text
     LEFT JOIN req_g g ON a.idsite::text = g.idsite::text
     LEFT JOIN req_h h ON a.idsite::text = h.idsite::text
     LEFT JOIN req_i i ON a.idsite::text = i.idsite::text
     LEFT JOIN req_j j ON a.idsite::text = j.idsite::text
     LEFT JOIN req_k k ON a.idsite::text = k.idsite::text
     LEFT JOIN req_k1 k1 ON a.idsite::text = k1.idsite::text
     LEFT JOIN req_k2 k2 ON a.idsite::text = k2.idsite::text
     LEFT JOIN req_k3 k3 ON a.idsite::text = k3.idsite::text
     LEFT JOIN req_k4 k4 ON a.idsite::text = k4.idsite::text
     LEFT JOIN req_k5 k5 ON a.idsite::text = k5.idsite::text
     LEFT JOIN req_k6 k6 ON a.idsite::text = k6.idsite::text
     LEFT JOIN req_m m ON a.idsite::text = m.idsite::text
     LEFT JOIN req_p p ON a.idsite::text = p.idsite::text;

COMMENT ON VIEW m_activite_eco.xapps_an_v_synt_site_act_api IS 'Vue présentant les données de synthèses à l''échelle du site d''activité  (données sur l''environnement économique et statistiques foncières présentes sur le fiche d''information du site dans l''application métier GEO). Cette vue est rafraichie toutes les nuits par une tache CRON sur le serveur sig-sgbd.';



-- ########################################################### SCHEMA m_activite_eco ################################################################

-- ##################################################### xapps_geo_v_eco_epci_tab #####################################################################

-- View: m_activite_eco.xapps_geo_v_eco_epci_tab

-- DROP VIEW m_activite_eco.xapps_geo_v_eco_epci_tab;

CREATE OR REPLACE VIEW m_activite_eco.xapps_geo_v_eco_epci_tab
 AS
 WITH req_epci AS (
         SELECT geo_vm_osm_epci_grdc.cepci,
            geo_vm_osm_epci_grdc.lib_epci,
                CASE
                    WHEN geo_vm_osm_epci_grdc.cepci::text = '200067965'::text THEN 'arc'::text
                    WHEN geo_vm_osm_epci_grdc.cepci::text = '246000749'::text THEN 'cclo'::text
                    WHEN geo_vm_osm_epci_grdc.cepci::text = '246000772'::text THEN 'cc2v'::text
                    WHEN geo_vm_osm_epci_grdc.cepci::text = '246000897'::text THEN 'ccpe'::text
                    ELSE NULL::text
                END AS nom_epci,
                CASE
                    WHEN geo_vm_osm_epci_grdc.cepci::text = '200067965'::text THEN 'https://websigoval.oiselavallee.org/adws/app/bd77fdb2-4d07-11ec-b66d-b90bbf118374/index.html'::text
                    WHEN geo_vm_osm_epci_grdc.cepci::text = '246000749'::text THEN 'https://websigoval.oiselavallee.org/adws/app/c3f2c215-4d0e-11ec-b66d-b90bbf118374/index.html'::text
                    WHEN geo_vm_osm_epci_grdc.cepci::text = '246000772'::text THEN 'https://websigoval.oiselavallee.org/adws/app/594fbf03-4d0b-11ec-b66d-b90bbf118374/index.html'::text
                    WHEN geo_vm_osm_epci_grdc.cepci::text = '246000897'::text THEN 'https://websigoval.oiselavallee.org/adws/app/bab8d623-4d0a-11ec-b66d-b90bbf118374/index.html'::text
                    ELSE NULL::text
                END AS url_olv
           FROM r_osm.geo_vm_osm_epci_grdc
        ), req_site AS (
         SELECT
                CASE
                    WHEN e_1.cepci::text = '200067965'::text THEN 'arc'::text
                    WHEN e_1.cepci::text = '246000749'::text THEN 'cclo'::text
                    WHEN e_1.cepci::text = '246000772'::text THEN 'cc2v'::text
                    WHEN e_1.cepci::text = '246000897'::text THEN 'ccpe'::text
                    ELSE NULL::text
                END AS nom_epci,
            count(*) AS nb_site,
            round(sum(s_1.surf_brt)::numeric / 10000::numeric, 0) AS surf_tot_site
           FROM m_activite_eco.geo_eco_site s_1,
            r_osm.geo_vm_osm_epci_grdc e_1
          WHERE st_intersects(st_pointonsurface(s_1.geom), e_1.geom) IS TRUE
          GROUP BY e_1.cepci
        ), req_zae AS (
         SELECT
                CASE
                    WHEN e_1.cepci::text = '200067965'::text THEN 'arc'::text
                    WHEN e_1.cepci::text = '246000749'::text THEN 'cclo'::text
                    WHEN e_1.cepci::text = '246000772'::text THEN 'cc2v'::text
                    WHEN e_1.cepci::text = '246000897'::text THEN 'ccpe'::text
                    ELSE NULL::text
                END AS nom_epci,
            count(*) AS nb_zae
           FROM m_activite_eco.geo_eco_site s_1,
            r_osm.geo_vm_osm_epci_grdc e_1
          WHERE st_intersects(st_pointonsurface(s_1.geom), e_1.geom) IS TRUE AND s_1.typsite::text = '10'::text
          GROUP BY e_1.cepci
        ), req_horszae AS (
         SELECT
                CASE
                    WHEN e_1.cepci::text = '200067965'::text THEN 'arc'::text
                    WHEN e_1.cepci::text = '246000749'::text THEN 'cclo'::text
                    WHEN e_1.cepci::text = '246000772'::text THEN 'cc2v'::text
                    WHEN e_1.cepci::text = '246000897'::text THEN 'ccpe'::text
                    ELSE NULL::text
                END AS nom_epci,
            count(*) AS nb_horszae
           FROM m_activite_eco.geo_eco_site s_1,
            r_osm.geo_vm_osm_epci_grdc e_1
          WHERE st_intersects(st_pointonsurface(s_1.geom), e_1.geom) IS TRUE AND s_1.typsite::text = '20'::text
          GROUP BY e_1.cepci
        ), req_autresite AS (
         SELECT
                CASE
                    WHEN e_1.cepci::text = '200067965'::text THEN 'arc'::text
                    WHEN e_1.cepci::text = '246000749'::text THEN 'cclo'::text
                    WHEN e_1.cepci::text = '246000772'::text THEN 'cc2v'::text
                    WHEN e_1.cepci::text = '246000897'::text THEN 'ccpe'::text
                    ELSE NULL::text
                END AS nom_epci,
            count(*) AS nb_autresite
           FROM m_activite_eco.geo_eco_site s_1,
            r_osm.geo_vm_osm_epci_grdc e_1
          WHERE st_intersects(st_pointonsurface(s_1.geom), e_1.geom) IS TRUE AND s_1.typsite::text = '30'::text
          GROUP BY e_1.cepci
        ), req_enveco_site AS (
         SELECT
                CASE
                    WHEN e_1.cepci::text = '200067965'::text THEN 'arc'::text
                    WHEN e_1.cepci::text = '246000749'::text THEN 'cclo'::text
                    WHEN e_1.cepci::text = '246000772'::text THEN 'cc2v'::text
                    WHEN e_1.cepci::text = '246000897'::text THEN 'ccpe'::text
                    ELSE NULL::text
                END AS nom_epci,
            sum(ss.nb_etab::integer) AS nb_entreprise,
            sum(ss.eff_etab::integer) AS nb_emploi
           FROM m_activite_eco.geo_eco_site s_1,
            r_osm.geo_vm_osm_epci_grdc e_1,
            m_activite_eco.xapps_an_v_synt_site_act_api ss
          WHERE ss."Identifiant du site"::text = s_1.idsite::text AND st_intersects(st_pointonsurface(s_1.geom), e_1.geom) IS TRUE AND (s_1.typsite::text = '10'::text OR s_1.typsite::text = '20'::text)
          GROUP BY e_1.cepci
        ), req_enveco_zae AS (
         SELECT
                CASE
                    WHEN e_1.cepci::text = '200067965'::text THEN 'arc'::text
                    WHEN e_1.cepci::text = '246000749'::text THEN 'cclo'::text
                    WHEN e_1.cepci::text = '246000772'::text THEN 'cc2v'::text
                    WHEN e_1.cepci::text = '246000897'::text THEN 'ccpe'::text
                    ELSE NULL::text
                END AS nom_epci,
            sum(ss.nb_etab::integer) AS nb_entreprise_zae,
            sum(ss.eff_etab::integer) AS nb_emploi_zae
           FROM m_activite_eco.geo_eco_site s_1,
            r_osm.geo_vm_osm_epci_grdc e_1,
            m_activite_eco.xapps_an_v_synt_site_act_api ss
          WHERE ss."Identifiant du site"::text = s_1.idsite::text AND st_intersects(st_pointonsurface(s_1.geom), e_1.geom) IS TRUE AND s_1.typsite::text = '10'::text
          GROUP BY e_1.cepci
        ), req_enveco_horszae AS (
         SELECT
                CASE
                    WHEN e_1.cepci::text = '200067965'::text THEN 'arc'::text
                    WHEN e_1.cepci::text = '246000749'::text THEN 'cclo'::text
                    WHEN e_1.cepci::text = '246000772'::text THEN 'cc2v'::text
                    WHEN e_1.cepci::text = '246000897'::text THEN 'ccpe'::text
                    ELSE NULL::text
                END AS nom_epci,
            sum(ss.nb_etab::integer) AS nb_entreprise_horszae,
            sum(ss.eff_etab::integer) AS nb_emploi_horszae
           FROM m_activite_eco.geo_eco_site s_1,
            r_osm.geo_vm_osm_epci_grdc e_1,
            m_activite_eco.xapps_an_v_synt_site_act_api ss
          WHERE ss."Identifiant du site"::text = s_1.idsite::text AND st_intersects(st_pointonsurface(s_1.geom), e_1.geom) IS TRUE AND s_1.typsite::text = '20'::text
          GROUP BY e_1.cepci
        ), req_enveco_envente AS (
         SELECT
                CASE
                    WHEN e_1.cepci::text = '200067965'::text THEN 'arc'::text
                    WHEN e_1.cepci::text = '246000749'::text THEN 'cclo'::text
                    WHEN e_1.cepci::text = '246000772'::text THEN 'cc2v'::text
                    WHEN e_1.cepci::text = '246000897'::text THEN 'ccpe'::text
                    ELSE NULL::text
                END AS nom_epci,
            sum(o.surf) AS lot_envente
           FROM m_activite_eco.geo_eco_site s_1,
            r_osm.geo_vm_osm_epci_grdc e_1,
            r_objet.geo_objet_fon_lot o,
            m_activite_eco.an_eco_lot l,
            m_amenagement.an_amt_lot_stade sa_1,
            m_amenagement.lk_amt_lot_site lkl
          WHERE s_1.idsite::text = lkl.idsite::text AND lkl.idgeolf = l.idgeolf AND sa_1.idgeolf = l.idgeolf AND o.idgeolf = l.idgeolf AND st_intersects(st_pointonsurface(s_1.geom), e_1.geom) IS TRUE AND (sa_1.l_comm2::text = ANY (ARRAY['11'::character varying::text, '12'::character varying::text])) AND o.l_voca::text = '20'::text
          GROUP BY e_1.cepci
        ), req_enveco_vendu AS (
         SELECT
                CASE
                    WHEN e_1.cepci::text = '200067965'::text THEN 'arc'::text
                    WHEN e_1.cepci::text = '246000749'::text THEN 'cclo'::text
                    WHEN e_1.cepci::text = '246000772'::text THEN 'cc2v'::text
                    WHEN e_1.cepci::text = '246000897'::text THEN 'ccpe'::text
                    ELSE NULL::text
                END AS nom_epci,
            sum(o.surf) AS lot_vendu
           FROM m_activite_eco.geo_eco_site s_1,
            r_osm.geo_vm_osm_epci_grdc e_1,
            r_objet.geo_objet_fon_lot o,
            m_activite_eco.an_eco_lot l,
            m_amenagement.an_amt_lot_stade sa_1,
            m_amenagement.lk_amt_lot_site lkl
          WHERE s_1.idsite::text = lkl.idsite::text AND lkl.idgeolf = l.idgeolf AND sa_1.idgeolf = l.idgeolf AND o.idgeolf = l.idgeolf AND st_intersects(st_pointonsurface(s_1.geom), e_1.geom) IS TRUE AND sa_1.l_comm2::text = '20'::text AND o.l_voca::text = '20'::text
          GROUP BY e_1.cepci
        ), req_enveco_reserve AS (
         SELECT
                CASE
                    WHEN e_1.cepci::text = '200067965'::text THEN 'arc'::text
                    WHEN e_1.cepci::text = '246000749'::text THEN 'cclo'::text
                    WHEN e_1.cepci::text = '246000772'::text THEN 'cc2v'::text
                    WHEN e_1.cepci::text = '246000897'::text THEN 'ccpe'::text
                    ELSE NULL::text
                END AS nom_epci,
            sum(o.surf) AS lot_reserve
           FROM m_activite_eco.geo_eco_site s_1,
            r_osm.geo_vm_osm_epci_grdc e_1,
            r_objet.geo_objet_fon_lot o,
            m_activite_eco.an_eco_lot l,
            m_amenagement.an_amt_lot_stade sa_1,
            m_amenagement.lk_amt_lot_site lkl
          WHERE s_1.idsite::text = lkl.idsite::text AND lkl.idgeolf = l.idgeolf AND sa_1.idgeolf = l.idgeolf AND o.idgeolf = l.idgeolf AND st_intersects(st_pointonsurface(s_1.geom), e_1.geom) IS TRUE AND (sa_1.l_comm2::text = ANY (ARRAY['31'::character varying::text, '32'::character varying::text])) AND o.l_voca::text = '20'::text
          GROUP BY e_1.cepci
        ), req_enveco_noncom AS (
         SELECT
                CASE
                    WHEN e_1.cepci::text = '200067965'::text THEN 'arc'::text
                    WHEN e_1.cepci::text = '246000749'::text THEN 'cclo'::text
                    WHEN e_1.cepci::text = '246000772'::text THEN 'cc2v'::text
                    WHEN e_1.cepci::text = '246000897'::text THEN 'ccpe'::text
                    ELSE NULL::text
                END AS nom_epci,
            sum(o.surf) AS lot_noncom
           FROM m_activite_eco.geo_eco_site s_1,
            r_osm.geo_vm_osm_epci_grdc e_1,
            r_objet.geo_objet_fon_lot o,
            m_activite_eco.an_eco_lot l,
            m_amenagement.an_amt_lot_stade sa_1,
            m_amenagement.lk_amt_lot_site lkl
          WHERE s_1.idsite::text = lkl.idsite::text AND lkl.idgeolf = l.idgeolf AND sa_1.idgeolf = l.idgeolf AND o.idgeolf = l.idgeolf AND st_intersects(st_pointonsurface(s_1.geom), e_1.geom) IS TRUE AND sa_1.l_comm2::text = '99'::text
          GROUP BY e_1.cepci
        ), req_enveco_nr AS (
         SELECT
                CASE
                    WHEN e_1.cepci::text = '200067965'::text THEN 'arc'::text
                    WHEN e_1.cepci::text = '246000749'::text THEN 'cclo'::text
                    WHEN e_1.cepci::text = '246000772'::text THEN 'cc2v'::text
                    WHEN e_1.cepci::text = '246000897'::text THEN 'ccpe'::text
                    ELSE NULL::text
                END AS nom_epci,
            sum(o.surf) AS lot_nr
           FROM m_activite_eco.geo_eco_site s_1,
            r_osm.geo_vm_osm_epci_grdc e_1,
            r_objet.geo_objet_fon_lot o,
            m_activite_eco.an_eco_lot l,
            m_amenagement.an_amt_lot_stade sa_1,
            m_amenagement.lk_amt_lot_site lkl
          WHERE s_1.idsite::text = lkl.idsite::text AND lkl.idgeolf = l.idgeolf AND sa_1.idgeolf = l.idgeolf AND o.idgeolf = l.idgeolf AND st_intersects(st_pointonsurface(s_1.geom), e_1.geom) IS TRUE AND sa_1.l_comm2::text = '00'::text
          GROUP BY e_1.cepci
        )
 SELECT e.cepci,
    e.lib_epci,
    e.nom_epci,
    e.url_olv,
    s.nb_site,
    s.surf_tot_site,
        CASE
            WHEN z.nb_zae IS NULL THEN 0::bigint
            ELSE z.nb_zae
        END AS nb_zae,
        CASE
            WHEN hz.nb_horszae IS NULL THEN 0::bigint
            ELSE hz.nb_horszae
        END AS nb_horszae,
        CASE
            WHEN sa.nb_autresite IS NULL THEN 0::bigint
            ELSE sa.nb_autresite
        END AS nb_autresite,
        CASE
            WHEN env.nb_emploi IS NULL THEN 0::bigint
            ELSE env.nb_emploi
        END AS nb_emploi,
        CASE
            WHEN env.nb_entreprise IS NULL THEN 0::bigint
            ELSE env.nb_entreprise
        END AS nb_entreprise,
        CASE
            WHEN env1.nb_emploi_zae IS NULL THEN 0::bigint
            ELSE env1.nb_emploi_zae
        END AS nb_emploi_zae,
        CASE
            WHEN env1.nb_entreprise_zae IS NULL THEN 0::bigint
            ELSE env1.nb_entreprise_zae
        END AS nb_entreprise_zae,
        CASE
            WHEN env2.nb_emploi_horszae IS NULL THEN 0::bigint
            ELSE env2.nb_emploi_horszae
        END AS nb_emploi_horszae,
        CASE
            WHEN env2.nb_entreprise_horszae IS NULL THEN 0::bigint
            ELSE env2.nb_entreprise_horszae
        END AS nb_entreprise_horszae,
        CASE
            WHEN cev.lot_envente IS NULL THEN 0::bigint
            ELSE cev.lot_envente
        END AS lot_envente,
        CASE
            WHEN cv.lot_vendu IS NULL THEN 0::bigint
            ELSE cv.lot_vendu
        END AS lot_vendu,
        CASE
            WHEN cr.lot_reserve IS NULL THEN 0::bigint
            ELSE cr.lot_reserve
        END AS lot_reserve,
        CASE
            WHEN cnm.lot_noncom IS NULL THEN 0::bigint
            ELSE cnm.lot_noncom
        END AS lot_noncom,
        CASE
            WHEN cnr.lot_nr IS NULL THEN 0::bigint
            ELSE cnr.lot_nr
        END AS lot_nr
   FROM req_epci e
     LEFT JOIN req_site s ON e.nom_epci = s.nom_epci
     LEFT JOIN req_zae z ON e.nom_epci = z.nom_epci
     LEFT JOIN req_horszae hz ON e.nom_epci = hz.nom_epci
     LEFT JOIN req_autresite sa ON e.nom_epci = sa.nom_epci
     LEFT JOIN req_enveco_site env ON e.nom_epci = env.nom_epci
     LEFT JOIN req_enveco_zae env1 ON e.nom_epci = env1.nom_epci
     LEFT JOIN req_enveco_horszae env2 ON e.nom_epci = env2.nom_epci
     LEFT JOIN req_enveco_envente cev ON e.nom_epci = cev.nom_epci
     LEFT JOIN req_enveco_vendu cv ON e.nom_epci = cv.nom_epci
     LEFT JOIN req_enveco_reserve cr ON e.nom_epci = cr.nom_epci
     LEFT JOIN req_enveco_noncom cnm ON e.nom_epci = cnm.nom_epci
     LEFT JOIN req_enveco_nr cnr ON e.nom_epci = cnr.nom_epci;


COMMENT ON VIEW m_activite_eco.xapps_geo_v_eco_epci_tab
    IS 'Vue alphanumérique ddes indicateurs EPCI pour tableau de bord synthétique n°1 dans GEO';

-- ########################################################### SCHEMA m_activite_eco ################################################################

-- ##################################################### xapps_geo_v_eco_loc_dispo #####################################################################

-- View: m_activite_eco.xapps_geo_v_eco_loc_dispo

-- DROP VIEW m_activite_eco.xapps_geo_v_eco_loc_dispo;

CREATE OR REPLACE VIEW m_activite_eco.xapps_geo_v_eco_loc_dispo
 AS
 SELECT row_number() OVER () AS gid,
    lo.id,
    a.idloc,
        CASE
            WHEN lo.occup::text = ANY (ARRAY['10'::character varying::text, '11'::character varying::text, '30'::character varying::text, '31'::character varying::text]) THEN 'En vente'::character varying
            WHEN lo.occup::text = ANY (ARRAY['20'::character varying::text, '21'::character varying::text, '30'::character varying::text, '31'::character varying::text]) THEN 'En location'::character varying
            ELSE l.valeur
        END AS affiche_dispo_fiche_bien,
    l1.valeur AS occupation,
    a.lib_bati,
        CASE
            WHEN lo.libelle IS NOT NULL OR lo.libelle::text <> ''::text THEN lo.libelle
            ELSE ''::character varying
        END AS libelle,
        CASE
            WHEN lo.surf_p IS NOT NULL THEN lo.surf_p::text
            ELSE ' - '::text
        END || 'm²'::text AS surface,
        CASE
            WHEN lo.loyer IS NOT NULL THEN lo.loyer::text
            ELSE ' - '::text
        END || '€'::text AS loyer,
        CASE
            WHEN lo.loyerm2 IS NOT NULL THEN lo.loyerm2::text
            ELSE ' - '::text
        END || '€'::text AS loyerm2,
        CASE
            WHEN lo.pvente IS NOT NULL THEN lo.pvente::text
            ELSE ' - '::text
        END || '€'::text AS pvente,
    lo.descript,
    ('<b>'::text || (( SELECT string_agg(s.site_nom::text, chr(10)) AS string_agg
           FROM m_activite_eco.geo_eco_site s,
            m_activite_eco.lk_eco_loc_site rels
          WHERE s.idsite::text = rels.idsite::text AND rels.idloc::text = a.idloc::text))) || '</b>'::text AS site,
    ( SELECT string_agg(s.idsite::text, ','::text) AS string_agg
           FROM m_activite_eco.geo_eco_site s,
            m_activite_eco.lk_eco_loc_site rels
          WHERE s.idsite::text = rels.idsite::text AND rels.idloc::text = a.idloc::text) AS idsite,
        CASE
            WHEN lo.occup::text = ANY (ARRAY['10'::character varying::text, '11'::character varying::text, '30'::character varying::text, '31'::character varying::text]) THEN lo.libelle::text || ' - en vente'::text
            WHEN lo.occup::text = ANY (ARRAY['20'::character varying::text, '21'::character varying::text, '30'::character varying::text, '31'::character varying::text]) THEN lo.libelle::text || ' - en location'::text
            ELSE (lo.libelle::text || ' - '::text) || ((( SELECT lt_eco_occuploc.valeur
               FROM m_activite_eco.lt_eco_occuploc
              WHERE lt_eco_occuploc.code::text = lo.occup::text))::text)
        END AS affiche_dispo,
    a.commune,
    a.typ1,
    a.epci,
    a.adresse_a,
    st_buffer(a.geom, 6::double precision) AS geom
   FROM m_activite_eco.geo_eco_loc_act a
     LEFT JOIN m_activite_eco.an_eco_loc_act lo ON lo.idloc::text = a.idloc::text
     JOIN m_activite_eco.lt_eco_occuploc l ON lo.occup::text = l.code::text
     JOIN m_activite_eco.lt_eco_typoccup l1 ON lo.typ2::text = l1.code::text
  WHERE lo.occup::text = ANY (ARRAY['10'::character varying::text, '11'::character varying::text, '20'::character varying::text, '21'::character varying::text, '30'::character varying::text, '31'::character varying::text]);

COMMENT ON VIEW m_activite_eco.xapps_geo_v_eco_loc_dispo
    IS 'Vue géographique recensant l''ensemble des locaux disponibles';

-- ########################################################### SCHEMA m_activite_eco ################################################################

-- ##################################################### xapps_geo_v_etab_compte_naf #####################################################################

-- View: m_activite_eco.xapps_geo_v_etab_compte_naf

-- DROP VIEW m_activite_eco.xapps_geo_v_etab_compte_naf;

CREATE OR REPLACE VIEW m_activite_eco.xapps_geo_v_etab_compte_naf
 AS
 SELECT s.siret,
    replace(s.nom_etab_geo::text, '<br>'::text, chr(10)) AS nom_etab,
    n.code AS naf,
    n.valeur AS lib_naf,
    a.geom
   FROM s_sirene.an_etablissement_api s,
    m_activite_eco.lk_adresseetablissement lk,
    m_activite_eco.an_eco_etab e,
    x_apps.xapps_geo_vmr_adresse a,
    s_sirene.lt_nafrev2 n
  WHERE e.l_compte = true AND s.siret::text = lk.siret::text AND s.siret::text = e.idsiret::text AND a.id_adresse = lk.idadresse AND n.code::text = s.activiteprincipaleetablissement::text;


COMMENT ON VIEW m_activite_eco.xapps_geo_v_etab_compte_naf
    IS 'Vue géographique localisant les établissements SIRENE comptabilisés à l''adresse';

-- ########################################################### SCHEMA m_activite_eco ################################################################

-- ##################################################### xapps_geo_v_zae #####################################################################

-- View: m_activite_eco.xapps_geo_v_zae

-- DROP VIEW m_activite_eco.xapps_geo_v_zae;

CREATE OR REPLACE VIEW m_activite_eco.xapps_geo_v_zae
 AS
 SELECT geo_eco_site.idsite,
    geo_eco_site.idsitereg,
    geo_eco_site.idpole,
    geo_eco_site.site_nom,
    geo_eco_site.site_voca,
    geo_eco_site.site_etat,
    geo_eco_site.typsite,
    geo_eco_site.typo,
    geo_eco_site.dest,
    geo_eco_site.dest_autre,
    geo_eco_site.date_crea,
    geo_eco_site.p_implant,
    geo_eco_site.commune,
    geo_eco_site.z_proced,
    geo_eco_site.surf_brt,
    geo_eco_site.z_mai_ouvr,
    geo_eco_site.z_compet,
    geo_eco_site.z_amng,
    geo_eco_site.z_gest,
    geo_eco_site.z_anim,
    geo_eco_site.z_comm,
    geo_eco_site.z_cession,
    geo_eco_site.z_env,
    geo_eco_site.z_paysage,
    geo_eco_site.z_rehab,
    geo_eco_site.z_epu,
    geo_eco_site.z_dechet,
    geo_eco_site.z_tr_slect,
    geo_eco_site.res_ass,
    geo_eco_site.res_pluvia,
    geo_eco_site.res_eau,
    geo_eco_site.res_gaz,
    geo_eco_site.res_elect,
    geo_eco_site.res_fibre,
    geo_eco_site.res_autre,
    geo_eco_site.z_auto,
    geo_eco_site.d_auto,
    geo_eco_site.z_dst_auto,
    geo_eco_site.z_tps_auto,
    geo_eco_site.z_ar_f,
    geo_eco_site.z_dst_ar_f,
    geo_eco_site.z_ar_v,
    geo_eco_site.z_dst_ar_v,
    geo_eco_site.z_fr_f,
    geo_eco_site.z_dst_fr_f,
    geo_eco_site.z_fr_v,
    geo_eco_site.z_dst_fr_v,
    geo_eco_site.z_pmm,
    geo_eco_site.z_dst_pmm,
    geo_eco_site.serv_tc,
    geo_eco_site.serv_tc_nb,
    geo_eco_site.serv_tc_fr,
    geo_eco_site.serv_tc_g,
    geo_eco_site.circ_douce,
    geo_eco_site.serv_rest,
    geo_eco_site.serv_rest_nb,
    geo_eco_site.serv_crech,
    geo_eco_site.serv_crech_nb,
    geo_eco_site.serv_autre,
    geo_eco_site.z_aide_pb,
    geo_eco_site.src_geom,
    geo_eco_site.src_date,
    geo_eco_site.date_sai,
    geo_eco_site.date_maj,
    geo_eco_site.op_sai,
    geo_eco_site.op_maj,
    geo_eco_site.epci,
    geo_eco_site.observ,
    geo_eco_site.geom,
    geo_eco_site.geom1
   FROM m_activite_eco.geo_eco_site
  WHERE geo_eco_site.typsite::text = '10'::text;

COMMENT ON VIEW m_activite_eco.xapps_geo_v_zae
    IS 'Vue géographique des ZAE uniquement (zone d''activités économiques de compétence intercommunale), permet d''exporter un shape pour l''open data et d''être utilisé dans les applications ou carte';


-- ########################################################### SCHEMA m_activite_eco ################################################################

-- ##################################################### xapps_an_vmr_evo_site_act_api #####################################################################

-- View: m_activite_eco.xapps_an_vmr_evo_site_act_api

-- DROP MATERIALIZED VIEW m_activite_eco.xapps_an_vmr_evo_site_act_api;

CREATE MATERIALIZED VIEW m_activite_eco.xapps_an_vmr_evo_site_act_api
TABLESPACE pg_default
AS
 SELECT h_an_eco_site_emploi.idsite,
    h_an_eco_site_emploi.annee_h AS annee,
    h_an_eco_site_emploi.eff_etab,
    h_an_eco_site_emploi.nb_etab
   FROM m_activite_eco.h_an_eco_site_emploi
  ORDER BY h_an_eco_site_emploi.idsite, h_an_eco_site_emploi.annee_h
WITH DATA;

COMMENT ON MATERIALIZED VIEW m_activite_eco.xapps_an_vmr_evo_site_act_api
    IS 'Vue matérialisée présentant les données d''évolution des emplois et des établissements à l''échelle du site d''activité pour le graphique d''évolution dans GEO';

-- ########################################################### SCHEMA m_activite_eco ################################################################

-- ##################################################### xapps_an_vmr_site_act_10 #####################################################################

-- View: m_activite_eco.xapps_an_vmr_site_act_10

-- DROP MATERIALIZED VIEW m_activite_eco.xapps_an_vmr_site_act_10;

CREATE MATERIALIZED VIEW m_activite_eco.xapps_an_vmr_site_act_10
TABLESPACE pg_default
AS
 WITH req_t AS (
         WITH req_ul AS (
                 SELECT DISTINCT u_1.siren,
                    u_1.denominationunitelegale,
                    u_1.denominationusuelle1unitelegale,
                    u_1.nomunitelegale,
                    u_1.prenom1unitelegale
                   FROM s_sirene.an_unitelegale_api u_1
                )
         SELECT si.idsite,
            row_number() OVER (PARTITION BY si.idsite ORDER BY e.eff_etab DESC) AS liste,
                CASE
                    WHEN length(e.l_nom::text) > 0 THEN e.l_nom
                    WHEN length(s.denominationusuelleetablissement::text) > 0 THEN s.denominationusuelleetablissement
                    WHEN length(u.denominationunitelegale::text) > 0 THEN u.denominationunitelegale
                    WHEN length(u.denominationusuelle1unitelegale::text) > 0 THEN u.denominationusuelle1unitelegale
                    WHEN length(u.nomunitelegale::text) > 0 AND length(u.prenom1unitelegale::text) > 0 THEN (u.nomunitelegale::text || u.prenom1unitelegale::text)::character varying
                    ELSE NULL::character varying
                END::text ||
                CASE
                    WHEN length(s.enseigne1etablissement::text) > 0 AND s.enseigne1etablissement::text <>
                    CASE
                        WHEN length(e.l_nom::text) > 0 THEN e.l_nom
                        WHEN length(s.denominationusuelleetablissement::text) > 0 THEN s.denominationusuelleetablissement
                        WHEN length(u.denominationunitelegale::text) > 0 THEN u.denominationunitelegale
                        WHEN length(u.denominationusuelle1unitelegale::text) > 0 THEN u.denominationusuelle1unitelegale
                        WHEN length(u.nomunitelegale::text) > 0 AND length(u.prenom1unitelegale::text) > 0 THEN (u.nomunitelegale::text || u.prenom1unitelegale::text)::character varying
                        ELSE NULL::character varying
                    END::text THEN ', '::text || s.enseigne1etablissement::text
                    ELSE ''::text
                END AS nom,
            e.eff_etab,
                CASE
                    WHEN e.source_eff::text = 'SIRENE'::text THEN 'Insee (SIRENE)'::character varying
                    ELSE 'ARC'::character varying
                END AS source_eff
           FROM m_activite_eco.an_eco_etab e,
            m_activite_eco.geo_eco_site si,
            m_activite_eco.lk_eco_etab_site lk,
            s_sirene.an_etablissement_api s,
            req_ul u
          WHERE e.idsiret::text = s.siret::text AND s.siren::text = u.siren::text AND si.idsite::text = lk.idsite::text AND lk.siret::text = e.idsiret::text AND e.l_compte IS TRUE AND e.etatadministratifetablissement::text = 'A'::text AND e.eff_etab > 0
          ORDER BY si.idsite, (row_number() OVER (PARTITION BY si.idsite ORDER BY e.eff_etab DESC)), e.eff_etab DESC
        )
 SELECT row_number() OVER () AS gid,
    t.idsite,
    t.nom,
    t.eff_etab,
    t.source_eff
   FROM req_t t
  WHERE t.liste <= 10
WITH DATA;

COMMENT ON MATERIALIZED VIEW m_activite_eco.xapps_an_vmr_site_act_10
    IS 'Extraction de la liste des 10 premières entreprises en terme d''emplois par site d''activité. Vue matérialisée rafraichie toutes les nuits.';

-- ########################################################### SCHEMA m_activite_eco ################################################################

-- ##################################################### xapps_geo_vmr_etab_api #####################################################################

-- View: m_activite_eco.xapps_geo_vmr_etab_api

-- DROP MATERIALIZED VIEW m_activite_eco.xapps_geo_vmr_etab_api;

CREATE MATERIALIZED VIEW m_activite_eco.xapps_geo_vmr_etab_api
TABLESPACE pg_default
AS
 WITH req_tout_etab AS (
         WITH req_tot AS (
                 WITH req_t AS (
                         SELECT DISTINCT row_number() OVER () AS gid,
                            a_1.id_adresse,
                            a_1.insee,
                            count(*) AS nb_etab_t
                           FROM m_activite_eco.an_eco_etab e,
                            x_apps.xapps_geo_vmr_adresse a_1,
                            m_activite_eco.lk_adresseetablissement l
                          WHERE l.idadresse = a_1.id_adresse AND l.siret::text = e.idsiret::text AND e.etatadministratifetablissement::text = 'A'::text AND e.l_compte IS TRUE
                          GROUP BY a_1.id_adresse, a_1.insee
                        ), req_f AS (
                         SELECT DISTINCT row_number() OVER () AS gid,
                            a_1.id_adresse,
                            a_1.insee,
                            count(*) AS nb_etab_f
                           FROM m_activite_eco.an_eco_etab e,
                            x_apps.xapps_geo_vmr_adresse a_1,
                            m_activite_eco.lk_adresseetablissement l
                          WHERE l.idadresse = a_1.id_adresse AND l.siret::text = e.idsiret::text AND e.etatadministratifetablissement::text = 'A'::text AND e.l_compte IS FALSE
                          GROUP BY a_1.id_adresse, a_1.insee
                        ), req_a AS (
                         SELECT DISTINCT a_1.id_adresse,
                            a_1.insee,
                            count(*) AS nb_etab
                           FROM m_activite_eco.an_eco_etab e,
                            x_apps.xapps_geo_vmr_adresse a_1,
                            m_activite_eco.lk_adresseetablissement l
                          WHERE l.idadresse = a_1.id_adresse AND l.siret::text = e.idsiret::text AND e.etatadministratifetablissement::text = 'A'::text
                          GROUP BY a_1.id_adresse, a_1.insee
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
                    a.insee,
                    a.geom
                   FROM x_apps.xapps_geo_vmr_adresse a
                     LEFT JOIN req_a ON req_a.id_adresse = a.id_adresse
                     LEFT JOIN req_t ON req_t.id_adresse = req_a.id_adresse
                     LEFT JOIN req_f ON req_f.id_adresse = req_a.id_adresse
                ), req_naf AS (
                 SELECT DISTINCT a_1.id_adresse,
                    n.niv1
                   FROM m_activite_eco.an_eco_etab e,
                    x_apps.xapps_geo_vmr_adresse a_1,
                    s_sirene.an_etablissement_api s,
                    m_activite_eco.lk_adresseetablissement l,
                    s_sirene.naf_n5n1 n
                  WHERE l.idadresse = a_1.id_adresse AND l.siret::text = e.idsiret::text AND s.siret::text = e.idsiret::text AND n.niv5::text = s.activiteprincipaleetablissement::text AND s.nomenclatureactiviteprincipaleetablissement::text = 'NAFRev2'::text AND e.etatadministratifetablissement::text = 'A'::text
                  GROUP BY a_1.id_adresse, n.niv1
                  ORDER BY a_1.id_adresse
                ), req_nace AS (
                 SELECT DISTINCT a_1.id_adresse,
                    u.code AS secteur_urssaf,
                    u.valeur AS lib_secteur_urssaf
                   FROM m_activite_eco.an_eco_etab e,
                    x_apps.xapps_geo_vmr_adresse a_1,
                    s_sirene.an_etablissement_api s,
                    m_activite_eco.lk_adresseetablissement l,
                    s_sirene.naf_n5n1 n,
                    s_sirene.naf4_ursaff n4,
                    s_sirene.lt_urssaf u
                  WHERE l.idadresse = a_1.id_adresse AND l.siret::text = e.idsiret::text AND s.siret::text = e.idsiret::text AND n.niv5::text = s.activiteprincipaleetablissement::text AND n.niv4::text = n4.naf4::text AND n4.codengs::text = u.code::text AND s.nomenclatureactiviteprincipaleetablissement::text = 'NAFRev2'::text AND e.etatadministratifetablissement::text = 'A'::text
                  GROUP BY a_1.id_adresse, u.valeur, u.code
                  ORDER BY a_1.id_adresse
                )
         SELECT req_tot.gid,
            req_tot.id_adresse,
            req_tot.lib_adresse,
            req_tot.nb_etab,
            req_tot.nb_etab_t,
            req_tot.nb_etab_f,
            req_tot.etiquette,
            req_tot.angle,
            req_tot.insee,
                CASE
                    WHEN length(string_agg(req_naf.niv1::text, ''::text)) = 1 THEN string_agg(req_naf.niv1::text, ''::text)
                    ELSE 'n.r'::text
                END AS naf5,
                CASE
                    WHEN length(string_agg(req_nace.secteur_urssaf::text, ''::text)) = 2 THEN string_agg(req_nace.secteur_urssaf::text, ''::text)
                    ELSE 'n.r'::text
                END AS secteur_urssaf,
            req_tot.geom
           FROM req_tot
             LEFT JOIN req_naf ON req_tot.id_adresse = req_naf.id_adresse
             LEFT JOIN req_nace ON req_tot.id_adresse = req_nace.id_adresse
          WHERE req_naf.niv1 IS NOT NULL
          GROUP BY req_tot.gid, req_tot.id_adresse, req_tot.lib_adresse, req_tot.nb_etab, req_tot.nb_etab_t, req_tot.nb_etab_f, req_tot.etiquette, req_tot.angle, req_tot.insee, req_tot.geom
        UNION ALL
         SELECT DISTINCT e.idgeoet,
            0 AS id_adresse,
            ''::text AS lib_adresse,
            1 AS nb_etab,
                CASE
                    WHEN e.l_compte IS TRUE THEN 1
                    ELSE NULL::integer
                END AS nb_etab_t,
                CASE
                    WHEN e.l_compte IS FALSE THEN 0
                    ELSE NULL::integer
                END AS nb_etab_f,
            e.nom AS etiquette,
            0 AS angle,
            e.insee,
            '99999'::text AS naf5,
                CASE
                    WHEN lt.code::text = '00'::text OR lt.code IS NULL THEN 'n.r'::character varying
                    ELSE lt.code
                END AS secteur_urssaf,
            e.geom
           FROM m_activite_eco.geo_eco_etabp e
             LEFT JOIN s_sirene.naf_n5n1 n51 ON n51.niv1::text = e.ape::text
             LEFT JOIN s_sirene.naf4_ursaff nace ON n51.niv4::text = nace.naf4::text
             LEFT JOIN s_sirene.lt_urssaf lt ON lt.code::text = nace.codengs::text
        )
 SELECT row_number() OVER () AS gid,
    req_tout_etab.id_adresse,
    req_tout_etab.lib_adresse,
    req_tout_etab.nb_etab,
    req_tout_etab.nb_etab_t,
    req_tout_etab.nb_etab_f,
    req_tout_etab.etiquette,
    req_tout_etab.angle,
    req_tout_etab.insee,
    req_tout_etab.naf5,
    req_tout_etab.secteur_urssaf,
    req_tout_etab.geom
   FROM req_tout_etab
WITH DATA;

COMMENT ON MATERIALIZED VIEW m_activite_eco.xapps_geo_vmr_etab_api
    IS 'Vue matérialisé rafraichit à chaque intégration ou mise à jour de la table lk_adresseetablissement et dénombrant le nombre d''établissement par adresse (lien dans GEO pour avoir la liste des établissements et les modifier) (en cours de refonte suite migration API Sirene)';

CREATE INDEX idx_9801_id_adresse
    ON m_activite_eco.xapps_geo_vmr_etab_api USING btree
    (id_adresse)
    TABLESPACE pg_default;
CREATE INDEX xapps_geo_vmr_etab_api_gid_idx
    ON m_activite_eco.xapps_geo_vmr_etab_api USING btree
    (gid)
    TABLESPACE pg_default;

-- ########################################################### SCHEMA m_activite_eco ################################################################

-- ##################################################### xapps_geo_vmr_etab_api_export_site #####################################################################
-- m_activite_eco.xapps_geo_vmr_etab_api_export_site source

--drop MATERIALIZED VIEW m_activite_eco.xapps_geo_vmr_etab_api_export_site;
CREATE MATERIALIZED VIEW m_activite_eco.xapps_geo_vmr_etab_api_export_site
TABLESPACE pg_default
AS
 WITH req_tot AS (
         WITH req_e AS (
                 SELECT DISTINCT e.idsiret,
                    e.l_nom,
                        CASE
                            WHEN e.eff_etab IS NOT NULL THEN e.eff_etab::character varying
                            ELSE 'n.r'::character varying
                        END AS eff_etab,
                    e.eff_etab_d AS eff_etab_n,
                    e.source_eff,
                    e.l_date_eff,
                    e.annee_eff,
                    e.l_compte,
                    se.site_nom AS site,
                    se.idsite,
                    l.idadresse
                   FROM m_activite_eco.an_eco_etab e
                     LEFT JOIN m_activite_eco.lk_adresseetablissement l ON e.idsiret::text = l.siret::text
                     LEFT JOIN m_activite_eco.lk_eco_etab_site lk ON lk.siret::text = e.idsiret::text
                     LEFT JOIN m_activite_eco.geo_eco_site se ON se.idsite::text = lk.idsite::text
                ), req_c AS (
                 WITH req_contact AS (
                         SELECT e.idsiret,
                            tc.valeur,
                            c.nom,
                            c.tel,
                            c.telp,
                            c.email
                           FROM m_activite_eco.an_eco_etab e,
                            m_activite_eco.an_eco_contact c,
                            m_activite_eco.lk_eco_contact lk,
                            m_activite_eco.lt_eco_typcontact tc
                          WHERE e.idsiret::text = lk.idobjet::text AND lk.idcontact = c.idcontact AND tc.code::text = c.typcontact::text
                        ), req_contact_agg AS (
                         SELECT req_contact.idsiret,
                            array_agg(req_contact.nom) AS noms,
                            array_agg(req_contact.valeur) AS typ_contact,
                            array_agg(req_contact.tel) AS tel,
                            array_agg(req_contact.telp) AS telp,
                            array_agg(req_contact.email) AS email
                           FROM req_contact
                          GROUP BY req_contact.idsiret
                        )
                 SELECT req_contact_agg.idsiret,
                    req_contact_agg.noms[1] AS nom1,
                    req_contact_agg.typ_contact[1] AS typcontact1,
                    req_contact_agg.tel[1] AS tel1,
                    req_contact_agg.telp[1] AS portable1,
                    req_contact_agg.email[1] AS email1,
                    req_contact_agg.noms[2] AS nom2,
                    req_contact_agg.typ_contact[2] AS typcontact2,
                    req_contact_agg.tel[2] AS tel2,
                    req_contact_agg.telp[2] AS portable2,
                    req_contact_agg.email[2] AS email2,
                    req_contact_agg.noms[3] AS nom3,
                    req_contact_agg.typ_contact[3] AS typcontact3,
                    req_contact_agg.tel[3] AS tel3,
                    req_contact_agg.telp[3] AS portable3,
                    req_contact_agg.email[3] AS email3,
                    req_contact_agg.noms[4] AS nom4,
                    req_contact_agg.typ_contact[4] AS typcontact4,
                    req_contact_agg.tel[4] AS tel4,
                    req_contact_agg.telp[4] AS portable4,
                    req_contact_agg.email[4] AS email4,
                    req_contact_agg.noms[5] AS nom5,
                    req_contact_agg.typ_contact[5] AS typcontact5,
                    req_contact_agg.tel[5] AS tel5,
                    req_contact_agg.telp[5] AS portable5,
                    req_contact_agg.email[5] AS email5,
                    req_contact_agg.noms[6] AS nom6,
                    req_contact_agg.typ_contact[6] AS typcontact6,
                    req_contact_agg.tel[6] AS tel6,
                    req_contact_agg.telp[6] AS portable6,
                    req_contact_agg.email[6] AS email6
                   FROM req_contact_agg
                  ORDER BY req_contact_agg.idsiret
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
                    s.enseigne2etablissement,
                    s.enseigne3etablissement,                    
                    s.datecreationetablissement,
                    s.etatadministratifetablissement,
                    s.datederniertraitementetablissement,
                    ul.denominationunitelegale,
                    ul.denominationusuelle1unitelegale,
					ul.denominationusuelle2unitelegale,                    
					ul.denominationusuelle3unitelegale,                    					
                    ul.nomunitelegale,
                    (ul.nomusageunitelegale::text || ' '::text) || ul.prenom1unitelegale::text AS personnephysique,
                    s.nomenclatureactiviteprincipaleetablissement AS nomen_acti_princ,
                    s.activiteprincipaleetablissement AS code_acti_princ,
                        CASE
                            WHEN s.nomenclatureactiviteprincipaleetablissement::text = 'NAFRev2'::text THEN ( SELECT lt_nafrev2.valeur
                               FROM s_sirene.lt_nafrev2
                              WHERE lt_nafrev2.code::text = s.activiteprincipaleetablissement::text)
                            WHEN s.nomenclatureactiviteprincipaleetablissement::text = 'NAFRev1'::text THEN ( SELECT lt_nafrev1.valeur
                               FROM s_sirene.lt_nafrev1
                              WHERE lt_nafrev1.code::text = s.activiteprincipaleetablissement::text)
                            WHEN s.nomenclatureactiviteprincipaleetablissement::text = 'NAP'::text THEN ( SELECT lt_nap.valeur
                               FROM s_sirene.lt_nap
                              WHERE lt_nap.code::text = s.activiteprincipaleetablissement::text)
                            WHEN s.nomenclatureactiviteprincipaleetablissement::text = 'NAF1993'::text THEN ( SELECT lt_naf1993.valeur
                               FROM s_sirene.lt_naf1993
                              WHERE lt_naf1993.code::text = s.activiteprincipaleetablissement::text)
                            ELSE ''::character varying
                        END AS act_princ,
                    cj.valeur AS cate_juri,
                    n1.code AS naf1,
                    s.caractereemployeuretablissement,
                        CASE
                            WHEN r.siren IS NOT NULL THEN 'oui'::text
                            ELSE 'non'::text
                        END AS etab_radie,
                    a.idadresse
                   FROM s_sirene.an_etablissement_api s
                     LEFT JOIN s_sirene.an_unitelegale_api ul ON s.siren::text = ul.siren::text
                     LEFT JOIN s_sirene.lt_catejuri_n3 cj ON cj.code::text = ul.categoriejuridiqueunitelegale::text
                     LEFT JOIN s_sirene.naf_n5n1 n ON n.niv5::text = s.activiteprincipaleetablissement::text
                     LEFT JOIN s_sirene.naf_n1 n1 ON n1.code::text = n.niv1::text
                     LEFT JOIN m_activite_eco.an_eco_etab_rad r ON r.siren::text = "left"(s.siret::text, 9)
                     LEFT JOIN m_activite_eco.lk_adresseetablissement a ON a.siret::text = s.siret::text
                  WHERE s.etatadministratifetablissement::text = 'A'::text
                )
         SELECT DISTINCT e.idsiret,
	        si.denominationusuelleetablissement,
            si.enseigne1etablissement,
            si.enseigne2etablissement,
            si.enseigne3etablissement,
            si.denominationunitelegale,
            si.denominationusuelle1unitelegale,
            si.denominationusuelle2unitelegale,
            si.denominationusuelle3unitelegale,
            si.nomunitelegale,
            si.personnephysique,
            e.l_nom,
            si.nomen_acti_princ,
            si.code_acti_princ,
            si.act_princ,
            si.cate_juri,
            si.naf1,
            si.caractereemployeuretablissement,
            e.eff_etab,
            e.eff_etab_n,
            e.source_eff,
            e.l_date_eff,
            e.annee_eff::character varying AS annee_eff,
            e.l_compte,
            si.etab_radie,
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
            g.insee,
            g.lib_epci AS epci,
            e.site,
            e.idsite,
                CASE
                    WHEN e.idadresse IS NULL OR e.idadresse::text = ''::text THEN 'Etablissement non localisé à l''adresse'::character varying::text
                    ELSE (((((a.etiquette::text || ' '::text) || a.libvoie_c::text) || ' '::text) || a.codepostal::text) || ' '::text) || a.commune::text
                END AS adresse_loc,
                CASE
                    WHEN a.x_l93 IS NOT NULL THEN a.x_l93
                    ELSE ( SELECT round(st_x(c_1.geom1)::numeric, 2) AS round
                       FROM r_osm.geo_osm_commune c_1
                      WHERE c_1.insee::text = si.codecommuneetablissement::text)
                END AS x_l93,
                CASE
                    WHEN a.y_l93 IS NOT NULL THEN a.y_l93
                    ELSE ( SELECT round(st_y(c_1.geom1)::numeric, 2) AS round
                       FROM r_osm.geo_osm_commune c_1
                      WHERE c_1.insee::text = si.codecommuneetablissement::text)
                END AS y_l93,
            c.nom1,
            c.typcontact1,
            c.tel1,
            c.portable1,
            c.email1,
            c.nom2,
            c.typcontact2,
            c.tel2,
            c.portable2,
            c.email2,
            c.nom3,
            c.typcontact3,
            c.tel3,
            c.portable3,
            c.email3,
            c.nom4,
            c.typcontact4,
            c.tel4,
            c.portable4,
            c.email4,
            c.nom5,
            c.typcontact5,
            c.tel5,
            c.portable5,
            c.email5,
            c.nom6,
            c.typcontact6,
            c.tel6,
            c.portable6,
            c.email6,
            a.geom
           FROM req_si si
             JOIN req_e e ON e.idsiret::text = si.siret::text
             LEFT JOIN x_apps.xapps_geo_vmr_adresse a ON si.idadresse = a.id_adresse
             LEFT JOIN r_administratif.an_geo g ON g.insee::text = si.codecommuneetablissement::text
             LEFT JOIN req_c c ON c.idsiret::text = si.siret::text
          WHERE e.l_compte IS TRUE
        UNION ALL
        ( WITH req_tot AS (
                 WITH req_contact AS (
                         SELECT e.idobjet,
                            tc.valeur,
                            c_1.nom,
                            c_1.tel,
                            c_1.telp,
                            c_1.email
                           FROM m_activite_eco.geo_eco_etabp e,
                            m_activite_eco.an_eco_contact c_1,
                            m_activite_eco.lk_eco_contact lk_1,
                            m_activite_eco.lt_eco_typcontact tc
                          WHERE e.idobjet::text = lk_1.idobjet::text AND lk_1.idcontact = c_1.idcontact AND tc.code::text = c_1.typcontact::text
                        ), req_contact_agg AS (
                         SELECT req_contact.idobjet,
                            array_agg(req_contact.nom) AS noms,
                            array_agg(req_contact.valeur) AS typ_contact,
                            array_agg(req_contact.tel) AS tel,
                            array_agg(req_contact.telp) AS telp,
                            array_agg(req_contact.email) AS email
                           FROM req_contact
                          GROUP BY req_contact.idobjet
                        )
                 SELECT req_contact_agg.idobjet,
                    req_contact_agg.noms[1] AS nom1,
                    req_contact_agg.typ_contact[1] AS typcontact1,
                    req_contact_agg.tel[1] AS tel1,
                    req_contact_agg.telp[1] AS portable1,
                    req_contact_agg.email[1] AS email1,
                    req_contact_agg.noms[2] AS nom2,
                    req_contact_agg.typ_contact[2] AS typcontact2,
                    req_contact_agg.tel[2] AS tel2,
                    req_contact_agg.telp[2] AS portable2,
                    req_contact_agg.email[2] AS email2,
                    req_contact_agg.noms[3] AS nom3,
                    req_contact_agg.typ_contact[3] AS typcontact3,
                    req_contact_agg.tel[3] AS tel3,
                    req_contact_agg.telp[3] AS portable3,
                    req_contact_agg.email[3] AS email3,
                    req_contact_agg.noms[4] AS nom4,
                    req_contact_agg.typ_contact[4] AS typcontact4,
                    req_contact_agg.tel[4] AS tel4,
                    req_contact_agg.telp[4] AS portable4,
                    req_contact_agg.email[4] AS email4,
                    req_contact_agg.noms[5] AS nom5,
                    req_contact_agg.typ_contact[5] AS typcontact5,
                    req_contact_agg.tel[5] AS tel5,
                    req_contact_agg.telp[5] AS portable5,
                    req_contact_agg.email[5] AS email5,
                    req_contact_agg.noms[6] AS nom6,
                    req_contact_agg.typ_contact[6] AS typcontact6,
                    req_contact_agg.tel[6] AS tel6,
                    req_contact_agg.telp[6] AS portable6,
                    req_contact_agg.email[6] AS email6
                   FROM req_contact_agg
                  ORDER BY req_contact_agg.idobjet
                )
         SELECT sp.idsiret,
            'non renseignée'::character varying AS denominationusuelleetablissement,
            'non renseignée'::character varying AS enseigne1etablissement,
            'non renseignée'::character varying AS enseigne2etablissement,
            'non renseignée'::character varying AS enseigne3etablissement,
            'non renseignée'::character varying AS denominationunitelegale,
            'non renseignée'::character varying AS denominationusuelle1unitelegale,
            'non renseignée'::character varying AS denominationusuelle2unitelegale,
            'non renseignée'::character varying AS denominationusuelle3unitelegale,
            'non renseignée'::character varying AS nomunitelegale,
            'non renseignée'::character varying AS personnephysique,
            sp.nom AS l_nom,
            'Non renseignée'::character varying AS nomen_acti_princ,
            'Non renseignée'::character varying AS code_acti_princ,
            'Non renseignée'::character varying AS act_princ,
            'Non renseignée'::character varying AS cate_juri,
                CASE
                    WHEN sp.ape IS NULL THEN '99'::character varying
                    ELSE sp.ape
                END AS naf1,
            'O'::character varying AS caractereemployeuretablissement,
            sp.eff_etab::character varying AS eff_etab,
            sp.eff_etab_d AS eff_etab_n,
            sp.source_eff,
            sp.date_eff AS l_date_eff,
            'non renseignée'::character varying AS annee_eff,
            sp.l_compte,
            'non'::text AS etab_radie,
            NULL::integer AS datecreationetablissement,
            'A'::character varying AS etatadministratifetablissement,
            NULL::integer AS datederniertraitementetablissement,
            'Non renseignée'::character varying AS adresse_sirene,
            g.libgeo AS commune,
            g.insee,
            g.lib_epci AS epci,
            se.site_nom AS site,
            se.idsite,
                CASE
                    WHEN sp.adresse IS NOT NULL THEN sp.adresse
                    ELSE 'Non renseignée'::character varying
                END AS adresse_loc,
            st_x(sp.geom) AS x_l93,
            st_y(sp.geom) AS y_l93,
            c.nom1,
            c.typcontact1,
            c.tel1,
            c.portable1,
            c.email1,
            c.nom2,
            c.typcontact2,
            c.tel2,
            c.portable2,
            c.email2,
            c.nom3,
            c.typcontact3,
            c.tel3,
            c.portable3,
            c.email3,
            c.nom4,
            c.typcontact4,
            c.tel4,
            c.portable4,
            c.email4,
            c.nom5,
            c.typcontact5,
            c.tel5,
            c.portable5,
            c.email5,
            c.nom6,
            c.typcontact6,
            c.tel6,
            c.portable6,
            c.email6,
            sp.geom
           FROM m_activite_eco.geo_eco_etabp sp
             LEFT JOIN m_activite_eco.lk_eco_etab_site lk ON lk.siret::text = ('EHS'::text || sp.idgeoet)
             LEFT JOIN m_activite_eco.geo_eco_site se ON se.idsite::text = lk.idsite::text
             LEFT JOIN r_administratif.an_geo g ON g.insee::text = sp.insee::text
             LEFT JOIN req_tot c ON sp.idobjet::text = c.idobjet::text)
        )
 SELECT row_number() OVER () AS gid,
    req_tot.idsiret,
    -- sélection du nom de l'entrepruse pour l'export (synthèse des noms détaillées)
    case 
    	when (req_tot.l_nom is not null and req_tot.l_nom <> '' and req_tot.l_nom <> '[ND]') then req_tot.l_nom
    	when (req_tot.denominationusuelleetablissement is not null and req_tot.denominationusuelleetablissement <> '' and req_tot.denominationusuelleetablissement <> '[ND]') then req_tot.denominationusuelleetablissement
    	when (req_tot.enseigne1etablissement is not null and req_tot.enseigne1etablissement <> '' and req_tot.enseigne1etablissement <> '[ND]') then req_tot.enseigne1etablissement
    	when (req_tot.enseigne2etablissement is not null and req_tot.enseigne2etablissement <> '' and req_tot.enseigne2etablissement <> '[ND]') then req_tot.enseigne2etablissement
    	when (req_tot.enseigne3etablissement is not null and req_tot.enseigne3etablissement <> '' and req_tot.enseigne3etablissement <> '[ND]') then req_tot.enseigne3etablissement
    	when (req_tot.denominationunitelegale is not null and req_tot.denominationunitelegale <> '' and req_tot.denominationunitelegale <> '[ND]') then req_tot.denominationunitelegale
    	when (req_tot.denominationusuelle1unitelegale is not null and req_tot.denominationunitelegale <> '' and req_tot.denominationunitelegale <> '[ND]') then req_tot.denominationusuelle1unitelegale
    	when (req_tot.denominationusuelle2unitelegale is not null and req_tot.denominationusuelle2unitelegale <> '' and req_tot.denominationusuelle2unitelegale <> '[ND]') then req_tot.denominationusuelle2unitelegale
    	when (req_tot.denominationusuelle3unitelegale is not null and req_tot.denominationusuelle3unitelegale <> '' and req_tot.denominationusuelle3unitelegale <> '[ND]') then req_tot.denominationusuelle3unitelegale
    	when (req_tot.nomunitelegale is not null and req_tot.nomunitelegale <> '' and req_tot.nomunitelegale <> '[ND]') then req_tot.nomunitelegale
    	when (req_tot.personnephysique is not null and req_tot.personnephysique <> '' and req_tot.personnephysique <> '[ND] [ND]') then req_tot.personnephysique
    else 'Non communicable'
    end
    as libelle_entreprise,
    req_tot.denominationusuelleetablissement,
    req_tot.enseigne1etablissement,
    req_tot.enseigne2etablissement,
    req_tot.enseigne3etablissement,
    req_tot.denominationunitelegale,
    req_tot.denominationusuelle1unitelegale,
    req_tot.denominationusuelle2unitelegale,
    req_tot.denominationusuelle3unitelegale,
    req_tot.nomunitelegale,
    req_tot.personnephysique,
    req_tot.l_nom,
    req_tot.nomen_acti_princ,
    req_tot.code_acti_princ,
    req_tot.act_princ,
    req_tot.cate_juri,
    req_tot.naf1,
    req_tot.caractereemployeuretablissement,
    req_tot.eff_etab,
    req_tot.eff_etab_n,
    req_tot.source_eff,
    req_tot.l_date_eff,
    req_tot.annee_eff,
    req_tot.l_compte,
    req_tot.etab_radie,
    req_tot.datecreationetablissement,
    req_tot.etatadministratifetablissement,
    req_tot.datederniertraitementetablissement,
    req_tot.adresse_sirene,
    req_tot.commune,
    req_tot.insee,
    req_tot.epci,
    req_tot.site,
    req_tot.idsite,
        CASE
            WHEN req_tot.adresse_loc IS NULL THEN 'Etablissement localisé sur une adresse sans numéro (non conforme)'::text
            ELSE req_tot.adresse_loc
        END AS adresse_loc,
    req_tot.x_l93,
    req_tot.y_l93,
    ((((
        CASE
            WHEN req_tot.typcontact1::text = 'Directeur - Responsable'::text THEN req_tot.nom1
            ELSE ''::character varying
        END::text ||
        CASE
            WHEN req_tot.typcontact2::text = 'Directeur - Responsable'::text THEN req_tot.nom2
            ELSE ''::character varying
        END::text) ||
        CASE
            WHEN req_tot.typcontact3::text = 'Directeur - Responsable'::text THEN req_tot.nom3
            ELSE ''::character varying
        END::text) ||
        CASE
            WHEN req_tot.typcontact4::text = 'Directeur - Responsable'::text THEN req_tot.nom4
            ELSE ''::character varying
        END::text) ||
        CASE
            WHEN req_tot.typcontact5::text = 'Directeur - Responsable'::text THEN req_tot.nom5
            ELSE ''::character varying
        END::text) ||
        CASE
            WHEN req_tot.typcontact6::text = 'Directeur - Responsable'::text THEN req_tot.nom6
            ELSE ''::character varying
        END::text AS directeur_nom,
    ((((
        CASE
            WHEN req_tot.typcontact1::text = 'Directeur - Responsable'::text THEN req_tot.tel1
            ELSE ''::character varying
        END::text ||
        CASE
            WHEN req_tot.typcontact2::text = 'Directeur - Responsable'::text THEN req_tot.tel2
            ELSE ''::character varying
        END::text) ||
        CASE
            WHEN req_tot.typcontact3::text = 'Directeur - Responsable'::text THEN req_tot.tel3
            ELSE ''::character varying
        END::text) ||
        CASE
            WHEN req_tot.typcontact4::text = 'Directeur - Responsable'::text THEN req_tot.tel4
            ELSE ''::character varying
        END::text) ||
        CASE
            WHEN req_tot.typcontact5::text = 'Directeur - Responsable'::text THEN req_tot.tel5
            ELSE ''::character varying
        END::text) ||
        CASE
            WHEN req_tot.typcontact6::text = 'Directeur - Responsable'::text THEN req_tot.tel6
            ELSE ''::character varying
        END::text AS directeur_tel,
    ((((
        CASE
            WHEN req_tot.typcontact1::text = 'Directeur - Responsable'::text THEN req_tot.portable1
            ELSE ''::character varying
        END::text ||
        CASE
            WHEN req_tot.typcontact2::text = 'Directeur - Responsable'::text THEN req_tot.portable2
            ELSE ''::character varying
        END::text) ||
        CASE
            WHEN req_tot.typcontact3::text = 'Directeur - Responsable'::text THEN req_tot.portable3
            ELSE ''::character varying
        END::text) ||
        CASE
            WHEN req_tot.typcontact4::text = 'Directeur - Responsable'::text THEN req_tot.portable4
            ELSE ''::character varying
        END::text) ||
        CASE
            WHEN req_tot.typcontact5::text = 'Directeur - Responsable'::text THEN req_tot.portable5
            ELSE ''::character varying
        END::text) ||
        CASE
            WHEN req_tot.typcontact6::text = 'Directeur - Responsable'::text THEN req_tot.portable6
            ELSE ''::character varying
        END::text AS directeur_port,
    ((((
        CASE
            WHEN req_tot.typcontact1::text = 'Directeur - Responsable'::text THEN req_tot.email1
            ELSE ''::character varying
        END::text ||
        CASE
            WHEN req_tot.typcontact2::text = 'Directeur - Responsable'::text THEN req_tot.email2
            ELSE ''::character varying
        END::text) ||
        CASE
            WHEN req_tot.typcontact3::text = 'Directeur - Responsable'::text THEN req_tot.email3
            ELSE ''::character varying
        END::text) ||
        CASE
            WHEN req_tot.typcontact4::text = 'Directeur - Responsable'::text THEN req_tot.email4
            ELSE ''::character varying
        END::text) ||
        CASE
            WHEN req_tot.typcontact5::text = 'Directeur - Responsable'::text THEN req_tot.email5
            ELSE ''::character varying
        END::text) ||
        CASE
            WHEN req_tot.typcontact6::text = 'Directeur - Responsable'::text THEN req_tot.email6
            ELSE ''::character varying
        END::text AS directeur_email,
    req_tot.nom1,
    req_tot.typcontact1,
    req_tot.tel1,
    req_tot.portable1,
    req_tot.email1,
    req_tot.nom2,
    req_tot.typcontact2,
    req_tot.tel2,
    req_tot.portable2,
    req_tot.email2,
    req_tot.nom3,
    req_tot.typcontact3,
    req_tot.tel3,
    req_tot.portable3,
    req_tot.email3,
    req_tot.nom4,
    req_tot.typcontact4,
    req_tot.tel4,
    req_tot.portable4,
    req_tot.email4,
    req_tot.nom5,
    req_tot.typcontact5,
    req_tot.tel5,
    req_tot.portable5,
    req_tot.email5,
    req_tot.nom6,
    req_tot.typcontact6,
    req_tot.tel6,
    req_tot.portable6,
    req_tot.email6,
    req_tot.geom
   FROM req_tot
   
WITH DATA;

COMMENT ON MATERIALIZED VIEW m_activite_eco.xapps_geo_vmr_etab_api_export_site IS 'Vue géographique matérialisée (rafraichie ttes les nuits) composée des éléments sur les établissements actifs (API Sirene) permettant de gérer des exports de listes par site dans GEO';






-- ########################################################### SCHEMA m_activite_eco ################################################################

-- ##################################################### xapps_geo_vmr_lot_plan_situation #####################################################################

-- View: m_activite_eco.xapps_geo_vmr_lot_plan_situation

-- DROP MATERIALIZED VIEW m_activite_eco.xapps_geo_vmr_lot_plan_situation;

CREATE MATERIALIZED VIEW m_activite_eco.xapps_geo_vmr_lot_plan_situation
TABLESPACE pg_default
AS
 WITH req_tout_lot AS (
         WITH req_lot AS (
                 SELECT DISTINCT o.idgeolf,
                    o.l_voca,
                        CASE
                            WHEN f.cnom IS NULL OR f.cnom::text = ''::text THEN f.lnom
                            ELSE f.cnom
                        END AS l_nom,
                    f.occupant,
                    s.l_comm2::text AS carto,
                    o.insee,
                    o.epci,
                    l.idsite
                   FROM m_activite_eco.an_eco_lot f
                     JOIN r_objet.geo_objet_fon_lot o ON f.idgeolf = o.idgeolf
                     JOIN m_amenagement.an_amt_lot_stade s ON o.idgeolf = s.idgeolf
                     LEFT JOIN m_amenagement.lk_amt_lot_site l ON l.idgeolf = o.idgeolf
                  WHERE s.l_comm2::text = '20'::text
                ), req_bati AS (
                 SELECT DISTINCT l_1.idgeolf,
                    l_1.geom
                   FROM r_objet.geo_objet_fon_lot l_1
                  WHERE NOT (EXISTS ( SELECT b_1.idgeolf
                           FROM m_activite_eco.geo_eco_loc_act b_1
                          WHERE l_1.idgeolf = b_1.idgeolf))
                )
         SELECT row_number() OVER () AS gid,
            string_agg(DISTINCT
                CASE
                    WHEN b.l_nom::text = b.occupant::text THEN b.l_nom::text
                    ELSE b.occupant::text
                END, chr(10)) AS l_nom,
            b.occupant,
                CASE
                    WHEN sum(l.idgeolf) IS NULL THEN 'non'::text
                    ELSE 'oui'::text
                END AS bati,
            b.carto,
                CASE
                    WHEN length(round(st_area(st_union(l.geom))::numeric, 0)::character varying::text) >= 1 AND length(round(st_area(st_union(l.geom))::numeric, 0)::character varying::text) <= 3 THEN round(st_area(st_union(l.geom))::numeric, 0) || 'm²'::text
                    WHEN length(round(st_area(st_union(l.geom))::numeric, 0)::character varying::text) = 4 THEN replace(to_char(round(st_area(st_union(l.geom))::numeric, 0), 'FM9G999'::text), ','::text, ' '::text) || 'm²'::text
                    WHEN length(round(st_area(st_union(l.geom))::numeric, 0)::character varying::text) = 5 THEN replace(to_char(round(st_area(st_union(l.geom))::numeric, 0), 'FM99G999'::text), ','::text, ' '::text) || 'm²'::text
                    WHEN length(round(st_area(st_union(l.geom))::numeric, 0)::character varying::text) = 6 THEN replace(to_char(round(st_area(st_union(l.geom))::numeric, 0), 'FM999G999'::text), ','::text, ' '::text) || 'm²'::text
                    WHEN length(round(st_area(st_union(l.geom))::numeric, 0)::character varying::text) = 7 THEN replace(to_char(round(st_area(st_union(l.geom))::numeric, 0), 'FM9G999G999'::text), ','::text, ' '::text) || 'm²'::text
                    WHEN length(round(st_area(st_union(l.geom))::numeric, 0)::character varying::text) = 8 THEN replace(to_char(round(st_area(st_union(l.geom))::numeric, 0), 'FM99G999G999'::text), ','::text, ' '::text) || 'm²'::text
                    ELSE NULL::text
                END AS l_surf_l,
            b.insee,
            b.epci,
            b.idsite,
            st_union(l.geom) AS geom
           FROM req_lot b
             LEFT JOIN req_bati l ON l.idgeolf = b.idgeolf
          WHERE l.geom IS NOT NULL
          GROUP BY b.occupant, b.l_voca, b.carto, b.insee, b.epci, b.idsite
        UNION ALL
        ( WITH req_lot_loc AS (
                 SELECT l.idgeolf,
                    lo_1.lib_bati AS l_nom,
                    f.occupant,
                    'non'::text AS bati,
                    'ZZ' AS carto,
                    l.surf_l,
                    l.insee,
                    l.epci,
                    lk.idsite,
                    st_union(l.geom) AS geom
                   FROM m_activite_eco.geo_eco_loc_act lo_1
                     JOIN m_activite_eco.an_eco_lot f ON lo_1.idgeolf = f.idgeolf
                     JOIN r_objet.geo_objet_fon_lot l ON lo_1.insee::text = l.insee::text
                     JOIN m_amenagement.an_amt_lot_stade s ON l.idgeolf = s.idgeolf
                     LEFT JOIN m_amenagement.lk_amt_lot_site lk ON lk.idgeolf = l.idgeolf
                  WHERE s.l_comm2::text = '20'::text AND st_contains(l.geom, lo_1.geom) IS TRUE
                  GROUP BY l.idgeolf, l.insee, f.cnom, lo_1.lib_bati, f.occupant, lk.idsite
                ), req_lot_bati AS (
                 SELECT DISTINCT l.idgeolf,
                    l.geom
                   FROM r_objet.geo_objet_fon_lot l,
                    r_cadastre.geo_batiment b
                  WHERE l.insee::text = b.insee::text AND st_intersects(l.geom, b.geom) IS TRUE
                )
         SELECT row_number() OVER () AS gid,
            string_agg(lo.l_nom::text, chr(10)) AS l_nom,
            lo.occupant,
            lo.bati,
            lo.carto::text AS carto,
            lo.surf_l,
            lo.insee,
            lo.epci,
            lo.idsite,
            lo.geom
           FROM req_lot_loc lo
          WHERE NOT (EXISTS ( SELECT b.idgeolf
                   FROM req_lot_bati b
                  WHERE b.idgeolf = lo.idgeolf))
          GROUP BY lo.occupant, lo.bati, (lo.carto::text), lo.surf_l, lo.insee, lo.epci, lo.idsite, lo.geom)
        UNION ALL
         SELECT row_number() OVER () AS gid,
                CASE
                    WHEN f.cnom IS NULL OR f.cnom::text = ''::text THEN
                    CASE
                        WHEN f.lnom::text = f.occupant::text THEN f.lnom::text
                        ELSE f.occupant::text
                    END
                    ELSE
                    CASE
                        WHEN f.cnom::text = f.occupant::text THEN f.cnom::text
                        ELSE f.occupant::text
                    END
                END AS l_nom,
            f.occupant,
            'non'::text AS bati,
            s.l_comm2 AS carto,
            o.surf_l,
            o.insee,
            o.epci,
            lk.idsite,
            o.geom
           FROM m_activite_eco.an_eco_lot f
             JOIN r_objet.geo_objet_fon_lot o ON f.idgeolf = o.idgeolf
             JOIN m_amenagement.an_amt_lot_stade s ON o.idgeolf = s.idgeolf
             LEFT JOIN m_amenagement.lk_amt_lot_site lk ON lk.idgeolf = o.idgeolf
          WHERE s.l_comm2::text = '11'::text OR s.l_comm2::text = '12'::text OR s.l_comm2::text = '99'::text OR s.l_comm2::text = '00'::text
        UNION ALL
         SELECT row_number() OVER () AS gid,
            string_agg(DISTINCT
                CASE
                    WHEN f.cnom IS NULL OR f.cnom::text = ''::text THEN
                    CASE
                        WHEN f.lnom::text = f.occupant::text THEN f.lnom::text
                        ELSE f.occupant::text
                    END
                    ELSE
                    CASE
                        WHEN f.cnom::text = f.occupant::text THEN f.cnom::text
                        ELSE f.occupant::text
                    END
                END, chr(10)) AS l_nom,
            f.occupant,
            'non'::text AS bati,
            '3132'::text AS carto,
                CASE
                    WHEN length(round(st_area(st_union(o.geom))::numeric, 0)::character varying::text) >= 1 AND length(round(st_area(st_union(o.geom))::numeric, 0)::character varying::text) <= 3 THEN round(st_area(st_union(o.geom))::numeric, 0) || 'm²'::text
                    WHEN length(round(st_area(st_union(o.geom))::numeric, 0)::character varying::text) = 4 THEN replace(to_char(round(st_area(st_union(o.geom))::numeric, 0), 'FM9G999'::text), ','::text, ' '::text) || 'm²'::text
                    WHEN length(round(st_area(st_union(o.geom))::numeric, 0)::character varying::text) = 5 THEN replace(to_char(round(st_area(st_union(o.geom))::numeric, 0), 'FM99G999'::text), ','::text, ' '::text) || 'm²'::text
                    WHEN length(round(st_area(st_union(o.geom))::numeric, 0)::character varying::text) = 6 THEN replace(to_char(round(st_area(st_union(o.geom))::numeric, 0), 'FM999G999'::text), ','::text, ' '::text) || 'm²'::text
                    WHEN length(round(st_area(st_union(o.geom))::numeric, 0)::character varying::text) = 7 THEN replace(to_char(round(st_area(st_union(o.geom))::numeric, 0), 'FM9G999G999'::text), ','::text, ' '::text) || 'm²'::text
                    WHEN length(round(st_area(st_union(o.geom))::numeric, 0)::character varying::text) = 8 THEN replace(to_char(round(st_area(st_union(o.geom))::numeric, 0), 'FM99G999G999'::text), ','::text, ' '::text) || 'm²'::text
                    ELSE NULL::text
                END AS l_surf_l,
            o.insee,
            o.epci,
            lk.idsite,
            st_union(o.geom) AS geom
           FROM m_activite_eco.an_eco_lot f
             JOIN r_objet.geo_objet_fon_lot o ON f.idgeolf = o.idgeolf
             JOIN r_objet.geo_objet_fon_lot o1 ON f.idgeolf = o1.idgeolf
             JOIN m_amenagement.an_amt_lot_stade s ON o1.idgeolf = s.idgeolf
             LEFT JOIN m_amenagement.lk_amt_lot_site lk ON lk.idgeolf = o.idgeolf
          WHERE (s.l_comm2::text = '32'::text OR s.l_comm2::text = '31'::text) AND st_touches(o.geom, o1.geom) IS TRUE
          GROUP BY o.l_voca, f.occupant, o.insee, o.epci, lk.idsite
        UNION ALL
         SELECT row_number() OVER () AS gid,
                CASE
                    WHEN f.cnom IS NULL OR f.cnom::text = ''::text THEN
                    CASE
                        WHEN f.lnom::text = f.occupant::text THEN f.lnom::text
                        ELSE f.occupant::text
                    END
                    ELSE
                    CASE
                        WHEN f.cnom::text = f.occupant::text THEN f.cnom::text
                        ELSE f.occupant::text
                    END
                END AS l_nom,
            f.occupant,
            'non'::text AS bati,
            '3132'::text AS carto,
            o.surf_l,
            o.insee,
            o.epci,
            lk.idsite,
            o.geom
           FROM m_activite_eco.an_eco_lot f
             JOIN r_objet.geo_objet_fon_lot o ON f.idgeolf = o.idgeolf
             JOIN r_objet.geo_objet_fon_lot o1 ON f.idgeolf = o1.idgeolf
             JOIN m_amenagement.an_amt_lot_stade s ON o.idgeolf = s.idgeolf
             LEFT JOIN m_amenagement.lk_amt_lot_site lk ON lk.idgeolf = o.idgeolf
          WHERE (s.l_comm2::text = '32'::text OR s.l_comm2::text = '31'::text) AND st_touches(o.geom, o1.geom) IS FALSE
        )
 SELECT row_number() OVER () AS gid,
    req_tout_lot.l_nom,
    req_tout_lot.occupant,
    req_tout_lot.bati,
    req_tout_lot.carto,
    req_tout_lot.l_surf_l,
    req_tout_lot.insee,
    req_tout_lot.epci,
    req_tout_lot.idsite,
    req_tout_lot.geom
   FROM req_tout_lot
WITH DATA;

COMMENT ON MATERIALIZED VIEW m_activite_eco.xapps_geo_vmr_lot_plan_situation
    IS 'Vue géographique des lots fonciers avec les informations de stade d''aménagement et si informations immobilère présentes (pour la cartographie des plans de situation dans GEO de l''application)';

-- ########################################################### SCHEMA m_activite_eco ################################################################

-- ##################################################### xapps_geo_vmr_plan_situ_bati_act #####################################################################

-- View: m_activite_eco.xapps_geo_vmr_plan_situ_bati_act

-- DROP MATERIALIZED VIEW m_activite_eco.xapps_geo_vmr_plan_situ_bati_act;

CREATE MATERIALIZED VIEW m_activite_eco.xapps_geo_vmr_plan_situ_bati_act
TABLESPACE pg_default
AS
 SELECT row_number() OVER () AS gid,
    string_agg(
        CASE
            WHEN (l.lib_bati IS NOT NULL OR l.lib_bati::text <> ''::text) AND l.p_etiq IS TRUE THEN l.lib_bati::text
            ELSE ''::text
        END, chr(10)) AS lib_bati,
    l.insee,
    l.epci,
    lk.idsite,
    b.geom
   FROM m_activite_eco.geo_eco_loc_act l
     LEFT JOIN m_activite_eco.lk_eco_loc_site lk ON lk.idloc::text = l.idloc::text,
    r_cadastre.geo_batiment b
  WHERE l.insee::text = b.insee::text AND st_intersects(l.geom, b.geom) IS TRUE
  GROUP BY l.insee, l.epci, lk.idsite, b.geom
WITH DATA;

COMMENT ON MATERIALIZED VIEW m_activite_eco.xapps_geo_vmr_plan_situ_bati_act
    IS 'Vue matérialisée présentant les bâtiments d''activités avec le libellé du bâitment à afficher';


-- ########################################################### SCHEMA m_urbanisme_reg ################################################################

-- ##################################################### xapps_geo_vmr_proc_zac #####################################################################

-- View: m_urbanisme_reg.xapps_geo_vmr_proc_zac

-- DROP MATERIALIZED VIEW m_urbanisme_reg.xapps_geo_vmr_proc_zac;

CREATE MATERIALIZED VIEW m_urbanisme_reg.xapps_geo_vmr_proc_zac
TABLESPACE pg_default
AS
 SELECT row_number() OVER () AS gid,
    so.nom,
    so.geom,
    so.geom1
   FROM m_urbanisme_reg.geo_proced so
  WHERE so.z_proced::text = '10'::text
WITH DATA;


COMMENT ON MATERIALIZED VIEW m_urbanisme_reg.xapps_geo_vmr_proc_zac
    IS 'Vue matérialisée des procédures d''aménagements spécifique ZAC (périmètre global sans détail de zones d''aménagement éventuelles)';

-- ####################################################################################################################################################
-- ###                                                                                                                                              ###
-- ###                                                              VUES OPENDATA                                                                   ###
-- ###                                                                                                                                              ###
-- ####################################################################################################################################################

-- ########################################################### SCHEMA m_activite_eco ################################################################


-- ##################################################### xopendata_geo_eco_site_cnig #####################################################################

-- m_activite_eco.xopendata_geo_eco_site_cnig source
-- m_activite_eco.xopendata_geo_eco_site_cnig source

CREATE OR REPLACE VIEW m_activite_eco.xopendata_geo_eco_site_cnig
AS WITH req_ter_vente AS (
         SELECT s_1.idsite,
            count(*) AS nb_terrain
           FROM m_activite_eco.geo_eco_site s_1,
            r_objet.geo_objet_fon_lot l,
            m_amenagement.lk_amt_lot_site amt,
            m_amenagement.an_amt_lot_stade st
          WHERE (st.l_comm2::text = ANY (ARRAY['11'::character varying::text, '12'::character varying::text])) AND l.l_voca::text = '20'::text AND st.idgeolf = l.idgeolf AND s_1.idsite::text = amt.idsite::text AND amt.idgeolf = l.idgeolf
          GROUP BY s_1.idsite
        ), req_etab_indus AS (
         SELECT DISTINCT s_1.idsite,
            'oui'::text AS voca_indus
           FROM m_activite_eco.geo_eco_site s_1
             LEFT JOIN m_activite_eco.lk_eco_etab_site lk ON lk.idsite::text = s_1.idsite::text
             LEFT JOIN m_activite_eco.an_eco_etab e ON e.idsiret::text = lk.siret::text
          WHERE ("left"(e.apet700::text, 2) = ANY (ARRAY['05'::text, '06'::text, '07'::text, '08'::text, '09'::text])) OR ("left"(e.apet700::text, 1) = ANY (ARRAY['1'::text, '2'::text, '3'::text])) AND e.l_compte IS TRUE
        ), req_etab_comm AS (
         SELECT DISTINCT s_1.idsite,
            'oui'::text AS voca_comm
           FROM m_activite_eco.geo_eco_site s_1
             LEFT JOIN m_activite_eco.lk_eco_etab_site lk ON lk.idsite::text = s_1.idsite::text
             LEFT JOIN m_activite_eco.an_eco_etab e ON e.idsiret::text = lk.siret::text
          WHERE ("left"(e.apet700::text, 2) = ANY (ARRAY['45'::text, '46'::text, '47'::text])) AND e.l_compte IS TRUE
        ), req_etab_arti AS (
         SELECT DISTINCT s_1.idsite,
            'oui'::text AS voca_arti
           FROM m_activite_eco.geo_eco_site s_1
             LEFT JOIN m_activite_eco.lk_eco_etab_site lk ON lk.idsite::text = s_1.idsite::text
             LEFT JOIN m_activite_eco.an_eco_etab e ON e.idsiret::text = lk.siret::text
          WHERE ("left"(e.apet700::text, 2) = ANY (ARRAY['41'::text, '42'::text, '43'::text])) AND e.l_compte IS TRUE
        ), req_etab_touri AS (
         SELECT DISTINCT s_1.idsite,
            'oui'::text AS voca_touri
           FROM m_activite_eco.geo_eco_site s_1
             LEFT JOIN m_activite_eco.lk_eco_etab_site lk ON lk.idsite::text = s_1.idsite::text
             LEFT JOIN m_activite_eco.an_eco_etab e ON e.idsiret::text = lk.siret::text
          WHERE ("left"(e.apet700::text, 2) = ANY (ARRAY['55'::text, '79'::text, '90'::text, '91'::text])) AND e.l_compte IS TRUE
        ), req_etab_tert AS (
         SELECT DISTINCT s_1.idsite,
            'oui'::text AS voca_tert
           FROM m_activite_eco.geo_eco_site s_1
             LEFT JOIN m_activite_eco.lk_eco_etab_site lk ON lk.idsite::text = s_1.idsite::text
             LEFT JOIN m_activite_eco.an_eco_etab e ON e.idsiret::text = lk.siret::text
          WHERE ("left"(e.apet700::text, 2) = ANY (ARRAY['49'::text, '52'::text, '53'::text, '56'::text, '58'::text, '59'::text, '70'::text, '71'::text, '72'::text, '73'::text, '74'::text, '75'::text, '76'::text, '77'::text, '78'::text, '91'::text, '92'::text, '93'::text, '94'::text, '95'::text, '96'::text, '97'::text, '98'::text, '99'::text])) OR ("left"(e.apet700::text, 1) = ANY (ARRAY['6'::text, '8'::text])) AND e.l_compte IS TRUE
        ), req_etab_port AS (
         SELECT DISTINCT s_1.idsite,
            'oui'::text AS voca_port
           FROM m_activite_eco.geo_eco_site s_1
             LEFT JOIN m_activite_eco.lk_eco_etab_site lk ON lk.idsite::text = s_1.idsite::text
             LEFT JOIN m_activite_eco.an_eco_etab e ON e.idsiret::text = lk.siret::text
          WHERE "left"(e.apet700::text, 2) = '50'::text AND e.l_compte IS TRUE
        ), req_etab_aport AS (
         SELECT DISTINCT s_1.idsite,
            'oui'::text AS voca_aport
           FROM m_activite_eco.geo_eco_site s_1
             LEFT JOIN m_activite_eco.lk_eco_etab_site lk ON lk.idsite::text = s_1.idsite::text
             LEFT JOIN m_activite_eco.an_eco_etab e ON e.idsiret::text = lk.siret::text
          WHERE "left"(e.apet700::text, 2) = '51'::text AND e.l_compte IS TRUE
        )
 SELECT DISTINCT s.site_id::text AS site_id,
    NULL::text AS pole_id,
    s.site_nom,
        CASE
            WHEN s.typsite::text = '00'::text THEN 'inconnu'::text
            WHEN s.typsite::text = '10'::text THEN 'zone d''activité économique'::text
            WHEN s.typsite::text = '20'::text THEN 'site économique historique hors ZAE'::text
            WHEN s.typsite::text = '21'::text THEN 'établissement économique isolé'::text
            WHEN s.typsite::text = '40'::text THEN 'zone 2AU à vocation économique'::text
            ELSE NULL::text
        END::character varying AS site_type,
        CASE
            WHEN s.site_voca::text = '10'::text THEN 'industrielle'::text
            WHEN s.site_voca::text = '20'::text THEN 'artisanale'::text
            WHEN s.site_voca::text = '30'::text THEN 'commerciale'::text
            WHEN s.site_voca::text = '40'::text THEN 'mixte'::text
            ELSE 'inconnu'::text
        END::character varying AS site_vocadomi,
        CASE
            WHEN s.site_etat::text = '00'::text THEN 'inconnu'::text
            WHEN s.site_etat::text = '10'::text THEN 'existant et actif'::text
            WHEN s.site_etat::text = '20'::text OR s.site_etat::text = '21'::text THEN 'en projet'::text
            WHEN s.site_etat::text = '30'::text THEN 'création'::text
            WHEN s.site_etat::text = '40'::text THEN 'déclassé'::text
            WHEN s.site_etat::text = '50'::text THEN 'projet de déclassement'::text
            WHEN s.site_etat::text = '60'::text THEN 'annulé'::text
            ELSE NULL::text
        END::character varying AS site_etat,
    ss."Surface du site"::double precision AS site_surf_brute,
    round(ss.surf_utile::numeric / 10000::numeric, 2) AS site_surf_utile,
    s.date_crea::text AS site_creation_date,
    to_char(s.date_sai, 'YYYY-MM-DD'::text)::character varying(10) AS site_identif_date,
    to_char(s.date_maj, 'YYYY-MM-DD'::text)::character varying(10) AS site_actu_date,
    NULL::character varying AS site_description,
        CASE
            WHEN s.epci::text = 'arc'::text THEN 'Agglomération de la Région de Compiègne et de la Basse Automne'::text
            WHEN s.epci::text = 'ccpe'::text THEN 'Communauté de communes de la Plaine d''Estées'::text
            WHEN s.epci::text = 'cclo'::text THEN 'Communauté de communes des Lisières de l''Oise'::text
            WHEN s.epci::text = 'cc2v'::text THEN 'Communauté de communes des Deux Vallées'::text
            ELSE ''::text
        END::character varying AS source_producteur,
    NULL::character varying AS site_quali_territoire,
        CASE
            WHEN tc.valeur::text <> 'Non renseigné'::text THEN lower(tc.valeur::text)
            ELSE 'inconnu'::text
        END::character varying AS site_evol_urba,
    s.l_url::text AS site_url,
        CASE
            WHEN s.typsite::text = '10'::text THEN s.z_mai_ouvr
            ELSE ''::character varying
        END AS site_epci_nom,
        CASE
            WHEN s.typsite::text = '10'::text THEN
            CASE
                WHEN s.epci::text = 'arc'::text THEN '200067965'::text
                WHEN s.epci::text = 'ccpe'::text THEN '246000897'::text
                WHEN s.epci::text = 'cclo'::text THEN '246000749'::text
                WHEN s.epci::text = 'cc2v'::text THEN '246000772'::text
                ELSE ''::text
            END
            ELSE NULL::text
        END::character varying(9) AS site_epci_siren,
    c.commune AS site_comm_nom,
    "left"(s.site_id::text, 5)::character varying(5) AS site_comm_insee,
        CASE
            WHEN mt.valeur::text = 'Non renseignée'::text THEN 'inconnu'::character varying
            ELSE mt.valeur
        END AS site_moa_type,
    s.z_mai_ouvr AS site_moa_nom,
    s.z_amng AS site_moa_amngt,
    s.z_comm AS site_moa_comm,
    NULL::integer AS site_uf_nbre,
    NULL::integer AS site_uf_vacant_nbre,
    NULL::integer AS site_taux_vacance,
    NULL::integer AS site_uf_bati_nbre,
    ss.nb_etab::integer AS site_nb_etab,
    ss.eff_etab::integer AS site_nb_emploi,
    st_asgeojson(s.geom) AS site_geomsurf,
    st_asgeojson(st_pointonsurface(s.geom)) AS site_geompoint,
    NULL::character varying AS site_media,
    round(ss.surf_vente::numeric / 10000::numeric, 2)::double precision AS site_surf_comm_dispo,
    round(ss.surf_projet::numeric / 10000::numeric, 2)::double precision AS site_surf_projet,
        CASE
            WHEN ei.voca_indus = 'oui'::text THEN 'oui'::text
            ELSE 'non'::text
        END::character varying(3) AS site_voca_industrielle,
        CASE
            WHEN ec.voca_comm = 'oui'::text THEN 'oui'::text
            ELSE 'non'::text
        END::character varying(3) AS site_voca_commerciale,
        CASE
            WHEN eter.voca_tert = 'oui'::text THEN 'oui'::text
            ELSE 'non'::text
        END::character varying(3) AS site_voca_tertiaire,
        CASE
            WHEN ea.voca_arti = 'oui'::text THEN 'oui'::text
            ELSE 'non'::text
        END::character varying(3) AS site_voca_artisanale,
        CASE
            WHEN eto.voca_touri = 'oui'::text THEN 'oui'::text
            ELSE 'non'::text
        END::character varying(3) AS site_voca_touristique,
        CASE
            WHEN epo.voca_port = 'oui'::text THEN 'oui'::text
            ELSE 'non'::text
        END::character varying(3) AS site_voca_portuaire,
        CASE
            WHEN eapo.voca_aport = 'oui'::text THEN 'oui'::text
            ELSE 'non'::text
        END::character varying(3) AS site_voca_aeroportuaire,
        CASE
            WHEN s.res_pluvia IS TRUE THEN 'oui'::text
            ELSE 'non'::text
        END::character varying(3) AS reseau_eau_pluviale,
        CASE
            WHEN s.res_eau IS TRUE THEN 'oui'::text
            ELSE 'non'::text
        END::character varying(3) AS reseau_eau_potable,
        CASE
            WHEN s.res_ass IS TRUE THEN 'oui'::text
            ELSE 'non'::text
        END::character varying(3) AS reseau_assainissement,
        CASE
            WHEN s.res_gaz IS TRUE THEN 'oui'::text
            ELSE 'non'::text
        END::character varying(3) AS reseau_gaz,
        CASE
            WHEN s.res_elect IS TRUE THEN 'oui'::text
            ELSE 'non'::text
        END::character varying(3) AS reseau_electrique,
        CASE
            WHEN s.res_fibre IS TRUE THEN 'oui'::text
            ELSE 'non'::text
        END::character varying(3) AS reseau_fibre_optique,
        CASE
            WHEN s.z_ite IS TRUE THEN 'oui'::text
            ELSE 'non'::text
        END::character varying(3) AS reseau_fret_ferroviaire,
        CASE
            WHEN s.z_pmm IS TRUE THEN 'oui'::text
            ELSE 'non'::text
        END::character varying(3) AS reseau_fluvial,
        CASE
            WHEN s.serv_tc IS TRUE THEN 'oui'::text
            ELSE 'non'::text
        END::character varying(3) AS desserte_tc,
    NULL::character varying AS desserte_route_nom,
    s.z_auto AS autoroute_nom,
    s.z_dst_auto AS autoroute_echang_dist,
    s.z_fr_v AS gare_nom,
    s.z_dst_fr_v AS gare_dist,
    s.z_fr_f AS gare_fret_nom,
    s.z_dst_fr_f AS gare_fret_dist,
    s.z_ar_v AS aeroport_nom,
    s.z_dst_ar_v AS aeroport_dist,
    s.z_pmm_n AS port_nom,
    s.z_dst_pmm AS port_dist,
        CASE
            WHEN s.z_mai_ouvr::text = 'Agglomération de la Région de Compiègne et de la Basse Automne'::text THEN
            CASE
                WHEN vt.nb_terrain > 0 THEN 'régional et national'::text
                ELSE 'non'::text
            END::character varying
            ELSE
            CASE
                WHEN pro.code::text = ANY (ARRAY['00'::character varying, '10'::character varying]::text[]) THEN 'non'::character varying
                ELSE pro.valeur
            END
        END AS promotion,
    s.promo_comment AS commentaire,
        CASE
            WHEN s.typsite::text = '40'::text THEN 'Documents d''urbanisme'::text
            ELSE 'Observatoire des sites d''activités du GéoCompiégnois'::text
        END AS source_zonage,
    s.epci,
    s.geom
   FROM m_activite_eco.geo_eco_site s
     LEFT JOIN m_activite_eco.xapps_an_v_synt_site_act_api ss ON ss."Identifiant du site"::text = s.idsite::text
     LEFT JOIN m_activite_eco.lk_eco_proc lkp ON lkp.idsite::text = s.idsite::text
     LEFT JOIN m_urbanisme_reg.geo_proced p ON p.idproc::text = lkp.idproc::text
     LEFT JOIN m_urbanisme_reg.lt_proc_typconso tc ON tc.code::text = p.conso_type::text
     LEFT JOIN r_osm.geo_vm_osm_commune_grdc c ON c.insee::text = "left"(s.site_id::text, 5)
     LEFT JOIN m_activite_eco.lt_eco_moatype mt ON mt.code::text = s.moa_type::text
     LEFT JOIN req_etab_indus ei ON ei.idsite::text = s.idsite::text
     LEFT JOIN req_etab_comm ec ON ec.idsite::text = s.idsite::text
     LEFT JOIN req_etab_arti ea ON ea.idsite::text = s.idsite::text
     LEFT JOIN req_etab_touri eto ON eto.idsite::text = s.idsite::text
     LEFT JOIN req_etab_tert eter ON eter.idsite::text = s.idsite::text
     LEFT JOIN req_etab_port epo ON epo.idsite::text = s.idsite::text
     LEFT JOIN req_etab_aport eapo ON eapo.idsite::text = s.idsite::text
     LEFT JOIN req_ter_vente vt ON vt.idsite::text = s.idsite::text
     LEFT JOIN m_activite_eco.lt_eco_promot pro ON pro.code::text = s.promot::text
  WHERE s.typsite::text <> '30'::text;

COMMENT ON VIEW m_activite_eco.xopendata_geo_eco_site_cnig IS 'Vue de la couche site d''activité du standard CNIG 2023';
COMMENT ON COLUMN m_activite_eco.xopendata_geo_eco_site_cnig.site_id IS 'identifiant du site économique';
COMMENT ON COLUMN m_activite_eco.xopendata_geo_eco_site_cnig.pole_id IS 'identifiant du pôle où se situe le site économique';
COMMENT ON COLUMN m_activite_eco.xopendata_geo_eco_site_cnig.site_nom IS 'nom du site économique';
COMMENT ON COLUMN m_activite_eco.xopendata_geo_eco_site_cnig.site_type IS 'type de site économique';
COMMENT ON COLUMN m_activite_eco.xopendata_geo_eco_site_cnig.site_vocadomi IS 'vocation dominante constatée du site économique';
COMMENT ON COLUMN m_activite_eco.xopendata_geo_eco_site_cnig.site_etat IS 'état du site économique (en projet, création, etc.)';
COMMENT ON COLUMN m_activite_eco.xopendata_geo_eco_site_cnig.site_surf_brute IS 'superficie totale du site économique en hectare';
COMMENT ON COLUMN m_activite_eco.xopendata_geo_eco_site_cnig.site_surf_utile IS 'Surface (en hectare) destinée à accueillir les implantations d''activités, calculée comme la somme des valeurs « terr_surf_brute » des terrains économiques du site dont la valeur de l’attribut  terr_utile est « oui ».
La différence entre surface brute et surface utile résulte de l''emprise des équipements publics (voirie, etc.) les délaissés et les éventuelles surfaces réservées à d''autres destinations (logements, loisirs, etc).';
COMMENT ON COLUMN m_activite_eco.xopendata_geo_eco_site_cnig.site_creation_date IS 'année de création du site économique. Exemple : 2015';
COMMENT ON COLUMN m_activite_eco.xopendata_geo_eco_site_cnig.site_identif_date IS 'date d''identification du site économique. Exemple : 2016-03-26';
COMMENT ON COLUMN m_activite_eco.xopendata_geo_eco_site_cnig.site_actu_date IS 'date de dernière actualisation des informations sur le site économique.';
COMMENT ON COLUMN m_activite_eco.xopendata_geo_eco_site_cnig.site_description IS 'commentaire libre contenant des infos descriptives du site économique';
COMMENT ON COLUMN m_activite_eco.xopendata_geo_eco_site_cnig.source_producteur IS 'identification du producteur de la donnée. Exemples : Région Occitanie ; DDT des Ardennes ; Agence d''urbanisme de ..., etc.';
COMMENT ON COLUMN m_activite_eco.xopendata_geo_eco_site_cnig.site_quali_territoire IS 'qualification ou labellisation territoriale ou régionale';
COMMENT ON COLUMN m_activite_eco.xopendata_geo_eco_site_cnig.site_evol_urba IS 'type d''urbanisation (extension, renouvellement urbain)';
COMMENT ON COLUMN m_activite_eco.xopendata_geo_eco_site_cnig.site_url IS 'URL de la page web descriptive du site économique';
COMMENT ON COLUMN m_activite_eco.xopendata_geo_eco_site_cnig.site_epci_nom IS 'nom de l''EPCI autorité compétente de la ZAE';
COMMENT ON COLUMN m_activite_eco.xopendata_geo_eco_site_cnig.site_epci_siren IS 'code SIREN de l''EPCI autorité compétente de la ZAE';
COMMENT ON COLUMN m_activite_eco.xopendata_geo_eco_site_cnig.site_comm_nom IS 'nom de la commune dont le site éco. occupe la plus grande superficie';
COMMENT ON COLUMN m_activite_eco.xopendata_geo_eco_site_cnig.site_comm_insee IS 'code INSEE de la commune principale dâ€™implantation du site Ã©conomique';
COMMENT ON COLUMN m_activite_eco.xopendata_geo_eco_site_cnig.site_moa_type IS 'type de maîtrise d''ouvrage';
COMMENT ON COLUMN m_activite_eco.xopendata_geo_eco_site_cnig.site_moa_nom IS 'nom de la maîtrise d''ouvrage et/ou gestionnaire du site économique';
COMMENT ON COLUMN m_activite_eco.xopendata_geo_eco_site_cnig.site_moa_amngt IS 'nom de la maîtrise d''ouvrage en charge de l''aménagement';
COMMENT ON COLUMN m_activite_eco.xopendata_geo_eco_site_cnig.site_moa_comm IS 'nom de la maîtrise d''ouvrage en charge la commercialisation';
COMMENT ON COLUMN m_activite_eco.xopendata_geo_eco_site_cnig.site_uf_nbre IS 'nombre d''unités foncières du site économique';
COMMENT ON COLUMN m_activite_eco.xopendata_geo_eco_site_cnig.site_uf_vacant_nbre IS 'nombre d''unités foncières vacantes du site économique';
COMMENT ON COLUMN m_activite_eco.xopendata_geo_eco_site_cnig.site_taux_vacance IS 'taux de vacance de la ZAE suivant article L318-8-2 CU (pourcentage)';
COMMENT ON COLUMN m_activite_eco.xopendata_geo_eco_site_cnig.site_uf_bati_nbre IS 'nombre d''unités foncières bâties';
COMMENT ON COLUMN m_activite_eco.xopendata_geo_eco_site_cnig.site_nb_etab IS 'nombre d''établissements économique (hors SCI) dans le site éco.';
COMMENT ON COLUMN m_activite_eco.xopendata_geo_eco_site_cnig.site_nb_emploi IS 'estimation du nombre d''emplois du site Ã©conomique';
COMMENT ON COLUMN m_activite_eco.xopendata_geo_eco_site_cnig.site_geomsurf IS 'multi géométries surfaciques du périmètre du site économique au format GeoJSON';
COMMENT ON COLUMN m_activite_eco.xopendata_geo_eco_site_cnig.site_geompoint IS 'coordonnées géo. du centroïde du site économique au format GeoJSON';
COMMENT ON COLUMN m_activite_eco.xopendata_geo_eco_site_cnig.site_media IS 'URL pointant vers un (des) média(s) : photo, vidéo, etc. du site éco.';
COMMENT ON COLUMN m_activite_eco.xopendata_geo_eco_site_cnig.site_surf_comm_dispo IS 'surface disponible à la commercialisation, en hectare';
COMMENT ON COLUMN m_activite_eco.xopendata_geo_eco_site_cnig.site_surf_projet IS 'surface réservée pour des projets en cours, en hectare';
COMMENT ON COLUMN m_activite_eco.xopendata_geo_eco_site_cnig.site_voca_industrielle IS 'le site comprend (oui / non) au moins une activité industrielle';
COMMENT ON COLUMN m_activite_eco.xopendata_geo_eco_site_cnig.site_voca_commerciale IS 'le site comprend (oui / non) au moins une activité commerciale';
COMMENT ON COLUMN m_activite_eco.xopendata_geo_eco_site_cnig.site_voca_tertiaire IS 'le site comprend (oui / non) au moins une activité tertiaire';
COMMENT ON COLUMN m_activite_eco.xopendata_geo_eco_site_cnig.site_voca_artisanale IS 'le site comprend (oui / non) au moins une activité artisanale';
COMMENT ON COLUMN m_activite_eco.xopendata_geo_eco_site_cnig.site_voca_touristique IS 'le site comprend (oui / non) au moins une activité touristique';
COMMENT ON COLUMN m_activite_eco.xopendata_geo_eco_site_cnig.site_voca_portuaire IS 'le site comprend (oui / non) au moins une activité portuaire';
COMMENT ON COLUMN m_activite_eco.xopendata_geo_eco_site_cnig.site_voca_aeroportuaire IS 'le site comprend (oui / non) au moins une activité aéroportuaire';
COMMENT ON COLUMN m_activite_eco.xopendata_geo_eco_site_cnig.reseau_eau_pluviale IS 'le site est équipé (oui / non) d''un réseau d''eau pluviale';
COMMENT ON COLUMN m_activite_eco.xopendata_geo_eco_site_cnig.reseau_eau_potable IS 'le site est équipé (oui / non) d''un réseau d''eau potable';
COMMENT ON COLUMN m_activite_eco.xopendata_geo_eco_site_cnig.reseau_assainissement IS 'le site est équipé (oui / non) d''un réseau d''assainissement';
COMMENT ON COLUMN m_activite_eco.xopendata_geo_eco_site_cnig.reseau_gaz IS 'le site est équipé (oui / non) d''un réseau de gaz';
COMMENT ON COLUMN m_activite_eco.xopendata_geo_eco_site_cnig.reseau_electrique IS 'le site est équipé (oui / non) d''un réseau électrique';
COMMENT ON COLUMN m_activite_eco.xopendata_geo_eco_site_cnig.reseau_fibre_optique IS 'le site est équipé (oui / non) d''un réseau de fibre optique';
COMMENT ON COLUMN m_activite_eco.xopendata_geo_eco_site_cnig.reseau_fret_ferroviaire IS 'présence (oui / non) d''une Installation Terminale Embranchée (ITE)';
COMMENT ON COLUMN m_activite_eco.xopendata_geo_eco_site_cnig.reseau_fluvial IS 'présence (oui / non) d''un quai fluvial';
COMMENT ON COLUMN m_activite_eco.xopendata_geo_eco_site_cnig.desserte_tc IS 'présence (oui / non) d''une desserte en transport en commun';
COMMENT ON COLUMN m_activite_eco.xopendata_geo_eco_site_cnig.desserte_route_nom IS 'libellé de la desserte routière principale';
COMMENT ON COLUMN m_activite_eco.xopendata_geo_eco_site_cnig.autoroute_nom IS 'libellé de l''autoroute la plus proche';
COMMENT ON COLUMN m_activite_eco.xopendata_geo_eco_site_cnig.autoroute_echang_dist IS 'distance de l''échangeur autoroutier le plus proche';
COMMENT ON COLUMN m_activite_eco.xopendata_geo_eco_site_cnig.gare_nom IS 'nom de la gare de voyageurs la plus proche';
COMMENT ON COLUMN m_activite_eco.xopendata_geo_eco_site_cnig.gare_dist IS 'distance (en km) de la gare de voyageurs la plus proche, par la route';
COMMENT ON COLUMN m_activite_eco.xopendata_geo_eco_site_cnig.gare_fret_nom IS 'nom de la gare de fret la plus proche';
COMMENT ON COLUMN m_activite_eco.xopendata_geo_eco_site_cnig.gare_fret_dist IS 'distance (en km) de la gare de fret la plus proche, par la route';
COMMENT ON COLUMN m_activite_eco.xopendata_geo_eco_site_cnig.aeroport_nom IS 'nom de l''aéroport le plus proche';
COMMENT ON COLUMN m_activite_eco.xopendata_geo_eco_site_cnig.aeroport_dist IS 'distance (en km) de l''aéroport le plus proche, par la route';
COMMENT ON COLUMN m_activite_eco.xopendata_geo_eco_site_cnig.port_nom IS 'nom du port maritime ou fluvial le plus proche';
COMMENT ON COLUMN m_activite_eco.xopendata_geo_eco_site_cnig.port_dist IS 'distance (en km) du port maritime ou fluvial le plus proche, par la route';
COMMENT ON COLUMN m_activite_eco.xopendata_geo_eco_site_cnig.promotion IS 'Accord pour promouvoir l''offre foncière disponible d''un site';
COMMENT ON COLUMN m_activite_eco.xopendata_geo_eco_site_cnig.commentaire IS 'Commentaire libre pour échange avec les équipes de Geo2France';
COMMENT ON COLUMN m_activite_eco.xopendata_geo_eco_site_cnig.source_zonage IS 'Source de la délimitation du site';
COMMENT ON COLUMN m_activite_eco.xopendata_geo_eco_site_cnig.epci IS 'EPCI compétente';
COMMENT ON COLUMN m_activite_eco.xopendata_geo_eco_site_cnig.geom IS 'géométrie de l''objet';



-- ##################################################### xopendata_geo_eco_terrain_cnig #####################################################################

-- m_activite_eco.xopendata_geo_eco_terrain_cnig source

CREATE OR REPLACE VIEW m_activite_eco.xopendata_geo_eco_terrain_cnig
AS SELECT (((f.insee::text || '_'::text) || 'TERRAIN-ECO'::text) || '_'::text) || f.idgeolf AS terr_id,
    s.site_id,
    NULL::character varying AS terr_refcad,
        CASE
            WHEN f.surf IS NULL OR f.surf = 0 THEN round(f.sup_m2::numeric / 10000::numeric, 2)
            ELSE round(f.surf::numeric / 10000::numeric, 2)
        END AS terr_surf_brute,
    'oui'::character varying(3) AS terr_utile,
    f.date_sai::character varying(10) AS terr_identif_date,
    l.date_maj::character varying(10) AS terr_actu_date,
        CASE
            WHEN mf.valeur::text = 'Non renseignée'::text THEN 'inconnu'::character varying
            WHEN mf.valeur::text = 'Autre'::text THEN 'autre'::character varying
            WHEN mf.valeur::text = 'Non concernée'::text THEN 'sans objet'::character varying
            ELSE mf.valeur
        END AS terr_maitrise_fonc,
        CASE
            WHEN sa.l_amng2::text = '10'::text THEN 'viabilisé et aménagé'::text
            WHEN sa.l_amng2::text = '20'::text THEN 'non aménagé, non viabilisé'::text
            WHEN sa.l_amng2::text = '30'::text THEN 'non aménagé, non viabilisé'::text
            WHEN sa.l_amng2::text = 'ZZ'::text THEN 'sans objet'::text
            WHEN sa.l_amng2::text = '00'::text THEN 'inconnu'::text
            WHEN sa.l_amng2::text = '99'::text THEN 'autre'::text
            ELSE ''::text
        END::character varying AS terr_stade_amngt,
        CASE
            WHEN sa.l_comm2::text = '11'::text THEN 'en vente'::text
            WHEN sa.l_comm2::text = '12'::text THEN 'en vente avec contraintes'::text
            WHEN sa.l_comm2::text = '20'::text THEN 'vendu, commercialisation achevée'::text
            WHEN sa.l_comm2::text = '32'::text THEN 'réservé par option de réservation'::text
            WHEN sa.l_comm2::text = '31'::text THEN 'réservé par une délibération de l''EPCI'::text
            WHEN sa.l_comm2::text = 'ZZ'::text THEN 'sans objet'::text
            WHEN sa.l_comm2::text = '00'::text THEN 'inconnu'::text
            WHEN sa.l_comm2::text = '99'::text THEN 'autre'::text
            ELSE NULL::text
        END::character varying AS terr_stade_comm,
        CASE
            WHEN eo.valeur::text = 'Non renseigné'::text THEN 'inconnu'::character varying
            WHEN eo.valeur::text = 'Autre'::text THEN 'autre'::character varying
            WHEN eo.valeur::text = 'Non concerné'::text THEN 'sans objet'::character varying
            ELSE eo.valeur
        END AS terr_etat_occup,
        CASE
            WHEN tu.valeur::text = 'Non renseigné'::text THEN 'inconnu'::character varying
            WHEN tu.valeur::text = 'Autre'::text THEN 'autre'::character varying
            WHEN tu.valeur::text = 'Non concerné'::text THEN 'sans objet'::character varying
            ELSE tu.valeur
        END AS terr_usage,
    st_asgeojson(f.geom) AS terr_geomsurf,
    NULL::text AS terr_cle_en_main,
    NULL::character varying AS terr_acquereur,
    NULL::character varying(10) AS terr_cession_date,
    NULL::integer AS terr_vente_montant,
    NULL::integer AS terr_m2_prix,
    f.geom
   FROM r_objet.geo_objet_fon_lot f
     JOIN m_activite_eco.an_eco_lot l ON f.idgeolf = l.idgeolf
     JOIN m_amenagement.lk_amt_lot_site a ON a.idgeolf = l.idgeolf
     JOIN m_activite_eco.geo_eco_site s ON s.idsite::text = a.idsite::text
     JOIN m_amenagement.an_amt_lot_stade sa ON sa.idgeolf = f.idgeolf
     JOIN m_amenagement.lt_amt_maifon mf ON mf.code::text = sa.maifon::text
     JOIN m_amenagement.lt_amt_etatoccup eo ON eo.code::text = sa.etat_occup::text
     JOIN m_amenagement.lt_amt_terrusage tu ON tu.code::text = sa.usage::text
  WHERE s.typsite::text <> '30'::text
UNION ALL
 SELECT (((f.insee::text || '_'::text) || 'TERRAIN-ECO'::text) || '_'::text) || f.idgeolf AS terr_id,
    s.site_id,
    NULL::character varying AS terr_refcad,
        CASE
            WHEN f.surf IS NULL OR f.surf = 0 THEN round(f.sup_m2::numeric / 10000::numeric, 2)
            ELSE round(f.surf::numeric / 10000::numeric, 2)
        END AS terr_surf_brute,
    'non'::character varying(3) AS terr_utile,
    f.date_sai::character varying(10) AS terr_identif_date,
    f.date_maj::character varying(10) AS terr_actu_date,
        CASE
            WHEN mf.valeur::text = 'Non renseignée'::text THEN 'inconnu'::character varying
            WHEN mf.valeur::text = 'Autre'::text THEN 'autre'::character varying
            WHEN mf.valeur::text = 'Non concernée'::text THEN 'sans objet'::character varying
            ELSE mf.valeur
        END AS terr_maitrise_fonc,
        CASE
            WHEN sa.l_amng2::text = '10'::text THEN 'viabilisé et aménagé'::text
            WHEN sa.l_amng2::text = '20'::text THEN 'non aménagé, non viabilisé'::text
            WHEN sa.l_amng2::text = '30'::text THEN 'non aménagé, non viabilisé'::text
            WHEN sa.l_amng2::text = 'ZZ'::text THEN 'sans objet'::text
            WHEN sa.l_amng2::text = '00'::text THEN 'inconnu'::text
            WHEN sa.l_amng2::text = '99'::text THEN 'autre'::text
            ELSE 'inconnu'::text
        END::character varying AS terr_stade_amngt,
        CASE
            WHEN sa.l_comm2::text = '11'::text THEN 'en vente'::text
            WHEN sa.l_comm2::text = '12'::text THEN 'en vente avec contraintes'::text
            WHEN sa.l_comm2::text = '20'::text THEN 'vendu, commercialisation achevée'::text
            WHEN sa.l_comm2::text = '32'::text THEN 'réservé par option de réservation'::text
            WHEN sa.l_comm2::text = '31'::text THEN 'réservé par une délibération de l''EPCI'::text
            WHEN sa.l_comm2::text = 'ZZ'::text THEN 'sans objet'::text
            WHEN sa.l_comm2::text = '00'::text THEN 'inconnu'::text
            WHEN sa.l_comm2::text = '99'::text THEN 'autre'::text
            ELSE 'inconnu'::text
        END::character varying AS terr_stade_comm,
        CASE
            WHEN eo.valeur::text = 'Non renseigné'::text THEN 'inconnu'::character varying
            WHEN eo.valeur::text = 'Autre'::text THEN 'autre'::character varying
            WHEN eo.valeur::text = 'Non concerné'::text THEN 'sans objet'::character varying
            ELSE eo.valeur
        END AS terr_etat_occup,
        CASE
            WHEN tu.valeur::text = 'Non renseigné'::text THEN 'inconnu'::character varying
            WHEN tu.valeur::text = 'Autre'::text THEN 'autre'::character varying
            WHEN tu.valeur::text = 'Non concerné'::text THEN 'sans objet'::character varying
            ELSE tu.valeur
        END AS terr_usage,
    st_asgeojson(f.geom) AS terr_geomsurf,
    NULL::text AS terr_cle_en_main,
    NULL::character varying AS terr_acquereur,
    NULL::character varying(10) AS terr_cession_date,
    NULL::integer AS terr_vente_montant,
    NULL::integer AS terr_m2_prix,
    f.geom
   FROM r_objet.geo_objet_fon_lot f
     JOIN m_amenagement.an_amt_lot_divers l ON f.idgeolf = l.idgeolf
     JOIN m_amenagement.lk_amt_lot_site a ON a.idgeolf = l.idgeolf
     JOIN m_activite_eco.geo_eco_site s ON s.idsite::text = a.idsite::text
     JOIN m_amenagement.an_amt_lot_stade sa ON sa.idgeolf = f.idgeolf
     JOIN m_amenagement.lt_amt_maifon mf ON mf.code::text = sa.maifon::text
     JOIN m_amenagement.lt_amt_etatoccup eo ON eo.code::text = sa.etat_occup::text
     JOIN m_amenagement.lt_amt_terrusage tu ON tu.code::text = sa.usage::text
  WHERE s.typsite::text <> '30'::text
UNION ALL
 SELECT (((f.insee::text || '_'::text) || 'TERRAIN-ECO'::text) || '_'::text) || f.idgeolf AS terr_id,
    s.site_id,
    NULL::character varying AS terr_refcad,
        CASE
            WHEN f.surf IS NULL OR f.surf = 0 THEN round(f.sup_m2::numeric / 10000::numeric, 2)
            ELSE round(f.surf::numeric / 10000::numeric, 2)
        END AS terr_surf_brute,
    'oui'::character varying(3) AS terr_utile,
    f.date_sai::character varying(10) AS terr_identif_date,
    f.date_maj::character varying(10) AS terr_actu_date,
        CASE
            WHEN mf.valeur::text = 'Non renseignée'::text THEN 'inconnu'::character varying
            WHEN mf.valeur::text = 'Autre'::text THEN 'autre'::character varying
            WHEN mf.valeur::text = 'Non concernée'::text THEN 'sans objet'::character varying
            ELSE mf.valeur
        END AS terr_maitrise_fonc,
        CASE
            WHEN sa.l_amng2::text = '10'::text THEN 'viabilisé et aménagé'::text
            WHEN sa.l_amng2::text = '20'::text THEN 'non aménagé, non viabilisé'::text
            WHEN sa.l_amng2::text = '30'::text THEN 'non aménagé, non viabilisé'::text
            WHEN sa.l_amng2::text = 'ZZ'::text THEN 'sans objet'::text
            WHEN sa.l_amng2::text = '00'::text THEN 'inconnu'::text
            WHEN sa.l_amng2::text = '99'::text THEN 'autre'::text
            ELSE 'inconnu'::text
        END::character varying AS terr_stade_amngt,
        CASE
            WHEN sa.l_comm2::text = '11'::text THEN 'en vente'::text
            WHEN sa.l_comm2::text = '12'::text THEN 'en vente avec contraintes'::text
            WHEN sa.l_comm2::text = '20'::text THEN 'vendu, commercialisation achevée'::text
            WHEN sa.l_comm2::text = '32'::text THEN 'réservé par option de réservation'::text
            WHEN sa.l_comm2::text = '31'::text THEN 'réservé par une délibération de l''EPCI'::text
            WHEN sa.l_comm2::text = 'ZZ'::text THEN 'sans objet'::text
            WHEN sa.l_comm2::text = '00'::text THEN 'inconnu'::text
            WHEN sa.l_comm2::text = '99'::text THEN 'autre'::text
            ELSE 'inconnu'::text
        END::character varying AS terr_stade_comm,
        CASE
            WHEN eo.valeur::text = 'Non renseigné'::text THEN 'inconnu'::character varying
            WHEN eo.valeur::text = 'Autre'::text THEN 'autre'::character varying
            WHEN eo.valeur::text = 'Non concerné'::text THEN 'sans objet'::character varying
            ELSE eo.valeur
        END AS terr_etat_occup,
        CASE
            WHEN tu.valeur::text = 'Non renseigné'::text THEN 'inconnu'::character varying
            WHEN tu.valeur::text = 'Autre'::text THEN 'autre'::character varying
            WHEN tu.valeur::text = 'Non concerné'::text THEN 'sans objet'::character varying
            ELSE tu.valeur
        END AS terr_usage,
    st_asgeojson(f.geom) AS terr_geomsurf,
    NULL::text AS terr_cle_en_main,
    NULL::character varying AS terr_acquereur,
    NULL::character varying(10) AS terr_cession_date,
    NULL::integer AS terr_vente_montant,
    NULL::integer AS terr_m2_prix,
    f.geom
   FROM r_objet.geo_objet_fon_lot f
     JOIN m_amenagement.an_amt_lot_mixt l ON f.idgeolf = l.idgeolf
     JOIN m_amenagement.lk_amt_lot_site a ON a.idgeolf = l.idgeolf
     JOIN m_activite_eco.geo_eco_site s ON s.idsite::text = a.idsite::text
     JOIN m_amenagement.an_amt_lot_stade sa ON sa.idgeolf = f.idgeolf
     JOIN m_amenagement.lt_amt_maifon mf ON mf.code::text = sa.maifon::text
     JOIN m_amenagement.lt_amt_etatoccup eo ON eo.code::text = sa.etat_occup::text
     JOIN m_amenagement.lt_amt_terrusage tu ON tu.code::text = sa.usage::text
  WHERE s.typsite::text <> '30'::text
UNION ALL
 SELECT (((f.insee::text || '_'::text) || 'TERRAIN-ECO'::text) || '_'::text) || f.idgeolf AS terr_id,
    s.site_id,
    NULL::character varying AS terr_refcad,
        CASE
            WHEN f.surf IS NULL OR f.surf = 0 THEN round(f.sup_m2::numeric / 10000::numeric, 2)
            ELSE round(f.surf::numeric / 10000::numeric, 2)
        END AS terr_surf_brute,
    'non'::character varying(3) AS terr_utile,
    f.date_sai::character varying(10) AS terr_identif_date,
    f.date_maj::character varying(10) AS terr_actu_date,
        CASE
            WHEN mf.valeur::text = 'Non renseignée'::text THEN 'inconnu'::character varying
            WHEN mf.valeur::text = 'Autre'::text THEN 'autre'::character varying
            WHEN mf.valeur::text = 'Non concernée'::text THEN 'sans objet'::character varying
            ELSE mf.valeur
        END AS terr_maitrise_fonc,
        CASE
            WHEN sa.l_amng2::text = '10'::text THEN 'viabilisé et aménagé'::text
            WHEN sa.l_amng2::text = '20'::text THEN 'non aménagé, non viabilisé'::text
            WHEN sa.l_amng2::text = '30'::text THEN 'non aménagé, non viabilisé'::text
            WHEN sa.l_amng2::text = 'ZZ'::text THEN 'sans objet'::text
            WHEN sa.l_amng2::text = '00'::text THEN 'inconnu'::text
            WHEN sa.l_amng2::text = '99'::text THEN 'autre'::text
            ELSE 'inconnu'::text
        END::character varying AS terr_stade_amngt,
        CASE
            WHEN sa.l_comm2::text = '11'::text THEN 'en vente'::text
            WHEN sa.l_comm2::text = '12'::text THEN 'en vente avec contraintes'::text
            WHEN sa.l_comm2::text = '20'::text THEN 'vendu, commercialisation achevée'::text
            WHEN sa.l_comm2::text = '32'::text THEN 'réservé par option de réservation'::text
            WHEN sa.l_comm2::text = '31'::text THEN 'réservé par une délibération de l''EPCI'::text
            WHEN sa.l_comm2::text = 'ZZ'::text THEN 'sans objet'::text
            WHEN sa.l_comm2::text = '00'::text THEN 'inconnu'::text
            WHEN sa.l_comm2::text = '99'::text THEN 'autre'::text
            ELSE 'inconnu'::text
        END::character varying AS terr_stade_comm,
        CASE
            WHEN eo.valeur::text = 'Non renseigné'::text THEN 'inconnu'::character varying
            WHEN eo.valeur::text = 'Autre'::text THEN 'autre'::character varying
            WHEN eo.valeur::text = 'Non concerné'::text THEN 'sans objet'::character varying
            ELSE eo.valeur
        END AS terr_etat_occup,
        CASE
            WHEN tu.valeur::text = 'Non renseigné'::text THEN 'inconnu'::character varying
            WHEN tu.valeur::text = 'Autre'::text THEN 'autre'::character varying
            WHEN tu.valeur::text = 'Non concerné'::text THEN 'sans objet'::character varying
            ELSE tu.valeur
        END AS terr_usage,
    st_asgeojson(f.geom) AS terr_geomsurf,
    NULL::text AS terr_cle_en_main,
    NULL::character varying AS terr_acquereur,
    NULL::character varying(10) AS terr_cession_date,
    NULL::integer AS terr_vente_montant,
    NULL::integer AS terr_m2_prix,
    f.geom
   FROM r_objet.geo_objet_fon_lot f
     JOIN m_amenagement.an_amt_lot_equip l ON f.idgeolf = l.idgeolf
     JOIN m_amenagement.lk_amt_lot_site a ON a.idgeolf = l.idgeolf
     JOIN m_activite_eco.geo_eco_site s ON s.idsite::text = a.idsite::text
     JOIN m_amenagement.an_amt_lot_stade sa ON sa.idgeolf = f.idgeolf
     JOIN m_amenagement.lt_amt_maifon mf ON mf.code::text = sa.maifon::text
     JOIN m_amenagement.lt_amt_etatoccup eo ON eo.code::text = sa.etat_occup::text
     JOIN m_amenagement.lt_amt_terrusage tu ON tu.code::text = sa.usage::text
  WHERE s.typsite::text <> '30'::text
UNION ALL
 SELECT (((f.insee::text || '_'::text) || 'TERRAIN-ECO'::text) || '_'::text) || f.idgeolf AS terr_id,
    s.site_id,
    NULL::character varying AS terr_refcad,
        CASE
            WHEN f.surf IS NULL OR f.surf = 0 THEN round(f.sup_m2::numeric / 10000::numeric, 2)
            ELSE round(f.surf::numeric / 10000::numeric, 2)
        END AS terr_surf_brute,
    'non'::character varying(3) AS terr_utile,
    f.date_sai::character varying(10) AS terr_identif_date,
    f.date_maj::character varying(10) AS terr_actu_date,
        CASE
            WHEN mf.valeur::text = 'Non renseignée'::text THEN 'inconnu'::character varying
            WHEN mf.valeur::text = 'Autre'::text THEN 'autre'::character varying
            WHEN mf.valeur::text = 'Non concernée'::text THEN 'sans objet'::character varying
            ELSE mf.valeur
        END AS terr_maitrise_fonc,
        CASE
            WHEN sa.l_amng2::text = '10'::text THEN 'viabilisé et aménagé'::text
            WHEN sa.l_amng2::text = '20'::text THEN 'non aménagé, non viabilisé'::text
            WHEN sa.l_amng2::text = '30'::text THEN 'non aménagé, non viabilisé'::text
            WHEN sa.l_amng2::text = 'ZZ'::text THEN 'sans objet'::text
            WHEN sa.l_amng2::text = '00'::text THEN 'inconnu'::text
            WHEN sa.l_amng2::text = '99'::text THEN 'autre'::text
            ELSE 'inconnu'::text
        END::character varying AS terr_stade_amngt,
        CASE
            WHEN sa.l_comm2::text = '11'::text THEN 'en vente'::text
            WHEN sa.l_comm2::text = '12'::text THEN 'en vente avec contraintes'::text
            WHEN sa.l_comm2::text = '20'::text THEN 'vendu, commercialisation achevée'::text
            WHEN sa.l_comm2::text = '32'::text THEN 'réservé par option de réservation'::text
            WHEN sa.l_comm2::text = '31'::text THEN 'réservé par une délibération de l''EPCI'::text
            WHEN sa.l_comm2::text = 'ZZ'::text THEN 'sans objet'::text
            WHEN sa.l_comm2::text = '00'::text THEN 'inconnu'::text
            WHEN sa.l_comm2::text = '99'::text THEN 'autre'::text
            ELSE 'inconnu'::text
        END::character varying AS terr_stade_comm,
        CASE
            WHEN eo.valeur::text = 'Non renseigné'::text THEN 'inconnu'::character varying
            WHEN eo.valeur::text = 'Autre'::text THEN 'autre'::character varying
            WHEN eo.valeur::text = 'Non concerné'::text THEN 'sans objet'::character varying
            ELSE eo.valeur
        END AS terr_etat_occup,
        CASE
            WHEN tu.valeur::text = 'Non renseigné'::text THEN 'inconnu'::character varying
            WHEN tu.valeur::text = 'Autre'::text THEN 'autre'::character varying
            WHEN tu.valeur::text = 'Non concerné'::text THEN 'sans objet'::character varying
            ELSE tu.valeur
        END AS terr_usage,
    st_asgeojson(f.geom) AS terr_geomsurf,
    NULL::text AS terr_cle_en_main,
    NULL::character varying AS terr_acquereur,
    NULL::character varying(10) AS terr_cession_date,
    NULL::integer AS terr_vente_montant,
    NULL::integer AS terr_m2_prix,
    f.geom
   FROM r_objet.geo_objet_fon_lot f
     JOIN m_amenagement.an_amt_lot_habitat l ON f.idgeolf = l.idgeolf
     JOIN m_amenagement.lk_amt_lot_site a ON a.idgeolf = l.idgeolf
     JOIN m_activite_eco.geo_eco_site s ON s.idsite::text = a.idsite::text
     JOIN m_amenagement.an_amt_lot_stade sa ON sa.idgeolf = f.idgeolf
     JOIN m_amenagement.lt_amt_maifon mf ON mf.code::text = sa.maifon::text
     JOIN m_amenagement.lt_amt_etatoccup eo ON eo.code::text = sa.etat_occup::text
     JOIN m_amenagement.lt_amt_terrusage tu ON tu.code::text = sa.usage::text
  WHERE s.typsite::text <> '30'::text
UNION ALL
 SELECT (((f.insee::text || '_'::text) || 'TERRAIN-ECO'::text) || '_'::text) || f.idgeolf AS terr_id,
    s.site_id,
    NULL::character varying AS terr_refcad,
        CASE
            WHEN f.surf IS NULL OR f.surf = 0 THEN round(f.sup_m2::numeric / 10000::numeric, 2)
            ELSE round(f.surf::numeric / 10000::numeric, 2)
        END AS terr_surf_brute,
    'non'::character varying(3) AS terr_utile,
    f.date_sai::character varying(10) AS terr_identif_date,
    f.date_maj::character varying(10) AS terr_actu_date,
        CASE
            WHEN mf.valeur::text = 'Non renseignée'::text THEN 'inconnu'::character varying
            WHEN mf.valeur::text = 'Autre'::text THEN 'autre'::character varying
            WHEN mf.valeur::text = 'Non concernée'::text THEN 'sans objet'::character varying
            ELSE mf.valeur
        END AS terr_maitrise_fonc,
        CASE
            WHEN sa.l_amng2::text = '10'::text THEN 'viabilisé et aménagé'::text
            WHEN sa.l_amng2::text = '20'::text THEN 'non aménagé, non viabilisé'::text
            WHEN sa.l_amng2::text = '30'::text THEN 'non aménagé, non viabilisé'::text
            WHEN sa.l_amng2::text = 'ZZ'::text THEN 'sans objet'::text
            WHEN sa.l_amng2::text = '00'::text THEN 'inconnu'::text
            WHEN sa.l_amng2::text = '99'::text THEN 'inconnu'::text
            ELSE 'inconnu'::text
        END::character varying AS terr_stade_amngt,
        CASE
            WHEN sa.l_comm2::text = '11'::text THEN 'en vente'::text
            WHEN sa.l_comm2::text = '12'::text THEN 'en vente avec contraintes'::text
            WHEN sa.l_comm2::text = '20'::text THEN 'vendu, commercialisation achevée'::text
            WHEN sa.l_comm2::text = '32'::text THEN 'réservé par option de réservation'::text
            WHEN sa.l_comm2::text = '31'::text THEN 'réservé par une délibération de l''EPCI'::text
            WHEN sa.l_comm2::text = 'ZZ'::text THEN 'sans objet'::text
            WHEN sa.l_comm2::text = '00'::text THEN 'inconnu'::text
            WHEN sa.l_comm2::text = '99'::text THEN 'inconnu'::text
            ELSE 'inconnu'::text
        END::character varying AS terr_stade_comm,
        CASE
            WHEN eo.valeur::text = 'Non renseigné'::text THEN 'inconnu'::character varying
            WHEN eo.valeur::text = 'Autre'::text THEN 'autre'::character varying
            WHEN eo.valeur::text = 'Non concerné'::text THEN 'sans objet'::character varying
            ELSE eo.valeur
        END AS terr_etat_occup,
        CASE
            WHEN tu.valeur::text = 'Non renseigné'::text THEN 'inconnu'::character varying
            WHEN tu.valeur::text = 'Autre'::text THEN 'autre'::character varying
            WHEN tu.valeur::text = 'Non concerné'::text THEN 'sans objet'::character varying
            ELSE tu.valeur
        END AS terr_usage,
    st_asgeojson(f.geom) AS terr_geomsurf,
    NULL::text AS terr_cle_en_main,
    NULL::character varying AS terr_acquereur,
    NULL::character varying(10) AS terr_cession_date,
    NULL::integer AS terr_vente_montant,
    NULL::integer AS terr_m2_prix,
    f.geom
   FROM r_objet.geo_objet_fon_lot f
     JOIN m_amenagement.an_amt_lot_esppublic l ON f.idgeolf = l.idgeolf
     JOIN m_amenagement.lk_amt_lot_site a ON a.idgeolf = l.idgeolf
     JOIN m_activite_eco.geo_eco_site s ON s.idsite::text = a.idsite::text
     JOIN m_amenagement.an_amt_lot_stade sa ON sa.idgeolf = f.idgeolf
     JOIN m_amenagement.lt_amt_maifon mf ON mf.code::text = sa.maifon::text
     JOIN m_amenagement.lt_amt_etatoccup eo ON eo.code::text = sa.etat_occup::text
     JOIN m_amenagement.lt_amt_terrusage tu ON tu.code::text = sa.usage::text
  WHERE s.typsite::text <> '30'::text;

COMMENT ON VIEW m_activite_eco.xopendata_geo_eco_terrain_cnig IS 'Vue de la couche terrain d''activité du standard CNIG 2023';
COMMENT ON COLUMN m_activite_eco.xopendata_geo_eco_terrain_cnig.terr_id IS 'identifiant du terrain à vocation économique';
COMMENT ON COLUMN m_activite_eco.xopendata_geo_eco_terrain_cnig.site_id IS 'identifiant du site où se situe le terrain économique';
COMMENT ON COLUMN m_activite_eco.xopendata_geo_eco_terrain_cnig.terr_refcad IS 'liste des identifiants de parcelles cadastrales intersectés par le terrain économique';
COMMENT ON COLUMN m_activite_eco.xopendata_geo_eco_terrain_cnig.terr_surf_brute IS 'superficie brute du terrain économique en hectare';
COMMENT ON COLUMN m_activite_eco.xopendata_geo_eco_terrain_cnig.terr_utile IS 'superficie à prendre en compte (oui / non) dans le calcul de la surface utile du site';
COMMENT ON COLUMN m_activite_eco.xopendata_geo_eco_terrain_cnig.terr_identif_date IS 'date d''identification du terrain économique. Exemple : 2016-03-26';
COMMENT ON COLUMN m_activite_eco.xopendata_geo_eco_terrain_cnig.terr_actu_date IS 'date de dernière actu. des informations du terrain éco. Ex: 2023-04-30';
COMMENT ON COLUMN m_activite_eco.xopendata_geo_eco_terrain_cnig.terr_maitrise_fonc IS 'maîtrise foncière majoritaire du terrain économique. La typologie reprend la colonne "observation" de la variable catpropro2 dans la table pnb10_parcelle des fichiers fonciers';
COMMENT ON COLUMN m_activite_eco.xopendata_geo_eco_terrain_cnig.terr_stade_amngt IS 'stade d’aménagement du terrain économique';
COMMENT ON COLUMN m_activite_eco.xopendata_geo_eco_terrain_cnig.terr_stade_comm IS 'stade de commercialisation du terrain économique';
COMMENT ON COLUMN m_activite_eco.xopendata_geo_eco_terrain_cnig.terr_etat_occup IS 'état d''occupation du terrain économique';
COMMENT ON COLUMN m_activite_eco.xopendata_geo_eco_terrain_cnig.terr_usage IS 'usage du terrain économique';
COMMENT ON COLUMN m_activite_eco.xopendata_geo_eco_terrain_cnig.terr_geomsurf IS 'géométrie surfacique du terrain économique au format GeoJSON';
COMMENT ON COLUMN m_activite_eco.xopendata_geo_eco_terrain_cnig.terr_cle_en_main IS 'terrain purgé (oui / non) de tout recours et directement prêt à l''implantation d''activité';
COMMENT ON COLUMN m_activite_eco.xopendata_geo_eco_terrain_cnig.terr_acquereur IS 'nom de l''acquéreur du terrain à vocation économique';
COMMENT ON COLUMN m_activite_eco.xopendata_geo_eco_terrain_cnig.terr_cession_date IS 'date de la cession';
COMMENT ON COLUMN m_activite_eco.xopendata_geo_eco_terrain_cnig.terr_vente_montant IS 'montant de la vente';
COMMENT ON COLUMN m_activite_eco.xopendata_geo_eco_terrain_cnig.terr_m2_prix IS 'prix au m²';

