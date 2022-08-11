/*Amt_Fon_Eco V2.0*/
/*Creation du squelette de la structure des données (table, séquence, trigger,...) */
/* afe_101_squelette.sql */
/*PostGIS*/

/* Propriétaire : GeoCompiegnois - http://geo.compiegnois.fr/ */
/* Auteur : Grégory Bodet */

-- NETTOYAGE

/* VIEW */
DROP VIEW IF EXISTS m_activite_eco.geo_v_eco_lot;
DROP VIEW IF EXISTS m_activite_eco.geo_v_lot;

/* TABLE */
DROP TABLE IF EXISTS  m_activite_eco.an_eco_pole;
DROP TABLE IF EXISTS  m_activite_eco.geo_eco_site;
DROP TABLE IF EXISTS m_activite_eco.an_eco_media;
DROP TABLE IF EXISTS m_activite_eco.an_eco_contact CASCADE;
DROP TABLE IF EXISTS m_activite_eco.an_eco_evenmt;
DROP TABLE IF EXISTS m_urbanisme_reg.geo_proced;
DROP TABLE IF EXISTS m_activite_eco.an_eco_lot;

/* TABLE DE RELATION */
DROP TABLE IF EXISTS m_activite_eco.lk_eco_contact;

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

/* SEQUENCE */
DROP SEQUENCE IF EXISTS m_activite_eco.an_eco_pole_seq;
DROP SEQUENCE IF EXISTS m_activite_eco.geo_eco_site_seq;
DROP SEQUENCE IF EXISTS m_activite_eco.an_eco_media_seq;
DROP SEQUENCE IF EXISTS m_activite_eco.an_eco_contact_seq;
DROP SEQUENCE IF EXISTS m_activite_eco.lk_eco_contact_seq;
DROP SEQUENCE IF EXISTS m_activite_eco.an_eco_evenmt_seq;
DROP SEQUENCE IF EXISTS m_urbanisme_reg.geo_proced_seq;

/* TRIGGERS */

DROP TRIGGER t_t1_foncier_delete ON r_objet.geo_v_lot;
DROP TRIGGER t_t2_foncier_insert ON r_objet.geo_v_lot;
DROP TRIGGER t_t3_foncier_update ON r_objet.geo_v_lot;
DROP TRIGGER t_t1_delete_lot_eco ON m_activite_eco.geo_v_eco_lot;
DROP TRIGGER t_t2_insert_lot_eco ON m_activite_eco.geo_v_eco_lot;
DROP TRIGGER t_t3_modif_lot_eco ON m_activite_eco.geo_v_eco_lot;

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

*/

-- ####################################################################################################################################################
-- ###                                                                                                                                              ###
-- ###                                                                SEQUENCE                                                                      ###
-- ###                                                                                                                                              ###
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

-- ####################################################################################################################################################
-- ###                                                                                                                                              ###
-- ###                                                                DOMAINES DE VALEURS                                                           ###
-- ###                                                                                                                                              ###
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
COMMENT ON COLUMN m_activite_eco.lt_eco_etat.code IS 'Code de la typologie de la situation du site au regard de l''aménagement';
COMMENT ON COLUMN m_activite_eco.lt_eco_etat.valeur IS 'Code de la typologie de la situation du site au regard de l''aménagement';

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
    IS 'Liste de valeurs des types de contact';

COMMENT ON COLUMN m_activite_eco.lt_eco_typevenmt.code
    IS 'Code du type de contact';

COMMENT ON COLUMN m_activite_eco.lt_eco_typevenmt.valeur
    IS 'Libellé du type de contact';

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
-- ###                                                                                                                                              ###
-- ###                                                                TABLE                                                                         ###
-- ###                                                                                                                                              ###
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
    l_dst_ar_v integer,
    z_fr_f character varying(80) COLLATE pg_catalog."default",
    z_dst_fr_f integer,
    z_fr_v character varying(80) COLLATE pg_catalog."default",
    z_dst_fr_v integer,
    z_pmm boolean DEFAULT false,
    z_dst_pmm integer,
    serv_tc boolean DEFAULT false,
    serv_tc_g boolean DEFAULT false,	
    circ_douce boolean DEFAULT false,
    serv_rest integer,
    serv_crech integer,
    serv_autre character varying(1000) COLLATE pg_catalog."default",
    z_aide_pb boolean DEFAULT false,
    src_geom character varying(2) COLLATE pg_catalog."default" DEFAULT '00'::character varying,
    src_date character varying(4) COLLATE pg_catalog."default" NOT NULL DEFAULT '0000'::bpchar,
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
        ON DELETE NO ACTION,
    CONSTRAINT geo_am_fkey FOREIGN KEY (src_geom)
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

COMMENT ON COLUMN m_activite_eco.geo_eco_site.idsite
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
    t_doc character varying(2) COLLATE pg_catalog."default" DEFAULT '00',	
    d_photo timestamp without time zone,	
    alaune boolean NOT NULL DEFAULT false,
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

GRANT SELECT ON TABLE m_activite_eco.an_eco_media TO sig_read;

GRANT ALL ON TABLE m_activite_eco.an_eco_media TO create_sig;

GRANT INSERT, SELECT, UPDATE, DELETE ON TABLE m_activite_eco.an_eco_media TO sig_edit;

COMMENT ON TABLE m_activite_eco.an_eco_media
    IS 'Table gérant les documents intégrés pour la gestion des données du marché immobilier d''entreprises';

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

COMMENT ON COLUMN m_activite_eco.an_eco_media.d_photo
    IS 'Date de la prise de vue';

COMMENT ON COLUMN m_activite_eco.an_eco_media.alaune
    IS 'Média poussé à la une de l''annonce immobilière';

COMMENT ON COLUMN m_activite_eco.an_eco_media.gid
    IS 'Compteur (identifiant interne)';

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
    
-- ############################################################## [an_eco_evenmt] ##################################################################

-- Table: m_activite_eco.an_eco_evenmt

-- DROP TABLE m_activite_eco.an_eco_evenmt;

CREATE TABLE m_activite_eco.an_eco_evenmt
(
    idevenmt integer NOT NULL DEFAULT nextval('m_activite_eco.an_eco_evenmt_seq'::regclass),
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

-- ####################################################################################################################################################
-- ###                                                                                                                                              ###
-- ###                                                             TABLE DE RELATION                                                                ### 
-- ###                                                                                                                                              ###
-- ####################################################################################################################################################

-- ############################################################## [lk_eco_contact] ####################################################################

-- Table: m_activite_eco.lk_eco_contact

-- DROP TABLE m_activite_eco.lk_eco_contact;

CREATE TABLE m_activite_eco.lk_eco_contact
(
    id integer NOT NULL DEFAULT nextval('m_activite_eco.lk_eco_contact_seq'::regclass),
    idcontact integer NOT NULL,
    idobjet integer NOT NULL,
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

-- ############################################################## [an_eco_lot] ####################################################################

-- Table: m_activite_eco.an_eco_lot

-- DROP TABLE m_activite_eco.an_eco_lot;

CREATE TABLE m_activite_eco.an_eco_lot
(
    idgeolf integer NOT NULL,
    idsite character varying(10) COLLATE pg_catalog."default",
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

COMMENT ON COLUMN m_activite_eco.an_eco_lot.idsite
    IS 'Identifiant du site d''activité d''appartenance';

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

				  
-- ####################################################################################################################################################
-- ###                                                                                                                                              ###
-- ###                                                                INDEX                                                                         ###
-- ###                                                                                                                                              ###
-- ####################################################################################################################################################

-- ####################################################################################################################################################
-- ###                                                                                                                                              ###
-- ###                                                                FONCTION                                                                      ###
-- ###                                                                                                                                              ###
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

    DELETE FROM m_foncier.an_cession WHERE idces=(SELECT lf.idces FROM m_foncier.an_cession f, m_foncier.lk_cession_lot lf WHERE f.idces=lf.idces AND lf.idgeolf=old.idgeolf);
    DELETE FROM m_foncier.lk_cession_lot WHERE idgeolf=old.idgeolf;
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


-- FUNCTION: m_economie.ft_m_insert_lot_eco()

-- DROP FUNCTION m_economie.ft_m_insert_lot_eco();

CREATE OR REPLACE FUNCTION m_activite_eco.ft_m_insert_lot_eco()
    RETURNS trigger
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE NOT LEAKPROOF
AS $BODY$

DECLARE v_idces integer;
DECLARE v_idgeolf integer;
DECLARE lot_surf integer;

BEGIN

     v_idgeolf := (SELECT nextval('idgeo_seq'::regclass));

     INSERT INTO r_objet.geo_objet_fon_lot SELECT v_idgeolf,new.op_sai,new.ref_spa,null,'20',new.geom,now(),null,new.l_nom;
     INSERT INTO m_amenagement.an_amt_lot_stade SELECT v_idgeolf,
                                                 CASE WHEN new.idsite IS NULL or new.idsite = '' THEN
						 (
							SELECT DISTINCT
								idsite 
							FROM 
								r_objet.geo_objet_ope
							WHERE
								st_intersects(geo_objet_ope.geom,ST_PointOnSurface(new.geom)) = true AND idsite <> '60159ak'
								
						  )
						  ELSE
						  new.idsite
						  END
						  ,
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
						 CASE WHEN new.idsite IS NULL or new.idsite = '' THEN
						 (
							SELECT DISTINCT
								idsite 
							FROM 
								r_objet.geo_objet_ope
							WHERE
								st_intersects(geo_objet_ope.geom,ST_PointOnSurface(new.geom)) = true AND idsite <> '60159ak'
								
						  ) 
                                                  ELSE
						  new.idsite
						  END   
						  , -- recherche idsite

						  lot_surf,
						
								   CASE WHEN length(cast (lot_surf as character varying)) >= 1 and length(cast (lot_surf as character varying)) <= 3 THEN lot_surf || 'm²'
								   WHEN length(cast (lot_surf as character varying)) = 4 THEN replace(to_char(lot_surf,'FM9G999'),',',' ') || 'm²'
								   WHEN length(cast (lot_surf as character varying)) = 5 THEN replace(to_char(lot_surf,'FM99G999'),',',' ') || 'm²'
								   WHEN length(cast (lot_surf as character varying)) = 6 THEN replace(to_char(lot_surf,'FM999G999'),',',' ') || 'm²'
								   WHEN length(cast (lot_surf as character varying)) = 7 THEN replace(to_char(lot_surf,'FM9G999G999'),',',' ') || 'm²'
								   WHEN length(cast (lot_surf as character varying)) = 8 THEN replace(to_char(lot_surf,'FM99G999G999'),',',' ') || 'm²'
								   END,
						  null,
						  new.op_sai_att,
						  new.org_sai_att,
						  new.tact,
						  new.tact_99,
						  new.cnom,
						  new.lnom,
						  new.pvente_l,
						  new.pcess_l,
						  new.eff_dep,
						  new.eff_n5,
						  new.conv,
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
						  new.pcess,
						  null,
						  null,
						  null,
						  null,
						  new.occupant,
						  null,
						  (select string_agg(insee, ', ') from r_osm.geo_osm_commune where st_intersects(st_buffer(new.geom,-1),geom)),
						  (select string_agg(commune, ', ') from r_osm.geo_osm_commune where st_intersects(st_buffer(new.geom,-1),geom))
						  ;
						  
						  
						 			
     
     

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
						CASE WHEN new.idsite IS NULL or new.idsite = '' THEN
						(SELECT DISTINCT
								idsite 
							FROM 
								r_objet.geo_objet_ope
							WHERE
								st_intersects(geo_objet_ope.geom,st_pointonsurface(new.geom)) = true AND idsite <> '60159ak'
								
							)
						  ELSE
						  new.idsite
						  END
						,
							null
						);

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

CREATE OR REPLACE FUNCTION m_activite_eco.ft_m_modif_lot_eco()
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
							l_surf_l = 
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
							pvente_l = new.pvente_e || '€/m²',
							pcess_e = new.pcess,
							pcess_l = new.pcess || '€/m²',
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
							descrip=new.descrip
		WHERE an_sa_lot.idgeolf=new.idgeolf;

     return new;
END
$BODY$;

ALTER FUNCTION m_activite_eco.ft_m_modif_lot_eco()
    OWNER TO create_sig;

GRANT EXECUTE ON FUNCTION m_activite_eco.ft_m_modif_lot_eco() TO PUBLIC;

GRANT EXECUTE ON FUNCTION m_activite_eco.ft_m_modif_lot_eco() TO create_sig;


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
    f.idsite,
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
    f.pvente_e AS l_pvente,
    f.pvente_l,
    f.pcess_e AS l_pcess,
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
    f.commune,
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
GRANT SELECT ON TABLE m_activite_eco.geo_v_eco_lot TO sig_read;
GRANT ALL ON TABLE m_activite_eco.geo_v_eco_lot TO create_sig;
GRANT INSERT, SELECT, UPDATE, DELETE ON TABLE m_activite_eco.geo_v_eco_lot TO sig_edit;

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



-- ####################################################################################################################################################
-- ###                                                                                                                                              ###
-- ###                                                          VUE MATERIALISEE                                                                    ###
-- ###                                                                                                                                              ###
-- ####################################################################################################################################################



