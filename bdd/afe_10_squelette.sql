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

-- sont intégrer également ici les schémas dépendant. Il ne faut les supprimer si d'autress informatiosn y sont aossicées.

-- DROP SCHEMA IF EXISTS m_activite_eco;
-- DROP SCHEMA IF EXIST m_amenagement;
-- DROP SCHEMA IF EXIST m_foncier;
-- DROP SCHEMA IF EXIST m_urbanisme_reg;
-- DROP SCHEMA IF EXIST r_objet;

/*
CREATE SCHEMA m_activite_eco
    AUTHORIZATION create_sig;

COMMENT ON SCHEMA m_activite_eco
    IS 'Données géographiques métiers sur le thème de l''environnement';

CREATE SCHEMA m_amenagement
    AUTHORIZATION create_sig;

COMMENT ON SCHEMA m_amenagement
    IS 'Données métiers sur le thème de l''urbanisme de projets et l''aménagement des sites gérés par l''ARC';
  
CREATE SCHEMA m_foncier
    AUTHORIZATION create_sig;

COMMENT ON SCHEMA m_foncier
    IS 'Données géographiques métiers sur le thème du foncier';  

CREATE SCHEMA m_urbanisme_reg
    AUTHORIZATION create_sig;

COMMENT ON SCHEMA m_urbanisme_reg
    IS 'Données géographiques métiers sur l''urbanisme réglementaire';

CREATE SCHEMA r_objet
    AUTHORIZATION create_sig;

COMMENT ON SCHEMA r_objet
    IS 'Schéma contenant les objets géographiques virtuels métiers (zonages, lots, entités administratives, ...). Les données métiers (alphanumériques) sont stockées dans le schéma correspondant, et le lien s''effectue via la référence géographique. Une donnée géographique spécifique à un seul métier, reste dans le schéma du métier.
Y est stocké également la liste des contrats spécifiques aux réseaux permettant de filtrer l''accès aux objets.';


*/    
-- ####################################################################################################################################################
-- ###                                                                                                                                              ###
-- ###                                                                SEQUENCE                                                           ###
-- ###                                                                                                                                              ###
-- ####################################################################################################################################################

-- DROP SEQUENCE IF EXISTS m_activite_eco.an_eco_bati_loc_media_seq;
-- DROP SEQUENCE IF EXISTS m_activite_eco.an_eco_contact_seq;
-- DROP SEQUENCE IF EXISTS m_activite_eco.an_eco_dia_seq;
-- DROP SEQUENCE IF EXISTS m_activite_eco.an_eco_etab_rad_seq;
-- DROP SEQUENCE IF EXISTS m_activite_eco.an_eco_etab_seq;
-- DROP SEQUENCE IF EXISTS m_activite_eco.an_eco_evenmt_media_seq;
-- DROP SEQUENCE IF EXISTS m_activite_eco.an_eco_evenmt_seq;
-- DROP SEQUENCE IF EXISTS m_activite_eco.an_eco_loc_act_seq;
-- DROP SEQUENCE IF EXISTS m_activite_eco.an_eco_loc_media_seq;
-- DROP SEQUENCE IF EXISTS m_activite_eco.an_eco_log_seq;
-- DROP SEQUENCE IF EXISTS m_activite_eco.an_eco_media_seq;
-- DROP SEQUENCE IF EXISTS m_activite_eco.an_eco_pole_seq;
-- DROP SEQUENCE IF EXISTS m_activite_eco.geo_eco_loc_act_seq;
-- DROP SEQUENCE IF EXISTS m_activite_eco.geo_eco_site_seq;
-- DROP SEQUENCE IF EXISTS m_activite_eco.h_an_eco_etab_seq;
-- DROP SEQUENCE IF EXISTS m_activite_eco.h_an_eco_site_seq;
-- DROP SEQUENCE IF EXISTS m_activite_eco.lk_adresseetablissement_seq;
-- DROP SEQUENCE IF EXISTS m_activite_eco.lk_eco_contact_seq;
-- DROP SEQUENCE IF EXISTS m_activite_eco.lk_eco_etab_site_seq;
-- DROP SEQUENCE IF EXISTS m_activite_eco.lk_eco_loc_adr_seq;
-- DROP SEQUENCE IF EXISTS m_activite_eco.lk_eco_loc_etab_seq;
-- DROP SEQUENCE IF EXISTS m_activite_eco.lk_eco_loc_evenmt_contact_seq;
-- DROP SEQUENCE IF EXISTS m_activite_eco.lk_eco_loc_site_seq;
-- DROP SEQUENCE IF EXISTS m_activite_eco.lk_eco_proc_seq;
-- DROP SEQUENCE IF EXISTS m_amenagement.lk_amt_lot_site_seq;
-- DROP SEQUENCE IF EXISTS m_urbanisme_reg.an_proc_media_seq;
-- DROP SEQUENCE IF EXISTS m_urbanisme_reg.geo_proc_seq;
-- DROP SEQUENCE IF EXISTS m_urbanisme_reg.an_proced_log_seq;

-- ##########################################################################################################
-- ################################################# SCHEMA M_ACTIVITE_ECO ##################################
-- ##########################################################################################################

-- ################################################# an_eco_bati_loc_media_seq ##################################
-- ################################################# Séquence des identifiants internes des médias associés aux bâtiments d'activité ##################################

CREATE SEQUENCE m_activite_eco.an_eco_bati_loc_media_seq
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 9223372036854775807
    CACHE 1;

-- ################################################# an_eco_contact_seq ##################################
-- ################################################# Séquence des identifiants internes de contact ##################################

CREATE SEQUENCE m_activite_eco.an_eco_contact_seq
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 9223372036854775807
    CACHE 1;
    
-- ################################################# an_eco_dia_seq ##################################
-- ################################################# Séquence des identifiants internes de DIA ##################################

CREATE SEQUENCE m_activite_eco.an_eco_dia_seq
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 9223372036854775807
    CACHE 1;

-- ################################################# an_eco_etab_rad_seq ##################################
-- ################################################# Séquence des identifiants internes de établissements radiés ##################################

CREATE SEQUENCE m_activite_eco.an_eco_etab_rad_seq
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 9223372036854775807
    CACHE 1;

-- ################################################# an_eco_etab_seq ##################################
-- ################################################# Séquence des identifiants internes des établissements (classe métier) ##################################

CREATE SEQUENCE m_activite_eco.an_eco_etab_seq
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 9223372036854775807
    CACHE 1;

-- ################################################# an_eco_evenmt_media_seq ##################################
-- ################################################# Séquence des identifiants internes des médias liés aux évènements ##################################

CREATE SEQUENCE m_activite_eco.an_eco_evenmt_media_seq
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 9223372036854775807
    CACHE 1;

-- ################################################# an_eco_evenmt_seq ##################################
-- ################################################# Séquence des identifiants internes des évènements ##################################

CREATE SEQUENCE m_activite_eco.an_eco_evenmt_seq
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 9223372036854775807
    CACHE 1;

-- ################################################# an_eco_loc_act_seq ##################################
-- ################################################# Séquence des identifiants internes des locaux d'activités ##################################

CREATE SEQUENCE m_activite_eco.an_eco_loc_act_seq
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 9223372036854775807
    CACHE 1;

-- ################################################# an_eco_loc_media_seq ##################################
-- ################################################# Séquence des identifiants internes des médias liés aux locaux d'activités ##################################

CREATE SEQUENCE m_activite_eco.an_eco_loc_media_seq
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 9223372036854775807
    CACHE 1;

-- ################################################# an_eco_log_seq ##################################
-- ################################################# Séquence des identifiants internes des logs ##################################

CREATE SEQUENCE m_activite_eco.an_eco_log_seq
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 9223372036854775807
    CACHE 1;
    

-- ################################################# an_eco_media_seq ##################################
-- ################################################# Séquence des identifiants internes des médias (lots et sites) ##################################

CREATE SEQUENCE m_activite_eco.an_eco_media_seq
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 9223372036854775807
    CACHE 1;
    

-- ################################################# an_eco_pole_seq ##################################
-- ################################################# Séquence des identifiants internes des pôles d'activité ##################################

CREATE SEQUENCE m_activite_eco.an_eco_pole_seq
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 9223372036854775807
    CACHE 1;

-- ################################################# geo_eco_loc_act_seq ##################################
-- ################################################# Séquence des identifiants internes des bâtiments d'activité ##################################

CREATE SEQUENCE m_activite_eco.geo_eco_loc_act_seq
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 9223372036854775807
    CACHE 1;

-- ################################################# geo_eco_site_seq ##################################
-- ################################################# Séquence des identifiants internes des sites d'activité ##################################

CREATE SEQUENCE m_activite_eco.geo_eco_site_seq
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 9223372036854775807
    CACHE 1;
    
-- ################################################# h_an_eco_etab_seq ##################################
-- ################################################# Séquence des identifiants internes de l'historique des établissements ##################################

CREATE SEQUENCE m_activite_eco.h_an_eco_etab_seq
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 9223372036854775807
    CACHE 1;

-- ################################################# h_an_eco_site_seq ##################################
-- ################################################# Séquence des identifiants internes de l'historique des sites ##################################

CREATE SEQUENCE m_activite_eco.h_an_eco_site_seq
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 9223372036854775807
    CACHE 1;

-- ################################################# lk_adresseetablissement_seq ##################################
-- ################################################# Séquence des identifiants internes des liens adresses-établissement ##################################

CREATE SEQUENCE m_activite_eco.lk_adresseetablissement_seq
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 9223372036854775807
    CACHE 1;
    
-- ################################################# lk_eco_contact_seq ##################################
-- ################################################# Séquence des identifiants internes des liens d'appartenance contacts-objets ##################################

CREATE SEQUENCE m_activite_eco.lk_eco_contact_seq
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 9223372036854775807
    CACHE 1;
    
-- ################################################# lk_eco_etab_site_seq ##################################
-- ################################################# Séquence des identifiants internes des liens d'appartenance établissements-sites ##################################

CREATE SEQUENCE m_activite_eco.lk_eco_etab_site_seq
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 9223372036854775807
    CACHE 1;

-- ################################################# lk_eco_loc_adr_seq ##################################
-- ################################################# Séquence des identifiants internes des liens d'appartenance établissements-sites ##################################

CREATE SEQUENCE m_activite_eco.lk_eco_loc_adr_seq
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 9223372036854775807
    CACHE 1;

-- ################################################# lk_eco_loc_etab_seq ##################################
-- ################################################# Séquence des identifiants internes des liens d'appartenance locaux d'activité - établissement ##################################

-- séquence non utilisée pour le moment

/*
CREATE SEQUENCE m_activite_eco.lk_eco_loc_etab_seq
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 9223372036854775807
    CACHE 1;
*/

-- ################################################# lk_eco_loc_evenmt_contact_seq ##################################
-- ################################################# Séquence des identifiants internes des liens d'appartenance des contacts à un évènement ##################################

CREATE SEQUENCE m_activite_eco.lk_eco_loc_evenmt_contact_seq
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 9223372036854775807
    CACHE

-- ################################################# lk_eco_loc_site_seq ##################################
-- ################################################# Séquence des identifiants internes des liens d'appartenance des bâtiments d'activité à un site d'activité ##################################

CREATE SEQUENCE m_activite_eco.lk_eco_loc_site_seq
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 9223372036854775807
    CACHE 1;

-- ################################################# lk_eco_proc_seq ##################################
-- ################################################# Séquence des identifiants internes des liens d'appartenance d'une procédure à un site d'aéctivité ##################################

CREATE SEQUENCE m_activite_eco.lk_eco_proc_seq
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 9223372036854775807
    CACHE 1;


-- ##########################################################################################################
-- ################################################# SCHEMA M_AMENAGEMENT ##################################
-- ##########################################################################################################

-- ################################################# lk_amt_lot_site_seq ##################################
-- ################################################# Séquence des identifiants internes des liens d'appartenance d'un lot à un site ##################################

CREATE SEQUENCE m_amenagement.lk_amt_lot_site_seq
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 9223372036854775807
    CACHE 1;

-- ##########################################################################################################
-- ################################################# SCHEMA M_URBANISME_REG ##################################
-- ##########################################################################################################

-- ################################################# an_proc_media_seq ##################################
-- ################################################# Séquence des identifiants internes des procédures d'aménagement ##################################

CREATE SEQUENCE m_urbanisme_reg.an_proc_media_seq
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 9223372036854775807
    CACHE 1;

-- ################################################# an_proced_log_seq ##################################
-- ################################################# Séquence des identifiants internes des logs de la table geo_amt_proc ##################################

CREATE SEQUENCE m_urbanisme_reg.an_proced_log_seq
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 9223372036854775807
    CACHE 1;

-- ################################################# geo_proc_seq ##################################
-- ################################################# Séquence des identifiants internes des procédures d'aménagement ##################################

CREATE SEQUENCE m_urbanisme_reg.geo_proc_seq
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 9223372036854775807
    CACHE 1;

-- ##########################################################################################################
-- ################################################# SCHEMA R_OBJET ##################################
-- ##########################################################################################################

-- ################################################# idgeo_seq ##################################
-- ################################################# Séquence des globales des identifiants internes des objets activités économiques nécessaires ##################################

CREATE SEQUENCE r_objet.idgeo_seq
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 99999999999999999
    CACHE 1;

-- ####################################################################################################################################################
-- ###                                                                                                                                              ###
-- ###                                                                DOMAINES DE VALEURS                                                           ###
-- ###                                                                                                                                              ###
-- ####################################################################################################################################################

-- ##########################################################################################################
-- ################################################# SCHEMA M_ACTIVITE_ECO ##################################
-- ##########################################################################################################



-- ##########################################################################################################
-- ################################################# SCHEMA R_OBJET ##################################
-- ##########################################################################################################


-- ################################################################# Domaine valeur - lt_objet_vocafon  ###############################################

INSERT INTO r_objet.lt_objet_vocafon(
            l_voca, voca_lib)
    VALUES
    ('00','Non renseigné'),
    ('10','Equipement public'),
    ('20','Lot Economique'),
    ('30','Lot Habitat'),
    ('40','Lot divers'),
    ('50','Lot espace public'),
    ('60','Lot Mixte');


-- ####################################################################################################################################################
-- ###                                                                                                                                              ###
-- ###                                                                TABLE                                                           ###
-- ###                                                                                                                                              ###
-- ####################################################################################################################################################

-- ################################################# Du schéma r_objet ##################################


-- ################################################# Classe des objets espaces publics ##################################


