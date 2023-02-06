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

-- séquences :
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

-- liste de valeurs :
-- DROP TABLE IF EXISTS m_activite_eco.lt_eco_dest;
-- DROP TABLE IF EXISTS m_activite_eco.lt_eco_etat;
-- DROP TABLE IF EXISTS m_activite_eco.lt_eco_occuploc;
-- DROP TABLE IF EXISTS m_activite_eco.lt_eco_tact;
-- DROP TABLE IF EXISTS m_activite_eco.lt_eco_tdocmedia;
-- DROP TABLE IF EXISTS m_activite_eco.lt_eco_typcontact;
-- DROP TABLE IF EXISTS m_activite_eco.lt_eco_typevenmt;
-- DROP TABLE IF EXISTS m_activite_eco.lt_eco_typloc;
-- DROP TABLE IF EXISTS m_activite_eco.lt_eco_typo;
-- DROP TABLE IF EXISTS m_activite_eco.lt_eco_typoccup;
-- DROP TABLE IF EXISTS m_activite_eco.lt_eco_typsite;
-- DROP TABLE IF EXISTS m_activite_eco.lt_eco_voca;
-- DROP TABLE IF EXISTS m_amenagement.lt_amt_etat_occup;
-- DROP TABLE IF EXISTS m_amenagement.lt_amt_stadeamng;
-- DROP TABLE IF EXISTS m_amenagement.lt_amt_stadeamng2;
-- DROP TABLE IF EXISTS m_amenagement.lt_amt_stadecomm;
-- DROP TABLE IF EXISTS m_amenagement.lt_amt_stadecomm2;
-- DROP TABLE IF EXISTS m_urbanisme_reg.lt_proc_phase;
-- DROP TABLE IF EXISTS m_urbanisme_reg.lt_proc_typ;
-- DROP TABLE IF EXISTS m_urbanisme_reg.lt_proc_typconso;
-- DROP TABLE IF EXISTS m_urbanisme_reg.lt_proc_typfon;
-- DROP TABLE IF EXISTS r_objet.lt_objet_vocafon;

-- ####################################################################################################################################################
-- ###                                                                                                                                              ###
-- ###                                                                SEQUENCE                                                           ###
-- ###                                                                                                                                              ###
-- ####################################################################################################################################################



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

-- ################################################################# Domaine valeur - lt_eco_dest  ###############################################

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

COMMENT ON TABLE m_activite_eco.lt_eco_dest
    IS 'Liste de valeurs de destination (table pôle et site)';

COMMENT ON COLUMN m_activite_eco.lt_eco_dest.code
    IS 'Code de la destination principale du site ou du Pôle';

COMMENT ON COLUMN m_activite_eco.lt_eco_dest.valeur
    IS 'Libellé de la destination principale du site ou du Pôle';

-- Index: lt_eco_dest_code_idx
-- DROP INDEX m_activite_eco.lt_eco_dest_code_idx;

CREATE INDEX lt_eco_dest_code_idx
    ON m_activite_eco.lt_eco_dest USING btree
    (code COLLATE pg_catalog."default" ASC NULLS LAST)
    TABLESPACE pg_default;

-- Index: lt_eco_titre_idx
-- DROP INDEX m_activite_eco.lt_eco_titre_idx;

CREATE INDEX lt_eco_titre_idx
    ON m_activite_eco.lt_eco_dest USING btree
    (code COLLATE pg_catalog."default" ASC NULLS LAST)
    TABLESPACE pg_default;

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

-- ################################################################# Domaine valeur - lt_eco_occuploc  ###############################################

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

COMMENT ON COLUMN m_activite_eco.lt_eco_occuploc.code
    IS 'Code du type d''occupation d''un local';

COMMENT ON COLUMN m_activite_eco.lt_eco_occuploc.valeur
    IS 'Libellé du type d''occupation d''un local';
    
COMMENT ON CONSTRAINT lt_eco_occuploc_pkey ON m_activite_eco.lt_eco_occuploc
    IS 'Clé primaire de la table lt_eco_occuploc';
    
-- Index: lt_eco_occuploc_code_idx
-- DROP INDEX m_activite_eco.lt_eco_occuploc_code_idx;

CREATE INDEX lt_eco_occuploc_code_idx
    ON m_activite_eco.lt_eco_occuploc USING btree
    (code COLLATE pg_catalog."default" ASC NULLS LAST)
    TABLESPACE pg_default;

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
    ('40','Occupé'),;

-- ################################################################# Domaine valeur - lt_eco_tact  ###############################################

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

COMMENT ON TABLE m_activite_eco.lt_eco_tact
    IS 'Liste de valeurs de l''activité du projet d''implantation sur les lots (spécifique à l''ARC)';

COMMENT ON COLUMN m_activite_eco.lt_eco_tact.code
    IS 'Code de l''activité du projet d''implantation sur les lots (spécifique à l''ARC)';

COMMENT ON COLUMN m_activite_eco.lt_eco_tact.valeur
    IS 'Libellé de l''activité du projet d''implantation sur les lots (spécifique à l''ARC)';
    
-- Index: lt_eco_tact_code_idx
-- DROP INDEX m_activite_eco.lt_eco_tact_code_idx;

CREATE INDEX lt_eco_tact_code_idx
    ON m_activite_eco.lt_eco_tact USING btree
    (code COLLATE pg_catalog."default" ASC NULLS LAST)
    TABLESPACE pg_default;

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

-- ################################################################# Domaine valeur - lt_eco_tdocmedia  ###############################################

CREATE TABLE m_activite_eco.lt_eco_tdocmedia
(
    code character varying(2) COLLATE pg_catalog."default" NOT NULL,
    valeur character varying(100) COLLATE pg_catalog."default",
    CONSTRAINT lt_eco_tdocmedia_pkey PRIMARY KEY (code)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

COMMENT ON TABLE m_activite_eco.lt_eco_tdocmedia
    IS 'Liste de valeurs des types de médias';

COMMENT ON COLUMN m_activite_eco.lt_eco_tdocmedia.code
    IS 'Code du type de média';

COMMENT ON COLUMN m_activite_eco.lt_eco_tdocmedia.valeur
    IS 'Libellé du type de média';
    
-- Index: lt_eco_tdocmedia_code_idx
-- DROP INDEX m_activite_eco.lt_eco_tdocmedia_code_idx;

CREATE INDEX lt_eco_tdocmedia_code_idx
    ON m_activite_eco.lt_eco_tdocmedia USING btree
    (code COLLATE pg_catalog."default" ASC NULLS LAST)
    TABLESPACE pg_default;

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

-- ################################################################# Domaine valeur - lt_eco_typcontact  ###############################################

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

COMMENT ON TABLE m_activite_eco.lt_eco_typcontact
    IS 'Liste de valeurs des types de contact';

COMMENT ON COLUMN m_activite_eco.lt_eco_typcontact.code
    IS 'Code du type de contact';

COMMENT ON COLUMN m_activite_eco.lt_eco_typcontact.valeur
    IS 'Libellé du type de contact';
    
-- Index: lt_eco_typcontact_code_idx
-- DROP INDEX m_activite_eco.lt_eco_typcontact_code_idx;

CREATE INDEX lt_eco_typcontact_code_idx
    ON m_activite_eco.lt_eco_typcontact USING btree
    (code COLLATE pg_catalog."default" ASC NULLS LAST)
    TABLESPACE pg_default;

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

-- ################################################################# Domaine valeur - lt_eco_typevenmt  ###############################################

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

COMMENT ON TABLE m_activite_eco.lt_eco_typevenmt
    IS 'Liste de valeurs des types d''évènement';

COMMENT ON COLUMN m_activite_eco.lt_eco_typevenmt.code
    IS 'Code du type d''évènement';

COMMENT ON COLUMN m_activite_eco.lt_eco_typevenmt.valeur
    IS 'Libellé du type d''évènement';
    
-- Index: lt_eco_typevenmt_code_idx
-- DROP INDEX m_activite_eco.lt_eco_typevenmt_code_idx;

CREATE INDEX lt_eco_typevenmt_code_idx
    ON m_activite_eco.lt_eco_typevenmt USING btree
    (code COLLATE pg_catalog."default" ASC NULLS LAST)
    TABLESPACE pg_default;

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
    

-- ################################################################# Domaine valeur - lt_eco_typloc  ###############################################

CREATE TABLE m_activite_eco.lt_eco_typloc
(
    code character varying(2) COLLATE pg_catalog."default" NOT NULL,
    valeur character varying(100) COLLATE pg_catalog."default",
    CONSTRAINT lt_eco_typloc_pkey PRIMARY KEY (code)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

COMMENT ON TABLE m_activite_eco.lt_eco_typloc
    IS 'Liste de valeurs des typologies d''ocupation des locaux d''activité';

COMMENT ON COLUMN m_activite_eco.lt_eco_typloc.code
    IS 'Code du type de local';

COMMENT ON COLUMN m_activite_eco.lt_eco_typloc.valeur
    IS 'Libellé du type de local';
COMMENT ON CONSTRAINT lt_eco_typloc_pkey ON m_activite_eco.lt_eco_typloc
    IS 'Clé primaire de la table lt_eco_typloc';
    
-- Index: lt_eco_typloc_code_idx
-- DROP INDEX m_activite_eco.lt_eco_typloc_code_idx;

CREATE INDEX lt_eco_typloc_code_idx
    ON m_activite_eco.lt_eco_typloc USING btree
    (code COLLATE pg_catalog."default" ASC NULLS LAST)
    TABLESPACE pg_default;    

INSERT INTO m_activite_eco.lt_eco_typloc(
            code, valeur)
    VALUES
    ('00','Non renseigné'),
    ('40','Pas de local (terrain, ...)'),
    ('30','Bâtiment composé de plateaux tertiaires'),
    ('20','Bâtiment composé de cellules commerciales'),
    ('10','Bâtiment composé de cellules d''activités'),
    ('50','Bâtiment mixte');
    
 -- ################################################################# Domaine valeur - lt_eco_typo  ###############################################

CREATE TABLE m_activite_eco.lt_eco_typo
(
    code character varying(2) COLLATE pg_catalog."default" NOT NULL,
    valeur character varying(40) COLLATE pg_catalog."default",
    CONSTRAINT lt_eco_typo_pkey PRIMARY KEY (code)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

COMMENT ON TABLE m_activite_eco.lt_eco_typo
    IS 'Liste de valeurs de la typologie du site';

COMMENT ON COLUMN m_activite_eco.lt_eco_typo.code
    IS 'Code de la typologie GéoPicardie du site';

COMMENT ON COLUMN m_activite_eco.lt_eco_typo.valeur
    IS 'Libellé de la typologie GéoPicardie du site';

-- Index: lt_eco_typo_code_idx
-- DROP INDEX m_activite_eco.lt_eco_typo_code_idx;

CREATE INDEX lt_eco_typo_code_idx
    ON m_activite_eco.lt_eco_typo USING btree
    (code COLLATE pg_catalog."default" ASC NULLS LAST)
    TABLESPACE pg_default;
 
 INSERT INTO m_activite_eco.lt_eco_typo(
            code, valeur)
    VALUES
    ('00','Non renseigné'),
    ('10','Site monofonctionnel'),
    ('20','Site plurifonctionnel en périphérie'),
    ('30','Site plurifonctionnel en centre-ville'),
    ('40','Etablissement isolé');
    
    
 -- ################################################################# Domaine valeur - lt_eco_typoccup  ###############################################
    
CREATE TABLE m_activite_eco.lt_eco_typoccup
(
    code character varying(2) COLLATE pg_catalog."default" NOT NULL,
    valeur character varying(50) COLLATE pg_catalog."default",
    typ1 character varying(10) COLLATE pg_catalog."default",
    CONSTRAINT lt_eco_typoccup_pkey PRIMARY KEY (code)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

COMMENT ON TABLE m_activite_eco.lt_eco_typoccup
    IS 'Liste de valeurs des types de locaux d''activité';

COMMENT ON COLUMN m_activite_eco.lt_eco_typoccup.code
    IS 'Code du type de local';

COMMENT ON COLUMN m_activite_eco.lt_eco_typoccup.valeur
    IS 'Libellé du type de local';

COMMENT ON COLUMN m_activite_eco.lt_eco_typoccup.typ1
    IS 'Typologie du local';
COMMENT ON CONSTRAINT lt_eco_typoccup_pkey ON m_activite_eco.lt_eco_typoccup
    IS 'Clé primaire de la table lt_eco_typoccup';
    
-- Index: lt_eco_typoccup_code_idx
-- DROP INDEX m_activite_eco.lt_eco_typoccup_code_idx;

CREATE INDEX lt_eco_typoccup_code_idx
    ON m_activite_eco.lt_eco_typoccup USING btree
    (code COLLATE pg_catalog."default" ASC NULLS LAST)
    TABLESPACE pg_default;

 INSERT INTO m_activite_eco.lt_eco_typoccup(
            code, valeur)
    VALUES
    ('00','Non renseigné'),
    ('10','Terrain vierge'),
    ('20','Terrain en activité (non bâti)'),
    ('30','Bureau'),
    ('40','Commerce'),
    ('50','Activité');

 -- ################################################################# Domaine valeur - lt_eco_typsite  ###############################################
 
CREATE TABLE m_activite_eco.lt_eco_typsite
(
    code character varying(2) COLLATE pg_catalog."default" NOT NULL,
    valeur character varying(100) COLLATE pg_catalog."default",
    CONSTRAINT lt_eco_typsite_pkey PRIMARY KEY (code)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

COMMENT ON TABLE m_activite_eco.lt_eco_typsite
    IS 'Liste de valeurs des types de sites';

COMMENT ON COLUMN m_activite_eco.lt_eco_typsite.code
    IS 'Code du type de site';

COMMENT ON COLUMN m_activite_eco.lt_eco_typsite.valeur
    IS 'Libellé du type de site';
    
-- Index: lt_eco_typsite_code_idx
-- DROP INDEX m_activite_eco.lt_eco_typsite_code_idx;

CREATE INDEX lt_eco_typsite_code_idx
    ON m_activite_eco.lt_eco_typsite USING btree
    (code COLLATE pg_catalog."default" ASC NULLS LAST)
    TABLESPACE pg_default;

 INSERT INTO m_activite_eco.lt_eco_typsite(
            code, valeur)
    VALUES
    ('00','Non renseigné'),
    ('10','ZAE'),
    ('20','Autre site d''activité identifié (hors ZAE)'),
    ('30','Autre secteur (non exclusivement économique)');
 
-- ################################################################# Domaine valeur - lt_eco_voca  ###############################################

CREATE TABLE m_activite_eco.lt_eco_voca
(
    code character varying(2) COLLATE pg_catalog."default" NOT NULL,
    valeur character varying(25) COLLATE pg_catalog."default",
    CONSTRAINT lt_eco_voca_pkey PRIMARY KEY (code)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

COMMENT ON TABLE m_activite_eco.lt_eco_voca
    IS 'Liste de valeurs de vocation simplifiée de la zone';

COMMENT ON COLUMN m_activite_eco.lt_eco_voca.code
    IS 'Code de la vocation du site';

COMMENT ON COLUMN m_activite_eco.lt_eco_voca.valeur
    IS 'Libellé de la vocation du site';
    
-- Index: lt_eco_voca_code_idx
-- DROP INDEX m_activite_eco.lt_eco_voca_code_idx;

CREATE INDEX lt_eco_voca_code_idx
    ON m_activite_eco.lt_eco_voca USING btree
    (code COLLATE pg_catalog."default" ASC NULLS LAST)
    TABLESPACE pg_default;   

 INSERT INTO m_activite_eco.lt_eco_voca(
            code, valeur)
    VALUES
    ('00','Non renseigné'),
    ('10','ZI - zone industrielle'),
    ('20','ZA - zone artisanale'),
    ('30','ZC - zone commerciale'),
    ('40','ZM - zone mixte');


-- ##########################################################################################################
-- ################################################# SCHEMA M_AMENGAMENT ##################################
-- ##########################################################################################################

-- ################################################################# Domaine valeur - lt_amt_etat_occup  ###############################################

CREATE TABLE m_amenagement.lt_amt_etat_occup
(
    code character varying(2) COLLATE pg_catalog."default" NOT NULL,
    valeur character varying(25) COLLATE pg_catalog."default",
    CONSTRAINT lt_sa_etat_pkkey PRIMARY KEY (code)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

COMMENT ON TABLE m_amenagement.lt_amt_etat_occup
    IS 'Liste des valeurs de l''état du site';

COMMENT ON COLUMN m_amenagement.lt_amt_etat_occup.code
    IS 'Code de la typologie de la situation du site au regard de l''aménagement';

COMMENT ON COLUMN m_amenagement.lt_amt_etat_occup.valeur
    IS 'Code de la typologie de la situation du site au regard de l''aménagement';
    
COMMENT ON CONSTRAINT lt_sa_etat_pkkey ON m_amenagement.lt_amt_etat_occup
    IS 'Clé primaire de la table lt_sa_etat';
    
-- Index: lt_amt_etat_occup_idx
-- DROP INDEX m_amenagement.lt_amt_etat_occup_idx;

CREATE INDEX lt_amt_etat_occup_idx
    ON m_amenagement.lt_amt_etat_occup USING btree
    (code COLLATE pg_catalog."default" ASC NULLS LAST)
    TABLESPACE pg_default;

 INSERT INTO m_activite_eco.lt_amt_etat_occup(
            code, valeur)
    VALUES
    ('10','Existant'),
    ('20','Extension'),
    ('30','Création'),
    ('40','Déclassé'),
    ('50','Projet de déclassement'),
    ('00','Non renseigné');

-- ################################################################# Domaine valeur - lt_amt_stadeamng  ###############################################

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

COMMENT ON TABLE m_amenagement.lt_amt_stadeamng
    IS 'Liste de valeurs du stade d''aménagement du lot';

COMMENT ON COLUMN m_amenagement.lt_amt_stadeamng.code
    IS 'Code du stade d''aménagement du lot';

COMMENT ON COLUMN m_amenagement.lt_amt_stadeamng.valeur
    IS 'Libellé du stade d''aménagement du lot';
COMMENT ON CONSTRAINT lt_amt_stadeamng_pkey ON m_amenagement.lt_amt_stadeamng
    IS 'Clé primaire de la table lt_sa_stadeamng';
    
-- Index: lt_amt_stadeamng_code_idx
-- DROP INDEX m_amenagement.lt_amt_stadeamng_code_idx;

CREATE INDEX lt_amt_stadeamng_code_idx
    ON m_amenagement.lt_amt_stadeamng USING btree
    (code COLLATE pg_catalog."default" ASC NULLS LAST)
    TABLESPACE pg_default;

 INSERT INTO m_activite_eco.lt_amt_stadeamng(
            code, valeur)
    VALUES
    ('00','Non renseigné'),
    ('10','Aucun'),
    ('20','Non acquis'),
    ('30','Acquis'),
    ('40','Viabilisé');
    
-- ################################################################# Domaine valeur - lt_amt_stadeamng2  ###############################################

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

COMMENT ON TABLE m_amenagement.lt_amt_stadeamng2
    IS 'Liste de valeurs du stade d''aménagement du lot spécifique à l''ARC';

COMMENT ON COLUMN m_amenagement.lt_amt_stadeamng2.code
    IS 'Code de l''état de disponibilité des lots selon le stade d''aménagement (spécifique à l''ARC)';

COMMENT ON COLUMN m_amenagement.lt_amt_stadeamng2.valeur
    IS 'Libellé de l''état de disponibilité des lots selon le stade d''aménagement (spécifique à l''ARC)';
COMMENT ON CONSTRAINT lt_amt_stadeamng2_pkey ON m_amenagement.lt_amt_stadeamng2
    IS 'Clé primaire de la table lt_sa_stadeamng2';
    
-- Index: lt_amt_stadeamng2_code_idx
-- DROP INDEX m_amenagement.lt_amt_stadeamng2_code_idx;

CREATE INDEX lt_amt_stadeamng2_code_idx
    ON m_amenagement.lt_amt_stadeamng2 USING btree
    (code COLLATE pg_catalog."default" ASC NULLS LAST)
    TABLESPACE pg_default;

 INSERT INTO m_activite_eco.lt_amt_stadeamng(
            code, valeur)
    VALUES
    ('00','Non renseigné'),
    ('10','Disponible (aménagé ou aménageable rapidement)'),
    ('20','Indisponible (terrain non acheté)'),
    ('30','Indisponible (terrain non aménagé)');

-- ################################################################# Domaine valeur - lt_amt_stadecomm  ###############################################

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

COMMENT ON TABLE m_amenagement.lt_amt_stadecomm
    IS 'Liste de valeurs du stade de commercialisation';

COMMENT ON COLUMN m_amenagement.lt_amt_stadecomm.code
    IS 'Code du stade de commercialisation';

COMMENT ON COLUMN m_amenagement.lt_amt_stadecomm.valeur
    IS 'Libellé du stade de commercialisation';
COMMENT ON CONSTRAINT lt_amt_stadecomm_pkey ON m_amenagement.lt_amt_stadecomm
    IS 'Clé primaire de la table lt_sa_stadecomm';
    
-- Index: lt_amt_stadecomm_code_idx
-- DROP INDEX m_amenagement.lt_amt_stadecomm_code_idx;

CREATE INDEX lt_amt_stadecomm_code_idx
    ON m_amenagement.lt_amt_stadecomm USING btree
    (code COLLATE pg_catalog."default" ASC NULLS LAST)
    TABLESPACE pg_default;

 INSERT INTO m_activite_eco.lt_amt_stadecomm(
            code, valeur)
    VALUES
    ('00','Non renseigné'),
    ('10','Aucun'),
    ('20','Commercialisable');

-- ################################################################# Domaine valeur - lt_amt_stadecomm2  ###############################################

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

COMMENT ON TABLE m_amenagement.lt_amt_stadecomm2
    IS 'Liste de valeurs du stade de commercialisation spécifique à l''ARC';

COMMENT ON COLUMN m_amenagement.lt_amt_stadecomm2.code
    IS 'Code du stade de commercialisation spécifique à l''ARC';

COMMENT ON COLUMN m_amenagement.lt_amt_stadecomm2.valeur
    IS 'Libellé du stade de commercialisation spécifique à l''ARC';
COMMENT ON CONSTRAINT lt_amt_stadecomm2_pkey ON m_amenagement.lt_amt_stadecomm2
    IS 'Clé primaire de la table lt_sa_stadecomm2 spécifique à l''ARC';
    
-- Index: lt_amt_stadecomm2_code_idx
-- DROP INDEX m_amenagement.lt_amt_stadecomm2_code_idx;

CREATE INDEX lt_amt_stadecomm2_code_idx
    ON m_amenagement.lt_amt_stadecomm2 USING btree
    (code COLLATE pg_catalog."default" ASC NULLS LAST)
    TABLESPACE pg_default;

 INSERT INTO m_activite_eco.lt_amt_stadecomm2(
            code, valeur)
    VALUES
    ('00','Non renseigné'),
    ('11','En vente'),
    ('12','En vente (avec contrainte)'),
    ('20','Vendu'),
    ('32','Réservé (option)'),
    ('99','Non commercialisé par un acteur public'),
    ('31','Réservé (par une délibération de l''EPCI)');

-- ##########################################################################################################
-- ################################################# SCHEMA M_URBANISME_REG ##################################
-- ##########################################################################################################

-- ################################################################# Domaine valeur - lt_proc_phase  ###############################################

CREATE TABLE m_urbanisme_reg.lt_proc_phase
(
    code character varying(2) COLLATE pg_catalog."default" NOT NULL,
    valeur character varying(50) COLLATE pg_catalog."default",
    CONSTRAINT lt_proc_phase_pkey PRIMARY KEY (code)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

COMMENT ON TABLE m_urbanisme_reg.lt_proc_phase
    IS 'Liste de valeurs des phases opérationnelles';

COMMENT ON COLUMN m_urbanisme_reg.lt_proc_phase.code
    IS 'Code de la phase de l''opération';

COMMENT ON COLUMN m_urbanisme_reg.lt_proc_phase.valeur
    IS 'Libellé de la phase de l''opération';
    
-- Index: lt_proc_phase_code_idx
-- DROP INDEX m_urbanisme_reg.lt_proc_phase_code_idx;

CREATE INDEX lt_proc_phase_code_idx
    ON m_urbanisme_reg.lt_proc_phase USING btree
    (code COLLATE pg_catalog."default" ASC NULLS LAST)
    TABLESPACE pg_default;

 INSERT INTO m_activite_eco.lt_proc_phase(
            code, valeur)
    VALUES
    ('00','Non renseigné'),
    ('10','Etude de faisabilité'),
    ('20','Acquisitions engagées - étude préopérationnelle'),
    ('30','Opérationnelle'),
    ('40','Achevée');

-- ################################################################# Domaine valeur - lt_proc_typ  ###############################################

CREATE TABLE m_urbanisme_reg.lt_proc_typ
(
    code character varying(2) COLLATE pg_catalog."default" NOT NULL,
    valeur character varying(20) COLLATE pg_catalog."default",
    CONSTRAINT lt_proc_typ_pkey PRIMARY KEY (code)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

COMMENT ON TABLE m_urbanisme_reg.lt_proc_typ
    IS 'Liste de valeurs des types de procédure';

COMMENT ON COLUMN m_urbanisme_reg.lt_proc_typ.code
    IS 'Code de la procédure';

COMMENT ON COLUMN m_urbanisme_reg.lt_proc_typ.valeur
    IS 'Libellé de la procédure';
    
-- Index: lt_proc_typ_code_idx
-- DROP INDEX m_urbanisme_reg.lt_proc_typ_code_idx;

CREATE INDEX lt_proc_typ_code_idx
    ON m_urbanisme_reg.lt_proc_typ USING btree
    (code COLLATE pg_catalog."default" ASC NULLS LAST)
    TABLESPACE pg_default;

 INSERT INTO m_activite_eco.lt_proc_typ(
            code, valeur)
    VALUES
    ('00','Non renseigné'),
    ('10','ZAC'),
    ('21','Lotissement PA'),
    ('22','Lotissement DP'),
    ('30','PC valant division'),
    ('40','AFU');
    
-- ################################################################# Domaine valeur - lt_proc_typconso  ###############################################

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

COMMENT ON TABLE m_urbanisme_reg.lt_proc_typconso
    IS 'Liste de valeurs des types de consommations foncières';

COMMENT ON COLUMN m_urbanisme_reg.lt_proc_typconso.code
    IS 'Code du type de consommation de surface';

COMMENT ON COLUMN m_urbanisme_reg.lt_proc_typconso.valeur
    IS 'Libellé du type de consommation de surface';
    
-- Index: lt_proc_typconso_code_idx
-- DROP INDEX m_urbanisme_reg.lt_proc_typconso_code_idx;

CREATE INDEX lt_proc_typconso_code_idx
    ON m_urbanisme_reg.lt_proc_typconso USING btree
    (code COLLATE pg_catalog."default" ASC NULLS LAST)
    TABLESPACE pg_default;

 INSERT INTO m_activite_eco.lt_proc_typconso(
            code, valeur)
    VALUES
    ('00','Non renseigné'),
    ('10','Renouvellement'),
    ('20','Extension'),
    ('30','Mixte');

-- ################################################################# Domaine valeur - lt_proc_typfon  ###############################################

CREATE TABLE m_urbanisme_reg.lt_proc_typfon
(
    code character varying(2) COLLATE pg_catalog."default" NOT NULL,
    valeur character varying(50) COLLATE pg_catalog."default",
    CONSTRAINT lt_proc_typfon_pkey PRIMARY KEY (code)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

COMMENT ON TABLE m_urbanisme_reg.lt_proc_typfon
    IS 'Liste de valeurs des procédures foncières';

COMMENT ON COLUMN m_urbanisme_reg.lt_proc_typfon.code
    IS 'Code de la procédure foncière';

COMMENT ON COLUMN m_urbanisme_reg.lt_proc_typfon.valeur
    IS 'Libellé de la procédure foncière';
    
-- Index: lt_proc_typfon_code_idx
-- DROP INDEX m_urbanisme_reg.lt_proc_typfon_code_idx;

CREATE INDEX lt_proc_typfon_code_idx
    ON m_urbanisme_reg.lt_proc_typfon USING btree
    (code COLLATE pg_catalog."default" ASC NULLS LAST)
    TABLESPACE pg_default;

INSERT INTO m_activite_eco.lt_proc_typfon(
            code, valeur)
    VALUES
    ('00','Non renseigné'),
    ('10','DUP'),
    ('20','Convention EPFLO'),
    ('30','Acquisitions amiables'),
    ('40','Opérateur privé');
    
    
-- ##########################################################################################################
-- ################################################# SCHEMA R_OBJET ##################################
-- ##########################################################################################################


-- ################################################################# Domaine valeur - lt_objet_vocafon  ###############################################

CREATE TABLE r_objet.lt_objet_vocafon
(
    code character varying(2) COLLATE pg_catalog."default" NOT NULL,
    valeur character varying(25) COLLATE pg_catalog."default",
    tri integer,
    CONSTRAINT lt_objet_vocafon_new_pkey PRIMARY KEY (code)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

COMMENT ON TABLE r_objet.lt_objet_vocafon
    IS 'Liste de valeurs de vocation simplifiée de la zone (table site), à renommer en lt_objet_vocafon (et idem GEO) après migration base de données Activ Eco V2';

-- Index: lt_objet_vocafon_new_code_1673875522813
-- DROP INDEX r_objet.lt_objet_vocafon_new_code_1673875522813;

CREATE INDEX lt_objet_vocafon_new_code_1673875522813
    ON r_objet.lt_objet_vocafon USING btree
    (code COLLATE pg_catalog."default" ASC NULLS LAST)
    TABLESPACE pg_default;

INSERT INTO r_objet.lt_objet_vocafon(
            code, valeur)
    VALUES
    ('20','Lot économique'),
    ('30','Lot habitat'),
    ('40','Lot divers'),
    ('50','Lot espace public'),
    ('60','Lot mixte'),
    ('10','Lot équipement public'),
    ('00','Non renseigné');


-- ####################################################################################################################################################
-- ###                                                                                                                                              ###
-- ###                                                                TABLE                                                           ###
-- ###                                                                                                                                              ###
-- ####################################################################################################################################################

-- ################################################# Du schéma r_objet ##################################


-- ################################################# Classe des objets espaces publics ##################################


