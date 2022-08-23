/*Amt_Fon_Eco V2.0*/
/*Creation du squelette de la structure des données (table, séquence, trigger,...) */
/* afe_101_squelette.sql */
/*PostGIS*/

/* Propriétaire : GeoCompiegnois - http://geo.compiegnois.fr/ */
/* Auteur : Grégory Bodet */

-- NETTOYAGE

/* VIEW */
DROP VIEW IF EXISTS m_activite_eco.geo_v_eco_lot;
DROP VIEW IF EXISTS r_objet.geo_v_lot;
DROP VIEW IF EXISTS m_amenagement.geo_v_empesp_pu;
DROP VIEW IF EXISTS m_amenagement.geo_v_lot_equ;
DROP VIEW IF EXISTS m_amenagement.geo_v_lot_hab;
DROP VIEW IF EXISTS m_amenagement.geo_v_lot_mixte;
DROP VIEW IF EXISTS m_amenagement.geo_v_lot_esppu;

/* TABLE */
DROP TABLE IF EXISTS  m_activite_eco.an_eco_pole;
DROP TABLE IF EXISTS  m_activite_eco.geo_eco_site;
DROP TABLE IF EXISTS m_activite_eco.an_eco_media;
DROP TABLE IF EXISTS m_activite_eco.an_eco_lot_media;
DROP TABLE IF EXISTS m_urbanisme_reg.an_proc_media;
DROP TABLE IF EXISTS m_activite_eco.an_eco_contact CASCADE;
DROP TABLE IF EXISTS m_activite_eco.an_eco_evenmt;
DROP TABLE IF EXISTS m_urbanisme_reg.geo_proced;
DROP TABLE IF EXISTS m_activite_eco.an_eco_lot;
DROP TABLE IF EXISTS m_amenagement.an_amt_lot_stade;
DROP TABLE IF EXISTS m_amenagement.an_amt_esppu;
DROP TABLE IF EXISTS m_amenagement.an_amt_lot_divers;
DROP TABLE IF EXISTS m_amenagement.an_amt_lot_equ;
DROP TABLE IF EXISTS m_amenagement.an_amt_lot_hab;
DROP TABLE IF EXISTS m_amenagement.an_amt_lot_mixte;
DROP TABLE IF EXISTS r_objet.geo_objet_empesp_pu;
DROP TABLE IF EXISTS r_objet.geo_objet_fon_lot;
DROP TABLE IF EXISTS m_activite_eco.geo_eco_bati_act;
DROP TABLE IF EXISTS m_activite_eco.geo_eco_loc_act;
DROP TABLE IF EXISTS m_activite_eco.geo_eco_loc_patri;
DROP TABLE IF EXISTS m_activite_eco.an_eco_patri_media;
DROP TABLE IF EXISTS m_activite_eco.an_eco_evenmt_media;
DROP TABLE IF EXISTS m_ectivite_eco.an_eco_etab;
DROP TABLE IF EXISTS m_activite_eco.an_eco_etab;
DROP TABLE IF EXISTS m_activite_eco.an_eco_etab_rad;
DROP TABLE IF EXISTS m_activite_eco.an_eco_dia;
DROP TABLE IF EXISTS m_activite_eco.geo_eco_etabp;
DROP TABLE IF EXISTS m_activite_eco.geo_eco_geoloc_salarie;
DROP TABLE IF EXISTS m_activite_eco.geo_eco_site_zu;
DROP TABLE IF EXISTS m_activite_eco.h_an_eco_etab;
DROP TABLE IF EXISTS m_activite_eco.h_an_eco_site;
DROP TABLE IF EXISTS m_foncier.an_cession;
DROP TABLE IF EXISTS m_foncier.an_fon_doc_media;
DROP TABLE IF EXISTS m_foncier.an_fon_cession_horsarc;
DROP TABLE IF EXISTS m_foncier.an_fon_cession_horsarc_media;
DROP TABLE IF EXISTS m_amenagement.an_amt_site_hab_mixte;
DROP TABLE IF EXISTS m_amenagement.an_amt_site_equ;
DROP TABLE IF EXISTS m_amenagement.an_amt_proc_media;
DROP TABLE IF EXISTS s_sirene.an_etablissement_api;
DROP TABLE IF EXISTS s_sirene.an_unitelegale_api;
DROP TABLE IF EXISTS m_amenagement.an_amt_proc_media;
DROP TABLE IF EXISTS m_amenagement.an_amt_lot_esppu;


/* TABLE DE RELATION */
DROP TABLE IF EXISTS m_activite_eco.lk_eco_contact;
DROP TABLE IF EXISTS m_activite_eco.lk_eco_proc;
DROP TABLE IF EXISTS m_amenagement.lk_amt_lot_site;
DROP TABLE IF EXISTS m_activite_eco.lk_eco_loc_site;
DROP TABLE IF EXISTS m_activite_eco.lk_eco_bati_site;
DROP TABLE IF EXISTS m_activite_eco.lk_eco_bati_loc;
DROP TABLE IF EXISTS m_activite_eco.lk_eco_loc_etab;
DROP TABLE IF EXISTS m_activite_eco.lk_adresseetablissement;
DROP TABLE IF EXISTS m_activite_eco.lk_eco_bati_adr;
DROP TABLE IF EXISTS m_activite_eco.lk_eco_loc_adr;
DROP TABLE IF EXISTS m_foncier.lk_cession_lot;
DROP TABLE IF EXISTS s_sirene.lk_sirene_succession;

/* LISTE DE VALEUR */
DROP TABLE IF EXISTS m_activite_eco.lt_eco_dest;
DROP TABLE IF EXISTS m_activite_eco.lt_eco_etat;
DROP TABLE IF EXISTS m_activite_eco.lt_eco_voca;
DROP TABLE IF EXISTS m_activite_eco.lt_eco_typo;
DROP TABLE IF EXISTS m_activite_eco.lt_eco_typsite;
DROP TABLE IF EXISTS m_activite_eco.lt_eco_tdocmedia;
DROP TABLE IF EXISTS m_activite_eco.lt_eco_typcontact;
DROP TABLE IF EXISTS m_activite_eco.lt_eco_typevenmt;
DROP TABLE IF EXISTS m_urbanisme_reg.lt_proc_typconso;
DROP TABLE IF EXISTS m_urbanisme_reg.lt_proc_phase;
DROP TABLE IF EXISTS m_urbanisme_reg.lt_proc_typ;
DROP TABLE IF EXISTS m_urbanisme_reg.lt_proc_typfon;
DROP TABLE IF EXISTS m_activite_eco.lt_eco_tact;
DROP TABLE IF EXISTS m_amenagement.lt_amt_stadeamng;
DROP TABLE IF EXISTS m_amenagement.lt_amt_stadeamng2;
DROP TABLE IF EXISTS m_amenagement.lt_amt_stadecomm;
DROP TABLE IF EXISTS m_amenagement.lt_amt_stadecomm2;
DROP TABLE IF EXISTS m_amenagement.lt_amt_empesp_pu;
DROP TABLE IF EXISTS r_objet.lt_objet_vocafon;
DROP TABLE IF EXISTS m_activite_eco.lt_eco_typloc;
DROP TABLE IF EXISTS m_activite_eco.lt_eco_occuploc;
DROP TABLE IF EXISTS m_activite_eco.lt_ces_doc;
DROP TABLE IF EXISTS m_foncier.lt_ces_cond;
DROP TABLE IF EXISTS m_foncier.lt_ces_doc;
DROP TABLE IF EXISTS m_foncier.lt_ces_etat;
DROP TABLE IF EXISTS m_foncier.lt_ces_nota;
DROP TABLE IF EXISTS m_foncier.lt_ces_orga;
DROP TABLE IF EXISTS m_foncier.lt_ces_tact;
DROP TABLE IF EXISTS m_foncier.lt_ces_voca;
DROP TABLE IF EXISTS m_foncier.lt_rel_lot;


/* SEQUENCE */
DROP SEQUENCE IF EXISTS m_activite_eco.an_eco_pole_seq;
DROP SEQUENCE IF EXISTS m_activite_eco.geo_eco_site_seq;
DROP SEQUENCE IF EXISTS m_activite_eco.an_eco_media_seq;
DROP SEQUENCE IF EXISTS m_activite_eco.an_eco_contact_seq;
DROP SEQUENCE IF EXISTS m_activite_eco.lk_eco_contact_seq;
DROP SEQUENCE IF EXISTS m_activite_eco.an_eco_evenmt_seq;
DROP SEQUENCE IF EXISTS m_urbanisme_reg.geo_proced_seq;
DROP SEQUENCE IF EXISTS m_activite_eco.lk_eco_proc_seq;
DROP SEQUENCE IF EXISTS m_activite_eco.lk_eco_proc_seq;
DROP SEQUENCE IF EXISTS m_urbanisme_reg.an_proc_media_seq;
DROP SEQUENCE IF EXISTS m_amenagement.lk_amt_lot_site_seq;
DROP SEQUENCE IF EXISTS m_activite_eco.an_eco_patri_media_seq;
DROP SEQUENCE IF EXISTS m_activite_eco.geo_eco_loc_act_seq;
DROP SEQUENCE IF EXISTS m_activite_eco.geo_eco_loc_patri_seq;
DROP SEQUENCE IF EXISTS m_activite_eco.geo_eco_bati_act_seq;
DROP SEQUENCE IF EXISTS m_activite_eco.lk_eco_bati_site_seq;
DROP SEQUENCE IF EXISTS m_activite_eco.lk_eco_bati_loc_seq;
DROP SEQUENCE IF EXISTS m_activite_eco.lk_eco_loc_etab_seq;
DROP SEQUENCE IF EXISTS m_activite_eco.an_eco_evenmt_media_seq;
DROP SEQUENCE IF EXISTS m_activite_eco.an_eco_etab_seq;
DROP SEQUENCE IF EXISTS m_activite_eco.an_eco_etab_rad_seq;
DROP SEQUENCE IF EXISTS m_activite_eco.an_eco_dia_seq;
DROP SEQUENCE IF EXISTS m_activite_eco.geo_eco_geoloc_salarie_seq;
DROP SEQUENCE IF EXISTS m_activite_eco.h_an_eco_site_seq;
DROP SEQUENCE IF EXISTS m_activite_eco.h_an_eco_etab_seq;
DROP SEQUENCE IF EXISTS m_activite_eco.lk_adresseetablissement_seq;
DROP SEQUENCE IF EXISTS m_activite_eco.lk_eco_bati_adr_seq;
DROP SEQUENCE IF EXISTS m_activite_eco.lk_eco_loc_adr_seq;
DROP SEQUENCE IF EXISTS m_foncier.an_fon_doc_media_gid_seq;
DROP SEQUENCE IF EXISTS m_foncier.ces_seq;
DROP SEQUENCE IF EXISTS m_foncier.an_fon_cession_horsarc_media_seq;
DROP SEQUENCE IF EXISTS m_foncier.an_fon_cession_horsarc_seq;
DROP SEQUENCE IF EXISTS m_amenagement.an_amt_proc_media_seq;
DROP SEQUENCE IF EXISTS s_sirene.lk_sirene_succession_seq;
DROP SEQUENCE IF EXISTS s_sirene.an_etablissement_api_gid_seq;
DROP SEQUENCE IF EXISTS s_sirene.an_unitelegale_api_gid_seq;
DROP SEQUENCE IF EXISTS r_objet.idgeo_seq;


/* TRIGGERS */

DROP TRIGGER IF EXISTS t_t1_foncier_delete ON r_objet.geo_v_lot;
DROP TRIGGER IF EXISTS t_t2_foncier_insert ON r_objet.geo_v_lot;
DROP TRIGGER IF EXISTS t_t3_foncier_update ON r_objet.geo_v_lot;
DROP TRIGGER IF EXISTS t_t1_delete_lot_eco ON m_activite_eco.geo_v_eco_lot;
DROP TRIGGER IF EXISTS t_t2_insert_lot_eco ON m_activite_eco.geo_v_eco_lot;
DROP TRIGGER IF EXISTS t_t3_modif_lot_eco ON m_activite_eco.geo_v_eco_lot;

-- ####################################################################################################################################################
-- ###                                                                                                                                              ###
-- ###                                                                SCHEMA                                                                        ###
-- ###                                                                                                                                              ###
-- ####################################################################################################################################################

-- SCHEMA: m_activite_eco

-- DROP SCHEMA m_activite_eco ;
/*
CREATE SCHEMA m_activite_eco
    AUTHORIZATION create_sig;

COMMENT ON SCHEMA m_activite_eco
    IS 'Schéma contenant le nouveau modèle de données pour gérer l''activité économique suite à la mutualisation aux EPCI du Grand Compoiégnois';

GRANT ALL ON SCHEMA m_activite_eco TO create_sig;

ALTER DEFAULT PRIVILEGES IN SCHEMA m_activite_eco
GRANT SELECT ON TABLES TO sig_read;

ALTER DEFAULT PRIVILEGES IN SCHEMA m_activite_eco
GRANT ALL ON TABLES TO create_sig;

ALTER DEFAULT PRIVILEGES IN SCHEMA m_activite_eco
GRANT INSERT, SELECT, UPDATE, DELETE ON TABLES TO sig_edit;

-- SCHEMA: m_foncier

-- DROP SCHEMA m_foncier ;

CREATE SCHEMA m_foncier
    AUTHORIZATION create_sig;

COMMENT ON SCHEMA m_foncier
    IS 'Données géographiques métiers sur le thème du foncier';

GRANT ALL ON SCHEMA m_foncier TO create_sig;

GRANT ALL ON SCHEMA m_foncier TO sig_edit;

GRANT ALL ON SCHEMA m_foncier TO sig_read;

ALTER DEFAULT PRIVILEGES IN SCHEMA m_foncier
GRANT ALL ON TABLES TO sig_create;

ALTER DEFAULT PRIVILEGES IN SCHEMA m_foncier
GRANT SELECT ON TABLES TO sig_read;

ALTER DEFAULT PRIVILEGES IN SCHEMA m_foncier
GRANT ALL ON TABLES TO create_sig;

ALTER DEFAULT PRIVILEGES IN SCHEMA m_foncier
GRANT INSERT, SELECT, UPDATE, DELETE ON TABLES TO sig_edit;

-- SCHEMA: s_sirene

-- DROP SCHEMA s_sirene ;

CREATE SCHEMA s_sirene
    AUTHORIZATION create_sig;

COMMENT ON SCHEMA s_sirene
    IS 'Données du référentiel SIRENE de l''INSEE sur les établissements (la table sirene_liste_juil2015 sera remplacée lors de la migration de la base et de la réinjection des historiques de SIRENE réalisée dans le cadre du test sur l''urbanisation des données)';

GRANT ALL ON SCHEMA s_sirene TO create_sig;

GRANT ALL ON SCHEMA s_sirene TO sig_edit;

GRANT ALL ON SCHEMA s_sirene TO sig_read;

ALTER DEFAULT PRIVILEGES IN SCHEMA s_sirene
GRANT ALL ON TABLES TO create_sig;

ALTER DEFAULT PRIVILEGES IN SCHEMA s_sirene
GRANT ALL ON TABLES TO sig_create;

ALTER DEFAULT PRIVILEGES IN SCHEMA s_sirene
GRANT INSERT, SELECT, UPDATE, DELETE ON TABLES TO sig_edit;

ALTER DEFAULT PRIVILEGES IN SCHEMA s_sirene
GRANT SELECT ON TABLES TO sig_read;

*/

-- ####################################################################################################################################################
-- ###                                                                                                                                              ###
-- ###                                                                SEQUENCE                                                                      ###
-- ###                                                                                                                                              ###
-- ####################################################################################################################################################


-- ####################################################################################################################################################
-- ###                                                          SEQUENCE M_ACTIVITE_ECO                                                             ###
-- ####################################################################################################################################################



-- ############################################################## [an_eco_pole_seq] ###################################################################

-- SEQUENCE: m_activite_eco.an_eco_pole_seq

-- DROP SEQUENCE m_activite_eco.an_eco_pole_seq;

CREATE SEQUENCE m_activite_eco.an_eco_pole_seq
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 9223372036854775807
    CACHE 1;

ALTER SEQUENCE m_activite_eco.an_eco_pole_seq
    OWNER TO create_sig;

GRANT ALL ON SEQUENCE m_activite_eco.an_eco_pole_seq TO PUBLIC;
GRANT ALL ON SEQUENCE m_activite_eco.an_eco_pole_seq TO create_sig;

-- ############################################################## [geo_eco_site_seq] ##################################################################

-- SEQUENCE: m_activite_eco.geo_eco_site_seq

-- DROP SEQUENCE m_activite_eco.geo_eco_site_seq;

CREATE SEQUENCE m_activite_eco.geo_eco_site_seq
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 9223372036854775807
    CACHE 1;

ALTER SEQUENCE m_activite_eco.geo_eco_site_seq
    OWNER TO create_sig;

GRANT ALL ON SEQUENCE m_activite_eco.geo_eco_site_seq TO PUBLIC;
GRANT ALL ON SEQUENCE m_activite_eco.geo_eco_site_seq TO create_sig;


-- ############################################################## [an_eco_media_seq] ##################################################################

-- SEQUENCE: m_activite_eco.an_eco_media_seq

-- DROP SEQUENCE m_activite_eco.an_eco_media_seq;

CREATE SEQUENCE m_activite_eco.an_eco_media_seq
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 9223372036854775807
    CACHE 1;

ALTER SEQUENCE m_activite_eco.an_eco_media_seq
    OWNER TO create_sig;

GRANT ALL ON SEQUENCE m_activite_eco.an_eco_media_seq TO PUBLIC;
GRANT ALL ON SEQUENCE m_activite_eco.an_eco_media_seq TO create_sig;

-- ############################################################## [an_eco_contact_seq] ##################################################################

-- SEQUENCE: m_activite_eco.an_eco_contact_seq

-- DROP SEQUENCE m_activite_eco.an_eco_contact_seq;

CREATE SEQUENCE m_activite_eco.an_eco_contact_seq
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 9223372036854775807
    CACHE 1;

ALTER SEQUENCE m_activite_eco.an_eco_contact_seq
    OWNER TO create_sig;

GRANT ALL ON SEQUENCE m_activite_eco.an_eco_contact_seq TO PUBLIC;
GRANT ALL ON SEQUENCE m_activite_eco.an_eco_contact_seq TO create_sig;

-- ############################################################## [lk_eco_contact_seq] ##################################################################

-- SEQUENCE: m_activite_eco.lk_eco_contact_seq

-- DROP SEQUENCE m_activite_eco.lk_eco_contact_seq;

CREATE SEQUENCE m_activite_eco.lk_eco_contact_seq
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 9223372036854775807
    CACHE 1;

ALTER SEQUENCE m_activite_eco.lk_eco_contact_seq
    OWNER TO create_sig;

GRANT ALL ON SEQUENCE m_activite_eco.lk_eco_contact_seq TO PUBLIC;
GRANT ALL ON SEQUENCE m_activite_eco.lk_eco_contact_seq TO create_sig;

-- ############################################################## [an_eco_evenmt_seq] ##################################################################

-- SEQUENCE: m_activite_eco.an_eco_evenmt_seq

-- DROP SEQUENCE m_activite_eco.an_eco_evenmt_seq;

CREATE SEQUENCE m_activite_eco.an_eco_evenmt_seq
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 9223372036854775807
    CACHE 1;

ALTER SEQUENCE m_activite_eco.an_eco_evenmt_seq
    OWNER TO create_sig;

GRANT ALL ON SEQUENCE m_activite_eco.an_eco_evenmt_seq TO PUBLIC;
GRANT ALL ON SEQUENCE m_activite_eco.an_eco_evenmt_seq TO create_sig;

-- ############################################################## [lk_eco_proc_seq] ##################################################################

-- SEQUENCE: m_activite_eco.lk_eco_proc_seq

-- DROP SEQUENCE m_activite_eco.lk_eco_proc_seq;

CREATE SEQUENCE m_activite_eco.lk_eco_proc_seq
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 9223372036854775807
    CACHE 1;

ALTER SEQUENCE m_activite_eco.lk_eco_proc_seq
    OWNER TO create_sig;

GRANT ALL ON SEQUENCE m_activite_eco.lk_eco_proc_seq TO PUBLIC;
GRANT ALL ON SEQUENCE m_activite_eco.lk_eco_proc_seq TO create_sig;

-- ############################################################## [lk_eco_bati_site_seq] ##################################################################

-- SEQUENCE: m_activite_eco.lk_eco_bati_site_seq

-- DROP SEQUENCE m_activite_eco.lk_eco_bati_site_seq;

CREATE SEQUENCE m_activite_eco.lk_eco_bati_site_seq
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 9223372036854775807
    CACHE 1;

ALTER SEQUENCE m_activite_eco.lk_eco_bati_site_seq
    OWNER TO create_sig;

GRANT ALL ON SEQUENCE m_activite_eco.lk_eco_bati_site_seq TO PUBLIC;
GRANT ALL ON SEQUENCE m_activite_eco.lk_eco_bati_site_seq TO create_sig;


-- ############################################################## [geo_eco_bati_act_seq] ##################################################################

-- SEQUENCE: m_activite_eco.geo_eco_bati_act_seq

-- DROP SEQUENCE m_activite_eco.geo_eco_bati_act_seq;

CREATE SEQUENCE m_activite_eco.geo_eco_bati_act_seq
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 9223372036854775807
    CACHE 1;

ALTER SEQUENCE m_activite_eco.geo_eco_bati_act_seq
    OWNER TO create_sig;

GRANT ALL ON SEQUENCE m_activite_eco.geo_eco_bati_act_seq TO PUBLIC;
GRANT ALL ON SEQUENCE m_activite_eco.geo_eco_bati_act_seq TO create_sig;

-- ############################################################## [lk_eco_bati_loc_seq] ##################################################################

-- SEQUENCE: m_activite_eco.lk_eco_bati_loc_seq

-- DROP SEQUENCE m_activite_eco.lk_eco_bati_loc_seq;

CREATE SEQUENCE m_activite_eco.lk_eco_bati_loc_seq
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 9223372036854775807
    CACHE 1;

ALTER SEQUENCE m_activite_eco.lk_eco_bati_loc_seq
    OWNER TO create_sig;

GRANT ALL ON SEQUENCE m_activite_eco.lk_eco_bati_loc_seq TO PUBLIC;
GRANT ALL ON SEQUENCE m_activite_eco.lk_eco_bati_loc_seq TO create_sig;

-- ############################################################## [geo_eco_loc_act_seq] ##################################################################

-- SEQUENCE: m_activite_eco.geo_eco_loc_act_seq

-- DROP SEQUENCE m_activite_eco.geo_eco_loc_act_seq;

CREATE SEQUENCE m_activite_eco.geo_eco_loc_act_seq
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 9223372036854775807
    CACHE 1;

ALTER SEQUENCE m_activite_eco.geo_eco_loc_act_seq
    OWNER TO create_sig;

GRANT ALL ON SEQUENCE m_activite_eco.geo_eco_loc_act_seq TO PUBLIC;
GRANT ALL ON SEQUENCE m_activite_eco.geo_eco_loc_act_seq TO create_sig;


-- ############################################################## [geo_eco_loc_patri_seq] ##################################################################

-- SEQUENCE: m_activite_eco.geo_eco_loc_patri_seq

-- DROP SEQUENCE m_activite_eco.geo_eco_loc_patri_seq;

CREATE SEQUENCE m_activite_eco.geo_eco_loc_patri_seq
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 9223372036854775807
    CACHE 1;

ALTER SEQUENCE m_activite_eco.geo_eco_loc_patri_seq
    OWNER TO create_sig;

GRANT ALL ON SEQUENCE m_activite_eco.geo_eco_loc_patri_seq TO PUBLIC;
GRANT ALL ON SEQUENCE m_activite_eco.geo_eco_loc_patri_seq TO create_sig;

-- ############################################################## [an_eco_patri_media_seq] ##################################################################

-- SEQUENCE: m_activite_eco.an_eco_patri_media_seq

-- DROP SEQUENCE m_activite_eco.an_eco_patri_media_seq;

CREATE SEQUENCE m_activite_eco.an_eco_patri_media_seq
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 9223372036854775807
    CACHE 1;

ALTER SEQUENCE m_activite_eco.an_eco_patri_media_seq
    OWNER TO create_sig;

GRANT ALL ON SEQUENCE m_activite_eco.an_eco_patri_media_seq TO PUBLIC;
GRANT ALL ON SEQUENCE m_activite_eco.an_eco_patri_media_seq TO create_sig;

-- ############################################################## [lk_eco_loc_etab_seq] ##################################################################

-- SEQUENCE: m_activite_eco.lk_eco_loc_etab_seq

-- DROP SEQUENCE m_activite_eco.lk_eco_loc_etab_seq;

CREATE SEQUENCE m_activite_eco.lk_eco_loc_etab_seq
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 9223372036854775807
    CACHE 1;

ALTER SEQUENCE m_activite_eco.lk_eco_loc_etab_seq
    OWNER TO create_sig;

GRANT ALL ON SEQUENCE m_activite_eco.lk_eco_loc_etab_seq TO PUBLIC;
GRANT ALL ON SEQUENCE m_activite_eco.lk_eco_loc_etab_seq TO create_sig;

-- ############################################################## [an_eco_evenmt_media_seq] ##################################################################

-- SEQUENCE: m_activite_eco.an_eco_evenmt_media_seq

-- DROP SEQUENCE m_activite_eco.an_eco_evenmt_media_seq;

CREATE SEQUENCE m_activite_eco.an_eco_evenmt_media_seq
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 9223372036854775807
    CACHE 1;

ALTER SEQUENCE m_activite_eco.an_eco_evenmt_media_seq
    OWNER TO create_sig;

GRANT ALL ON SEQUENCE m_activite_eco.an_eco_evenmt_media_seq TO PUBLIC;
GRANT ALL ON SEQUENCE m_activite_eco.an_eco_evenmt_media_seq TO create_sig;

-- ############################################################## [an_eco_etab_seq] ##################################################################

-- SEQUENCE: m_activite_eco.an_eco_etab_seq

-- DROP SEQUENCE m_activite_eco.an_eco_etab_seq;

CREATE SEQUENCE m_activite_eco.an_eco_etab_seq
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 9223372036854775807
    CACHE 1;

ALTER SEQUENCE m_activite_eco.an_eco_etab_seq
    OWNER TO create_sig;

GRANT ALL ON SEQUENCE m_activite_eco.an_eco_etab_seq TO PUBLIC;
GRANT ALL ON SEQUENCE m_activite_eco.an_eco_etab_seq TO create_sig;


-- ############################################################## [an_eco_etab_rad_seq] ##################################################################

-- SEQUENCE: m_activite_eco.an_eco_etab_rad_seq

-- DROP SEQUENCE m_activite_eco.an_eco_etab_rad_seq;

CREATE SEQUENCE m_activite_eco.an_eco_etab_rad_seq
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 9223372036854775807
    CACHE 1;

ALTER SEQUENCE m_activite_eco.an_eco_etab_rad_seq
    OWNER TO create_sig;

GRANT ALL ON SEQUENCE m_activite_eco.an_eco_etab_rad_seq TO PUBLIC;
GRANT ALL ON SEQUENCE m_activite_eco.an_eco_etab_rad_seq TO create_sig;

-- ############################################################## [an_eco_dia_seq] ##################################################################

-- SEQUENCE: m_activite_eco.an_eco_dia_seq

-- DROP SEQUENCE m_activite_eco.an_eco_dia_seq;

CREATE SEQUENCE m_activite_eco.an_eco_dia_seq
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 9223372036854775807
    CACHE 1;

ALTER SEQUENCE m_activite_eco.an_eco_dia_seq
    OWNER TO create_sig;

GRANT ALL ON SEQUENCE m_activite_eco.an_eco_dia_seq TO PUBLIC;
GRANT ALL ON SEQUENCE m_activite_eco.an_eco_dia_seq TO create_sig;

-- ############################################################## [geo_eco_geoloc_salarie_seq] ##################################################################

-- SEQUENCE: m_activite_eco.geo_eco_geoloc_salarie_seq

-- DROP SEQUENCE m_activite_eco.geo_eco_geoloc_salarie_seq;

CREATE SEQUENCE m_activite_eco.geo_eco_geoloc_salarie_seq
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 9223372036854775807
    CACHE 1;

ALTER SEQUENCE m_activite_eco.geo_eco_geoloc_salarie_seq
    OWNER TO create_sig;

GRANT ALL ON SEQUENCE m_activite_eco.geo_eco_geoloc_salarie_seq TO PUBLIC;
GRANT ALL ON SEQUENCE m_activite_eco.geo_eco_geoloc_salarie_seq TO create_sig;


-- ############################################################## [h_an_eco_etab_seq] ##################################################################

-- SEQUENCE: m_activite_eco.h_an_eco_etab_seq

-- DROP SEQUENCE m_activite_eco.h_an_eco_etab_seq;

CREATE SEQUENCE m_activite_eco.h_an_eco_etab_seq
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 9223372036854775807
    CACHE 1;

ALTER SEQUENCE m_activite_eco.h_an_eco_etab_seq
    OWNER TO create_sig;

GRANT ALL ON SEQUENCE m_activite_eco.h_an_eco_etab_seq TO PUBLIC;
GRANT ALL ON SEQUENCE m_activite_eco.h_an_eco_etab_seq TO create_sig;

-- ############################################################## [h_an_eco_site_seq] ##################################################################

-- SEQUENCE: m_activite_eco.h_an_eco_site_seq

-- DROP SEQUENCE m_activite_eco.h_an_eco_site_seq;

CREATE SEQUENCE m_activite_eco.h_an_eco_site_seq
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 9223372036854775807
    CACHE 1;

ALTER SEQUENCE m_activite_eco.h_an_eco_site_seq
    OWNER TO create_sig;

GRANT ALL ON SEQUENCE m_activite_eco.h_an_eco_site_seq TO PUBLIC;
GRANT ALL ON SEQUENCE m_activite_eco.h_an_eco_site_seq TO create_sig;

-- ############################################################## [lk_adresseetablissement_seq] ##################################################################

-- SEQUENCE: m_activite_eco.lk_adresseetablissement_seq

-- DROP SEQUENCE m_activite_eco.lk_adresseetablissement_seq;

CREATE SEQUENCE m_activite_eco.lk_adresseetablissement_seq
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 9223372036854775807
    CACHE 1;

ALTER SEQUENCE m_activite_eco.lk_adresseetablissement_seq
    OWNER TO create_sig;

GRANT ALL ON SEQUENCE m_activite_eco.lk_adresseetablissement_seq TO PUBLIC;
GRANT ALL ON SEQUENCE m_activite_eco.lk_adresseetablissement_seq TO create_sig;

-- ############################################################## [lk_eco_bati_adr_seq] ##################################################################

-- SEQUENCE: m_activite_eco.lk_eco_bati_adr_seq

-- DROP SEQUENCE m_activite_eco.lk_eco_bati_adr_seq;

CREATE SEQUENCE m_activite_eco.lk_eco_bati_adr_seq
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 9223372036854775807
    CACHE 1;

ALTER SEQUENCE m_activite_eco.lk_eco_bati_adr_seq
    OWNER TO create_sig;

GRANT ALL ON SEQUENCE m_activite_eco.lk_eco_bati_adr_seq TO PUBLIC;
GRANT ALL ON SEQUENCE m_activite_eco.lk_eco_bati_adr_seq TO create_sig;

-- ############################################################## [lk_eco_loc_adr_seq] ##################################################################

-- SEQUENCE: m_activite_eco.lk_eco_loc_adr_seq

-- DROP SEQUENCE m_activite_eco.lk_eco_loc_adr_seq;

CREATE SEQUENCE m_activite_eco.lk_eco_loc_adr_seq
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 9223372036854775807
    CACHE 1;

ALTER SEQUENCE m_activite_eco.lk_eco_loc_adr_seq
    OWNER TO create_sig;

GRANT ALL ON SEQUENCE m_activite_eco.lk_eco_loc_adr_seq TO PUBLIC;
GRANT ALL ON SEQUENCE m_activite_eco.lk_eco_loc_adr_seq TO create_sig;

-- ####################################################################################################################################################
-- ###                                                            SEQUENCE M_AMENAGEMENT                                                            ###
-- ####################################################################################################################################################


-- ############################################################## [geo_proced_seq] ##################################################################

-- SEQUENCE: m_urbanisme_reg.geo_proced_seq

-- DROP SEQUENCE m_urbanisme_reg.geo_proced_seq;

CREATE SEQUENCE m_urbanisme_reg.geo_proced_seq
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 9223372036854775807
    CACHE 1;

ALTER SEQUENCE m_urbanisme_reg.geo_proced_seq
    OWNER TO create_sig;

GRANT ALL ON SEQUENCE m_urbanisme_reg.geo_proced_seq TO PUBLIC;
GRANT ALL ON SEQUENCE m_urbanisme_reg.geo_proced_seq TO create_sig;





-- ############################################################## [an_proc_media_seq] ##################################################################

-- SEQUENCE: m_urbanisme_reg.an_proc_media_seq

-- DROP SEQUENCE m_urbanisme_reg.an_proc_media_seq;

CREATE SEQUENCE m_urbanisme_reg.an_proc_media_seq
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 9223372036854775807
    CACHE 1;

ALTER SEQUENCE m_urbanisme_reg.an_proc_media_seq
    OWNER TO create_sig;

GRANT ALL ON SEQUENCE m_urbanisme_reg.an_proc_media_seq TO PUBLIC;
GRANT ALL ON SEQUENCE m_urbanisme_reg.an_proc_media_seq TO create_sig;

-- ############################################################## [an_amt_proc_media_seq] ##################################################################

-- SEQUENCE: m_amenagement.an_amt_proc_media_seq

-- DROP SEQUENCE m_amenagement.an_amt_proc_media_seq;

CREATE SEQUENCE m_amenagement.an_amt_proc_media_seq
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 9223372036854775807
    CACHE 1;

ALTER SEQUENCE m_amenagement.an_amt_proc_media_seq
    OWNER TO create_sig;

GRANT ALL ON SEQUENCE m_amenagement.an_amt_proc_media_seq TO PUBLIC;
GRANT ALL ON SEQUENCE m_amenagement.an_amt_proc_media_seq TO create_sig;


-- ############################################################## [lk_amt_lot_site_seq] ##################################################################

-- SEQUENCE: m_amenagement.lk_amt_lot_site_seq

-- DROP SEQUENCE m_amenagement.lk_amt_lot_site_seq;

CREATE SEQUENCE m_amenagement.lk_amt_lot_site_seq
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 9223372036854775807
    CACHE 1;

ALTER SEQUENCE m_amenagement.lk_amt_lot_site_seq
    OWNER TO create_sig;

GRANT ALL ON SEQUENCE m_amenagement.lk_amt_lot_site_seq TO PUBLIC;
GRANT ALL ON SEQUENCE m_amenagement.lk_amt_lot_site_seq TO create_sig;

-- ####################################################################################################################################################
-- ###                                                               SEQUENCE M_FONCIER                                                             ###
-- ####################################################################################################################################################


-- ############################################################## [ces_seq] ##################################################################

-- SEQUENCE: m_foncier.ces_seq

-- DROP SEQUENCE m_foncier.ces_seq;

CREATE SEQUENCE m_foncier.ces_seq
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 9223372036854775807
    CACHE 1;

ALTER SEQUENCE m_foncier.ces_seq
    OWNER TO create_sig;

GRANT ALL ON SEQUENCE m_foncier.ces_seq TO PUBLIC;

GRANT ALL ON SEQUENCE m_foncier.ces_seq TO create_sig;

GRANT ALL ON SEQUENCE m_foncier.ces_seq TO postgres;

-- ############################################################## [an_fon_doc_media_gid_seq] ##################################################################

-- SEQUENCE: m_foncier.an_fon_doc_media_gid_seq

-- DROP SEQUENCE m_foncier.an_fon_doc_media_gid_seq;

CREATE SEQUENCE m_foncier.an_fon_doc_media_gid_seq
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 9223372036854775807
    CACHE 1;

ALTER SEQUENCE m_foncier.an_fon_doc_media_gid_seq
    OWNER TO create_sig;

GRANT ALL ON SEQUENCE m_foncier.an_fon_doc_media_gid_seq TO PUBLIC;

GRANT ALL ON SEQUENCE m_foncier.an_fon_doc_media_gid_seq TO create_sig;

-- ############################################################## [an_fon_cession_horsarc_media_seq] ##################################################################


-- SEQUENCE: m_foncier.an_fon_cession_horsarc_media_seq

-- DROP SEQUENCE m_foncier.an_fon_cession_horsarc_media_seq;

CREATE SEQUENCE m_foncier.an_fon_cession_horsarc_media_seq
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 9223372036854775807
    CACHE 1;

ALTER SEQUENCE m_foncier.an_fon_cession_horsarc_media_seq
    OWNER TO create_sig;

GRANT ALL ON SEQUENCE m_foncier.an_fon_cession_horsarc_media_seq TO PUBLIC;

GRANT ALL ON SEQUENCE m_foncier.an_fon_cession_horsarc_media_seq TO create_sig;


-- ############################################################## [an_fon_cession_horsarc_seq] ##################################################################


-- SEQUENCE: m_foncier.an_fon_cession_horsarc_seq

-- DROP SEQUENCE m_foncier.an_fon_cession_horsarc_seq;

CREATE SEQUENCE m_foncier.an_fon_cession_horsarc_seq
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 9223372036854775807
    CACHE 1;

ALTER SEQUENCE m_foncier.an_fon_cession_horsarc_seq
    OWNER TO create_sig;

GRANT ALL ON SEQUENCE m_foncier.an_fon_cession_horsarc_seq TO PUBLIC;

GRANT ALL ON SEQUENCE m_foncier.an_fon_cession_horsarc_seq TO create_sig;





-- ############################################################## [an_etablissement_api_gid_seq] ##################################################################


-- SEQUENCE: s_sirene.an_etablissement_api_gid_seq

-- DROP SEQUENCE s_sirene.an_etablissement_api_gid_seq;

CREATE SEQUENCE s_sirene.an_etablissement_api_gid_seq
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 9223372036854775807
    CACHE 1;

ALTER SEQUENCE s_sirene.an_etablissement_api_gid_seq
    OWNER TO create_sig;

GRANT ALL ON SEQUENCE s_sirene.an_etablissement_api_gid_seq TO PUBLIC;

GRANT ALL ON SEQUENCE s_sirene.an_etablissement_api_gid_seq TO create_sig;

-- ############################################################## [an_unitelegale_api_gid_seq] ##################################################################


-- SEQUENCE: s_sirene.an_unitelegale_api_gid_seq

-- DROP SEQUENCE s_sirene.an_unitelegale_api_gid_seq;

CREATE SEQUENCE s_sirene.an_unitelegale_api_gid_seq
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 9223372036854775807
    CACHE 1;

ALTER SEQUENCE s_sirene.an_unitelegale_api_gid_seq
    OWNER TO create_sig;

GRANT ALL ON SEQUENCE s_sirene.an_unitelegale_api_gid_seq TO PUBLIC;

GRANT ALL ON SEQUENCE s_sirene.an_unitelegale_api_gid_seq TO create_sig;

-- ####################################################################################################################################################
-- ###                                                               SEQUENCE R_OBJET                                                               ###
-- ####################################################################################################################################################


-- ############################################################## [idgeo_seq] ##################################################################

-- SEQUENCE: r_objet.idgeo_seq

-- DROP SEQUENCE r_objet.idgeo_seq;

CREATE SEQUENCE r_objet.idgeo_seq
    INCREMENT 1
    START 1
    MINVALUE 100000
    MAXVALUE 99999999999999999
    CACHE 1;

ALTER SEQUENCE r_objet.idgeo_seq
    OWNER TO postgres;

GRANT SELECT ON SEQUENCE public.idgeo_seq TO PUBLIC;

GRANT ALL ON SEQUENCE public.idgeo_seq TO postgres;

-- ####################################################################################################################################################
-- ###                                                                                                                                              ###
-- ###                                                                FONCTION                                                                      ###
-- ###                                                                                                                                              ###
-- ####################################################################################################################################################

-- ####################################################################################################################################################
-- ###                                                         FONCTION M_ACTIVITE_ECO                                                              ###
-- ####################################################################################################################################################


-- ##################################################### [m_activite_eco.ft_m_delete_lot_eco] #########################################################

-- FUNCTION: m_activite_eco.ft_m_delete_lot_eco()

-- DROP FUNCTION m_activite_eco.ft_m_delete_lot_eco();

CREATE OR REPLACE FUNCTION m_activite_eco.ft_m_delete_lot_eco()
    RETURNS trigger
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE NOT LEAKPROOF
AS $BODY$

BEGIN

    IF (select insee from r_osm.geo_osm_commune where st_intersects(st_pointonsurface(old.geom),geom)) 
	 IN ('60023','60067','60068','60070','60151','60156','60159','60323','60325','60326','60337','60338','60382','60402','60447',
		'60447','60578','60579','60597','60600','60665','60667','60674') THEN 
    
    DELETE FROM m_foncier.an_cession WHERE idces=(SELECT lf.idces FROM m_foncier.an_cession f, m_foncier.lk_cession_lot lf WHERE f.idces=lf.idces AND lf.idgeolf=old.idgeolf);
    DELETE FROM m_foncier.lk_cession_lot WHERE idgeolf=old.idgeolf;
    ELSE
	DELETE FROM m_foncier.an_fon_cession_horsarc_media WHERE id = old.idgeolf;
	
	END IF;
    DELETE FROM m_amenagement.lk_amt_lot_site WHERE idgeolf=old.idgeolf;
    DELETE FROM m_activite_eco.an_eco_lot WHERE idgeolf=old.idgeolf;
    DELETE FROM r_objet.geo_objet_fon_lot WHERE idgeolf=old.idgeolf;
    DELETE FROM m_amenagement.an_amt_lot_stade WHERE idgeolf=old.idgeolf;
    return new ;

END;

$BODY$;

ALTER FUNCTION m_activite_eco.ft_m_delete_lot_eco()
    OWNER TO create_sig;

GRANT EXECUTE ON FUNCTION m_activite_eco.ft_m_delete_lot_eco() TO PUBLIC;

GRANT EXECUTE ON FUNCTION m_activite_eco.ft_m_delete_lot_eco() TO create_sig;

COMMENT ON FUNCTION m_activite_eco.ft_m_delete_lot_eco()
    IS 'Fonction gérant la suppression des données correspondant à la gestion des lots à vocation économique';


-- ##################################################### [m_activite_eco.ft_m_insert_lot_eco] #########################################################


-- FUNCTION: m_activite_eco.ft_m_insert_lot_eco()

-- DROP FUNCTION m_activite_eco.ft_m_insert_lot_eco();

CREATE  OR REPLACE FUNCTION m_activite_eco.ft_m_insert_lot_eco()
    RETURNS trigger
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE NOT LEAKPROOF
AS $BODY$

DECLARE v_idces integer;
DECLARE v_idgeolf integer;
DECLARE lot_surf integer;
DECLARE v_idces_horsarc integer;

BEGIN

     v_idgeolf := (SELECT nextval('r_objet.idgeo_seq'::regclass));

     INSERT INTO r_objet.geo_objet_fon_lot SELECT v_idgeolf,new.op_sai,new.ref_spa,null,'20',new.geom,now(),null,new.l_nom;
     INSERT INTO m_amenagement.an_amt_lot_stade SELECT v_idgeolf,
						  new.stade_amng,
						  new.l_amng2,
						  new.stade_comm,
						  new.l_comm2,
						  new.l_comm2_12,
						  new.etat_occup;

     lot_surf:=round(cast(st_area(new.geom) as numeric),0);

    -- insertion des lots uniquements économiques (pour la vente) dans la table métier économie
    -- recherche si le lot dessiner est dans un site activité : si oui copie une ligne dans le métier eco et foncier, si non copie uniquement dans le métier foncier
    

						INSERT INTO m_activite_eco.an_eco_lot SELECT v_idgeolf,
						 
						  CASE WHEN new.surf IS NOT NULL THEN new.surf ELSE lot_surf END,
						  CASE WHEN new.surf IS NOT NULL THEN
						  
								   CASE WHEN length(cast (new.surf as character varying)) >= 1 and length(cast (new.surf as character varying)) <= 3 THEN new.surf || 'm²'
								   WHEN length(cast (new.surf as character varying)) = 4 THEN replace(to_char(new.surf,'FM9G999'),',',' ') || 'm²'
								   WHEN length(cast (new.surf as character varying)) = 5 THEN replace(to_char(new.surf,'FM99G999'),',',' ') || 'm²'
								   WHEN length(cast (new.surf as character varying)) = 6 THEN replace(to_char(new.surf,'FM999G999'),',',' ') || 'm²'
								   WHEN length(cast (new.surf as character varying)) = 7 THEN replace(to_char(new.surf,'FM9G999G999'),',',' ') || 'm²'
								   WHEN length(cast (new.surf as character varying)) = 8 THEN replace(to_char(new.surf,'FM99G999G999'),',',' ') || 'm²'
								   END
						  ELSE	
						  			CASE WHEN length(cast (lot_surf as character varying)) >= 1 and length(cast (lot_surf as character varying)) <= 3 THEN lot_surf || 'm²'
								   WHEN length(cast (lot_surf as character varying)) = 4 THEN replace(to_char(lot_surf,'FM9G999'),',',' ') || 'm²'
								   WHEN length(cast (lot_surf as character varying)) = 5 THEN replace(to_char(lot_surf,'FM99G999'),',',' ') || 'm²'
								   WHEN length(cast (lot_surf as character varying)) = 6 THEN replace(to_char(lot_surf,'FM999G999'),',',' ') || 'm²'
								   WHEN length(cast (lot_surf as character varying)) = 7 THEN replace(to_char(lot_surf,'FM9G999G999'),',',' ') || 'm²'
								   WHEN length(cast (lot_surf as character varying)) = 8 THEN replace(to_char(lot_surf,'FM99G999G999'),',',' ') || 'm²'
								   END
						  END,
						  null,
						  new.op_sai_att,
						  new.org_sai_att,
						  new.tact,
						  new.tact_99,
						  new.cnom,
						  new.lnom,
						  null,
						  null,
						  new.eff_dep,
						  new.eff_n5,
						  CASE WHEN new.conv IS NULL THEN false ELSE new.conv END,
						  new.datefin_conv,
						  new.observ,
						  now(),
						  now(),
						  new.bati,
						  new.pc_depot,
						  new.pc_accord,
						  new.pc_tra,
						  new.pc_fin,
						  new.pvente_e,
						  null,
						  new.pc_num,
						  new.pc_mo,
						  new.pers_v,
						  new.oripro,
						  new.occupant,
						  new.descrip,
						  (select string_agg(insee, ', ') from r_osm.geo_osm_commune where st_intersects(st_buffer(new.geom,-1),geom)),
						  (select string_agg(commune, ', ') from r_osm.geo_osm_commune where st_intersects(st_buffer(new.geom,-1),geom)),
						  new.epci
						  ;
						  
						  
						 			
     -- ici contrôle si hors ARC ne passe pas
     IF (select insee from r_osm.geo_osm_commune where st_intersects(st_pointonsurface(new.geom),geom)) 
	 IN ('60023','60067','60068','60070','60151','60156','60159','60323','60325','60326','60337','60338','60382','60402','60447',
		'60447','60578','60579','60597','60600','60665','60667','60674') THEN 

     -- calcul de l'identifiant du dossier de cession
     v_idces := (SELECT nextval('m_foncier.ces_seq'::regclass));

     -- insertion de tous lots fonciers dans la table métier foncier
     INSERT INTO m_foncier.lk_cession_lot SELECT v_idgeolf, v_idces;	

     -- insertion d'une ligne dans an_cession en créant un idces qui est lui même réinjecté dans lk_cession_lot

     /* ATTENTION : LEUR DE LA MISE EN PRODUCTION REMETTRE DANS L'ORDRE LES CHAMPS SUIVANTS IDCES, L_COMPO, L_OBSERV ==> cd table an_cession pour vérification */
     
     INSERT INTO m_foncier.an_cession VALUES 	(
						v_idces, -- idces
						'10',
						false, -- relation
						'00',
						'00',
						null,
						null,
						null,
						(SELECT insee FROM r_osm.geo_osm_commune WHERE st_intersects(st_pointonsurface(new.geom),geom)),
						null,
						'00',
						new.l_lnom,
						null,
						null,
						null,
						null,
						null,
						null,
						null,
						'00',
						'00',
						null,
						null,
						'00',
						null,
						null,
						null,
						false,
						false,
						false,
						false,
						false,
						null,
						null,
						null,
						false,
						false,
						false,
						null,
						null,
						null,
						null,
						null,
						null,
							null
						);

		END IF;
		
		-- association d'un lot à un ou plusieurs sites
		INSERT INTO m_amenagement.lk_amt_lot_site (idsite,idgeolf)
		SELECT idsite, v_idgeolf FROM m_activite_eco.geo_eco_site WHERE st_intersects(st_pointonsurface(new.geom),geom) IS TRUE;
		

     return new ;

END;

$BODY$;

ALTER FUNCTION m_activite_eco.ft_m_insert_lot_eco()
    OWNER TO create_sig;

GRANT EXECUTE ON FUNCTION m_activite_eco.ft_m_insert_lot_eco() TO PUBLIC;

GRANT EXECUTE ON FUNCTION m_activite_eco.ft_m_insert_lot_eco() TO create_sig;

COMMENT ON FUNCTION m_activite_eco.ft_m_insert_lot_eco()
    IS 'Fonction gérant la mise à jour des données correspondant à la gestion des lots à vocation économique';



-- ##################################################### [m_activite_eco.ft_m_modif_lot_eco] #########################################################

-- FUNCTION: m_activite_eco.ft_m_modif_lot_eco()

-- DROP FUNCTION m_activite_eco.ft_m_modif_lot_eco();

CREATE FUNCTION m_activite_eco.ft_m_modif_lot_eco()
    RETURNS trigger
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE NOT LEAKPROOF
AS $BODY$

DECLARE DECLARE lot_surf integer;

BEGIN

--calcul de la surface de l'objet
lot_surf:=round(cast(st_area(new.geom) as numeric),0);

		UPDATE r_objet.geo_objet_fon_lot SET geom = new.geom, date_maj = now(), src_geom = new.ref_spa, op_sai=new.op_sai,l_nom = new.l_nom WHERE idgeolf = new.idgeolf;

		UPDATE m_amenagement.an_amt_lot_stade SET stade_amng = new.stade_amng, l_amng2 = new.l_amng2, stade_comm = new.stade_comm, l_comm2 = new.l_comm2, l_comm2_12 = new.l_comm2_12, etat_occup =  new.etat_occup WHERE idgeolf = new.idgeolf;

		UPDATE m_activite_eco.an_eco_lot SET
		   	                
							surf = CASE WHEN (new.surf IS NULL OR St_equals(new.geom,old.geom) IS FALSE) THEN lot_surf ELSE new.surf END ,
							surf_l = 
								   CASE WHEN length(cast ((CASE WHEN (new.surf IS NULL OR St_equals(new.geom,old.geom) IS FALSE) THEN lot_surf ELSE new.surf END) as character varying)) >= 1 and length(cast ((CASE WHEN (new.surf IS NULL OR St_equals(new.geom,old.geom) IS FALSE) THEN lot_surf ELSE new.surf END) as character varying)) <= 3 THEN (CASE WHEN (new.surf IS NULL OR St_equals(new.geom,old.geom) IS FALSE) THEN lot_surf ELSE new.surf END) || 'm²'
								   WHEN length(cast ((CASE WHEN (new.surf IS NULL OR St_equals(new.geom,old.geom) IS FALSE) THEN lot_surf ELSE new.surf END) as character varying)) = 4 THEN replace(to_char((CASE WHEN (new.surf IS NULL OR St_equals(new.geom,old.geom) IS FALSE) THEN lot_surf ELSE new.surf END),'FM9G999'),',',' ') || 'm²'
								   WHEN length(cast ((CASE WHEN (new.surf IS NULL OR St_equals(new.geom,old.geom) IS FALSE) THEN lot_surf ELSE new.surf END) as character varying)) = 5 THEN replace(to_char((CASE WHEN (new.surf IS NULL OR St_equals(new.geom,old.geom) IS FALSE) THEN lot_surf ELSE new.surf END),'FM99G999'),',',' ') || 'm²'
								   WHEN length(cast ((CASE WHEN (new.surf IS NULL OR St_equals(new.geom,old.geom) IS FALSE) THEN lot_surf ELSE new.surf END) as character varying)) = 6 THEN replace(to_char((CASE WHEN (new.surf IS NULL OR St_equals(new.geom,old.geom) IS FALSE) THEN lot_surf ELSE new.surf END),'FM999G999'),',',' ') || 'm²'
								   WHEN length(cast ((CASE WHEN (new.surf IS NULL OR St_equals(new.geom,old.geom) IS FALSE) THEN lot_surf ELSE new.surf END) as character varying)) = 7 THEN replace(to_char((CASE WHEN (new.surf IS NULL OR St_equals(new.geom,old.geom) IS FALSE) THEN lot_surf ELSE new.surf END),'FM9G999G999'),',',' ') || 'm²'
								   WHEN length(cast ((CASE WHEN (new.surf IS NULL OR St_equals(new.geom,old.geom) IS FALSE) THEN lot_surf ELSE new.surf END) as character varying)) = 8 THEN replace(to_char((CASE WHEN (new.surf IS NULL OR St_equals(new.geom,old.geom) IS FALSE) THEN lot_surf ELSE new.surf END),'FM99G999G999'),',',' ') || 'm²'
								   END,
							date_maj = now(),
							op_sai = new.op_sai_att,
							org_sai = new.org_sai_att,
							tact = new.tact,
							tact_99 = new.tact_99,
							cnom = new.cnom,
							lnom = new.lnom,
							pvente_e = new.pvente_e,
							eff_dep = new.eff_dep,
							eff_n5 = new.eff_n5,
							conv = new.conv,
							datefin_conv = new.datefin_conv,
							observ = new.observ,
							bati = new.bati,
							pc_depot = new.pc_depot,
							pc_accord = new.pc_accord,
							pc_tra = new.pc_tra,
							pc_fin = new.pc_fin,
							pc_num=new.pc_num,
							pc_mo=new.pc_mo,
							pers_v=new.pers_v,
							oripro = new.oripro,
							occupant=new.occupant,
							descrip=new.descrip,
							epci = new.epci
		WHERE an_eco_lot.idgeolf=new.idgeolf;

     return new;
END
$BODY$;

ALTER FUNCTION m_activite_eco.ft_m_modif_lot_eco()
    OWNER TO create_sig;

GRANT EXECUTE ON FUNCTION m_activite_eco.ft_m_modif_lot_eco() TO PUBLIC;

GRANT EXECUTE ON FUNCTION m_activite_eco.ft_m_modif_lot_eco() TO create_sig;


-- ############################################################ [ft_m_an_sa_etab_l_nom_null] #######################################################################

-- FUNCTION: m_activite_eco.ft_m_an_sa_etab_l_nom_null()

-- DROP FUNCTION m_activite_eco.ft_m_an_sa_etab_l_nom_null();

CREATE OR REPLACE FUNCTION m_activite_eco.ft_m_an_sa_etab_l_nom_null()
    RETURNS trigger
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE NOT LEAKPROOF
AS $BODY$

begin

 -- gestion des valeurs '' quand suppression d'une valeur dans une fiche GEO
 update m_activite_eco.an_eco_etab set l_nom = null where l_nom = '';        


	return new; 
end;

$BODY$;

ALTER FUNCTION m_activite_eco.ft_m_an_sa_etab_l_nom_null()
    OWNER TO create_sig;

GRANT EXECUTE ON FUNCTION m_activite_eco.ft_m_an_sa_etab_l_nom_null() TO PUBLIC;

GRANT EXECUTE ON FUNCTION m_activite_eco.ft_m_an_sa_etab_l_nom_null() TO create_sig;

COMMENT ON FUNCTION m_activite_eco.ft_m_an_sa_etab_l_nom_null()
    IS 'Fonction forçant le champ à null quand insertion ou mise à jour de l''attribut pour éviter les '''' (pb d''afficchage des étiquettes dans GEO)';



-- ############################################################ [ft_m_an_sa_etab_oldsiret] #######################################################################

-- FUNCTION: m_activite_eco.ft_m_an_sa_etab_oldsiret()

-- DROP FUNCTION m_activite_eco.ft_m_an_sa_etab_oldsiret();

CREATE OR REPLACE FUNCTION m_activite_eco.ft_m_an_sa_etab_oldsiret()
    RETURNS trigger
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE NOT LEAKPROOF
AS $BODY$BEGIN


IF new.old_siret is not null or new.old_siret <> '' THEN

update m_activite_eco.an_eco_etab set eff_etab = (select eff_etab from m_activite_eco.an_eco_etab where idsiret = new.old_siret) WHERE idsiret=new.idsiret;
update m_activite_eco.an_eco_etab set source_eff = (select source_eff from m_activite_eco.an_eco_etab where idsiret = new.old_siret) WHERE idsiret=new.idsiret;
update m_activite_eco.an_eco_etab set l_date_eff = (select l_date_eff from m_activite_eco.an_eco_etab where idsiret = new.old_siret) WHERE idsiret=new.idsiret;
update m_activite_eco.an_eco_etab set op_sai = (select op_sai from m_activite_eco.an_eco_etab where idsiret = new.old_siret) WHERE idsiret=new.idsiret;
update m_activite_eco.an_eco_etab set org_sai = (select org_sai from m_activite_eco.an_eco_etab where idsiret = new.old_siret) WHERE idsiret=new.idsiret;
update m_activite_eco.an_eco_etab set l_tel = (select l_tel from m_activite_eco.an_eco_etab where idsiret = new.old_siret) WHERE idsiret=new.idsiret;
update m_activite_eco.an_eco_etab set l_mail = (select l_mail from m_activite_eco.an_eco_etab where idsiret = new.old_siret) WHERE idsiret=new.idsiret;
update m_activite_eco.an_eco_etab set l_url = (select l_url from m_activite_eco.an_eco_etab where idsiret = new.old_siret) WHERE idsiret=new.idsiret;
update m_activite_eco.an_eco_etab set l_nom_dir = (select l_nom_dir from m_activite_eco.an_eco_etab where idsiret = new.old_siret) WHERE idsiret=new.idsiret;
update m_activite_eco.an_eco_etab set l_titre = (select l_titre from m_activite_eco.an_eco_etab where idsiret = new.old_siret) WHERE idsiret=new.idsiret;
update m_activite_eco.an_eco_etab set source_maj_dir = (select source_maj_dir from m_activite_eco.an_eco_etab where idsiret = new.old_siret) WHERE idsiret=new.idsiret;
update m_activite_eco.an_eco_etab set date_maj_dir = (select date_maj_dir from m_activite_eco.an_eco_etab where idsiret = new.old_siret) WHERE idsiret=new.idsiret;
update m_activite_eco.an_eco_etab set l_mail_dir = (select l_mail_dir from m_activite_eco.an_eco_etab where idsiret = new.old_siret) WHERE idsiret=new.idsiret;
update m_activite_eco.an_eco_etab set l_tel_dir = (select l_tel_dir from m_activite_eco.an_eco_etab where idsiret = new.old_siret) WHERE idsiret=new.idsiret;
update m_activite_eco.an_eco_etab set l_telp_dir = (select l_telp_dir from m_activite_eco.an_eco_etab where idsiret = new.old_siret) WHERE idsiret=new.idsiret;
update m_activite_eco.an_eco_etab set l_nom_aut = (select l_nom_aut from m_activite_eco.an_eco_etab where idsiret = new.old_siret) WHERE idsiret=new.idsiret;
update m_activite_eco.an_eco_etab set l_titre_aut = (select l_titre_aut from m_activite_eco.an_eco_etab where idsiret = new.old_siret) WHERE idsiret=new.idsiret;
update m_activite_eco.an_eco_etab set date_maj_aut = (select date_maj_aut from m_activite_eco.an_eco_etab where idsiret = new.old_siret) WHERE idsiret=new.idsiret;
update m_activite_eco.an_eco_etab set l_mail_aut = (select l_mail_aut from m_activite_eco.an_eco_etab where idsiret = new.old_siret) WHERE idsiret=new.idsiret;
update m_activite_eco.an_eco_etab set l_tel_aut = (select l_tel_aut from m_activite_eco.an_eco_etab where idsiret = new.old_siret) WHERE idsiret=new.idsiret;
update m_activite_eco.an_eco_etab set l_telp_aut = (select l_telp_aut from m_activite_eco.an_eco_etab where idsiret = new.old_siret) WHERE idsiret=new.idsiret;
update m_activite_eco.an_eco_etab set l_nom_drh = (select l_nom_drh from m_activite_eco.an_eco_etab where idsiret = new.old_siret) WHERE idsiret=new.idsiret;
update m_activite_eco.an_eco_etab set l_titre_drh = (select l_titre_drh from m_activite_eco.an_eco_etab where idsiret = new.old_siret) WHERE idsiret=new.idsiret;
update m_activite_eco.an_eco_etab set date_maj_drh = (select date_maj_drh from m_activite_eco.an_eco_etab where idsiret = new.old_siret) WHERE idsiret=new.idsiret;
update m_activite_eco.an_eco_etab set l_mail_drh = (select l_mail_drh from m_activite_eco.an_eco_etab where idsiret = new.old_siret) WHERE idsiret=new.idsiret;
update m_activite_eco.an_eco_etab set l_tel_drh = (select l_tel_drh from m_activite_eco.an_eco_etab where idsiret = new.old_siret) WHERE idsiret=new.idsiret;
update m_activite_eco.an_eco_etab set l_drh_ss = (select l_drh_ss from m_activite_eco.an_eco_etab where idsiret = new.old_siret) WHERE idsiret=new.idsiret;
update m_activite_eco.an_eco_etab set l_drh_ad = (select l_drh_ad from m_activite_eco.an_eco_etab where idsiret = new.old_siret) WHERE idsiret=new.idsiret;
update m_activite_eco.an_eco_etab set l_nom_ad = (select l_nom_ad from m_activite_eco.an_eco_etab where idsiret = new.old_siret) WHERE idsiret=new.idsiret;
update m_activite_eco.an_eco_etab set l_titre_ad = (select l_titre_ad from m_activite_eco.an_eco_etab where idsiret = new.old_siret) WHERE idsiret=new.idsiret;
update m_activite_eco.an_eco_etab set date_maj_ad = (select date_maj_ad from m_activite_eco.an_eco_etab where idsiret = new.old_siret) WHERE idsiret=new.idsiret;
update m_activite_eco.an_eco_etab set l_mail_ad = (select l_mail_ad from m_activite_eco.an_eco_etab where idsiret = new.old_siret) WHERE idsiret=new.idsiret;
update m_activite_eco.an_eco_etab set l_tel_ad = (select l_tel_ad from m_activite_eco.an_eco_etab where idsiret = new.old_siret) WHERE idsiret=new.idsiret;
update m_activite_eco.an_eco_etab set l_comp_ad = (select l_comp_ad from m_activite_eco.an_eco_etab where idsiret = new.old_siret) WHERE idsiret=new.idsiret;
update m_activite_eco.an_eco_etab set l_url_bil = (select l_url_bil from m_activite_eco.an_eco_etab where idsiret = new.old_siret) WHERE idsiret=new.idsiret;
update m_activite_eco.an_eco_etab set l_observ = (select l_observ from m_activite_eco.an_eco_etab where idsiret = new.old_siret) WHERE idsiret=new.idsiret;

update m_activite_eco.an_eco_etab set eff_etab_d = (select eff_etab_d from m_activite_eco.an_eco_etab where idsiret = new.old_siret) WHERE idsiret=new.idsiret;
update m_activite_eco.an_eco_etab set old_siret = null WHERE idsiret=new.idsiret;


END IF;

IF new.old_id is not null or new.old_id > 0 THEN

update m_activite_eco.an_eco_etab set l_observ = (select l_observ from m_activite_eco.geo_eco_etabp where idgeoet = new.old_id) WHERE idgeoet=new.idgeoet;
update m_activite_eco.an_eco_etab set eff_etab = (select eff_etab from m_activite_eco.geo_eco_etabp where idgeoet = new.old_id) WHERE idgeoet=new.idgeoet;
update m_activite_eco.an_eco_etab set source_eff = (select source_eff from m_activite_eco.geo_eco_etabp where idgeoet = new.old_id) WHERE idgeoet=new.idgeoet;
update m_activite_eco.an_eco_etab set l_date_eff = (select date_eff from m_activite_eco.geo_eco_etabp where idgeoet = new.old_id) WHERE idgeoet=new.idgeoet;
update m_activite_eco.an_eco_etab set op_sai = (select op_sai from m_activite_eco.geo_eco_etabp where idgeoet = new.old_id) WHERE idgeoet=new.idgeoet;
update m_activite_eco.an_eco_etab set org_sai = (select org_sai from m_activite_eco.geo_eco_etabp where idgeoet = new.old_id) WHERE idgeoet=new.idgeoet;
update m_activite_eco.an_eco_etab set l_tel = (select l_tel from m_activite_eco.geo_eco_etabp where idgeoet = new.old_id) WHERE idgeoet=new.idgeoet;
update m_activite_eco.an_eco_etab set l_mail = (select l_mail from m_activite_eco.geo_eco_etabp where idgeoet = new.old_id) WHERE idgeoet=new.idgeoet;
update m_activite_eco.an_eco_etab set l_url = (select l_url from m_activite_eco.geo_sa_egeo_eco_etabptabp where idgeoet = new.old_id) WHERE idgeoet=new.idgeoet;
update m_activite_eco.an_eco_etab set l_nom_dir = (select l_nom_dir from m_activite_eco.geo_eco_etabp where idgeoet = new.old_id) WHERE idgeoet=new.idgeoet;
update m_activite_eco.an_eco_etab set l_titre = (select l_titre from m_activite_eco.geo_eco_etabp where idgeoet = new.old_id) WHERE idgeoet=new.idgeoet;
update m_activite_eco.an_eco_etab set source_maj_dir = (select source_maj_dir from m_activite_eco.geo_eco_etabp where idgeoet = new.old_id) WHERE idgeoet=new.idgeoet;
update m_activite_eco.an_eco_etab set date_maj_dir = (select date_maj_dir from m_activite_eco.geo_eco_etabp where idgeoet = new.old_id) WHERE idgeoet=new.idgeoet;
update m_activite_eco.an_eco_etab set l_mail_dir = (select l_mail_dir from m_activite_eco.geo_eco_etabp where idgeoet = new.old_id) WHERE idgeoet=new.idgeoet;
update m_activite_eco.an_eco_etab set l_tel_dir = (select l_tel_dir from m_activite_eco.geo_eco_etabp where idgeoet = new.old_id) WHERE idgeoet=new.idgeoet;
update m_activite_eco.an_eco_etab set l_telp_dir = (select l_telp_dir from m_activite_eco.geo_eco_etabp where idgeoet = new.old_id) WHERE idgeoet=new.idgeoet;
update m_activite_eco.an_eco_etab set l_nom_aut = (select l_nom_aut from m_activite_eco.geo_eco_etabp where idgeoet = new.old_id) WHERE idgeoet=new.idgeoet;
update m_activite_eco.an_eco_etab set l_titre_aut = (select l_titre_aut from m_activite_eco.geo_eco_etabp where idgeoet = new.old_id) WHERE idgeoet=new.idgeoet;
update m_activite_eco.an_eco_etab set date_maj_aut = (select date_maj_aut from m_activite_eco.geo_eco_etabp where idgeoet = new.old_id) WHERE idgeoet=new.idgeoet;
update m_activite_eco.an_eco_etab set l_mail_aut = (select l_mail_aut from m_activite_eco.geo_eco_etabp where idgeoet = new.old_id) WHERE idgeoet=new.idgeoet;
update m_activite_eco.an_eco_etab set l_tel_aut = (select l_tel_aut from m_activite_eco.geo_eco_etabp where idgeoet = new.old_id) WHERE idgeoet=new.idgeoet;
update m_activite_eco.an_eco_etab set l_telp_aut = (select l_telp_aut from m_activite_eco.geo_eco_etabp where idgeoet = new.old_id) WHERE idgeoet=new.idgeoet;
update m_activite_eco.an_eco_etab set l_nom_drh = (select l_nom_drh from m_economie.geo_eco_etabp where idgeoet = new.old_id) WHERE idgeoet=new.idgeoet;
update m_activite_eco.an_eco_etab set l_titre_drh = (select l_titre_drh from m_activite_eco.geo_eco_etabp where idgeoet = new.old_id) WHERE idgeoet=new.idgeoet;
update m_activite_eco.an_eco_etab set date_maj_drh = (select date_maj_drh from m_activite_eco.geo_eco_etabp where idgeoet = new.old_id) WHERE idgeoet=new.idgeoet;
update m_activite_eco.an_eco_etab set l_mail_drh = (select l_mail_drh from m_activite_eco.geo_eco_etabp where idgeoet = new.old_id) WHERE idgeoet=new.idgeoet;
update m_activite_eco.an_eco_etab set l_tel_drh = (select l_tel_drh from m_activite_eco.geo_eco_etabp where idgeoet = new.old_id) WHERE idgeoet=new.idgeoet;
update m_activite_eco.an_eco_etab set l_drh_ss = (select l_drh_ss from m_activite_eco.geo_eco_etabp where idgeoet = new.old_id) WHERE idgeoet=new.idgeoet;
update m_activite_eco.an_eco_etab set l_drh_ad = (select l_drh_ad from m_activite_eco.geo_eco_etabp where idgeoet = new.old_id) WHERE idgeoet=new.idgeoet;
update m_activite_eco.an_eco_etab set l_nom_ad = (select l_nom_ad from m_activite_eco.geo_eco_etabp where idgeoet = new.old_id) WHERE idgeoet=new.idgeoet;
update m_activite_eco.an_eco_etab set l_titre_ad = (select l_titre_ad from m_activite_eco.geo_eco_etabp where idgeoet = new.old_id) WHERE idgeoet=new.idgeoet;
update m_activite_eco.an_eco_etab set date_maj_ad = (select date_maj_ad from m_activite_eco.geo_eco_etabp where idgeoet = new.old_id) WHERE idgeoet=new.idgeoet;
update m_activite_eco.an_eco_etab set l_mail_ad = (select l_mail_ad from m_activite_eco.geo_eco_etabp where idgeoet = new.old_id) WHERE idgeoet=new.idgeoet;
update m_activite_eco.an_eco_etab set l_tel_ad = (select l_tel_ad from m_activite_eco.geo_eco_etabp where idgeoet = new.old_id) WHERE idgeoet=new.idgeoet;

update m_activite_eco.an_eco_etab set l_comp_ad = (select l_comp_ad from m_activite_eco.geo_eco_etabp where idgeoet = new.old_id) WHERE idgeoet=new.idgeoet;
update m_activite_eco.an_eco_etab set l_url_bil = (select l_url_bil from m_activite_eco.geo_eco_etabp where idgeoet = new.old_id) WHERE idgeoet=new.idgeoet;
update m_activite_eco.an_eco_etab set eff_etab_d = (select eff_etab_d from m_activite_eco.geo_eco_etabp where idgeoet = new.old_id) WHERE idgeoet=new.idgeoet;


update m_activite_eco.an_eco_etab set old_id = null WHERE idgeoet=new.idgeoet;

DELETE FROM m_activite_eco.geo_eco_etabp where idgeoet = new.old_id;

END IF;



return new;
END$BODY$;

ALTER FUNCTION m_activite_eco.ft_m_an_sa_etab_oldsiret()
    OWNER TO create_sig;

GRANT EXECUTE ON FUNCTION m_activite_eco.ft_m_an_sa_etab_oldsiret() TO PUBLIC;

GRANT EXECUTE ON FUNCTION m_activite_eco.ft_m_an_sa_etab_oldsiret() TO create_sig;

COMMENT ON FUNCTION m_activite_eco.ft_m_an_sa_etab_oldsiret()
    IS 'Fonction dont l''objet est de récupérer les anciens contacts d''un établissement fermé pour les réinscrires au même établissement ayant changer de SIRET';


-- ############################################################ [ft_m_etiquette_local] #######################################################################

-- FUNCTION: m_activite_eco.ft_m_etiquette_local()

-- DROP FUNCTION m_activite_eco.ft_m_etiquette_local();

CREATE OR REPLACE FUNCTION m_activite_eco.ft_m_etiquette_local()
    RETURNS trigger
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE NOT LEAKPROOF
AS $BODY$

BEGIN

-- refraichissement de la vue matérialisée des points établissements à l'adresse
REFRESH MATERIALIZED VIEW x_apps.xapps_geo_vmr_etab_api;
REFRESH MATERIALIZED VIEW x_apps.xapps_geo_vmr_immo_bati;

return new;

END;

$BODY$;

ALTER FUNCTION m_activite_eco.ft_m_etiquette_local()
    OWNER TO create_sig;

GRANT EXECUTE ON FUNCTION m_activite_eco.ft_m_etiquette_local() TO PUBLIC;

GRANT EXECUTE ON FUNCTION m_activite_eco.ft_m_etiquette_local() TO create_sig;

GRANT EXECUTE ON FUNCTION m_activite_eco.ft_m_etiquette_local() TO sig_edit;



-- ############################################################ [ft_m_etabp_insert] #######################################################################

-- FUNCTION: m_activite_eco.ft_m_etabp_insert()

-- DROP FUNCTION m_activite_eco.ft_m_etabp_insert();

CREATE OR REPLACE FUNCTION m_activite_eco.ft_m_etabp_insert()
    RETURNS trigger
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE NOT LEAKPROOF
AS $BODY$

DECLARE v_idgeoet integer;

BEGIN
    
    new.date_sai=current_timestamp;
    v_idgeoet := (SELECT nextval('r_objet.idgeo_seq'::regclass));
    new.idgeoet = v_idgeoet;
    -- insertion du numéro du site
    new.idsite = (SELECT DISTINCT
				an_sa_site.idsite 
		  FROM 
				m_economie.an_sa_site, r_objet.geo_objet_ope
		  WHERE
				geo_objet_ope.idsite=an_sa_site.idsite
		  AND
				st_intersects(geo_objet_ope.geom,new.geom) = true
		  );

    return new ;
END;

$BODY$;

ALTER FUNCTION m_activite_eco.ft_m_etabp_insert()
    OWNER TO create_sig;

GRANT EXECUTE ON FUNCTION m_activite_eco.ft_m_etabp_insert() TO PUBLIC;

GRANT EXECUTE ON FUNCTION m_activite_eco.ft_m_etabp_insert() TO create_sig;

-- ############################################################ [ft_m_etabp_update] #######################################################################

-- FUNCTION: m_activite_eco.ft_m_etabp_update()

-- DROP FUNCTION m_activite_eco.ft_m_etabp_update();

CREATE OR REPLACE FUNCTION m_activite_eco.ft_m_etabp_update()
    RETURNS trigger
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE NOT LEAKPROOF
AS $BODY$

BEGIN

    new.date_maj=current_timestamp;
    -- insertion du numéro du site
    new.idsite = (SELECT DISTINCT
				an_sa_site.idsite 
		  FROM 
				m_economie.an_sa_site, r_objet.geo_objet_ope
		  WHERE
				geo_objet_ope.idsite=an_sa_site.idsite
		  AND
				st_intersects(geo_objet_ope.geom,new.geom) = true
		  );
	
 

return new ;

END;

$BODY$;

ALTER FUNCTION m_activite_eco.ft_m_etabp_update()
    OWNER TO create_sig;

GRANT EXECUTE ON FUNCTION m_activite_eco.ft_m_etabp_update() TO PUBLIC;

GRANT EXECUTE ON FUNCTION m_activite_eco.ft_m_etabp_update() TO create_sig;



-- ############################################################ [ft_m_etabp_null] #######################################################################

-- FUNCTION: m_activite_eco.ft_m_etabp_null()

-- DROP FUNCTION m_activite_eco.ft_m_etabp_null();

CREATE OR REPLACE FUNCTION m_activite_eco.ft_m_etabp_null()
    RETURNS trigger
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE NOT LEAKPROOF
AS $BODY$

BEGIN

    -- insertion du numéro du site
    UPDATE m_activite_eco.geo_eco_etabp SET idsiren = null WHERE idsiren='';
    UPDATE m_activite_eco.geo_eco_etabp SET idsiret = null WHERE idsiret='';
    UPDATE m_activite_eco.geo_eco_etabp SET op_sai = null WHERE op_sai='';
    UPDATE m_activite_eco.geo_eco_etabp SET org_sai = null WHERE org_sai='';
    UPDATE m_activite_eco.geo_eco_etabp SET l_nom = null WHERE l_nom='';
    UPDATE m_activite_eco.geo_eco_etabp SET source_eff = null WHERE source_eff='';
    UPDATE m_activite_eco.geo_eco_etabp SET l_ape = null WHERE l_ape='';
    UPDATE m_activite_eco.geo_eco_etabp SET l_nom_dir = null WHERE l_nom_dir='';
    UPDATE m_activite_eco.geo_eco_etabp SET source_maj_dir = null WHERE source_maj_dir='';
    UPDATE m_activite_eco.geo_eco_etabp SET l_tel = null WHERE l_tel='';
    UPDATE m_activite_eco.geo_eco_etabp SET l_mail = null WHERE l_mail='';
    UPDATE m_activite_eco.geo_eco_etabp SET l_observ = null WHERE l_observ='';
    return new ;
END;




$BODY$;

ALTER FUNCTION m_activite_eco.ft_m_etabp_null()
    OWNER TO create_sig;

GRANT EXECUTE ON FUNCTION m_activite_eco.ft_m_etabp_null() TO PUBLIC;

GRANT EXECUTE ON FUNCTION m_activite_eco.ft_m_etabp_null() TO create_sig;


-- ################################################## [ft_m_lk_adresseetablissement_siret_update] ######################################################

-- FUNCTION: m_activite_eco.ft_m_lk_adresseetablissement_idsite_update()

-- DROP FUNCTION m_activite_eco.ft_m_lk_adresseetablissement_idsite_update();

CREATE OR REPLACE FUNCTION m_activite_eco.ft_m_lk_adresseetablissement_idsite_update()
    RETURNS trigger
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE NOT LEAKPROOF
AS $BODY$

BEGIN

IF (old.idadresse || old.siret ) <> (new.idadresse || new.siret) THEN


-- suppression de l'appariemment du siret à l'adresse car siret adressé à une autre auparavant
DELETE FROM m_activite_eco.lk_adresseetablissement WHERE siret = old.siret;
END IF;

return new;

END;


$BODY$;

ALTER FUNCTION m_activite_eco.ft_m_lk_adresseetablissement_idsite_update()
    OWNER TO create_sig;

GRANT EXECUTE ON FUNCTION m_activite_eco.ft_m_lk_adresseetablissement_idsite_update() TO create_sig;

GRANT EXECUTE ON FUNCTION m_activite_eco.ft_m_lk_adresseetablissement_idsite_update() TO PUBLIC;


-- ################################################## [ft_m_lk_adresseetablissement_siret_update] ######################################################

-- FUNCTION: m_activite_eco.ft_m_lk_adresseetablissement_siret_update()

-- DROP FUNCTION m_activite_eco.ft_m_lk_adresseetablissement_siret_update();

CREATE OR REPLACE FUNCTION m_activite_eco.ft_m_lk_adresseetablissement_siret_update()
    RETURNS trigger
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE NOT LEAKPROOF
AS $BODY$

BEGIN

-- si j'ai déjà un établissement à une adresse et qu'il est adressé à une autre, je supprime d'abord les appariemments
IF (SELECT COUNT(*) FROM m_activite_eco.lk_adresseetablissement WHERE siret = new.siret) > 0 THEN
DELETE FROM m_activite_eco.lk_adresseetablissement WHERE siret = new.siret;
END IF;

return new;

END;

$BODY$;

ALTER FUNCTION m_activite_eco.ft_m_lk_adresseetablissement_siret_update()
    OWNER TO create_sig;

GRANT EXECUTE ON FUNCTION m_activite_eco.ft_m_lk_adresseetablissement_siret_update() TO create_sig;

GRANT EXECUTE ON FUNCTION m_activite_eco.ft_m_lk_adresseetablissement_siret_update() TO PUBLIC;



-- ################################################## [ft_m_lk_adresseetablissement_idsite] ######################################################

-- FUNCTION: m_activite_eco.ft_m_lk_adresseetablissement_idsite()

-- DROP FUNCTION m_activite_eco.ft_m_lk_adresseetablissement_idsite();

CREATE OR REPLACE FUNCTION m_activite_eco.ft_m_lk_adresseetablissement_idsite()
    RETURNS trigger
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE NOT LEAKPROOF
AS $BODY$


BEGIN

/** A REVOIR ICI **/
/**
UPDATE m_economie.an_eco_etab SET idsite = 
(SELECT DISTINCT idsite FROM r_objet.geo_objet_ope WHERE st_intersects(geo_objet_ope.geom,(SELECT a.geom FROM x_apps.xapps_geo_vmr_adresse a WHERE a.id_adresse = new.idadresse)) = true and idsite <> '60382zz' AND (destdomi='02' or destdomi='03'))
WHERE idsiret = new.siret;
**/


return new;

END;


$BODY$;

ALTER FUNCTION m_activite_eco.ft_m_lk_adresseetablissement_idsite()
    OWNER TO create_sig;

GRANT EXECUTE ON FUNCTION m_activite_eco.ft_m_lk_adresseetablissement_idsite() TO create_sig;

GRANT EXECUTE ON FUNCTION m_activite_eco.ft_m_lk_adresseetablissement_idsite() TO PUBLIC;



-- ################################################## [ft_m_lk_adresseetablissement_idsite_delete] ######################################################

-- FUNCTION: m_activite_eco.ft_m_lk_adresseetablissement_idsite_delete()

-- DROP FUNCTION m_activite_eco.ft_m_lk_adresseetablissement_idsite_delete();

CREATE OR REPLACE FUNCTION m_activite_eco.ft_m_lk_adresseetablissement_idsite_delete()
    RETURNS trigger
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE NOT LEAKPROOF
AS $BODY$

BEGIN

-- suppression de l'appariemment du siret à l'adresse
DELETE FROM m_activite_eco.lk_adresseetablissement WHERE siret = old.siret;

return new;

END;

$BODY$;

ALTER FUNCTION m_activite_eco.ft_m_lk_adresseetablissement_idsite_delete()
    OWNER TO create_sig;

GRANT EXECUTE ON FUNCTION m_activite_eco.ft_m_lk_adresseetablissement_idsite_delete() TO create_sig;

GRANT EXECUTE ON FUNCTION m_activite_eco.ft_m_lk_adresseetablissement_idsite_delete() TO PUBLIC;

-- ################################################## [ft_m_lk_adresseetablissement] ######################################################

-- FUNCTION: m_activite_eco.ft_m_lk_adresseetablissement()

-- DROP FUNCTION m_activite_eco.ft_m_lk_adresseetablissement();

CREATE OR REPLACE FUNCTION m_activite_eco.ft_m_lk_adresseetablissement()
    RETURNS trigger
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE NOT LEAKPROOF
AS $BODY$

BEGIN

-- refraichissement de la vue matérialisée des points établissements à l'adresse
REFRESH MATERIALIZED VIEW x_apps.xapps_geo_vmr_etab_api;

return new;

END;

$BODY$;

ALTER FUNCTION m_activite_eco.ft_m_lk_adresseetablissement()
    OWNER TO create_sig;

GRANT EXECUTE ON FUNCTION m_activite_eco.ft_m_lk_adresseetablissement() TO create_sig;

GRANT EXECUTE ON FUNCTION m_activite_eco.ft_m_lk_adresseetablissement() TO PUBLIC;



-- ################################################## [ft_m_insert_bati_site] ######################################################

-- FUNCTION: m_activite_eco.ft_m_insert_bati_site()

-- DROP FUNCTION m_activite_eco.ft_m_insert_bati_site();

CREATE FUNCTION m_activite_eco.ft_m_insert_bati_site()
    RETURNS trigger
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE NOT LEAKPROOF
AS $BODY$

BEGIN

     	-- association d'un bâti à un ou plusieurs sites
		INSERT INTO m_activite_eco.lk_eco_bati_site (idsite,idbati)
		SELECT idsite, new.idbati FROM m_activite_eco.geo_eco_site WHERE st_intersects(st_pointonsurface(new.geom),geom) IS TRUE;
		

     return new ;

END;

$BODY$;

ALTER FUNCTION m_activite_eco.ft_m_insert_bati_site()
    OWNER TO create_sig;

GRANT EXECUTE ON FUNCTION m_activite_eco.ft_m_insert_bati_site() TO PUBLIC;

GRANT EXECUTE ON FUNCTION m_activite_eco.ft_m_insert_bati_site() TO create_sig;

COMMENT ON FUNCTION m_activite_eco.ft_m_insert_bati_site()
    IS 'Fonction gérant l''affectation des bâtiments d''activité à un ou plusieurs sites à la saisie';


-- ################################################## [ft_m_delete_bati_site] ######################################################

-- FUNCTION: m_activite_eco.ft_m_delete_bati_site()

-- DROP FUNCTION m_activite_eco.ft_m_delete_bati_site();

CREATE FUNCTION m_activite_eco.ft_m_delete_bati_site()
    RETURNS trigger
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE NOT LEAKPROOF
AS $BODY$

BEGIN

     	DELETE FROM m_activite_eco.lk_eco_bati_site WHERE idbati = old.idbati;
		

     return new ;

END;

$BODY$;

ALTER FUNCTION m_activite_eco.ft_m_delete_bati_site()
    OWNER TO create_sig;

GRANT EXECUTE ON FUNCTION m_activite_eco.ft_m_delete_bati_site() TO PUBLIC;

GRANT EXECUTE ON FUNCTION m_activite_eco.ft_m_delete_bati_site() TO create_sig;

COMMENT ON FUNCTION m_activite_eco.ft_m_delete_bati_site()
    IS 'Fonction gérant la suppression des relations à un ou plusieurs sites si suppression du bâtiment';

-- ################################################## [ft_m_insert_lot_eco] ######################################################

-- FUNCTION: m_activite_eco.ft_m_insert_lot_eco()

-- DROP FUNCTION m_activite_eco.ft_m_insert_lot_eco();

CREATE OR REPLACE FUNCTION m_activite_eco.ft_m_delete_an_eco_contact()
    RETURNS trigger
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE NOT LEAKPROOF
AS $BODY$

BEGIN

     	DELETE FROM m_activite_eco.lk_eco_contact WHERE idcontact = old.idcontact;
		

     return new ;

END;

$BODY$;

ALTER FUNCTION m_activite_eco.ft_m_delete_an_eco_contact()
    OWNER TO create_sig;

GRANT EXECUTE ON FUNCTION m_activite_eco.ft_m_delete_an_eco_contact() TO PUBLIC;

GRANT EXECUTE ON FUNCTION m_activite_eco.ft_m_delete_an_eco_contact() TO create_sig;

COMMENT ON FUNCTION m_activite_eco.ft_m_delete_an_eco_contact()
    IS 'Fonction gérant la suppression des contacts dans les tables de relation avec les objets';




-- ####################################################################################################################################################
-- ###                                                            FONCTION R_OBJET                                                                  ###
-- ####################################################################################################################################################



-- ##################################################### [r_objet.ft_m_foncier_delete] #########################################################

-- FUNCTION: r_objet.ft_m_foncier_delete()

-- DROP FUNCTION r_objet.ft_m_foncier_delete();

CREATE OR REPLACE FUNCTION r_objet.ft_m_foncier_delete()
    RETURNS trigger
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE NOT LEAKPROOF
AS $BODY$

BEGIN

    DELETE FROM m_foncier.an_cession WHERE idces=(SELECT lf.idces FROM m_foncier.an_cession f, m_foncier.lk_cession_lot lf WHERE f.idces=lf.idces AND lf.idgeolf=old.idgeolf);
    DELETE FROM m_foncier.lk_cession_lot WHERE idgeolf=old.idgeolf;
    DELETE FROM m_amenagement.an_amt_lot_stade WHERE idgeolf=old.idgeolf;
    DELETE FROM m_amenagement.an_amt_lot_hab WHERE idgeolf=old.idgeolf;
    DELETE FROM m_amenagement.an_amt_lot_equ WHERE idgeolf=old.idgeolf;
    DELETE FROM m_amenagement.an_amt_lot_mixte WHERE idgeolf=old.idgeolf;
    DELETE FROM m_amenagement.an_amt_lot_divers WHERE idgeolf=old.idgeolf;
    DELETE FROM m_economie.an_sa_lot WHERE idgeolf=old.idgeolf;
    DELETE FROM r_objet.geo_objet_fon_lot WHERE idgeolf=old.idgeolf;

-- refraichissement de la vue matérialisée des points établissements à l'adresse
REFRESH MATERIALIZED VIEW x_apps.xapps_geo_vmr_etab_api;

    return new ;
END;

$BODY$;

ALTER FUNCTION r_objet.ft_m_foncier_delete()
    OWNER TO create_sig;

GRANT EXECUTE ON FUNCTION r_objet.ft_m_foncier_delete() TO PUBLIC;

GRANT EXECUTE ON FUNCTION r_objet.ft_m_foncier_delete() TO create_sig;

COMMENT ON FUNCTION r_objet.ft_m_foncier_delete()
    IS 'Fonction gérant la suppression des informations des lots toutes vocations si suppression de l''objet';

-- ##################################################### [r_objet.ft_m_foncier_insert] #########################################################

-- FUNCTION: r_objet.ft_m_foncier_insert()

-- DROP FUNCTION r_objet.ft_m_foncier_insert();

CREATE OR REPLACE FUNCTION r_objet.ft_m_foncier_insert()
    RETURNS trigger
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE NOT LEAKPROOF
AS $BODY$
DECLARE v_idgeolf integer;
DECLARE v_idces integer;
DECLARE lot_surf integer;

BEGIN

    v_idgeolf := (SELECT nextval('idgeo_seq'::regclass));

    INSERT INTO r_objet.geo_objet_fon_lot SELECT v_idgeolf,new.op_sai,new.ref_spa,null,new.l_voca,new.geom,now(),null,new.l_nom;

    INSERT INTO m_amenagement.an_amt_lot_stade SELECT v_idgeolf,
						 (
							SELECT DISTINCT
								idsite 
							FROM 
								r_objet.geo_objet_ope
							WHERE
								st_intersects(geo_objet_ope.geom,ST_PointOnSurface(new.geom)) = true AND idsite <> '60159ak' AND idsite <> '60159hc'
								
						  ),
						  new.stade_amng,
						  new.l_amng2,
						  new.stade_comm,
						  new.l_comm2,
						  new.l_comm2_12,
						  new.etat_occup;

    lot_surf:=round(cast(st_area(new.geom) as numeric),0);

    -- insertion des lots uniquements économiques (pour la vente) dans la table métier économie
    -- recherche si le lot dessiner est dans un site activité : si oui copie une ligne dans le métier eco et foncier, si non copie uniquement dans le métier foncier
    if new.l_voca='20' THEN

						INSERT INTO m_economie.an_eco_lot SELECT v_idgeolf,
						 
						 (
							SELECT DISTINCT
								idsite 
							FROM 
								r_objet.geo_objet_ope
							WHERE
								st_intersects(geo_objet_ope.geom,ST_PointOnSurface(new.geom)) = true AND idsite <> '60159ak' AND idsite <> '60159hc'
								
						  ) , -- recherche idsite

						  lot_surf,
						
								   CASE WHEN length(cast (lot_surf as character varying)) >= 1 and length(cast (lot_surf as character varying)) <= 3 THEN lot_surf || 'm²'
								   WHEN length(cast (lot_surf as character varying)) = 4 THEN replace(to_char(lot_surf,'FM9G999'),',',' ') || 'm²'
								   WHEN length(cast (lot_surf as character varying)) = 5 THEN replace(to_char(lot_surf,'FM99G999'),',',' ') || 'm²'
								   WHEN length(cast (lot_surf as character varying)) = 6 THEN replace(to_char(lot_surf,'FM999G999'),',',' ') || 'm²'
								   WHEN length(cast (lot_surf as character varying)) = 7 THEN replace(to_char(lot_surf,'FM9G999G999'),',',' ') || 'm²'
								   WHEN length(cast (lot_surf as character varying)) = 8 THEN replace(to_char(lot_surf,'FM99G999G999'),',',' ') || 'm²'
								   END,
						  null,
						  null,
						  null,
						  null,
						  null,
						  null,
						  null,
						  null,
						  null,
						  null,
						  null,
						  null,
						  null,
						  null,
						  now(),
						  null,
						  null,
						  null,
						  null,
						  null,
						  null,
						  null,
						  null,
						  null,
						  null,
						  null,
						  null,
						  null,
						  null,
						  (select string_agg(insee, ', ') from r_osm.geo_osm_commune where st_intersects(st_buffer(new.geom,-1),geom)),
						  (select string_agg(commune, ', ') from r_osm.geo_osm_commune where st_intersects(st_buffer(new.geom,-1),geom))
						  ;
					
						  
					
     end if;

     -- insertion des lots uniquement à vocation d'équipement dans la table métier équipement	
     if new.l_voca='10' then
	INSERT INTO m_amenagement.an_amt_lot_equ SELECT v_idgeolf,
							(
							SELECT DISTINCT
								idsite 
							FROM 
								r_objet.geo_objet_ope
							WHERE
								st_intersects(geo_objet_ope.geom,new.geom) = true AND idsite <> '60159ak' AND idsite <> '60159hc'
								
							),-- recherche auto de l'IDSITE
							null,
							null,
							null,
							lot_surf,
							now(),
							null,
							null,
							CASE WHEN length(cast (lot_surf as character varying)) >= 1 and length(cast (lot_surf as character varying)) <= 3 THEN lot_surf || 'm²'
								   WHEN length(cast (lot_surf as character varying)) = 4 THEN replace(to_char(lot_surf,'FM9G999'),',',' ') || 'm²'
								   WHEN length(cast (lot_surf as character varying)) = 5 THEN replace(to_char(lot_surf,'FM99G999'),',',' ') || 'm²'
								   WHEN length(cast (lot_surf as character varying)) = 6 THEN replace(to_char(lot_surf,'FM999G999'),',',' ') || 'm²'
								   WHEN length(cast (lot_surf as character varying)) = 7 THEN replace(to_char(lot_surf,'FM9G999G999'),',',' ') || 'm²'
								   WHEN length(cast (lot_surf as character varying)) = 8 THEN replace(to_char(lot_surf,'FM99G999G999'),',',' ') || 'm²'
								   END
							;	
     end if ;

     -- insertion des lots uniquement à vocation habitat dans la table métier habitat 
	if new.l_voca='30' THEN
       
						INSERT INTO m_amenagement.an_amt_lot_hab SELECT v_idgeolf,
						 (
							SELECT DISTINCT
								idsite 
							FROM 
								r_objet.geo_objet_ope
							WHERE
								st_intersects(geo_objet_ope.geom,st_pointonsurface(new.geom)) = true AND idsite <> '60159ak' AND idsite <> '60159hc'
								
						  ), -- recherche auto de l'IDSITE

						  lot_surf,
							CASE WHEN length(cast (lot_surf as character varying)) >= 1 and length(cast (lot_surf as character varying)) <= 3 THEN lot_surf || 'm²'
								   WHEN length(cast (lot_surf as character varying)) = 4 THEN replace(to_char(lot_surf,'FM9G999'),',',' ') || 'm²'
								   WHEN length(cast (lot_surf as character varying)) = 5 THEN replace(to_char(lot_surf,'FM99G999'),',',' ') || 'm²'
								   WHEN length(cast (lot_surf as character varying)) = 6 THEN replace(to_char(lot_surf,'FM999G999'),',',' ') || 'm²'
								   WHEN length(cast (lot_surf as character varying)) = 7 THEN replace(to_char(lot_surf,'FM9G999G999'),',',' ') || 'm²'
								   WHEN length(cast (lot_surf as character varying)) = 8 THEN replace(to_char(lot_surf,'FM99G999G999'),',',' ') || 'm²'
							END,
						  null,
						  null,
						  null,
						  null,
						  null,
						  null,
						  null,
						  null,
						  null,
						  null,
						  now(),
						  now(),
						  null,
						  null,
						  null,
						  null,
						  null,
						  null,
						  null,
						  null,
						  null
						  ;
     end if;

	-- insertion des lots uniquement à vocation d'équipement dans la table métier équipement	
     if new.l_voca='40' then
	INSERT INTO m_amenagement.an_amt_lot_divers SELECT v_idgeolf,
							(
							SELECT DISTINCT
								idsite 
							FROM 
								r_objet.geo_objet_ope
							WHERE
								st_intersects(geo_objet_ope.geom,new.geom) = true AND idsite <> '60159ak' AND idsite <> '60159hc'
								
							),-- recherche auto de l'IDSITE
							null,
							null,
							null,
							lot_surf,
							now(),
							null,
							null,
							CASE WHEN length(cast (lot_surf as character varying)) >= 1 and length(cast (lot_surf as character varying)) <= 3 THEN lot_surf || 'm²'
								   WHEN length(cast (lot_surf as character varying)) = 4 THEN replace(to_char(lot_surf,'FM9G999'),',',' ') || 'm²'
								   WHEN length(cast (lot_surf as character varying)) = 5 THEN replace(to_char(lot_surf,'FM99G999'),',',' ') || 'm²'
								   WHEN length(cast (lot_surf as character varying)) = 6 THEN replace(to_char(lot_surf,'FM999G999'),',',' ') || 'm²'
								   WHEN length(cast (lot_surf as character varying)) = 7 THEN replace(to_char(lot_surf,'FM9G999G999'),',',' ') || 'm²'
								   WHEN length(cast (lot_surf as character varying)) = 8 THEN replace(to_char(lot_surf,'FM99G999G999'),',',' ') || 'm²'
								   END
							;	
     end if ;
	

    -- insertion des lots uniquements mixtes (pour la vente) dans la table métier mixte
    -- recherche si le lot dessiner est dans un site : si oui copie une ligne dans le métier du site et foncier, si non copie uniquement dans le métier foncier
    if new.l_voca='60' THEN

						INSERT INTO m_amenagement.an_amt_lot_mixte SELECT v_idgeolf,
						 (
							SELECT DISTINCT
								idsite 
							FROM 
								r_objet.geo_objet_ope
							WHERE
								st_intersects(geo_objet_ope.geom,ST_PointOnSurface(new.geom)) = true AND idsite <> '60159ak' AND idsite <> '60159hc'
								
						  ), -- recherche idsite
						  lot_surf,
						
								   CASE WHEN length(cast (lot_surf as character varying)) >= 1 and length(cast (lot_surf as character varying)) <= 3 THEN lot_surf || 'm²'
								   WHEN length(cast (lot_surf as character varying)) = 4 THEN replace(to_char(lot_surf,'FM9G999'),',',' ') || 'm²'
								   WHEN length(cast (lot_surf as character varying)) = 5 THEN replace(to_char(lot_surf,'FM99G999'),',',' ') || 'm²'
								   WHEN length(cast (lot_surf as character varying)) = 6 THEN replace(to_char(lot_surf,'FM999G999'),',',' ') || 'm²'
								   WHEN length(cast (lot_surf as character varying)) = 7 THEN replace(to_char(lot_surf,'FM9G999G999'),',',' ') || 'm²'
								   WHEN length(cast (lot_surf as character varying)) = 8 THEN replace(to_char(lot_surf,'FM99G999G999'),',',' ') || 'm²'
								   END,
						  null,
						  null,
						  null,
						  null,
						  null,
						  null,
						  null,
						  null,
						  null,
						  null,
						  now(),
						  now(),
						  null,
						  null,
						  null,
						  null,
						  null,
						  null,
						  null,
						  '00',
						  null,
						  null,
						  null,
						  null,
						  null
						  ;
					
						  
					
     end if;

     -- calcul de l'identifiant du dossier de cession
     v_idces := (SELECT nextval('m_foncier.ces_seq'::regclass));

     -- insertion de tous lots fonciers dans la table métier foncier
     INSERT INTO m_foncier.lk_cession_lot SELECT v_idgeolf, v_idces;	

     -- insertion d'une ligne dans an_cession en créant un idces qui est lui même réinjecté dans lk_cession_lot

     /* ATTENTION : LEUR DE LA MISE EN PRODUCTION REMETTRE DANS L'ORDRE LES CHAMPS SUIVANTS IDCES, L_COMPO, L_OBSERV ==> cd table an_cession pour vérification */
     
     INSERT INTO m_foncier.an_cession VALUES 	(
						v_idces, -- idces
						'10',
						false, -- relation
						'00',
						'00',
						null,
						null,
						null,
						(SELECT insee FROM r_osm.geo_osm_commune WHERE st_intersects(st_pointonsurface(new.geom),geom)),
						null,
						'00',
						null,
						null,
						null,
						null,
						null,
						null,
						null,
						null,
						'00',
						'00',
						null,
						null,
						'00',
						null,
						null,
						null,
						false,
						false,
						false,
						false,
						false,
						null,
						null,
						null,
						false,
						false,
						false,
						null,
						null,
						null,
						null,
						null,
						(SELECT DISTINCT
								idsite 
							FROM 
								r_objet.geo_objet_ope
							WHERE
								st_intersects(geo_objet_ope.geom,st_pointonsurface(new.geom)) = true AND idsite <> '60159ak' AND idsite <> '60159hc'
								
							),
							null
						);

-- refraichissement de la vue matérialisée des points établissements à l'adresse
REFRESH MATERIALIZED VIEW x_apps.xapps_geo_vmr_etab_api;

    return new ;
END;

$BODY$;

ALTER FUNCTION r_objet.ft_m_foncier_insert()
    OWNER TO create_sig;

GRANT EXECUTE ON FUNCTION r_objet.ft_m_foncier_insert() TO PUBLIC;

GRANT EXECUTE ON FUNCTION r_objet.ft_m_foncier_insert() TO create_sig;

COMMENT ON FUNCTION r_objet.ft_m_foncier_insert()
    IS 'Fonction gérant l''intégration des informations des lots en fonction de leur vocation à la saisie des objets';



-- ################################################### [r_objet.ft_m_foncier_update] #######################################################################

-- FUNCTION: r_objet.ft_m_foncier_update()

-- DROP FUNCTION r_objet.ft_m_foncier_update();

CREATE OR REPLACE FUNCTION r_objet.ft_m_foncier_update()
    RETURNS trigger
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE NOT LEAKPROOF
AS $BODY$

DECLARE lot_surf integer;

BEGIN

lot_surf:=round(cast(st_area(new.geom) as numeric),0);

   UPDATE r_objet.geo_objet_fon_lot SET geom = new.geom, date_maj = now(), src_geom = new.ref_spa, op_sai=new.op_sai, l_voca = new.l_voca, l_nom = new.l_nom WHERE idgeolf = new.idgeolf; 

   UPDATE m_amenagement.an_amt_lot_stade SET stade_amng = new.stade_amng, l_amng2 = new.l_amng2, stade_comm = new.stade_comm, l_comm2 = new.l_comm2, l_comm2_12 = new.l_comm2_12, etat_occup =  new.etat_occup WHERE idgeolf = new.idgeolf;

  -- si mise à jour lot équipement public, modifier la surface
  IF new.l_voca='10' THEN
  UPDATE m_amenagement.an_amt_lot_equ SET surf = st_area(new.geom), 
  l_surf_l = CASE WHEN length(cast (lot_surf as character varying)) >= 1 and length(cast (lot_surf as character varying)) <= 3 THEN lot_surf || 'm²'
								   WHEN length(cast (lot_surf as character varying)) = 4 THEN replace(to_char(lot_surf,'FM9G999'),',',' ') || 'm²'
								   WHEN length(cast (lot_surf as character varying)) = 5 THEN replace(to_char(lot_surf,'FM99G999'),',',' ') || 'm²'
								   WHEN length(cast (lot_surf as character varying)) = 6 THEN replace(to_char(lot_surf,'FM999G999'),',',' ') || 'm²'
								   WHEN length(cast (lot_surf as character varying)) = 7 THEN replace(to_char(lot_surf,'FM9G999G999'),',',' ') || 'm²'
								   WHEN length(cast (lot_surf as character varying)) = 8 THEN replace(to_char(lot_surf,'FM99G999G999'),',',' ') || 'm²'
								   END
  WHERE idgeolf = NEW.idgeolf;
  END IF;
  
    -- si mise à jour lot économique, modifier la surface
  IF new.l_voca='20' THEN
  UPDATE m_economie.an_eco_lot SET surf = st_area(new.geom), 
  l_surf_l = CASE WHEN length(cast (lot_surf as character varying)) >= 1 and length(cast (lot_surf as character varying)) <= 3 THEN lot_surf || 'm²'
								   WHEN length(cast (lot_surf as character varying)) = 4 THEN replace(to_char(lot_surf,'FM9G999'),',',' ') || 'm²'
								   WHEN length(cast (lot_surf as character varying)) = 5 THEN replace(to_char(lot_surf,'FM99G999'),',',' ') || 'm²'
								   WHEN length(cast (lot_surf as character varying)) = 6 THEN replace(to_char(lot_surf,'FM999G999'),',',' ') || 'm²'
								   WHEN length(cast (lot_surf as character varying)) = 7 THEN replace(to_char(lot_surf,'FM9G999G999'),',',' ') || 'm²'
								   WHEN length(cast (lot_surf as character varying)) = 8 THEN replace(to_char(lot_surf,'FM99G999G999'),',',' ') || 'm²'
								   END
  WHERE idgeolf = NEW.idgeolf;
  END IF;

  -- si mise à jour lot habitat, modifier la surface
  IF new.l_voca='30' THEN
  UPDATE m_amenagement.an_amt_lot_hab SET surf = st_area(new.geom), 
  l_surf_l = CASE WHEN length(cast (lot_surf as character varying)) >= 1 and length(cast (lot_surf as character varying)) <= 3 THEN lot_surf || 'm²'
								   WHEN length(cast (lot_surf as character varying)) = 4 THEN replace(to_char(lot_surf,'FM9G999'),',',' ') || 'm²'
								   WHEN length(cast (lot_surf as character varying)) = 5 THEN replace(to_char(lot_surf,'FM99G999'),',',' ') || 'm²'
								   WHEN length(cast (lot_surf as character varying)) = 6 THEN replace(to_char(lot_surf,'FM999G999'),',',' ') || 'm²'
								   WHEN length(cast (lot_surf as character varying)) = 7 THEN replace(to_char(lot_surf,'FM9G999G999'),',',' ') || 'm²'
								   WHEN length(cast (lot_surf as character varying)) = 8 THEN replace(to_char(lot_surf,'FM99G999G999'),',',' ') || 'm²'
								   END
  WHERE idgeolf = NEW.idgeolf;
  END IF;
  
    -- si mise à jour lot divers, modifier la surface
  IF new.l_voca='40' THEN
  UPDATE m_amenagement.an_amt_lot_divers SET surf = st_area(new.geom), 
  l_surf_l = CASE WHEN length(cast (lot_surf as character varying)) >= 1 and length(cast (lot_surf as character varying)) <= 3 THEN lot_surf || 'm²'
								   WHEN length(cast (lot_surf as character varying)) = 4 THEN replace(to_char(lot_surf,'FM9G999'),',',' ') || 'm²'
								   WHEN length(cast (lot_surf as character varying)) = 5 THEN replace(to_char(lot_surf,'FM99G999'),',',' ') || 'm²'
								   WHEN length(cast (lot_surf as character varying)) = 6 THEN replace(to_char(lot_surf,'FM999G999'),',',' ') || 'm²'
								   WHEN length(cast (lot_surf as character varying)) = 7 THEN replace(to_char(lot_surf,'FM9G999G999'),',',' ') || 'm²'
								   WHEN length(cast (lot_surf as character varying)) = 8 THEN replace(to_char(lot_surf,'FM99G999G999'),',',' ') || 'm²'
								   END
  WHERE idgeolf = NEW.idgeolf;
  END IF;

  
      -- si mise à jour lot mixte, modifier la surface
  IF new.l_voca='60' THEN
  UPDATE m_amenagement.an_amt_lot_mixte SET surf = st_area(new.geom), 
  l_surf_l = CASE WHEN length(cast (lot_surf as character varying)) >= 1 and length(cast (lot_surf as character varying)) <= 3 THEN lot_surf || 'm²'
								   WHEN length(cast (lot_surf as character varying)) = 4 THEN replace(to_char(lot_surf,'FM9G999'),',',' ') || 'm²'
								   WHEN length(cast (lot_surf as character varying)) = 5 THEN replace(to_char(lot_surf,'FM99G999'),',',' ') || 'm²'
								   WHEN length(cast (lot_surf as character varying)) = 6 THEN replace(to_char(lot_surf,'FM999G999'),',',' ') || 'm²'
								   WHEN length(cast (lot_surf as character varying)) = 7 THEN replace(to_char(lot_surf,'FM9G999G999'),',',' ') || 'm²'
								   WHEN length(cast (lot_surf as character varying)) = 8 THEN replace(to_char(lot_surf,'FM99G999G999'),',',' ') || 'm²'
								   END
  WHERE idgeolf = NEW.idgeolf;
  END IF;

/* ******************************************* */
/* GESTION DES LOTS MUTANTS DE NON DEFINI VERS */
/* ******************************************* */

    -- si ma vocation foncière passe de non définie à équipement, insertion d'une ligne dans la table métier
    if old.l_voca='00' and new.l_voca='10' then

	INSERT INTO m_amenagement.an_amt_lot_equ SELECT new.idgeolf,
							(
							SELECT DISTINCT
								idsite 
							FROM 
								r_objet.geo_objet_ope
							WHERE
								st_intersects(geo_objet_ope.geom,new.geom) = true
								
							),-- recherche auto de l'IDSITE
							null,
							null,
							null,
							lot_surf,
							now(),
							null,
							null,
							CASE WHEN length(cast (lot_surf as character varying)) >= 1 and length(cast (lot_surf as character varying)) <= 3 THEN lot_surf || 'm²'
								   WHEN length(cast (lot_surf as character varying)) = 4 THEN replace(to_char(lot_surf,'FM9G999'),',',' ') || 'm²'
								   WHEN length(cast (lot_surf as character varying)) = 5 THEN replace(to_char(lot_surf,'FM99G999'),',',' ') || 'm²'
								   WHEN length(cast (lot_surf as character varying)) = 6 THEN replace(to_char(lot_surf,'FM999G999'),',',' ') || 'm²'
								   WHEN length(cast (lot_surf as character varying)) = 7 THEN replace(to_char(lot_surf,'FM9G999G999'),',',' ') || 'm²'
								   WHEN length(cast (lot_surf as character varying)) = 8 THEN replace(to_char(lot_surf,'FM99G999G999'),',',' ') || 'm²'
								   END
							;
    end if;

    -- si ma vocation foncière passe de non définie à économique, insertion d'une ligne dans la table métier
    if old.l_voca='00' and new.l_voca='20' then
	

	INSERT INTO m_economie.an_eco_lot SELECT new.idgeolf,
						 
						 (
							SELECT DISTINCT
								idsite 
							FROM 
								r_objet.geo_objet_ope
							WHERE
								st_intersects(geo_objet_ope.geom,ST_PointOnSurface(new.geom)) = true
								
						  ) , -- recherche idsite

						  lot_surf,
						
								   CASE WHEN length(cast (lot_surf as character varying)) >= 1 and length(cast (lot_surf as character varying)) <= 3 THEN lot_surf || 'm²'
								   WHEN length(cast (lot_surf as character varying)) = 4 THEN replace(to_char(lot_surf,'FM9G999'),',',' ') || 'm²'
								   WHEN length(cast (lot_surf as character varying)) = 5 THEN replace(to_char(lot_surf,'FM99G999'),',',' ') || 'm²'
								   WHEN length(cast (lot_surf as character varying)) = 6 THEN replace(to_char(lot_surf,'FM999G999'),',',' ') || 'm²'
								   WHEN length(cast (lot_surf as character varying)) = 7 THEN replace(to_char(lot_surf,'FM9G999G999'),',',' ') || 'm²'
								   WHEN length(cast (lot_surf as character varying)) = 8 THEN replace(to_char(lot_surf,'FM99G999G999'),',',' ') || 'm²'
								   END,
						  null,
						  null,
						  null,
						  null,
						  null,
						  null,
						  null,
						  null,
						  null,
						  null,
						  null,
						  null,
						  null,
						  null,
						  now(),
						  null,
						  null,
						  null,
						  null,
						  null,
						  null,
						  null,
						  null,
						  null,
						  null,
						  null,
						  null,
						  null,
						  null,
						  (select string_agg(insee, ', ') from r_osm.geo_osm_commune where st_intersects(st_buffer(new.geom,-1),geom)),
						  (select string_agg(commune, ', ') from r_osm.geo_osm_commune where st_intersects(st_buffer(new.geom,-1),geom))
						  ;
    end if;

    -- si ma vocation foncière passe de non définie à habitat, insertion d'une ligne dans la table métier (à faire lorsque cette thématique sera abordée
    
    if old.l_voca='00' and new.l_voca='30' then
        
	INSERT INTO m_amenagement.an_amt_lot_hab SELECT new.idgeolf,
						 (
							SELECT DISTINCT
								idsite 
							FROM 
								r_objet.geo_objet_ope
							WHERE
								st_intersects(geo_objet_ope.geom,st_pointonsurface(new.geom)) = true
								
						  ), -- recherche auto de l'IDSITE

						  lot_surf,
							CASE WHEN length(cast (lot_surf as character varying)) >= 1 and length(cast (lot_surf as character varying)) <= 3 THEN lot_surf || 'm²'
								   WHEN length(cast (lot_surf as character varying)) = 4 THEN replace(to_char(lot_surf,'FM9G999'),',',' ') || 'm²'
								   WHEN length(cast (lot_surf as character varying)) = 5 THEN replace(to_char(lot_surf,'FM99G999'),',',' ') || 'm²'
								   WHEN length(cast (lot_surf as character varying)) = 6 THEN replace(to_char(lot_surf,'FM999G999'),',',' ') || 'm²'
								   WHEN length(cast (lot_surf as character varying)) = 7 THEN replace(to_char(lot_surf,'FM9G999G999'),',',' ') || 'm²'
								   WHEN length(cast (lot_surf as character varying)) = 8 THEN replace(to_char(lot_surf,'FM99G999G999'),',',' ') || 'm²'
							END,
						  null,
						  null,
						  null,
						  null,
						  null,
						  null,
						  null,
						  null,
						  null,
						  null,
						  now(),
						  now(),
						  null,
						  null,
						  null,
						  null,
						  null,
						  null,
						  null,
						  null,
						  null
						  ;
    end if;

    -- si ma vocation foncière passe de non définie à divers, insertion d'une ligne dans la table métier
    if old.l_voca='00' and new.l_voca='40' then
	
	INSERT INTO m_amenagement.an_amt_lot_divers SELECT new.idgeolf,
							(
							SELECT DISTINCT
								idsite 
							FROM 
								r_objet.geo_objet_ope
							WHERE
								st_intersects(geo_objet_ope.geom,new.geom) = true
								
							),-- recherche auto de l'IDSITE
							null,
							null,
							null,
							lot_surf,
							now(),
							null,
							null,
							CASE WHEN length(cast (lot_surf as character varying)) >= 1 and length(cast (lot_surf as character varying)) <= 3 THEN lot_surf || 'm²'
								   WHEN length(cast (lot_surf as character varying)) = 4 THEN replace(to_char(lot_surf,'FM9G999'),',',' ') || 'm²'
								   WHEN length(cast (lot_surf as character varying)) = 5 THEN replace(to_char(lot_surf,'FM99G999'),',',' ') || 'm²'
								   WHEN length(cast (lot_surf as character varying)) = 6 THEN replace(to_char(lot_surf,'FM999G999'),',',' ') || 'm²'
								   WHEN length(cast (lot_surf as character varying)) = 7 THEN replace(to_char(lot_surf,'FM9G999G999'),',',' ') || 'm²'
								   WHEN length(cast (lot_surf as character varying)) = 8 THEN replace(to_char(lot_surf,'FM99G999G999'),',',' ') || 'm²'
								   END
							;
    end if;

    -- si ma vocation foncière passe de sans objet à lot espace public, modifier simplement la vocation dans la table objet (pas de table métier spécifique lot espace public)

    -- pas de requête ici, intégrer dans le UPDATE du début de trigger car simplement mise à jour de la vocation dans la table objet

    -- si ma vocation foncière passe de non définie à mixte, insertion d'une ligne dans la table métier
	if old.l_voca='00' and new.l_voca='60' then
        
	INSERT INTO m_amenagement.an_amt_lot_mixte SELECT new.idgeolf,
						 (
							SELECT DISTINCT
								idsite 
							FROM 
								r_objet.geo_objet_ope
							WHERE
								st_intersects(geo_objet_ope.geom,ST_PointOnSurface(new.geom)) = true
								
						  ), -- recherche idsite
						  lot_surf,
						
								   CASE WHEN length(cast (lot_surf as character varying)) >= 1 and length(cast (lot_surf as character varying)) <= 3 THEN lot_surf || 'm²'
								   WHEN length(cast (lot_surf as character varying)) = 4 THEN replace(to_char(lot_surf,'FM9G999'),',',' ') || 'm²'
								   WHEN length(cast (lot_surf as character varying)) = 5 THEN replace(to_char(lot_surf,'FM99G999'),',',' ') || 'm²'
								   WHEN length(cast (lot_surf as character varying)) = 6 THEN replace(to_char(lot_surf,'FM999G999'),',',' ') || 'm²'
								   WHEN length(cast (lot_surf as character varying)) = 7 THEN replace(to_char(lot_surf,'FM9G999G999'),',',' ') || 'm²'
								   WHEN length(cast (lot_surf as character varying)) = 8 THEN replace(to_char(lot_surf,'FM99G999G999'),',',' ') || 'm²'
								   END,
						  null,
						  null,
						  null,
						  null,
						  null,
						  null,
						  null,
						  null,
						  null,
						  null,
						  now(),
						  now(),
						  null,
						  null,
						  null,
						  null,
						  null,
						  null,
						  null,
						  '00',
						  null,
						  null,
						  null,
						  null,
						  null
						  ;
    end if;

/* ******************************************* */
/* GESTION DES LOTS MUTANTS DE EQUIPEMENT VERS */
/* ******************************************* */

    -- si ma vocation foncière passe d'équipements publics ou divers à non définie, suppression de la ligne dans la table métier
    if old.l_voca='10' and new.l_voca='00' then
	DELETE FROM m_amenagement.an_amt_lot_equ WHERE idgeolf=old.idgeolf;
    end if;

-- si ma vocation foncière passe d'équipements à économie, suppression de la ligne dans la table métier équipement et insertion dans économie
    if old.l_voca='10' and new.l_voca='20' then
	
	DELETE FROM m_amenagement.an_amt_lot_equ WHERE idgeolf=old.idgeolf;

	INSERT INTO m_economie.an_eco_lot SELECT new.idgeolf,
						 
						 (
							SELECT DISTINCT
								idsite 
							FROM 
								r_objet.geo_objet_ope
							WHERE
								st_intersects(geo_objet_ope.geom,ST_PointOnSurface(new.geom)) = true
								
						  ) , -- recherche idsite

						  lot_surf,
						
								   CASE WHEN length(cast (lot_surf as character varying)) >= 1 and length(cast (lot_surf as character varying)) <= 3 THEN lot_surf || 'm²'
								   WHEN length(cast (lot_surf as character varying)) = 4 THEN replace(to_char(lot_surf,'FM9G999'),',',' ') || 'm²'
								   WHEN length(cast (lot_surf as character varying)) = 5 THEN replace(to_char(lot_surf,'FM99G999'),',',' ') || 'm²'
								   WHEN length(cast (lot_surf as character varying)) = 6 THEN replace(to_char(lot_surf,'FM999G999'),',',' ') || 'm²'
								   WHEN length(cast (lot_surf as character varying)) = 7 THEN replace(to_char(lot_surf,'FM9G999G999'),',',' ') || 'm²'
								   WHEN length(cast (lot_surf as character varying)) = 8 THEN replace(to_char(lot_surf,'FM99G999G999'),',',' ') || 'm²'
								   END,
						  null,
						  null,
						  null,
						  null,
						  null,
						  null,
						  null,
						  null,
						  null,
						  null,
						  null,
						  null,
						  null,
						  null,
						  now(),
						  null,
						  null,
						  null,
						  null,
						  null,
						  null,
						  null,
						  null,
						  null,
						  null,
						  null,
						  null,
						  null,
						  null,
						  (select string_agg(insee, ', ') from r_osm.geo_osm_commune where st_intersects(st_buffer(new.geom,-1),geom)),
						  (select string_agg(commune, ', ') from r_osm.geo_osm_commune where st_intersects(st_buffer(new.geom,-1),geom))
						  ;
	end if;

     -- si ma vocation foncière passe d'équipements à habitat, suppression de la ligne dans la table métier équipement et insertion dans habitat 
    
    if old.l_voca='10' and new.l_voca='30' then
	
	DELETE FROM m_amenagement.an_amt_lot_equ WHERE idgeolf=old.idgeolf;
	INSERT INTO m_amenagement.an_amt_lot_hab SELECT new.idgeolf,
						 (
							SELECT DISTINCT
								idsite 
							FROM 
								r_objet.geo_objet_ope
							WHERE
								st_intersects(geo_objet_ope.geom,st_pointonsurface(new.geom)) = true
								
						  ), -- recherche auto de l'IDSITE

						  lot_surf,
							CASE WHEN length(cast (lot_surf as character varying)) >= 1 and length(cast (lot_surf as character varying)) <= 3 THEN lot_surf || 'm²'
								   WHEN length(cast (lot_surf as character varying)) = 4 THEN replace(to_char(lot_surf,'FM9G999'),',',' ') || 'm²'
								   WHEN length(cast (lot_surf as character varying)) = 5 THEN replace(to_char(lot_surf,'FM99G999'),',',' ') || 'm²'
								   WHEN length(cast (lot_surf as character varying)) = 6 THEN replace(to_char(lot_surf,'FM999G999'),',',' ') || 'm²'
								   WHEN length(cast (lot_surf as character varying)) = 7 THEN replace(to_char(lot_surf,'FM9G999G999'),',',' ') || 'm²'
								   WHEN length(cast (lot_surf as character varying)) = 8 THEN replace(to_char(lot_surf,'FM99G999G999'),',',' ') || 'm²'
							END,
						  null,
						  null,
						  null,
						  null,
						  null,
						  null,
						  null,
						  null,
						  null,
						  null,
						  now(),
						  now(),
						  null,
						  null,
						  null,
						  null,
						  null,
						  null,
						  null,
						  null,
						  null
						  ;
	end if;

     -- si ma vocation foncière passe d'équipements à divers, suppression de la ligne dans la table métier équipement et insertion dans divers 
    
    if old.l_voca='10' and new.l_voca='40' then
	
	DELETE FROM m_amenagement.an_amt_lot_equ WHERE idgeolf=old.idgeolf;
	INSERT INTO m_amenagement.an_amt_lot_divers SELECT new.idgeolf,
							(
							SELECT DISTINCT
								idsite 
							FROM 
								r_objet.geo_objet_ope
							WHERE
								st_intersects(geo_objet_ope.geom,new.geom) = true
								
							),-- recherche auto de l'IDSITE
							null,
							null,
							null,
							lot_surf,
							now(),
							null,
							null,
							CASE WHEN length(cast (lot_surf as character varying)) >= 1 and length(cast (lot_surf as character varying)) <= 3 THEN lot_surf || 'm²'
								   WHEN length(cast (lot_surf as character varying)) = 4 THEN replace(to_char(lot_surf,'FM9G999'),',',' ') || 'm²'
								   WHEN length(cast (lot_surf as character varying)) = 5 THEN replace(to_char(lot_surf,'FM99G999'),',',' ') || 'm²'
								   WHEN length(cast (lot_surf as character varying)) = 6 THEN replace(to_char(lot_surf,'FM999G999'),',',' ') || 'm²'
								   WHEN length(cast (lot_surf as character varying)) = 7 THEN replace(to_char(lot_surf,'FM9G999G999'),',',' ') || 'm²'
								   WHEN length(cast (lot_surf as character varying)) = 8 THEN replace(to_char(lot_surf,'FM99G999G999'),',',' ') || 'm²'
								   END
							;
	end if;

  -- si ma vocation foncière passe d'équipements publics à espace public, suppression de la ligne dans la table métier
    if old.l_voca='10' and new.l_voca='50' then
	DELETE FROM m_amenagement.an_amt_lot_equ WHERE idgeolf=old.idgeolf;
    end if;

   -- si ma vocation foncière passe d'équipements à mixte, suppression de la ligne dans la table métier équipement et insertion dans habitat 
    
    if old.l_voca='10' and new.l_voca='60' then
	
	DELETE FROM m_amenagement.an_amt_lot_equ WHERE idgeolf=old.idgeolf;
	INSERT INTO m_amenagement.an_amt_lot_mixte SELECT new.idgeolf,
						 (
							SELECT DISTINCT
								idsite 
							FROM 
								r_objet.geo_objet_ope
							WHERE
								st_intersects(geo_objet_ope.geom,ST_PointOnSurface(new.geom)) = true
								
						  ), -- recherche idsite
						  lot_surf,
						
								   CASE WHEN length(cast (lot_surf as character varying)) >= 1 and length(cast (lot_surf as character varying)) <= 3 THEN lot_surf || 'm²'
								   WHEN length(cast (lot_surf as character varying)) = 4 THEN replace(to_char(lot_surf,'FM9G999'),',',' ') || 'm²'
								   WHEN length(cast (lot_surf as character varying)) = 5 THEN replace(to_char(lot_surf,'FM99G999'),',',' ') || 'm²'
								   WHEN length(cast (lot_surf as character varying)) = 6 THEN replace(to_char(lot_surf,'FM999G999'),',',' ') || 'm²'
								   WHEN length(cast (lot_surf as character varying)) = 7 THEN replace(to_char(lot_surf,'FM9G999G999'),',',' ') || 'm²'
								   WHEN length(cast (lot_surf as character varying)) = 8 THEN replace(to_char(lot_surf,'FM99G999G999'),',',' ') || 'm²'
								   END,
						  null,
						  null,
						  null,
						  null,
						  null,
						  null,
						  null,
						  null,
						  null,
						  null,
						  now(),
						  now(),
						  null,
						  null,
						  null,
						  null,
						  null,
						  null,
						  null,
						  '00',
						  null,
						  null,
						  null,
						  null,
						  null
						  ;
    end if;
   
/* ***************************************** */
/* GESTION DES LOTS MUTANTS DE ECONOMIE VERS */
/* ***************************************** */

    -- si ma vocation foncière passe de économie à non définie, suppression de la ligne dans la table métier
    if old.l_voca='20' and new.l_voca='00' then
	DELETE FROM m_economie.an_eco_lot WHERE idgeolf=old.idgeolf;
    end if;

    -- si ma vocation foncière passe d'économie à équipements, suppression de la ligne dans la table métier économie et insertion dans équipement
    if old.l_voca='20' and new.l_voca='10' then
	
	DELETE FROM m_economie.an_eco_lot WHERE idgeolf=old.idgeolf;

	INSERT INTO m_amenagement.an_amt_lot_equ SELECT new.idgeolf,
							(
							SELECT DISTINCT
								idsite 
							FROM 
								r_objet.geo_objet_ope
							WHERE
								st_intersects(geo_objet_ope.geom,new.geom) = true
								
							),-- recherche auto de l'IDSITE
							null,
							null,
							null,
							lot_surf,
							now(),
							null,
							null,
							CASE WHEN length(cast (lot_surf as character varying)) >= 1 and length(cast (lot_surf as character varying)) <= 3 THEN lot_surf || 'm²'
								   WHEN length(cast (lot_surf as character varying)) = 4 THEN replace(to_char(lot_surf,'FM9G999'),',',' ') || 'm²'
								   WHEN length(cast (lot_surf as character varying)) = 5 THEN replace(to_char(lot_surf,'FM99G999'),',',' ') || 'm²'
								   WHEN length(cast (lot_surf as character varying)) = 6 THEN replace(to_char(lot_surf,'FM999G999'),',',' ') || 'm²'
								   WHEN length(cast (lot_surf as character varying)) = 7 THEN replace(to_char(lot_surf,'FM9G999G999'),',',' ') || 'm²'
								   WHEN length(cast (lot_surf as character varying)) = 8 THEN replace(to_char(lot_surf,'FM99G999G999'),',',' ') || 'm²'
								   END
							;
    end if;

    -- si ma vocation foncière passe d'économie à habitat, suppression de la ligne dans la table métier économie et insertion dans habitat
    
    if (old.l_voca='20') and (new.l_voca='30') then
	
	DELETE FROM m_economie.an_eco_lot WHERE idgeolf=old.idgeolf;
	INSERT INTO m_amenagement.an_amt_lot_hab SELECT new.idgeolf,
						 (
							SELECT DISTINCT
								idsite 
							FROM 
								r_objet.geo_objet_ope
							WHERE
								st_intersects(geo_objet_ope.geom,st_pointonsurface(new.geom)) = true
								
						  ), -- recherche auto de l'IDSITE

						  lot_surf,
							CASE WHEN length(cast (lot_surf as character varying)) >= 1 and length(cast (lot_surf as character varying)) <= 3 THEN lot_surf || 'm²'
								   WHEN length(cast (lot_surf as character varying)) = 4 THEN replace(to_char(lot_surf,'FM9G999'),',',' ') || 'm²'
								   WHEN length(cast (lot_surf as character varying)) = 5 THEN replace(to_char(lot_surf,'FM99G999'),',',' ') || 'm²'
								   WHEN length(cast (lot_surf as character varying)) = 6 THEN replace(to_char(lot_surf,'FM999G999'),',',' ') || 'm²'
								   WHEN length(cast (lot_surf as character varying)) = 7 THEN replace(to_char(lot_surf,'FM9G999G999'),',',' ') || 'm²'
								   WHEN length(cast (lot_surf as character varying)) = 8 THEN replace(to_char(lot_surf,'FM99G999G999'),',',' ') || 'm²'
							END,
						  null,
						  null,
						  null,
						  null,
						  null,
						  null,
						  null,
						  null,
						  null,
						  null,
						  now(),
						  now(),
						  null,
						  null,
						  null,
						  null,
						  null,
						  null,
						  null,
						  null,
						  null
						  ;
    end if;

    -- si ma vocation foncière passe d'économie à divers, suppression de la ligne dans la table métier économie et insertion dans équipement
    if old.l_voca='20' and new.l_voca='40' then
	
	DELETE FROM m_economie.an_eco_lot WHERE idgeolf=old.idgeolf;

	INSERT INTO m_amenagement.an_amt_lot_divers SELECT new.idgeolf,
							(
							SELECT DISTINCT
								idsite 
							FROM 
								r_objet.geo_objet_ope
							WHERE
								st_intersects(geo_objet_ope.geom,new.geom) = true
								
							),-- recherche auto de l'IDSITE
							null,
							null,
							null,
							lot_surf,
							now(),
							null,
							null,
							CASE WHEN length(cast (lot_surf as character varying)) >= 1 and length(cast (lot_surf as character varying)) <= 3 THEN lot_surf || 'm²'
								   WHEN length(cast (lot_surf as character varying)) = 4 THEN replace(to_char(lot_surf,'FM9G999'),',',' ') || 'm²'
								   WHEN length(cast (lot_surf as character varying)) = 5 THEN replace(to_char(lot_surf,'FM99G999'),',',' ') || 'm²'
								   WHEN length(cast (lot_surf as character varying)) = 6 THEN replace(to_char(lot_surf,'FM999G999'),',',' ') || 'm²'
								   WHEN length(cast (lot_surf as character varying)) = 7 THEN replace(to_char(lot_surf,'FM9G999G999'),',',' ') || 'm²'
								   WHEN length(cast (lot_surf as character varying)) = 8 THEN replace(to_char(lot_surf,'FM99G999G999'),',',' ') || 'm²'
								   END
							;
    end if;

     -- si ma vocation foncière passe d'économie à espace public, suppression de la ligne dans la table métier
    if old.l_voca='20' and new.l_voca='50' then
	DELETE FROM m_economie.an_eco_lot WHERE idgeolf=old.idgeolf;
    end if;
    
-- si ma vocation foncière passe d'économie à mixte, suppression de la ligne dans la table métier économie et insertion dans mixte
    
    if (old.l_voca='20') and (new.l_voca='60') then
	
	DELETE FROM m_economie.an_eco_lot WHERE idgeolf=old.idgeolf;
	INSERT INTO m_amenagement.an_amt_lot_mixte SELECT new.idgeolf,
						 (
							SELECT DISTINCT
								idsite 
							FROM 
								r_objet.geo_objet_ope
							WHERE
								st_intersects(geo_objet_ope.geom,ST_PointOnSurface(new.geom)) = true
								
						  ), -- recherche idsite
						  lot_surf,
						
								   CASE WHEN length(cast (lot_surf as character varying)) >= 1 and length(cast (lot_surf as character varying)) <= 3 THEN lot_surf || 'm²'
								   WHEN length(cast (lot_surf as character varying)) = 4 THEN replace(to_char(lot_surf,'FM9G999'),',',' ') || 'm²'
								   WHEN length(cast (lot_surf as character varying)) = 5 THEN replace(to_char(lot_surf,'FM99G999'),',',' ') || 'm²'
								   WHEN length(cast (lot_surf as character varying)) = 6 THEN replace(to_char(lot_surf,'FM999G999'),',',' ') || 'm²'
								   WHEN length(cast (lot_surf as character varying)) = 7 THEN replace(to_char(lot_surf,'FM9G999G999'),',',' ') || 'm²'
								   WHEN length(cast (lot_surf as character varying)) = 8 THEN replace(to_char(lot_surf,'FM99G999G999'),',',' ') || 'm²'
								   END,
						  null,
						  null,
						  null,
						  null,
						  null,
						  null,
						  null,
						  null,
						  null,
						  null,
						  now(),
						  now(),
						  null,
						  null,
						  null,
						  null,
						  null,
						  null,
						  null,
						  '00',
						  null,
						  null,
						  null,
						  null,
						  null
						  ;
    end if;

/* **************************************** */
/* GESTION DES LOTS MUTANTS DE HABITAT VERS */
/* **************************************** */

     -- si ma vocation foncière passe de habitat à non définie, suppression de la ligne dans la table métier
    
    if old.l_voca='30' and new.l_voca='00' then
	DELETE FROM m_amenagement.an_amt_lot_hab WHERE idgeolf=old.idgeolf;
    end if;

    -- si ma vocation foncière passe d'habitat à équipements, suppression de la ligne dans la table métier habitat et insertion dans équipement 
    if (old.l_voca='30') and (new.l_voca='10') then
	
	DELETE FROM m_amenagement.an_amt_lot_hab WHERE idgeolf=old.idgeolf;
	INSERT INTO m_amenagement.an_amt_lot_equ SELECT new.idgeolf,
							(
							SELECT DISTINCT
								idsite 
							FROM 
								r_objet.geo_objet_ope
							WHERE
								st_intersects(geo_objet_ope.geom,new.geom) = true
								
							),-- recherche auto de l'IDSITE
							null,
							null,
							null,
							lot_surf,
							now(),
							null,
							null,
							CASE WHEN length(cast (lot_surf as character varying)) >= 1 and length(cast (lot_surf as character varying)) <= 3 THEN lot_surf || 'm²'
								   WHEN length(cast (lot_surf as character varying)) = 4 THEN replace(to_char(lot_surf,'FM9G999'),',',' ') || 'm²'
								   WHEN length(cast (lot_surf as character varying)) = 5 THEN replace(to_char(lot_surf,'FM99G999'),',',' ') || 'm²'
								   WHEN length(cast (lot_surf as character varying)) = 6 THEN replace(to_char(lot_surf,'FM999G999'),',',' ') || 'm²'
								   WHEN length(cast (lot_surf as character varying)) = 7 THEN replace(to_char(lot_surf,'FM9G999G999'),',',' ') || 'm²'
								   WHEN length(cast (lot_surf as character varying)) = 8 THEN replace(to_char(lot_surf,'FM99G999G999'),',',' ') || 'm²'
								   END
							;
    end if;

     -- si ma vocation foncière passe d'habitat à économie, suppression de la ligne dans la table métier habitat et insertion dans économie 
    if (old.l_voca='30') and (new.l_voca='20') then
	
	DELETE FROM m_amenagement.an_amt_lot_hab WHERE idgeolf=old.idgeolf;
	INSERT INTO m_economie.an_eco_lot SELECT new.idgeolf,
						 
						 (
							SELECT DISTINCT
								idsite 
							FROM 
								r_objet.geo_objet_ope
							WHERE
								st_intersects(geo_objet_ope.geom,ST_PointOnSurface(new.geom)) = true
								
						  ) , -- recherche idsite

						  lot_surf,
						
								   CASE WHEN length(cast (lot_surf as character varying)) >= 1 and length(cast (lot_surf as character varying)) <= 3 THEN lot_surf || 'm²'
								   WHEN length(cast (lot_surf as character varying)) = 4 THEN replace(to_char(lot_surf,'FM9G999'),',',' ') || 'm²'
								   WHEN length(cast (lot_surf as character varying)) = 5 THEN replace(to_char(lot_surf,'FM99G999'),',',' ') || 'm²'
								   WHEN length(cast (lot_surf as character varying)) = 6 THEN replace(to_char(lot_surf,'FM999G999'),',',' ') || 'm²'
								   WHEN length(cast (lot_surf as character varying)) = 7 THEN replace(to_char(lot_surf,'FM9G999G999'),',',' ') || 'm²'
								   WHEN length(cast (lot_surf as character varying)) = 8 THEN replace(to_char(lot_surf,'FM99G999G999'),',',' ') || 'm²'
								   END,
						  null,
						  null,
						  null,
						  null,
						  null,
						  null,
						  null,
						  null,
						  null,
						  null,
						  null,
						  null,
						  null,
						  null,
						  now(),
						  null,
						  null,
						  null,
						  null,
						  null,
						  null,
						  null,
						  null,
						  null,
						  null,
						  null,
						  null,
						  null,
						  null,
						  (select string_agg(insee, ', ') from r_osm.geo_osm_commune where st_intersects(st_buffer(new.geom,-1),geom)),
						  (select string_agg(commune, ', ') from r_osm.geo_osm_commune where st_intersects(st_buffer(new.geom,-1),geom))
						  ;
    end if;
    
    
     -- si ma vocation foncière passe d'habitat à divers, suppression de la ligne dans la table métier habitat et insertion dans divers 
    if (old.l_voca='30') and (new.l_voca='40') then
	
	DELETE FROM m_amenagement.an_amt_lot_hab WHERE idgeolf=old.idgeolf;
	INSERT INTO m_amenagement.an_amt_lot_divers SELECT new.idgeolf,
							(
							SELECT DISTINCT
								idsite 
							FROM 
								r_objet.geo_objet_ope
							WHERE
								st_intersects(geo_objet_ope.geom,new.geom) = true
								
							),-- recherche auto de l'IDSITE
							null,
							null,
							null,
							lot_surf,
							now(),
							null,
							null,
							CASE WHEN length(cast (lot_surf as character varying)) >= 1 and length(cast (lot_surf as character varying)) <= 3 THEN lot_surf || 'm²'
								   WHEN length(cast (lot_surf as character varying)) = 4 THEN replace(to_char(lot_surf,'FM9G999'),',',' ') || 'm²'
								   WHEN length(cast (lot_surf as character varying)) = 5 THEN replace(to_char(lot_surf,'FM99G999'),',',' ') || 'm²'
								   WHEN length(cast (lot_surf as character varying)) = 6 THEN replace(to_char(lot_surf,'FM999G999'),',',' ') || 'm²'
								   WHEN length(cast (lot_surf as character varying)) = 7 THEN replace(to_char(lot_surf,'FM9G999G999'),',',' ') || 'm²'
								   WHEN length(cast (lot_surf as character varying)) = 8 THEN replace(to_char(lot_surf,'FM99G999G999'),',',' ') || 'm²'
								   END
							;
    end if;

   -- si ma vocation foncière passe d'habitat à mixte, suppression de la ligne dans la table métier habitat et insertion dans mixte 
    if (old.l_voca='30') and (new.l_voca='60') then
	
	DELETE FROM m_amenagement.an_amt_lot_hab WHERE idgeolf=old.idgeolf;
	INSERT INTO m_amenagement.an_amt_lot_mixte SELECT new.idgeolf,
						 (
							SELECT DISTINCT
								idsite 
							FROM 
								r_objet.geo_objet_ope
							WHERE
								st_intersects(geo_objet_ope.geom,ST_PointOnSurface(new.geom)) = true
								
						  ), -- recherche idsite
						  lot_surf,
						
								   CASE WHEN length(cast (lot_surf as character varying)) >= 1 and length(cast (lot_surf as character varying)) <= 3 THEN lot_surf || 'm²'
								   WHEN length(cast (lot_surf as character varying)) = 4 THEN replace(to_char(lot_surf,'FM9G999'),',',' ') || 'm²'
								   WHEN length(cast (lot_surf as character varying)) = 5 THEN replace(to_char(lot_surf,'FM99G999'),',',' ') || 'm²'
								   WHEN length(cast (lot_surf as character varying)) = 6 THEN replace(to_char(lot_surf,'FM999G999'),',',' ') || 'm²'
								   WHEN length(cast (lot_surf as character varying)) = 7 THEN replace(to_char(lot_surf,'FM9G999G999'),',',' ') || 'm²'
								   WHEN length(cast (lot_surf as character varying)) = 8 THEN replace(to_char(lot_surf,'FM99G999G999'),',',' ') || 'm²'
								   END,
						  null,
						  null,
						  null,
						  null,
						  null,
						  null,
						  null,
						  null,
						  null,
						  null,
						  now(),
						  now(),
						  null,
						  null,
						  null,
						  null,
						  null,
						  null,
						  null,
						  '00',
						  null,
						  null,
						  null,
						  null,
						  null
						  ;
    end if;

/* *************************************** */
/* GESTION DES LOTS MUTANTS DE DIVERS VERS */
/* *************************************** */

 -- si ma vocation foncière passe de divers à non définie, suppression de la ligne dans la table métier
    
    if old.l_voca='40' and new.l_voca='00' then
	DELETE FROM m_amenagement.an_amt_lot_divers WHERE idgeolf=old.idgeolf;
    end if;

    -- si ma vocation foncière passe de divers à équipements, suppression de la ligne dans la table métier divers et insertion dans équipement 
    if (old.l_voca='40') and (new.l_voca='10') then
	
	DELETE FROM m_amenagement.an_amt_lot_divers WHERE idgeolf=old.idgeolf;
	INSERT INTO m_amenagement.an_amt_lot_equ SELECT new.idgeolf,
							(
							SELECT DISTINCT
								idsite 
							FROM 
								r_objet.geo_objet_ope
							WHERE
								st_intersects(geo_objet_ope.geom,new.geom) = true
								
							),-- recherche auto de l'IDSITE
							null,
							null,
							null,
							lot_surf,
							now(),
							null,
							null,
							CASE WHEN length(cast (lot_surf as character varying)) >= 1 and length(cast (lot_surf as character varying)) <= 3 THEN lot_surf || 'm²'
								   WHEN length(cast (lot_surf as character varying)) = 4 THEN replace(to_char(lot_surf,'FM9G999'),',',' ') || 'm²'
								   WHEN length(cast (lot_surf as character varying)) = 5 THEN replace(to_char(lot_surf,'FM99G999'),',',' ') || 'm²'
								   WHEN length(cast (lot_surf as character varying)) = 6 THEN replace(to_char(lot_surf,'FM999G999'),',',' ') || 'm²'
								   WHEN length(cast (lot_surf as character varying)) = 7 THEN replace(to_char(lot_surf,'FM9G999G999'),',',' ') || 'm²'
								   WHEN length(cast (lot_surf as character varying)) = 8 THEN replace(to_char(lot_surf,'FM99G999G999'),',',' ') || 'm²'
								   END
							;
    end if;

     -- si ma vocation foncière passe de divers à économie, suppression de la ligne dans la table métier divers et insertion dans économie 
    if (old.l_voca='40') and (new.l_voca='20') then
	
	DELETE FROM m_amenagement.an_amt_lot_divers WHERE idgeolf=old.idgeolf;
	INSERT INTO m_economie.an_eco_lot SELECT new.idgeolf,
						 
						 (
							SELECT DISTINCT
								idsite 
							FROM 
								r_objet.geo_objet_ope
							WHERE
								st_intersects(geo_objet_ope.geom,ST_PointOnSurface(new.geom)) = true
								
						  ) , -- recherche idsite

						  lot_surf,
						
								   CASE WHEN length(cast (lot_surf as character varying)) >= 1 and length(cast (lot_surf as character varying)) <= 3 THEN lot_surf || 'm²'
								   WHEN length(cast (lot_surf as character varying)) = 4 THEN replace(to_char(lot_surf,'FM9G999'),',',' ') || 'm²'
								   WHEN length(cast (lot_surf as character varying)) = 5 THEN replace(to_char(lot_surf,'FM99G999'),',',' ') || 'm²'
								   WHEN length(cast (lot_surf as character varying)) = 6 THEN replace(to_char(lot_surf,'FM999G999'),',',' ') || 'm²'
								   WHEN length(cast (lot_surf as character varying)) = 7 THEN replace(to_char(lot_surf,'FM9G999G999'),',',' ') || 'm²'
								   WHEN length(cast (lot_surf as character varying)) = 8 THEN replace(to_char(lot_surf,'FM99G999G999'),',',' ') || 'm²'
								   END,
						  null,
						  null,
						  null,
						  null,
						  null,
						  null,
						  null,
						  null,
						  null,
						  null,
						  null,
						  null,
						  null,
						  null,
						  now(),
						  null,
						  null,
						  null,
						  null,
						  null,
						  null,
						  null,
						  null,
						  null,
						  null,
						  null,
						  null,
						  null,
						  null,
						  (select string_agg(insee, ', ') from r_osm.geo_osm_commune where st_intersects(st_buffer(new.geom,-1),geom)),
						  (select string_agg(commune, ', ') from r_osm.geo_osm_commune where st_intersects(st_buffer(new.geom,-1),geom))
						  ;
    end if;
    
    
     -- si ma vocation foncière passe de divers à habitat, suppression de la ligne dans la table métier divers et insertion dans habitat 
    if (old.l_voca='40') and (new.l_voca='30') then
	
	DELETE FROM m_amenagement.an_amt_lot_divers WHERE idgeolf=old.idgeolf;
	INSERT INTO m_amenagement.an_amt_lot_hab SELECT new.idgeolf,
						 (
							SELECT DISTINCT
								idsite 
							FROM 
								r_objet.geo_objet_ope
							WHERE
								st_intersects(geo_objet_ope.geom,st_pointonsurface(new.geom)) = true
								
						  ), -- recherche auto de l'IDSITE

						  lot_surf,
							CASE WHEN length(cast (lot_surf as character varying)) >= 1 and length(cast (lot_surf as character varying)) <= 3 THEN lot_surf || 'm²'
								   WHEN length(cast (lot_surf as character varying)) = 4 THEN replace(to_char(lot_surf,'FM9G999'),',',' ') || 'm²'
								   WHEN length(cast (lot_surf as character varying)) = 5 THEN replace(to_char(lot_surf,'FM99G999'),',',' ') || 'm²'
								   WHEN length(cast (lot_surf as character varying)) = 6 THEN replace(to_char(lot_surf,'FM999G999'),',',' ') || 'm²'
								   WHEN length(cast (lot_surf as character varying)) = 7 THEN replace(to_char(lot_surf,'FM9G999G999'),',',' ') || 'm²'
								   WHEN length(cast (lot_surf as character varying)) = 8 THEN replace(to_char(lot_surf,'FM99G999G999'),',',' ') || 'm²'
							END,
						  null,
						  null,
						  null,
						  null,
						  null,
						  null,
						  null,
						  null,
						  null,
						  null,
						  now(),
						  now(),
						  null,
						  null,
						  null,
						  null,
						  null,
						  null,
						  null,
						  null,
						  null
						  ;
    end if;

   -- si ma vocation foncière passe de divers à mixte, suppression de la ligne dans la table métier divers et insertion dans mixte 
    if (old.l_voca='40') and (new.l_voca='60') then
	
	DELETE FROM m_amenagement.an_amt_lot_divers WHERE idgeolf=old.idgeolf;
	INSERT INTO m_amenagement.an_amt_lot_mixte SELECT new.idgeolf,
						 (
							SELECT DISTINCT
								idsite 
							FROM 
								r_objet.geo_objet_ope
							WHERE
								st_intersects(geo_objet_ope.geom,ST_PointOnSurface(new.geom)) = true
								
						  ), -- recherche idsite
						  lot_surf,
						
								   CASE WHEN length(cast (lot_surf as character varying)) >= 1 and length(cast (lot_surf as character varying)) <= 3 THEN lot_surf || 'm²'
								   WHEN length(cast (lot_surf as character varying)) = 4 THEN replace(to_char(lot_surf,'FM9G999'),',',' ') || 'm²'
								   WHEN length(cast (lot_surf as character varying)) = 5 THEN replace(to_char(lot_surf,'FM99G999'),',',' ') || 'm²'
								   WHEN length(cast (lot_surf as character varying)) = 6 THEN replace(to_char(lot_surf,'FM999G999'),',',' ') || 'm²'
								   WHEN length(cast (lot_surf as character varying)) = 7 THEN replace(to_char(lot_surf,'FM9G999G999'),',',' ') || 'm²'
								   WHEN length(cast (lot_surf as character varying)) = 8 THEN replace(to_char(lot_surf,'FM99G999G999'),',',' ') || 'm²'
								   END,
						  null,
						  null,
						  null,
						  null,
						  null,
						  null,
						  null,
						  null,
						  null,
						  null,
						  now(),
						  now(),
						  null,
						  null,
						  null,
						  null,
						  null,
						  null,
						  null,
						  '00',
						  null,
						  null,
						  null,
						  null,
						  null
						  ;
    end if;

/* ********************************************** */
/* GESTION DES LOTS MUTANTS DE ESPACE PUBLIC VERS */
/* ********************************************** */

 -- si ma vocation foncière passe de espace public à non définie, suppression de la ligne dans la table métier
    
 -- gérer ici en début de trigger juste mise jour du champ l_voca dans la table des objets car pas de données métiers rattachées à ce type de lot

    -- si ma vocation foncière passe de espace publique à équipements, nsertion dans équipement 
    if (old.l_voca='50') and (new.l_voca='10') then
	
	INSERT INTO m_amenagement.an_amt_lot_equ SELECT new.idgeolf,
							(
							SELECT DISTINCT
								idsite 
							FROM 
								r_objet.geo_objet_ope
							WHERE
								st_intersects(geo_objet_ope.geom,new.geom) = true
								
							),-- recherche auto de l'IDSITE
							null,
							null,
							null,
							lot_surf,
							now(),
							null,
							null,
							CASE WHEN length(cast (lot_surf as character varying)) >= 1 and length(cast (lot_surf as character varying)) <= 3 THEN lot_surf || 'm²'
								   WHEN length(cast (lot_surf as character varying)) = 4 THEN replace(to_char(lot_surf,'FM9G999'),',',' ') || 'm²'
								   WHEN length(cast (lot_surf as character varying)) = 5 THEN replace(to_char(lot_surf,'FM99G999'),',',' ') || 'm²'
								   WHEN length(cast (lot_surf as character varying)) = 6 THEN replace(to_char(lot_surf,'FM999G999'),',',' ') || 'm²'
								   WHEN length(cast (lot_surf as character varying)) = 7 THEN replace(to_char(lot_surf,'FM9G999G999'),',',' ') || 'm²'
								   WHEN length(cast (lot_surf as character varying)) = 8 THEN replace(to_char(lot_surf,'FM99G999G999'),',',' ') || 'm²'
								   END
							;
    end if;

     -- si ma vocation foncière passe de espace public à économie, insertion dans économie 
    if (old.l_voca='50') and (new.l_voca='20') then
	
	INSERT INTO m_economie.an_eco_lot SELECT new.idgeolf,
						 
						 (
							SELECT DISTINCT
								idsite 
							FROM 
								r_objet.geo_objet_ope
							WHERE
								st_intersects(geo_objet_ope.geom,ST_PointOnSurface(new.geom)) = true
								
						  ) , -- recherche idsite

						  lot_surf,
						
								   CASE WHEN length(cast (lot_surf as character varying)) >= 1 and length(cast (lot_surf as character varying)) <= 3 THEN lot_surf || 'm²'
								   WHEN length(cast (lot_surf as character varying)) = 4 THEN replace(to_char(lot_surf,'FM9G999'),',',' ') || 'm²'
								   WHEN length(cast (lot_surf as character varying)) = 5 THEN replace(to_char(lot_surf,'FM99G999'),',',' ') || 'm²'
								   WHEN length(cast (lot_surf as character varying)) = 6 THEN replace(to_char(lot_surf,'FM999G999'),',',' ') || 'm²'
								   WHEN length(cast (lot_surf as character varying)) = 7 THEN replace(to_char(lot_surf,'FM9G999G999'),',',' ') || 'm²'
								   WHEN length(cast (lot_surf as character varying)) = 8 THEN replace(to_char(lot_surf,'FM99G999G999'),',',' ') || 'm²'
								   END,
						  null,
						  null,
						  null,
						  null,
						  null,
						  null,
						  null,
						  null,
						  null,
						  null,
						  null,
						  null,
						  null,
						  null,
						  now(),
						  null,
						  null,
						  null,
						  null,
						  null,
						  null,
						  null,
						  null,
						  null,
						  null,
						  null,
						  null,
						  null,
						  null,
						  (select string_agg(insee, ', ') from r_osm.geo_osm_commune where st_intersects(st_buffer(new.geom,-1),geom)),
						  (select string_agg(commune, ', ') from r_osm.geo_osm_commune where st_intersects(st_buffer(new.geom,-1),geom))
						  ;
    end if;
    
    
     -- si ma vocation foncière passe de espace public à habitat, insertion dans habitat 
    if (old.l_voca='50') and (new.l_voca='30') then
	
	INSERT INTO m_amenagement.an_amt_lot_hab SELECT new.idgeolf,
						 (
							SELECT DISTINCT
								idsite 
							FROM 
								r_objet.geo_objet_ope
							WHERE
								st_intersects(geo_objet_ope.geom,st_pointonsurface(new.geom)) = true
								
						  ), -- recherche auto de l'IDSITE

						  lot_surf,
							CASE WHEN length(cast (lot_surf as character varying)) >= 1 and length(cast (lot_surf as character varying)) <= 3 THEN lot_surf || 'm²'
								   WHEN length(cast (lot_surf as character varying)) = 4 THEN replace(to_char(lot_surf,'FM9G999'),',',' ') || 'm²'
								   WHEN length(cast (lot_surf as character varying)) = 5 THEN replace(to_char(lot_surf,'FM99G999'),',',' ') || 'm²'
								   WHEN length(cast (lot_surf as character varying)) = 6 THEN replace(to_char(lot_surf,'FM999G999'),',',' ') || 'm²'
								   WHEN length(cast (lot_surf as character varying)) = 7 THEN replace(to_char(lot_surf,'FM9G999G999'),',',' ') || 'm²'
								   WHEN length(cast (lot_surf as character varying)) = 8 THEN replace(to_char(lot_surf,'FM99G999G999'),',',' ') || 'm²'
							END,
						  null,
						  null,
						  null,
						  null,
						  null,
						  null,
						  null,
						  null,
						  null,
						  null,
						  now(),
						  now(),
						  null,
						  null,
						  null,
						  null,
						  null,
						  null,
						  null,
						  null,
						  null
						  ;
    end if;

    -- si ma vocation foncière passe de espace public à divers, insertion dans divers 
    if (old.l_voca='50') and (new.l_voca='40') then
	
	INSERT INTO m_amenagement.an_amt_lot_divers SELECT new.idgeolf,
							(
							SELECT DISTINCT
								idsite 
							FROM 
								r_objet.geo_objet_ope
							WHERE
								st_intersects(geo_objet_ope.geom,new.geom) = true
								
							),-- recherche auto de l'IDSITE
							null,
							null,
							null,
							lot_surf,
							now(),
							null,
							null,
							CASE WHEN length(cast (lot_surf as character varying)) >= 1 and length(cast (lot_surf as character varying)) <= 3 THEN lot_surf || 'm²'
								   WHEN length(cast (lot_surf as character varying)) = 4 THEN replace(to_char(lot_surf,'FM9G999'),',',' ') || 'm²'
								   WHEN length(cast (lot_surf as character varying)) = 5 THEN replace(to_char(lot_surf,'FM99G999'),',',' ') || 'm²'
								   WHEN length(cast (lot_surf as character varying)) = 6 THEN replace(to_char(lot_surf,'FM999G999'),',',' ') || 'm²'
								   WHEN length(cast (lot_surf as character varying)) = 7 THEN replace(to_char(lot_surf,'FM9G999G999'),',',' ') || 'm²'
								   WHEN length(cast (lot_surf as character varying)) = 8 THEN replace(to_char(lot_surf,'FM99G999G999'),',',' ') || 'm²'
								   END
							;
    end if;

   -- si ma vocation foncière passe de espace public à mixte, insertion dans mixte 
    if (old.l_voca='50') and (new.l_voca='60') then
	
	INSERT INTO m_amenagement.an_amt_lot_mixte SELECT new.idgeolf,
						 (
							SELECT DISTINCT
								idsite 
							FROM 
								r_objet.geo_objet_ope
							WHERE
								st_intersects(geo_objet_ope.geom,ST_PointOnSurface(new.geom)) = true
								
						  ), -- recherche idsite
						  lot_surf,
						
								   CASE WHEN length(cast (lot_surf as character varying)) >= 1 and length(cast (lot_surf as character varying)) <= 3 THEN lot_surf || 'm²'
								   WHEN length(cast (lot_surf as character varying)) = 4 THEN replace(to_char(lot_surf,'FM9G999'),',',' ') || 'm²'
								   WHEN length(cast (lot_surf as character varying)) = 5 THEN replace(to_char(lot_surf,'FM99G999'),',',' ') || 'm²'
								   WHEN length(cast (lot_surf as character varying)) = 6 THEN replace(to_char(lot_surf,'FM999G999'),',',' ') || 'm²'
								   WHEN length(cast (lot_surf as character varying)) = 7 THEN replace(to_char(lot_surf,'FM9G999G999'),',',' ') || 'm²'
								   WHEN length(cast (lot_surf as character varying)) = 8 THEN replace(to_char(lot_surf,'FM99G999G999'),',',' ') || 'm²'
								   END,
						  null,
						  null,
						  null,
						  null,
						  null,
						  null,
						  null,
						  null,
						  null,
						  null,
						  now(),
						  now(),
						  null,
						  null,
						  null,
						  null,
						  null,
						  null,
						  null,
						  '00',
						  null,
						  null,
						  null,
						  null,
						  null
						  ;
    end if;

/* ************************************** */
/* GESTION DES LOTS MUTANTS DE MIXTE VERS */
/* ************************************** */

 -- si ma vocation foncière passe de mixte à non définie, suppression de la ligne dans la table mixte
    
    if old.l_voca='60' and new.l_voca='00' then
	DELETE FROM m_amenagement.an_amt_lot_mixte WHERE idgeolf=old.idgeolf;
    end if;

    -- si ma vocation foncière passe de mixte à équipements, suppression de la ligne dans la table métier mixte et insertion dans équipement 
    if (old.l_voca='60') and (new.l_voca='10') then
	
	DELETE FROM m_amenagement.an_amt_lot_mixte WHERE idgeolf=old.idgeolf;
	INSERT INTO m_amenagement.an_amt_lot_equ SELECT new.idgeolf,
							(
							SELECT DISTINCT
								idsite 
							FROM 
								r_objet.geo_objet_ope
							WHERE
								st_intersects(geo_objet_ope.geom,new.geom) = true
								
							),-- recherche auto de l'IDSITE
							null,
							null,
							null,
							lot_surf,
							now(),
							null,
							null,
							CASE WHEN length(cast (lot_surf as character varying)) >= 1 and length(cast (lot_surf as character varying)) <= 3 THEN lot_surf || 'm²'
								   WHEN length(cast (lot_surf as character varying)) = 4 THEN replace(to_char(lot_surf,'FM9G999'),',',' ') || 'm²'
								   WHEN length(cast (lot_surf as character varying)) = 5 THEN replace(to_char(lot_surf,'FM99G999'),',',' ') || 'm²'
								   WHEN length(cast (lot_surf as character varying)) = 6 THEN replace(to_char(lot_surf,'FM999G999'),',',' ') || 'm²'
								   WHEN length(cast (lot_surf as character varying)) = 7 THEN replace(to_char(lot_surf,'FM9G999G999'),',',' ') || 'm²'
								   WHEN length(cast (lot_surf as character varying)) = 8 THEN replace(to_char(lot_surf,'FM99G999G999'),',',' ') || 'm²'
								   END
							;
    end if;

     -- si ma vocation foncière passe de mixte à économie, suppression de la ligne dans la table métier mixte et insertion dans économie 
    if (old.l_voca='60') and (new.l_voca='20') then
	
	DELETE FROM m_amenagement.an_amt_lot_mixte WHERE idgeolf=old.idgeolf;
	INSERT INTO m_economie.an_eco_lot SELECT new.idgeolf,
						 
						 (
							SELECT DISTINCT
								idsite 
							FROM 
								r_objet.geo_objet_ope
							WHERE
								st_intersects(geo_objet_ope.geom,ST_PointOnSurface(new.geom)) = true
								
						  ) , -- recherche idsite

						  lot_surf,
						
								   CASE WHEN length(cast (lot_surf as character varying)) >= 1 and length(cast (lot_surf as character varying)) <= 3 THEN lot_surf || 'm²'
								   WHEN length(cast (lot_surf as character varying)) = 4 THEN replace(to_char(lot_surf,'FM9G999'),',',' ') || 'm²'
								   WHEN length(cast (lot_surf as character varying)) = 5 THEN replace(to_char(lot_surf,'FM99G999'),',',' ') || 'm²'
								   WHEN length(cast (lot_surf as character varying)) = 6 THEN replace(to_char(lot_surf,'FM999G999'),',',' ') || 'm²'
								   WHEN length(cast (lot_surf as character varying)) = 7 THEN replace(to_char(lot_surf,'FM9G999G999'),',',' ') || 'm²'
								   WHEN length(cast (lot_surf as character varying)) = 8 THEN replace(to_char(lot_surf,'FM99G999G999'),',',' ') || 'm²'
								   END,
						  null,
						  null,
						  null,
						  null,
						  null,
						  null,
						  null,
						  null,
						  null,
						  null,
						  null,
						  null,
						  null,
						  null,
						  now(),
						  null,
						  null,
						  null,
						  null,
						  null,
						  null,
						  null,
						  null,
						  null,
						  null,
						  null,
						  null,
						  null,
						  null,
						  (select string_agg(insee, ', ') from r_osm.geo_osm_commune where st_intersects(st_buffer(new.geom,-1),geom)),
						  (select string_agg(commune, ', ') from r_osm.geo_osm_commune where st_intersects(st_buffer(new.geom,-1),geom))
						  ;
    end if;
    
    
     -- si ma vocation foncière passe de mixte à habitat, suppression de la ligne dans la table métier mixte et insertion dans habitat 
    if (old.l_voca='60') and (new.l_voca='30') then
	
	DELETE FROM m_amenagement.an_amt_lot_mixte WHERE idgeolf=old.idgeolf;
	INSERT INTO m_amenagement.an_amt_lot_hab SELECT new.idgeolf,
						 (
							SELECT DISTINCT
								idsite 
							FROM 
								r_objet.geo_objet_ope
							WHERE
								st_intersects(geo_objet_ope.geom,st_pointonsurface(new.geom)) = true
								
						  ), -- recherche auto de l'IDSITE

						  lot_surf,
							CASE WHEN length(cast (lot_surf as character varying)) >= 1 and length(cast (lot_surf as character varying)) <= 3 THEN lot_surf || 'm²'
								   WHEN length(cast (lot_surf as character varying)) = 4 THEN replace(to_char(lot_surf,'FM9G999'),',',' ') || 'm²'
								   WHEN length(cast (lot_surf as character varying)) = 5 THEN replace(to_char(lot_surf,'FM99G999'),',',' ') || 'm²'
								   WHEN length(cast (lot_surf as character varying)) = 6 THEN replace(to_char(lot_surf,'FM999G999'),',',' ') || 'm²'
								   WHEN length(cast (lot_surf as character varying)) = 7 THEN replace(to_char(lot_surf,'FM9G999G999'),',',' ') || 'm²'
								   WHEN length(cast (lot_surf as character varying)) = 8 THEN replace(to_char(lot_surf,'FM99G999G999'),',',' ') || 'm²'
							END,
						  null,
						  null,
						  null,
						  null,
						  null,
						  null,
						  null,
						  null,
						  null,
						  null,
						  now(),
						  now(),
						  null,
						  null,
						  null,
						  null,
						  null,
						  null,
						  null,
						  null,
						  null
						  ;
    end if;

   -- si ma vocation foncière passe de mixte à divers, suppression de la ligne dans la table métier mxite et insertion dans divers 
    if (old.l_voca='60') and (new.l_voca='40') then
	
	DELETE FROM m_amenagement.an_amt_lot_mixte WHERE idgeolf=old.idgeolf;
	INSERT INTO m_amenagement.an_amt_lot_divers SELECT new.idgeolf,
							(
							SELECT DISTINCT
								idsite 
							FROM 
								r_objet.geo_objet_ope
							WHERE
								st_intersects(geo_objet_ope.geom,new.geom) = true
								
							),-- recherche auto de l'IDSITE
							null,
							null,
							null,
							lot_surf,
							now(),
							null,
							null,
							CASE WHEN length(cast (lot_surf as character varying)) >= 1 and length(cast (lot_surf as character varying)) <= 3 THEN lot_surf || 'm²'
								   WHEN length(cast (lot_surf as character varying)) = 4 THEN replace(to_char(lot_surf,'FM9G999'),',',' ') || 'm²'
								   WHEN length(cast (lot_surf as character varying)) = 5 THEN replace(to_char(lot_surf,'FM99G999'),',',' ') || 'm²'
								   WHEN length(cast (lot_surf as character varying)) = 6 THEN replace(to_char(lot_surf,'FM999G999'),',',' ') || 'm²'
								   WHEN length(cast (lot_surf as character varying)) = 7 THEN replace(to_char(lot_surf,'FM9G999G999'),',',' ') || 'm²'
								   WHEN length(cast (lot_surf as character varying)) = 8 THEN replace(to_char(lot_surf,'FM99G999G999'),',',' ') || 'm²'
								   END
							;
    end if;

	
-- refraichissement de la vue matérialisée des points établissements à l'adresse
REFRESH MATERIALIZED VIEW x_apps.xapps_geo_vmr_etab_api;

    return new ;
END;

$BODY$;

ALTER FUNCTION r_objet.ft_m_foncier_update()
    OWNER TO create_sig;

GRANT EXECUTE ON FUNCTION r_objet.ft_m_foncier_update() TO PUBLIC;

GRANT EXECUTE ON FUNCTION r_objet.ft_m_foncier_update() TO create_sig;

COMMENT ON FUNCTION r_objet.ft_m_foncier_update()
    IS 'Fonction gérant la mise à jour des informations des lots en fonction de leur vocation à la modification de la vocation des objets';



-- ############################################################ [ft_m_foncier_l_nom] #######################################################################

-- FUNCTION: r_objet.ft_m_foncier_l_nom()

-- DROP FUNCTION r_objet.ft_m_foncier_l_nom();

CREATE OR REPLACE FUNCTION r_objet.ft_m_foncier_l_nom()
    RETURNS trigger
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE NOT LEAKPROOF
AS $BODY$BEGIN

IF new.l_nom = '' THEN
new.l_nom = null;
END IF;

RETURN NEW;
END;$BODY$;

ALTER FUNCTION r_objet.ft_m_foncier_l_nom()
    OWNER TO create_sig;

GRANT EXECUTE ON FUNCTION r_objet.ft_m_foncier_l_nom() TO create_sig;

GRANT EXECUTE ON FUNCTION r_objet.ft_m_foncier_l_nom() TO PUBLIC;

COMMENT ON FUNCTION r_objet.ft_m_foncier_l_nom()
    IS 'Fonction dont l''objet de forcer à null le champ l_nom après effacement par exemple pour éviter les doubles cotes';


-- ####################################################################################################################################################
-- ###                                                       FONCTION M_AMENAGEMENT                                                                 ###
-- ####################################################################################################################################################


-- ############################################################ [ft_m_delete_lot_equ] #######################################################################

-- FUNCTION: m_amenagement.ft_m_delete_lot_equ()

-- DROP FUNCTION m_amenagement.ft_m_delete_lot_equ();

CREATE OR REPLACE FUNCTION m_amenagement.ft_m_delete_lot_equ()
    RETURNS trigger
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE NOT LEAKPROOF
AS $BODY$


BEGIN

    DELETE FROM m_foncier.an_cession WHERE idces=(SELECT lf.idces FROM m_foncier.an_cession f, m_foncier.lk_cession_lot lf WHERE f.idces=lf.idces AND lf.idgeolf=old.idgeolf);
    DELETE FROM m_foncier.lk_cession_lot WHERE idgeolf=old.idgeolf;
    DELETE FROM m_amenagement.an_amt_lot_equ WHERE idgeolf=old.idgeolf;
    DELETE FROM m_amenagement.an_amt_lot_stade WHERE idgeolf=old.idgeolf;
    DELETE FROM r_objet.geo_objet_fon_lot WHERE idgeolf=old.idgeolf;
    DELETE FROM m_amenagement.lk_amt_lot_site WHERE idgeolf=old.idgeolf;
    return new ;

END;

$BODY$;

ALTER FUNCTION m_amenagement.ft_m_delete_lot_equ()
    OWNER TO create_sig;

GRANT EXECUTE ON FUNCTION m_amenagement.ft_m_delete_lot_equ() TO create_sig;

GRANT EXECUTE ON FUNCTION m_amenagement.ft_m_delete_lot_equ() TO PUBLIC;

COMMENT ON FUNCTION m_amenagement.ft_m_delete_lot_equ()
    IS 'Fonction gérant la suppression des données liées aux lots à vocation équipement lors de la suppression de l''objet';


-- ############################################################ [ft_m_insert_lot_equ] #######################################################################

-- FUNCTION: m_amenagement.ft_m_insert_lot_equ()

-- DROP FUNCTION m_amenagement.ft_m_insert_lot_equ();

CREATE OR REPLACE FUNCTION m_amenagement.ft_m_insert_lot_equ()
    RETURNS trigger
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE NOT LEAKPROOF
AS $BODY$

DECLARE v_idces integer;
DECLARE v_idgeolf integer;
DECLARE lot_surf integer;

BEGIN

     v_idgeolf := (SELECT nextval('r_objet.idgeo_seq'::regclass));

     INSERT INTO r_objet.geo_objet_fon_lot SELECT v_idgeolf,new.op_sai,new.ref_spa,null,'10',new.geom,null,null,new.l_nom_lot;

     INSERT INTO m_amenagement.an_amt_lot_stade SELECT v_idgeolf,
						  new.stade_amng,
						  new.l_amng2,
						  new.stade_comm,
						  new.l_comm2,
						  new.l_comm2_12,
						  new.etat_occup;

     lot_surf:=round(cast(st_area(new.geom) as numeric),0);

    -- insertion des lots uniquements mixte 
    -- recherche si le lot dessiner est dans un site : si oui copie une ligne dans le métier site et foncier, si non copie uniquement dans le métier foncier
    

						INSERT INTO m_amenagement.an_amt_lot_equ SELECT v_idgeolf,
							
							new.op_sai,
							new.org_sai,
							new.l_nom,
							lot_surf,
							now(),
							null,
							new.l_phase,
							CASE WHEN length(cast (lot_surf as character varying)) >= 1 and length(cast (lot_surf as character varying)) <= 3 THEN lot_surf || 'm²'
								   WHEN length(cast (lot_surf as character varying)) = 4 THEN replace(to_char(lot_surf,'FM9G999'),',',' ') || 'm²'
								   WHEN length(cast (lot_surf as character varying)) = 5 THEN replace(to_char(lot_surf,'FM99G999'),',',' ') || 'm²'
								   WHEN length(cast (lot_surf as character varying)) = 6 THEN replace(to_char(lot_surf,'FM999G999'),',',' ') || 'm²'
								   WHEN length(cast (lot_surf as character varying)) = 7 THEN replace(to_char(lot_surf,'FM9G999G999'),',',' ') || 'm²'
								   WHEN length(cast (lot_surf as character varying)) = 8 THEN replace(to_char(lot_surf,'FM99G999G999'),',',' ') || 'm²'
								   END,
						    new.epci,
							new.l_observ
						;
					  			 			
     
     

     -- ici contrôle si hors ARC ne passe pas
     IF (select insee from r_osm.geo_osm_commune where st_intersects(st_pointonsurface(new.geom),geom)) 
	 IN ('60023','60067','60068','60070','60151','60156','60159','60323','60325','60326','60337','60338','60382','60402','60447',
		'60447','60578','60579','60597','60600','60665','60667','60674') THEN 

     -- calcul de l'identifiant du dossier de cession
     v_idces := (SELECT nextval('m_foncier.ces_seq'::regclass));

     -- insertion de tous lots fonciers dans la table métier foncier
     INSERT INTO m_foncier.lk_cession_lot SELECT v_idgeolf, v_idces;	

     -- insertion d'une ligne dans an_cession en créant un idces qui est lui même réinjecté dans lk_cession_lot

     /* ATTENTION : LEUR DE LA MISE EN PRODUCTION REMETTRE DANS L'ORDRE LES CHAMPS SUIVANTS IDCES, L_COMPO, L_OBSERV ==> cd table an_cession pour vérification */
     
     INSERT INTO m_foncier.an_cession VALUES 	(
						v_idces, -- idces
						'10',
						false, -- relation
						'00',
						'00',
						null,
						null,
						null,
						(SELECT insee FROM r_osm.geo_osm_commune WHERE st_intersects(st_pointonsurface(new.geom),geom)),
						null,
						'00',
						new.l_lnom,
						null,
						null,
						null,
						null,
						null,
						null,
						null,
						'00',
						'00',
						null,
						null,
						'00',
						null,
						null,
						null,
						false,
						false,
						false,
						false,
						false,
						null,
						null,
						null,
						false,
						false,
						false,
						null,
						null,
						null,
						null,
						null,
						null,
							null
						);

		END IF;
		
		-- association d'un lot à un ou plusieurs sites
		INSERT INTO m_amenagement.lk_amt_lot_site (idsite,idgeolf)
		SELECT idsite, v_idgeolf FROM m_activite_eco.geo_eco_site WHERE st_intersects(st_pointonsurface(new.geom),geom) IS TRUE;
		

     return new ;

END;

$BODY$;

ALTER FUNCTION m_amenagement.ft_m_insert_lot_equ()
    OWNER TO create_sig;

GRANT EXECUTE ON FUNCTION m_amenagement.ft_m_insert_lot_equ() TO PUBLIC;

GRANT EXECUTE ON FUNCTION m_amenagement.ft_m_insert_lot_equ() TO create_sig;

COMMENT ON FUNCTION m_amenagement.ft_m_insert_lot_equ()
    IS 'Fonction gérant l''insertion des données liées aux lots à vocation équipement lors de l''insertion de l''objet';



-- ############################################################ [ft_m_modif_lot_equ] #######################################################################

-- FUNCTION: m_amenagement.ft_m_modif_lot_equ()

-- DROP FUNCTION m_amenagement.ft_m_modif_lot_equ();

CREATE OR REPLACE FUNCTION m_amenagement.ft_m_modif_lot_equ()
    RETURNS trigger
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE NOT LEAKPROOF
AS $BODY$

DECLARE DECLARE lot_surf integer;

BEGIN

--calcul de la surface de l'objet
lot_surf:=round(cast(st_area(new.geom) as numeric),0);

		UPDATE r_objet.geo_objet_fon_lot SET geom = new.geom, date_maj = now(), src_geom = new.ref_spa, op_sai=new.op_sai,l_nom = new.l_nom_lot WHERE idgeolf = new.idgeolf;

	        UPDATE m_amenagement.an_amt_lot_stade SET stade_amng = new.stade_amng, l_amng2 = new.l_amng2, stade_comm = new.stade_comm, l_comm2 = new.l_comm2, l_comm2_12 = new.l_comm2_12, etat_occup =  new.etat_occup WHERE idgeolf = new.idgeolf;

		UPDATE m_amenagement.an_amt_lot_equ SET

							surf = new.surf,
							l_surf_l = 
								   CASE WHEN length(cast (new.surf as character varying)) >= 1 and length(cast (new.surf as character varying)) <= 3 THEN new.surf || 'm²'
								   WHEN length(cast (new.surf as character varying)) = 4 THEN replace(to_char(new.surf,'FM9G999'),',',' ') || 'm²'
								   WHEN length(cast (new.surf as character varying)) = 5 THEN replace(to_char(new.surf,'FM99G999'),',',' ') || 'm²'
								   WHEN length(cast (new.surf as character varying)) = 6 THEN replace(to_char(new.surf,'FM999G999'),',',' ') || 'm²'
								   WHEN length(cast (new.surf as character varying)) = 7 THEN replace(to_char(new.surf,'FM9G999G999'),',',' ') || 'm²'
								   WHEN length(cast (new.surf as character varying)) = 8 THEN replace(to_char(new.surf,'FM99G999G999'),',',' ') || 'm²'
								   END,
							op_sai = new.op_sai,
							org_sai = new.org_sai,
							l_nom = new.l_nom,
							date_maj = now(),
							l_phase = new.l_phase,
							epci = new.epci,
							l_observ = new.l_observ
		WHERE an_amt_lot_equ.idgeolf=new.idgeolf;

     return new;
END
$BODY$;

ALTER FUNCTION m_amenagement.ft_m_modif_lot_equ()
    OWNER TO create_sig;

GRANT EXECUTE ON FUNCTION m_amenagement.ft_m_modif_lot_equ() TO PUBLIC;

GRANT EXECUTE ON FUNCTION m_amenagement.ft_m_modif_lot_equ() TO create_sig;

COMMENT ON FUNCTION m_amenagement.ft_m_modif_lot_equ()
    IS 'Fonction gérant la mise à jour des données liées aux lots à vocation équipement lors de la mise à jour de l''objet';


-- ############################################################ [ft_m_delete_lot_hab] #######################################################################

-- FUNCTION: m_amenagement.ft_m_delete_lot_hab()

-- DROP FUNCTION m_amenagement.ft_m_delete_lot_hab();

CREATE OR REPLACE FUNCTION m_amenagement.ft_m_delete_lot_hab()
    RETURNS trigger
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE NOT LEAKPROOF
AS $BODY$


BEGIN

    DELETE FROM m_foncier.an_cession WHERE idces=(SELECT lf.idces FROM m_foncier.an_cession f, m_foncier.lk_cession_lot lf WHERE f.idces=lf.idces AND lf.idgeolf=old.idgeolf);
    DELETE FROM m_foncier.lk_cession_lot WHERE idgeolf=old.idgeolf;
    DELETE FROM m_amenagement.an_amt_lot_hab WHERE idgeolf=old.idgeolf;
    DELETE FROM m_amenagement.an_amt_lot_stade WHERE idgeolf=old.idgeolf;
    DELETE FROM r_objet.geo_objet_fon_lot WHERE idgeolf=old.idgeolf;
    DELETE FROM m_amenagement.lk_amt_lot_site WHERE idgeolf=old.idgeolf;
    return new ;

END;

$BODY$;

ALTER FUNCTION m_amenagement.ft_m_delete_lot_hab()
    OWNER TO create_sig;

GRANT EXECUTE ON FUNCTION m_amenagement.ft_m_delete_lot_hab() TO create_sig;

GRANT EXECUTE ON FUNCTION m_amenagement.ft_m_delete_lot_hab() TO PUBLIC;

COMMENT ON FUNCTION m_amenagement.ft_m_delete_lot_hab()
    IS 'Fonction gérant la suppression des données liées aux lots à vocation habitat lors de la suppression de l''objet';

-- ############################################################ [ft_m_insert_lot_hab] #######################################################################

-- FUNCTION: m_amenagement.ft_m_insert_lot_hab()

-- DROP FUNCTION m_amenagement.ft_m_insert_lot_hab();

CREATE OR REPLACE FUNCTION m_amenagement.ft_m_insert_lot_hab()
    RETURNS trigger
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE NOT LEAKPROOF
AS $BODY$

DECLARE v_idces integer;
DECLARE v_idgeolf integer;
DECLARE lot_surf integer;

BEGIN

     v_idgeolf := (SELECT nextval('r_objet.idgeo_seq'::regclass));

     INSERT INTO r_objet.geo_objet_fon_lot SELECT v_idgeolf,new.op_sai,new.ref_spa,null,'30',new.geom,null,null,new.l_nom;

     INSERT INTO m_amenagement.an_amt_lot_stade SELECT v_idgeolf,
						  new.stade_amng,
						  new.l_amng2,
						  new.stade_comm,
						  new.l_comm2,
						  new.l_comm2_12,
						  new.etat_occup;
     
     lot_surf:=round(cast(st_area(new.geom) as numeric),0);

    -- insertion des lots uniquements économiques (pour la vente) dans la table métier économie
    -- recherche si le lot dessiner est dans un site activité : si oui copie une ligne dans le métier eco et foncier, si non copie uniquement dans le métier foncier
    

						INSERT INTO m_amenagement.an_amt_lot_hab SELECT v_idgeolf,
					      
						  lot_surf,
						
								   CASE WHEN length(cast (lot_surf as character varying)) >= 1 and length(cast (lot_surf as character varying)) <= 3 THEN lot_surf || 'm²'
								   WHEN length(cast (lot_surf as character varying)) = 4 THEN replace(to_char(lot_surf,'FM9G999'),',',' ') || 'm²'
								   WHEN length(cast (lot_surf as character varying)) = 5 THEN replace(to_char(lot_surf,'FM99G999'),',',' ') || 'm²'
								   WHEN length(cast (lot_surf as character varying)) = 6 THEN replace(to_char(lot_surf,'FM999G999'),',',' ') || 'm²'
								   WHEN length(cast (lot_surf as character varying)) = 7 THEN replace(to_char(lot_surf,'FM9G999G999'),',',' ') || 'm²'
								   WHEN length(cast (lot_surf as character varying)) = 8 THEN replace(to_char(lot_surf,'FM99G999G999'),',',' ') || 'm²'
								   END,
						  new.op_sai_att,
						  new.org_sai_att,
						  new.l_pvente,
						  new.l_pvente_l,
						  new.nb_log,
						  new.nb_logind,
						  new.nb_logindgr,
						  new.nb_logcol,
						  new.nb_logaide,
						  new.l_observ,
						  now(),
						  now(),
						  new.l_phase,
						  new.nb_log_r,
						  new.nb_logind_r,
						  new.nb_logindgr_r,
						  new.nb_logcol_r,
						  new.nb_logaide_r,
						  new.l_pvente_lot,
						  new.nb_logaide_loc_r,
						  new.nb_logaide_acc_r,
						  new.epci
						  ;
						  
	 -- ici contrôle si hors ARC ne passe pas
     IF (select insee from r_osm.geo_osm_commune where st_intersects(st_pointonsurface(new.geom),geom)) 
	 IN ('60023','60067','60068','60070','60151','60156','60159','60323','60325','60326','60337','60338','60382','60402','60447',
		'60447','60578','60579','60597','60600','60665','60667','60674') THEN 

     -- calcul de l'identifiant du dossier de cession
     v_idces := (SELECT nextval('m_foncier.ces_seq'::regclass));

     -- insertion de tous lots fonciers dans la table métier foncier
     INSERT INTO m_foncier.lk_cession_lot SELECT v_idgeolf, v_idces;	

     -- insertion d'une ligne dans an_cession en créant un idces qui est lui même réinjecté dans lk_cession_lot

     /* ATTENTION : LEUR DE LA MISE EN PRODUCTION REMETTRE DANS L'ORDRE LES CHAMPS SUIVANTS IDCES, L_COMPO, L_OBSERV ==> cd table an_cession pour vérification */
     
     INSERT INTO m_foncier.an_cession VALUES 	(
						v_idces, -- idces
						'10',
						false, -- relation
						'00',
						'00',
						null,
						null,
						null,
						(SELECT insee FROM r_osm.geo_osm_commune WHERE st_intersects(st_pointonsurface(new.geom),geom)),
						null,
						'00',
						new.l_lnom,
						null,
						null,
						null,
						null,
						null,
						null,
						null,
						'00',
						'00',
						null,
						null,
						'00',
						null,
						null,
						null,
						false,
						false,
						false,
						false,
						false,
						null,
						null,
						null,
						false,
						false,
						false,
						null,
						null,
						null,
						null,
						null,
						null,
							null
						);

		END IF;
		
		-- association d'un lot à un ou plusieurs sites
		INSERT INTO m_amenagement.lk_amt_lot_site (idsite,idgeolf)
		SELECT idsite, v_idgeolf FROM m_activite_eco.geo_eco_site WHERE st_intersects(st_pointonsurface(new.geom),geom) IS TRUE;
		

     return new ;

END;

$BODY$;

ALTER FUNCTION m_amenagement.ft_m_insert_lot_hab()
    OWNER TO create_sig;

GRANT EXECUTE ON FUNCTION m_amenagement.ft_m_insert_lot_hab() TO PUBLIC;

GRANT EXECUTE ON FUNCTION m_amenagement.ft_m_insert_lot_hab() TO create_sig;

COMMENT ON FUNCTION m_amenagement.ft_m_insert_lot_hab()
    IS 'Fonction gérant l''insertion des données liées aux lots à vocation habitat lors de la création de l''objet';


-- ############################################################ [ft_m_modif_lot_hab] #######################################################################

-- FUNCTION: m_amenagement.ft_m_modif_lot_hab()

-- DROP FUNCTION m_amenagement.ft_m_modif_lot_hab();

CREATE OR REPLACE FUNCTION m_amenagement.ft_m_modif_lot_hab()
    RETURNS trigger
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE NOT LEAKPROOF
AS $BODY$

DECLARE DECLARE lot_surf integer;

BEGIN

--calcul de la surface de l'objet
lot_surf:=round(cast(st_area(new.geom) as numeric),0);

		UPDATE r_objet.geo_objet_fon_lot SET geom = new.geom, date_maj = now(), src_geom = new.ref_spa, op_sai=new.op_sai,l_nom=new.l_nom WHERE idgeolf = new.idgeolf;

		UPDATE m_amenagement.an_amt_lot_stade SET stade_amng = new.stade_amng, l_amng2 = new.l_amng2, stade_comm = new.stade_comm, l_comm2 = new.l_comm2, l_comm2_12 = new.l_comm2_12, etat_occup =  new.etat_occup WHERE idgeolf = new.idgeolf;

		UPDATE m_amenagement.an_amt_lot_hab SET

							surf = new.surf,
							l_surf_l = 
								   CASE WHEN length(cast (new.surf as character varying)) >= 1 and length(cast (new.surf as character varying)) <= 3 THEN new.surf || 'm²'
								   WHEN length(cast (new.surf as character varying)) = 4 THEN replace(to_char(new.surf,'FM9G999'),',',' ') || 'm²'
								   WHEN length(cast (new.surf as character varying)) = 5 THEN replace(to_char(new.surf,'FM99G999'),',',' ') || 'm²'
								   WHEN length(cast (new.surf as character varying)) = 6 THEN replace(to_char(new.surf,'FM999G999'),',',' ') || 'm²'
								   WHEN length(cast (new.surf as character varying)) = 7 THEN replace(to_char(new.surf,'FM9G999G999'),',',' ') || 'm²'
								   WHEN length(cast (new.surf as character varying)) = 8 THEN replace(to_char(new.surf,'FM99G999G999'),',',' ') || 'm²'
								   END,
							date_maj = now(),
							op_sai = new.op_sai_att,
							org_sai = new.org_sai_att,
							l_pvente = new.l_pvente,
							l_pvente_l = new.l_pvente || '€/m²',
							l_pvente_lot = new.l_pvente_lot,
							nb_log=new.nb_log,
							nb_logind=new.nb_logind,
							nb_logindgr=new.nb_logindgr,
							nb_logcol=new.nb_logcol,
							nb_logaide=new.nb_logaide,
							nb_log_r=new.nb_log_r,
							nb_logind_r=new.nb_logind_r,
							nb_logindgr_r=new.nb_logindgr_r,
							nb_logcol_r=new.nb_logcol_r,
							nb_logaide_r=new.nb_logaide_r,
							l_observ = new.l_observ,
							l_phase = new.l_phase,
							nb_logaide_loc_r = new.nb_logaide_loc_r,
							nb_logaide_acc_r = new.nb_logaide_acc_r,
							epci = new.epci
		WHERE an_amt_lot_hab.idgeolf=new.idgeolf;

     return new;
END
$BODY$;

ALTER FUNCTION m_amenagement.ft_m_modif_lot_hab()
    OWNER TO create_sig;

GRANT EXECUTE ON FUNCTION m_amenagement.ft_m_modif_lot_hab() TO PUBLIC;

GRANT EXECUTE ON FUNCTION m_amenagement.ft_m_modif_lot_hab() TO create_sig;

COMMENT ON FUNCTION m_amenagement.ft_m_modif_lot_hab()
    IS 'Fonction gérant la mise à jour des données liées aux lots à vocation habitat lors de la modification de l''objet';


-- ############################################################ [ft_m_delete_lot_mixte] #######################################################################

-- FUNCTION: m_amenagement.ft_m_delete_lot_mixte()

-- DROP FUNCTION m_amenagement.ft_m_delete_lot_mixte();

CREATE OR REPLACE FUNCTION m_amenagement.ft_m_delete_lot_mixte()
    RETURNS trigger
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE NOT LEAKPROOF
AS $BODY$

BEGIN

    DELETE FROM m_foncier.an_cession WHERE idces=(SELECT lf.idces FROM m_foncier.an_cession f, m_foncier.lk_cession_lot lf WHERE f.idces=lf.idces AND lf.idgeolf=old.idgeolf);
    DELETE FROM m_foncier.lk_cession_lot WHERE idgeolf=old.idgeolf;
    DELETE FROM m_amenagement.an_amt_lot_mixte WHERE idgeolf=old.idgeolf;
    DELETE FROM m_amenagement.an_amt_lot_stade WHERE idgeolf=old.idgeolf;
    DELETE FROM r_objet.geo_objet_fon_lot WHERE idgeolf=old.idgeolf;
	DELETE FROM m_amenagement.lk_amt_lot_site WHERE idgeolf=old.idgeolf;
    return new ;

END;

$BODY$;

ALTER FUNCTION m_amenagement.ft_m_delete_lot_mixte()
    OWNER TO create_sig;

GRANT EXECUTE ON FUNCTION m_amenagement.ft_m_delete_lot_mixte() TO PUBLIC;

GRANT EXECUTE ON FUNCTION m_amenagement.ft_m_delete_lot_mixte() TO create_sig;

COMMENT ON FUNCTION m_amenagement.ft_m_delete_lot_mixte()
    IS 'Fonction gérant la suppression des données liées aux lots à vocation mixte lors de la supression de l''objet';


-- ############################################################ [ft_m_insert_lot_mixte] #######################################################################

-- FUNCTION: m_amenagement.ft_m_insert_lot_mixte()

-- DROP FUNCTION m_amenagement.ft_m_insert_lot_mixte();

CREATE OR REPLACE FUNCTION m_amenagement.ft_m_insert_lot_mixte()
    RETURNS trigger
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE NOT LEAKPROOF
AS $BODY$

DECLARE v_idces integer;
DECLARE v_idgeolf integer;
DECLARE lot_surf integer;

BEGIN

     v_idgeolf := (SELECT nextval('r_objet.idgeo_seq'::regclass));

     INSERT INTO r_objet.geo_objet_fon_lot SELECT v_idgeolf,new.op_sai,new.ref_spa,null,'60',new.geom,null,null,new.l_nom;

     INSERT INTO m_amenagement.an_amt_lot_stade SELECT v_idgeolf,
						  new.stade_amng,
						  new.l_amng2,
						  new.stade_comm,
						  new.l_comm2,
						  new.l_comm2_12,
						  new.etat_occup;

     lot_surf:=round(cast(st_area(new.geom) as numeric),0);

    -- insertion des lots uniquements mixte 
    -- recherche si le lot dessiner est dans un site : si oui copie une ligne dans le métier site et foncier, si non copie uniquement dans le métier foncier
    

						INSERT INTO m_amenagement.an_amt_lot_mixte SELECT v_idgeolf,
						 
						 CASE WHEN new.surf IS NOT NULL THEN new.surf ELSE lot_surf END,
						  CASE WHEN new.surf IS NOT NULL THEN
						  
								   CASE WHEN length(cast (new.surf as character varying)) >= 1 and length(cast (new.surf as character varying)) <= 3 THEN new.surf || 'm²'
								   WHEN length(cast (new.surf as character varying)) = 4 THEN replace(to_char(new.surf,'FM9G999'),',',' ') || 'm²'
								   WHEN length(cast (new.surf as character varying)) = 5 THEN replace(to_char(new.surf,'FM99G999'),',',' ') || 'm²'
								   WHEN length(cast (new.surf as character varying)) = 6 THEN replace(to_char(new.surf,'FM999G999'),',',' ') || 'm²'
								   WHEN length(cast (new.surf as character varying)) = 7 THEN replace(to_char(new.surf,'FM9G999G999'),',',' ') || 'm²'
								   WHEN length(cast (new.surf as character varying)) = 8 THEN replace(to_char(new.surf,'FM99G999G999'),',',' ') || 'm²'
								   END
						  ELSE	
						  			CASE WHEN length(cast (lot_surf as character varying)) >= 1 and length(cast (lot_surf as character varying)) <= 3 THEN lot_surf || 'm²'
								   WHEN length(cast (lot_surf as character varying)) = 4 THEN replace(to_char(lot_surf,'FM9G999'),',',' ') || 'm²'
								   WHEN length(cast (lot_surf as character varying)) = 5 THEN replace(to_char(lot_surf,'FM99G999'),',',' ') || 'm²'
								   WHEN length(cast (lot_surf as character varying)) = 6 THEN replace(to_char(lot_surf,'FM999G999'),',',' ') || 'm²'
								   WHEN length(cast (lot_surf as character varying)) = 7 THEN replace(to_char(lot_surf,'FM9G999G999'),',',' ') || 'm²'
								   WHEN length(cast (lot_surf as character varying)) = 8 THEN replace(to_char(lot_surf,'FM99G999G999'),',',' ') || 'm²'
								   END
						  END,
						  new.op_sai_att,
						  new.org_sai_att,
						  new.l_pvente,
						  new.l_pvente_l,
						  new.nb_log,
						  new.nb_logind,
						  new.nb_logindgr,
						  new.nb_logcol,
						  new.nb_logaide,
						  new.l_observ,
						  now(),
						  now(),
						  new.l_phase,
						  new.nb_log_r,
						  new.nb_logind_r,
						  new.nb_logindgr_r,
						  new.nb_logcol_r,
						  new.nb_logaide_r,
						  new.l_pvente_lot,
						  new.l_tact,
						  new.l_tact_99,
						  new.l_nom_equ,
                          new.nb_logaide_loc_r,
                          new.nb_logaide_acc_r,
                          new.l_lnom,
						  new.commune,
						  new.epci
						  ;
						  
					  			 			
     
     

      -- ici contrôle si hors ARC ne passe pas
     IF (select insee from r_osm.geo_osm_commune where st_intersects(st_pointonsurface(new.geom),geom)) 
	 IN ('60023','60067','60068','60070','60151','60156','60159','60323','60325','60326','60337','60338','60382','60402','60447',
		'60447','60578','60579','60597','60600','60665','60667','60674') THEN 

     -- calcul de l'identifiant du dossier de cession
     v_idces := (SELECT nextval('m_foncier.ces_seq'::regclass));

     -- insertion de tous lots fonciers dans la table métier foncier
     INSERT INTO m_foncier.lk_cession_lot SELECT v_idgeolf, v_idces;	

     -- insertion d'une ligne dans an_cession en créant un idces qui est lui même réinjecté dans lk_cession_lot

     /* ATTENTION : LEUR DE LA MISE EN PRODUCTION REMETTRE DANS L'ORDRE LES CHAMPS SUIVANTS IDCES, L_COMPO, L_OBSERV ==> cd table an_cession pour vérification */
     
     INSERT INTO m_foncier.an_cession VALUES 	(
						v_idces, -- idces
						'10',
						false, -- relation
						'00',
						'00',
						null,
						null,
						null,
						(SELECT insee FROM r_osm.geo_osm_commune WHERE st_intersects(st_pointonsurface(new.geom),geom)),
						null,
						'00',
						new.l_lnom,
						null,
						null,
						null,
						null,
						null,
						null,
						null,
						'00',
						'00',
						null,
						null,
						'00',
						null,
						null,
						null,
						false,
						false,
						false,
						false,
						false,
						null,
						null,
						null,
						false,
						false,
						false,
						null,
						null,
						null,
						null,
						null,
						null,
							null
						);

		END IF;
		
		-- association d'un lot à un ou plusieurs sites
		INSERT INTO m_amenagement.lk_amt_lot_site (idsite,idgeolf)
		SELECT idsite, v_idgeolf FROM m_activite_eco.geo_eco_site WHERE st_intersects(st_pointonsurface(new.geom),geom) IS TRUE;
		

     return new ;

END;

$BODY$;

ALTER FUNCTION m_amenagement.ft_m_insert_lot_mixte()
    OWNER TO create_sig;

GRANT EXECUTE ON FUNCTION m_amenagement.ft_m_insert_lot_mixte() TO PUBLIC;

GRANT EXECUTE ON FUNCTION m_amenagement.ft_m_insert_lot_mixte() TO create_sig;

COMMENT ON FUNCTION m_amenagement.ft_m_insert_lot_mixte()
    IS 'Fonction gérant l''insertion des données liées aux lots à vocation mixte lors de l''insertion de l''objet';


-- ############################################################ [ft_m_modif_lot_mixte] #######################################################################

-- FUNCTION: m_amenagement.ft_m_modif_lot_mixte()

-- DROP FUNCTION m_amenagement.ft_m_modif_lot_mixte();

CREATE OR REPLACE FUNCTION m_amenagement.ft_m_modif_lot_mixte()
    RETURNS trigger
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE NOT LEAKPROOF
AS $BODY$

DECLARE DECLARE lot_surf integer;

BEGIN

--calcul de la surface de l'objet
lot_surf:=round(cast(st_area(new.geom) as numeric),0);

		UPDATE r_objet.geo_objet_fon_lot SET geom = new.geom, date_maj = now(), src_geom = new.ref_spa, op_sai=new.op_sai,l_nom=new.l_nom WHERE idgeolf = new.idgeolf;

	        UPDATE m_amenagement.an_amt_lot_stade SET stade_amng = new.stade_amng, l_amng2 = new.l_amng2, stade_comm = new.stade_comm, l_comm2 = new.l_comm2, l_comm2_12 = new.l_comm2_12, etat_occup =  new.etat_occup WHERE idgeolf = new.idgeolf;

		UPDATE m_amenagement.an_amt_lot_mixte SET

							surf = new.surf,
							l_surf_l = 
								   CASE WHEN length(cast (new.surf as character varying)) >= 1 and length(cast (new.surf as character varying)) <= 3 THEN new.surf || 'm²'
								   WHEN length(cast (new.surf as character varying)) = 4 THEN replace(to_char(new.surf,'FM9G999'),',',' ') || 'm²'
								   WHEN length(cast (new.surf as character varying)) = 5 THEN replace(to_char(new.surf,'FM99G999'),',',' ') || 'm²'
								   WHEN length(cast (new.surf as character varying)) = 6 THEN replace(to_char(new.surf,'FM999G999'),',',' ') || 'm²'
								   WHEN length(cast (new.surf as character varying)) = 7 THEN replace(to_char(new.surf,'FM9G999G999'),',',' ') || 'm²'
								   WHEN length(cast (new.surf as character varying)) = 8 THEN replace(to_char(new.surf,'FM99G999G999'),',',' ') || 'm²'
								   END,
							date_maj = now(),
							op_sai = new.op_sai_att,
							org_sai = new.org_sai_att,
							l_pvente = new.l_pvente,
							l_pvente_l = new.l_pvente || '€/m²',
							l_pvente_lot = new.l_pvente_lot,
							nb_log=new.nb_log,
							nb_logind=new.nb_logind,
							nb_logindgr=new.nb_logindgr,
							nb_logcol=new.nb_logcol,
							nb_logaide=new.nb_logaide,
							nb_log_r=new.nb_log_r,
							nb_logind_r=new.nb_logind_r,
							nb_logindgr_r=new.nb_logindgr_r,
							nb_logcol_r=new.nb_logcol_r,
							nb_logaide_r=new.nb_logaide_r,
							l_observ = new.l_observ,
							l_phase = new.l_phase,
							l_tact = new.l_tact,
							l_tact_99 = new.l_tact_99,
							l_nom_equ = new.l_nom_equ,
							nb_logaide_loc_r = new.nb_logaide_loc_r,
							nb_logaide_acc_r = new.nb_logaide_acc_r,
							l_lnom = new.l_lnom,
							commune = new.commune,
							epci = new.epci
		WHERE an_amt_lot_mixte.idgeolf=new.idgeolf;

     return new;
END
$BODY$;

ALTER FUNCTION m_amenagement.ft_m_modif_lot_mixte()
    OWNER TO create_sig;

GRANT EXECUTE ON FUNCTION m_amenagement.ft_m_modif_lot_mixte() TO PUBLIC;

GRANT EXECUTE ON FUNCTION m_amenagement.ft_m_modif_lot_mixte() TO create_sig;

COMMENT ON FUNCTION m_amenagement.ft_m_modif_lot_mixte()
    IS 'Fonction gérant la mise à jour des données liées aux lots à vocation mixte lors de la mise à jour de l''objet';


-- ############################################################ [ft_m_delete_lot_divers] ######################################################################

-- FUNCTION: m_amenagement.ft_m_delete_lot_divers()

-- DROP FUNCTION m_amenagement.ft_m_delete_lot_divers();

CREATE OR REPLACE FUNCTION m_amenagement.ft_m_delete_lot_divers()
    RETURNS trigger
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE NOT LEAKPROOF
AS $BODY$


BEGIN

    DELETE FROM m_foncier.an_cession WHERE idces=(SELECT lf.idces FROM m_foncier.an_cession f, m_foncier.lk_cession_lot lf WHERE f.idces=lf.idces AND lf.idgeolf=old.idgeolf);
    DELETE FROM m_foncier.lk_cession_lot WHERE idgeolf=old.idgeolf;
    DELETE FROM m_amenagement.an_amt_lot_divers WHERE idgeolf=old.idgeolf;
    DELETE FROM m_amenagement.an_amt_lot_stade WHERE idgeolf=old.idgeolf;
    DELETE FROM r_objet.geo_objet_fon_lot WHERE idgeolf=old.idgeolf;+
    DELETE FROM m_amenagement.lk_amt_lot_site WHERE idgeolf=old.idgeolf;
    return new ;

END;

$BODY$;

ALTER FUNCTION m_amenagement.ft_m_delete_lot_divers()
    OWNER TO create_sig;

GRANT EXECUTE ON FUNCTION m_amenagement.ft_m_delete_lot_divers() TO PUBLIC;

GRANT EXECUTE ON FUNCTION m_amenagement.ft_m_delete_lot_divers() TO create_sig;

COMMENT ON FUNCTION m_amenagement.ft_m_delete_lot_divers()
    IS 'Fonction gérant la suppression des données liées aux lots à vocation divers lors de la suppression de l''objet';


-- ############################################################ [ft_m_insert_lot_divers] ######################################################################

-- FUNCTION: m_amenagement.ft_m_insert_lot_divers()

-- DROP FUNCTION m_amenagement.ft_m_insert_lot_divers();

CREATE OR REPLACE FUNCTION m_amenagement.ft_m_insert_lot_divers()
    RETURNS trigger
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE NOT LEAKPROOF
AS $BODY$

DECLARE v_idces integer;
DECLARE v_idgeolf integer;
DECLARE lot_surf integer;

BEGIN

     v_idgeolf := (SELECT nextval('r_objet.idgeo_seq'::regclass));

     INSERT INTO r_objet.geo_objet_fon_lot SELECT v_idgeolf,new.op_sai,new.ref_spa,null,'40',new.geom,null,null,new.l_nom_lot;

     INSERT INTO m_amenagement.an_amt_lot_stade SELECT v_idgeolf,
						  new.stade_amng,
						  new.l_amng2,
						  new.stade_comm,
						  new.l_comm2,
						  new.l_comm2_12,
						  new.etat_occup;

     lot_surf:=round(cast(st_area(new.geom) as numeric),0);

    -- insertion des lots uniquements mixte 
    -- recherche si le lot dessiner est dans un site : si oui copie une ligne dans le métier site et foncier, si non copie uniquement dans le métier foncier
    

						INSERT INTO m_amenagement.an_amt_lot_divers SELECT v_idgeolf,
							new.op_sai,
							new.org_sai,
							new.l_nom,
							lot_surf,
							now(),
							null,
							new.l_phase,
							CASE WHEN length(cast (lot_surf as character varying)) >= 1 and length(cast (lot_surf as character varying)) <= 3 THEN lot_surf || 'm²'
								   WHEN length(cast (lot_surf as character varying)) = 4 THEN replace(to_char(lot_surf,'FM9G999'),',',' ') || 'm²'
								   WHEN length(cast (lot_surf as character varying)) = 5 THEN replace(to_char(lot_surf,'FM99G999'),',',' ') || 'm²'
								   WHEN length(cast (lot_surf as character varying)) = 6 THEN replace(to_char(lot_surf,'FM999G999'),',',' ') || 'm²'
								   WHEN length(cast (lot_surf as character varying)) = 7 THEN replace(to_char(lot_surf,'FM9G999G999'),',',' ') || 'm²'
								   WHEN length(cast (lot_surf as character varying)) = 8 THEN replace(to_char(lot_surf,'FM99G999G999'),',',' ') || 'm²'
								   END,
						    new.epci,
						    new.l_observ
							;
					  			 			
     
     

      -- ici contrôle si hors ARC ne passe pas
     IF (select insee from r_osm.geo_osm_commune where st_intersects(st_pointonsurface(new.geom),geom)) 
	 IN ('60023','60067','60068','60070','60151','60156','60159','60323','60325','60326','60337','60338','60382','60402','60447',
		'60447','60578','60579','60597','60600','60665','60667','60674') THEN 

     -- calcul de l'identifiant du dossier de cession
     v_idces := (SELECT nextval('m_foncier.ces_seq'::regclass));

     -- insertion de tous lots fonciers dans la table métier foncier
     INSERT INTO m_foncier.lk_cession_lot SELECT v_idgeolf, v_idces;	

     -- insertion d'une ligne dans an_cession en créant un idces qui est lui même réinjecté dans lk_cession_lot

     /* ATTENTION : LEUR DE LA MISE EN PRODUCTION REMETTRE DANS L'ORDRE LES CHAMPS SUIVANTS IDCES, L_COMPO, L_OBSERV ==> cd table an_cession pour vérification */
     
     INSERT INTO m_foncier.an_cession VALUES 	(
						v_idces, -- idces
						'10',
						false, -- relation
						'00',
						'00',
						null,
						null,
						null,
						(SELECT insee FROM r_osm.geo_osm_commune WHERE st_intersects(st_pointonsurface(new.geom),geom)),
						null,
						'00',
						new.l_lnom,
						null,
						null,
						null,
						null,
						null,
						null,
						null,
						'00',
						'00',
						null,
						null,
						'00',
						null,
						null,
						null,
						false,
						false,
						false,
						false,
						false,
						null,
						null,
						null,
						false,
						false,
						false,
						null,
						null,
						null,
						null,
						null,
						null,
							null
						);

		END IF;
		
		-- association d'un lot à un ou plusieurs sites
		INSERT INTO m_amenagement.lk_amt_lot_site (idsite,idgeolf)
		SELECT idsite, v_idgeolf FROM m_activite_eco.geo_eco_site WHERE st_intersects(st_pointonsurface(new.geom),geom) IS TRUE;
		

     return new ;

END;

$BODY$;

ALTER FUNCTION m_amenagement.ft_m_insert_lot_divers()
    OWNER TO create_sig;

GRANT EXECUTE ON FUNCTION m_amenagement.ft_m_insert_lot_divers() TO PUBLIC;

GRANT EXECUTE ON FUNCTION m_amenagement.ft_m_insert_lot_divers() TO create_sig;

COMMENT ON FUNCTION m_amenagement.ft_m_insert_lot_divers()
    IS 'Fonction gérant l''insertion des données liées aux lots à vocation divers lors de l''insertion de l''objet';


-- ############################################################ [ft_m_modif_lot_divers] ######################################################################

-- FUNCTION: m_amenagement.ft_m_modif_lot_divers()

-- DROP FUNCTION m_amenagement.ft_m_modif_lot_divers();

CREATE OR REPLACE FUNCTION m_amenagement.ft_m_modif_lot_divers()
    RETURNS trigger
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE NOT LEAKPROOF
AS $BODY$

DECLARE DECLARE lot_surf integer;

BEGIN

--calcul de la surface de l'objet
lot_surf:=round(cast(st_area(new.geom) as numeric),0);

		UPDATE r_objet.geo_objet_fon_lot SET geom = new.geom, date_maj = now(), src_geom = new.ref_spa, op_sai=new.op_sai,l_nom = new.l_nom_lot WHERE idgeolf = new.idgeolf;

	        UPDATE m_amenagement.an_amt_lot_stade SET stade_amng = new.stade_amng, l_amng2 = new.l_amng2, stade_comm = new.stade_comm, l_comm2 = new.l_comm2, l_comm2_12 = new.l_comm2_12, etat_occup =  new.etat_occup WHERE idgeolf = new.idgeolf;

		UPDATE m_amenagement.an_amt_lot_divers SET

							surf = new.surf,
							l_surf_l = 
								   CASE WHEN length(cast (new.surf as character varying)) >= 1 and length(cast (new.surf as character varying)) <= 3 THEN new.surf || 'm²'
								   WHEN length(cast (new.surf as character varying)) = 4 THEN replace(to_char(new.surf,'FM9G999'),',',' ') || 'm²'
								   WHEN length(cast (new.surf as character varying)) = 5 THEN replace(to_char(new.surf,'FM99G999'),',',' ') || 'm²'
								   WHEN length(cast (new.surf as character varying)) = 6 THEN replace(to_char(new.surf,'FM999G999'),',',' ') || 'm²'
								   WHEN length(cast (new.surf as character varying)) = 7 THEN replace(to_char(new.surf,'FM9G999G999'),',',' ') || 'm²'
								   WHEN length(cast (new.surf as character varying)) = 8 THEN replace(to_char(new.surf,'FM99G999G999'),',',' ') || 'm²'
								   END,
							op_sai = new.op_sai,
							org_sai = new.org_sai,
							l_nom = new.l_nom,
							date_maj = now(),
							l_phase = new.l_phase,
							epci = new.epci,
							l_observ = new.l_observ
		WHERE an_amt_lot_divers.idgeolf=new.idgeolf;

     return new;
END
$BODY$;

ALTER FUNCTION m_amenagement.ft_m_modif_lot_divers()
    OWNER TO create_sig;

GRANT EXECUTE ON FUNCTION m_amenagement.ft_m_modif_lot_divers() TO PUBLIC;

GRANT EXECUTE ON FUNCTION m_amenagement.ft_m_modif_lot_divers() TO create_sig;

COMMENT ON FUNCTION m_amenagement.ft_m_modif_lot_divers()
    IS 'Fonction gérant la mise à jour des données liées aux lots à vocation divers lors de la mise à jour de l''objet';


-- ############################################################ [ft_m_delete_lot_esppu] ######################################################################

-- FUNCTION: m_amenagement.ft_m_delete_lot_esppu()

-- DROP FUNCTION m_amenagement.ft_m_delete_lot_esppu();

CREATE OR REPLACE FUNCTION m_amenagement.ft_m_delete_lot_esppu()
    RETURNS trigger
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE NOT LEAKPROOF
AS $BODY$

BEGIN

    DELETE FROM m_foncier.an_cession WHERE idces=(SELECT lf.idces FROM m_foncier.an_cession f, m_foncier.lk_cession_lot lf WHERE f.idces=lf.idces AND lf.idgeolf=old.idgeolf);
    DELETE FROM m_foncier.lk_cession_lot WHERE idgeolf=old.idgeolf;
    DELETE FROM m_amenagement.an_amt_lot_stade WHERE idgeolf=old.idgeolf;
    DELETE FROM r_objet.geo_objet_fon_lot WHERE idgeolf=old.idgeolf;
	DELETE FROM m_amenagement.lk_amt_lot_site WHERE idgeolf=old.idgeolf;
    return new ;

END;

$BODY$;

ALTER FUNCTION m_amenagement.ft_m_delete_lot_esppu()
    OWNER TO create_sig;

GRANT EXECUTE ON FUNCTION m_amenagement.ft_m_delete_lot_esppu() TO PUBLIC;

GRANT EXECUTE ON FUNCTION m_amenagement.ft_m_delete_lot_esppu() TO create_sig;

COMMENT ON FUNCTION m_amenagement.ft_m_delete_lot_esppu()
    IS 'Fonction gérant la suppression des données liées aux lots à vocation espace public lors de la suppression de l''objet';


-- ############################################################ [ft_m_insert_lot_esppu] ######################################################################

-- FUNCTION: m_amenagement.ft_m_insert_lot_esppu()

-- DROP FUNCTION m_amenagement.ft_m_insert_lot_esppu();

CREATE OR REPLACE FUNCTION m_amenagement.ft_m_insert_lot_esppu()
    RETURNS trigger
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE NOT LEAKPROOF
AS $BODY$

DECLARE v_idces integer;
DECLARE v_idgeolf integer;
DECLARE lot_surf integer;

BEGIN

     v_idgeolf := (SELECT nextval('r_objet.idgeo_seq'::regclass));

     INSERT INTO r_objet.geo_objet_fon_lot SELECT v_idgeolf,new.op_sai,new.ref_spa,null,'50',new.geom,null,null,new.l_nom_lot;

     INSERT INTO m_amenagement.an_amt_lot_stade SELECT v_idgeolf,
						 
						  new.stade_amng,
						  new.l_amng2,
						  new.stade_comm,
						  new.l_comm2,
						  new.l_comm2_12,
						  new.etat_occup;

     lot_surf:=round(cast(st_area(new.geom) as numeric),0);

    -- insertion des lots uniquements mixte 
    -- recherche si le lot dessiner est dans un site : si oui copie une ligne dans le métier site et foncier, si non copie uniquement dans le métier foncier
    

						INSERT INTO m_amenagement.an_amt_lot_esppu SELECT v_idgeolf,
							
							new.op_sai,
							new.org_sai_lot,
							new.l_nom,
							lot_surf,
							now(),
							null,
				
							CASE WHEN length(cast (lot_surf as character varying)) >= 1 and length(cast (lot_surf as character varying)) <= 3 THEN lot_surf || 'm²'
								   WHEN length(cast (lot_surf as character varying)) = 4 THEN replace(to_char(lot_surf,'FM9G999'),',',' ') || 'm²'
								   WHEN length(cast (lot_surf as character varying)) = 5 THEN replace(to_char(lot_surf,'FM99G999'),',',' ') || 'm²'
								   WHEN length(cast (lot_surf as character varying)) = 6 THEN replace(to_char(lot_surf,'FM999G999'),',',' ') || 'm²'
								   WHEN length(cast (lot_surf as character varying)) = 7 THEN replace(to_char(lot_surf,'FM9G999G999'),',',' ') || 'm²'
								   WHEN length(cast (lot_surf as character varying)) = 8 THEN replace(to_char(lot_surf,'FM99G999G999'),',',' ') || 'm²'
								   END,
						    new.epci,
							new.l_observ
						;
	 
	 
     -- ici contrôle si hors ARC ne passe pas
     IF (select insee from r_osm.geo_osm_commune where st_intersects(st_pointonsurface(new.geom),geom)) 
	 IN ('60023','60067','60068','60070','60151','60156','60159','60323','60325','60326','60337','60338','60382','60402','60447',
		'60447','60578','60579','60597','60600','60665','60667','60674') THEN 

     -- calcul de l'identifiant du dossier de cession
     v_idces := (SELECT nextval('m_foncier.ces_seq'::regclass));

     -- insertion de tous lots fonciers dans la table métier foncier
     INSERT INTO m_foncier.lk_cession_lot SELECT v_idgeolf, v_idces;	

     -- insertion d'une ligne dans an_cession en créant un idces qui est lui même réinjecté dans lk_cession_lot

     /* ATTENTION : LEUR DE LA MISE EN PRODUCTION REMETTRE DANS L'ORDRE LES CHAMPS SUIVANTS IDCES, L_COMPO, L_OBSERV ==> cd table an_cession pour vérification */
     
     INSERT INTO m_foncier.an_cession VALUES 	(
						v_idces, -- idces
						'10',
						false, -- relation
						'00',
						'00',
						null,
						null,
						null,
						(SELECT insee FROM r_osm.geo_osm_commune WHERE st_intersects(st_pointonsurface(new.geom),geom)),
						null,
						'00',
						new.l_lnom,
						null,
						null,
						null,
						null,
						null,
						null,
						null,
						'00',
						'00',
						null,
						null,
						'00',
						null,
						null,
						null,
						false,
						false,
						false,
						false,
						false,
						null,
						null,
						null,
						false,
						false,
						false,
						null,
						null,
						null,
						null,
						null,
						null,
							null
						);

		END IF;
		
		-- association d'un lot à un ou plusieurs sites
		INSERT INTO m_amenagement.lk_amt_lot_site (idsite,idgeolf)
		SELECT idsite, v_idgeolf FROM m_activite_eco.geo_eco_site WHERE st_intersects(st_pointonsurface(new.geom),geom) IS TRUE;
		

     return new ;

END;

$BODY$;

ALTER FUNCTION m_amenagement.ft_m_insert_lot_esppu()
    OWNER TO create_sig;

GRANT EXECUTE ON FUNCTION m_amenagement.ft_m_insert_lot_esppu() TO PUBLIC;

GRANT EXECUTE ON FUNCTION m_amenagement.ft_m_insert_lot_esppu() TO create_sig;

COMMENT ON FUNCTION m_amenagement.ft_m_insert_lot_esppu()
    IS 'Fonction gérant l''insertion des données liées aux lots à vocation espace public lors de l''insertion de l''objet';


-- ############################################################ [ft_m_modif_lot_esppu] ######################################################################

-- FUNCTION: m_amenagement.ft_m_modif_lot_esppu()

-- DROP FUNCTION m_amenagement.ft_m_modif_lot_esppu();

CREATE OR REPLACE FUNCTION m_amenagement.ft_m_modif_lot_esppu()
    RETURNS trigger
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE NOT LEAKPROOF
AS $BODY$

BEGIN

		UPDATE r_objet.geo_objet_fon_lot SET geom = new.geom, date_maj = now(), src_geom = new.ref_spa, op_sai=new.op_sai,l_nom=new.l_nom_lot WHERE idgeolf = new.idgeolf;

	    UPDATE m_amenagement.an_amt_lot_stade SET stade_amng = new.stade_amng, l_amng2 = new.l_amng2, stade_comm = new.stade_comm, l_comm2 = new.l_comm2, l_comm2_12 = new.l_comm2_12, etat_occup =  new.etat_occup WHERE idgeolf = new.idgeolf;
		UPDATE m_amenagement.an_amt_lot_esppu SET

							surf = new.surf,
							l_surf_l = 
								   CASE WHEN length(cast (new.surf as character varying)) >= 1 and length(cast (new.surf as character varying)) <= 3 THEN new.surf || 'm²'
								   WHEN length(cast (new.surf as character varying)) = 4 THEN replace(to_char(new.surf,'FM9G999'),',',' ') || 'm²'
								   WHEN length(cast (new.surf as character varying)) = 5 THEN replace(to_char(new.surf,'FM99G999'),',',' ') || 'm²'
								   WHEN length(cast (new.surf as character varying)) = 6 THEN replace(to_char(new.surf,'FM999G999'),',',' ') || 'm²'
								   WHEN length(cast (new.surf as character varying)) = 7 THEN replace(to_char(new.surf,'FM9G999G999'),',',' ') || 'm²'
								   WHEN length(cast (new.surf as character varying)) = 8 THEN replace(to_char(new.surf,'FM99G999G999'),',',' ') || 'm²'
								   END,
							op_sai = new.op_sai,
							org_sai = new.org_sai_lot,
							l_nom = new.l_nom,
							date_maj = now(),
					
							epci = new.epci,
							l_observ = new.l_observ
		WHERE an_amt_lot_esppu.idgeolf=new.idgeolf;
		

     return new;
END
$BODY$;

ALTER FUNCTION m_amenagement.ft_m_modif_lot_esppu()
    OWNER TO create_sig;

GRANT EXECUTE ON FUNCTION m_amenagement.ft_m_modif_lot_esppu() TO PUBLIC;

GRANT EXECUTE ON FUNCTION m_amenagement.ft_m_modif_lot_esppu() TO create_sig;

COMMENT ON FUNCTION m_amenagement.ft_m_modif_lot_esppu()
    IS 'Fonction gérant la mise à jour des données liées aux lots à vocation espace public lors de la mise à jour de l''objet';



-- ####################################################################################################################################################
-- ###                                                                                                                                              ###
-- ###                                                                DOMAINES DE VALEURS                                                           ###
-- ###                                                                                                                                              ###
-- ####################################################################################################################################################


-- ####################################################################################################################################################
-- ###                                                          DOMAINES DE VALEURS M_ACTIVITE_ECO                                                  ###
-- ####################################################################################################################################################


-- ################################################################# Domaine valeur - [lt_eco_dest]  ##################################################

-- Table: m_activite_eco.lt_eco_dest

-- DROP TABLE m_activite_eco.lt_eco_dest;

CREATE TABLE m_activite_eco.lt_eco_dest
(
    code character varying(2) COLLATE pg_catalog."default" NOT NULL,
    valeur character varying(30) COLLATE pg_catalog."default",
    CONSTRAINT lt_eco_dest_pkkey PRIMARY KEY (code)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE m_activite_eco.lt_eco_dest
    OWNER to create_sig;

GRANT ALL ON TABLE m_activite_eco.lt_eco_dest TO sig_create;

GRANT SELECT ON TABLE m_activite_eco.lt_eco_dest TO sig_read;

GRANT ALL ON TABLE m_activite_eco.lt_eco_dest TO create_sig;

GRANT INSERT, SELECT, UPDATE, DELETE ON TABLE m_activite_eco.lt_eco_dest TO sig_edit;

COMMENT ON TABLE m_activite_eco.lt_eco_dest
    IS 'Liste de valeurs de destination (table pôle et site)';

COMMENT ON COLUMN m_activite_eco.lt_eco_dest.code
    IS 'Code de la destination principale du site ou du Pôle';

COMMENT ON COLUMN m_activite_eco.lt_eco_dest.valeur
    IS 'Libellé de la destination principale du site ou du Pôle';

INSERT INTO m_activite_eco.lt_eco_dest(
            code, valeur)
    VALUES
    ('00','Non renseigné'),
    ('10','Artisanat'),
    ('20','Industrie ou R&D'),
    ('30','Tertiaire'),
    ('40','Transport et logistique'),
    ('50','Commerce'),
    ('60','Agriculture'),
    ('70','Service/Négoce');

-- ################################################################# Domaine valeur - [lt_eco_etat]  ##################################################

-- Table: m_activite_eco.lt_eco_etat

-- DROP TABLE m_activite_eco.lt_eco_etat;

CREATE TABLE m_activite_eco.lt_eco_etat
(
  code character varying(2) NOT NULL, -- Code de la typologie de la situation du site au regard de l'aménagement
  valeur character varying(25), -- Code de la typologie de la situation du site au regard de l'aménagement
  CONSTRAINT lt_eco_etat_pkey PRIMARY KEY (code) -- Clé primaire de la table lt_eco_etat
)
WITH (
  OIDS=FALSE
);
ALTER TABLE m_activite_eco.lt_eco_etat
  OWNER TO sig_create;

GRANT ALL ON TABLE m_activite_eco.lt_eco_etat TO sig_create;

GRANT SELECT ON TABLE m_activite_eco.lt_eco_etat TO sig_read;

GRANT ALL ON TABLE m_activite_eco.lt_eco_etat TO create_sig;

GRANT INSERT, SELECT, UPDATE, DELETE ON TABLE m_activite_eco.lt_eco_etat TO sig_edit;

COMMENT ON TABLE m_activite_eco.lt_eco_etat
  IS 'Liste des valeurs de l''état du site';
COMMENT ON COLUMN m_activite_eco.lt_eco_etat.code IS 'Code de l''état du site';
COMMENT ON COLUMN m_activite_eco.lt_eco_etat.valeur IS 'Valeur de de l''état du site';

INSERT INTO m_activite_eco.lt_eco_etat(
            code, valeur)
    VALUES
    ('00','Non renseigné'),
    ('10','Existant'),
    ('20','Extension'),
    ('30','Création'),
    ('40','Déclassé'),
    ('50','Projet de déclassement');
    
-- ################################################################# Domaine valeur - [lt_eco_typo]  ##################################################

-- Table: m_activite_eco.lt_eco_typo

-- DROP TABLE m_activite_eco.lt_eco_typo;

CREATE TABLE m_activite_eco.lt_eco_typo
(
  code character varying(2) NOT NULL, -- Code de la typologie GéoPicardie du site
  valeur character varying(40), -- Libellé de la typologie GéoPicardie du site
  CONSTRAINT lt_eco_typo_pkey PRIMARY KEY (code) -- Clé primaire de la table lt_eco_typo
)
WITH (
  OIDS=FALSE
);
ALTER TABLE m_activite_eco.lt_eco_typo
  OWNER TO sig_create;
  

GRANT ALL ON TABLE m_activite_eco.lt_eco_typo TO sig_create;

GRANT SELECT ON TABLE m_activite_eco.lt_eco_typo TO sig_read;

GRANT ALL ON TABLE m_activite_eco.lt_eco_typo TO create_sig;

GRANT INSERT, SELECT, UPDATE, DELETE ON TABLE m_activite_eco.lt_eco_typo TO sig_edit;

COMMENT ON TABLE m_activite_eco.lt_eco_typo
  IS 'Liste de valeurs de la typologie du site';
COMMENT ON COLUMN m_activite_eco.lt_eco_typo.code IS 'Code de la typologie GéoPicardie du site';
COMMENT ON COLUMN m_activite_eco.lt_eco_typo.valeur IS 'Libellé de la typologie GéoPicardie du site';

INSERT INTO m_activite_eco.lt_eco_typo(
            code, valeur)
    VALUES
    ('00','Non renseigné'),
    ('10','Site monofonctionnel'),
    ('20','Site plurifonctionnel en périphérie'),
    ('30','Site plurifonctionnel en centre-ville'),
    ('40','Etablissement isolé');

-- ################################################################# Domaine valeur - [lt_eco_voca]  ##################################################

-- Table: m_activite_eco.lt_eco_voca

-- DROP TABLE m_activite_eco.lt_eco_voca;

CREATE TABLE m_activite_eco.lt_eco_voca
(
  code character varying(2) NOT NULL, -- Code de la vocation du site
  valeur character varying(25), -- Libellé de la vocation du site
  CONSTRAINT lt_eco_voca_pkey PRIMARY KEY (code) -- Clé primaire de la table lt_eco_voca
)
WITH (
  OIDS=FALSE
);
ALTER TABLE m_activite_eco.lt_eco_voca
  OWNER TO sig_create;

GRANT ALL ON TABLE m_activite_eco.lt_eco_voca TO sig_create;

GRANT SELECT ON TABLE m_activite_eco.lt_eco_voca TO sig_read;

GRANT ALL ON TABLE m_activite_eco.lt_eco_voca TO create_sig;

GRANT INSERT, SELECT, UPDATE, DELETE ON TABLE m_activite_eco.lt_eco_voca TO sig_edit;

COMMENT ON TABLE m_activite_eco.lt_eco_voca
  IS 'Liste de valeurs de vocation simplifiée de la zone';
COMMENT ON COLUMN m_activite_eco.lt_eco_voca.code IS 'Code de la vocation du site';
COMMENT ON COLUMN m_activite_eco.lt_eco_voca.valeur IS 'Libellé de la vocation du site';

INSERT INTO m_activite_eco.lt_eco_voca(
            code, valeur)
    VALUES
    ('00','Non renseigné'),
    ('10','ZI - zone industrielle'),
    ('20','ZA - zone artisanale'),
    ('30','ZC - zone commerciale'),
    ('40','ZM - zone mixte');

-- ################################################################# Domaine valeur - [lt_eco_typsite]  ##################################################

-- Table: m_activite_eco.lt_eco_typsite

-- DROP TABLE m_activite_eco.lt_eco_typsite;

CREATE TABLE m_activite_eco.lt_eco_typsite
(
  code character varying(2) NOT NULL, -- Code du type de site
  valeur character varying(100), -- Libellé du type de site
  CONSTRAINT lt_eco_typsite_pkey PRIMARY KEY (code) -- Clé primaire de la table lt_eco_typsite
)
WITH (
  OIDS=FALSE
);
ALTER TABLE m_activite_eco.lt_eco_typsite
  OWNER TO sig_create;

GRANT ALL ON TABLE m_activite_eco.lt_eco_typsite TO sig_create;

GRANT SELECT ON TABLE m_activite_eco.lt_eco_typsite TO sig_read;

GRANT ALL ON TABLE m_activite_eco.lt_eco_typsite TO create_sig;

GRANT INSERT, SELECT, UPDATE, DELETE ON TABLE m_activite_eco.lt_eco_typsite TO sig_edit;

COMMENT ON TABLE m_activite_eco.lt_eco_typsite
  IS 'Liste de valeurs des types de sites';
COMMENT ON COLUMN m_activite_eco.lt_eco_typsite.code IS 'Code du type de site';
COMMENT ON COLUMN m_activite_eco.lt_eco_typsite.valeur IS 'Libellé du type de site';

INSERT INTO m_activite_eco.lt_eco_typsite(
            code, valeur)
    VALUES
    ('00','Non renseigné'),
    ('10','ZAE'),
    ('20','Autre site d''activité identifié (hors ZAE)'),
    ('30','Autre secteur (non exclusivement économique)');
    
-- ################################################################# Domaine valeur - [lt_eco_tdocmedia]  ##################################################

-- Table: m_activite_eco.lt_eco_tdocmedia

-- DROP TABLE m_activite_eco.lt_eco_tdocmedia;

CREATE TABLE m_activite_eco.lt_eco_tdocmedia
(
  code character varying(2) NOT NULL, -- Code du type de site
  valeur character varying(100), -- Libellé du type de site
  CONSTRAINT lt_eco_tdocmedia_pkey PRIMARY KEY (code) -- Clé primaire de la table lt_eco_tdocmedia
)
WITH (
  OIDS=FALSE
);
ALTER TABLE m_activite_eco.lt_eco_tdocmedia
  OWNER TO sig_create;

GRANT ALL ON TABLE m_activite_eco.lt_eco_tdocmedia TO sig_create;

GRANT SELECT ON TABLE m_activite_eco.lt_eco_tdocmedia TO sig_read;

GRANT ALL ON TABLE m_activite_eco.lt_eco_tdocmedia TO create_sig;

GRANT INSERT, SELECT, UPDATE, DELETE ON TABLE m_activite_eco.lt_eco_tdocmedia TO sig_edit;

COMMENT ON TABLE m_activite_eco.lt_eco_tdocmedia
  IS 'Liste de valeurs des types de médias';
COMMENT ON COLUMN m_activite_eco.lt_eco_tdocmedia.code IS 'Code du type de média';
COMMENT ON COLUMN m_activite_eco.lt_eco_tdocmedia.valeur IS 'Libellé du type de média';

INSERT INTO m_activite_eco.lt_eco_tdocmedia(
            code, valeur)
    VALUES
    ('00','Non renseigné'),
    ('10','Photographie'),
    ('20','Carte, Plan'),
    ('30','Présentation'),
    ('40','Fiche commerciale'),
    ('50','Compte rendu'),
    ('60','Actes administratifs divers'),
    ('61','Délibération'),
    ('62','Règlement'),
    ('63','Acte de vente'),
    ('99','Autre document');
    
-- ################################################################ Domaine valeur - [lt_eco_typcontact]  ################################################

-- Table: m_activite_eco.lt_eco_typcontact

-- DROP TABLE m_activite_eco.lt_eco_typcontact;

CREATE TABLE m_activite_eco.lt_eco_typcontact
(
    code character varying(2) COLLATE pg_catalog."default" NOT NULL,
    valeur character varying(30) COLLATE pg_catalog."default",
    CONSTRAINT lt_eco_typcontact_pkey PRIMARY KEY (code)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE m_activite_eco.lt_eco_typcontact
    OWNER to create_sig;

GRANT ALL ON TABLE m_activite_eco.lt_eco_typcontact TO sig_create;

GRANT SELECT ON TABLE m_activite_eco.lt_eco_typcontact TO sig_read;

GRANT ALL ON TABLE m_activite_eco.lt_eco_typcontact TO create_sig;

GRANT INSERT, SELECT, UPDATE, DELETE ON TABLE m_activite_eco.lt_eco_typcontact TO sig_edit;

COMMENT ON TABLE m_activite_eco.lt_eco_typcontact
    IS 'Liste de valeurs des types de contact';

COMMENT ON COLUMN m_activite_eco.lt_eco_typcontact.code
    IS 'Code du type de contact';

COMMENT ON COLUMN m_activite_eco.lt_eco_typcontact.valeur
    IS 'Libellé du type de contact';

INSERT INTO m_activite_eco.lt_eco_typcontact(
            code, valeur)
    VALUES
    ('00','Non renseigné'),
    ('10','Entreprise (standard)'),
    ('11','Directeur - Responsable'),
    ('12','Assistante'),
    ('13','DRH'),
    ('20','Propriétaire'),
    ('30','Commercialisateur');
    
-- ################################################################ Domaine valeur - [lt_eco_typevenmt]  ################################################

-- Table: m_activite_eco.lt_eco_typevenmt

-- DROP TABLE m_activite_eco.lt_eco_typevenmt;

CREATE TABLE m_activite_eco.lt_eco_typevenmt
(
    code character varying(2) COLLATE pg_catalog."default" NOT NULL,
    valeur character varying(30) COLLATE pg_catalog."default",
    CONSTRAINT lt_eco_typevenmt_pkey PRIMARY KEY (code)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE m_activite_eco.lt_eco_typevenmt
    OWNER to create_sig;

GRANT ALL ON TABLE m_activite_eco.lt_eco_typevenmt TO sig_create;

GRANT SELECT ON TABLE m_activite_eco.lt_eco_typevenmt TO sig_read;

GRANT ALL ON TABLE m_activite_eco.lt_eco_typevenmt TO create_sig;

GRANT INSERT, SELECT, UPDATE, DELETE ON TABLE m_activite_eco.lt_eco_typevenmt TO sig_edit;

COMMENT ON TABLE m_activite_eco.lt_eco_typevenmt
    IS 'Liste de valeurs des types d''évènement';

COMMENT ON COLUMN m_activite_eco.lt_eco_typevenmt.code
    IS 'Code du type d''évènement';

COMMENT ON COLUMN m_activite_eco.lt_eco_typevenmt.valeur
    IS 'Libellé du type d''évènement';

INSERT INTO m_activite_eco.lt_eco_typevenmt(
            code, valeur)
    VALUES
    ('00','Non renseigné'),
    ('10','Contact (générique)'),
    ('11','Contact téléphonique'),
    ('12','Contact email'),
    ('20','Réunion'),
    ('30','Forum, salon'),
    ('40','Séminaire');

-- ################################################################ Domaine valeur - [lt_eco_tact]  ################################################

-- Table: m_activite_eco.lt_eco_tact

-- DROP TABLE m_activite_eco.lt_eco_tact;

CREATE TABLE m_activite_eco.lt_eco_tact
(
    code character varying(2) COLLATE pg_catalog."default" NOT NULL,
    valeur character varying(30) COLLATE pg_catalog."default",
    CONSTRAINT lt_eco_tact_pkey PRIMARY KEY (code)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE m_activite_eco.lt_eco_tact
    OWNER to create_sig;

GRANT ALL ON TABLE m_activite_eco.lt_eco_tact TO sig_create;

GRANT SELECT ON TABLE m_activite_eco.lt_eco_tact TO sig_read;

GRANT ALL ON TABLE m_activite_eco.lt_eco_tact TO create_sig;

GRANT INSERT, SELECT, UPDATE, DELETE ON TABLE m_activite_eco.lt_eco_tact TO sig_edit;

COMMENT ON TABLE m_activite_eco.lt_eco_tact
    IS 'Liste de valeurs de l''activité du projet d''implantation sur les lots (spécifique à l''ARC)';

COMMENT ON COLUMN m_activite_eco.lt_eco_tact.code
    IS 'Code de l''activité du projet d''implantation sur les lots (spécifique à l''ARC)';

COMMENT ON COLUMN m_activite_eco.lt_eco_tact.valeur
    IS 'Libellé de l''activité du projet d''implantation sur les lots (spécifique à l''ARC)';

INSERT INTO m_activite_eco.lt_eco_tact(
            code, valeur)
    VALUES
    ('00','Non renseigné'),
    ('10','Artisanat'),
    ('20','Commerce'),
    ('30','Industrie'),
    ('40','R & D'),
    ('50','Service/Négoce'),
    ('60','Tertiaire'),
    ('99','Autre');

-- ####################################################################################################################################################
-- ###                                                          DOMAINES DE VALEURS M_URBANISME REG                                                 ###
-- #####################################################################################################################################################


-- ################################################################ Domaine valeur - [lt_proc_typconso]  ################################################

-- Table: m_urbanisme_reg.lt_proc_typconso

-- DROP TABLE m_urbanisme_reg.lt_proc_typconso;

CREATE TABLE m_urbanisme_reg.lt_proc_typconso
(
    code character varying(2) COLLATE pg_catalog."default" NOT NULL,
    valeur character varying(50) COLLATE pg_catalog."default",
    CONSTRAINT lt_proc_typconso_pkey PRIMARY KEY (code)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE m_urbanisme_reg.lt_proc_typconso
    OWNER to create_sig;

GRANT ALL ON TABLE m_urbanisme_reg.lt_proc_typconso TO sig_create;

GRANT SELECT ON TABLE m_urbanisme_reg.lt_proc_typconso TO sig_read;

GRANT ALL ON TABLE m_urbanisme_reg.lt_proc_typconso TO create_sig;

GRANT INSERT, SELECT, UPDATE, DELETE ON TABLE m_urbanisme_reg.lt_proc_typconso TO sig_edit;

COMMENT ON TABLE m_urbanisme_reg.lt_proc_typconso
    IS 'Liste de valeurs des types de consommations foncières';

COMMENT ON COLUMN m_urbanisme_reg.lt_proc_typconso.code
    IS 'Code du type de consommation de surface';

COMMENT ON COLUMN m_urbanisme_reg.lt_proc_typconso.valeur
    IS 'Libellé du type de consommation de surface';
    
INSERT INTO m_urbanisme_reg.lt_proc_typconso(
            code, valeur)
    VALUES
    ('00','Non renseigné'),
    ('10','Renouvellement'),
    ('20','Extension'),
    ('30','Mixte');

-- ################################################################ Domaine valeur - [lt_proc_phase]  ################################################

-- Table: m_urbanisme_reg.lt_proc_phase

-- DROP TABLE m_urbanisme_reg.lt_proc_phase;

CREATE TABLE m_urbanisme_reg.lt_proc_phase
(
  code character varying(2) NOT NULL, -- Code de la phase de l'opération
  valeur character varying(50), -- Libellé de la phase de l'opération
  CONSTRAINT lt_proc_phase_pkey PRIMARY KEY (code) -- Clé primaire de la table lt_proc_phase
)
WITH (
  OIDS=FALSE
);
ALTER TABLE m_urbanisme_reg.lt_proc_phase
  OWNER TO sig_create;

COMMENT ON TABLE m_urbanisme_reg.lt_proc_phase
  IS 'Liste de valeurs des phases opérationnelles';
COMMENT ON COLUMN m_urbanisme_reg.lt_proc_phase.code IS 'Code de la phase de l''opération';
COMMENT ON COLUMN m_urbanisme_reg.lt_proc_phase.valeur IS 'Libellé de la phase de l''opération';

INSERT INTO m_urbanisme_reg.lt_proc_phase(
            code, valeur)
    VALUES
    ('00','Non renseigné'),
    ('10','Etude de faisabilité'),
    ('20','Acquisitions engagées - étude préopérationnelle'),
    ('30','Opérationnelle'),
    ('40','Achevée');


-- ################################################################ Domaine valeur - [lt_proc_typ]  ################################################

-- Table: m_urbanisme_reg.lt_proc_typ

-- DROP TABLE m_urbanisme_reg.lt_proc_typ;

CREATE TABLE m_urbanisme_reg.lt_proc_typ
(
  code character varying(2) NOT NULL, -- Code de la procédure
  valeur character varying(20), -- Libellé de la procédure
  CONSTRAINT lt_proc_typ_pkey PRIMARY KEY (code) -- Clé primaire de la table lt_proc_typ
)
WITH (
  OIDS=FALSE
);
ALTER TABLE m_urbanisme_reg.lt_proc_typ
  OWNER TO sig_create;

COMMENT ON TABLE m_urbanisme_reg.lt_proc_typ
  IS 'Liste de valeurs des types de procédure';
COMMENT ON COLUMN m_urbanisme_reg.lt_proc_typ.code IS 'Code de la procédure';
COMMENT ON COLUMN m_urbanisme_reg.lt_proc_typ.valeur IS 'Libellé de la procédure';

INSERT INTO m_urbanisme_reg.lt_proc_typ(
            code, valeur)
    VALUES
    ('00','Non renseigné'),
    ('10','ZAC'),
    ('21','Lotissement PA'),
    ('22','Lotissement DP'),
    ('30','PC valant division'),
    ('40','AFU');

-- ################################################################ Domaine valeur - [lt_proc_typfon]  ################################################

-- Table: m_urbanisme_reg.lt_proc_typfon

-- DROP TABLE m_urbanisme_reg.lt_proc_typfon;

CREATE TABLE m_urbanisme_reg.lt_proc_typfon
(
  code character varying(2) NOT NULL, -- Code de la procédure foncière
  valeur character varying(50), -- Libellé de la procédure foncière
  CONSTRAINT lt_proc_typfon_pkey PRIMARY KEY (code) -- Clé primaire de la table lt_proc_typfon
)
WITH (
  OIDS=FALSE
);
ALTER TABLE m_urbanisme_reg.lt_proc_typfon
  OWNER TO sig_create;

COMMENT ON TABLE m_urbanisme_reg.lt_proc_typfon
  IS 'Liste de valeurs des procédures foncières';
COMMENT ON COLUMN m_urbanisme_reg.lt_proc_typfon.code IS 'Code de la procédure foncière';
COMMENT ON COLUMN m_urbanisme_reg.lt_proc_typfon.valeur IS 'Libellé de la procédure foncière';

INSERT INTO m_urbanisme_reg.lt_proc_typfon(
            code, valeur)
    VALUES
    ('00','Non renseigné'),
    ('10','DUP'),
    ('20','Convention EPFLO'),
    ('30','Acquisitions amiables'),
    ('40','Opérateur privé');



-- ####################################################################################################################################################
-- ###                                                          DOMAINES DE VALEURS M_AMENAGEMENT                                                   ###
-- #####################################################################################################################################################


-- ################################################################ Domaine valeur - [lt_amt_stadeamng]  ################################################

-- Table: m_amenagement.lt_amt_stadeamng

-- DROP TABLE m_amenagement.lt_amt_stadeamng;

CREATE TABLE m_amenagement.lt_amt_stadeamng
(
    code character varying(2) COLLATE pg_catalog."default" NOT NULL,
    valeur character varying(15) COLLATE pg_catalog."default",
    CONSTRAINT lt_amt_stadeamng_pkey PRIMARY KEY (code)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE m_amenagement.lt_amt_stadeamng
    OWNER to create_sig;

GRANT ALL ON TABLE m_amenagement.lt_amt_stadeamng TO sig_create;

GRANT ALL ON TABLE m_amenagement.lt_amt_stadeamng TO create_sig;

GRANT SELECT ON TABLE m_amenagement.lt_amt_stadeamng TO sig_read;

GRANT INSERT, SELECT, UPDATE, DELETE ON TABLE m_amenagement.lt_amt_stadeamng TO sig_edit;

COMMENT ON TABLE m_amenagement.lt_amt_stadeamng
    IS 'Liste de valeurs du stade d''aménagement du lot';

COMMENT ON COLUMN m_amenagement.lt_amt_stadeamng.code
    IS 'Code du stade d''aménagement du lot';

COMMENT ON COLUMN m_amenagement.lt_amt_stadeamng.valeur
    IS 'Libellé du stade d''aménagement du lot';
COMMENT ON CONSTRAINT lt_amt_stadeamng_pkey ON m_amenagement.lt_amt_stadeamng
    IS 'Clé primaire de la table lt_sa_stadeamng';

INSERT INTO m_amenagement.lt_amt_stadeamng(
            code, valeur)
    VALUES
    ('00','Non renseigné'),
    ('10','Aucun'),
    ('20','Non acquis'),
    ('30','Acquis'),
    ('40','Viabilisé');


-- ################################################################ Domaine valeur - [lt_amt_stadeamng2]  ################################################


-- Table: m_amenagement.lt_amt_stadeamng2

-- DROP TABLE m_amenagement.lt_amt_stadeamng2;

CREATE TABLE m_amenagement.lt_amt_stadeamng2
(
    code character varying(2) COLLATE pg_catalog."default" NOT NULL,
    valeur character varying(50) COLLATE pg_catalog."default",
    CONSTRAINT lt_amt_stadeamng2_pkey PRIMARY KEY (code)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE m_amenagement.lt_amt_stadeamng2
    OWNER to create_sig;

GRANT ALL ON TABLE m_amenagement.lt_amt_stadeamng2 TO sig_create;

GRANT ALL ON TABLE m_amenagement.lt_amt_stadeamng2 TO create_sig;

GRANT SELECT ON TABLE m_amenagement.lt_amt_stadeamng2 TO sig_read;

GRANT INSERT, SELECT, UPDATE, DELETE ON TABLE m_amenagement.lt_amt_stadeamng2 TO sig_edit;

COMMENT ON TABLE m_amenagement.lt_amt_stadeamng2
    IS 'Liste de valeurs du stade d''aménagement du lot spécifique à l''ARC';

COMMENT ON COLUMN m_amenagement.lt_amt_stadeamng2.code
    IS 'Code de l''état de disponibilité des lots selon le stade d''aménagement (spécifique à l''ARC)';

COMMENT ON COLUMN m_amenagement.lt_amt_stadeamng2.valeur
    IS 'Libellé de l''état de disponibilité des lots selon le stade d''aménagement (spécifique à l''ARC)';
COMMENT ON CONSTRAINT lt_amt_stadeamng2_pkey ON m_amenagement.lt_amt_stadeamng2
    IS 'Clé primaire de la table lt_sa_stadeamng2';
    

INSERT INTO m_amenagement.lt_amt_stadeamng2(
            code, valeur)
    VALUES
    ('00','Non renseigné'),
    ('10','Disponible (aménagé ou aménageable rapidement)'),
    ('20','Indisponible (terrain non acheté)'),
    ('30','Indisponible (terrain non aménagé)');

-- ################################################################ Domaine valeur - [lt_amt_stadecomm]  ################################################

-- Table: m_amenagement.lt_amt_stadecomm

-- DROP TABLE m_amenagement.lt_amt_stadecomm;

CREATE TABLE m_amenagement.lt_amt_stadecomm
(
    code character varying(2) COLLATE pg_catalog."default" NOT NULL,
    valeur character varying(20) COLLATE pg_catalog."default",
    CONSTRAINT lt_amt_stadecomm_pkey PRIMARY KEY (code)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE m_amenagement.lt_amt_stadecomm
    OWNER to create_sig;

GRANT ALL ON TABLE m_amenagement.lt_amt_stadecomm TO sig_create;

GRANT ALL ON TABLE m_amenagement.lt_amt_stadecomm TO create_sig;

GRANT SELECT ON TABLE m_amenagement.lt_amt_stadecomm TO sig_read;

GRANT INSERT, SELECT, UPDATE, DELETE ON TABLE m_amenagement.lt_amt_stadecomm TO sig_edit;

COMMENT ON TABLE m_amenagement.lt_amt_stadecomm
    IS 'Liste de valeurs du stade de commercialisation';

COMMENT ON COLUMN m_amenagement.lt_amt_stadecomm.code
    IS 'Code du stade de commercialisation';

COMMENT ON COLUMN m_amenagement.lt_amt_stadecomm.valeur
    IS 'Libellé du stade de commercialisation';
COMMENT ON CONSTRAINT lt_amt_stadecomm_pkey ON m_amenagement.lt_amt_stadecomm
    IS 'Clé primaire de la table lt_sa_stadecomm';

INSERT INTO m_amenagement.lt_amt_stadecomm(
            code, valeur)
    VALUES
    ('00','Non renseigné'),
    ('10','Aucun'),
    ('20','Commercialisable');

-- ################################################################ Domaine valeur - [lt_amt_stadecomm2]  ################################################

-- Table: m_amenagement.lt_amt_stadecomm2

-- DROP TABLE m_amenagement.lt_amt_stadecomm2;

CREATE TABLE m_amenagement.lt_amt_stadecomm2
(
    code character varying(2) COLLATE pg_catalog."default" NOT NULL,
    valeur character varying(80) COLLATE pg_catalog."default",
    CONSTRAINT lt_amt_stadecomm2_pkey PRIMARY KEY (code)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE m_amenagement.lt_amt_stadecomm2
    OWNER to create_sig;

GRANT ALL ON TABLE m_amenagement.lt_amt_stadecomm2 TO sig_create;

GRANT ALL ON TABLE m_amenagement.lt_amt_stadecomm2 TO create_sig;

GRANT SELECT ON TABLE m_amenagement.lt_amt_stadecomm2 TO sig_read;

GRANT INSERT, SELECT, UPDATE, DELETE ON TABLE m_amenagement.lt_amt_stadecomm2 TO sig_edit;

COMMENT ON TABLE m_amenagement.lt_amt_stadecomm2
    IS 'Liste de valeurs du stade de commercialisation spécifique à l''ARC';

COMMENT ON COLUMN m_amenagement.lt_amt_stadecomm2.code
    IS 'Code du stade de commercialisation spécifique à l''ARC';

COMMENT ON COLUMN m_amenagement.lt_amt_stadecomm2.valeur
    IS 'Libellé du stade de commercialisation spécifique à l''ARC';
COMMENT ON CONSTRAINT lt_amt_stadecomm2_pkey ON m_amenagement.lt_amt_stadecomm2
    IS 'Clé primaire de la table lt_sa_stadecomm2 spécifique à l''ARC';

INSERT INTO m_amenagement.lt_amt_stadecomm2(
            code, valeur)
    VALUES
    ('00','Non renseigné'),
    ('11','En vente'),
    ('12','En vente (avec contrainte)'),
    ('20','Vendu'),
    ('31','Réservé (par une délibération du Conseil d''Agglomération)'),
    ('32','Réservé (option)'),
    ('99','Non commercialisé par un acteur public');

-- ################################################################ Domaine valeur - [lt_amt_empesp_pu]  ##############################################

-- Table: m_amenagement.lt_amt_empesp_pu

-- DROP TABLE m_amenagement.lt_amt_empesp_pu;

CREATE TABLE m_amenagement.lt_amt_empesp_pu
(
    code character varying(2) COLLATE pg_catalog."default" NOT NULL,
    valeur character varying(35) COLLATE pg_catalog."default",
    CONSTRAINT lt_amt_empesp_pu_pkkey PRIMARY KEY (code)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE m_amenagement.lt_amt_empesp_pu
    OWNER to create_sig;

GRANT ALL ON TABLE m_amenagement.lt_amt_empesp_pu TO sig_create;

GRANT ALL ON TABLE m_amenagement.lt_amt_empesp_pu TO create_sig;

GRANT SELECT ON TABLE m_amenagement.lt_amt_empesp_pu TO sig_read;

GRANT INSERT, SELECT, UPDATE, DELETE ON TABLE m_amenagement.lt_amt_empesp_pu TO sig_edit;

COMMENT ON TABLE m_amenagement.lt_amt_empesp_pu
    IS 'Vocation des espaces publics';

COMMENT ON COLUMN m_amenagement.lt_amt_empesp_pu.code
    IS 'Code de la vocation de l''espace public';

COMMENT ON COLUMN m_amenagement.lt_amt_empesp_pu.valeur
    IS 'Libellé de la vocation de l''espace public';
COMMENT ON CONSTRAINT lt_amt_empesp_pu_pkkey ON m_amenagement.lt_amt_empesp_pu
    IS 'Clé primaire de la table lt_amt_empesp_pu';
    
INSERT INTO m_amenagement.lt_amt_empesp_pu(
            code, valeur)
    VALUES
    ('00','Non renseigné'),
    ('11','Route'),
    ('12','Trottoir brut'),
    ('13','Trottoir paysagé'),
    ('14','Stationnement'),
    ('15','Terre plein central ou giratoire'),
    ('16','Voie réservée'),
    ('17','Esplanade'),
    ('21','Chemin'),
    ('22','Circulation douce'),
    ('31','Bassin d''orage'),
    ('32','Equipement réseau'),
    ('33','Equipement public'),
    ('41','Espace vert'),
    ('42','Bois'),
    ('50','Bâtiment public'),
    ('99','Autre');
    
-- ####################################################################################################################################################
-- ###                                                               DOMAINES DE VALEURS R_OBJET                                                    ###
-- #####################################################################################################################################################


-- ############################################################## [Domaine valeur - lt_objet_vocafon] #######################################################################


-- Table: r_objet.lt_objet_vocafon

-- DROP TABLE r_objet.lt_objet_vocafon;

CREATE TABLE r_objet.lt_objet_vocafon
(
    code character varying(2) COLLATE pg_catalog."default" NOT NULL,
    valeur character varying(25) COLLATE pg_catalog."default",
    CONSTRAINT lt_objet_vocafon_pkey PRIMARY KEY (code)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE r_objet.lt_objet_vocafon
    OWNER to create_sig;

GRANT ALL ON TABLE r_objet.lt_objet_vocafon TO sig_create;

GRANT ALL ON TABLE r_objet.lt_objet_vocafon TO create_sig;

GRANT SELECT ON TABLE r_objet.lt_objet_vocafon TO sig_read;

GRANT INSERT, SELECT, UPDATE, DELETE ON TABLE r_objet.lt_objet_vocafon TO sig_edit;

COMMENT ON TABLE r_objet.lt_objet_vocafon
    IS 'Liste de valeurs de vocation simplifiée de la zone (table site)';

COMMENT ON COLUMN r_objet.lt_objet_vocafon.code
    IS 'Code de la vocation';

COMMENT ON COLUMN r_objet.lt_objet_vocafon.valeur
    IS 'Libellé de la vocation';
COMMENT ON CONSTRAINT lt_objet_vocafon_pkey ON r_objet.lt_objet_vocafon
    IS 'Clé primaire de la table lt_objet_vocafon';
    
    
    
INSERT INTO r_objet.lt_objet_vocafon(
            code, valeur)
    VALUES
    ('00','Non renseigné'),
    ('10','Equipement public'),
    ('20','Lot Economique'),
    ('30','Lot Habitat'),
    ('40','Lot divers'),
    ('50','Lot espace public'),
    ('60','Lot Mixte');
    
-- ############################################################## [Domaine valeur - lt_eco_typloc] #######################################################################


-- Table: m_activite_eco.lt_eco_typloc

-- DROP TABLE m_activite_eco.lt_eco_typloc;

CREATE TABLE m_activite_eco.lt_eco_typloc
(
    code character varying(2) COLLATE pg_catalog."default" NOT NULL,
    valeur character varying(50) COLLATE pg_catalog."default",
    CONSTRAINT lt_eco_typloc_pkey PRIMARY KEY (code)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE m_activite_eco.lt_eco_typloc
    OWNER to create_sig;

GRANT ALL ON TABLE m_activite_eco.lt_eco_typloc TO sig_create;

GRANT ALL ON TABLE m_activite_eco.lt_eco_typloc TO create_sig;

GRANT SELECT ON TABLE m_activite_eco.lt_eco_typloc TO sig_read;

GRANT INSERT, SELECT, UPDATE, DELETE ON TABLE m_activite_eco.lt_eco_typloc TO sig_edit;

COMMENT ON TABLE m_activite_eco.lt_eco_typloc
    IS 'Liste de valeurs des types de locaux d''activité';

COMMENT ON COLUMN m_activite_eco.lt_eco_typloc.code
    IS 'Code du type de local';

COMMENT ON COLUMN m_activite_eco.lt_eco_typloc.valeur
    IS 'Libellé du type de local';
    
COMMENT ON CONSTRAINT lt_eco_typloc_pkey ON m_activite_eco.lt_eco_typloc
    IS 'Clé primaire de la table lt_eco_typloc';
    
    
    
INSERT INTO m_activite_eco.lt_eco_typloc(
            code, valeur)
    VALUES
    ('00','Non renseigné'),
    ('10','Terrain vierge'),
    ('20','Terrain en activité (non bâti)'),
    ('21','Terrain avec bâtiment léger en activité'),
    ('22','Parking'),
    ('23','Surface de dépôt ou de stockage'),
    ('30','Bureau'),
    ('40','Commerce'),
    ('50','Activité');
    
-- ############################################################## [Domaine valeur - lt_eco_occuploc] #######################################################################


-- Table: m_activite_eco.lt_eco_occuploc

-- DROP TABLE m_activite_eco.lt_eco_occuploc;

CREATE TABLE m_activite_eco.lt_eco_occuploc
(
    code character varying(2) COLLATE pg_catalog."default" NOT NULL,
    valeur character varying(100) COLLATE pg_catalog."default",
    CONSTRAINT lt_eco_occuploc_pkey PRIMARY KEY (code)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE m_activite_eco.lt_eco_occuploc
    OWNER to create_sig;

GRANT ALL ON TABLE m_activite_eco.lt_eco_occuploc TO sig_create;

GRANT ALL ON TABLE m_activite_eco.lt_eco_occuploc TO create_sig;

GRANT SELECT ON TABLE m_activite_eco.lt_eco_occuploc TO sig_read;

GRANT INSERT, SELECT, UPDATE, DELETE ON TABLE m_activite_eco.lt_eco_occuploc TO sig_edit;

COMMENT ON TABLE m_activite_eco.lt_eco_occuploc
    IS 'Liste de valeurs de l''état d''occupation d''un local';

COMMENT ON COLUMN m_activite_eco.lt_eco_occuploc.code
    IS 'Code du type d''occupation d''un local';

COMMENT ON COLUMN m_activite_eco.lt_eco_occuploc.valeur
    IS 'Libellé du type d''occupation d''un local';
    
COMMENT ON CONSTRAINT lt_eco_occuploc_pkey ON m_activite_eco.lt_eco_occuploc
    IS 'Clé primaire de la table lt_eco_occuploc';
    
    
    
INSERT INTO m_activite_eco.lt_eco_occuploc(
            code, valeur)
    VALUES
    ('00','Non renseigné'),
    ('10','Disponible à la vente (vacant)'),
    ('11','Disponible à la vente (occupé)'),
    ('20','Disponible à la location (vacant)'),
    ('21','Disponible à la location (occupé)'),
    ('30','Disponible à la vente ou à la location (vacant)'),
    ('31','Disponible à la vente ou à la location (occupé)'),
    ('40','Occupé');


-- ####################################################################################################################################################
-- ###                                                     DOMAINES DE VALEURS M_FONCIER                                                            ###
-- #####################################################################################################################################################

-- ############################################################## [Domaine valeur - lt_ces_cond] #######################################################################

-- Table: m_foncier.lt_ces_cond

-- DROP TABLE m_foncier.lt_ces_cond;

CREATE TABLE m_foncier.lt_ces_cond
(
    l_condi character varying(2) COLLATE pg_catalog."default" NOT NULL,
    condi_lib character varying(15) COLLATE pg_catalog."default",
    CONSTRAINT lt_ces_cond_pkey PRIMARY KEY (l_condi)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE m_foncier.lt_ces_cond
    OWNER to create_sig;

GRANT ALL ON TABLE m_foncier.lt_ces_cond TO sig_create;

GRANT SELECT ON TABLE m_foncier.lt_ces_cond TO sig_read;

GRANT ALL ON TABLE m_foncier.lt_ces_cond TO create_sig;

GRANT INSERT, SELECT, UPDATE, DELETE ON TABLE m_foncier.lt_ces_cond TO sig_edit;

COMMENT ON TABLE m_foncier.lt_ces_cond
    IS 'Liste de valeurs des conditions de cession';

COMMENT ON COLUMN m_foncier.lt_ces_cond.l_condi
    IS 'Code de conditions de cession';

COMMENT ON COLUMN m_foncier.lt_ces_cond.condi_lib
    IS 'Libellé de conditions de cession';
COMMENT ON CONSTRAINT lt_ces_cond_pkey ON m_foncier.lt_ces_cond
    IS 'Clé primaire de la table lt_ces_cond';

-- ############################################################## [Domaine valeur - lt_ces_doc] #######################################################################

-- Table: m_foncier.lt_ces_doc

-- DROP TABLE m_foncier.lt_ces_doc;

CREATE TABLE m_foncier.lt_ces_doc
(
    l_type character varying(2) COLLATE pg_catalog."default" NOT NULL,
    type_lib character varying(100) COLLATE pg_catalog."default",
    CONSTRAINT lt_ces_doc_pkey PRIMARY KEY (l_type)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE m_foncier.lt_ces_doc
    OWNER to create_sig;

GRANT ALL ON TABLE m_foncier.lt_ces_doc TO sig_create;

GRANT SELECT ON TABLE m_foncier.lt_ces_doc TO sig_read;

GRANT ALL ON TABLE m_foncier.lt_ces_doc TO create_sig;

GRANT INSERT, SELECT, UPDATE, DELETE ON TABLE m_foncier.lt_ces_doc TO sig_edit;

COMMENT ON TABLE m_foncier.lt_ces_doc
    IS 'Liste de valeurs des types de documents concernant les cessions ou les acquisitions';

COMMENT ON COLUMN m_foncier.lt_ces_doc.l_type
    IS 'Code du type de document de cessions ou d''acquisitions';

COMMENT ON COLUMN m_foncier.lt_ces_doc.type_lib
    IS 'Libellé du type de documents de cessions ou d''acquisitions';

-- ############################################################## [Domaine valeur - lt_ces_etat] #######################################################################

-- Table: m_foncier.lt_ces_etat

-- DROP TABLE m_foncier.lt_ces_etat;

CREATE TABLE m_foncier.lt_ces_etat
(
    l_etat character varying(2) COLLATE pg_catalog."default" NOT NULL,
    etat_lib character varying(25) COLLATE pg_catalog."default",
    CONSTRAINT lt_ces_etat_pkey PRIMARY KEY (l_etat)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE m_foncier.lt_ces_etat
    OWNER to create_sig;

GRANT ALL ON TABLE m_foncier.lt_ces_etat TO sig_create;

GRANT SELECT ON TABLE m_foncier.lt_ces_etat TO sig_read;

GRANT ALL ON TABLE m_foncier.lt_ces_etat TO create_sig;

GRANT INSERT, SELECT, UPDATE, DELETE ON TABLE m_foncier.lt_ces_etat TO sig_edit;

COMMENT ON TABLE m_foncier.lt_ces_etat
    IS 'Liste de valeurs de l''état du dossier';

COMMENT ON COLUMN m_foncier.lt_ces_etat.l_etat
    IS 'Code de l''état du dossier de cession';

COMMENT ON COLUMN m_foncier.lt_ces_etat.etat_lib
    IS 'Libellé de l''état du dossier de cession';
COMMENT ON CONSTRAINT lt_ces_etat_pkey ON m_foncier.lt_ces_etat
    IS 'Clé primaire de la table lt_ces_etat';

-- ############################################################## [Domaine valeur - lt_ces_nota] #######################################################################

-- Table: m_foncier.lt_ces_nota

-- DROP TABLE m_foncier.lt_ces_nota;

CREATE TABLE m_foncier.lt_ces_nota
(
    l_notaire character varying(2) COLLATE pg_catalog."default" NOT NULL,
    notaire_lib character varying(20) COLLATE pg_catalog."default",
    CONSTRAINT lt_ces_nota_pkey PRIMARY KEY (l_notaire)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE m_foncier.lt_ces_nota
    OWNER to create_sig;

GRANT ALL ON TABLE m_foncier.lt_ces_nota TO sig_create;

GRANT SELECT ON TABLE m_foncier.lt_ces_nota TO sig_read;

GRANT ALL ON TABLE m_foncier.lt_ces_nota TO create_sig;

GRANT INSERT, SELECT, UPDATE, DELETE ON TABLE m_foncier.lt_ces_nota TO sig_edit;

COMMENT ON TABLE m_foncier.lt_ces_nota
    IS 'Liste de valeurs du nom du notaire';

COMMENT ON COLUMN m_foncier.lt_ces_nota.l_notaire
    IS 'Code du nom du notaire';

COMMENT ON COLUMN m_foncier.lt_ces_nota.notaire_lib
    IS 'Libellé du notaire';
COMMENT ON CONSTRAINT lt_ces_nota_pkey ON m_foncier.lt_ces_nota
    IS 'Clé primaire de la table lt_ces_nota';

-- ############################################################## [Domaine valeur - lt_ces_orga] #######################################################################

-- Table: m_foncier.lt_ces_orga

-- DROP TABLE m_foncier.lt_ces_orga;

CREATE TABLE m_foncier.lt_ces_orga
(
    l_orga character varying(2) COLLATE pg_catalog."default" NOT NULL,
    orga_lib character varying(50) COLLATE pg_catalog."default",
    CONSTRAINT lt_ces_orga_pkey PRIMARY KEY (l_orga)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE m_foncier.lt_ces_orga
    OWNER to create_sig;

GRANT ALL ON TABLE m_foncier.lt_ces_orga TO sig_create;

GRANT SELECT ON TABLE m_foncier.lt_ces_orga TO sig_read;

GRANT ALL ON TABLE m_foncier.lt_ces_orga TO create_sig;

GRANT INSERT, SELECT, UPDATE, DELETE ON TABLE m_foncier.lt_ces_orga TO sig_edit;

COMMENT ON TABLE m_foncier.lt_ces_orga
    IS 'Liste de valeurs des noms de l''organisme cédant';

COMMENT ON COLUMN m_foncier.lt_ces_orga.l_orga
    IS 'Code du nom de l''organisme cédant';

COMMENT ON COLUMN m_foncier.lt_ces_orga.orga_lib
    IS 'Libellé du nom de l''organisme cédant';
COMMENT ON CONSTRAINT lt_ces_orga_pkey ON m_foncier.lt_ces_orga
    IS 'Clé primaire de la table lt_ces_orga';
    
-- ############################################################## [Domaine valeur - lt_ces_tact] #######################################################################

-- Table: m_foncier.lt_ces_tact

-- DROP TABLE m_foncier.lt_ces_tact;

CREATE TABLE m_foncier.lt_ces_tact
(
    l_type character varying(2) COLLATE pg_catalog."default" NOT NULL,
    type_lib character varying(15) COLLATE pg_catalog."default",
    CONSTRAINT lt_ces_tact_pkey PRIMARY KEY (l_type)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE m_foncier.lt_ces_tact
    OWNER to create_sig;

GRANT ALL ON TABLE m_foncier.lt_ces_tact TO sig_create;

GRANT SELECT ON TABLE m_foncier.lt_ces_tact TO sig_read;

GRANT ALL ON TABLE m_foncier.lt_ces_tact TO create_sig;

GRANT INSERT, SELECT, UPDATE, DELETE ON TABLE m_foncier.lt_ces_tact TO sig_edit;

COMMENT ON TABLE m_foncier.lt_ces_tact
    IS 'Liste de valeurs du type d''acte de cession';

COMMENT ON COLUMN m_foncier.lt_ces_tact.l_type
    IS 'Code du type d''acte de cession';

COMMENT ON COLUMN m_foncier.lt_ces_tact.type_lib
    IS 'Libellé du type d''acte de cession';
COMMENT ON CONSTRAINT lt_ces_tact_pkey ON m_foncier.lt_ces_tact
    IS 'Clé primaire de la table lt_ces_tact';

-- ############################################################## [Domaine valeur - lt_ces_voca] #######################################################################

-- Table: m_foncier.lt_ces_voca

-- DROP TABLE m_foncier.lt_ces_voca;

CREATE TABLE m_foncier.lt_ces_voca
(
    l_voca character varying(2) COLLATE pg_catalog."default" NOT NULL,
    voca_lib character varying(50) COLLATE pg_catalog."default",
    CONSTRAINT lt_ces_voca_pkey PRIMARY KEY (l_voca)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE m_foncier.lt_ces_voca
    OWNER to create_sig;

GRANT ALL ON TABLE m_foncier.lt_ces_voca TO sig_create;

GRANT SELECT ON TABLE m_foncier.lt_ces_voca TO sig_read;

GRANT ALL ON TABLE m_foncier.lt_ces_voca TO create_sig;

GRANT INSERT, SELECT, UPDATE, DELETE ON TABLE m_foncier.lt_ces_voca TO sig_edit;

COMMENT ON TABLE m_foncier.lt_ces_voca
    IS 'Liste de valeurs de la vocation de la cession';

COMMENT ON COLUMN m_foncier.lt_ces_voca.l_voca
    IS 'Code de la vocation de la cession';

COMMENT ON COLUMN m_foncier.lt_ces_voca.voca_lib
    IS 'Libellé de la vocation de la cession';
COMMENT ON CONSTRAINT lt_ces_voca_pkey ON m_foncier.lt_ces_voca
    IS 'Clé primaire de la table lt_ces_voca';

-- ############################################################## [Domaine valeur - lt_rel_lot] #######################################################################

-- Table: m_foncier.lt_rel_lot

-- DROP TABLE m_foncier.lt_rel_lot;

CREATE TABLE m_foncier.lt_rel_lot
(
    l_rel character varying(2) COLLATE pg_catalog."default" NOT NULL,
    rel_lib character varying(25) COLLATE pg_catalog."default",
    CONSTRAINT lt_rel_lot_pkey PRIMARY KEY (l_rel)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE m_foncier.lt_rel_lot
    OWNER to create_sig;

GRANT ALL ON TABLE m_foncier.lt_rel_lot TO sig_create;

GRANT SELECT ON TABLE m_foncier.lt_rel_lot TO sig_read;

GRANT ALL ON TABLE m_foncier.lt_rel_lot TO create_sig;

GRANT INSERT, SELECT, UPDATE, DELETE ON TABLE m_foncier.lt_rel_lot TO sig_edit;

COMMENT ON TABLE m_foncier.lt_rel_lot
    IS 'Liste de valeurs du type de relation entre le dossier de cession et les lots';

COMMENT ON COLUMN m_foncier.lt_rel_lot.l_rel
    IS 'Code de la relation';

COMMENT ON COLUMN m_foncier.lt_rel_lot.rel_lib
    IS 'Libellé de la relation';
COMMENT ON CONSTRAINT lt_rel_lot_pkey ON m_foncier.lt_rel_lot
    IS 'Clé primaire de la table lt_rel_lot';

-- ####################################################################################################################################################
-- ###                                                                                                                                              ###
-- ###                                                                TABLE                                                                         ###
-- ###                                                                                                                                              ###
-- ####################################################################################################################################################

-- ####################################################################################################################################################
-- ###                                                         TABLE M_ACTIVITE_ECO                                                                 ###
-- ####################################################################################################################################################


-- ############################################################## [an_eco_pole] #######################################################################

-- Table: m_activite_eco.an_eco_pole

-- DROP TABLE m_activite_eco.an_eco_pole;

CREATE TABLE m_activite_eco.an_eco_pole
(
    idpole character varying(4) NOT NULL DEFAULT 'P' || nextval('m_activite_eco.an_eco_pole_seq'::regclass),
    idpolereg character varying(7) COLLATE pg_catalog."default",
    nom_pole character varying(100) COLLATE pg_catalog."default",
    dest character varying(2) COLLATE pg_catalog."default" DEFAULT '00'::character varying,
    op_sai character varying(80) COLLATE pg_catalog."default",
    org_sai character varying(100) COLLATE pg_catalog."default",
    epci character varying(10) COLLATE pg_catalog."default",
    date_sai timestamp without time zone DEFAULT now(),
    date_maj timestamp without time zone,
    CONSTRAINT an_eco_pole_pkey PRIMARY KEY (idpole),
    CONSTRAINT lt_sa_dest_fkey FOREIGN KEY (dest)
        REFERENCES m_activite_eco.lt_eco_dest (code) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE m_activite_eco.an_eco_pole
    OWNER to create_sig;

GRANT ALL ON TABLE m_activite_eco.an_eco_pole TO sig_create;

GRANT SELECT ON TABLE m_activite_eco.an_eco_pole TO sig_read;

GRANT ALL ON TABLE m_activite_eco.an_eco_pole TO create_sig;

GRANT INSERT, SELECT, UPDATE, DELETE ON TABLE m_activite_eco.an_eco_pole TO sig_edit;

COMMENT ON TABLE m_activite_eco.an_eco_pole
    IS 'Table alphanumérique recensement les pôle d''activités économiques (regroupement de sites). Usage statistique au niveau Régional';

COMMENT ON COLUMN m_activite_eco.an_eco_pole.idpole
    IS 'Identifiant unique non signifiant du pôle d''activité';

COMMENT ON COLUMN m_activite_eco.an_eco_pole.idpolereg
    IS 'Identifiant unique régional du pôle d''activité';

COMMENT ON COLUMN m_activite_eco.an_eco_pole.nom_pole
    IS 'Libellé du pôle d''activités';

COMMENT ON COLUMN m_activite_eco.an_eco_pole.date_sai
    IS 'Date de saisie';

COMMENT ON COLUMN m_activite_eco.an_eco_pole.date_maj
    IS 'Date de mise à jour';

COMMENT ON COLUMN m_activite_eco.an_eco_pole.op_sai
    IS 'Opérateur de saisie initial';

COMMENT ON COLUMN m_activite_eco.an_eco_pole.org_sai
    IS 'Organisme de saisie initial';
    
COMMENT ON COLUMN m_activite_eco.an_eco_pole.epci
    IS 'Autorité compétente';

COMMENT ON COLUMN m_activite_eco.an_eco_pole.dest
    IS 'Destination du pôle (issue de la destination des sites)';


-- ############################################################## [geo_eco_site] ######################################################################


-- Table: m_activite_eco.geo_eco_site

-- DROP TABLE m_activite_eco.geo_eco_site;

CREATE TABLE m_activite_eco.geo_eco_site
(
    idsite character varying(5) NOT NULL DEFAULT 'S' || nextval('m_activite_eco.geo_eco_site_seq'::regclass),
    idsitereg character varying(7) COLLATE pg_catalog."default",
    idpole integer,
    site_nom character varying(80) COLLATE pg_catalog."default",
    site_voca character varying(2) COLLATE pg_catalog."default" DEFAULT '00'::character varying,
    site_etat character varying(2) COLLATE pg_catalog."default" DEFAULT '00'::character varying,
    typsite character varying(2) COLLATE pg_catalog."default" DEFAULT '00'::character varying,
    typo character varying(2) COLLATE pg_catalog."default" DEFAULT '00'::character varying,
    dest character varying(2) COLLATE pg_catalog."default" DEFAULT '00'::character varying,
    dest_autre character varying(254) COLLATE pg_catalog."default",
    date_crea integer,
    p_implant character varying(10) COLLATE pg_catalog."default",
    commune character varying(255) COLLATE pg_catalog."default",
    z_proced boolean DEFAULT false,
    surf_brt double precision,
    surf_occ double precision,
    surf_equ double precision,	
    surf_net double precision,
    surf_res double precision,	
    nbetab integer,
    nbemploi integer,	
    z_mai_ouvr character varying(80) COLLATE pg_catalog."default",
    z_compet character varying(80) COLLATE pg_catalog."default",
    z_amng character varying(80) COLLATE pg_catalog."default",
    z_gest character varying(80) COLLATE pg_catalog."default",
    z_anim character varying(80) COLLATE pg_catalog."default",
    z_comm character varying(80) COLLATE pg_catalog."default",
    z_cession double precision,
    z_env boolean DEFAULT false,
    z_paysage boolean DEFAULT false,
    z_rehab boolean DEFAULT false,
    z_epu boolean DEFAULT false,
    z_dechet character varying(80) COLLATE pg_catalog."default",
    z_tr_slect boolean DEFAULT false,
    res_ass boolean DEFAULT false,
    res_pluvia boolean DEFAULT false,
    res_eau boolean DEFAULT false,
    res_gaz boolean DEFAULT false,
    res_elect boolean DEFAULT false,
    res_fibre boolean DEFAULT false,	
    res_autre character varying(1000) COLLATE pg_catalog."default",	
    z_auto character varying(10) COLLATE pg_catalog."default",	
    d_auto character varying(100) COLLATE pg_catalog."default",	
    z_dst_auto integer,
    z_tps_auto integer,
    z_ar_f character varying(80) COLLATE pg_catalog."default",
    z_dst_ar_f integer,
    z_ar_v character varying(80) COLLATE pg_catalog."default",
    z_dst_ar_v integer,
    z_fr_f character varying(80) COLLATE pg_catalog."default",
    z_dst_fr_f integer,
    z_fr_v character varying(80) COLLATE pg_catalog."default",
    z_dst_fr_v integer,
    z_pmm boolean DEFAULT false,
    z_dst_pmm integer,
    serv_tc boolean DEFAULT false,
    serv_tc_g boolean DEFAULT false,	
    circ_douce boolean DEFAULT false,
    serv_rest boolean DEFAULT false,
    serv_crech boolean DEFAULT false,
    serv_autre character varying(1000) COLLATE pg_catalog."default",
    z_aide_pb boolean DEFAULT false,
    src_geom character varying(2) COLLATE pg_catalog."default" DEFAULT '00'::character varying,
    src_date character varying(4) COLLATE pg_catalog."default" DEFAULT '0000'::bpchar,
    date_sai timestamp without time zone,
    date_maj timestamp without time zone,
    op_sai character varying(80) COLLATE pg_catalog."default",
    org_sai character varying(80) COLLATE pg_catalog."default",
    epci character varying(10) COLLATE pg_catalog."default",
    observ character varying(1000) COLLATE pg_catalog."default",
    geom geometry(MultiPolygon,2154) NOT NULL,	
    CONSTRAINT geo_eco_site_pkey PRIMARY KEY (idsite),
    CONSTRAINT geo_eco_site_etat_fkey FOREIGN KEY (site_etat)
        REFERENCES m_activite_eco.lt_eco_etat (code) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT lt_eco_dest_fkey FOREIGN KEY (dest)
        REFERENCES m_activite_eco.lt_eco_dest (code) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT lt_eco_typo_fkey FOREIGN KEY (typo)
        REFERENCES m_activite_eco.lt_eco_typo (code) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT lt_eco_voca_fkey FOREIGN KEY (site_voca)
        REFERENCES m_activite_eco.lt_eco_voca (code) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT lt_eco_typsite_fkey FOREIGN KEY (typsite)
        REFERENCES m_activite_eco.lt_eco_typsite (code) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT lt_src_geom_fkey FOREIGN KEY (src_geom)
        REFERENCES r_objet.lt_src_geom (code) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE m_activite_eco.geo_eco_site
    OWNER to create_sig;

GRANT ALL ON TABLE m_activite_eco.geo_eco_site TO sig_create;

GRANT SELECT ON TABLE m_activite_eco.geo_eco_site TO sig_read;

GRANT ALL ON TABLE m_activite_eco.geo_eco_site TO create_sig;

GRANT INSERT, SELECT, UPDATE, DELETE ON TABLE m_activite_eco.geo_eco_site TO sig_edit;

COMMENT ON TABLE m_activite_eco.geo_eco_site
    IS 'Classe des objets Sites d''activités économiques.';

COMMENT ON COLUMN m_activite_eco.geo_eco_site.idsite
    IS 'Identifiant interne non signifiant des site d''activités';

COMMENT ON COLUMN m_activite_eco.geo_eco_site.idsitereg
    IS 'Identifiant régional des site d''activités';

COMMENT ON COLUMN m_activite_eco.geo_eco_site.idpole
    IS 'Identifiant interne non signifiant du pôle d''appartenance';

COMMENT ON COLUMN m_activite_eco.geo_eco_site.site_nom
    IS 'Libellé du site';

COMMENT ON COLUMN m_activite_eco.geo_eco_site.site_voca
    IS 'Code de la vocation simplifiée de la zone (ZI, ZA, Zone commerciale, ...)';

COMMENT ON COLUMN m_activite_eco.geo_eco_site.site_etat
    IS 'Code de l''état du site (existant, création, déclassé, ...)';

COMMENT ON COLUMN m_activite_eco.geo_eco_site.typsite
    IS 'Code des différents type de sites (ZAE, autre site d''activités hors ZAE, autre site, ...)';

COMMENT ON COLUMN m_activite_eco.geo_eco_site.typo
    IS 'Code de la typologie du site (site mononfonctionnel, ...)';

COMMENT ON COLUMN m_activite_eco.geo_eco_site.dest
    IS 'Code de la destination initiale du site (défini dans les documents d''urbanisme)';

COMMENT ON COLUMN m_activite_eco.geo_eco_site.dest_autre
    IS 'Autres distantions ou précisions sur la destination';

COMMENT ON COLUMN m_activite_eco.geo_eco_site.date_crea
    IS 'Année de création du site';

COMMENT ON COLUMN m_activite_eco.geo_eco_site.p_implant
    IS 'Première implantation des entreprises sur le site (année ou date)';
	
COMMENT ON COLUMN m_activite_eco.geo_eco_site.commune
    IS 'Libellé des communes d''assises du site d''activités';
	
COMMENT ON COLUMN m_activite_eco.geo_eco_site.surf_brt
    IS 'Surface totale du site';
	
COMMENT ON COLUMN m_activite_eco.geo_eco_site.surf_occ
    IS 'Surface totale du foncier occupé par des opérateurs économiques';

COMMENT ON COLUMN m_activite_eco.geo_eco_site.surf_equ
    IS 'Surface totale du site allouée aux espaces et équipements publics et voiries';

COMMENT ON COLUMN m_activite_eco.geo_eco_site.surf_net
    IS 'Surface totale du foncier disponible sur le site à vocation économique';
	
COMMENT ON COLUMN m_activite_eco.geo_eco_site.surf_res
    IS 'Surface totale du foncier réservé sur le site à vocation économique';
	
COMMENT ON COLUMN m_activite_eco.geo_eco_site.nbetab
    IS 'Nombre d''établissements présent sur le site';

COMMENT ON COLUMN m_activite_eco.geo_eco_site.nbemploi
    IS 'Nombre d''emplois présent sur le site';
    
    COMMENT ON COLUMN m_activite_eco.geo_eco_site.z_proced
    IS 'Le site est-il issu d''une procédure d''aménagement';

COMMENT ON COLUMN m_activite_eco.geo_eco_site.z_mai_ouvr
    IS 'Nom du maître d''ouvrage';

COMMENT ON COLUMN m_activite_eco.geo_eco_site.z_compet
    IS 'Nom de la collectivité ayant dans ses compétences le développement de la zone';

COMMENT ON COLUMN m_activite_eco.geo_eco_site.z_amng
    IS 'Nom de l''aménageur de la zone';

COMMENT ON COLUMN m_activite_eco.geo_eco_site.z_gest
    IS 'Nom du gestionnaire de la zone';

COMMENT ON COLUMN m_activite_eco.geo_eco_site.z_anim
    IS 'Nom de l''animateur de la zone';

COMMENT ON COLUMN m_activite_eco.geo_eco_site.z_comm
    IS 'Structure de contact pour la commercialisation';

COMMENT ON COLUMN m_activite_eco.geo_eco_site.z_cession
    IS 'Conditions de cession en HT (euro/m²)';

COMMENT ON COLUMN m_activite_eco.geo_eco_site.z_env
    IS 'Démarche environnementale engagée sur le site';
    
    
COMMENT ON COLUMN m_activite_eco.geo_eco_site.z_aide_pb
    IS 'Aides publiques bénéficiaires au site';

COMMENT ON COLUMN m_activite_eco.geo_eco_site.z_paysage
    IS 'Démarche paysagère engagée sur le site';

COMMENT ON COLUMN m_activite_eco.geo_eco_site.z_rehab
    IS 'Procédure de réhabilitaion du site en cours ou à venir ou réalisé';

COMMENT ON COLUMN m_activite_eco.geo_eco_site.z_epu
    IS 'Présence d''un traitement de l''eau d''épuration';

COMMENT ON COLUMN m_activite_eco.geo_eco_site.z_dechet
    IS 'Libellé du gestionnaire des déchets si différents de la collectivité';

COMMENT ON COLUMN m_activite_eco.geo_eco_site.z_tr_slect
    IS 'Présence d''un tri sélectif sur le site';

COMMENT ON COLUMN m_activite_eco.geo_eco_site.res_ass
    IS 'Présence d''un réseau d''assainissement';

COMMENT ON COLUMN m_activite_eco.geo_eco_site.res_pluvia
    IS 'Présence d''un réseau d''eau pluviale';

COMMENT ON COLUMN m_activite_eco.geo_eco_site.res_eau
    IS 'Présence d''un réseau d''eau potable';

COMMENT ON COLUMN m_activite_eco.geo_eco_site.res_gaz
    IS 'Présence d''un réseau de gaz';

COMMENT ON COLUMN m_activite_eco.geo_eco_site.res_elect
    IS 'Présence d''un réseau électrique';

COMMENT ON COLUMN m_activite_eco.geo_eco_site.res_fibre
    IS 'Présence de la fibre optique';
	
COMMENT ON COLUMN m_activite_eco.geo_eco_site.res_autre
    IS 'Autres services liés au réseau';

COMMENT ON COLUMN m_activite_eco.geo_eco_site.z_auto
    IS 'Libellé de l''autoroute la plus proche';
	
COMMENT ON COLUMN m_activite_eco.geo_eco_site.d_auto
    IS 'Libellé du diffuseur autoroutier le plus proche';

COMMENT ON COLUMN m_activite_eco.geo_eco_site.z_dst_auto
    IS 'Distance en km du diffuseur autoroutier par la route';

COMMENT ON COLUMN m_activite_eco.geo_eco_site.z_tps_auto
    IS 'Temps d''accès en minutes du diffuseur autoroutier par la route';

COMMENT ON COLUMN m_activite_eco.geo_eco_site.z_ar_f
    IS 'Nom de l''aéroport fret le plus proche';

COMMENT ON COLUMN m_activite_eco.geo_eco_site.z_dst_ar_f
    IS 'Distance en km de l''aéroport de fret par la route';

COMMENT ON COLUMN m_activite_eco.geo_eco_site.z_ar_v
    IS 'Nom de l''aéroport de voyageurs le plus proche';

COMMENT ON COLUMN m_activite_eco.geo_eco_site.z_dst_ar_v
    IS 'Distance en km de l''aéroport de voyageurs par la route';

COMMENT ON COLUMN m_activite_eco.geo_eco_site.z_fr_f
    IS 'Gare de fret la plus proche';

COMMENT ON COLUMN m_activite_eco.geo_eco_site.z_dst_fr_f
    IS 'Distance en km de la gare de fret la plus proche par la route';

COMMENT ON COLUMN m_activite_eco.geo_eco_site.z_fr_v
    IS 'Gare de voyageurs la plus proche';

COMMENT ON COLUMN m_activite_eco.geo_eco_site.z_dst_fr_v
    IS 'Distance en km de la gare de voyageurs la plus proche par la route';

COMMENT ON COLUMN m_activite_eco.geo_eco_site.z_pmm
    IS 'Présence d''une plate-forme multimodale';

COMMENT ON COLUMN m_activite_eco.geo_eco_site.z_dst_pmm
    IS 'Distance en km de la plate-forme multimodale la plus proche par la route';

COMMENT ON COLUMN m_activite_eco.geo_eco_site.serv_tc
    IS 'Présence de transport en commun desservant le site';

COMMENT ON COLUMN m_activite_eco.geo_eco_site.serv_tc_g
    IS 'Gratuité des transports en commun';

COMMENT ON COLUMN m_activite_eco.geo_eco_site.circ_douce
    IS 'Présence de circulation douce accédant au site (pistes cyclables)';

COMMENT ON COLUMN m_activite_eco.geo_eco_site.serv_rest
    IS 'Présence de restaurants ou à proximité immédiate';

COMMENT ON COLUMN m_activite_eco.geo_eco_site.serv_crech
    IS 'Présence de crèches ou à proximité immédiate';

COMMENT ON COLUMN m_activite_eco.geo_eco_site.serv_autre
    IS 'Libellé des autres services disponibles sur le site';

COMMENT ON COLUMN m_activite_eco.geo_eco_site.src_geom
    IS 'Code du référentiel de saisie des objets sites';

COMMENT ON COLUMN m_activite_eco.geo_eco_site.src_date
    IS 'Date du référentiel de saisie des objets sites';

COMMENT ON COLUMN m_activite_eco.geo_eco_site.date_sai
    IS 'Date de saisie des données attributaires';

COMMENT ON COLUMN m_activite_eco.geo_eco_site.date_maj
    IS 'Date de mise à jour des données attributaires';

COMMENT ON COLUMN m_activite_eco.geo_eco_site.op_sai
    IS 'Libellé de la personne ayant saisie l''objet initialisament';

COMMENT ON COLUMN m_activite_eco.geo_eco_site.org_sai
    IS 'Organisme de saisie dont dépend l''opérateur de saisie initial';

COMMENT ON COLUMN m_activite_eco.geo_eco_site.epci
    IS 'Autorité compétente';

COMMENT ON COLUMN m_activite_eco.geo_eco_site.observ
    IS 'Observations diverses';
	
COMMENT ON COLUMN m_activite_eco.geo_eco_site.geom
    IS 'Géométrie des objets sites';

-- ############################################################## [an_eco_media] ##################################################################

-- Table: m_activite_eco.an_eco_media

-- DROP TABLE m_activite_eco.an_eco_media;

CREATE TABLE m_activite_eco.an_eco_media
(
    gid integer NOT NULL DEFAULT nextval('m_activite_eco.an_eco_media_seq'::regclass),
    id text COLLATE pg_catalog."default",
    media text COLLATE pg_catalog."default",
    miniature bytea,
    n_fichier text COLLATE pg_catalog."default",
    t_fichier text COLLATE pg_catalog."default",
    op_sai character varying(20) COLLATE pg_catalog."default",
    date_sai timestamp without time zone,
    l_doc character varying(100) COLLATE pg_catalog."default",
    t_doc character varying(2) COLLATE pg_catalog."default" DEFAULT '00'::character varying,
    d_photo timestamp without time zone,
    alaune boolean NOT NULL DEFAULT false,
	alaunesite boolean NOT NULL DEFAULT false,
    CONSTRAINT an_eco_media_pkey PRIMARY KEY (gid),
    CONSTRAINT an_eco_media_t_doc_fkey FOREIGN KEY (t_doc)
        REFERENCES m_activite_eco.lt_eco_tdocmedia (code) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE m_activite_eco.an_eco_media
    OWNER to create_sig;

GRANT ALL ON TABLE m_activite_eco.an_eco_media TO sig_create;

GRANT ALL ON TABLE m_activite_eco.an_eco_media TO create_sig;

GRANT INSERT, SELECT, UPDATE, DELETE ON TABLE m_activite_eco.an_eco_media TO sig_edit;

GRANT ALL ON TABLE m_activite_eco.an_eco_media TO sig_stage WITH GRANT OPTION;

GRANT SELECT ON TABLE m_activite_eco.an_eco_media TO sig_read;

COMMENT ON TABLE m_activite_eco.an_eco_media
    IS 'Table gérant les documents intégrés pour la gestion des données des sites, lots et locaux et bâtiments d''activité';

COMMENT ON COLUMN m_activite_eco.an_eco_media.gid
    IS 'Compteur (identifiant interne)';

COMMENT ON COLUMN m_activite_eco.an_eco_media.id
    IS 'Identifiant interne non signifiant de l''objet saisi';

COMMENT ON COLUMN m_activite_eco.an_eco_media.media
    IS 'Champ Média de GEO';

COMMENT ON COLUMN m_activite_eco.an_eco_media.miniature
    IS 'Champ miniature de GEO';

COMMENT ON COLUMN m_activite_eco.an_eco_media.n_fichier
    IS 'Nom du fichier';

COMMENT ON COLUMN m_activite_eco.an_eco_media.t_fichier
    IS 'Type de média dans GEO';

COMMENT ON COLUMN m_activite_eco.an_eco_media.op_sai
    IS 'Opérateur de saisie (par défaut login de connexion à GEO)';

COMMENT ON COLUMN m_activite_eco.an_eco_media.date_sai
    IS 'Date de la saisie du document';

COMMENT ON COLUMN m_activite_eco.an_eco_media.l_doc
    IS 'Titre du document ou légère description';

COMMENT ON COLUMN m_activite_eco.an_eco_media.t_doc
    IS 'Type de documents';

COMMENT ON COLUMN m_activite_eco.an_eco_media.d_photo
    IS 'Date de la prise de vue';

COMMENT ON COLUMN m_activite_eco.an_eco_media.alaune
    IS 'Média poussé à la une de l''annonce immobilière';
	COMMENT ON COLUMN m_activite_eco.an_eco_media.alaunesite
    IS 'Média poussé à la une de la fiche de présentation du site';
    

-- ############################################################## [an_eco_lot_media] ##################################################################

-- Table: m_activite_eco.an_eco_lot_media

-- DROP TABLE m_activite_eco.an_eco_lot_media;

CREATE TABLE m_activite_eco.an_eco_lot_media
(
    gid integer NOT NULL DEFAULT nextval('m_activite_eco.an_eco_media_seq'::regclass),
    id integer COLLATE pg_catalog."default",
    media text COLLATE pg_catalog."default",
    miniature bytea,
    n_fichier text COLLATE pg_catalog."default",
    t_fichier text COLLATE pg_catalog."default",
    op_sai character varying(20) COLLATE pg_catalog."default",
    date_sai timestamp without time zone,
    l_doc character varying(100) COLLATE pg_catalog."default",
    t_doc character varying(2) COLLATE pg_catalog."default" DEFAULT '00'::character varying,
    d_photo timestamp without time zone,
    alaune boolean NOT NULL DEFAULT false,
	alaunesite boolean NOT NULL DEFAULT false,
    CONSTRAINT an_eco_media_pkey PRIMARY KEY (gid),
    CONSTRAINT an_eco_media_t_doc_fkey FOREIGN KEY (t_doc)
        REFERENCES m_activite_eco.lt_eco_tdocmedia (code) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE m_activite_eco.an_eco_lot_media
    OWNER to create_sig;

GRANT ALL ON TABLE m_activite_eco.an_eco_lot_media TO sig_create;

GRANT ALL ON TABLE m_activite_eco.an_eco_lot_media TO create_sig;

GRANT INSERT, SELECT, UPDATE, DELETE ON TABLE m_activite_eco.an_eco_lot_media TO sig_edit;

GRANT ALL ON TABLE m_activite_eco.an_eco_lot_media TO sig_stage WITH GRANT OPTION;

GRANT SELECT ON TABLE m_activite_eco.an_eco_lot_media TO sig_read;

COMMENT ON TABLE m_activite_eco.an_eco_lot_media
    IS 'Table gérant les documents intégrés pour la gestion des données des sites, lots et locaux et bâtiments d''activité';

COMMENT ON COLUMN m_activite_eco.an_eco_lot_media.gid
    IS 'Compteur (identifiant interne)';

COMMENT ON COLUMN m_activite_eco.an_eco_lot_media.id
    IS 'Identifiant interne non signifiant de l''objet saisi';

COMMENT ON COLUMN m_activite_eco.an_eco_lot_media.media
    IS 'Champ Média de GEO';

COMMENT ON COLUMN m_activite_eco.an_eco_lot_media.miniature
    IS 'Champ miniature de GEO';

COMMENT ON COLUMN m_activite_eco.an_eco_lot_media.n_fichier
    IS 'Nom du fichier';

COMMENT ON COLUMN m_activite_eco.an_eco_lot_media.t_fichier
    IS 'Type de média dans GEO';

COMMENT ON COLUMN m_activite_eco.an_eco_lot_media.op_sai
    IS 'Opérateur de saisie (par défaut login de connexion à GEO)';

COMMENT ON COLUMN m_activite_eco.an_eco_lot_media.date_sai
    IS 'Date de la saisie du document';

COMMENT ON COLUMN m_activite_eco.an_eco_lot_media.l_doc
    IS 'Titre du document ou légère description';

COMMENT ON COLUMN m_activite_eco.an_eco_lot_media.t_doc
    IS 'Type de documents';

COMMENT ON COLUMN m_activite_eco.an_eco_lot_media.d_photo
    IS 'Date de la prise de vue';

COMMENT ON COLUMN m_activite_eco.an_eco_lot_media.alaune
    IS 'Média poussé à la une de l''annonce immobilière';
	COMMENT ON COLUMN m_activite_eco.an_eco_lot_media.alaunesite
    IS 'Média poussé à la une de la fiche de présentation du site';

-- ############################################################## [an_eco_contact] ##################################################################

-- Table: m_activite_eco.an_eco_contact

-- DROP TABLE m_activite_eco.an_eco_contact;

CREATE TABLE m_activite_eco.an_eco_contact
(
    idcontact integer NOT NULL DEFAULT nextval('m_activite_eco.an_eco_contact_seq'::regclass),
    nom character varying(100) COLLATE pg_catalog."default",
    typcontact character varying(2) COLLATE pg_catalog."default",
    tel character varying(14) COLLATE pg_catalog."default",
    telp character varying(14) COLLATE pg_catalog."default",
    email character varying(100) COLLATE pg_catalog."default",
    date_sai timestamp without time zone,
    date_maj timestamp without time zone,
    op_sai character varying(80) COLLATE pg_catalog."default",
    epci character varying(10) COLLATE pg_catalog."default",
    observ character varying(1000) COLLATE pg_catalog."default",  
    idobjet character varying(10) COLLATE pg_catalog."default",
    idevenmt integer,
    CONSTRAINT an_eco_contact_pkey PRIMARY KEY (idcontact),
    CONSTRAINT lt_eco_typcontact_fkey FOREIGN KEY (typcontact)
        REFERENCES m_activite_eco.lt_eco_typcontact (code) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE m_activite_eco.an_eco_contact
    OWNER to create_sig;

GRANT ALL ON TABLE m_activite_eco.an_eco_contact TO sig_create;

GRANT SELECT ON TABLE m_activite_eco.an_eco_contact TO sig_read;

GRANT ALL ON TABLE m_activite_eco.an_eco_contact TO create_sig;

GRANT INSERT, SELECT, UPDATE, DELETE ON TABLE m_activite_eco.an_eco_contact TO sig_edit;

COMMENT ON TABLE m_activite_eco.an_eco_contact
    IS 'Table alphanumérique de l''ensemble des contacts liés à la thématique activité économique';

COMMENT ON COLUMN m_activite_eco.an_eco_contact.idcontact
    IS 'Identifiant unique non signifiant du contact';
    
    COMMENT ON COLUMN m_activite_eco.an_eco_contact.idevenmt
    IS 'Identifiant unique non signifiant de l''évènement (en attente résolution pb relation N..M dans Geo';


COMMENT ON COLUMN m_activite_eco.an_eco_contact.nom
    IS 'Libellé du contact (nom, prénom ou nom de l''entreprise)';

COMMENT ON COLUMN m_activite_eco.an_eco_contact.typcontact
    IS 'Type de contact';

COMMENT ON COLUMN m_activite_eco.an_eco_contact.tel
    IS 'Téléphone du contact';
    
    



COMMENT ON COLUMN m_activite_eco.an_eco_contact.telp
    IS 'Téléphone portable dui contact';
    
 
COMMENT ON COLUMN m_activite_eco.an_eco_contact.email
    IS 'Email du contact';   
    
COMMENT ON COLUMN m_activite_eco.an_eco_contact.date_sai
    IS 'Date de saisie des données attributaires';

COMMENT ON COLUMN m_activite_eco.an_eco_contact.date_maj
    IS 'Date de mise à jour des données attributaires';

COMMENT ON COLUMN m_activite_eco.an_eco_contact.op_sai
    IS 'Libellé de la personne ayant saisie l''objet initialisament';

COMMENT ON COLUMN m_activite_eco.an_eco_contact.epci
    IS 'Autorité compétente';

COMMENT ON COLUMN m_activite_eco.an_eco_contact.observ
    IS 'Observations diverses';
    
    COMMENT ON COLUMN m_activite_eco.an_eco_contact.idobjet
    IS 'Clé temporaire pour la relation direct dans GEO en attendant la correction sur les relations N..M';
    

-- Trigger: t_t1_an_eco_contact_delete

-- DROP TRIGGER t_t1_an_eco_contact_delete ON m_activite_eco.an_eco_contact;

CREATE TRIGGER t_t1_an_eco_contact_delete
    AFTER DELETE
    ON m_activite_eco.an_eco_contact
    FOR EACH ROW
    EXECUTE PROCEDURE m_activite_eco.ft_m_delete_an_eco_contact();
    
-- ############################################################## [an_eco_evenmt] ##################################################################

-- Table: m_activite_eco.an_eco_evenmt

-- DROP TABLE m_activite_eco.an_eco_evenmt;

CREATE TABLE m_activite_eco.an_eco_evenmt
(
    idevenmt integer NOT NULL DEFAULT nextval('m_activite_eco.an_eco_evenmt_seq'::regclass),
    idobjet character varying(10)  COLLATE pg_catalog."default",
    libelle character varying(254) COLLATE pg_catalog."default",
    typevenmt character varying(2) COLLATE pg_catalog."default",
    motif character varying(254) COLLATE pg_catalog."default",
    date_evenmt	timestamp without time zone,
    nom_contact character varying(100) COLLATE pg_catalog."default",	
    date_sai timestamp without time zone,
    date_maj timestamp without time zone,
    op_sai character varying(80) COLLATE pg_catalog."default",
    epci character varying(10) COLLATE pg_catalog."default",
    observ character varying(1000) COLLATE pg_catalog."default",
    CONSTRAINT an_eco_evenmt_pkey PRIMARY KEY (idevenmt),
    CONSTRAINT an_eco_evenmt_fkey FOREIGN KEY (typevenmt)
   	 REFERENCES m_activite_eco.lt_eco_typevenmt (code) MATCH SIMPLE
   	 ON UPDATE NO ACTION
   	 ON DELETE NO ACTION
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE m_activite_eco.an_eco_evenmt
    OWNER to create_sig;

GRANT ALL ON TABLE m_activite_eco.an_eco_evenmt TO sig_create;

GRANT SELECT ON TABLE m_activite_eco.an_eco_evenmt TO sig_read;

GRANT ALL ON TABLE m_activite_eco.an_eco_evenmt TO create_sig;

GRANT INSERT, SELECT, UPDATE, DELETE ON TABLE m_activite_eco.an_eco_evenmt TO sig_edit;

COMMENT ON TABLE m_activite_eco.an_eco_evenmt
    IS 'Table alphanumérique de l''ensemble des contacts liés à la thématique activité économique';

COMMENT ON COLUMN m_activite_eco.an_eco_evenmt.idevenmt
    IS 'Identifiant unique non signifiant du contact';


COMMENT ON COLUMN m_activite_eco.an_eco_evenmt.idobjet
    IS 'Identifiant de l''objet lié';

COMMENT ON COLUMN m_activite_eco.an_eco_evenmt.libelle
    IS 'Libellé de l''éveènement';

COMMENT ON COLUMN m_activite_eco.an_eco_evenmt.typevenmt
    IS 'Type d''évènement';

COMMENT ON COLUMN m_activite_eco.an_eco_evenmt.date_evenmt
    IS 'Date de l''évènement';


COMMENT ON COLUMN m_activite_eco.an_eco_evenmt.nom_contact
    IS 'Nom du contact';
    
COMMENT ON COLUMN m_activite_eco.an_eco_evenmt.date_sai
    IS 'Date de saisie des données attributaires';

COMMENT ON COLUMN m_activite_eco.an_eco_evenmt.date_maj
    IS 'Date de mise à jour des données attributaires';

COMMENT ON COLUMN m_activite_eco.an_eco_evenmt.op_sai
    IS 'Libellé de la personne ayant saisie l''objet initialisament';

COMMENT ON COLUMN m_activite_eco.an_eco_evenmt.epci
    IS 'Autorité compétente';

COMMENT ON COLUMN m_activite_eco.an_eco_evenmt.observ
    IS 'Observations diverses';

-- ############################################################## [an_eco_lot] ####################################################################

-- Table: m_activite_eco.an_eco_lot

-- DROP TABLE m_activite_eco.an_eco_lot;

CREATE TABLE m_activite_eco.an_eco_lot
(
    idgeolf integer NOT NULL,  
    surf integer,
    surf_l character varying(15) COLLATE pg_catalog."default",
    date_int date,
    op_sai character varying(80) COLLATE pg_catalog."default",
    org_sai character varying(80) COLLATE pg_catalog."default",
    tact character varying(2) COLLATE pg_catalog."default" DEFAULT '00'::character varying,
    tact_99 character varying(80) COLLATE pg_catalog."default",
    cnom character varying(20) COLLATE pg_catalog."default",
    lnom character varying(80) COLLATE pg_catalog."default",
    pvente_l character varying(15) COLLATE pg_catalog."default",
    pcess_l character varying(15) COLLATE pg_catalog."default",
    eff_dep integer,
    eff_n5 integer,
    conv boolean,
    datefin_conv date,
    observ character varying(255) COLLATE pg_catalog."default",
    date_sai timestamp without time zone,
    date_maj timestamp without time zone,
    bati integer,
    pc_depot timestamp without time zone,
    pc_accord timestamp without time zone,
    pc_tra timestamp without time zone,
    pc_fin timestamp without time zone,
    pvente_e numeric(10,2),
    pcess_e numeric(10,2),
    pc_num character varying(50) COLLATE pg_catalog."default",
    pc_mo character varying(100) COLLATE pg_catalog."default",
    pers_v character varying(10) COLLATE pg_catalog."default",
    oripro character varying(15) COLLATE pg_catalog."default",
    occupant character varying(100) COLLATE pg_catalog."default",
    descrip character varying(1000) COLLATE pg_catalog."default",
    insee character varying(30) COLLATE pg_catalog."default",
    commune character varying(250) COLLATE pg_catalog."default",
    epci character varying(10) COLLATE pg_catalog."default",
    CONSTRAINT an_sa_lot_pkey PRIMARY KEY (idgeolf),
    CONSTRAINT an_sa_lot_tact_fkey FOREIGN KEY (tact)
        REFERENCES m_activite_eco.lt_eco_tact (code) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE m_activite_eco.an_eco_lot
    OWNER to create_sig;

GRANT ALL ON TABLE m_activite_eco.an_eco_lot TO sig_create;

GRANT SELECT ON TABLE m_activite_eco.an_eco_lot TO sig_read;

GRANT ALL ON TABLE m_activite_eco.an_eco_lot TO create_sig;

GRANT INSERT, SELECT, UPDATE, DELETE ON TABLE m_activite_eco.an_eco_lot TO sig_edit;

COMMENT ON TABLE m_activite_eco.an_eco_lot
    IS 'Table alphanumérique contenant les données des lots à vocation économique';

COMMENT ON COLUMN m_activite_eco.an_eco_lot.idgeolf
    IS 'Identifiant unique de l''entité géographique lot';
    



COMMENT ON COLUMN m_activite_eco.an_eco_lot.surf
    IS 'Surface parcellaire occupée du lot';

COMMENT ON COLUMN m_activite_eco.an_eco_lot.surf_l
    IS 'Surface littérale parcellaire occupée du lot';

COMMENT ON COLUMN m_activite_eco.an_eco_lot.date_int
    IS 'Date renseignée par GéoPicardie lors de l''intégration (correspond aux dernières données reçues)';

COMMENT ON COLUMN m_activite_eco.an_eco_lot.op_sai
    IS 'Libellé de l''opérateur de saisie';

COMMENT ON COLUMN m_activite_eco.an_eco_lot.org_sai
    IS 'Libellé de l''organisme de saisie';

COMMENT ON COLUMN m_activite_eco.an_eco_lot.tact
    IS 'Type d''activité présent sur le lot';

COMMENT ON COLUMN m_activite_eco.an_eco_lot.tact_99
    IS 'Précision de l''activité du lot (si Autre sélectionné dans l_tact)';

COMMENT ON COLUMN m_activite_eco.an_eco_lot.cnom
    IS 'Nom de code de l''acquéreur';

COMMENT ON COLUMN m_activite_eco.an_eco_lot.lnom
    IS 'Nom de l''acquéreur';

COMMENT ON COLUMN m_activite_eco.an_eco_lot.pvente_l
    IS 'Prix littéral de vente du lot en HT (ex:50€/m²)';

COMMENT ON COLUMN m_activite_eco.an_eco_lot.pcess_l
    IS 'Prix littéral de cession du lot en HT (ex:30€/m²)';

COMMENT ON COLUMN m_activite_eco.an_eco_lot.eff_dep
    IS 'Effectif de départ prévu par l''implantation de l''établissement lors de l''octroi de la convention de subvention';

COMMENT ON COLUMN m_activite_eco.an_eco_lot.eff_n5
    IS 'Effectif prévu de l''établissement à n+5 par la convention d''octroi de subvention';

COMMENT ON COLUMN m_activite_eco.an_eco_lot.conv
    IS 'Accord ou non d''une convention d''octroi de subvention';

COMMENT ON COLUMN m_activite_eco.an_eco_lot.datefin_conv
    IS 'Date de fin de la convention d''octroi de subvention, liée à l''effectif n+5';

COMMENT ON COLUMN m_activite_eco.an_eco_lot.observ
    IS 'Observations diverses';

COMMENT ON COLUMN m_activite_eco.an_eco_lot.date_sai
    IS 'Date de saisie des données attributaires';

COMMENT ON COLUMN m_activite_eco.an_eco_lot.date_maj
    IS 'Date de mise à jour des données attributaires';

COMMENT ON COLUMN m_activite_eco.an_eco_lot.bati
    IS 'Surface de bâtiments projetée en m²';

COMMENT ON COLUMN m_activite_eco.an_eco_lot.pc_depot
    IS 'Date de dépôt du permis de construire';

COMMENT ON COLUMN m_activite_eco.an_eco_lot.pc_accord
    IS 'Date d''obtention du permis de construire';

COMMENT ON COLUMN m_activite_eco.an_eco_lot.pc_tra
    IS 'Date de commencement des travaux du permis de construire';

COMMENT ON COLUMN m_activite_eco.an_eco_lot.pc_fin
    IS 'Date de fin des travaux du permis de construire';

COMMENT ON COLUMN m_activite_eco.an_eco_lot.pvente_e
    IS 'Prix de vente (ou cession) envisagé du lot en HT (€/m²) par le service économique';

COMMENT ON COLUMN m_activite_eco.an_eco_lot.pcess_e
    IS 'Prix de cession du lot en HT(€/m²) - plus utilisé (cf prix de cession du foncier)';

COMMENT ON COLUMN m_activite_eco.an_eco_lot.pc_num
    IS 'N° du permis de construire';

COMMENT ON COLUMN m_activite_eco.an_eco_lot.pc_mo
    IS 'Nom du mapitre d''oeuvre (architecte) du PC';

COMMENT ON COLUMN m_activite_eco.an_eco_lot.pers_v
    IS 'Année de la perspective de vente ou de cession';

COMMENT ON COLUMN m_activite_eco.an_eco_lot.oripro
    IS 'Information sur l''origine du projet. 3 valeurs possibles ENDOGENE ou EXOGENE ou non renseignée (pas de listes de valeurs créées, cette liste est paramétrée dans GEO)';

COMMENT ON COLUMN m_activite_eco.an_eco_lot.occupant
    IS 'Libellé de l''occupant du terrain après cession';

COMMENT ON COLUMN m_activite_eco.an_eco_lot.descrip
    IS 'Descriptif du bâtiment construit sur le lot';

COMMENT ON COLUMN m_activite_eco.an_eco_lot.insee
    IS 'Code Insee du ou des communes';

COMMENT ON COLUMN m_activite_eco.an_eco_lot.commune
    IS 'Libellé de la ou des communes contenant le lot';

COMMENT ON COLUMN m_activite_eco.an_eco_lot.epci
    IS 'Autorité compétente';

-- ############################################################## [geo_eco_bati_act] ####################################################################

-- Table: m_activite_eco.geo_eco_bati_act

-- DROP TABLE m_activite_eco.geo_eco_bati_act;

CREATE TABLE m_activite_eco.geo_eco_bati_act
(
    idbati character varying(10) COLLATE pg_catalog."default" NOT NULL DEFAULT ('B'::text || nextval('m_activite_eco.geo_eco_bati_act_seq'::regclass)),
    libelle character varying(100) COLLATE pg_catalog."default",
    surf_p integer,
    op_sai character varying(80) COLLATE pg_catalog."default",
    src_geom character varying(2) COLLATE pg_catalog."default" DEFAULT '00'::character varying,
    sup_m2 double precision,
    date_sai timestamp without time zone,
    date_maj timestamp without time zone,
    observ character varying(1000) COLLATE pg_catalog."default",
    epci character varying(10) COLLATE pg_catalog."default",
    geom geometry(MultiPolygon,2154) NOT NULL,
    CONSTRAINT geo_eco_bati_act_pkey PRIMARY KEY (idbati),
    CONSTRAINT geo_eco_bati_act_geom_fkey FOREIGN KEY (src_geom)
        REFERENCES r_objet.lt_src_geom (code) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE m_activite_eco.geo_eco_bati_act
    OWNER to create_sig;

GRANT ALL ON TABLE m_activite_eco.geo_eco_bati_act TO sig_create;

GRANT ALL ON TABLE m_activite_eco.geo_eco_bati_act TO create_sig;

GRANT INSERT, SELECT, UPDATE, DELETE ON TABLE m_activite_eco.geo_eco_bati_act TO sig_edit;

GRANT ALL ON TABLE m_activite_eco.geo_eco_bati_act TO sig_stage WITH GRANT OPTION;

GRANT SELECT ON TABLE m_activite_eco.geo_eco_bati_act TO sig_read;

COMMENT ON TABLE m_activite_eco.geo_eco_bati_act
    IS 'Données géographiques contenant les bâtiments d''activités identifiés';

COMMENT ON COLUMN m_activite_eco.geo_eco_bati_act.idbati
    IS 'Identifiant unique de l''objet';

COMMENT ON COLUMN m_activite_eco.geo_eco_bati_act.libelle
    IS 'Nom usuel du bâtiment';

COMMENT ON COLUMN m_activite_eco.geo_eco_bati_act.surf_p
    IS 'Surface de plancher';

COMMENT ON COLUMN m_activite_eco.geo_eco_bati_act.op_sai
    IS 'Opérateur de saisir d''objet à l''ARC';

COMMENT ON COLUMN m_activite_eco.geo_eco_bati_act.src_geom
    IS 'Référentiel spatial de saisie';

COMMENT ON COLUMN m_activite_eco.geo_eco_bati_act.sup_m2
    IS 'Surface totale de l''objet en m²';

COMMENT ON COLUMN m_activite_eco.geo_eco_bati_act.date_sai
    IS 'Date de saisie de l''objet';

COMMENT ON COLUMN m_activite_eco.geo_eco_bati_act.date_maj
    IS 'Date de mise à jour';

COMMENT ON COLUMN m_activite_eco.geo_eco_bati_act.epci
    IS 'Autorité compétente';

COMMENT ON COLUMN m_activite_eco.geo_eco_bati_act.geom
    IS 'Champ contenant la géométrie';

-- Trigger: t_t1_geo_eco_bati_act_bati_site_delete

-- DROP TRIGGER t_t1_geo_eco_bati_act_bati_site_delete ON m_activite_eco.geo_eco_bati_act;

CREATE TRIGGER t_t1_geo_eco_bati_act_bati_site_delete
    AFTER DELETE
    ON m_activite_eco.geo_eco_bati_act
    FOR EACH ROW
    EXECUTE PROCEDURE m_activite_eco.ft_m_delete_bati_site();

-- Trigger: t_t1_geo_eco_bati_site_insert

-- DROP TRIGGER t_t1_geo_eco_bati_site_insert ON m_activite_eco.geo_eco_bati_act;

CREATE TRIGGER t_t1_geo_eco_bati_site_insert
    BEFORE INSERT
    ON m_activite_eco.geo_eco_bati_act
    FOR EACH ROW
    EXECUTE PROCEDURE m_activite_eco.ft_m_insert_bati_site();
    
-- Trigger: t_t2_geo_eco_bati_site_delete

-- DROP TRIGGER t_t2_geo_eco_bati_site_delete ON m_activite_eco.geo_eco_bati_act;

CREATE TRIGGER t_t2_geo_eco_bati_site_delete
    AFTER DELETE
    ON m_activite_eco.geo_eco_bati_act
    FOR EACH ROW
    EXECUTE PROCEDURE m_activite_eco.ft_m_delete_bati_site();

-- ############################################################## [geo_eco_loc_act] ####################################################################

-- Table: m_activite_eco.geo_eco_loc_act

-- DROP TABLE m_activite_eco.geo_eco_loc_act;

CREATE TABLE m_activite_eco.geo_eco_loc_act
(
    idloc character varying(10) NOT NULL DEFAULT 'L' || nextval('m_activite_eco.geo_eco_loc_act_seq'::regclass),
    libelle character varying(100) COLLATE pg_catalog."default",
    typ character varying(2) COLLATE pg_catalog."default",
    adresse_b boolean NOT NULL DEFAULT false,
    adresse_a character varying(100) COLLATE pg_catalog."default",
    surf_p integer,
    descript character varying(5000) COLLATE pg_catalog."default", 
    occup character varying(2) COLLATE pg_catalog."default" DEFAULT '00'::character varying,
    pvente integer,
    pventem2 double precision,
    loyer integer,
    loyerm2 double precision,
    occupant character varying(80) COLLATE pg_catalog."default",
    l_url character varying(254) COLLATE pg_catalog."default",
    sourceloc character varying(254) COLLATE pg_catalog."default",
    op_sai character varying(80) COLLATE pg_catalog."default",
    src_geom character varying(2) COLLATE pg_catalog."default" DEFAULT '00'::character varying,
    sup_m2 double precision,
    date_sai timestamp without time zone,
    date_maj timestamp without time zone,
    observ character varying(1000) COLLATE pg_catalog."default",
    epci character varying(10) COLLATE pg_catalog."default",
    geom geometry(MultiPolygon,2154) NOT NULL,
    CONSTRAINT geo_eco_loc_act_pkey PRIMARY KEY (idloc),
       CONSTRAINT geo_eco_loc_act_typ_fkey FOREIGN KEY (typ)
        REFERENCES m_activite_eco.lt_eco_typloc (code) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
        CONSTRAINT geo_eco_loc_act_occup_fkey FOREIGN KEY (occup)
        REFERENCES m_activite_eco.lt_eco_occuploc (code) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE m_activite_eco.geo_eco_loc_act
    OWNER to create_sig;

GRANT SELECT ON TABLE m_activite_eco.geo_eco_loc_act TO sig_read;

GRANT ALL ON TABLE m_activite_eco.geo_eco_loc_act TO sig_create;

GRANT ALL ON TABLE m_activite_eco.geo_eco_loc_act TO create_sig;

GRANT INSERT, SELECT, UPDATE, DELETE ON TABLE m_activite_eco.geo_eco_loc_act TO sig_edit;

COMMENT ON TABLE m_activite_eco.geo_eco_loc_act
    IS 'Données géographiques contenant les locaux d''activités identifiés';

COMMENT ON COLUMN m_activite_eco.geo_eco_loc_act.idloc
    IS 'Identifiant unique de l''objet';

COMMENT ON COLUMN m_activite_eco.geo_eco_loc_act.op_sai
    IS 'Opérateur de saisir d''objet à l''ARC';

COMMENT ON COLUMN m_activite_eco.geo_eco_loc_act.src_geom
    IS 'Référentiel spatial de saisie';

COMMENT ON COLUMN m_activite_eco.geo_eco_loc_act.sup_m2
    IS 'Surface totale de l''objet en m²';
    
    COMMENT ON COLUMN m_activite_eco.geo_eco_loc_act.sourceloc
    IS 'Source des informations du local';

COMMENT ON COLUMN m_activite_eco.geo_eco_loc_act.geom
    IS 'Champ contenant la géométrie';

COMMENT ON COLUMN m_activite_eco.geo_eco_loc_act.date_sai
    IS 'Date de saisie de l''objet';

COMMENT ON COLUMN m_activite_eco.geo_eco_loc_act.date_maj
    IS 'Date de mise à jour';

COMMENT ON COLUMN m_activite_eco.geo_eco_loc_act.l_url
    IS 'Lien URL vers une référen ce externe';

COMMENT ON COLUMN m_activite_eco.geo_eco_loc_act.libelle
    IS 'Nom usuel du local';
    
COMMENT ON COLUMN m_activite_eco.geo_eco_loc_act.typ
    IS 'Type de local';
    
COMMENT ON COLUMN m_activite_eco.geo_eco_loc_act.adresse_b
    IS 'Adresse commune entre bâtiment et local';

COMMENT ON COLUMN m_activite_eco.geo_eco_loc_act.adresse_a
    IS 'Adresse libre si inexistante dans la BAL (adresse non conforme, lieux-dit, ...)';
    
COMMENT ON COLUMN m_activite_eco.geo_eco_loc_act.descript
    IS 'Elément descriptif du local';
    
COMMENT ON COLUMN m_activite_eco.geo_eco_loc_act.occup
    IS 'Type d''occupation du local';
    
COMMENT ON COLUMN m_activite_eco.geo_eco_loc_act.pvente
    IS 'Prix de vente en € du local';
    
COMMENT ON COLUMN m_activite_eco.geo_eco_loc_act.pventem2
    IS 'Prix de vente au m² en € du local';
    
COMMENT ON COLUMN m_activite_eco.geo_eco_loc_act.loyer
    IS 'Loyer mensuel en € du local';
    
COMMENT ON COLUMN m_activite_eco.geo_eco_loc_act.loyerm2
    IS 'Loyer mensuel au m² en € du local';

COMMENT ON COLUMN m_activite_eco.geo_eco_loc_act.occupant
    IS 'Libellé de l''occupant si établissement non lié';
    
COMMENT ON COLUMN m_activite_eco.geo_eco_loc_act.surf_p
    IS 'Surface de plancher';
    
COMMENT ON COLUMN m_activite_eco.geo_eco_loc_act.epci
    IS 'Autorité compétente';
    
-- ############################################################## [geo_eco_loc_patri] ####################################################################

-- Table: m_activite_eco.geo_eco_loc_patri

-- DROP TABLE m_activite_eco.geo_eco_loc_patri;

CREATE TABLE m_activite_eco.geo_eco_loc_patri
(
    idpatri character varying(10) NOT NULL DEFAULT 'P' || nextval('m_activite_eco.geo_eco_loc_patri_seq'::regclass),
    libelle character varying(100) COLLATE pg_catalog."default",
    a_const integer,
    loyer double precision,	
    descript character varying(5000) COLLATE pg_catalog."default", 
    l_url character varying(254) COLLATE pg_catalog."default",
    op_sai character varying(80) COLLATE pg_catalog."default",
    src_geom character varying(2) COLLATE pg_catalog."default" DEFAULT '00'::character varying,
    sup_m2 double precision,
    date_sai timestamp without time zone,
    date_maj timestamp without time zone,
    observ character varying(1000) COLLATE pg_catalog."default",
    epci character varying(10) COLLATE pg_catalog."default",
    geom geometry(MultiPolygon,2154) NOT NULL,
    CONSTRAINT geo_eco_loc_patri_pkey PRIMARY KEY (idpatri)

)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE m_activite_eco.geo_eco_loc_patri
    OWNER to create_sig;

GRANT SELECT ON TABLE m_activite_eco.geo_eco_loc_patri TO sig_read;

GRANT ALL ON TABLE m_activite_eco.geo_eco_loc_patri TO sig_create;

GRANT ALL ON TABLE m_activite_eco.geo_eco_loc_patri TO create_sig;

GRANT INSERT, SELECT, UPDATE, DELETE ON TABLE m_activite_eco.geo_eco_loc_patri TO sig_edit;

COMMENT ON TABLE m_activite_eco.geo_eco_loc_patri
    IS 'Données géographiques contenant les locaux d''activités identifiés';

COMMENT ON COLUMN m_activite_eco.geo_eco_loc_patri.idpatri
    IS 'Identifiant unique de l''objet';

COMMENT ON COLUMN m_activite_eco.geo_eco_loc_patri.op_sai
    IS 'Opérateur de saisir d''objet à l''ARC';

COMMENT ON COLUMN m_activite_eco.geo_eco_loc_patri.src_geom
    IS 'Référentiel spatial de saisie';

COMMENT ON COLUMN m_activite_eco.geo_eco_loc_patri.sup_m2
    IS 'Surface totale de l''objet en m²';

COMMENT ON COLUMN m_activite_eco.geo_eco_loc_patri.geom
    IS 'Champ contenant la géométrie';

COMMENT ON COLUMN m_activite_eco.geo_eco_loc_patri.loyer
    IS 'Loyer mensuel';

COMMENT ON COLUMN m_activite_eco.geo_eco_loc_patri.date_sai
    IS 'Date de saisie de l''objet';

COMMENT ON COLUMN m_activite_eco.geo_eco_loc_patri.a_const
    IS 'Année de construction';

COMMENT ON COLUMN m_activite_eco.geo_eco_loc_patri.date_maj
    IS 'Date de mise à jour';

COMMENT ON COLUMN m_activite_eco.geo_eco_loc_patri.l_url
    IS 'Lien URL vers une référen ce externe';
    
COMMENT ON COLUMN m_activite_eco.geo_eco_loc_patri.libelle
    IS 'Nom usuel du local';

    
COMMENT ON COLUMN m_activite_eco.geo_eco_loc_patri.descript
    IS 'Elément descriptif du local';
    
COMMENT ON COLUMN m_activite_eco.geo_eco_loc_patri.epci
    IS 'Autorité compétente';
    

-- ############################################################## [an_eco_patri_media] ##################################################################

-- Table: m_activite_eco.an_eco_patri_media

-- DROP TABLE m_activite_eco.an_eco_patri_media;

CREATE TABLE m_activite_eco.an_eco_patri_media
(
    gid integer NOT NULL DEFAULT nextval('m_activite_eco.an_eco_patri_media_seq'::regclass),
    id text COLLATE pg_catalog."default",
    media text COLLATE pg_catalog."default",
    miniature bytea,
    n_fichier text COLLATE pg_catalog."default",
    t_fichier text COLLATE pg_catalog."default",
    op_sai character varying(20) COLLATE pg_catalog."default",
    date_sai timestamp without time zone,
    l_doc character varying(100) COLLATE pg_catalog."default",
    t_doc character varying(2) COLLATE pg_catalog."default" DEFAULT '00',		
    CONSTRAINT an_eco_patri_media_pkey PRIMARY KEY (gid),
    CONSTRAINT an_eco_patri_media_t_doc_fkey FOREIGN KEY (t_doc)
    REFERENCES m_activite_eco.lt_eco_tdocmedia (code) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE m_activite_eco.an_eco_patri_media
    OWNER to create_sig;

GRANT ALL ON TABLE m_activite_eco.an_eco_patri_media TO sig_create;

GRANT SELECT ON TABLE m_activite_eco.an_eco_patri_media TO sig_read;

GRANT ALL ON TABLE m_activite_eco.an_eco_patri_media TO create_sig;

GRANT INSERT, SELECT, UPDATE, DELETE ON TABLE m_activite_eco.an_eco_patri_media TO sig_edit;

COMMENT ON TABLE m_activite_eco.an_eco_patri_media
    IS 'Table gérant les documents intégrés pour la gestion des données des locaux du patrimoine';

COMMENT ON COLUMN m_activite_eco.an_eco_patri_media.id
    IS 'Identifiant interne non signifiant de l''objet saisi';

COMMENT ON COLUMN m_activite_eco.an_eco_patri_media.media
    IS 'Champ Média de GEO';

COMMENT ON COLUMN m_activite_eco.an_eco_patri_media.miniature
    IS 'Champ miniature de GEO';

COMMENT ON COLUMN m_activite_eco.an_eco_patri_media.n_fichier
    IS 'Nom du fichier';

COMMENT ON COLUMN m_activite_eco.an_eco_patri_media.t_fichier
    IS 'Type de média dans GEO';

COMMENT ON COLUMN m_activite_eco.an_eco_patri_media.op_sai
    IS 'Opérateur de saisie (par défaut login de connexion à GEO)';

COMMENT ON COLUMN m_activite_eco.an_eco_patri_media.date_sai
    IS 'Date de la saisie du document';

COMMENT ON COLUMN m_activite_eco.an_eco_patri_media.l_doc
    IS 'Titre du document ou légère description';
    
    
COMMENT ON COLUMN m_activite_eco.an_eco_patri_media.t_doc
    IS 'Type de document';


COMMENT ON COLUMN m_activite_eco.an_eco_patri_media.gid
    IS 'Compteur (identifiant interne)';
    

-- ############################################################## [an_eco_evenmt_media] ##################################################################

-- Table: m_activite_eco.an_eco_evenmt_media

-- DROP TABLE m_activite_eco.an_eco_evenmt_media;

CREATE TABLE m_activite_eco.an_eco_evenmt_media
(
    gid integer NOT NULL DEFAULT nextval('m_activite_eco.an_eco_evenmt_media_seq'::regclass),
    id integer,
    media text COLLATE pg_catalog."default",
    miniature bytea,
    n_fichier text COLLATE pg_catalog."default",
    t_fichier text COLLATE pg_catalog."default",
    op_sai character varying(20) COLLATE pg_catalog."default",
    date_sai timestamp without time zone,
    l_doc character varying(100) COLLATE pg_catalog."default",
    t_doc character varying(2) COLLATE pg_catalog."default" DEFAULT '00',		
    CONSTRAINT an_eco_evenmt_media_pkey PRIMARY KEY (gid),
    CONSTRAINT an_eco_evenmt_media_t_doc_fkey FOREIGN KEY (t_doc)
    REFERENCES m_activite_eco.lt_eco_tdocmedia (code) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE m_activite_eco.an_eco_evenmt_media
    OWNER to create_sig;

GRANT ALL ON TABLE m_activite_eco.an_eco_evenmt_media TO sig_create;

GRANT SELECT ON TABLE m_activite_eco.an_eco_evenmt_media TO sig_read;

GRANT ALL ON TABLE m_activite_eco.an_eco_evenmt_media TO create_sig;

GRANT INSERT, SELECT, UPDATE, DELETE ON TABLE m_activite_eco.an_eco_evenmt_media TO sig_edit;

COMMENT ON TABLE m_activite_eco.an_eco_evenmt_media
    IS 'Table gérant les documents intégrés en lien avec un évènement';

COMMENT ON COLUMN m_activite_eco.an_eco_evenmt_media.id
    IS 'Identifiant interne non signifiant de l''objet saisi';

COMMENT ON COLUMN m_activite_eco.an_eco_evenmt_media.media
    IS 'Champ Média de GEO';

COMMENT ON COLUMN m_activite_eco.an_eco_evenmt_media.miniature
    IS 'Champ miniature de GEO';

COMMENT ON COLUMN m_activite_eco.an_eco_evenmt_media.n_fichier
    IS 'Nom du fichier';

COMMENT ON COLUMN m_activite_eco.an_eco_evenmt_media.t_fichier
    IS 'Type de média dans GEO';

COMMENT ON COLUMN m_activite_eco.an_eco_evenmt_media.op_sai
    IS 'Opérateur de saisie (par défaut login de connexion à GEO)';

COMMENT ON COLUMN m_activite_eco.an_eco_evenmt_media.date_sai
    IS 'Date de la saisie du document';

COMMENT ON COLUMN m_activite_eco.an_eco_evenmt_media.l_doc
    IS 'Titre du document ou légère description';
COMMENT ON COLUMN m_activite_eco.an_eco_evenmt_media.t_doc
    IS 'Type de document';

COMMENT ON COLUMN m_activite_eco.an_eco_evenmt_media.gid
    IS 'Compteur (identifiant interne)';

-- ############################################################## [an_eco_etab] ##################################################################

-- Table: m_activite_eco.an_eco_etab

-- DROP TABLE m_activite_eco.an_eco_etab;

CREATE TABLE m_activite_eco.an_eco_etab
(
    id integer NOT NULL DEFAULT nextval('m_activite_eco.an_eco_etab_seq'::regclass),
    idgeoet integer NOT NULL,
    idsiren character varying(9) COLLATE pg_catalog."default" NOT NULL,
    idsiret character varying(14) COLLATE pg_catalog."default",
    l_nom character varying(255) COLLATE pg_catalog."default",
    n_adres character varying(255) COLLATE pg_catalog."default",
    eff_ent integer,
    eff_etab integer,
    eff_ent_etp double precision,
    eff_etab_etp double precision,
    eff_etab_d character varying(200) COLLATE pg_catalog."default",
    source_eff character varying(50) COLLATE pg_catalog."default",
    annee_eff integer,
    l_date_eff date,
    l_compte boolean DEFAULT true,
    apet700 character varying(255) COLLATE pg_catalog."default",
    libapet character varying(255) COLLATE pg_catalog."default",
    l_url character varying(500) COLLATE pg_catalog."default",
    l_url_bil character varying(500) COLLATE pg_catalog."default",
    dentree timestamp without time zone,
    dsortie timestamp without time zone,
    etatadministratifetablissement character varying(1) COLLATE pg_catalog."default",
    old_siret character varying(14) COLLATE pg_catalog."default",
    old_id integer, 
    date_int date,
    observ character varying(255) COLLATE pg_catalog."default",
    op_sai character varying(80) COLLATE pg_catalog."default",
    date_sai timestamp without time zone,
    date_maj timestamp without time zone,
    epci character varying(10) COLLATE pg_catalog."default",
    CONSTRAINT an_eco_etab_pkey PRIMARY KEY (id)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE m_activite_eco.an_eco_etab
    OWNER to create_sig;

GRANT ALL ON TABLE m_activite_eco.an_eco_etab TO sig_create;

GRANT ALL ON TABLE m_activite_eco.an_eco_etab TO create_sig;

GRANT SELECT ON TABLE m_activite_eco.an_eco_etab TO sig_read;

GRANT INSERT, SELECT, UPDATE, DELETE ON TABLE m_activite_eco.an_eco_etab TO sig_edit;

COMMENT ON TABLE m_activite_eco.an_eco_etab
    IS 'Données métiers sur les établissements';

COMMENT ON COLUMN m_activite_eco.an_eco_etab.idgeoet
    IS 'Identifiant unique géographique';

COMMENT ON COLUMN m_activite_eco.an_eco_etab.idsiren
    IS 'Numéro SIRENE de l''établissement';

COMMENT ON COLUMN m_activite_eco.an_eco_etab.idsiret
    IS 'Numéro SIRET de l''établissement';

COMMENT ON COLUMN m_activite_eco.an_eco_etab.date_int
    IS 'Date renseignée par GéoPicardie lors de l''intégration du fichier dans la base (correspond aux dernières données reçues)';

COMMENT ON COLUMN m_activite_eco.an_eco_etab.op_sai
    IS 'Libellé de l''opérateur de Saisie';

COMMENT ON COLUMN m_activite_eco.an_eco_etab.l_nom
    IS 'Libellé du nom de l''établissement spécifique si différent du nom SIRENE (nom usuel du service économie)';

COMMENT ON COLUMN m_activite_eco.an_eco_etab.n_adres
    IS 'Libellé de la nouvelle adresse si l''établissement a déménagé';

COMMENT ON COLUMN m_activite_eco.an_eco_etab.eff_ent
    IS 'Effectif total du groupe';

COMMENT ON COLUMN m_activite_eco.an_eco_etab.eff_etab
    IS 'Effectif total de l''établissement';

COMMENT ON COLUMN m_activite_eco.an_eco_etab.eff_ent_etp
    IS 'Effectif total du groupe en etp';

COMMENT ON COLUMN m_activite_eco.an_eco_etab.eff_etab_etp
    IS 'Effectif de l''établissement en etp';

COMMENT ON COLUMN m_activite_eco.an_eco_etab.source_eff
    IS 'Source de l''effectif de l''établissement';

COMMENT ON COLUMN m_activite_eco.an_eco_etab.annee_eff
    IS 'Année de l''effectif (issu de SIRENE)';

COMMENT ON COLUMN m_activite_eco.an_eco_etab.l_date_eff
    IS 'Date de l''effectif saisie par l''ARC';

COMMENT ON COLUMN m_activite_eco.an_eco_etab.observ
    IS 'Commentaires';

COMMENT ON COLUMN m_activite_eco.an_eco_etab.date_sai
    IS 'Date de saisie des données attributaires';

COMMENT ON COLUMN m_activite_eco.an_eco_etab.date_maj
    IS 'Date de mise à jour des données attributaires';

COMMENT ON COLUMN m_activite_eco.an_eco_etab.l_compte
    IS 'Prise en compte de l''établissement pour le calcul des statistiques (nombre d''établissements et effectifs) dans les informations de synthèse.
Par défaut TRUE et laisse le choix à l''administrateur de la donnée de modifier cette valeur.';

COMMENT ON COLUMN m_activite_eco.an_eco_etab.l_url
    IS 'Lien du site internet de l''entreprise';

COMMENT ON COLUMN m_activite_eco.an_eco_etab.l_url_bil
    IS 'Lien vers le bilan en ligne de l''entreprise';


COMMENT ON COLUMN m_activite_eco.an_eco_etab.apet700
    IS 'Code d''activité de l''établissement (issu de SIRENE et mis à jour lors de la mise à jour de SIRENE)';

COMMENT ON COLUMN m_activite_eco.an_eco_etab.libapet
    IS 'Libellé de l''activité de l''établissement (issu de SIRENE et mis à jour lors de la mise à jour de SIRENE)';

COMMENT ON COLUMN m_activite_eco.an_eco_etab.eff_etab_d
    IS 'Précision (en détail) du nombre de CDD, CDI, intérim, ....';

COMMENT ON COLUMN m_activite_eco.an_eco_etab.id
    IS 'Identifiant unique interne';

COMMENT ON COLUMN m_activite_eco.an_eco_etab.dentree
    IS 'Date d''entrée dans le fichier SIRENE';

COMMENT ON COLUMN m_activite_eco.an_eco_etab.dsortie
    IS 'Date de sortie du fichier SIRENE';

COMMENT ON COLUMN m_activite_eco.an_eco_etab.etatadministratifetablissement
    IS 'Etat administratif de l''établissement dans le fichier SIEREN (attribut déjà présent dans SIRENE mais dupliqué ici pour le filtrage dans GEO, améliore les performances sans passer par une vue)';

COMMENT ON COLUMN m_activite_eco.an_eco_etab.old_siret
    IS 'Attribut de gestion servant uniquement temporairement à la récupération des contacts d''un ancien établissement qui aurait disparu pour les remettre dans le nouveau. Cet attribut est vidé parès mise à jour';

COMMENT ON COLUMN m_activite_eco.an_eco_etab.old_id
    IS 'Attribut de gestion servant uniquement temporairement à la récupération des contacts d''un établissement spécifique non présent dans SIRENE mais apparu par la suite. Cet attribut est vidé parès mise à jour';


-- Trigger: t_t1_an_sa_etab_date_maj

-- DROP TRIGGER t_t1_an_sa_etab_date_maj ON m_activite_eco.an_eco_etab;

CREATE TRIGGER t_t1_an_sa_etab_date_maj
    BEFORE UPDATE 
    ON m_activite_eco.an_eco_etab
    FOR EACH ROW
    EXECUTE PROCEDURE public.ft_r_timestamp_maj();

-- Trigger: t_t1_l_nom_null

-- DROP TRIGGER t_t1_l_nom_null ON m_activite_eco.an_eco_etab;

CREATE TRIGGER t_t1_l_nom_null
    AFTER UPDATE 
    ON m_activite_eco.an_eco_etab
    FOR EACH ROW
    EXECUTE PROCEDURE m_activite_eco.ft_m_an_sa_etab_l_nom_null();


-- Trigger: t_t4_an_sa_etab_oldsiret

-- DROP TRIGGER t_t4_an_sa_etab_oldsiret ON m_activite_eco.an_eco_etab;

CREATE TRIGGER t_t4_an_sa_etab_oldsiret
    AFTER UPDATE OF old_siret, old_id
    ON m_activite_eco.an_eco_etab
    FOR EACH ROW
    EXECUTE PROCEDURE m_activite_eco.ft_m_an_sa_etab_oldsiret();

-- Trigger: t_t5_an_sa_etab_lcompte_local

-- DROP TRIGGER t_t5_an_sa_etab_lcompte_local ON m_activite_eco.an_eco_etab;

CREATE TRIGGER t_t5_an_sa_etab_lcompte_local
    AFTER UPDATE OF l_compte
    ON m_activite_eco.an_eco_etab
    FOR EACH ROW
    EXECUTE PROCEDURE m_activite_eco.ft_m_etiquette_local();

-- ############################################################## [an_eco_etab_rad] ##################################################################

-- Table: m_activite_eco.an_eco_etab_rad

-- DROP TABLE m_activite_eco.an_eco_etab_rad;

CREATE TABLE m_activite_eco.an_eco_etab_rad
(
    gid integer NOT NULL DEFAULT nextval('m_activite_eco.an_eco_etab_rad_seq'::regclass),
    siren character varying(9) COLLATE pg_catalog."default",
    date_rad timestamp without time zone,
    CONSTRAINT an_eco_etab_rad_pkey PRIMARY KEY (gid)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE m_activite_eco.an_eco_etab_rad
    OWNER to create_sig;

GRANT ALL ON TABLE m_activite_eco.an_eco_etab_rad TO sig_create;

GRANT ALL ON TABLE m_activite_eco.an_eco_etab_rad TO create_sig;

GRANT SELECT ON TABLE m_activite_eco.an_eco_etab_rad TO sig_read;

GRANT INSERT, SELECT, UPDATE, DELETE ON TABLE m_activite_eco.an_eco_etab_rad TO sig_edit;

COMMENT ON TABLE m_activite_eco.an_eco_etab_rad
    IS 'Table alphanumérique contenant les SIREN des unités légales radiées (informations issues des fichiers OpenData de 2012 au 23/11/2021 du site InfoGreffe)';

COMMENT ON COLUMN m_activite_eco.an_eco_etab_rad.gid
    IS 'Identifiant unique interne';

COMMENT ON COLUMN m_activite_eco.an_eco_etab_rad.siren
    IS 'Identifiant SIRNE de l''unité légale';

COMMENT ON COLUMN m_activite_eco.an_eco_etab_rad.date_rad
    IS 'Date de la radiation';
    
-- ############################################################## [an_eco_dia] ####################################################################    

-- Table: m_activite_eco.an_eco_dia

-- DROP TABLE m_activite_eco.an_eco_dia;

CREATE TABLE m_activite_eco.an_eco_dia
(
    gid integer NOT NULL DEFAULT nextval('m_activite_eco.an_eco_dia_seq'::regclass),
    idgeolf integer NOT NULL,
    num_dia character varying(25) COLLATE pg_catalog."default",
    date_dia timestamp without time zone,
    prix_v double precision,
    nom_v character varying(80) COLLATE pg_catalog."default",
    nom_a character varying(80) COLLATE pg_catalog."default",
    CONSTRAINT an_sa_dia_pkey PRIMARY KEY (gid)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE m_activite_eco.an_eco_dia
    OWNER to create_sig;

GRANT ALL ON TABLE m_activite_eco.an_eco_dia TO sig_create;

GRANT ALL ON TABLE m_activite_eco.an_eco_dia TO create_sig;

GRANT SELECT ON TABLE m_activite_eco.an_eco_dia TO sig_read;

GRANT INSERT, SELECT, UPDATE, DELETE ON TABLE m_activite_eco.an_eco_dia TO sig_edit;

COMMENT ON TABLE m_activite_eco.an_eco_dia
    IS 'Table alphanumérique contenant le suivi des DIA pour les lots à vocation économique (la gestion des DIA est géré par un outil d''OPERIS mais sans pouvoir récupérer les données brutes pour le moment)';

COMMENT ON COLUMN m_activite_eco.an_eco_dia.gid
    IS 'Identifiant unique interne';

COMMENT ON COLUMN m_activite_eco.an_eco_dia.idgeolf
    IS 'Identifiant unique de l''entité géographique lot';

COMMENT ON COLUMN m_activite_eco.an_eco_dia.num_dia
    IS 'Numéro de la DIA';

COMMENT ON COLUMN m_activite_eco.an_eco_dia.date_dia
    IS 'Date de la dernière DIA';

COMMENT ON COLUMN m_activite_eco.an_eco_dia.prix_v
    IS 'Prix de vente en euros';

COMMENT ON COLUMN m_activite_eco.an_eco_dia.nom_v
    IS 'Nom du vendeur';

COMMENT ON COLUMN m_activite_eco.an_eco_dia.nom_a
    IS 'Nom de l''acquéreur (seconde main)';

-- ############################################################## [geo_eco_etabp] ####################################################################    

-- Table: m_activite_eco.geo_eco_etabp

-- DROP TABLE m_activite_eco.geo_eco_etabp;

CREATE TABLE m_activite_eco.geo_eco_etabp
(
    idgeoet integer NOT NULL,
    idsiren character varying(9) COLLATE pg_catalog."default",
    idsiret character varying(14) COLLATE pg_catalog."default",
    idsite character varying(10) COLLATE pg_catalog."default",
    date_sai timestamp without time zone DEFAULT now(),
    op_sai character varying(80) COLLATE pg_catalog."default",
    org_sai character varying(80) COLLATE pg_catalog."default",
    l_nom character varying(255) COLLATE pg_catalog."default",
    eff_etab integer,
    source_eff character varying(50) COLLATE pg_catalog."default",
    date_eff date,
    l_ape character varying(5) COLLATE pg_catalog."default",
    l_nom_dir character varying(50) COLLATE pg_catalog."default",
    date_maj_dir date,
    source_maj_dir character varying(50) COLLATE pg_catalog."default",
    l_tel character varying(15) COLLATE pg_catalog."default",
    l_mail character varying(80) COLLATE pg_catalog."default",
    l_observ character varying(255) COLLATE pg_catalog."default",
    geom geometry(Point,2154) NOT NULL,
    date_maj timestamp without time zone,
    l_compte boolean DEFAULT true,
    l_tel_dir character varying(15) COLLATE pg_catalog."default",
    l_telp_dir character varying(15) COLLATE pg_catalog."default",
    l_mail_dir character varying(80) COLLATE pg_catalog."default",
    l_nom_drh character varying(255) COLLATE pg_catalog."default",
    l_tel_drh character varying(15) COLLATE pg_catalog."default",
    l_mail_drh character varying(80) COLLATE pg_catalog."default",
    l_nom_ad character varying(255) COLLATE pg_catalog."default",
    l_tel_ad character varying(15) COLLATE pg_catalog."default",
    l_mail_ad character varying(80) COLLATE pg_catalog."default",
    l_url character varying(500) COLLATE pg_catalog."default",
    l_url_bil character varying(500) COLLATE pg_catalog."default",
    l_comp_ad character varying(100) COLLATE pg_catalog."default",
    src_geom character varying(2) COLLATE pg_catalog."default" DEFAULT '20'::character varying,
    insee character varying(5) COLLATE pg_catalog."default",
    commune character varying(80) COLLATE pg_catalog."default",
    l_titre character varying(100) COLLATE pg_catalog."default",
    eff_etab_d character varying(200) COLLATE pg_catalog."default",
    l_nom_aut character varying(255) COLLATE pg_catalog."default",
    l_titre_aut character varying(255) COLLATE pg_catalog."default",
    l_tel_aut character varying(15) COLLATE pg_catalog."default",
    l_mail_aut character varying(80) COLLATE pg_catalog."default",
    date_maj_drh timestamp without time zone,
    date_maj_ad timestamp without time zone,
    date_maj_aut timestamp without time zone,
    l_titre_drh character varying(100) COLLATE pg_catalog."default",
    l_titre_ad character varying(100) COLLATE pg_catalog."default",
    l_drh_ss boolean DEFAULT true,
    l_drh_ad character varying(150) COLLATE pg_catalog."default",
    l_telp_aut character varying(15) COLLATE pg_catalog."default",
    CONSTRAINT geo_eco_etabp_pkey PRIMARY KEY (idgeoet),
    CONSTRAINT geo_eco_etabp_srcgeom_fkey FOREIGN KEY (src_geom)
        REFERENCES r_objet.lt_src_geom (code) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE m_activite_eco.geo_eco_etabp
    OWNER to create_sig;

GRANT ALL ON TABLE m_activite_eco.geo_eco_etabp TO sig_create;

GRANT ALL ON TABLE m_activite_eco.geo_eco_etabp TO create_sig;

GRANT SELECT ON TABLE m_activite_eco.geo_eco_etabp TO sig_read;

GRANT INSERT, SELECT, UPDATE, DELETE ON TABLE m_activite_eco.geo_eco_etabp TO sig_edit;

COMMENT ON TABLE m_activite_eco.geo_eco_etabp
    IS 'Données métiers sur les établissements non présent dans SIRENE (transition dans l''attente de leur intégration dans ce même fichier)';

COMMENT ON COLUMN m_activite_eco.geo_eco_etabp.idgeoet
    IS 'Identifiant géographique unique';

COMMENT ON COLUMN m_activite_eco.geo_eco_etabp.idsiren
    IS 'Numéro SIRENE de l''établissement (si connu)';

COMMENT ON COLUMN m_activite_eco.geo_eco_etabp.idsiret
    IS 'Numéro SIRET de l''établissement (si connu)';

COMMENT ON COLUMN m_activite_eco.geo_eco_etabp.idsite
    IS 'Identifiant du site d''activité d''appartenance';

COMMENT ON COLUMN m_activite_eco.geo_eco_etabp.date_sai
    IS 'Date de saisie par le producteur';

COMMENT ON COLUMN m_activite_eco.geo_eco_etabp.op_sai
    IS 'Libellé de l''opérateur de Saisie';

COMMENT ON COLUMN m_activite_eco.geo_eco_etabp.org_sai
    IS 'Libellé de l''organisme dont dépend l''opérateur de saisie';

COMMENT ON COLUMN m_activite_eco.geo_eco_etabp.l_nom
    IS 'Libellé du nom de l''établissement spécifique';

COMMENT ON COLUMN m_activite_eco.geo_eco_etabp.eff_etab
    IS 'Effectif total de l''établissement';

COMMENT ON COLUMN m_activite_eco.geo_eco_etabp.source_eff
    IS 'Source de l''effectif de l''établissement';

COMMENT ON COLUMN m_activite_eco.geo_eco_etabp.date_eff
    IS 'Date de l''effectif';

COMMENT ON COLUMN m_activite_eco.geo_eco_etabp.l_ape
    IS 'Code APE de l''établissement';

COMMENT ON COLUMN m_activite_eco.geo_eco_etabp.l_nom_dir
    IS 'Libellé du nom du dirigeant de l''établissement par l''ARC';

COMMENT ON COLUMN m_activite_eco.geo_eco_etabp.date_maj_dir
    IS 'Date de mise à jour du dirigeant';

COMMENT ON COLUMN m_activite_eco.geo_eco_etabp.source_maj_dir
    IS 'Source de la mise à jour du dirigeant';

COMMENT ON COLUMN m_activite_eco.geo_eco_etabp.l_tel
    IS 'Numéro de téléphone de l''établissement';

COMMENT ON COLUMN m_activite_eco.geo_eco_etabp.l_mail
    IS 'Adresse mail du dirigeant de l''établissement';

COMMENT ON COLUMN m_activite_eco.geo_eco_etabp.l_observ
    IS 'Commentaires';

COMMENT ON COLUMN m_activite_eco.geo_eco_etabp.geom
    IS 'Champ contenant la géométrie des objets';

COMMENT ON COLUMN m_activite_eco.geo_eco_etabp.date_maj
    IS 'Date de mise à jour';

COMMENT ON COLUMN m_activite_eco.geo_eco_etabp.l_compte
    IS 'Prise en compte de l''établissement pour le calcul des statistiques (nombre d''établissements et effectifs) dans les informations de synthèse.
Par défaut TRUE et laisse le choix à l''administrateur de la donnée de modifier cette valeur.';

COMMENT ON COLUMN m_activite_eco.geo_eco_etabp.l_tel_dir
    IS 'Numéro de téléphone direct du dirigeant';

COMMENT ON COLUMN m_activite_eco.geo_eco_etabp.l_telp_dir
    IS 'Numéro de téléphone portable direct du dirigeant';

COMMENT ON COLUMN m_activite_eco.geo_eco_etabp.l_mail_dir
    IS 'Adresse email du dirigeant';

COMMENT ON COLUMN m_activite_eco.geo_eco_etabp.l_nom_drh
    IS 'Nom du DRH';

COMMENT ON COLUMN m_activite_eco.geo_eco_etabp.l_tel_drh
    IS 'Numéro de téléphone direct du DRH';

COMMENT ON COLUMN m_activite_eco.geo_eco_etabp.l_mail_drh
    IS 'Adresse email du DRH';

COMMENT ON COLUMN m_activite_eco.geo_eco_etabp.l_nom_ad
    IS 'Nom de l''assistante de direction';

COMMENT ON COLUMN m_activite_eco.geo_eco_etabp.l_tel_ad
    IS 'Numéro de téléphone direct de l''assistante de direction';

COMMENT ON COLUMN m_activite_eco.geo_eco_etabp.l_mail_ad
    IS 'Adresse email de l''assistante de direction';

COMMENT ON COLUMN m_activite_eco.geo_eco_etabp.l_url
    IS 'Lien du site internet de l''entreprise';

COMMENT ON COLUMN m_activite_eco.geo_eco_etabp.l_url_bil
    IS 'Lien vers le bilan en ligne de l''entreprise';

COMMENT ON COLUMN m_activite_eco.geo_eco_etabp.l_comp_ad
    IS 'Complément d''adresse (ex : nom du bâtiment)';

COMMENT ON COLUMN m_activite_eco.geo_eco_etabp.src_geom
    IS 'Référentiel spatial utilisé pour la saisie';

COMMENT ON COLUMN m_activite_eco.geo_eco_etabp.l_titre
    IS 'Titre du contact';

COMMENT ON COLUMN m_activite_eco.geo_eco_etabp.eff_etab_d
    IS 'Précision (en détail) du nombre de CDD, CDI, intérim, ....';

COMMENT ON COLUMN m_activite_eco.geo_eco_etabp.l_nom_aut
    IS 'Nom d''un autre responsable';

COMMENT ON COLUMN m_activite_eco.geo_eco_etabp.l_titre_aut
    IS 'Titre de l''autre responsable';

COMMENT ON COLUMN m_activite_eco.geo_eco_etabp.l_tel_aut
    IS 'Téléphone de l''autre responsable';

COMMENT ON COLUMN m_activite_eco.geo_eco_etabp.l_mail_aut
    IS 'Email de l''autre responsable';

COMMENT ON COLUMN m_activite_eco.geo_eco_etabp.date_maj_drh
    IS 'Date de mise à jour du nom du DRH';

COMMENT ON COLUMN m_activite_eco.geo_eco_etabp.date_maj_ad
    IS 'Date de mise à jour de l''assistant(e) de direction';

COMMENT ON COLUMN m_activite_eco.geo_eco_etabp.date_maj_aut
    IS 'Date de mise à jour du nom de l''autre contact';

COMMENT ON COLUMN m_activite_eco.geo_eco_etabp.l_titre_drh
    IS 'Titre du DRH';

COMMENT ON COLUMN m_activite_eco.geo_eco_etabp.l_titre_ad
    IS 'Titre de l''assistant(e) de direction';

COMMENT ON COLUMN m_activite_eco.geo_eco_etabp.l_drh_ss
    IS 'Information sur le fait que la DRH soit sur le site (par défaut oui)';

COMMENT ON COLUMN m_activite_eco.geo_eco_etabp.l_drh_ad
    IS 'Adresse extérieure de la DRH si pas sur le site';

COMMENT ON COLUMN m_activite_eco.geo_eco_etabp.l_telp_aut
    IS 'Téléphone portable de l''autre responsable';



-- Trigger: t_t1_etabp_insert

-- DROP TRIGGER t_t1_etabp_insert ON m_activite_eco.geo_eco_etabp;

CREATE TRIGGER t_t1_etabp_insert
    BEFORE INSERT
    ON m_activite_eco.geo_eco_etabp
    FOR EACH ROW
    EXECUTE PROCEDURE m_activite_eco.ft_m_etabp_insert();

-- Trigger: t_t5_etabp_update

-- DROP TRIGGER t_t5_etabp_update ON m_activite_eco.geo_eco_etabp;

CREATE TRIGGER t_t5_etabp_update
    BEFORE UPDATE 
    ON m_activite_eco.geo_eco_etabp
    FOR EACH ROW
    EXECUTE PROCEDURE m_activite_eco.ft_m_etabp_update();

-- Trigger: t_t7_geo_sa_etabp_insee

-- DROP TRIGGER t_t7_geo_sa_etabp_insee ON m_activite_eco.geo_eco_etabp;

CREATE TRIGGER t_t7_geo_sa_etabp_insee
    BEFORE INSERT OR UPDATE OF geom
    ON m_activite_eco.geo_eco_etabp
    FOR EACH ROW
    EXECUTE PROCEDURE public.ft_r_commune_pl();



-- Trigger: t_t91_etabp_null

-- DROP TRIGGER t_t91_etabp_null ON m_activite_eco.geo_eco_etabp;

CREATE TRIGGER t_t91_etabp_null
    AFTER INSERT OR UPDATE 
    ON m_activite_eco.geo_eco_etabp
    FOR EACH ROW
    EXECUTE PROCEDURE m_activite_eco.ft_m_etabp_null();

-- ############################################################## [geo_eco_geoloc_salarie] ####################################################################

-- Table: m_activite_eco.geo_eco_geoloc_salarie

-- DROP TABLE m_activite_eco.geo_eco_geoloc_salarie;

CREATE TABLE m_activite_eco.geo_eco_geoloc_salarie
(
    gid integer NOT NULL DEFAULT nextval('m_activite_eco.geo_eco_geoloc_salarie_seq'::regclass),
    siret character(254) COLLATE pg_catalog."default",
    num_salari double precision,
    etablissem character(80) COLLATE pg_catalog."default",
    date_maj character(254) COLLATE pg_catalog."default",
    id character(254) COLLATE pg_catalog."default",
    adr_num character(254) COLLATE pg_catalog."default",
    adr_compl character(254) COLLATE pg_catalog."default",
    codepostal character(5) COLLATE pg_catalog."default",
    commune character(50) COLLATE pg_catalog."default",
    pays character(254) COLLATE pg_catalog."default",
    lat double precision,
    lng double precision,
    accuracy double precision,
    nbadrretur double precision,
    error_addr character(150) COLLATE pg_catalog."default",
    code double precision,
    jour_nuit character(254) COLLATE pg_catalog."default",
    service character(254) COLLATE pg_catalog."default",
    geom geometry(Point,2154),
    CONSTRAINT geo_eco_geoloc_salarie_test_pkey PRIMARY KEY (gid)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE m_activite_eco.geo_eco_geoloc_salarie
    OWNER to create_sig;

GRANT ALL ON TABLE m_activite_eco.geo_eco_geoloc_salarie TO sig_create;

GRANT ALL ON TABLE m_activite_eco.geo_eco_geoloc_salarie TO create_sig;

GRANT SELECT ON TABLE m_activite_eco.geo_eco_geoloc_salarie TO sig_read;

GRANT INSERT, SELECT, UPDATE, DELETE ON TABLE m_activite_eco.geo_eco_geoloc_salarie TO sig_edit;

COMMENT ON TABLE m_activite_eco.geo_eco_geoloc_salarie
    IS 'Géolocalisation des salariés des entreprises situées sur le territoire de l''ARC servant au service Transports et Mobilité. Les données sont issues des services RH de chaque entreprise.';


-- Trigger: t_t1_eco_geoloc_salarie_xy

-- DROP TRIGGER t_t1_eco_geoloc_salarie_xy ON m_economie.geo_eco_geoloc_salarie;

CREATE TRIGGER t_t1_eco_geoloc_salarie_xy
    BEFORE INSERT OR UPDATE OF geom
    ON m_activite_eco.geo_eco_geoloc_salarie
    FOR EACH ROW
    EXECUTE PROCEDURE public.r_lnglat_wgs84();

-- ############################################################## [geo_eco_site_zu] ####################################################################

-- Table: m_activite_eco.geo_eco_site_zu

-- DROP TABLE m_activite_eco.geo_eco_site_zu;

CREATE TABLE m_activite_eco.geo_eco_site_zu
(
    idsite character varying(254) COLLATE pg_catalog."default" NOT NULL,
    idpole character varying(254) COLLATE pg_catalog."default",
    site_nom character varying(254) COLLATE pg_catalog."default",
    site_etat character varying(254) COLLATE pg_catalog."default",
    surf_brt bigint,
    surf_net bigint,
    date_sai character varying(254) COLLATE pg_catalog."default",
    date_maj character varying(254) COLLATE pg_catalog."default",
    op_sai character varying(254) COLLATE pg_catalog."default",
    org_sai character varying(254) COLLATE pg_catalog."default",
    ref_spa character varying(254) COLLATE pg_catalog."default",
    prec_qtv bigint,
    typo character varying(254) COLLATE pg_catalog."default",
    geom geometry(MultiPolygon,2154),
    CONSTRAINT geo_eco_site_zu_pkey PRIMARY KEY (idsite)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE m_activite_eco.geo_eco_site_zu
    OWNER to create_sig;

GRANT ALL ON TABLE m_activite_eco.geo_eco_site_zu TO sig_create;

GRANT ALL ON TABLE m_activite_eco.geo_eco_site_zu TO create_sig;

GRANT SELECT ON TABLE m_activite_eco.geo_eco_site_zu TO sig_read;

GRANT INSERT, SELECT, UPDATE, DELETE ON TABLE m_activite_eco.geo_eco_site_zu TO sig_edit;

COMMENT ON TABLE m_activite_eco.geo_eco_site_zu
    IS 'Délimitation des sites des secteurs de centre-ville (zone urbaine) issue d''un traitement GéoPicardie.
Couche extraite du portail GéoPicardie le 2 mai 2017';

-- ############################################################## [h_an_eco_etab] ####################################################################

-- Table: m_activite_eco.h_an_eco_etab

-- DROP TABLE m_activite_eco.h_an_eco_etab;

CREATE TABLE m_activite_eco.h_an_eco_etab
(
    gid integer NOT NULL DEFAULT nextval('m_activite_eco.h_an_eco_etab_seq'::regclass),
    idgeoet integer,
    idsiren character varying(9) COLLATE pg_catalog."default",
    idsiret character varying(14) COLLATE pg_catalog."default",
    idsite character varying(10) COLLATE pg_catalog."default",
    date_maj timestamp without time zone,
    date_h timestamp without time zone,
    l_nom character varying(255) COLLATE pg_catalog."default",
    l1_nomen character varying(255) COLLATE pg_catalog."default",
    eff_etab integer,
    eff_etab_etp double precision,
    source_eff character varying(100) COLLATE pg_catalog."default",
    annee_eff integer,
    l_date_eff date,
    l_nom_dir character varying(100) COLLATE pg_catalog."default",
    l_observ character varying(255) COLLATE pg_catalog."default",
    t_source character varying(30) COLLATE pg_catalog."default",
    geom geometry(Point,2154),
    CONSTRAINT h_an_eco_etab_pkey PRIMARY KEY (gid)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE m_activite_eco.h_an_eco_etab
    OWNER to create_sig;

GRANT ALL ON TABLE m_activite_eco.h_an_eco_etab TO sig_create;

GRANT ALL ON TABLE m_activite_eco.h_an_eco_etab TO create_sig;

GRANT SELECT ON TABLE m_activite_eco.h_an_eco_etab TO sig_read;

GRANT INSERT, SELECT, UPDATE, DELETE ON TABLE m_activite_eco.h_an_eco_etab TO sig_edit;

COMMENT ON TABLE m_activite_eco.h_an_eco_etab
    IS 'Table contenant les données historisées des établissements.
Cette table est incrémentée chaque année par un Workflow FME (Y:\Ressources\4-Partage\3-Procedures\FME\prod\ECO\historisation_annuelle_site_etab.fmw)
La géométrie des points n''est plus historisés depuis la localisation des établissements à l''adresse';


COMMENT ON COLUMN m_activite_eco.h_an_eco_etab.gid
    IS 'Identifiant unique non signifiant';

COMMENT ON COLUMN m_activite_eco.h_an_eco_etab.idgeoet
    IS 'Identifiant unique géographique';

COMMENT ON COLUMN m_activite_eco.h_an_eco_etab.idsiren
    IS 'Numéro SIRENE de l''établissement';

COMMENT ON COLUMN m_activite_eco.h_an_eco_etab.idsiret
    IS 'Numéro SIRET de l''établissement';

COMMENT ON COLUMN m_activite_eco.h_an_eco_etab.idsite
    IS 'Identifiant du site d''activité d''appartenance';

COMMENT ON COLUMN m_activite_eco.h_an_eco_etab.date_maj
    IS 'Date de mise à jour par le producteur';

COMMENT ON COLUMN m_activite_eco.h_an_eco_etab.date_h
    IS 'Date de mise en historique';

COMMENT ON COLUMN m_activite_eco.h_an_eco_etab.l_nom
    IS 'Enseigne dans SIRENE';

COMMENT ON COLUMN m_activite_eco.h_an_eco_etab.l1_nomen
    IS 'Raison sociale de l''établissement dans SIRENE';

COMMENT ON COLUMN m_activite_eco.h_an_eco_etab.eff_etab
    IS 'Effectif total de l''établissement';

COMMENT ON COLUMN m_activite_eco.h_an_eco_etab.eff_etab_etp
    IS 'Effectif de l''établissement en etp';

COMMENT ON COLUMN m_activite_eco.h_an_eco_etab.source_eff
    IS 'Source de l''effectif de l''établissement';

COMMENT ON COLUMN m_activite_eco.h_an_eco_etab.annee_eff
    IS 'Année de l''effectif (issu de SIRENE)';

COMMENT ON COLUMN m_activite_eco.h_an_eco_etab.l_date_eff
    IS 'Date de l''effectif saisie par l''ARC';

COMMENT ON COLUMN m_activite_eco.h_an_eco_etab.l_nom_dir
    IS 'Libellé du nom du dirigeant de l''établissement par l''ARC';

COMMENT ON COLUMN m_activite_eco.h_an_eco_etab.l_observ
    IS 'Commentaires';

COMMENT ON COLUMN m_activite_eco.h_an_eco_etab.t_source
    IS 'Nom de la table source';
    
    
-- ############################################################## [h_an_eco_site] ####################################################################  

-- Table: m_activite_eco.h_an_eco_site

-- DROP TABLE m_activite_eco.h_an_eco_site;

CREATE TABLE m_activite_eco.h_an_eco_site
(
    id integer NOT NULL DEFAULT nextval('m_activite_eco.h_an_eco_site_seq'::regclass),
    idsite character varying(10) COLLATE pg_catalog."default",
    site_nom character varying(80) COLLATE pg_catalog."default",
    dest text COLLATE pg_catalog."default",
    voca text COLLATE pg_catalog."default",
    date_h timestamp with time zone,
    annee_h integer,
    nb_etab text COLLATE pg_catalog."default",
    eff_etab text COLLATE pg_catalog."default",
    surf_dispo_vente character varying COLLATE pg_catalog."default",
    surf_dedie_act character varying COLLATE pg_catalog."default",
    surf_reserve_projet character varying COLLATE pg_catalog."default",
   CONSTRAINT h_an_eco_site_pkey PRIMARY KEY (id)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE m_activite_eco.h_an_eco_site
    OWNER to create_sig;

GRANT ALL ON TABLE m_activite_eco.h_an_eco_site TO sig_create;

GRANT ALL ON TABLE m_activite_eco.h_an_eco_site TO create_sig;

GRANT SELECT ON TABLE m_activite_eco.h_an_eco_site TO sig_read;

GRANT INSERT, SELECT, UPDATE, DELETE ON TABLE m_activite_eco.h_an_eco_site TO sig_edit;

COMMENT ON TABLE m_activite_eco.h_an_eco_site
    IS 'Table contenant les données historisées des sites à vocation économique (1er historisation 1er janvier 2018). Le millésime correspond au 1er janvier de l''année.
Cette table est incrémentée chaque année par un Workflow FME (Y:\Ressources\4-Partage\3-Procedures\FME\prod\ECO\historisation_annuelle_site_etab.fmw)';

COMMENT ON COLUMN m_activite_eco.h_an_eco_site.id
    IS 'Identifiant unique interne';


-- ####################################################################################################################################################
-- ###                                                         TABLE M_URBANISME_REG                                                                ###
-- ####################################################################################################################################################


-- ############################################################## [geo_proced] ##################################################################

-- Table: m_urbanisme_reg.geo_proced

-- DROP TABLE m_urbanisme_reg.geo_proced;

CREATE TABLE m_urbanisme_reg.geo_proced
(
    idproc character varying(5) NOT NULL DEFAULT 'PR' || nextval('m_urbanisme_reg.geo_proc_seq'::regclass),
    nom character varying(255) COLLATE pg_catalog."default",
    alias character varying(255) COLLATE pg_catalog."default",
    dest character varying(2) COLLATE pg_catalog."default" DEFAULT '00'::character varying,
    z_proced character varying(2) COLLATE pg_catalog."default" DEFAULT '00'::character varying,
    phase character varying(2) COLLATE pg_catalog."default",
    moa character varying(80) COLLATE pg_catalog."default",
    conso_type character varying(2) COLLATE pg_catalog."default",
    pr_urb boolean NOT NULL DEFAULT false,
    date_crea date,
    pr_fon boolean NOT NULL DEFAULT false,
    pr_fon_date date,
    surf_ha double precision,
    existe boolean NOT NULL DEFAULT true,
    pr_fon_type character varying(2) COLLATE pg_catalog."default",
    ref_compta character varying(5) COLLATE pg_catalog."default",
    surf_cess_ha numeric(10,2),
    date_clo timestamp without time zone,
    nb_log integer,
    nb_logind integer,
    nb_logindgr integer,
    nb_logcol integer,
    nb_logaide integer,
    nb_logaide_loc integer,
    nb_logaide_acc integer,
    nom_cp character varying(80) COLLATE pg_catalog."default",
    op_sai character varying(80) COLLATE pg_catalog."default",
    date_sai timestamp without time zone,
    date_maj timestamp without time zone,
    epci character varying(10) COLLATE pg_catalog."default",
    observ character varying(1000) COLLATE pg_catalog."default",
    geom geometry(MultiPolygon,2154),
    CONSTRAINT geo_proced_pkey PRIMARY KEY (idproc),
    CONSTRAINT geo_proced_consotype_fkey FOREIGN KEY (conso_type)
        REFERENCES m_urbanisme_reg.lt_proc_typconso (code) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT geo_proced_phase_fkey FOREIGN KEY (phase)
        REFERENCES m_urbanisme_reg.lt_proc_phase (code) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT geo_proced_prfontype_fkey FOREIGN KEY (pr_fon_type)
        REFERENCES m_urbanisme_reg.lt_proc_typfon (code) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT geo_proced_z_proced_fkey FOREIGN KEY (z_proced)
        REFERENCES m_urbanisme_reg.lt_proc_typ (code) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE m_urbanisme_reg.geo_proced
    OWNER to create_sig;

GRANT ALL ON TABLE m_urbanisme_reg.geo_proced TO sig_create;

GRANT SELECT ON TABLE m_urbanisme_reg.geo_proced TO sig_read;

GRANT ALL ON TABLE m_urbanisme_reg.geo_proced TO create_sig;

GRANT INSERT, SELECT, UPDATE, DELETE ON TABLE m_urbanisme_reg.geo_proced TO sig_edit;

COMMENT ON TABLE m_urbanisme_reg.geo_proced
    IS 'Classe d''objets contenant les données des procédures d''aménagement';

COMMENT ON COLUMN m_urbanisme_reg.geo_proced.idproc
    IS 'Identifiant non signifiant de la procédure';

COMMENT ON COLUMN m_urbanisme_reg.geo_proced.nom
    IS 'Libellé de l''opération';

COMMENT ON COLUMN m_urbanisme_reg.geo_proced.alias
    IS 'Alias du nom de l''opération';

COMMENT ON COLUMN m_urbanisme_reg.geo_proced.dest
    IS 'Code de la destination du Site (issu de la liste des valeurs du modèle CNIG sur les PLU)';

COMMENT ON COLUMN m_urbanisme_reg.geo_proced.z_proced
    IS 'Code de la procédure d''aménagement';

COMMENT ON COLUMN m_urbanisme_reg.geo_proced.op_sai
    IS 'Libellé de la personne ayant saisie l''objet';

COMMENT ON COLUMN m_urbanisme_reg.geo_proced.phase
    IS 'Phase de l''opération';

COMMENT ON COLUMN m_urbanisme_reg.geo_proced.moa
    IS 'Maitrise d''ouvrage de l''opération';

COMMENT ON COLUMN m_urbanisme_reg.geo_proced.conso_type
    IS 'Type de consommation foncière';

COMMENT ON COLUMN m_urbanisme_reg.geo_proced.pr_urb
    IS 'Procédure d''urbanisme';

COMMENT ON COLUMN m_urbanisme_reg.geo_proced.date_crea
    IS 'Date de création de la ZAC';

COMMENT ON COLUMN m_urbanisme_reg.geo_proced.pr_fon
    IS 'Procédure foncière';

COMMENT ON COLUMN m_urbanisme_reg.geo_proced.pr_fon_date
    IS 'Date de la procédure foncière';

COMMENT ON COLUMN m_urbanisme_reg.geo_proced.surf_ha
    IS 'Superficie totale programmée de l''opération en ha';

COMMENT ON COLUMN m_urbanisme_reg.geo_proced.existe
    IS 'Existance du site';

COMMENT ON COLUMN m_urbanisme_reg.geo_proced.pr_fon_type
    IS 'Procédure foncière engagée';

COMMENT ON COLUMN m_urbanisme_reg.geo_proced.ref_compta
    IS 'Référence comptable du projet';

COMMENT ON COLUMN m_urbanisme_reg.geo_proced.observ
    IS 'Commentaire';

COMMENT ON COLUMN m_urbanisme_reg.geo_proced.date_sai
    IS 'Date de saisie des données attributaires';

COMMENT ON COLUMN m_urbanisme_reg.geo_proced.date_maj
    IS 'Date de mise à jour des données attributaires';

COMMENT ON COLUMN m_urbanisme_reg.geo_proced.surf_cess_ha
    IS 'Surface cessible programmée en ha';

COMMENT ON COLUMN m_urbanisme_reg.geo_proced.date_clo
    IS 'Date de cloture de l''opération';

COMMENT ON COLUMN m_urbanisme_reg.geo_proced.nb_log
    IS 'Nombre total de logements programmés';

COMMENT ON COLUMN m_urbanisme_reg.geo_proced.nb_logind
    IS 'Nombre de logements individuels programmés';

COMMENT ON COLUMN m_urbanisme_reg.geo_proced.nb_logindgr
    IS 'Nombre de logements individuels groupés programmés';

COMMENT ON COLUMN m_urbanisme_reg.geo_proced.nb_logcol
    IS 'Nombre de logements collectifs programmés';

COMMENT ON COLUMN m_urbanisme_reg.geo_proced.nb_logaide
    IS 'Nombre total de logements aidés programmés';

COMMENT ON COLUMN m_urbanisme_reg.geo_proced.nb_logaide_loc
    IS 'Nombre total de logements aidés en location programmés';

COMMENT ON COLUMN m_urbanisme_reg.geo_proced.nb_logaide_acc
    IS 'Nombre total de logements en accession en location programmés';

COMMENT ON COLUMN m_urbanisme_reg.geo_proced.nom_cp
    IS 'Nom du chef de projet suivant la procédure';
    
COMMENT ON COLUMN m_urbanisme_reg.geo_proced.epci
    IS 'Autorité compétente';

COMMENT ON COLUMN m_urbanisme_reg.geo_proced.observ
    IS 'Observations diverses';
    
    
COMMENT ON COLUMN m_urbanisme_reg.geo_proced.geom
    IS 'Géométrie des objets';


    
-- ############################################################## [an_proc_media] ##################################################################

-- Table: m_urbanisme_reg.an_proc_media

-- DROP TABLE m_urbanisme_reg.an_proc_media;

CREATE TABLE m_urbanisme_reg.an_proc_media
(
    gid integer NOT NULL DEFAULT nextval('m_urbanisme_reg.an_proc_media_seq'::regclass),
    id text COLLATE pg_catalog."default",
    media text COLLATE pg_catalog."default",
    miniature bytea,
    n_fichier text COLLATE pg_catalog."default",
    t_fichier text COLLATE pg_catalog."default",
    op_sai character varying(20) COLLATE pg_catalog."default",
    date_sai timestamp without time zone,
    l_doc character varying(100) COLLATE pg_catalog."default",
    t_doc character varying(2) COLLATE pg_catalog."default" DEFAULT '00',		
    CONSTRAINT an_proc_media_pkey PRIMARY KEY (gid),
    CONSTRAINT an_proc_media_t_doc_fkey FOREIGN KEY (t_doc)
    REFERENCES m_activite_eco.lt_eco_tdocmedia (code) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE m_urbanisme_reg.an_proc_media
    OWNER to create_sig;

GRANT ALL ON TABLE m_urbanisme_reg.an_proc_media TO sig_create;

GRANT SELECT ON TABLE m_urbanisme_reg.an_proc_media TO sig_read;

GRANT ALL ON TABLE m_urbanisme_reg.an_proc_media TO create_sig;

GRANT INSERT, SELECT, UPDATE, DELETE ON TABLE m_urbanisme_reg.an_proc_media TO sig_edit;

COMMENT ON TABLE m_urbanisme_reg.an_proc_media
    IS 'Table gérant les documents intégrés pour la gestion des procédures d''aménagement';

COMMENT ON COLUMN m_urbanisme_reg.an_proc_media.id
    IS 'Identifiant interne non signifiant de l''objet saisi';

COMMENT ON COLUMN m_urbanisme_reg.an_proc_media.media
    IS 'Champ Média de GEO';

COMMENT ON COLUMN m_urbanisme_reg.an_proc_media.miniature
    IS 'Champ miniature de GEO';

COMMENT ON COLUMN m_urbanisme_reg.an_proc_media.n_fichier
    IS 'Nom du fichier';

COMMENT ON COLUMN m_urbanisme_reg.an_proc_media.t_fichier
    IS 'Type de média dans GEO';

COMMENT ON COLUMN m_urbanisme_reg.an_proc_media.op_sai
    IS 'Opérateur de saisie (par défaut login de connexion à GEO)';

COMMENT ON COLUMN m_urbanisme_reg.an_proc_media.date_sai
    IS 'Date de la saisie du document';

COMMENT ON COLUMN m_urbanisme_reg.an_proc_media.l_doc
    IS 'Titre du document ou légère description';


COMMENT ON COLUMN m_urbanisme_reg.an_proc_media.gid
    IS 'Compteur (identifiant interne)';


-- ####################################################################################################################################################
-- ###                                                           TABLE M_AMENAGEMENT                                                                ###
-- ####################################################################################################################################################


-- ############################################################## [an_amt_lot_stade] ##################################################################

-- Table: m_amenagement.an_amt_lot_stade

-- DROP TABLE m_amenagement.an_amt_lot_stade;

CREATE TABLE m_amenagement.an_amt_lot_stade
(
    idgeolf integer NOT NULL,
    stade_amng character varying(2) COLLATE pg_catalog."default" DEFAULT '00'::character varying,
    l_amng2 character varying(2) COLLATE pg_catalog."default" DEFAULT '00'::character varying,
    stade_comm character varying(2) COLLATE pg_catalog."default" DEFAULT '00'::character varying,
    l_comm2 character varying(2) COLLATE pg_catalog."default" DEFAULT '00'::character varying,
    l_comm2_12 character varying(80) COLLATE pg_catalog."default",
    etat_occup character varying(2) COLLATE pg_catalog."default" DEFAULT '00'::character varying,
    CONSTRAINT an_amt_lot_stade_pkey PRIMARY KEY (idgeolf),  
    	CONSTRAINT an_amt_lot_stade_etat_fkey FOREIGN KEY (etat_occup)
    REFERENCES m_activite_eco.lt_eco_etat (code) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION,
	CONSTRAINT an_amt_lot_stade_lamng2_fkey FOREIGN KEY (l_amng2)
    REFERENCES m_amenagement.lt_amt_stadeamng2 (code) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION,
	CONSTRAINT an_amt_lot_stade_lcomm2_fkey FOREIGN KEY (l_comm2)
    REFERENCES m_amenagement.lt_amt_stadecomm2 (code) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION,
	CONSTRAINT an_amt_lot_stade_comm_fkey FOREIGN KEY (stade_comm)
    REFERENCES m_amenagement.lt_amt_stadecomm (code) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION,
	CONSTRAINT an_amt_lot_stade_stadeamng_fkey FOREIGN KEY (stade_amng)
    REFERENCES m_amenagement.lt_amt_stadeamng (code) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE m_amenagement.an_amt_lot_stade
    OWNER to create_sig;

GRANT ALL ON TABLE m_amenagement.an_amt_lot_stade TO sig_create;

GRANT ALL ON TABLE m_amenagement.an_amt_lot_stade TO create_sig;

GRANT ALL ON TABLE m_amenagement.an_amt_lot_stade TO sig_stage WITH GRANT OPTION;

GRANT SELECT ON TABLE m_amenagement.an_amt_lot_stade TO sig_read;

GRANT INSERT, SELECT, UPDATE, DELETE ON TABLE m_amenagement.an_amt_lot_stade TO sig_edit;

COMMENT ON TABLE m_amenagement.an_amt_lot_stade
    IS 'Table alphanumérique contenant les données de la classe stade d''aménagement et de commercialisation';

COMMENT ON COLUMN m_amenagement.an_amt_lot_stade.idgeolf
    IS 'Identifiant unique de l''entité géographique lot';


COMMENT ON COLUMN m_amenagement.an_amt_lot_stade.stade_amng
    IS 'Code du stade d''aménagement du foncier';

COMMENT ON COLUMN m_amenagement.an_amt_lot_stade.l_amng2
    IS 'Code du stade d''aménagement du foncier spécifique à l''ARC';

COMMENT ON COLUMN m_amenagement.an_amt_lot_stade.stade_comm
    IS 'Code du stade de commercialisation du foncier';

COMMENT ON COLUMN m_amenagement.an_amt_lot_stade.l_comm2
    IS 'Code du stade de commercialisation du foncier spécifique à l''ARC';

COMMENT ON COLUMN m_amenagement.an_amt_lot_stade.l_comm2_12
    IS 'Spécification de la contrainte du lot en vente (code 12 du champ l_comm2)';

COMMENT ON COLUMN m_amenagement.an_amt_lot_stade.etat_occup
    IS 'Code de l''état d''occupation du foncier';

-- ############################################################## [an_amt_esppu] ##################################################################

-- Table: m_amenagement.an_amt_esppu

-- DROP TABLE m_amenagement.an_amt_esppu;

CREATE TABLE m_amenagement.an_amt_esppu
(
    idgeopu integer NOT NULL,
    idpole character varying(7) COLLATE pg_catalog."default",
    date_int date,
    op_sai character varying(80) COLLATE pg_catalog."default",
    org_sai character varying(80) COLLATE pg_catalog."default",
    vocaep character varying(2) COLLATE pg_catalog."default" DEFAULT '00'::character varying,
    date_sai timestamp without time zone,
    date_maj timestamp without time zone,
    epci character varying(10) COLLATE pg_catalog."default",
    CONSTRAINT an_amt_esppu_pkey PRIMARY KEY (idgeopu),
    CONSTRAINT lt_amt_empesp_pu_fkey FOREIGN KEY (vocaep)
        REFERENCES m_amenagement.lt_amt_empesp_pu (code) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE m_amenagement.an_amt_esppu
    OWNER to create_sig;

GRANT SELECT ON TABLE m_amenagement.an_amt_esppu TO sig_read;

GRANT ALL ON TABLE m_amenagement.an_amt_esppu TO sig_create;

GRANT ALL ON TABLE m_amenagement.an_amt_esppu TO create_sig;

GRANT INSERT, SELECT, UPDATE, DELETE ON TABLE m_amenagement.an_amt_esppu TO sig_edit;

COMMENT ON TABLE m_amenagement.an_amt_esppu
    IS 'Information alphanumérique sur les emprises des espaces publiques contenus dans les sites opérationnels. Les objets virtuels de référence sont gérés dans le schéma r_objet';

COMMENT ON COLUMN m_amenagement.an_amt_esppu.idgeopu
    IS 'Identifiant unique géographique de référence de l''objet virtuel';


COMMENT ON COLUMN m_amenagement.an_amt_esppu.idpole
    IS 'Identifiant unique du pole';

COMMENT ON COLUMN m_amenagement.an_amt_esppu.date_int
    IS 'Date d''intégration par GéoPicardie dans la base (permet de connaître la dernière donnée intégrée)';

COMMENT ON COLUMN m_amenagement.an_amt_esppu.op_sai
    IS 'Libellé de la personne ayant saisie la mise à jour';

COMMENT ON COLUMN m_amenagement.an_amt_esppu.org_sai
    IS 'Organisme de saisie dont dépend l''opérateur de saisie';

COMMENT ON COLUMN m_amenagement.an_amt_esppu.vocaep
    IS 'Code de valeurs des vocations des espaces publics';

COMMENT ON COLUMN m_amenagement.an_amt_esppu.date_sai
    IS 'Date de saisie des données attributaires';

COMMENT ON COLUMN m_amenagement.an_amt_esppu.date_maj
    IS 'Date de mises à jour des données attributaires';
    
COMMENT ON COLUMN m_amenagement.an_amt_esppu.epci
    IS 'Autorité compétente';

-- ############################################################## [an_amt_lot_esppu] ##################################################################

-- Table: m_amenagement.an_amt_lot_esppu

-- DROP TABLE m_amenagement.an_amt_lot_esppu;

CREATE TABLE m_amenagement.an_amt_lot_esppu
(
    idgeolf integer NOT NULL,
    idsite character varying(10) COLLATE pg_catalog."default",
    op_sai character varying(80) COLLATE pg_catalog."default",
    org_sai character varying(80) COLLATE pg_catalog."default",
    l_nom character varying(100) COLLATE pg_catalog."default",
    surf double precision,
    date_sai timestamp without time zone,
    date_maj timestamp without time zone,
    l_surf_l character varying(15) COLLATE pg_catalog."default",
	epci character varying(10) COLLATE pg_catalog."default",
    CONSTRAINT an_amt_lot_esppu_pkey PRIMARY KEY (idgeolf)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE m_amenagement.an_amt_lot_esppu
    OWNER to create_sig;

GRANT ALL ON TABLE m_amenagement.an_amt_lot_esppu TO sig_create;

GRANT SELECT ON TABLE m_amenagement.an_amt_lot_esppu TO sig_read;

GRANT ALL ON TABLE m_amenagement.an_amt_lot_esppu TO create_sig;

GRANT INSERT, SELECT, UPDATE, DELETE ON TABLE m_amenagement.an_amt_lot_esppu TO sig_edit;

COMMENT ON TABLE m_amenagement.an_amt_lot_esppu
    IS 'Information alphanumérique sur les lots équipements';

COMMENT ON COLUMN m_amenagement.an_amt_lot_esppu.idgeolf
    IS 'Identifiant unique géographique de référence de l''objet virtuel';

COMMENT ON COLUMN m_amenagement.an_amt_lot_esppu.idsite
    IS 'Identifiant unique du site';

COMMENT ON COLUMN m_amenagement.an_amt_lot_esppu.op_sai
    IS 'Libellé de la personne ayant saisie la mise à jour';

COMMENT ON COLUMN m_amenagement.an_amt_lot_esppu.org_sai
    IS 'Organisme de saisie dont dépend l''opérateur de saisie';

COMMENT ON COLUMN m_amenagement.an_amt_lot_esppu.l_nom
    IS 'Libellé de l''équipement';

COMMENT ON COLUMN m_amenagement.an_amt_lot_esppu.surf
    IS 'Surface du lot équipement en m²';

COMMENT ON COLUMN m_amenagement.an_amt_lot_esppu.date_sai
    IS 'Date de saisie des données attributaires';

COMMENT ON COLUMN m_amenagement.an_amt_lot_esppu.date_maj
    IS 'Date de mise à jour des données attributaires';


COMMENT ON COLUMN m_amenagement.an_amt_lot_esppu.l_surf_l
    IS 'Surface littérale parcellaire occupée du lot';
	
	
COMMENT ON COLUMN m_amenagement.an_amt_esppu.epci
    IS 'Autorité compétente';

-- ############################################################## [an_amt_lot_divers] ##################################################################

-- Table: m_amenagement.an_amt_lot_divers

-- DROP TABLE m_amenagement.an_amt_lot_divers;

CREATE TABLE m_amenagement.an_amt_lot_divers
(
    idgeolf integer NOT NULL,
    op_sai character varying(80) COLLATE pg_catalog."default",
    org_sai character varying(80) COLLATE pg_catalog."default",
    l_nom character varying(100) COLLATE pg_catalog."default",
    surf double precision,
    date_sai timestamp without time zone,
    date_maj timestamp without time zone,
    l_phase character varying(10) COLLATE pg_catalog."default",
    l_surf_l character varying(15) COLLATE pg_catalog."default",
    epci character varying(10) COLLATE pg_catalog."default",
    CONSTRAINT an_amt_lot_divers_pkey PRIMARY KEY (idgeolf)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE m_amenagement.an_amt_lot_divers
    OWNER to create_sig;

GRANT ALL ON TABLE m_amenagement.an_amt_lot_divers TO sig_create;

GRANT ALL ON TABLE m_amenagement.an_amt_lot_divers TO create_sig;

GRANT SELECT ON TABLE m_amenagement.an_amt_lot_divers TO sig_read;

GRANT INSERT, SELECT, UPDATE, DELETE ON TABLE m_amenagement.an_amt_lot_divers TO sig_edit;

COMMENT ON TABLE m_amenagement.an_amt_lot_divers
    IS 'Information alphanumérique sur les lots divers';

COMMENT ON COLUMN m_amenagement.an_amt_lot_divers.idgeolf
    IS 'Identifiant unique géographique de référence de l''objet virtuel';

COMMENT ON COLUMN m_amenagement.an_amt_lot_divers.op_sai
    IS 'Libellé de la personne ayant saisie la mise à jour';

COMMENT ON COLUMN m_amenagement.an_amt_lot_divers.org_sai
    IS 'Organisme de saisie dont dépend l''opérateur de saisie';

COMMENT ON COLUMN m_amenagement.an_amt_lot_divers.l_nom
    IS 'Libellé';

COMMENT ON COLUMN m_amenagement.an_amt_lot_divers.surf
    IS 'Surface du lot divers en m²';

COMMENT ON COLUMN m_amenagement.an_amt_lot_divers.date_sai
    IS 'Date de saisie des données attributaires';

COMMENT ON COLUMN m_amenagement.an_amt_lot_divers.date_maj
    IS 'Date de mise à jour des données attributaires';

COMMENT ON COLUMN m_amenagement.an_amt_lot_divers.l_phase
    IS 'Phase opérationnelle éventuelle';

COMMENT ON COLUMN m_amenagement.an_amt_lot_divers.epci
    IS 'Autorité compétente';

-- ############################################################## [an_amt_lot_equ] ##################################################################

-- Table: m_amenagement.an_amt_lot_equ

-- DROP TABLE m_amenagement.an_amt_lot_equ;

CREATE TABLE m_amenagement.an_amt_lot_equ
(
    idgeolf integer NOT NULL,
    op_sai character varying(80) COLLATE pg_catalog."default",
    org_sai character varying(80) COLLATE pg_catalog."default",
    l_nom character varying(100) COLLATE pg_catalog."default",
    surf double precision,
    date_sai timestamp without time zone,
    date_maj timestamp without time zone,
    l_phase character varying(10) COLLATE pg_catalog."default",
    l_surf_l character varying(15) COLLATE pg_catalog."default",
    epci character varying(10) COLLATE pg_catalog."default",
    CONSTRAINT an_amt_lot_equ_pkey PRIMARY KEY (idgeolf)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE m_amenagement.an_amt_lot_equ
    OWNER to create_sig;

GRANT ALL ON TABLE m_amenagement.an_amt_lot_equ TO sig_create;

GRANT ALL ON TABLE m_amenagement.an_amt_lot_equ TO create_sig;

GRANT SELECT ON TABLE m_amenagement.an_amt_lot_equ TO sig_read;

GRANT INSERT, SELECT, UPDATE, DELETE ON TABLE m_amenagement.an_amt_lot_equ TO sig_edit;

COMMENT ON TABLE m_amenagement.an_amt_lot_equ
    IS 'Information alphanumérique sur les lots équipements';

COMMENT ON COLUMN m_amenagement.an_amt_lot_equ.idgeolf
    IS 'Identifiant unique géographique de référence de l''objet virtuel';

COMMENT ON COLUMN m_amenagement.an_amt_lot_equ.op_sai
    IS 'Libellé de la personne ayant saisie la mise à jour';

COMMENT ON COLUMN m_amenagement.an_amt_lot_equ.org_sai
    IS 'Organisme de saisie dont dépend l''opérateur de saisie';

COMMENT ON COLUMN m_amenagement.an_amt_lot_equ.l_nom
    IS 'Libellé de l''équipement';

COMMENT ON COLUMN m_amenagement.an_amt_lot_equ.surf
    IS 'Surface du lot équipement en m²';

COMMENT ON COLUMN m_amenagement.an_amt_lot_equ.date_sai
    IS 'Date de saisie des données attributaires';

COMMENT ON COLUMN m_amenagement.an_amt_lot_equ.date_maj
    IS 'Date de mise à jour des données attributaires';

COMMENT ON COLUMN m_amenagement.an_amt_lot_equ.l_phase
    IS 'Phase opérationnelle éventuelle';

COMMENT ON COLUMN m_amenagement.an_amt_lot_equ.l_surf_l
    IS 'Surface littérale parcellaire occupée du lot';


COMMENT ON COLUMN m_amenagement.an_amt_lot_divers.epci
    IS 'Autorité compétente';

-- ############################################################## [an_amt_lot_hab] ##################################################################

-- Table: m_amenagement.an_amt_lot_hab

-- DROP TABLE m_amenagement.an_amt_lot_hab;

CREATE TABLE m_amenagement.an_amt_lot_hab
(
    idgeolf integer NOT NULL,
    surf integer,
    l_surf_l character varying(15) COLLATE pg_catalog."default",
    op_sai character varying(80) COLLATE pg_catalog."default",
    org_sai character varying(80) COLLATE pg_catalog."default",
    l_pvente double precision,
    l_pvente_l character varying(15) COLLATE pg_catalog."default",
    nb_log integer,
    nb_logind integer,
    nb_logindgr integer,
    nb_logcol integer,
    nb_logaide integer,
    l_observ character varying(255) COLLATE pg_catalog."default",
    date_sai timestamp without time zone,
    date_maj timestamp without time zone,
    l_phase character varying(20) COLLATE pg_catalog."default",
    nb_log_r integer DEFAULT 0,
    nb_logind_r integer DEFAULT 0,
    nb_logindgr_r integer DEFAULT 0,
    nb_logcol_r integer DEFAULT 0,
    nb_logaide_r integer DEFAULT 0,
    l_pvente_lot integer,
    nb_logaide_loc_r integer,
    nb_logaide_acc_r integer,
    epci character varying(10) COLLATE pg_catalog."default",
    CONSTRAINT an_amt_lot_hab_pkey PRIMARY KEY (idgeolf)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE m_amenagement.an_amt_lot_hab
    OWNER to create_sig;

GRANT ALL ON TABLE m_amenagement.an_amt_lot_hab TO sig_create;

GRANT ALL ON TABLE m_amenagement.an_amt_lot_hab TO create_sig;

GRANT SELECT ON TABLE m_amenagement.an_amt_lot_hab TO sig_read;

GRANT INSERT, SELECT, UPDATE, DELETE ON TABLE m_amenagement.an_amt_lot_hab TO sig_edit;

COMMENT ON TABLE m_amenagement.an_amt_lot_hab
    IS 'Table alphanumérique contenant les données des lots à vocation habitat';

COMMENT ON COLUMN m_amenagement.an_amt_lot_hab.idgeolf
    IS 'Identifiant unique de l''entité géographique lot';


COMMENT ON COLUMN m_amenagement.an_amt_lot_hab.surf
    IS 'Surface parcellaire occupée du lot';

COMMENT ON COLUMN m_amenagement.an_amt_lot_hab.l_surf_l
    IS 'Surface littérale parcellaire occupée du lot';

COMMENT ON COLUMN m_amenagement.an_amt_lot_hab.op_sai
    IS 'Libellé de l''opérateur de saisie';

COMMENT ON COLUMN m_amenagement.an_amt_lot_hab.org_sai
    IS 'Libellé de l''organisme de saisie';

COMMENT ON COLUMN m_amenagement.an_amt_lot_hab.l_pvente
    IS 'Prix de vente du lot en HT (€/m²)';

COMMENT ON COLUMN m_amenagement.an_amt_lot_hab.l_pvente_l
    IS 'Prix littéral de vente du lot en HT (ex:50€/m²)';

COMMENT ON COLUMN m_amenagement.an_amt_lot_hab.nb_log
    IS 'Nombre total de logements';

COMMENT ON COLUMN m_amenagement.an_amt_lot_hab.nb_logind
    IS 'Nombre de logements individuels';

COMMENT ON COLUMN m_amenagement.an_amt_lot_hab.nb_logindgr
    IS 'Nombre de logements individuels groupés';

COMMENT ON COLUMN m_amenagement.an_amt_lot_hab.nb_logcol
    IS 'Nombre de logements collectifs';

COMMENT ON COLUMN m_amenagement.an_amt_lot_hab.nb_logaide
    IS 'Dont nombre de logements aidés';

COMMENT ON COLUMN m_amenagement.an_amt_lot_hab.l_observ
    IS 'Observations diverses';

COMMENT ON COLUMN m_amenagement.an_amt_lot_hab.date_sai
    IS 'Date de saisie des données attributaires';

COMMENT ON COLUMN m_amenagement.an_amt_lot_hab.date_maj
    IS 'Date de mise à jour des données attributaires';

COMMENT ON COLUMN m_amenagement.an_amt_lot_hab.l_phase
    IS 'Information facultative sur l''appartenance du lot à un éventuel phasage de l''opération';

COMMENT ON COLUMN m_amenagement.an_amt_lot_hab.nb_log_r
    IS 'Nombre de logements total réalisé';

COMMENT ON COLUMN m_amenagement.an_amt_lot_hab.nb_logind_r
    IS 'Nombre de logements individuels réalisé';

COMMENT ON COLUMN m_amenagement.an_amt_lot_hab.nb_logindgr_r
    IS 'Nombre de logements individuels groupés réalisé';

COMMENT ON COLUMN m_amenagement.an_amt_lot_hab.nb_logcol_r
    IS 'Nombre de logements collectifs réalisé';

COMMENT ON COLUMN m_amenagement.an_amt_lot_hab.nb_logaide_r
    IS 'Nombre de logements aidés réalisé';

COMMENT ON COLUMN m_amenagement.an_amt_lot_hab.l_pvente_lot
    IS 'Prix de vente du lot (ht)';

COMMENT ON COLUMN m_amenagement.an_amt_lot_hab.nb_logaide_loc_r
    IS 'Nombre de logements aidés en location réalisé';

COMMENT ON COLUMN m_amenagement.an_amt_lot_hab.nb_logaide_acc_r
    IS 'Nombre de logements aidés en accession réalisé';
    

COMMENT ON COLUMN m_amenagement.an_amt_lot_hab.epci
    IS 'Autorité compétente';

-- ############################################################## [an_amt_lot_mixte] ##################################################################

-- Table: m_amenagement.an_amt_lot_mixte

-- DROP TABLE m_amenagement.an_amt_lot_mixte;

CREATE TABLE m_amenagement.an_amt_lot_mixte
(
    idgeolf integer NOT NULL,
    surf integer,
    l_surf_l character varying(15) COLLATE pg_catalog."default",
    op_sai character varying(80) COLLATE pg_catalog."default",
    org_sai character varying(80) COLLATE pg_catalog."default",
    l_pvente double precision,
    l_pvente_l character varying(15) COLLATE pg_catalog."default",
    nb_log integer DEFAULT 0,
    nb_logind integer DEFAULT 0,
    nb_logindgr integer DEFAULT 0,
    nb_logcol integer DEFAULT 0,
    nb_logaide integer DEFAULT 0,
    l_observ character varying(255) COLLATE pg_catalog."default",
    date_sai timestamp without time zone,
    date_maj timestamp without time zone,
    l_phase character varying(20) COLLATE pg_catalog."default",
    nb_log_r integer DEFAULT 0,
    nb_logind_r integer DEFAULT 0,
    nb_logindgr_r integer DEFAULT 0,
    nb_logcol_r integer DEFAULT 0,
    nb_logaide_r integer DEFAULT 0,
    l_pvente_lot integer,
    l_tact character varying(2) COLLATE pg_catalog."default" DEFAULT '00'::character varying,
    l_tact_99 character varying(80) COLLATE pg_catalog."default",
    l_nom_equ character varying(100) COLLATE pg_catalog."default",
    nb_logaide_loc_r integer,
    nb_logaide_acc_r integer,
    l_lnom character varying(250) COLLATE pg_catalog."default",
    epci character varying(10) COLLATE pg_catalog."default",
    CONSTRAINT an_amt_lot_mixte_pkey PRIMARY KEY (idgeolf)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE m_amenagement.an_amt_lot_mixte
    OWNER to create_sig;

GRANT ALL ON TABLE m_amenagement.an_amt_lot_mixte TO sig_create;

GRANT ALL ON TABLE m_amenagement.an_amt_lot_mixte TO create_sig;

GRANT SELECT ON TABLE m_amenagement.an_amt_lot_mixte TO sig_read;

GRANT INSERT, SELECT, UPDATE, DELETE ON TABLE m_amenagement.an_amt_lot_mixte TO sig_edit;

COMMENT ON TABLE m_amenagement.an_amt_lot_mixte
    IS 'Table alphanumérique contenant les données des lots à vocation mixte';

COMMENT ON COLUMN m_amenagement.an_amt_lot_mixte.idgeolf
    IS 'Identifiant unique de l''entité géographique lot';

COMMENT ON COLUMN m_amenagement.an_amt_lot_mixte.surf
    IS 'Surface parcellaire occupée du lot';

COMMENT ON COLUMN m_amenagement.an_amt_lot_mixte.l_surf_l
    IS 'Surface littérale parcellaire occupée du lot';

COMMENT ON COLUMN m_amenagement.an_amt_lot_mixte.op_sai
    IS 'Libellé de l''opérateur de saisie';

COMMENT ON COLUMN m_amenagement.an_amt_lot_mixte.org_sai
    IS 'Libellé de l''organisme de saisie';

COMMENT ON COLUMN m_amenagement.an_amt_lot_mixte.l_pvente
    IS 'Prix de vente du lot en HT (€/m²)';

COMMENT ON COLUMN m_amenagement.an_amt_lot_mixte.l_pvente_l
    IS 'Prix littéral de vente du lot en HT (ex:50€/m²)';

COMMENT ON COLUMN m_amenagement.an_amt_lot_mixte.nb_log
    IS 'Nombre total de logements';

COMMENT ON COLUMN m_amenagement.an_amt_lot_mixte.nb_logind
    IS 'Nombre de logements individuels';

COMMENT ON COLUMN m_amenagement.an_amt_lot_mixte.nb_logindgr
    IS 'Nombre de logements individuels groupés';

COMMENT ON COLUMN m_amenagement.an_amt_lot_mixte.nb_logcol
    IS 'Nombre de logements collectifs';

COMMENT ON COLUMN m_amenagement.an_amt_lot_mixte.nb_logaide
    IS 'Dont nombre de logements aidés';

COMMENT ON COLUMN m_amenagement.an_amt_lot_mixte.l_observ
    IS 'Observations diverses';

COMMENT ON COLUMN m_amenagement.an_amt_lot_mixte.date_sai
    IS 'Date de saisie des données attributaires';

COMMENT ON COLUMN m_amenagement.an_amt_lot_mixte.date_maj
    IS 'Date de mise à jour des données attributaires';

COMMENT ON COLUMN m_amenagement.an_amt_lot_mixte.l_phase
    IS 'Information facultative sur l''appartenance du lot à un éventuel phasage de l''opération';

COMMENT ON COLUMN m_amenagement.an_amt_lot_mixte.nb_log_r
    IS 'Nombre de logements total réalisé';

COMMENT ON COLUMN m_amenagement.an_amt_lot_mixte.nb_logind_r
    IS 'Nombre de logements individuels réalisé';

COMMENT ON COLUMN m_amenagement.an_amt_lot_mixte.nb_logindgr_r
    IS 'Nombre de logements individuels groupés réalisé';

COMMENT ON COLUMN m_amenagement.an_amt_lot_mixte.nb_logcol_r
    IS 'Nombre de logements collectifs réalisé';

COMMENT ON COLUMN m_amenagement.an_amt_lot_mixte.nb_logaide_r
    IS 'Nombre de logements aidés réalisé';

COMMENT ON COLUMN m_amenagement.an_amt_lot_mixte.l_pvente_lot
    IS 'Prix de vente du lot (ht)';

COMMENT ON COLUMN m_amenagement.an_amt_lot_mixte.l_tact
    IS 'Type d''activité présent sur le lot';

COMMENT ON COLUMN m_amenagement.an_amt_lot_mixte.l_tact_99
    IS 'Précision de l''activité du lot (si Autre sélectionné dans l_tact)';

COMMENT ON COLUMN m_amenagement.an_amt_lot_mixte.l_nom_equ
    IS 'Libellé des équipements prévus sur le lot';

COMMENT ON COLUMN m_amenagement.an_amt_lot_mixte.nb_logaide_loc_r
    IS 'Nombre de logements aidés en location réalisé';

COMMENT ON COLUMN m_amenagement.an_amt_lot_mixte.nb_logaide_acc_r
    IS 'Nombre de logements aidés en accession réalisé';

COMMENT ON COLUMN m_amenagement.an_amt_lot_mixte.l_lnom
    IS 'Nom(s) du ou des acquéreurs du lot ou d''une partie des bâtiments';
    

COMMENT ON COLUMN m_amenagement.an_amt_lot_mixte.epci
    IS 'Autorité compétente';

-- ############################################################## [an_amt_site_equ] ####################################################################

-- Table: m_amenagement.an_amt_site_equ

-- DROP TABLE m_amenagement.an_amt_site_equ;

CREATE TABLE m_amenagement.an_amt_site_equ
(
    idgeopo integer NOT NULL,
    idsite character varying(10) COLLATE pg_catalog."default",
    site_nom character varying(80) COLLATE pg_catalog."default",
    site_etat character varying(2) COLLATE pg_catalog."default" DEFAULT '00'::character varying,
    op_sai character varying(80) COLLATE pg_catalog."default",
    org_sai character varying(80) COLLATE pg_catalog."default",
    z_mai_ouvr character varying(80) COLLATE pg_catalog."default",
    z_compet character varying(80) COLLATE pg_catalog."default",
    z_amng character varying(80) COLLATE pg_catalog."default",
    z_gest character varying(80) COLLATE pg_catalog."default",
    z_anim character varying(80) COLLATE pg_catalog."default",
    z_comm character varying(80) COLLATE pg_catalog."default",
    contact character varying(80) COLLATE pg_catalog."default",
    date_sai timestamp without time zone,
    date_maj timestamp without time zone,
    epci character varying(10) COLLATE pg_catalog."default",
    CONSTRAINT an_amt_site_equ_pkey PRIMARY KEY (idgeopo),
    CONSTRAINT an_amt_site_equ_etat_fkey FOREIGN KEY (site_etat)
        REFERENCES m_activite_eco.lt_eco_etat (code) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE m_amenagement.an_amt_site_equ
    OWNER to create_sig;

GRANT ALL ON TABLE m_amenagement.an_amt_site_equ TO sig_create;

GRANT SELECT ON TABLE m_amenagement.an_amt_site_equ TO sig_read;

GRANT ALL ON TABLE m_amenagement.an_amt_site_equ TO create_sig;

GRANT INSERT, SELECT, UPDATE, DELETE ON TABLE m_amenagement.an_amt_site_equ TO sig_edit;

COMMENT ON TABLE m_amenagement.an_amt_site_equ
    IS 'Information alphanumérique sur les Sites à vocation équipement. Les objets virtuels de référence sont gérés dans le schéma r_objet';

COMMENT ON COLUMN m_amenagement.an_amt_site_equ.idgeopo
    IS 'Identifiant unique géographique de référence de l''objet virtuel';

COMMENT ON COLUMN m_amenagement.an_amt_site_equ.idsite
    IS 'Identifiant du site équipement';

COMMENT ON COLUMN m_amenagement.an_amt_site_equ.site_nom
    IS 'Libellé du site';

COMMENT ON COLUMN m_amenagement.an_amt_site_equ.site_etat
    IS 'Code de l''état du site';

COMMENT ON COLUMN m_amenagement.an_amt_site_equ.op_sai
    IS 'Libellé de la personne ayant saisie la mise à jour';

COMMENT ON COLUMN m_amenagement.an_amt_site_equ.org_sai
    IS 'Organisme de saisie dont dépend l''opérateur de saisie';

COMMENT ON COLUMN m_amenagement.an_amt_site_equ.z_mai_ouvr
    IS 'Nom du maître d''ouvrage';

COMMENT ON COLUMN m_amenagement.an_amt_site_equ.z_compet
    IS 'Nom de la collectivité ayant dans ses compétences le développement de la zone';

COMMENT ON COLUMN m_amenagement.an_amt_site_equ.z_amng
    IS 'Nom de l''aménageur de la zone';

COMMENT ON COLUMN m_amenagement.an_amt_site_equ.z_gest
    IS 'Nom du gestionnaire de la zone';

COMMENT ON COLUMN m_amenagement.an_amt_site_equ.z_anim
    IS 'Nom de l''animateur de la zone';

COMMENT ON COLUMN m_amenagement.an_amt_site_equ.z_comm
    IS 'Structure de contact pour la commercialisation';

COMMENT ON COLUMN m_amenagement.an_amt_site_equ.contact
    IS 'Libellé de la personne contact pour la commercialisation';

COMMENT ON COLUMN m_amenagement.an_amt_site_equ.date_sai
    IS 'Date de saisie des données attributaires';

COMMENT ON COLUMN m_amenagement.an_amt_site_equ.date_maj
    IS 'Date de mise à jour des données attributaires';
COMMENT ON CONSTRAINT an_amt_site_equ_pkey ON m_amenagement.an_amt_site_equ
    IS 'Clé primaire de la table an_amt_site_equ';


COMMENT ON COLUMN m_amenagement.an_amt_site_equ.epci
    IS 'Autorité compétente';

-- ############################################################## [an_amt_site_hab_mixte] ####################################################################

-- Table: m_amenagement.an_amt_site_hab_mixte

-- DROP TABLE m_amenagement.an_amt_site_hab_mixte;

CREATE TABLE m_amenagement.an_amt_site_hab_mixte
(
    idproc character varying(5) COLLATE pg_catalog."default" NOT NULL,
    nb_log integer DEFAULT 0,
    nb_logind integer DEFAULT 0,
    nb_logindgr integer DEFAULT 0,
    nb_logcol integer DEFAULT 0,
    nb_logaide integer DEFAULT 0,
    nb_logaide_loc integer DEFAULT 0,
    nb_logaide_acc integer DEFAULT 0,
    nb_log_r integer DEFAULT 0,
    nb_logind_r integer DEFAULT 0,
    nb_logindgr_r integer DEFAULT 0,
    nb_logcol_r integer DEFAULT 0,
    nb_logaide_r integer DEFAULT 0,
    nb_logaide_loc_r integer DEFAULT 0,
    nb_logaide_acc_r integer DEFAULT 0,
    date_sai timestamp without time zone,
    date_maj timestamp without time zone,
    observ character varying(1000) COLLATE pg_catalog."default",
    CONSTRAINT an_amt_site_hab_mixte_pkey PRIMARY KEY (idproc)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE m_amenagement.an_amt_site_hab_mixte
    OWNER to create_sig;

GRANT ALL ON TABLE m_amenagement.an_amt_site_hab_mixte TO sig_create;

GRANT SELECT ON TABLE m_amenagement.an_amt_site_hab_mixte TO sig_read;

GRANT ALL ON TABLE m_amenagement.an_amt_site_hab_mixte TO create_sig;

GRANT INSERT, SELECT, UPDATE, DELETE ON TABLE m_amenagement.an_amt_site_hab_mixte TO sig_edit;

GRANT ALL ON TABLE m_amenagement.an_amt_site_hab_mixte TO sig_stage WITH GRANT OPTION;

COMMENT ON TABLE m_amenagement.an_amt_site_hab_mixte
    IS 'Information alphanumérique sur les Sites à vocation habitat et mixte concernant le programme de logements';

COMMENT ON COLUMN m_amenagement.an_amt_site_hab_mixte.idproc
    IS 'Identifiant unique de la procédure';

COMMENT ON COLUMN m_amenagement.an_amt_site_hab_mixte.nb_log
    IS 'Nombre total de logements';

COMMENT ON COLUMN m_amenagement.an_amt_site_hab_mixte.nb_logind
    IS 'Nombre de logements individuels';

COMMENT ON COLUMN m_amenagement.an_amt_site_hab_mixte.nb_logindgr
    IS 'Nombre de logements individuels groupés';

COMMENT ON COLUMN m_amenagement.an_amt_site_hab_mixte.nb_logcol
    IS 'Nombre de logements collectifs';

COMMENT ON COLUMN m_amenagement.an_amt_site_hab_mixte.nb_logaide
    IS 'Dont nombre de logements aidés';

COMMENT ON COLUMN m_amenagement.an_amt_site_hab_mixte.nb_logaide_loc
    IS 'Nombre de logements aidés en location programmé';

COMMENT ON COLUMN m_amenagement.an_amt_site_hab_mixte.nb_logaide_acc
    IS 'Nombre de logements aidés en accession programmé';

COMMENT ON COLUMN m_amenagement.an_amt_site_hab_mixte.nb_log_r
    IS 'Nombre de logements total réalisé';

COMMENT ON COLUMN m_amenagement.an_amt_site_hab_mixte.nb_logind_r
    IS 'Nombre de logements individuels réalisé';

COMMENT ON COLUMN m_amenagement.an_amt_site_hab_mixte.nb_logindgr_r
    IS 'Nombre de logements individuels groupés réalisé';

COMMENT ON COLUMN m_amenagement.an_amt_site_hab_mixte.nb_logcol_r
    IS 'Nombre de logements collectifs réalisé';

COMMENT ON COLUMN m_amenagement.an_amt_site_hab_mixte.nb_logaide_r
    IS 'Nombre de logements aidés réalisé';

COMMENT ON COLUMN m_amenagement.an_amt_site_hab_mixte.nb_logaide_loc_r
    IS 'Nombre de logements aidés en location réalisé';

COMMENT ON COLUMN m_amenagement.an_amt_site_hab_mixte.nb_logaide_acc_r
    IS 'Nombre de logements aidés en accession réalisé';

COMMENT ON COLUMN m_amenagement.an_amt_site_hab_mixte.date_sai
    IS 'Date de saisie des données attributaires';

COMMENT ON COLUMN m_amenagement.an_amt_site_hab_mixte.date_maj
    IS 'Date de mise à jour des données attributaires';

COMMENT ON COLUMN m_amenagement.an_amt_site_hab_mixte.observ
    IS 'Observations diverses';

-- ############################################################## [an_amt_proc_media] ##################################################################

-- Table: m_amenagement.an_amt_proc_media

-- DROP TABLE m_amenagement.an_amt_proc_media;

CREATE TABLE m_amenagement.an_amt_proc_media
(
    gid integer NOT NULL DEFAULT nextval('m_amenagement.an_amt_proc_media_seq'::regclass),
    id text COLLATE pg_catalog."default",
    media text COLLATE pg_catalog."default",
    miniature bytea,
    n_fichier text COLLATE pg_catalog."default",
    t_fichier text COLLATE pg_catalog."default",
    op_sai character varying(20) COLLATE pg_catalog."default",
    date_sai timestamp without time zone,
    l_doc character varying(100) COLLATE pg_catalog."default",
    t_doc character varying(2) COLLATE pg_catalog."default" DEFAULT '00',		
    CONSTRAINT an_amt_proc_media_pkey PRIMARY KEY (gid),
    CONSTRAINT an_amt_proc_media_t_doc_fkey FOREIGN KEY (t_doc)
    REFERENCES m_activite_eco.lt_eco_tdocmedia (code) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE m_amenagement.an_amt_proc_media
    OWNER to create_sig;

GRANT ALL ON TABLE m_amenagement.an_amt_proc_media TO sig_create;

GRANT SELECT ON TABLE m_amenagement.an_amt_proc_media TO sig_read;

GRANT ALL ON TABLE m_amenagement.an_amt_proc_media TO create_sig;

GRANT INSERT, SELECT, UPDATE, DELETE ON TABLE m_amenagement.an_amt_proc_media TO sig_edit;

COMMENT ON TABLE m_amenagement.an_amt_proc_media
    IS 'Table gérant les documents intégrés en lien avec un évènement';

COMMENT ON COLUMN m_amenagement.an_amt_proc_media.id
    IS 'Identifiant interne non signifiant de l''objet saisi';

COMMENT ON COLUMN m_amenagement.an_amt_proc_media.media
    IS 'Champ Média de GEO';

COMMENT ON COLUMN m_amenagement.an_amt_proc_media.miniature
    IS 'Champ miniature de GEO';

COMMENT ON COLUMN m_amenagement.an_amt_proc_media.n_fichier
    IS 'Nom du fichier';

COMMENT ON COLUMN m_amenagement.an_amt_proc_media.t_fichier
    IS 'Type de média dans GEO';

COMMENT ON COLUMN m_amenagement.an_amt_proc_media.op_sai
    IS 'Opérateur de saisie (par défaut login de connexion à GEO)';

COMMENT ON COLUMN m_amenagement.an_amt_proc_media.date_sai
    IS 'Date de la saisie du document';

COMMENT ON COLUMN m_amenagement.an_amt_proc_media.l_doc
    IS 'Titre du document ou légère description';
    
COMMENT ON COLUMN m_amenagement.an_amt_proc_media.t_doc
    IS 'Type de document';

COMMENT ON COLUMN m_amenagement.an_amt_proc_media.gid
    IS 'Compteur (identifiant interne)';

-- ####################################################################################################################################################
-- ###                                                              TABLE R_OBJET                                                                   ###
-- ####################################################################################################################################################


-- ############################################################## [geo_objet_empesp_pu] ####################################################################

-- Table: r_objet.geo_objet_empesp_pu

-- DROP TABLE r_objet.geo_objet_empesp_pu;

CREATE TABLE r_objet.geo_objet_empesp_pu
(
    idgeopu integer NOT NULL,
    op_sai character varying(80) COLLATE pg_catalog."default",
    src_geom character varying(2) COLLATE pg_catalog."default" DEFAULT '00'::character varying,
    sup_m2 double precision,
    geom geometry(MultiPolygon,2154) NOT NULL,
    date_sai timestamp without time zone,
    date_maj timestamp without time zone,
    CONSTRAINT geo_objet_empesp_pu_pkey PRIMARY KEY (idgeopu),
    CONSTRAINT geo_objet_empesp_pu_srcgeom_fkey FOREIGN KEY (src_geom)
        REFERENCES r_objet.lt_src_geom (code) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE r_objet.geo_objet_empesp_pu
    OWNER to create_sig;

GRANT SELECT ON TABLE r_objet.geo_objet_empesp_pu TO sig_read;

GRANT ALL ON TABLE r_objet.geo_objet_empesp_pu TO sig_create;

GRANT ALL ON TABLE r_objet.geo_objet_empesp_pu TO create_sig;

GRANT INSERT, SELECT, UPDATE, DELETE ON TABLE r_objet.geo_objet_empesp_pu TO sig_edit;

COMMENT ON TABLE r_objet.geo_objet_empesp_pu
    IS 'Données géographiques contenant les espaces publics';

COMMENT ON COLUMN r_objet.geo_objet_empesp_pu.idgeopu
    IS 'Identifiant unique de l''objet';

COMMENT ON COLUMN r_objet.geo_objet_empesp_pu.op_sai
    IS 'Opérateur de saisir d''objet à l''ARC';

COMMENT ON COLUMN r_objet.geo_objet_empesp_pu.src_geom
    IS 'Référentiel spatial de saisie';

COMMENT ON COLUMN r_objet.geo_objet_empesp_pu.sup_m2
    IS 'Surface totale de l''objet en m²';

COMMENT ON COLUMN r_objet.geo_objet_empesp_pu.geom
    IS 'Champ contenant la géométrie';

COMMENT ON COLUMN r_objet.geo_objet_empesp_pu.date_sai
    IS 'Date de saisie de l''objet';

COMMENT ON COLUMN r_objet.geo_objet_empesp_pu.date_maj
    IS 'Date de mise à jour de l''objet';

-- ############################################################## [geo_objet_fon_lot] ####################################################################

-- Table: r_objet.geo_objet_fon_lot

-- DROP TABLE r_objet.geo_objet_fon_lot;

CREATE TABLE r_objet.geo_objet_fon_lot
(
    idgeolf integer NOT NULL,
    op_sai character varying(80) COLLATE pg_catalog."default",
    src_geom character varying(2) COLLATE pg_catalog."default" DEFAULT '00'::character varying,
    sup_m2 double precision,
    l_voca character varying(2) COLLATE pg_catalog."default" DEFAULT '00'::character varying,
    geom geometry(MultiPolygon,2154) NOT NULL,
    date_sai timestamp without time zone,
    date_maj timestamp without time zone,
    l_nom character varying(80) COLLATE pg_catalog."default",
    CONSTRAINT geo_objet_fon_lot_pkey PRIMARY KEY (idgeolf),
    CONSTRAINT geo_objet_fon_lot_scrgeom_fkey FOREIGN KEY (src_geom)
        REFERENCES r_objet.lt_src_geom (code) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT lt_objet_vocafon_fkey FOREIGN KEY (l_voca)
        REFERENCES r_objet.lt_objet_vocafon (code) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE r_objet.geo_objet_fon_lot
    OWNER to create_sig;

GRANT SELECT ON TABLE r_objet.geo_objet_fon_lot TO sig_read;

GRANT ALL ON TABLE r_objet.geo_objet_fon_lot TO sig_create;

GRANT ALL ON TABLE r_objet.geo_objet_fon_lot TO create_sig;

GRANT INSERT, SELECT, UPDATE, DELETE ON TABLE r_objet.geo_objet_fon_lot TO sig_edit;

COMMENT ON TABLE r_objet.geo_objet_fon_lot
    IS 'Données géographiques contenant les lots fonciers des sites';

COMMENT ON COLUMN r_objet.geo_objet_fon_lot.idgeolf
    IS 'Identifiant unique de l''objet';

COMMENT ON COLUMN r_objet.geo_objet_fon_lot.op_sai
    IS 'Opérateur de saisir d''objet à l''ARC';

COMMENT ON COLUMN r_objet.geo_objet_fon_lot.src_geom
    IS 'Référentiel spatial de saisie';

COMMENT ON COLUMN r_objet.geo_objet_fon_lot.sup_m2
    IS 'Surface totale de l''objet en m²';

COMMENT ON COLUMN r_objet.geo_objet_fon_lot.l_voca
    IS 'Vocation du foncier';

COMMENT ON COLUMN r_objet.geo_objet_fon_lot.geom
    IS 'Champ contenant la géométrie';

COMMENT ON COLUMN r_objet.geo_objet_fon_lot.date_sai
    IS 'Date de saisie de l''objet';

COMMENT ON COLUMN r_objet.geo_objet_fon_lot.date_maj
    IS 'Date de mise à jour';

COMMENT ON COLUMN r_objet.geo_objet_fon_lot.l_nom
    IS 'Nom de lot donné au moment du plan d''aménagement (ex : lot 1)';


-- Trigger: t_t1_foncier_insert_date_maj

-- DROP TRIGGER t_t1_foncier_insert_date_maj ON r_objet.geo_objet_fon_lot;

CREATE TRIGGER t_t1_foncier_insert_date_maj
    BEFORE INSERT OR UPDATE 
    ON r_objet.geo_objet_fon_lot
    FOR EACH ROW
    EXECUTE PROCEDURE public.ft_r_timestamp_maj();

-- Trigger: t_t2_foncier_insert_surf

-- DROP TRIGGER t_t2_foncier_insert_surf ON r_objet.geo_objet_fon_lot;

CREATE TRIGGER t_t2_foncier_insert_surf
    BEFORE INSERT OR UPDATE OF geom
    ON r_objet.geo_objet_fon_lot
    FOR EACH ROW
    EXECUTE PROCEDURE public.ft_r_sup_m2_maj();

-- Trigger: t_t3_foncier_l_nom

-- DROP TRIGGER t_t3_foncier_l_nom ON r_objet.geo_objet_fon_lot;

CREATE TRIGGER t_t3_foncier_l_nom
    BEFORE INSERT OR UPDATE OF l_nom
    ON r_objet.geo_objet_fon_lot
    FOR EACH ROW
    EXECUTE PROCEDURE r_objet.ft_m_foncier_l_nom();

-- ####################################################################################################################################################
-- ###                                                              TABLE M_FONCIER                                                                 ###
-- ####################################################################################################################################################

-- ############################################################## [an_fon_doc_media] ####################################################################

-- Table: m_foncier.an_fon_doc_media

-- DROP TABLE m_foncier.an_fon_doc_media;

CREATE TABLE m_foncier.an_fon_doc_media
(
    gid integer NOT NULL DEFAULT nextval('m_foncier.an_fon_doc_media_gid_seq'::regclass),
    id character varying(10) COLLATE pg_catalog."default",
    media text COLLATE pg_catalog."default",
    miniature bytea,
    n_fichier text COLLATE pg_catalog."default",
    t_fichier text COLLATE pg_catalog."default",
    op_sai character varying(100) COLLATE pg_catalog."default",
    date_sai timestamp without time zone,
    l_type character varying(2) COLLATE pg_catalog."default",
    l_prec character varying(254) COLLATE pg_catalog."default",
    CONSTRAINT an_fon_doc_media_pkey PRIMARY KEY (gid),
    CONSTRAINT an_fon_doc_media_fkey FOREIGN KEY (l_type)
        REFERENCES m_foncier.lt_ces_doc (l_type) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE m_foncier.an_fon_doc_media
    OWNER to create_sig;

GRANT ALL ON TABLE m_foncier.an_fon_doc_media TO sig_create;

GRANT SELECT ON TABLE m_foncier.an_fon_doc_media TO sig_read;

GRANT ALL ON TABLE m_foncier.an_fon_doc_media TO create_sig;

GRANT INSERT, SELECT, UPDATE, DELETE ON TABLE m_foncier.an_fon_doc_media TO sig_edit;

COMMENT ON TABLE m_foncier.an_fon_doc_media
    IS 'Table gérant la liste des documents de suivi d''une cession ou d''une acquisition et gérer avec le module média dans GEO (application Foncier)';

COMMENT ON COLUMN m_foncier.an_fon_doc_media.gid
    IS 'Identifiant unique non signifiant';

COMMENT ON COLUMN m_foncier.an_fon_doc_media.id
    IS 'Identifiant de cession ou d''acquisition';

COMMENT ON COLUMN m_foncier.an_fon_doc_media.media
    IS 'Champ Média de GEO';

COMMENT ON COLUMN m_foncier.an_fon_doc_media.miniature
    IS 'Champ miniature de GEO';

COMMENT ON COLUMN m_foncier.an_fon_doc_media.n_fichier
    IS 'Nom du fichier';

COMMENT ON COLUMN m_foncier.an_fon_doc_media.t_fichier
    IS 'Type de média dans GEO';

COMMENT ON COLUMN m_foncier.an_fon_doc_media.op_sai
    IS 'Libellé de l''opérateur ayant intégrer le document';

COMMENT ON COLUMN m_foncier.an_fon_doc_media.date_sai
    IS 'Date d''intégration du document';

COMMENT ON COLUMN m_foncier.an_fon_doc_media.l_type
    IS 'Code du type de document de cessions ou d''acquisitions';

COMMENT ON COLUMN m_foncier.an_fon_doc_media.l_prec
    IS 'Précision sur le document';

-- Trigger: t_t1_an_fon_doc_media_insert_date_sai

-- DROP TRIGGER t_t1_an_fon_doc_media_insert_date_sai ON m_foncier.an_fon_doc_media;

CREATE TRIGGER t_t1_an_fon_doc_media_insert_date_sai
    BEFORE INSERT
    ON m_foncier.an_fon_doc_media
    FOR EACH ROW
    EXECUTE PROCEDURE public.ft_r_timestamp_sai();

-- ############################################################## [an_cession] ####################################################################

-- Table: m_foncier.an_cession

-- DROP TABLE m_foncier.an_cession;

CREATE TABLE m_foncier.an_cession
(
    idces character varying(6) COLLATE pg_catalog."default" NOT NULL DEFAULT nextval('m_foncier.ces_seq'::regclass),
    l_rel character varying(2) COLLATE pg_catalog."default" DEFAULT '10'::character varying,
    l_compo boolean DEFAULT false,
    l_etat character varying(2) COLLATE pg_catalog."default" DEFAULT '00'::character varying,
    l_orga character varying(50) COLLATE pg_catalog."default" DEFAULT '00'::character varying,
    d_delib_1 date,
    d_delib_2 date,
    d_delib_3 date,
    insee character varying(5) COLLATE pg_catalog."default",
    l_date_i date,
    l_voca character varying(2) COLLATE pg_catalog."default" DEFAULT '00'::character varying,
    l_acque character varying(80) COLLATE pg_catalog."default",
    l_parcelle_i character varying(500) COLLATE pg_catalog."default",
    l_parcelle_f character varying(500) COLLATE pg_catalog."default",
    d_esti_1 date,
    d_esti_2 date,
    d_esti_3 date,
    l_esti_ht double precision,
    l_surf integer,
    l_condi character varying(2) COLLATE pg_catalog."default" DEFAULT '00'::character varying,
    l_type character varying(2) COLLATE pg_catalog."default" DEFAULT '00'::character varying,
    d_prome date,
    d_acte date,
    l_notaire character varying(2) COLLATE pg_catalog."default" DEFAULT '00'::character varying,
    l_notaire_a character varying(254) COLLATE pg_catalog."default",
    l_pvente_ht double precision,
    l_pvente_ttc double precision,
    l_frais_a boolean DEFAULT false,
    l_frais_b boolean DEFAULT false,
    l_frais_c boolean DEFAULT false,
    l_frais_d boolean DEFAULT false,
    l_frais_e boolean DEFAULT false,
    l_mfrais_ht double precision,
    l_mfrais_ttc double precision,
    l_pvente_s double precision,
    l_type_a boolean DEFAULT false,
    l_type_b boolean DEFAULT false,
    l_type_c boolean DEFAULT false,
    l_observ character varying(255) COLLATE pg_catalog."default",
    l_mfrais_g_ttc double precision,
    l_mfrais_n_ttc double precision,
    l_mfrais_a_ttc double precision,
    idces_d character varying(10) COLLATE pg_catalog."default",
    d_delib_4 date,
    date_sai timestamp without time zone,
    date_maj timestamp without time zone,
    op_sai character varying(80) COLLATE pg_catalog."default",
    CONSTRAINT an_cession_pkey PRIMARY KEY (idces),
    CONSTRAINT an_cession_rel_fkey FOREIGN KEY (l_rel)
        REFERENCES m_foncier.lt_rel_lot (l_rel) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT lt_ces_cond_fkey FOREIGN KEY (l_condi)
        REFERENCES m_foncier.lt_ces_cond (l_condi) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT lt_ces_etat_fkey FOREIGN KEY (l_etat)
        REFERENCES m_foncier.lt_ces_etat (l_etat) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT lt_ces_nota_fkey FOREIGN KEY (l_notaire)
        REFERENCES m_foncier.lt_ces_nota (l_notaire) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT lt_ces_orga_fkey FOREIGN KEY (l_orga)
        REFERENCES m_foncier.lt_ces_orga (l_orga) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT lt_ces_tact_fkey FOREIGN KEY (l_type)
        REFERENCES m_foncier.lt_ces_tact (l_type) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT lt_ces_voca_fkey FOREIGN KEY (l_voca)
        REFERENCES m_foncier.lt_ces_voca (l_voca) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE m_foncier.an_cession
    OWNER to create_sig;

GRANT ALL ON TABLE m_foncier.an_cession TO sig_create;

GRANT SELECT ON TABLE m_foncier.an_cession TO sig_read;

GRANT ALL ON TABLE m_foncier.an_cession TO create_sig;

GRANT INSERT, SELECT, UPDATE, DELETE ON TABLE m_foncier.an_cession TO sig_edit;

COMMENT ON TABLE m_foncier.an_cession
    IS 'Table alphanumérique contenant les données des cessions de lots';

COMMENT ON COLUMN m_foncier.an_cession.idces
    IS 'Identifiant du dossier de cession ou n° de dossier';

COMMENT ON COLUMN m_foncier.an_cession.l_rel
    IS 'Type de relation avec les lots';

COMMENT ON COLUMN m_foncier.an_cession.l_compo
    IS 'Composition de la cession : si true (coché) la cession ne correspond pas au lot vendu par le service économie (cf le commentaire pour plus de précision)';

COMMENT ON COLUMN m_foncier.an_cession.l_etat
    IS 'Code de l''état du dossier de cession';

COMMENT ON COLUMN m_foncier.an_cession.l_orga
    IS 'Code du nom de l''organisme';

COMMENT ON COLUMN m_foncier.an_cession.d_delib_1
    IS 'Date de la délibération de l''organisme cédant 1 ou de décision du président en cas de droit de préemption';

COMMENT ON COLUMN m_foncier.an_cession.d_delib_2
    IS 'Date de la délibération de l''organisme cédant 2';

COMMENT ON COLUMN m_foncier.an_cession.d_delib_3
    IS 'Date de la délibération de l''organisme cédant 3';

COMMENT ON COLUMN m_foncier.an_cession.insee
    IS 'Code insee de la commune';

COMMENT ON COLUMN m_foncier.an_cession.l_date_i
    IS 'Date d''ouverture du dossier dans le SIG';

COMMENT ON COLUMN m_foncier.an_cession.l_voca
    IS 'Code de la vocation de la cession';

COMMENT ON COLUMN m_foncier.an_cession.l_acque
    IS 'Nom de l''acquéreur';

COMMENT ON COLUMN m_foncier.an_cession.l_parcelle_i
    IS 'Numéro(s) de(s) parcelle(s) initiale(s) concernée(s) par le périmètre';

COMMENT ON COLUMN m_foncier.an_cession.l_parcelle_f
    IS 'Numéro(s) de(s) nouvelle(s) parcelle(s) concernée(s) par le périmètre';

COMMENT ON COLUMN m_foncier.an_cession.d_esti_1
    IS 'Date d''estimation des domaines 1';

COMMENT ON COLUMN m_foncier.an_cession.d_esti_2
    IS 'Date d''estimation des domaines 2';

COMMENT ON COLUMN m_foncier.an_cession.d_esti_3
    IS 'Date d''estimation des domaines 3';

COMMENT ON COLUMN m_foncier.an_cession.l_esti_ht
    IS 'Montant total de(s) estimation(s) des domaines';

COMMENT ON COLUMN m_foncier.an_cession.l_surf
    IS 'Superficie cadastrée du périmètre de cession en m²';

COMMENT ON COLUMN m_foncier.an_cession.l_condi
    IS 'Code de conditions de cession';

COMMENT ON COLUMN m_foncier.an_cession.l_type
    IS 'Code du type d''acte de cession';

COMMENT ON COLUMN m_foncier.an_cession.d_prome
    IS 'Date de la promesse de vente';

COMMENT ON COLUMN m_foncier.an_cession.d_acte
    IS 'Date de l''acte';

COMMENT ON COLUMN m_foncier.an_cession.l_notaire
    IS 'Code du nom de l''étude notariale';

COMMENT ON COLUMN m_foncier.an_cession.l_notaire_a
    IS 'Nom de l''étude notariale si pas dans la liste des études notariales du champ l_notaire';

COMMENT ON COLUMN m_foncier.an_cession.l_pvente_ht
    IS 'Montant de la vente HT';

COMMENT ON COLUMN m_foncier.an_cession.l_pvente_ttc
    IS 'Montant de la vente TTC';

COMMENT ON COLUMN m_foncier.an_cession.l_frais_a
    IS 'Type de frais : aucun (champ non utilisé)';

COMMENT ON COLUMN m_foncier.an_cession.l_frais_b
    IS 'Type de frais : Géomètre  (champ non utilisé)';

COMMENT ON COLUMN m_foncier.an_cession.l_frais_c
    IS 'Type de frais : Notaire  (champ non utilisé)';

COMMENT ON COLUMN m_foncier.an_cession.l_frais_d
    IS 'Type de frais : Agence immobilière  (champ non utilisé)';

COMMENT ON COLUMN m_foncier.an_cession.l_frais_e
    IS 'Type de frais : Indemnités diverses  (champ non utilisé)';

COMMENT ON COLUMN m_foncier.an_cession.l_mfrais_ht
    IS 'Frais cumulés de cession en € HT (champ non utilisé)';

COMMENT ON COLUMN m_foncier.an_cession.l_mfrais_ttc
    IS 'Frais cumulés de cession en € TTC';

COMMENT ON COLUMN m_foncier.an_cession.l_pvente_s
    IS 'Prix de vente en € HT au m² (sans les frais)';

COMMENT ON COLUMN m_foncier.an_cession.l_type_a
    IS 'Typologie du montant de cession : terrain';

COMMENT ON COLUMN m_foncier.an_cession.l_type_b
    IS 'Typologie du montant de cession : bâti';

COMMENT ON COLUMN m_foncier.an_cession.l_type_c
    IS 'Typologie du montant de cession : SHON';

COMMENT ON COLUMN m_foncier.an_cession.l_observ
    IS 'Commentaires';

COMMENT ON COLUMN m_foncier.an_cession.l_mfrais_g_ttc
    IS 'Montant des frais de géomètre TTC';

COMMENT ON COLUMN m_foncier.an_cession.l_mfrais_n_ttc
    IS 'Montant des frais de notaires ttc';

COMMENT ON COLUMN m_foncier.an_cession.l_mfrais_a_ttc
    IS 'Montant des autres frais (agence, ...)';



COMMENT ON COLUMN m_foncier.an_cession.idces_d
    IS 'Ancien numéro de cession DynMap';

COMMENT ON COLUMN m_foncier.an_cession.d_delib_4
    IS 'Date de la délibération de l''organisme cédant 4';

COMMENT ON COLUMN m_foncier.an_cession.date_sai
    IS 'Date de saisie';

COMMENT ON COLUMN m_foncier.an_cession.date_maj
    IS 'Date de mise à jour';

COMMENT ON COLUMN m_foncier.an_cession.op_sai
    IS 'Opérateur de saisie';

-- Trigger: t_t1_an_cession_date_sai

-- DROP TRIGGER t_t1_an_cession_date_sai ON m_foncier.an_cession;

CREATE TRIGGER t_t1_an_cession_date_sai
    BEFORE INSERT
    ON m_foncier.an_cession
    FOR EACH ROW
    EXECUTE PROCEDURE public.ft_r_timestamp_sai();

-- Trigger: t_t2_an_cession_date_maj

-- DROP TRIGGER t_t2_an_cession_date_maj ON m_foncier.an_cession;

CREATE TRIGGER t_t2_an_cession_date_maj
    BEFORE UPDATE 
    ON m_foncier.an_cession
    FOR EACH ROW
    EXECUTE PROCEDURE public.ft_r_timestamp_maj();

-- ############################################################## [an_fon_cession_horsarc_media] ####################################################################

-- Table: m_foncier.an_fon_doc_media

-- DROP TABLE m_foncier.an_fon_cession_horsarc_media;

CREATE TABLE m_foncier.an_fon_cession_horsarc_media
(
    gid integer NOT NULL DEFAULT nextval('m_foncier.an_fon_cession_horsarc_media_seq'::regclass),
    id integer,
    media text COLLATE pg_catalog."default",
    miniature bytea,
    n_fichier text COLLATE pg_catalog."default",
    t_fichier text COLLATE pg_catalog."default",
    op_sai character varying(100) COLLATE pg_catalog."default",
    date_sai timestamp without time zone,
    l_type character varying(2) COLLATE pg_catalog."default",
    l_prec character varying(254) COLLATE pg_catalog."default",
    CONSTRAINT an_fon_cession_horsarc_media_pkey PRIMARY KEY (gid),
    CONSTRAINT an_fon_cession_horsarc_media_fkey FOREIGN KEY (l_type)
        REFERENCES m_foncier.lt_ces_doc (l_type) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE m_foncier.an_fon_cession_horsarc_media
    OWNER to create_sig;

GRANT ALL ON TABLE m_foncier.an_fon_cession_horsarc_media TO sig_create;

GRANT SELECT ON TABLE m_foncier.an_fon_cession_horsarc_media TO sig_read;

GRANT ALL ON TABLE m_foncier.an_fon_cession_horsarc_media TO create_sig;

GRANT INSERT, SELECT, UPDATE, DELETE ON TABLE m_foncier.an_fon_cession_horsarc_media TO sig_edit;

COMMENT ON TABLE m_foncier.an_fon_cession_horsarc_media
    IS 'Table gérant la liste des documents de suivi des ventes pour les autres EPCI du Grand Compiégnois (hors ARC) avec le module média dans GEO (application Foncier)';

COMMENT ON COLUMN m_foncier.an_fon_cession_horsarc_media.gid
    IS 'Identifiant unique non signifiant';

COMMENT ON COLUMN m_foncier.an_fon_cession_horsarc_media.id
    IS 'Identifiant de cession ou d''acquisition';

COMMENT ON COLUMN m_foncier.an_fon_cession_horsarc_media.media
    IS 'Champ Média de GEO';

COMMENT ON COLUMN m_foncier.an_fon_cession_horsarc_media.miniature
    IS 'Champ miniature de GEO';

COMMENT ON COLUMN m_foncier.an_fon_cession_horsarc_media.n_fichier
    IS 'Nom du fichier';

COMMENT ON COLUMN m_foncier.an_fon_cession_horsarc_media.t_fichier
    IS 'Type de média dans GEO';

COMMENT ON COLUMN m_foncier.an_fon_cession_horsarc_media.op_sai
    IS 'Libellé de l''opérateur ayant intégrer le document';

COMMENT ON COLUMN m_foncier.an_fon_cession_horsarc_media.date_sai
    IS 'Date d''intégration du document';

COMMENT ON COLUMN m_foncier.an_fon_cession_horsarc_media.l_type
    IS 'Code du type de document de cessions ou d''acquisitions';

COMMENT ON COLUMN m_foncier.an_fon_cession_horsarc_media.l_prec
    IS 'Précision sur le document';

-- Trigger: t_t1_an_fon_doc_media_insert_date_sai

-- DROP TRIGGER t_t1_an_fon_doc_media_insert_date_sai ON m_foncier.an_fon_doc_media;

CREATE TRIGGER t_t1_an_fon_doc_media_insert_date_sai
    BEFORE INSERT
    ON m_foncier.an_fon_cession_horsarc_media
    FOR EACH ROW
    EXECUTE PROCEDURE public.ft_r_timestamp_sai();
    
-- ############################################################## [an_fon_cession_horsarc] ####################################################################

-- Table: m_foncier.an_fon_cession_horsarc

-- DROP TABLE m_foncier.an_fon_cession_horsarc;

CREATE TABLE m_foncier.an_fon_cession_horsarc
(
 gid integer NOT NULL DEFAULT nextval('m_foncier.an_fon_cession_horsarc_seq'::regclass),
    idgeolf integer NOT NULL,
    CONSTRAINT an_fon_cession_horsarc_pkey PRIMARY KEY (gid)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE m_foncier.an_fon_cession_horsarc
    OWNER to create_sig;

GRANT ALL ON TABLE m_foncier.an_fon_cession_horsarc TO sig_create;

GRANT SELECT ON TABLE m_foncier.an_fon_cession_horsarc TO sig_read;

GRANT ALL ON TABLE m_foncier.an_fon_cession_horsarc TO create_sig;

GRANT INSERT, SELECT, UPDATE, DELETE ON TABLE m_foncier.an_fon_cession_horsarc TO sig_edit;

COMMENT ON TABLE m_foncier.an_fon_cession_horsarc
    IS 'Table gérant les ventes des EPCI du Grand Compiégnois (hors ARC)';

COMMENT ON COLUMN m_foncier.an_fon_cession_horsarc.gid
    IS 'Identifiant unique non signifiant';

-- ####################################################################################################################################################
-- ###                                                              TABLE S_SIRENE                                                                  ###
-- ####################################################################################################################################################

-- ############################################################## [an_etablissement_api] ####################################################################
-- Table: s_sirene.an_etablissement_api

-- DROP TABLE s_sirene.an_etablissement_api;

CREATE TABLE s_sirene.an_etablissement_api
(
    gid integer NOT NULL DEFAULT nextval('s_sirene.an_etablissement_api_gid_seq'::regclass),
    date_maj timestamp without time zone,
    activiteprincipaleetablissement character varying(6) COLLATE pg_catalog."default",
    activiteprincipaleregistremetiersetablissement character varying(6) COLLATE pg_catalog."default",
    anneeeffectifsetablissement integer,
    caractereemployeuretablissement character varying(1) COLLATE pg_catalog."default",
    codecedex2etablissement character varying(9) COLLATE pg_catalog."default",
    codecedexetablissement character varying(9) COLLATE pg_catalog."default",
    codecommune2etablissement character varying(5) COLLATE pg_catalog."default",
    codecommuneetablissement character varying(5) COLLATE pg_catalog."default",
    codepaysetranger2etablissement character varying(5) COLLATE pg_catalog."default",
    codepaysetrangeretablissement character varying(5) COLLATE pg_catalog."default",
    codepostal2etablissement character varying(5) COLLATE pg_catalog."default",
    codepostaletablissement character varying(5) COLLATE pg_catalog."default",
    complementadresse2etablissement character varying(38) COLLATE pg_catalog."default",
    complementadresseetablissement character varying(38) COLLATE pg_catalog."default",
    datecreationetablissement timestamp without time zone,
    datedebut timestamp without time zone,
    datederniertraitementetablissement timestamp without time zone,
    denominationusuelleetablissement character varying(100) COLLATE pg_catalog."default",
    distributionspeciale2etablissement character varying(26) COLLATE pg_catalog."default",
    distributionspecialeetablissement character varying(26) COLLATE pg_catalog."default",
    enseigne1etablissement character varying(50) COLLATE pg_catalog."default",
    enseigne2etablissement character varying(50) COLLATE pg_catalog."default",
    enseigne3etablissement character varying(50) COLLATE pg_catalog."default",
    etablissementsiege boolean,
    etatadministratifetablissement character varying(1) COLLATE pg_catalog."default",
    indicerepetition2etablissement character varying(1) COLLATE pg_catalog."default",
    indicerepetitionetablissement character varying(1) COLLATE pg_catalog."default",
    libellecedex2etablissement character varying(100) COLLATE pg_catalog."default",
    libellecedexetablissement character varying(100) COLLATE pg_catalog."default",
    libellecommune2etablissement character varying(100) COLLATE pg_catalog."default",
    libellecommuneetablissement character varying(100) COLLATE pg_catalog."default",
    libellecommuneetranger2etablissement character varying(100) COLLATE pg_catalog."default",
    libellecommuneetrangeretablissement character varying(100) COLLATE pg_catalog."default",
    libellepaysetranger2etablissement character varying(100) COLLATE pg_catalog."default",
    libellepaysetrangeretablissement character varying(100) COLLATE pg_catalog."default",
    libellevoie2etablissement character varying(100) COLLATE pg_catalog."default",
    libellevoieetablissement character varying(100) COLLATE pg_catalog."default",
    nic character varying(5) COLLATE pg_catalog."default",
    nombreperiodesetablissement integer,
    nomenclatureactiviteprincipaleetablissement character varying(8) COLLATE pg_catalog."default",
    numerovoie2etablissement character varying(4) COLLATE pg_catalog."default",
    numerovoieetablissement character varying(4) COLLATE pg_catalog."default",
    siren character varying(9) COLLATE pg_catalog."default",
    siret character varying(14) COLLATE pg_catalog."default",
    statutdiffusionetablissement character varying(1) COLLATE pg_catalog."default",
    trancheeffectifsetablissement character varying(2) COLLATE pg_catalog."default",
    typevoie2etablissement character varying(4) COLLATE pg_catalog."default",
    typevoieetablissement character varying(4) COLLATE pg_catalog."default",
    recherche_etab_geo character varying(1000) COLLATE pg_catalog."default",
    nom_etab_geo character varying(1000) COLLATE pg_catalog."default",
    CONSTRAINT an_etablissement_api_pkey PRIMARY KEY (gid)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE s_sirene.an_etablissement_api
    OWNER to create_sig;

GRANT ALL ON TABLE s_sirene.an_etablissement_api TO sig_create;

GRANT ALL ON TABLE s_sirene.an_etablissement_api TO create_sig;

GRANT SELECT ON TABLE s_sirene.an_etablissement_api TO sig_read;

GRANT INSERT, SELECT, UPDATE, DELETE ON TABLE s_sirene.an_etablissement_api TO sig_edit;

COMMENT ON TABLE s_sirene.an_etablissement_api
    IS 'Liste des établissements de la base de données Sirene dans la nouvelle structure mise en production en avril 2019 et mise à jour via l''API Sirene.';

COMMENT ON COLUMN s_sirene.an_etablissement_api.gid
    IS 'Identifiant interne non signifiant';

COMMENT ON COLUMN s_sirene.an_etablissement_api.date_maj
    IS 'Date de mise à jour';

COMMENT ON COLUMN s_sirene.an_etablissement_api.activiteprincipaleetablissement
    IS 'Activité principale de l''établissement pendant la période active';

COMMENT ON COLUMN s_sirene.an_etablissement_api.activiteprincipaleregistremetiersetablissement
    IS 'Activité exercée par l''artisan inscrit au registre des métiers';

COMMENT ON COLUMN s_sirene.an_etablissement_api.anneeeffectifsetablissement
    IS 'Année de validité de la tranche d''effectif salarié de l''établissement';

COMMENT ON COLUMN s_sirene.an_etablissement_api.caractereemployeuretablissement
    IS 'Caractère employeur de l''établissement';

COMMENT ON COLUMN s_sirene.an_etablissement_api.codecedex2etablissement
    IS 'Code cedex de l''adresse secondaire';

COMMENT ON COLUMN s_sirene.an_etablissement_api.codecedexetablissement
    IS 'Code commune de l''établissement';

COMMENT ON COLUMN s_sirene.an_etablissement_api.codecommune2etablissement
    IS 'Code commune de l''adresse secondaire';

COMMENT ON COLUMN s_sirene.an_etablissement_api.codecommuneetablissement
    IS 'Code commune de l''établissement';

COMMENT ON COLUMN s_sirene.an_etablissement_api.codepaysetranger2etablissement
    IS 'Code Pays de l''adresse seondaire pour un établissement situé à l''étranger';

COMMENT ON COLUMN s_sirene.an_etablissement_api.codepaysetrangeretablissement
    IS 'Code Pays pour un établissement situé à l''étranger';

COMMENT ON COLUMN s_sirene.an_etablissement_api.codepostal2etablissement
    IS 'Code postal de l''adresse secondaire';

COMMENT ON COLUMN s_sirene.an_etablissement_api.codepostaletablissement
    IS 'Code postal';

COMMENT ON COLUMN s_sirene.an_etablissement_api.complementadresse2etablissement
    IS 'Complément d''adresse secondaire';

COMMENT ON COLUMN s_sirene.an_etablissement_api.complementadresseetablissement
    IS 'Complément d''adresse';

COMMENT ON COLUMN s_sirene.an_etablissement_api.datecreationetablissement
    IS 'Date de création de l''établissement';

COMMENT ON COLUMN s_sirene.an_etablissement_api.datedebut
    IS 'Date de début d''une période d''historique d''un établissement';

COMMENT ON COLUMN s_sirene.an_etablissement_api.datederniertraitementetablissement
    IS 'Date du dernier traitement de l''établissement dans le répertoire Sirene';

COMMENT ON COLUMN s_sirene.an_etablissement_api.denominationusuelleetablissement
    IS 'Dénomination usuelle de l''établissement';

COMMENT ON COLUMN s_sirene.an_etablissement_api.distributionspeciale2etablissement
    IS 'Distribution spéciale de l''adresse secondaire de l''établissement';

COMMENT ON COLUMN s_sirene.an_etablissement_api.distributionspecialeetablissement
    IS 'Distribution spéciale de l''établissement';

COMMENT ON COLUMN s_sirene.an_etablissement_api.enseigne1etablissement
    IS 'Première ligne d''enseigne de l''établissement';

COMMENT ON COLUMN s_sirene.an_etablissement_api.enseigne2etablissement
    IS 'Deuxième ligne d''enseigne de l''établissement';

COMMENT ON COLUMN s_sirene.an_etablissement_api.enseigne3etablissement
    IS 'Troisième ligne d''enseigne de l''établissement';

COMMENT ON COLUMN s_sirene.an_etablissement_api.etablissementsiege
    IS 'Qualité de siège ou non de l''établissement';

COMMENT ON COLUMN s_sirene.an_etablissement_api.etatadministratifetablissement
    IS 'Etat administratif de l''établissement';

COMMENT ON COLUMN s_sirene.an_etablissement_api.indicerepetition2etablissement
    IS 'Indice de répétition secondaire dans la voie';

COMMENT ON COLUMN s_sirene.an_etablissement_api.indicerepetitionetablissement
    IS 'Indice de répétition dans la voie';

COMMENT ON COLUMN s_sirene.an_etablissement_api.libellecedex2etablissement
    IS 'Libellé du code cedex de l''adresse secondaire';

COMMENT ON COLUMN s_sirene.an_etablissement_api.libellecedexetablissement
    IS 'Libellé du code cedex';

COMMENT ON COLUMN s_sirene.an_etablissement_api.libellecommune2etablissement
    IS 'Libellé de la commune de l''adresse secondaire';

COMMENT ON COLUMN s_sirene.an_etablissement_api.libellecommuneetablissement
    IS 'Libellé de la commune';

COMMENT ON COLUMN s_sirene.an_etablissement_api.libellecommuneetranger2etablissement
    IS 'Libellé de la commune de l''adresse secondaire pour un établissement situé à l''étranger';

COMMENT ON COLUMN s_sirene.an_etablissement_api.libellecommuneetrangeretablissement
    IS 'Libellé de la commune pour un établissement situé à l''étranger';

COMMENT ON COLUMN s_sirene.an_etablissement_api.libellepaysetranger2etablissement
    IS 'Libellé du Pays de l''adresse secondaire pour un établissement situé à l''étranger';

COMMENT ON COLUMN s_sirene.an_etablissement_api.libellepaysetrangeretablissement
    IS 'Libellé du Pays pour un établissement situé à l''étranger';

COMMENT ON COLUMN s_sirene.an_etablissement_api.libellevoie2etablissement
    IS 'Libellé de voie de l''adresse secondaire';

COMMENT ON COLUMN s_sirene.an_etablissement_api.libellevoieetablissement
    IS 'Libellé de voie';

COMMENT ON COLUMN s_sirene.an_etablissement_api.nic
    IS 'Numéro interne de classement de l''établissement';

COMMENT ON COLUMN s_sirene.an_etablissement_api.nombreperiodesetablissement
    IS 'Nombre de période historisé de l''établissement';

COMMENT ON COLUMN s_sirene.an_etablissement_api.nomenclatureactiviteprincipaleetablissement
    IS 'Nomenclature d''activité de la variable activitePrincipaleEtablissement';

COMMENT ON COLUMN s_sirene.an_etablissement_api.numerovoie2etablissement
    IS 'Numéro de la voie de l''adresse secondaire';

COMMENT ON COLUMN s_sirene.an_etablissement_api.numerovoieetablissement
    IS 'Numéro de la voie';

COMMENT ON COLUMN s_sirene.an_etablissement_api.siren
    IS 'Numéro SIREN';

COMMENT ON COLUMN s_sirene.an_etablissement_api.siret
    IS 'Numéro SIRET';

COMMENT ON COLUMN s_sirene.an_etablissement_api.statutdiffusionetablissement
    IS 'Statut de diffusion de l''établissement';

COMMENT ON COLUMN s_sirene.an_etablissement_api.trancheeffectifsetablissement
    IS 'Tranche d''effectif salarié de l''établissement';

COMMENT ON COLUMN s_sirene.an_etablissement_api.typevoie2etablissement
    IS 'Type de voie de l''adresse secondaire';

COMMENT ON COLUMN s_sirene.an_etablissement_api.typevoieetablissement
    IS 'Type de voie';

COMMENT ON COLUMN s_sirene.an_etablissement_api.recherche_etab_geo
    IS 'Attribut formatant le SIRET et l''ensemble des noms possibles de l''établissement (SIRENE + EPCI) et de l''unité légale (mise à jour à l''intégration des établissements)';

COMMENT ON COLUMN s_sirene.an_etablissement_api.nom_etab_geo
    IS 'Tout libellé de l''établissement ou de l''unité légale regroupé pour affichage dans fiche dans les appli GEO (mise à jour à l''intégration des établissements)';

-- Trigger: t_t1_date_maj

-- DROP TRIGGER t_t1_date_maj ON s_sirene.an_etablissement_api;

CREATE TRIGGER t_t1_date_maj
    BEFORE INSERT OR UPDATE 
    ON s_sirene.an_etablissement_api
    FOR EACH ROW
    EXECUTE PROCEDURE public.ft_r_timestamp_maj();

-- ############################################################## [an_unitelegale_api] ####################################################################

-- Table: s_sirene.an_unitelegale_api

-- DROP TABLE s_sirene.an_unitelegale_api;

CREATE TABLE s_sirene.an_unitelegale_api
(
    gid integer NOT NULL DEFAULT nextval('s_sirene.an_unitelegale_api_gid_seq'::regclass),
    date_maj timestamp without time zone,
    activiteprincipaleunitelegale character varying(6) COLLATE pg_catalog."default",
    anneecategorieentreprise integer,
    anneeeffectifsunitelegale integer,
    caractereemployeurunitelegale character varying(1) COLLATE pg_catalog."default",
    categorieentreprise character varying(3) COLLATE pg_catalog."default",
    categoriejuridiqueunitelegale character varying(4) COLLATE pg_catalog."default",
    datecreationunitelegale timestamp without time zone,
    datedebut timestamp without time zone,
    datederniertraitementunitelegale timestamp without time zone,
    denominationunitelegale character varying(120) COLLATE pg_catalog."default",
    denominationusuelle1unitelegale character varying(70) COLLATE pg_catalog."default",
    denominationusuelle2unitelegale character varying(70) COLLATE pg_catalog."default",
    denominationusuelle3unitelegale character varying(70) COLLATE pg_catalog."default",
    economiesocialesolidaireunitelegale character varying(1) COLLATE pg_catalog."default",
    etatadministratifunitelegale character varying(1) COLLATE pg_catalog."default",
    identifiantassociationunitelegale character varying(10) COLLATE pg_catalog."default",
    nicsiegeunitelegale character varying(5) COLLATE pg_catalog."default",
    nombreperiodesunitelegale integer,
    nomenclatureactiviteprincipaleunitelegale character varying(8) COLLATE pg_catalog."default",
    nomunitelegale character varying(100) COLLATE pg_catalog."default",
    nomusageunitelegale character varying(100) COLLATE pg_catalog."default",
    prenom1unitelegale character varying(20) COLLATE pg_catalog."default",
    prenom2unitelegale character varying(20) COLLATE pg_catalog."default",
    prenom3unitelegale character varying(20) COLLATE pg_catalog."default",
    prenom4unitelegale character varying(20) COLLATE pg_catalog."default",
    prenomusuelunitelegale character varying(20) COLLATE pg_catalog."default",
    pseudonymeunitelegale character varying(100) COLLATE pg_catalog."default",
    sexeunitelegale character varying(1) COLLATE pg_catalog."default",
    sigleunitelegale character varying(20) COLLATE pg_catalog."default",
    siren character varying(9) COLLATE pg_catalog."default",
    statutdiffusionunitelegale character varying(1) COLLATE pg_catalog."default",
    trancheeffectifsunitelegale character varying(2) COLLATE pg_catalog."default",
    unitepurgeeunitelegale character varying(4) COLLATE pg_catalog."default",
    CONSTRAINT an_unitelegale_api_pkey PRIMARY KEY (gid)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE s_sirene.an_unitelegale_api
    OWNER to create_sig;

GRANT ALL ON TABLE s_sirene.an_unitelegale_api TO sig_create;

GRANT ALL ON TABLE s_sirene.an_unitelegale_api TO create_sig;

GRANT SELECT ON TABLE s_sirene.an_unitelegale_api TO sig_read;

GRANT INSERT, SELECT, UPDATE, DELETE ON TABLE s_sirene.an_unitelegale_api TO sig_edit;

COMMENT ON TABLE s_sirene.an_unitelegale_api
    IS 'Liste des unités légales de la base de données Sirene dans la nouvelle structure mise en production en avril 2019 et mise à jour via l''API Sirene.';

COMMENT ON COLUMN s_sirene.an_unitelegale_api.date_maj
    IS 'Date de mise à jour des données';

COMMENT ON COLUMN s_sirene.an_unitelegale_api.activiteprincipaleunitelegale
    IS 'Activité principale de l''unité légale';

COMMENT ON COLUMN s_sirene.an_unitelegale_api.anneecategorieentreprise
    IS 'Année de validité de la catégorie d''entreprise';

COMMENT ON COLUMN s_sirene.an_unitelegale_api.anneeeffectifsunitelegale
    IS 'Année de validité de la tranche d''effectif salarié de l''unité légale';

COMMENT ON COLUMN s_sirene.an_unitelegale_api.caractereemployeurunitelegale
    IS 'Caractère employeur de l''unité légale';

COMMENT ON COLUMN s_sirene.an_unitelegale_api.categorieentreprise
    IS 'Catégorie à laquelle appartient l''entreprise';

COMMENT ON COLUMN s_sirene.an_unitelegale_api.categoriejuridiqueunitelegale
    IS 'Catégorie juridique de l''unité légale';

COMMENT ON COLUMN s_sirene.an_unitelegale_api.datecreationunitelegale
    IS 'Date de création de l''unité légale';

COMMENT ON COLUMN s_sirene.an_unitelegale_api.datedebut
    IS 'Date de début d''une période d''historique d''une unité légale';

COMMENT ON COLUMN s_sirene.an_unitelegale_api.datederniertraitementunitelegale
    IS 'Date du dernier traitement de l''unité légale dans le répertoire Sirene';

COMMENT ON COLUMN s_sirene.an_unitelegale_api.denominationunitelegale
    IS 'Dénomination de l''unité légale';

COMMENT ON COLUMN s_sirene.an_unitelegale_api.denominationusuelle1unitelegale
    IS 'Dénomination usuelle de l''unité légale';

COMMENT ON COLUMN s_sirene.an_unitelegale_api.denominationusuelle2unitelegale
    IS 'Dénomination usuelle de l''unité légale (deuxième champ)';

COMMENT ON COLUMN s_sirene.an_unitelegale_api.denominationusuelle3unitelegale
    IS 'Dénomination usuelle de l''unité légale (troisème champ)';

COMMENT ON COLUMN s_sirene.an_unitelegale_api.economiesocialesolidaireunitelegale
    IS 'Appartenance au champ de l''économie sociale et solidaire';

COMMENT ON COLUMN s_sirene.an_unitelegale_api.etatadministratifunitelegale
    IS 'Etat administratif de l''unité légale';

COMMENT ON COLUMN s_sirene.an_unitelegale_api.identifiantassociationunitelegale
    IS 'Numéro au Répertoire National des Associations';

COMMENT ON COLUMN s_sirene.an_unitelegale_api.nicsiegeunitelegale
    IS 'Numéro interne de classement de l''unité légale';

COMMENT ON COLUMN s_sirene.an_unitelegale_api.nombreperiodesunitelegale
    IS 'Nombre de périodes de l''unité légale';

COMMENT ON COLUMN s_sirene.an_unitelegale_api.nomenclatureactiviteprincipaleunitelegale
    IS 'Nomenclature d''activité de la variable activiteprincipaleunitelegale';

COMMENT ON COLUMN s_sirene.an_unitelegale_api.nomunitelegale
    IS 'Nom de naissance de la personne physique';

COMMENT ON COLUMN s_sirene.an_unitelegale_api.nomusageunitelegale
    IS 'Nom d''usage de la personne physique';

COMMENT ON COLUMN s_sirene.an_unitelegale_api.prenom1unitelegale
    IS 'Premier prénom déclaré pour une personne physique';

COMMENT ON COLUMN s_sirene.an_unitelegale_api.prenom2unitelegale
    IS 'Deuxième prénom déclaré pour une personne physique';

COMMENT ON COLUMN s_sirene.an_unitelegale_api.prenom3unitelegale
    IS 'Troisème prénom déclaré pour une personne physique';

COMMENT ON COLUMN s_sirene.an_unitelegale_api.prenom4unitelegale
    IS 'Quatrième prénom déclaré pour une personne physique';

COMMENT ON COLUMN s_sirene.an_unitelegale_api.prenomusuelunitelegale
    IS 'Prénom usuel de la personne physique';

COMMENT ON COLUMN s_sirene.an_unitelegale_api.pseudonymeunitelegale
    IS 'Pseudonyme de la personne physique';

COMMENT ON COLUMN s_sirene.an_unitelegale_api.sexeunitelegale
    IS 'Caractère féminin ou masculin de la personne physique';

COMMENT ON COLUMN s_sirene.an_unitelegale_api.sigleunitelegale
    IS 'Sigle de l''unité légale';

COMMENT ON COLUMN s_sirene.an_unitelegale_api.siren
    IS 'Numéro SIREN';

COMMENT ON COLUMN s_sirene.an_unitelegale_api.statutdiffusionunitelegale
    IS 'Statut de diffusion de l''unité légale';

COMMENT ON COLUMN s_sirene.an_unitelegale_api.trancheeffectifsunitelegale
    IS 'Tranche d''effectif salarié de l''unité légale';

COMMENT ON COLUMN s_sirene.an_unitelegale_api.unitepurgeeunitelegale
    IS 'Unité légale purgée';


-- Trigger: t_t1_date_maj

-- DROP TRIGGER t_t1_date_maj ON s_sirene.an_unitelegale_api;

CREATE TRIGGER t_t1_date_maj
    BEFORE INSERT OR UPDATE 
    ON s_sirene.an_unitelegale_api
    FOR EACH ROW
    EXECUTE PROCEDURE public.ft_r_timestamp_maj();

-- ####################################################################################################################################################
-- ###                                                                                                                                              ###
-- ###                                                             TABLE DE RELATION                                                                ### 
-- ###                                                                                                                                              ###
-- ####################################################################################################################################################

-- ####################################################################################################################################################
-- ###                                                       TABLE DE RELATION M_ACTIVITE_ECO                                                       ###
-- ####################################################################################################################################################


-- ############################################################## [lk_eco_contact] ####################################################################

-- Table: m_activite_eco.lk_eco_contact

-- DROP TABLE m_activite_eco.lk_eco_contact;

CREATE TABLE m_activite_eco.lk_eco_contact
(
    id integer NOT NULL DEFAULT nextval('m_activite_eco.lk_eco_contact_seq'::regclass),
    idcontact integer NOT NULL,
    idobjet character varying(15) NOT NULL COLLATE pg_catalog."default",
    CONSTRAINT lk_eco_contact_pkey PRIMARY KEY (id),
    CONSTRAINT lk_eco_contact_fkey FOREIGN KEY (idcontact)
        REFERENCES m_activite_eco.an_eco_contact (idcontact) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE m_activite_eco.lk_eco_contact
    OWNER to create_sig;

GRANT ALL ON TABLE m_activite_eco.lk_eco_contact TO sig_create;

GRANT SELECT ON TABLE m_activite_eco.lk_eco_contact TO sig_read;

GRANT ALL ON TABLE m_activite_eco.lk_eco_contact TO create_sig;

GRANT INSERT, SELECT, UPDATE, DELETE ON TABLE m_activite_eco.lk_eco_contact TO sig_edit;

COMMENT ON TABLE m_activite_eco.lk_eco_contact
    IS 'Table alphanumérique de l''ensemble des contacts liés à la thématique activité économique';

COMMENT ON COLUMN m_activite_eco.lk_eco_contact.id
    IS 'Identifiant unique non signifiant';

COMMENT ON COLUMN m_activite_eco.lk_eco_contact.idcontact
    IS 'Identifiant unique non signifiant du contact';

COMMENT ON COLUMN m_activite_eco.lk_eco_contact.idobjet
    IS 'Identifiant unique non signifiant de l''objet en référence';

-- ############################################################## [lk_eco_proc] ####################################################################

-- Table: m_activite_eco.lk_eco_proc

-- DROP TABLE m_activite_eco.lk_eco_proc;

CREATE TABLE m_activite_eco.lk_eco_proc
(
    id integer NOT NULL DEFAULT nextval('m_activite_eco.lk_eco_proc_seq'::regclass),
    idproc character varying(5) NOT NULL,
    idsite character varying(5) NOT NULL,
    CONSTRAINT lk_eco_proc_pkey PRIMARY KEY (id)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE m_activite_eco.lk_eco_proc
    OWNER to create_sig;

GRANT ALL ON TABLE m_activite_eco.lk_eco_proc TO sig_create;

GRANT ALL ON TABLE m_activite_eco.lk_eco_proc TO create_sig;

GRANT ALL ON TABLE m_activite_eco.lk_eco_proc TO sig_stage WITH GRANT OPTION;

GRANT SELECT ON TABLE m_activite_eco.lk_eco_proc TO sig_read;

GRANT INSERT, SELECT, UPDATE, DELETE ON TABLE m_activite_eco.lk_eco_proc TO sig_edit;

COMMENT ON TABLE m_activite_eco.lk_eco_proc
    IS 'Table alphanumérique de l''ensemble des procédures d''aménagement présentes sur le site';

COMMENT ON COLUMN m_activite_eco.lk_eco_proc.id
    IS 'Identifiant unique non signifiant';

COMMENT ON COLUMN m_activite_eco.lk_eco_proc.idproc
    IS 'Identifiant unique non signifiant de l''objet procédure';

COMMENT ON COLUMN m_activite_eco.lk_eco_proc.idsite
    IS 'Identifiant unique non signifiant de l''objet site';

-- ############################################################## [lk_eco_bati_site] ####################################################################

-- Table: m_activite_eco.lk_eco_bati_site

-- DROP TABLE m_activite_eco.lk_eco_bati_site;

CREATE TABLE m_activite_eco.lk_eco_bati_site
(
    id integer NOT NULL DEFAULT nextval('m_activite_eco.lk_eco_bati_site_seq'::regclass),
    idbati character varying(15) NOT NULL,
    idsite character varying(5) NOT NULL,
    CONSTRAINT lk_eco_bati_site_pkey PRIMARY KEY (id)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE m_activite_eco.lk_eco_bati_site
    OWNER to create_sig;

GRANT ALL ON TABLE m_activite_eco.lk_eco_bati_site TO sig_create;

GRANT ALL ON TABLE m_activite_eco.lk_eco_bati_site TO create_sig;

GRANT ALL ON TABLE m_activite_eco.lk_eco_bati_site TO sig_stage WITH GRANT OPTION;

GRANT SELECT ON TABLE m_activite_eco.lk_eco_bati_site TO sig_read;

GRANT INSERT, SELECT, UPDATE, DELETE ON TABLE m_activite_eco.lk_eco_bati_site TO sig_edit;

COMMENT ON TABLE m_activite_eco.lk_eco_bati_site
    IS 'Table alphanumérique d''appartenance des bâtis d''activité à un ou plusieurs sites';

COMMENT ON COLUMN m_activite_eco.lk_eco_bati_site.id
    IS 'Identifiant unique non signifiant de la relation';

COMMENT ON COLUMN m_activite_eco.lk_eco_bati_site.idbati
    IS 'Identifiant unique non signifiant de l''objet bâti';

COMMENT ON COLUMN m_activite_eco.lk_eco_bati_site.idsite
    IS 'Identifiant unique non signifiant de l''objet site';
    


    
-- ############################################################## [lk_eco_loc_site] ####################################################################

-- Table: m_activite_eco.lk_eco_loc_site

-- DROP TABLE m_activite_eco.lk_eco_loc_site;

CREATE TABLE m_activite_eco.lk_eco_loc_site
(
    id integer NOT NULL DEFAULT nextval('m_activite_eco.lk_eco_loc_site_seq'::regclass),
    idloc character varying(5) NOT NULL,
    idsite character varying(5) NOT NULL,
    CONSTRAINT lk_eco_loc_site_pkey PRIMARY KEY (id)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE m_activite_eco.lk_eco_loc_site
    OWNER to create_sig;

GRANT ALL ON TABLE m_activite_eco.lk_eco_loc_site TO sig_create;

GRANT ALL ON TABLE m_activite_eco.lk_eco_loc_site TO create_sig;

GRANT ALL ON TABLE m_activite_eco.lk_eco_loc_site TO sig_stage WITH GRANT OPTION;

GRANT SELECT ON TABLE m_activite_eco.lk_eco_loc_site TO sig_read;

GRANT INSERT, SELECT, UPDATE, DELETE ON TABLE m_activite_eco.lk_eco_loc_site TO sig_edit;

COMMENT ON TABLE m_activite_eco.lk_eco_loc_site
    IS 'Table alphanumérique d''appartenance des locaux d''activité à un ou plusieurs sites';

COMMENT ON COLUMN m_activite_eco.lk_eco_loc_site.id
    IS 'Identifiant unique non signifiant de la relation';

COMMENT ON COLUMN m_activite_eco.lk_eco_loc_site.idloc
    IS 'Identifiant unique non signifiant de l''objet local d''activité';

COMMENT ON COLUMN m_activite_eco.lk_eco_loc_site.idsite
    IS 'Identifiant unique non signifiant de l''objet site';
    
-- ############################################################## [lk_eco_bati_loc] ####################################################################

-- Table: m_activite_eco.lk_eco_bati_loc

-- DROP TABLE m_activite_eco.lk_eco_bati_loc;

CREATE TABLE m_activite_eco.lk_eco_bati_loc
(
    id integer NOT NULL DEFAULT nextval('m_activite_eco.lk_eco_bati_loc_seq'::regclass),
    idbati character varying(5) NOT NULL,
    idloc character varying(5) NOT NULL,
    CONSTRAINT lk_eco_bati_loc_pkey PRIMARY KEY (id)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE m_activite_eco.lk_eco_bati_loc
    OWNER to create_sig;

GRANT ALL ON TABLE m_activite_eco.lk_eco_bati_loc TO sig_create;

GRANT ALL ON TABLE m_activite_eco.lk_eco_bati_loc TO create_sig;

GRANT ALL ON TABLE m_activite_eco.lk_eco_bati_loc TO sig_stage WITH GRANT OPTION;

GRANT SELECT ON TABLE m_activite_eco.lk_eco_bati_loc TO sig_read;

GRANT INSERT, SELECT, UPDATE, DELETE ON TABLE m_activite_eco.lk_eco_bati_loc TO sig_edit;

COMMENT ON TABLE m_activite_eco.lk_eco_bati_loc
    IS 'Table alphanumérique d''appartenance des locaux d''activité à un bâtiment d''activité';

COMMENT ON COLUMN m_activite_eco.lk_eco_bati_loc.id
    IS 'Identifiant unique non signifiant de la relation';

COMMENT ON COLUMN m_activite_eco.lk_eco_bati_loc.idbati
    IS 'Identifiant unique non signifiant de l''objet bâti d''activité';

COMMENT ON COLUMN m_activite_eco.lk_eco_bati_loc.idloc
    IS 'Identifiant unique non signifiant de l''objet local d''activité';

-- ############################################################## [lk_eco_loc_etab] ####################################################################

-- Table: m_activite_eco.lk_eco_loc_etab

-- DROP TABLE m_activite_eco.lk_eco_loc_etab;

CREATE TABLE m_activite_eco.lk_eco_loc_etab
(
    id integer NOT NULL DEFAULT nextval('m_activite_eco.lk_eco_loc_etab_seq'::regclass),
    idloc character varying(5) NOT NULL,
    siren character varying(5) NOT NULL,
    CONSTRAINT lk_eco_loc_etab_pkey PRIMARY KEY (id)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE m_activite_eco.lk_eco_loc_etab
    OWNER to create_sig;

GRANT ALL ON TABLE m_activite_eco.lk_eco_loc_etab TO sig_create;

GRANT ALL ON TABLE m_activite_eco.lk_eco_loc_etab TO create_sig;

GRANT ALL ON TABLE m_activite_eco.lk_eco_loc_etab TO sig_stage WITH GRANT OPTION;

GRANT SELECT ON TABLE m_activite_eco.lk_eco_loc_etab TO sig_read;

GRANT INSERT, SELECT, UPDATE, DELETE ON TABLE m_activite_eco.lk_eco_loc_etab TO sig_edit;

COMMENT ON TABLE m_activite_eco.lk_eco_loc_etab
    IS 'Table alphanumérique d''appartenance des établissements à un local';

COMMENT ON COLUMN m_activite_eco.lk_eco_loc_etab.id
    IS 'Identifiant unique non signifiant de la relation';

COMMENT ON COLUMN m_activite_eco.lk_eco_loc_etab.idloc
    IS 'Identifiant unique non signifiant de l''objet local';

COMMENT ON COLUMN m_activite_eco.lk_eco_loc_etab.siren
    IS 'Identifiant unique non signifiant de l''établissement';
    
    -- ############################################################## [lk_eco_bati_adr] ####################################################################

-- Table: m_activite_eco.lk_eco_bati_adr

-- DROP TABLE m_activite_eco.lk_eco_bati_adr;

CREATE TABLE m_activite_eco.lk_eco_bati_adr
(
    id integer NOT NULL DEFAULT nextval('m_activite_eco.lk_eco_bati_adr_seq'::regclass),
    idbati character varying(5) NOT NULL,
    idadresse bigint NOT NULL,
    CONSTRAINT lk_eco_bati_adr_pkey PRIMARY KEY (id)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE m_activite_eco.lk_eco_bati_adr
    OWNER to create_sig;

GRANT ALL ON TABLE m_activite_eco.lk_eco_bati_adr TO sig_create;

GRANT ALL ON TABLE m_activite_eco.lk_eco_bati_adr TO create_sig;

GRANT ALL ON TABLE m_activite_eco.lk_eco_bati_adr TO sig_stage WITH GRANT OPTION;

GRANT SELECT ON TABLE m_activite_eco.lk_eco_bati_adr TO sig_read;

GRANT INSERT, SELECT, UPDATE, DELETE ON TABLE m_activite_eco.lk_eco_bati_adr TO sig_edit;

COMMENT ON TABLE m_activite_eco.lk_eco_bati_adr
    IS 'Table alphanumérique d''appartenance d''un bâtiment à une adresse';

COMMENT ON COLUMN m_activite_eco.lk_eco_bati_adr.id
    IS 'Identifiant unique non signifiant de la relation';

COMMENT ON COLUMN m_activite_eco.lk_eco_bati_adr.idbati
    IS 'Identifiant unique non signifiant de l''objet bâtiment';

COMMENT ON COLUMN m_activite_eco.lk_eco_bati_adr.idadresse
    IS 'Identifiant unique de l''adresse';
    
       -- ############################################################## [lk_eco_loc_adr] ####################################################################

-- Table: m_activite_eco.lk_eco_loc_adr

-- DROP TABLE m_activite_eco.lk_eco_loc_adr;

CREATE TABLE m_activite_eco.lk_eco_loc_adr
(
    id integer NOT NULL DEFAULT nextval('m_activite_eco.lk_eco_loc_adr_seq'::regclass),
    idloc character varying(5) NOT NULL,
    idadresse bigint NOT NULL,
    CONSTRAINT lk_eco_loc_adr_pkey PRIMARY KEY (id)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE m_activite_eco.lk_eco_loc_adr
    OWNER to create_sig;

GRANT ALL ON TABLE m_activite_eco.lk_eco_loc_adr TO sig_create;

GRANT ALL ON TABLE m_activite_eco.lk_eco_loc_adr TO create_sig;

GRANT ALL ON TABLE m_activite_eco.lk_eco_loc_adr TO sig_stage WITH GRANT OPTION;

GRANT SELECT ON TABLE m_activite_eco.lk_eco_loc_adr TO sig_read;

GRANT INSERT, SELECT, UPDATE, DELETE ON TABLE m_activite_eco.lk_eco_loc_adr TO sig_edit;

COMMENT ON TABLE m_activite_eco.lk_eco_loc_adr
    IS 'Table alphanumérique d''appartenance d''un à une adresse';

COMMENT ON COLUMN m_activite_eco.lk_eco_loc_adr.id
    IS 'Identifiant unique non signifiant de la relation';

COMMENT ON COLUMN m_activite_eco.lk_eco_loc_adr.idloc
    IS 'Identifiant unique non signifiant de l''objet local';

COMMENT ON COLUMN m_activite_eco.lk_eco_loc_adr.idadresse
    IS 'Identifiant unique de l''adresse';

-- ############################################################## [lk_adresseetablissement] ####################################################################

-- Table: m_activite_eco.lk_adresseetablissement

-- DROP TABLE m_activite_eco.lk_adresseetablissement;

CREATE TABLE m_activite_eco.lk_adresseetablissement
(
    idadresse bigint,
    siret character varying(14) COLLATE pg_catalog."default",
    id integer NOT NULL DEFAULT nextval('m_activite_eco.lk_adresseetablissement_seq'::regclass)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE m_activite_eco.lk_adresseetablissement
    OWNER to create_sig;

GRANT ALL ON TABLE m_activite_eco.lk_adresseetablissement TO sig_create;

GRANT ALL ON TABLE m_activite_eco.lk_adresseetablissement TO create_sig;

GRANT SELECT ON TABLE m_activite_eco.lk_adresseetablissement TO baussant;

GRANT SELECT ON TABLE m_activite_eco.lk_adresseetablissement TO sig_read;

GRANT INSERT, SELECT, UPDATE, DELETE ON TABLE m_activite_eco.lk_adresseetablissement TO sig_edit;

COMMENT ON TABLE m_activite_eco.lk_adresseetablissement
    IS 'Table de lien permettant d''affecter les adresses de localisations aux établissements issus de la donnée SIRENE de l''Insee';


COMMENT ON COLUMN m_activite_eco.lk_adresseetablissement.id
    IS 'Identifiant unique non siggnifiant';
    
COMMENT ON COLUMN m_activite_eco.lk_adresseetablissement.idadresse
    IS 'Identifiant unique de l''adresse';

COMMENT ON COLUMN m_activite_eco.lk_adresseetablissement.siret
    IS 'N° SIRET de l''établissement';


-- Trigger: t_t1_lk_adresseetablissement_siret_update

-- DROP TRIGGER t_t1_lk_adresseetablissement_siret_update ON m_activite_eco.lk_adresseetablissement;

CREATE TRIGGER t_t1_lk_adresseetablissement_siret_update
    BEFORE INSERT OR UPDATE 
    ON m_activite_eco.lk_adresseetablissement
    FOR EACH ROW
    EXECUTE PROCEDURE m_activite_eco.ft_m_lk_adresseetablissement_siret_update();

-- Trigger: t_t2_lk_adresseetablissement_idsite

-- DROP TRIGGER t_t2_lk_adresseetablissement_idsite ON m_activite_eco.lk_adresseetablissement;

CREATE TRIGGER t_t2_lk_adresseetablissement_idsite
    BEFORE INSERT OR UPDATE 
    ON m_activite_eco.lk_adresseetablissement
    FOR EACH ROW
    EXECUTE PROCEDURE m_activite_eco.ft_m_lk_adresseetablissement_idsite();

-- Trigger: t_t3_lk_adresseetablissement_idsite_delete

-- DROP TRIGGER t_t3_lk_adresseetablissement_idsite_delete ON m_activite_eco.lk_adresseetablissement;

CREATE TRIGGER t_t3_lk_adresseetablissement_idsite_delete
    AFTER DELETE
    ON m_activite_eco.lk_adresseetablissement
    FOR EACH ROW
    EXECUTE PROCEDURE m_activite_eco.ft_m_lk_adresseetablissement_idsite_delete();

-- Trigger: t_t4_lk_etablissementlocal

-- DROP TRIGGER t_t4_lk_etablissementlocal ON m_economie.lk_adresseetablissement;

CREATE TRIGGER t_t4_lk_etablissementlocal
    AFTER INSERT OR DELETE OR UPDATE 
    ON m_activite_eco.lk_adresseetablissement
    FOR EACH ROW
    EXECUTE PROCEDURE m_activite_eco.ft_m_lk_adresseetablissement();

-- ####################################################################################################################################################
-- ###                                                       TABLE DE RELATION M_AMENAGEMENT                                                        ###
-- ####################################################################################################################################################

 
-- ############################################################## [lk_amt_lot_site] ####################################################################

-- Table: m_amenagement.lk_amt_lot_site

-- DROP TABLE m_amenagement.lk_amt_lot_site;

CREATE TABLE m_amenagement.lk_amt_lot_site
(
    id integer NOT NULL DEFAULT nextval('m_amenagement.lk_amt_lot_site_seq'::regclass),
    idsite character varying(5) NOT NULL,
    idgeolf integer NOT NULL,
    CONSTRAINT lk_amt_lot_site_pkey PRIMARY KEY (id)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE m_amenagement.lk_amt_lot_site
    OWNER to create_sig;

GRANT ALL ON TABLE m_amenagement.lk_amt_lot_site TO sig_create;

GRANT ALL ON TABLE m_amenagement.lk_amt_lot_site TO create_sig;

GRANT ALL ON TABLE m_amenagement.lk_amt_lot_site TO sig_stage WITH GRANT OPTION;

GRANT SELECT ON TABLE m_amenagement.lk_amt_lot_site TO sig_read;

GRANT INSERT, SELECT, UPDATE, DELETE ON TABLE m_amenagement.lk_amt_lot_site TO sig_edit;

COMMENT ON TABLE m_amenagement.lk_amt_lot_site
    IS 'Table alphanumérique d''appartenance des lots à un ou plusieurs sites';

COMMENT ON COLUMN m_amenagement.lk_amt_lot_site.id
    IS 'Identifiant unique non signifiant de la relation';

COMMENT ON COLUMN m_amenagement.lk_amt_lot_site.idgeolf
    IS 'Identifiant unique non signifiant de l''objet lot';

COMMENT ON COLUMN m_amenagement.lk_amt_lot_site.idsite
    IS 'Identifiant unique non signifiant de l''objet site';
				  
-- ####################################################################################################################################################
-- ###                                                       TABLE DE RELATION M_FONCIER                                                            ###
-- ####################################################################################################################################################

-- Table: m_foncier.lk_cession_lot

-- DROP TABLE m_foncier.lk_cession_lot;

CREATE TABLE m_foncier.lk_cession_lot
(
    idgeolf integer NOT NULL,
    idces character varying(6) COLLATE pg_catalog."default",
    CONSTRAINT lk_cession_lot_pkey PRIMARY KEY (idgeolf)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE m_foncier.lk_cession_lot
    OWNER to create_sig;

GRANT ALL ON TABLE m_foncier.lk_cession_lot TO sig_create;

GRANT SELECT ON TABLE m_foncier.lk_cession_lot TO sig_read;

GRANT ALL ON TABLE m_foncier.lk_cession_lot TO create_sig;

GRANT INSERT, SELECT, UPDATE, DELETE ON TABLE m_foncier.lk_cession_lot TO sig_edit;

COMMENT ON TABLE m_foncier.lk_cession_lot
    IS 'Table de lien entre les lots et les dossiers de cession';

COMMENT ON COLUMN m_foncier.lk_cession_lot.idgeolf
    IS 'Identifiant géographique du lot';

COMMENT ON COLUMN m_foncier.lk_cession_lot.idces
    IS 'Identifiant du dossier de cession';


-- ####################################################################################################################################################
-- ###                                                        TABLE DE RELATION S_SIRENE                                                            ###
-- ####################################################################################################################################################

-- ############################################################ [lk_sirene_succession] ################################################################

-- Table: s_sirene.lk_sirene_succession

-- DROP TABLE s_sirene.lk_sirene_succession;

CREATE TABLE s_sirene.lk_sirene_succession
(
    id integer NOT NULL,
    siretold character varying(14) COLLATE pg_catalog."default",
    siretnew character varying(14) COLLATE pg_catalog."default", 
    date_lien date,
    tsiege boolean,
    conteco boolean,
    datedtrait date,
    CONSTRAINT lk_sirene_succession_pkey PRIMARY KEY (id)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE s_sirene.lk_sirene_succession
    OWNER to create_sig;

GRANT ALL ON TABLE s_sirene.lk_sirene_succession TO sig_create;

GRANT ALL ON TABLE s_sirene.lk_sirene_succession TO create_sig;

GRANT SELECT ON TABLE s_sirene.lk_sirene_succession TO sig_read;

GRANT INSERT, SELECT, UPDATE, DELETE ON TABLE s_sirene.lk_sirene_succession TO sig_edit;

COMMENT ON TABLE s_sirene.lk_sirene_succession
    IS 'Lien entre les SIRET des prédécesseurs et des successeurs présents dans le répertoire Sirene.Ce lien étant déclaratif, tous les liens ne sont pas connus de l''Insee';


COMMENT ON COLUMN s_sirene.lk_sirene_succession.siretold
    IS 'N° SIRET de l''établissement précédent';
    

COMMENT ON COLUMN s_sirene.lk_sirene_succession.siretold
    IS 'N° SIRET du nouvel établissement si un lien de succession est déclaré';
    

COMMENT ON COLUMN s_sirene.lk_sirene_succession.date_lien
    IS 'Date d''effet du lien de succsession';


COMMENT ON COLUMN s_sirene.lk_sirene_succession.tsiege
    IS 'Indicatrice de transfert de siège';


COMMENT ON COLUMN s_sirene.lk_sirene_succession.conteco
    IS 'Indicatrice de continuité économique entre les deux établissements';
    

COMMENT ON COLUMN s_sirene.lk_sirene_succession.datedtrait
    IS 'Date de traitement du lien de succession';

-- ####################################################################################################################################################
-- ###                                                                                                                                              ###
-- ###                                                                VUE                                                                           ###
-- ###                                                                                                                                              ###
-- ####################################################################################################################################################

-- ############################################################ [geo_v_eco_lot] #######################################################################

-- View: m_activite_eco.geo_v_eco_lot

-- DROP VIEW m_activite_eco.geo_v_eco_lot;

CREATE OR REPLACE VIEW m_activite_eco.geo_v_eco_lot
 AS
 SELECT o.idgeolf,
    o.op_sai,
    o.src_geom AS ref_spa,
    o.sup_m2,
    o.l_voca,
    o.l_nom,
    o.date_sai,
    o.date_maj,
    s.stade_amng,
    s.l_amng2,
    s.stade_comm,
    s.l_comm2,
    s.l_comm2_12,
    f.pers_v,
    s.etat_occup,
    f.surf,
    f.surf_l,
    f.date_sai AS date_sai_att,
    f.date_maj AS date_maj_att,
    f.date_int,
    f.op_sai AS op_sai_att,
    f.org_sai AS org_sai_att,
    f.tact,
    f.tact_99,
    f.cnom,
    f.lnom,
    f.occupant,
    f.pvente_e,
    f.pvente_l,
    f.pcess_e,
    f.pcess_l,
    f.eff_dep,
    f.eff_n5,
    f.conv,
    f.datefin_conv,
    f.observ,
    f.bati,
    f.pc_depot,
    f.pc_accord,
    f.pc_tra,
    f.pc_fin,
    f.pc_num,
    f.pc_mo,
    f.oripro,
    f.descrip,
    f.insee,
    f.commune,
    f.epci,
    o.geom,
    false AS maj_plan
   FROM m_activite_eco.an_eco_lot f,
    r_objet.geo_objet_fon_lot o,
    m_amenagement.an_amt_lot_stade s
  WHERE o.l_voca::text = '20'::text AND f.idgeolf = o.idgeolf AND o.idgeolf = s.idgeolf;

ALTER TABLE m_activite_eco.geo_v_eco_lot
    OWNER TO create_sig;
COMMENT ON VIEW m_activite_eco.geo_v_eco_lot
    IS 'Vue éditable des lots à vocation économique';

GRANT ALL ON TABLE m_activite_eco.geo_v_eco_lot TO sig_create;
GRANT ALL ON TABLE m_activite_eco.geo_v_eco_lot TO create_sig;
GRANT INSERT, SELECT, UPDATE, DELETE ON TABLE m_activite_eco.geo_v_eco_lot TO sig_edit;
GRANT ALL ON TABLE m_activite_eco.geo_v_eco_lot TO sig_stage WITH GRANT OPTION;
GRANT SELECT ON TABLE m_activite_eco.geo_v_eco_lot TO sig_read;

CREATE TRIGGER t_t1_delete_lot_eco
    INSTEAD OF DELETE
    ON m_activite_eco.geo_v_eco_lot
    FOR EACH ROW
    EXECUTE PROCEDURE m_activite_eco.ft_m_delete_lot_eco();


CREATE TRIGGER t_t2_insert_lot_eco
    INSTEAD OF INSERT
    ON m_activite_eco.geo_v_eco_lot
    FOR EACH ROW
    EXECUTE PROCEDURE m_activite_eco.ft_m_insert_lot_eco();


CREATE TRIGGER t_t3_modif_lot_eco
    INSTEAD OF UPDATE 
    ON m_activite_eco.geo_v_eco_lot
    FOR EACH ROW
    EXECUTE PROCEDURE m_activite_eco.ft_m_modif_lot_eco();



-- ############################################################### [geo_v_lot] #######################################################################

-- View: r_objet.geo_v_lot

-- DROP VIEW r_objet.geo_v_lot;

CREATE OR REPLACE VIEW r_objet.geo_v_lot
 AS
 SELECT o.idgeolf,
    o.op_sai,
    o.src_geom AS ref_spa,
    o.sup_m2,
    o.l_voca,
    o.date_sai,
    o.date_maj,
    s.stade_amng,
    s.l_amng2,
    s.stade_comm,
    s.l_comm2,
    s.l_comm2_12,
    s.etat_occup,
    o.l_nom,
    o.geom
   FROM r_objet.geo_objet_fon_lot o,
    m_amenagement.an_amt_lot_stade s
  WHERE o.idgeolf = s.idgeolf;

ALTER TABLE r_objet.geo_v_lot
    OWNER TO create_sig;
COMMENT ON VIEW r_objet.geo_v_lot
    IS 'Vue éditable des lots fonciers (toutes vocations) uniquement pour l''administration SIG';

GRANT ALL ON TABLE r_objet.geo_v_lot TO sig_create;
GRANT SELECT ON TABLE r_objet.geo_v_lot TO sig_read;
GRANT ALL ON TABLE r_objet.geo_v_lot TO create_sig;
GRANT INSERT, SELECT, UPDATE, DELETE ON TABLE r_objet.geo_v_lot TO sig_edit;

CREATE TRIGGER t_t1_foncier_delete
    INSTEAD OF DELETE
    ON r_objet.geo_v_lot
    FOR EACH ROW
    EXECUTE PROCEDURE r_objet.ft_m_foncier_delete();


CREATE TRIGGER t_t2_foncier_insert
    INSTEAD OF INSERT
    ON r_objet.geo_v_lot
    FOR EACH ROW
    EXECUTE PROCEDURE r_objet.ft_m_foncier_insert();


CREATE TRIGGER t_t3_foncier_update
    INSTEAD OF UPDATE 
    ON r_objet.geo_v_lot
    FOR EACH ROW
    EXECUTE PROCEDURE r_objet.ft_m_foncier_update();


-- ############################################################### [geo_v_empesp_pu] ######################################################################

-- View: m_amenagement.geo_v_empesp_pu

-- DROP VIEW m_amenagement.geo_v_empesp_pu;

CREATE OR REPLACE VIEW m_amenagement.geo_v_empesp_pu
 AS
 SELECT o.idgeopu,
    ep.date_sai AS date_sai_att,
    ep.date_maj AS date_maj_att,
    ep.date_int,
    ep.op_sai AS op_sai_att,
    ep.org_sai AS org_sai_att,
    ep.vocaep,
    o.geom
   FROM m_amenagement.an_amt_esppu ep,
    r_objet.geo_objet_empesp_pu o
  WHERE ep.idgeopu = o.idgeopu;

ALTER TABLE m_amenagement.geo_v_empesp_pu
    OWNER TO create_sig;
COMMENT ON VIEW m_amenagement.geo_v_empesp_pu
    IS 'Vue géographique des emprises des espaces publics sur les sites (en faire une vue éditable)';

GRANT ALL ON TABLE m_amenagement.geo_v_empesp_pu TO sig_create;
GRANT ALL ON TABLE m_amenagement.geo_v_empesp_pu TO create_sig;
GRANT SELECT ON TABLE m_amenagement.geo_v_empesp_pu TO sig_read;
GRANT DELETE, UPDATE, SELECT, INSERT ON TABLE m_amenagement.geo_v_empesp_pu TO sig_edit;




-- ############################################################### [geo_v_lot_equ] ######################################################################

-- View: m_amenagement.geo_v_lot_equ

-- DROP VIEW m_amenagement.geo_v_lot_equ;

CREATE OR REPLACE VIEW m_amenagement.geo_v_lot_equ
 AS
 SELECT o.idgeolf,
    s.stade_amng,
    s.l_amng2,
    s.stade_comm,
    s.l_comm2,
    s.l_comm2_12,
    s.etat_occup,
    eu.date_sai,
    eu.date_maj,
    eu.op_sai,
    eu.org_sai,
    o.src_geom AS ref_spa,
    eu.surf,
    eu.l_surf_l,
    o.l_voca,
    eu.l_nom,
    o.l_nom AS l_nom_lot,
    eu.l_phase,
    o.sup_m2,
    eu.epci,
    eu.l_observ,
    o.geom
   FROM r_objet.geo_objet_fon_lot o,
    m_amenagement.an_amt_lot_equ eu,
    m_amenagement.an_amt_lot_stade s
  WHERE eu.idgeolf = o.idgeolf AND o.l_voca::text = '10'::text AND o.idgeolf = s.idgeolf;

ALTER TABLE m_amenagement.geo_v_lot_equ
    OWNER TO create_sig;
COMMENT ON VIEW m_amenagement.geo_v_lot_equ
    IS 'Vue éditable géographique des lots à vocation d''équipement';

GRANT ALL ON TABLE m_amenagement.geo_v_lot_equ TO sig_create;
GRANT ALL ON TABLE m_amenagement.geo_v_lot_equ TO create_sig;
GRANT SELECT ON TABLE m_amenagement.geo_v_lot_equ TO sig_read;
GRANT DELETE, UPDATE, SELECT, INSERT ON TABLE m_amenagement.geo_v_lot_equ TO sig_edit;

CREATE TRIGGER t_t1_delete_lot_equ
    INSTEAD OF DELETE
    ON m_amenagement.geo_v_lot_equ
    FOR EACH ROW
    EXECUTE PROCEDURE m_amenagement.ft_m_delete_lot_equ();


CREATE TRIGGER t_t2_insert_lot_equ
    INSTEAD OF INSERT
    ON m_amenagement.geo_v_lot_equ
    FOR EACH ROW
    EXECUTE PROCEDURE m_amenagement.ft_m_insert_lot_equ();


CREATE TRIGGER t_t3_modif_lot_equ
    INSTEAD OF UPDATE 
    ON m_amenagement.geo_v_lot_equ
    FOR EACH ROW
    EXECUTE PROCEDURE m_amenagement.ft_m_modif_lot_equ();


-- ############################################################### [geo_v_lot_hab] ######################################################################

-- View: m_amenagement.geo_v_lot_hab

-- DROP VIEW m_amenagement.geo_v_lot_hab;

CREATE OR REPLACE VIEW m_amenagement.geo_v_lot_hab
 AS
 SELECT o.idgeolf,
    o.src_geom AS ref_spa,
    o.op_sai,
    o.l_voca,
    o.l_nom,
    o.sup_m2,
    s.stade_amng,
    s.l_amng2,
    s.stade_comm,
    s.l_comm2,
    s.l_comm2_12,
    s.etat_occup,
    f.surf,
    f.l_surf_l,
    f.date_sai AS date_sai_att,
    f.date_maj AS date_maj_att,
    f.op_sai AS op_sai_att,
    f.org_sai AS org_sai_att,
    f.l_pvente,
    f.l_pvente_l,
    f.l_pvente_lot,
    f.nb_log,
    f.nb_logind,
    f.nb_logindgr,
    f.nb_logcol,
    f.nb_logaide,
    f.nb_log_r,
    f.nb_logind_r,
    f.nb_logindgr_r,
    f.nb_logcol_r,
    f.nb_logaide_r,
    f.l_observ,
    f.l_phase,
    f.nb_logaide_loc_r,
    f.nb_logaide_acc_r,
    f.epci,
    o.geom
   FROM m_amenagement.an_amt_lot_hab f,
    r_objet.geo_objet_fon_lot o,
    m_amenagement.an_amt_lot_stade s
  WHERE o.l_voca::text = '30'::text AND f.idgeolf = o.idgeolf AND f.idgeolf = s.idgeolf;

ALTER TABLE m_amenagement.geo_v_lot_hab
    OWNER TO create_sig;
COMMENT ON VIEW m_amenagement.geo_v_lot_hab
    IS 'Vue éditable des lots à vocation habitat';

GRANT ALL ON TABLE m_amenagement.geo_v_lot_hab TO sig_create;
GRANT SELECT ON TABLE m_amenagement.geo_v_lot_hab TO sig_read;
GRANT ALL ON TABLE m_amenagement.geo_v_lot_hab TO create_sig;
GRANT INSERT, SELECT, UPDATE, DELETE ON TABLE m_amenagement.geo_v_lot_hab TO sig_edit;
GRANT ALL ON TABLE m_amenagement.geo_v_lot_hab TO sig_stage WITH GRANT OPTION;

CREATE TRIGGER t_t1_delete_lot_hab
    INSTEAD OF DELETE
    ON m_amenagement.geo_v_lot_hab
    FOR EACH ROW
    EXECUTE PROCEDURE m_amenagement.ft_m_delete_lot_hab();


CREATE TRIGGER t_t2_insert_lot_hab
    INSTEAD OF INSERT
    ON m_amenagement.geo_v_lot_hab
    FOR EACH ROW
    EXECUTE PROCEDURE m_amenagement.ft_m_insert_lot_hab();


CREATE TRIGGER t_t3_modif_lot_hab
    INSTEAD OF UPDATE 
    ON m_amenagement.geo_v_lot_hab
    FOR EACH ROW
    EXECUTE PROCEDURE m_amenagement.ft_m_modif_lot_hab();




-- ############################################################### [geo_v_lot_mixte] ######################################################################

-- View: m_amenagement.geo_v_lot_mixte

-- DROP VIEW m_amenagement.geo_v_lot_mixte;

CREATE OR REPLACE VIEW m_amenagement.geo_v_lot_mixte
 AS
 SELECT o.idgeolf,
    f.l_lnom,
    o.src_geom AS ref_spa,
    o.op_sai,
    o.l_voca,
    o.l_nom,
    o.sup_m2,
    s.stade_amng,
    s.l_amng2,
    s.stade_comm,
    s.l_comm2,
    s.l_comm2_12,
    s.etat_occup,
    f.surf,
    f.l_surf_l,
    f.date_sai AS date_sai_att,
    f.date_maj AS date_maj_att,
    f.op_sai AS op_sai_att,
    f.org_sai AS org_sai_att,
    f.l_pvente,
    f.l_pvente_l,
    f.l_pvente_lot,
    f.nb_log,
    f.nb_logind,
    f.nb_logindgr,
    f.nb_logcol,
    f.nb_logaide,
    f.nb_log_r,
    f.nb_logind_r,
    f.nb_logindgr_r,
    f.nb_logcol_r,
    f.nb_logaide_r,
    f.l_observ,
    f.l_phase,
    f.l_tact,
    f.l_tact_99,
    f.l_nom_equ,
    f.commune,
    f.nb_logaide_loc_r,
    f.nb_logaide_acc_r,
    f.epci,
    o.geom
   FROM m_amenagement.an_amt_lot_mixte f,
    r_objet.geo_objet_fon_lot o,
    m_amenagement.an_amt_lot_stade s
  WHERE o.l_voca::text = '60'::text AND f.idgeolf = o.idgeolf AND o.idgeolf = s.idgeolf;

ALTER TABLE m_amenagement.geo_v_lot_mixte
    OWNER TO create_sig;
COMMENT ON VIEW m_amenagement.geo_v_lot_mixte
    IS 'Vue éditable des lots à vocation mixte';

GRANT ALL ON TABLE m_amenagement.geo_v_lot_mixte TO sig_create;
GRANT SELECT ON TABLE m_amenagement.geo_v_lot_mixte TO sig_read;
GRANT ALL ON TABLE m_amenagement.geo_v_lot_mixte TO create_sig;
GRANT INSERT, SELECT, UPDATE, DELETE ON TABLE m_amenagement.geo_v_lot_mixte TO sig_edit;
GRANT ALL ON TABLE m_amenagement.geo_v_lot_mixte TO sig_stage WITH GRANT OPTION;

CREATE TRIGGER t_t1_delete_lot_mixte
    INSTEAD OF DELETE
    ON m_amenagement.geo_v_lot_mixte
    FOR EACH ROW
    EXECUTE PROCEDURE m_amenagement.ft_m_delete_lot_mixte();


CREATE TRIGGER t_t2_insert_lot_mixte
    INSTEAD OF INSERT
    ON m_amenagement.geo_v_lot_mixte
    FOR EACH ROW
    EXECUTE PROCEDURE m_amenagement.ft_m_insert_lot_mixte();


CREATE TRIGGER t_t3_modif_lot_mixte
    INSTEAD OF UPDATE 
    ON m_amenagement.geo_v_lot_mixte
    FOR EACH ROW
    EXECUTE PROCEDURE m_amenagement.ft_m_modif_lot_mixte();



-- ############################################################### [geo_v_lot_divers] ######################################################################

-- View: m_amenagement.geo_v_lot_divers

-- DROP VIEW m_amenagement.geo_v_lot_divers;

CREATE OR REPLACE VIEW m_amenagement.geo_v_lot_divers
 AS
 SELECT o.idgeolf,
    s.stade_amng,
    s.l_amng2,
    s.stade_comm,
    s.l_comm2,
    s.l_comm2_12,
    s.etat_occup,
    d.date_sai,
    d.date_maj,
    d.op_sai,
    d.org_sai,
    o.src_geom AS ref_spa,
    d.surf,
    d.l_surf_l,
    o.l_voca,
    d.l_nom,
    o.l_nom AS l_nom_lot,
    d.l_phase,
    d.epci,
    d.l_observ,
    ep.date_sai,
    ep.date_maj,
    o.geom
   FROM r_objet.geo_objet_fon_lot o,
    m_amenagement.an_amt_lot_divers d,
    m_amenagement.an_amt_lot_stade s
  WHERE d.idgeolf = o.idgeolf AND o.l_voca::text = '40'::text AND o.idgeolf = s.idgeolf;

ALTER TABLE m_amenagement.geo_v_lot_divers
    OWNER TO create_sig;
COMMENT ON VIEW m_amenagement.geo_v_lot_divers
    IS 'Vue éditable géographique des lots à vocation divers';

GRANT ALL ON TABLE m_amenagement.geo_v_lot_divers TO sig_create;
GRANT SELECT ON TABLE m_amenagement.geo_v_lot_divers TO sig_read;
GRANT ALL ON TABLE m_amenagement.geo_v_lot_divers TO create_sig;
GRANT INSERT, SELECT, UPDATE, DELETE ON TABLE m_amenagement.geo_v_lot_divers TO sig_edit;
GRANT ALL ON TABLE m_amenagement.geo_v_lot_divers TO sig_stage WITH GRANT OPTION;

CREATE TRIGGER t_t1_delete_lot_divers
    INSTEAD OF DELETE
    ON m_amenagement.geo_v_lot_divers
    FOR EACH ROW
    EXECUTE PROCEDURE m_amenagement.ft_m_delete_lot_divers();


CREATE TRIGGER t_t2_insert_lot_divers
    INSTEAD OF INSERT
    ON m_amenagement.geo_v_lot_divers
    FOR EACH ROW
    EXECUTE PROCEDURE m_amenagement.ft_m_insert_lot_divers();


CREATE TRIGGER t_t3_modif_lot_divers
    INSTEAD OF UPDATE 
    ON m_amenagement.geo_v_lot_divers
    FOR EACH ROW
    EXECUTE PROCEDURE m_amenagement.ft_m_modif_lot_divers();




-- ############################################################### [geo_v_lot_esppu] ######################################################################


-- View: m_amenagement.geo_v_lot_esppu

DROP VIEW m_amenagement.geo_v_lot_esppu;

CREATE OR REPLACE VIEW m_amenagement.geo_v_lot_esppu
 AS
 SELECT o.idgeolf,
    s.stade_amng,
    s.l_amng2,
    s.stade_comm,
    s.l_comm2,
    s.l_comm2_12,
    s.etat_occup,
    o.src_geom AS ref_spa,
    o.op_sai,
    o.l_voca,
    o.l_nom AS l_nom_lot,
	ep.op_sai as op_sai_lot,
	ep.org_sai as org_sai_lot,
	ep.l_nom,
	ep.surf,
	ep.l_surf_l,
	ep.epci,
	ep.l_observ,
    o.geom
   FROM r_objet.geo_objet_fon_lot o,
    m_amenagement.an_amt_lot_stade s,
	m_amenagement.an_amt_lot_esppu ep
  WHERE o.idgeolf = s.idgeolf AND ep.idgeolf = o.idgeolf AND o.l_voca::text = '50'::text;

ALTER TABLE m_amenagement.geo_v_lot_esppu
    OWNER TO create_sig;
COMMENT ON VIEW m_amenagement.geo_v_lot_esppu
    IS 'Vue éditable géographique des lots dont la vocation est un espace public';

GRANT ALL ON TABLE m_amenagement.geo_v_lot_esppu TO sig_create;
GRANT ALL ON TABLE m_amenagement.geo_v_lot_esppu TO create_sig;
GRANT INSERT, SELECT, UPDATE, DELETE ON TABLE m_amenagement.geo_v_lot_esppu TO sig_edit;
GRANT ALL ON TABLE m_amenagement.geo_v_lot_esppu TO sig_stage WITH GRANT OPTION;
GRANT SELECT ON TABLE m_amenagement.geo_v_lot_esppu TO sig_read;

CREATE TRIGGER t_t1_delete_lot_esppu
    INSTEAD OF DELETE
    ON m_amenagement.geo_v_lot_esppu
    FOR EACH ROW
    EXECUTE PROCEDURE m_amenagement.ft_m_delete_lot_esppu();


CREATE TRIGGER t_t2_insert_lot_esppu
    INSTEAD OF INSERT
    ON m_amenagement.geo_v_lot_esppu
    FOR EACH ROW
    EXECUTE PROCEDURE m_amenagement.ft_m_insert_lot_esppu();


CREATE TRIGGER t_t3_modif_lot_esppu
    INSTEAD OF UPDATE 
    ON m_amenagement.geo_v_lot_esppu
    FOR EACH ROW
    EXECUTE PROCEDURE m_amenagement.ft_m_modif_lot_esppu();




-- ####################################################################################################################################################
-- ###                                                                                                                                              ###
-- ###                                                          VUE MATERIALISEE                                                                    ###
-- ###                                                                                                                                              ###
-- ####################################################################################################################################################



