/*Amt_Fon_Eco V1.0*/
/*Creation du squelette de la structure des données (table, séquence, trigger,...) */
/* afe_10_squelette.sql */
/*PostGIS*/

/* Propriétaire : GeoCompiegnois - http://geo.compiegnois.fr/ */
/* Auteur : Grégory Bodet */

-- ####################################################################################################################################################
-- ###                                                                                                                                              ###
-- ###                                                                SCHEMA                                                           ###
-- ###                                                                                                                                              ###
-- ####################################################################################################################################################

-- Schema: m_amenagement

-- DROP SCHEMA m_amenagement;
/*
CREATE SCHEMA m_amenagement
  AUTHORIZATION sig_create;

COMMENT ON SCHEMA m_amenagement
  IS 'Données géographiques métiers sur le thème de l''aménagement';
*/

-- Schema: m_foncier

-- DROP SCHEMA m_foncier;
/*
CREATE SCHEMA m_foncier
  AUTHORIZATION sig_create;

COMMENT ON SCHEMA m_foncier
  IS 'Données géographiques métiers sur le thème du foncier';
*/

-- Schema: m_economie

-- DROP SCHEMA m_economie;
/*
CREATE SCHEMA m_economie
  AUTHORIZATION sig_create;

COMMENT ON SCHEMA m_economie
  IS 'Données géographiques métiers sur le thème du développement économique';
*/

-- Schema: r_objet

-- DROP SCHEMA r_objet;

/*
CREATE SCHEMA r_objet
  AUTHORIZATION sig_create;

COMMENT ON SCHEMA r_objet
  IS 'Schéma contenant les objets géographiques virtuels métiers (zonages, lots, entités administratives, ...). Les données métiers (alphanumériques) sont stockées dans le schéma correspondant, et le lien s''effectue via la référence géographique. Une donnée géographique spécifique à un seul métier, reste dans le schéma du métier.';
*/

-- ####################################################################################################################################################
-- ###                                                                                                                                              ###
-- ###                                                                SEQUENCE                                                           ###
-- ###                                                                                                                                              ###
-- ####################################################################################################################################################

-- ################################################# Séquence des n° de cessions ##################################

-- Sequence: m_foncier.ces_seq

-- DROP SEQUENCE m_foncier.ces_seq;

/*
CREATE SEQUENCE m_foncier.ces_seq
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 1
  CACHE 1;
ALTER TABLE m_foncier.ces_seq
  OWNER TO sig_create;
*/

-- ################################################# Séquence des identifiants des documents intégrés pour établissements (rattaché au lot) ##################################

-- Sequence: m_economie.an_lot_doc_media_gid_seq

-- DROP SEQUENCE m_economie.an_lot_doc_media_gid_seq;
/*
CREATE SEQUENCE m_economie.an_lot_doc_media_gid_seq
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 1
  CACHE 1;
ALTER TABLE m_economie.an_lot_doc_media_gid_seq
  OWNER TO sig_create;
  */
  
-- ################################################# Séquence des identifiants des documents intégrés pour les sites d'activité ##################################

-- Sequence: m_economie.an_site_doc_media_gig_seq

-- DROP SEQUENCE m_economie.an_site_doc_media_gig_seq;
/*
CREATE SEQUENCE m_economie.an_site_doc_media_gig_seq
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 85
  CACHE 1;
ALTER TABLE m_economie.an_site_doc_media_gig_seq
  OWNER TO sig_create;
  */
  
-- ################################################# Séquence des identifiants pour les données historiques des établissements ##################################


  -- Sequence: m_economie.h_an_sa_etab_gid_seq

-- DROP SEQUENCE m_economie.h_an_sa_etab_gid_seq;

/*
CREATE SEQUENCE m_economie.h_an_sa_etab_gid_seq
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 37621
  CACHE 1;
ALTER TABLE m_economie.h_an_sa_etab_gid_seq
  OWNER TO sig_create;
  */
  
  
-- ################################################# Séquence des identifiants pour les données historiques des sites d'activités ##################################

-- Sequence: m_economie.h_an_sa_site_id_seq

-- DROP SEQUENCE m_economie.h_an_sa_site_id_seq;

/*
CREATE SEQUENCE m_economie.h_an_sa_site_id_seq
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 462
  CACHE 1;
ALTER TABLE m_economie.h_an_sa_site_id_seq
  OWNER TO sig_create;
*/

-- ################################################# Séquence des identifiants pour les données historiques des sites mixtes ##################################

-- Sequence: m_economie.h_an_sa_site_id_seq

-- DROP SEQUENCE m_economie.h_an_sa_site_id_seq;

/*
CREATE SEQUENCE m_economie.h_an_sa_site_id_seq
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 1
  CACHE 1;
ALTER TABLE m_economie.h_an_sa_site_id_seq
  OWNER TO sig_create;
*/


-- ################################################# Séquence des identifiants pour les lots ##################################

-- Sequence: public.idgeo_seq

-- DROP SEQUENCE public.idgeo_seq;

/*
CREATE SEQUENCE public.idgeo_seq
  INCREMENT 1
  MINVALUE 305000
  MAXVALUE 99999999999999999
  START 1
  CACHE 1;
ALTER TABLE public.idgeo_seq
  OWNER TO postgres;
*/


-- ####################################################################################################################################################
-- ###                                                                                                                                              ###
-- ###                                                                DOMAINES DE VALEURS                                                           ###
-- ###                                                                                                                                              ###
-- ####################################################################################################################################################



-- ####################################################################################################################################################
-- ###                                                                                                                                              ###
-- ###                                                                TABLE                                                           ###
-- ###                                                                                                                                              ###
-- ####################################################################################################################################################


-- ####################################################################################################################################################
-- ###                                                                                                                                              ###
-- ###                                                                        FKEY                                                                  ###
-- ###                                                                                                                                              ###
-- ####################################################################################################################################################



-- ####################################################################################################################################################
-- ###                                                                                                                                              ###
-- ###                                                                INDEX                                                           ###
-- ###                                                                                                                                              ###
-- ####################################################################################################################################################













