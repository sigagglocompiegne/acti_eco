/*Amt_Fon_Eco V2.0*/
/*Creation du squelette de la structure des données (table, séquence, trigger,...) */
/* afe_101_squelette.sql */
/*PostGIS*/

/* Propriétaire : GeoCompiegnois - http://geo.compiegnois.fr/ */
/* Auteur : Grégory Bodet */

-- NETTOYAGE

/* TABLE */
DROP TABLE IF EXISTS  m_activite_eco.an_eco_pole;
DROP TABLE IF EXISTS  m_activite_eco.geo_eco_site;
DROP TABLE IF EXISTS m_activite_eco.an_eco_media;
DROP TABLE IF EXISTS m_activite_eco.an_eco_contact;

/* TABLE DE RELATION */
DROP TABLE IF EXISTS m_activite_eco.lk_eco_contact;

/* LISTE DE VALEUR */
DROP TABLE IF EXISTS m_activite_eco.lt_eco_dest;
DROP TABLE IF EXISTS m_activite_eco.lt_eco_etat;
DROP TABLE IF EXISTS m_activite_eco.lt_eco_voca;
DROP TABLE IF EXISTS m_activite_eco.lt_eco_typo;
DROP TABLE IF EXISTS m_activite_eco.lt_eco_typsite;
DROP TABLE IF EXISTS m_activite_eco.lt_eco_tdocmedia;
DROP TABLE IF EXISTS m_activite_eco.lt_eco_tcontact;

/* SEQUENCE */
DROP SEQUENCE IF EXISTS m_activite_eco.an_eco_pole_seq;
DROP SEQUENCE IF EXISTS m_activite_eco.geo_eco_site_seq;
DROP SEQUENCE IF EXISTS m_activite_eco.an_eco_media_seq;
DROP SEQUENCE IF EXISTS m_activite_eco.an_eco_contact_seq;
DROP SEQUENCE IF EXISTS m_activite_eco.lk_eco_contact_seq;


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

-- ############################################################## [lk_eco_contact] ##################################################################

-- SEQUENCE: m_activite_eco.lk_eco_contact

-- DROP SEQUENCE m_activite_eco.lk_eco_contact;

CREATE SEQUENCE m_activite_eco.lk_eco_contact
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 9223372036854775807
    CACHE 1;

ALTER SEQUENCE m_activite_eco.lk_eco_contact
    OWNER TO create_sig;

GRANT ALL ON SEQUENCE m_activite_eco.lk_eco_contact TO PUBLIC;
GRANT ALL ON SEQUENCE m_activite_eco.lk_eco_contact TO create_sig;

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
    
-- ################################################################# Domaine valeur - [lt_eco_tcontact]  ##################################################

-- Table: m_activite_eco.lt_eco_tcontact

-- DROP TABLE m_activite_eco.lt_eco_tcontact;

CREATE TABLE m_activite_eco.lt_eco_tcontact
(
    code character varying(2) COLLATE pg_catalog."default" NOT NULL,
    valeur character varying(30) COLLATE pg_catalog."default",
    CONSTRAINT lt_eco_tcontact_pkkey PRIMARY KEY (code)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE m_activite_eco.lt_eco_tcontact
    OWNER to create_sig;

GRANT ALL ON TABLE m_activite_eco.lt_eco_tcontact TO sig_create;

GRANT SELECT ON TABLE m_activite_eco.lt_eco_tcontact TO sig_read;

GRANT ALL ON TABLE m_activite_eco.lt_eco_tcontact TO create_sig;

GRANT INSERT, SELECT, UPDATE, DELETE ON TABLE m_activite_eco.lt_eco_tcontact TO sig_edit;

COMMENT ON TABLE m_activite_eco.lt_eco_tcontact
    IS 'Liste de valeurs des types de contact';

COMMENT ON COLUMN m_activite_eco.lt_eco_tcontact.code
    IS 'Code du type de contact';

COMMENT ON COLUMN m_activite_eco.lt_eco_tcontact.valeur
    IS 'Libellé du type de contact';

INSERT INTO m_activite_eco.lt_eco_tcontact(
            code, valeur)
    VALUES
    ('00','Non renseigné'),
    ('10','Entreprise (standard)'),
    ('11','Directeur - Responsable'),
    ('12','Assistante'),
    ('13','DRH'),
    ('20','Propriétaire'),
    ('30','Commercialisateur');

-- ####################################################################################################################################################
-- ###                                                                                                                                              ###
-- ###                                                                TABLE                                                                         ###
-- ###                                                                                                                                              ###
-- ####################################################################################################################################################


-- ############################################################## [an_eco_pole] ######################################################################

-- Table: m_activite_eco.an_eco_pole

-- DROP TABLE m_activite_eco.an_eco_pole;

CREATE TABLE m_activite_eco.an_eco_pole
(
    idpole integer NOT NULL DEFAULT nextval('m_activite_eco.an_eco_pole_seq'::regclass),
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
    idsite integer NOT NULL DEFAULT nextval('m_activite_eco.geo_eco_site_seq'::regclass),
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
        REFERENCES an_eco_contact.lt_eco_typcontact (code) MATCH SIMPLE
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
    CONSTRAINT an_eco_pole_pkey PRIMARY KEY (idpole),
    CONSTRAINT an_eco_contact_fkey FOREIGN KEY (idcontact)
        REFERENCES m_activite_eco.lk_eco_contact (idcontact) MATCH SIMPLE
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

				  
-- ####################################################################################################################################################
-- ###                                                                                                                                              ###
-- ###                                                                        FKEY                                                                  ###
-- ###                                                                                                                                              ###
-- ####################################################################################################################################################


				  
-- ####################################################################################################################################################
-- ###                                                                                                                                              ###
-- ###                                                                INDEX                                                                         ###
-- ###                                                                                                                                              ###
-- ####################################################################################################################################################



