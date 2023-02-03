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


-- ################################################# TABLE ##################################
-- ################################################# Séquence des n° de cessions ##################################





-- ####################################################################################################################################################
-- ###                                                                                                                                              ###
-- ###                                                                DOMAINES DE VALEURS                                                           ###
-- ###                                                                                                                                              ###
-- ####################################################################################################################################################

-- ################################################# du schéma objet Objet ##################################

-- ################################################################# Domaine valeur - vocafon  ###############################################



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


