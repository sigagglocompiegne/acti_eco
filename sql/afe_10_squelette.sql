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

-- Schema: s_sirene

-- DROP SCHEMA s_sirene;

/*
CREATE SCHEMA s_sirene
  AUTHORIZATION sig_create;

COMMENT ON SCHEMA s_sirene
  IS 'Données du référentiel SIRENE de l''INSEE sur les établissements (la table sirene_liste_juil2015 sera remplacée lors de la migration de la base et de la réinjection des historiques de SIRENE réalisée dans le cadre du test sur l''urbanisation des données)';
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


-- ################################################# Séquence des identifiants pour les établissements (source SIRENE) ##################################


-- Sequence: s_sirene.an_etablissement_gid_seq

-- DROP SEQUENCE s_sirene.an_etablissement_gid_seq;
/*
CREATE SEQUENCE s_sirene.an_etablissement_gid_seq
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 22970
  CACHE 1;
ALTER TABLE s_sirene.an_etablissement_gid_seq
  OWNER TO sig_create;
*/


-- ####################################################################################################################################################
-- ###                                                                                                                                              ###
-- ###                                                                DOMAINES DE VALEURS                                                           ###
-- ###                                                                                                                                              ###
-- ####################################################################################################################################################

-- ################################################# du schéma objet Objet ##################################

-- ################################################################# Domaine valeur - vocafon  ###############################################

-- Table: r_objet.lt_objet_vocafon

-- DROP TABLE r_objet.lt_objet_vocafon;

CREATE TABLE r_objet.lt_objet_vocafon
(
  l_voca character varying(2) NOT NULL, -- Code de la vocation
  voca_lib character varying(25), -- Libellé de la vocation
  CONSTRAINT lt_objet_vocafon_pkkey PRIMARY KEY (l_voca) -- Clé primaire de la table lt_objet_vocafon
)
WITH (
  OIDS=FALSE
);
ALTER TABLE r_objet.lt_objet_vocafon
  OWNER TO sig_create;
COMMENT ON TABLE r_objet.lt_objet_vocafon
  IS 'Liste de valeurs de vocation simplifiée de la zone (table site)';
COMMENT ON COLUMN r_objet.lt_objet_vocafon.l_voca IS 'Code de la vocation';
COMMENT ON COLUMN r_objet.lt_objet_vocafon.voca_lib IS 'Libellé de la vocation';

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

-- r_objet.lt_src_geom est une table générique sur les référentiels spatiaux utilisés 
-- (cf projet https://github.com/sigagglocompiegne/orga_gest_igeo détaillant ce domaine de valeur)

-- ################################################# Du schéma m_foncier ##################################


-- ################################################################# Domaine valeur - condition de cession  ###############################################


-- Table: m_foncier.lt_ces_cond

-- DROP TABLE m_foncier.lt_ces_cond;

CREATE TABLE m_foncier.lt_ces_cond
(
  l_condi character varying(2) NOT NULL, -- Code de conditions de cession
  condi_lib character varying(15), -- Libellé de conditions de cession
  CONSTRAINT lt_ces_cond_pkey PRIMARY KEY (l_condi) -- Clé primaire de la table lt_ces_cond
)
WITH (
  OIDS=FALSE
);
ALTER TABLE m_foncier.lt_ces_cond
  OWNER TO sig_create;

COMMENT ON TABLE m_foncier.lt_ces_cond
  IS 'Liste de valeurs des conditions de cession';
COMMENT ON COLUMN m_foncier.lt_ces_cond.l_condi IS 'Code de conditions de cession';
COMMENT ON COLUMN m_foncier.lt_ces_cond.condi_lib IS 'Libellé de conditions de cession';

COMMENT ON CONSTRAINT lt_ces_cond_pkey ON m_foncier.lt_ces_cond IS 'Clé primaire de la table lt_ces_cond';

INSERT INTO m_foncier.lt_ces_cond(
            l_condi, condi_lib)
    VALUES
    ('00','Non renseigné'),
    ('10','Amiable'),
    ('20','Préemption'),
    ('30','Judiciaire');

-- ################################################################# Domaine valeur - type de document de cession  ###############################################


-- Table: m_foncier.lt_ces_doc

-- DROP TABLE m_foncier.lt_ces_doc;

CREATE TABLE m_foncier.lt_ces_doc
(
  l_type character varying(2) NOT NULL, -- Code du type de document de cessions ou d'acquisitions
  type_lib character varying(100), -- Libellé du type de documents de cessions ou d'acquisitions
  CONSTRAINT lt_ces_doc_pkey PRIMARY KEY (l_type)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE m_foncier.lt_ces_doc
  OWNER TO sig_create;

COMMENT ON TABLE m_foncier.lt_ces_doc
  IS 'Liste de valeurs des types de documents concernant les cessions ou les acquisitions';
COMMENT ON COLUMN m_foncier.lt_ces_doc.l_type IS 'Code du type de document de cessions ou d''acquisitions';
COMMENT ON COLUMN m_foncier.lt_ces_doc.type_lib IS 'Libellé du type de documents de cessions ou d''acquisitions';

INSERT INTO m_foncier.lt_ces_doc(
            l_type, type_lib)
    VALUES
    ('00','Non renseigné'),
    ('10','Lettre d''engagement'),
    ('20','Estimation des domaines'),
    ('30','Délibération'),
    ('40','Acte d''engagement - promesse de vente'),
    ('50','Compromis de vente'),
    ('51','Document d''arpentage'),
    ('60','Acte de vente'),
    ('99','Autre');

-- ################################################################# Domaine valeur - état de cession  ###############################################


-- Table: m_foncier.lt_ces_etat

-- DROP TABLE m_foncier.lt_ces_etat;

CREATE TABLE m_foncier.lt_ces_etat
(
  l_etat character varying(2) NOT NULL, -- Code de l'état du dossier de cession
  etat_lib character varying(25), -- Libellé de l'état du dossier de cession
  CONSTRAINT lt_ces_etat_pkey PRIMARY KEY (l_etat) -- Clé primaire de la table lt_ces_etat
)
WITH (
  OIDS=FALSE
);
ALTER TABLE m_foncier.lt_ces_etat
  OWNER TO sig_create;

COMMENT ON TABLE m_foncier.lt_ces_etat
  IS 'Liste de valeurs de l''état du dossier';
COMMENT ON COLUMN m_foncier.lt_ces_etat.l_etat IS 'Code de l''état du dossier de cession';
COMMENT ON COLUMN m_foncier.lt_ces_etat.etat_lib IS 'Libellé de l''état du dossier de cession';

COMMENT ON CONSTRAINT lt_ces_etat_pkey ON m_foncier.lt_ces_etat IS 'Clé primaire de la table lt_ces_etat';


INSERT INTO m_foncier.lt_ces_etat(
            l_etat, etat_lib)
    VALUES
    ('00','Non renseigné'),
    ('01','En vente'),
    ('10','Négociation en cours'),
    ('20','Délibération prise'),
    ('30','Promesse signée'),
    ('40','Cédé'),
    ('50','Réméré'),
    ('60','Acquis'),
    ('99','Non cédé par un public');
 
 
 -- ################################################################# Domaine valeur - notaire  ###############################################

 -- Table: m_foncier.lt_ces_nota

-- DROP TABLE m_foncier.lt_ces_nota;

CREATE TABLE m_foncier.lt_ces_nota
(
  l_notaire character varying(2) NOT NULL, -- Code du nom du notaire
  notaire_lib character varying(20), -- Libellé du notaire
  CONSTRAINT lt_ces_nota_pkey PRIMARY KEY (l_notaire) -- Clé primaire de la table lt_ces_nota
)
WITH (
  OIDS=FALSE
);
ALTER TABLE m_foncier.lt_ces_nota
  OWNER TO sig_create;

COMMENT ON TABLE m_foncier.lt_ces_nota
  IS 'Liste de valeurs du nom du notaire';
COMMENT ON COLUMN m_foncier.lt_ces_nota.l_notaire IS 'Code du nom du notaire';
COMMENT ON COLUMN m_foncier.lt_ces_nota.notaire_lib IS 'Libellé du notaire';

COMMENT ON CONSTRAINT lt_ces_nota_pkey ON m_foncier.lt_ces_nota IS 'Clé primaire de la table lt_ces_nota';

-- La liste des valeurs n'est pas mentionnée ici pour des raisons de protection de la vie privée (table nominative)

-- ################################################################# Domaine valeur - organisme cédant ou acquérant  ###############################################


-- Table: m_foncier.lt_ces_orga

-- DROP TABLE m_foncier.lt_ces_orga;

CREATE TABLE m_foncier.lt_ces_orga
(
  l_orga character varying(2) NOT NULL, -- Code du nom de l'organisme cédant
  orga_lib character varying(50), -- Libellé du nom de l'organisme cédant
  CONSTRAINT lt_ces_orga_pkey PRIMARY KEY (l_orga) -- Clé primaire de la table lt_ces_orga
)
WITH (
  OIDS=FALSE
);
ALTER TABLE m_foncier.lt_ces_orga
  OWNER TO sig_create;

COMMENT ON TABLE m_foncier.lt_ces_orga
  IS 'Liste de valeurs des noms de l''organisme cédant';
COMMENT ON COLUMN m_foncier.lt_ces_orga.l_orga IS 'Code du nom de l''organisme cédant';
COMMENT ON COLUMN m_foncier.lt_ces_orga.orga_lib IS 'Libellé du nom de l''organisme cédant';

COMMENT ON CONSTRAINT lt_ces_orga_pkey ON m_foncier.lt_ces_orga IS 'Clé primaire de la table lt_ces_orga';

INSERT INTO m_foncier.lt_ces_orga(
            l_orga, orga_lib)
    VALUES
    ('00','Non renseigné'),
    ('10','ARC'),
    ('20','Commune de Armancourt'),
    ('21','Commune de Bienville'),
    ('22','Commune de Choisy-au-Bac'),
    ('23','Commune de Clairoix'),
    ('24','Commune de Compiègne'),
    ('25','Commune de Janville'),
    ('26','Commune de Jaux'),
    ('27','Commune de Jonquières'),
    ('28','Commune de Lachelle'),
    ('29','Commune de Lacroix-St-Ouen'),
    ('30','Commune de Margny-lès Compiègne'),
    ('31','Commune de Le Meux'),
    ('32','Commune de St-Jean-aux-Bois'),
    ('33','Commune de St-Sauveur'),
    ('34','Commune de Venette'),
    ('35','Commune de Vieux-Moulin'),
    ('36','EPFLO');

-- ################################################################# Domaine valeur - type d'acte  ###############################################


-- Table: m_foncier.lt_ces_tact

-- DROP TABLE m_foncier.lt_ces_tact;

CREATE TABLE m_foncier.lt_ces_tact
(
  l_type character varying(2) NOT NULL, -- Code du type d'acte de cession
  type_lib character varying(15), -- Libellé du type d'acte de cession
  CONSTRAINT lt_ces_tact_pkey PRIMARY KEY (l_type) -- Clé primaire de la table lt_ces_tact
)
WITH (
  OIDS=FALSE
);
ALTER TABLE m_foncier.lt_ces_tact
  OWNER TO sig_create;

COMMENT ON TABLE m_foncier.lt_ces_tact
  IS 'Liste de valeurs du type d''acte de cession';
COMMENT ON COLUMN m_foncier.lt_ces_tact.l_type IS 'Code du type d''acte de cession';
COMMENT ON COLUMN m_foncier.lt_ces_tact.type_lib IS 'Libellé du type d''acte de cession';

COMMENT ON CONSTRAINT lt_ces_tact_pkey ON m_foncier.lt_ces_tact IS 'Clé primaire de la table lt_ces_tact';

INSERT INTO m_foncier.lt_ces_tact(
            l_type, type_lib)
    VALUES
    ('00','Non renseigné'),
    ('10','Notarié'),
    ('20','Administratif'),
    ('30','Judiciaire');
    
 -- ################################################################# Domaine valeur - Vocation de la cession  ###############################################


-- Table: m_foncier.lt_ces_voca

-- DROP TABLE m_foncier.lt_ces_voca;

CREATE TABLE m_foncier.lt_ces_voca
(
  l_voca character varying(2) NOT NULL, -- Code de la vocation de la cession
  voca_lib character varying(50), -- Libellé de la vocation de la cession
  CONSTRAINT lt_ces_voca_pkey PRIMARY KEY (l_voca) -- Clé primaire de la table lt_ces_voca
)
WITH (
  OIDS=FALSE
);
ALTER TABLE m_foncier.lt_ces_voca
  OWNER TO sig_create;

COMMENT ON TABLE m_foncier.lt_ces_voca
  IS 'Liste de valeurs de la vocation de la cession';
COMMENT ON COLUMN m_foncier.lt_ces_voca.l_voca IS 'Code de la vocation de la cession';
COMMENT ON COLUMN m_foncier.lt_ces_voca.voca_lib IS 'Libellé de la vocation de la cession';

COMMENT ON CONSTRAINT lt_ces_voca_pkey ON m_foncier.lt_ces_voca IS 'Clé primaire de la table lt_ces_voca';

INSERT INTO m_foncier.lt_ces_tact(
            l_voca, voca_lib)
    VALUES
    ('00','Non renseigné'),
    ('10','Notarié'),
    ('11','ZAC des Sablons (25ème RGA)'),
    ('12','Les Cailloux'),
    ('13','ZAC du Camp du Roy'),
    ('14','Centre-bourg de Jaux'),
    ('15','Centre-bourg de St-Sauveur'),
    ('16','Chemin Mètresse'),
    ('17','Le Clos Féron'),
    ('18','ZAC des Deux Rives'),
    ('19','Divers'),
    ('20','Quai de l''écluse'),
    ('21','Ecole d''Etat Major'),
    ('22','Ecoquartier de Jaux'),
    ('23','Grammont'),
    ('24','Les Jardins'),
    ('25','Lainemont'),
    ('26','ZAC des Longues Rayes'),
    ('27','Le Maraiquet'),
    ('28','Les Marronniers'),
    ('29','ZAC du Maubon'),
    ('30','Le Moulin Bacot'),
    ('31','Muid Marcel'),
    ('32','La Pantoufière'),
    ('33','Parc technologique des Rives de l''Oise'),
    ('34','Parc tertiaire et scientifique'),
    ('35','La Petite Couture'),
    ('36','Piste cyclable rive droite'),
    ('37','Piste cyclable rive gauche'),
    ('38','Pôle de développement des Hauts de Margny'),
    ('39','ZAC de la Prairie - 2ème tranche'),
    ('40','ZAC des Prés Moireaux'),
    ('41','Rétrocession'),
    ('42','Les Roses de Picardie'),
    ('43','Les Tambouraines'),
    ('44','ZA du Valadan'),
    ('45','Zone commerciale de Jaux'),
    ('46','Zone de loisirs de Jaux'),
    ('47','Zone industrielle Le Meux'),
    ('48','Réserve foncière'),
    ('49','ZAC du Camp de Royallieu'),
    ('50','Rocade Nord-Est'),
    ('51','Site des Haras'),
    ('52','ZAE ZI NORD - PONT DES RETS'),
    ('ZZ','Non concerné');
    
    
-- ################################################################# Domaine valeur - relation lot-cession  ###############################################


-- Table: m_foncier.lt_rel_lot

-- DROP TABLE m_foncier.lt_rel_lot;

CREATE TABLE m_foncier.lt_rel_lot
(
  l_rel character varying(2) NOT NULL, -- Code de la relation
  rel_lib character varying(25), -- Libellé de la relation
  CONSTRAINT lt_rel_lot_pkey PRIMARY KEY (l_rel) -- Clé primaire de la table lt_rel_lot
)
WITH (
  OIDS=FALSE
);
ALTER TABLE m_foncier.lt_rel_lot
  OWNER TO sig_create;

COMMENT ON TABLE m_foncier.lt_rel_lot
  IS 'Liste de valeurs du type de relation entre le dossier de cession et les lots';
COMMENT ON COLUMN m_foncier.lt_rel_lot.l_rel IS 'Code de la relation';
COMMENT ON COLUMN m_foncier.lt_rel_lot.rel_lib IS 'Libellé de la relation';

COMMENT ON CONSTRAINT lt_rel_lot_pkey ON m_foncier.lt_rel_lot IS 'Clé primaire de la table lt_rel_lot';

INSERT INTO m_foncier.lt_rel_lot(
            l_rel, rel_lib)
    VALUES
    ('10','1 dossier = 1 lot'),
    ('20','1 dossier = n lot');
    

-- ################################################# Du schéma m_economie ##################################

-- ################################################################# Domaine valeur - type d'aide  ###############################################

-- Table: m_economie.lt_sa_aidepb

-- DROP TABLE m_economie.lt_sa_aidepb;

CREATE TABLE m_economie.lt_sa_aidepb
(
  z_aide_pb character varying(2) NOT NULL, -- Code de la typologie d'aide publique mobilisable sur les sites
  aide_pb_lib character varying(20), -- Libellé de l'aide publique
  CONSTRAINT lt_sa_aidepb_pkkey PRIMARY KEY (z_aide_pb) -- Libellé de la typologie d'aide publique mobilisable sur les sites
)
WITH (
  OIDS=FALSE
);
ALTER TABLE m_economie.lt_sa_aidepb
  OWNER TO sig_create;

COMMENT ON TABLE m_economie.lt_sa_aidepb
  IS 'Liste de valeurs des aides publiques';
COMMENT ON COLUMN m_economie.lt_sa_aidepb.z_aide_pb IS 'Code de la typologie d''aide publique mobilisable sur les sites';
COMMENT ON COLUMN m_economie.lt_sa_aidepb.aide_pb_lib IS 'Libellé de l''aide publique';

COMMENT ON CONSTRAINT lt_sa_aidepb_pkkey ON m_economie.lt_sa_aidepb IS 'Libellé de la typologie d''aide publique mobilisable sur les sites';

INSERT INTO m_economie.lt_sa_aidepb(
            z_aide_pb, aide_pb_lib)
    VALUES
    ('00','Non renseigné'),
    ('10','AFR'),
    ('20','AFU'),
    ('30','Autre');

-- ################################################################# Domaine valeur - Décalage SIRENE - terrain  ###############################################


-- Table: m_economie.lt_sa_decalage

-- DROP TABLE m_economie.lt_sa_decalage;

CREATE TABLE m_economie.lt_sa_decalage
(
  decalage character varying(2) NOT NULL, -- Code du décalage GéoPic
  decalage_lib character varying(30), -- Libellé du décalage GéoPic
  CONSTRAINT lt_sa_decalage_pkkey PRIMARY KEY (decalage) -- Clé primaire de la table lt_sa_decalage
)
WITH (
  OIDS=FALSE
);
ALTER TABLE m_economie.lt_sa_decalage
  OWNER TO sig_create;

COMMENT ON TABLE m_economie.lt_sa_decalage
  IS 'Liste de valeurs du champ décalage (modèle GéoPic)';
COMMENT ON COLUMN m_economie.lt_sa_decalage.decalage IS 'Code du décalage GéoPic';
COMMENT ON COLUMN m_economie.lt_sa_decalage.decalage_lib IS 'Libellé du décalage GéoPic';

COMMENT ON CONSTRAINT lt_sa_decalage_pkkey ON m_economie.lt_sa_decalage IS 'Clé primaire de la table lt_sa_decalage';


INSERT INTO m_economie.lt_sa_decalage(
            decalage, decalage_lib)
    VALUES
    ('00','Non renseigné'),
    ('10','Disparu'),
    ('20','Inconnu');

-- ################################################################# Domaine valeur - Destination économique  ###############################################


-- Table: m_economie.lt_sa_dest

-- DROP TABLE m_economie.lt_sa_dest;

CREATE TABLE m_economie.lt_sa_dest
(
  dest character varying(2) NOT NULL, -- Code de la destination principale du site ou du Pôle
  dest_lib character varying(30), -- Libellé de la destination principale du site ou du Pôle
  CONSTRAINT lt_sa_dest_pkkey PRIMARY KEY (dest) -- Clé primaire de la table lt_sa_dest
)
WITH (
  OIDS=FALSE
);
ALTER TABLE m_economie.lt_sa_dest
  OWNER TO sig_create;

COMMENT ON TABLE m_economie.lt_sa_dest
  IS 'Liste de valeurs de destination (table pôle et site)';
COMMENT ON COLUMN m_economie.lt_sa_dest.dest IS 'Code de la destination principale du site ou du Pôle';
COMMENT ON COLUMN m_economie.lt_sa_dest.dest_lib IS 'Libellé de la destination principale du site ou du Pôle';

COMMENT ON CONSTRAINT lt_sa_dest_pkkey ON m_economie.lt_sa_dest IS 'Clé primaire de la table lt_sa_dest';

INSERT INTO m_economie.lt_sa_dest(
            dest, dest_lib)
    VALUES
    ('00','Non renseigné'),
    ('10','Artisanat'),
    ('20','Industrie ou R&D'),
    ('30','Tertiaire'),
    ('40','Transport et logistique'),
    ('50','Commerce'),
    ('60','Agriculture'),
    ('70','Service/Négoce');
    
-- ################################################################# Domaine valeur - Stade d'occupation  ###############################################


-- Table: m_economie.lt_sa_etatoccup

-- DROP TABLE m_economie.lt_sa_etatoccup;

CREATE TABLE m_economie.lt_sa_etatoccup
(
  etat_occup character varying(2) NOT NULL, -- Code du stade d'occupation (non renseigné pour l'ARC)
  occup_lib character varying(20), -- Libellé du stade d'occupation (non renseigné pour l'ARC)
  CONSTRAINT lt_sa_etatoccup_pkkey PRIMARY KEY (etat_occup) -- Clé primaire de la table lt_sa_stadecomm2 spécifique à l'ARC
)
WITH (
  OIDS=FALSE
);
ALTER TABLE m_economie.lt_sa_etatoccup
  OWNER TO sig_create;

COMMENT ON TABLE m_economie.lt_sa_etatoccup
  IS 'Liste de valeurs du stade d''occupation (non renseigné pour l''ARC)';
COMMENT ON COLUMN m_economie.lt_sa_etatoccup.etat_occup IS 'Code du stade d''occupation (non renseigné pour l''ARC)';
COMMENT ON COLUMN m_economie.lt_sa_etatoccup.occup_lib IS 'Libellé du stade d''occupation (non renseigné pour l''ARC)';

COMMENT ON CONSTRAINT lt_sa_etatoccup_pkkey ON m_economie.lt_sa_etatoccup IS 'Clé primaire de la table lt_sa_stadecomm2 spécifique à l''ARC';

INSERT INTO m_economie.lt_sa_etatoccup(
            etat_occup, occup_lib)
    VALUES
    ('00','Non renseigné'),
    ('10','Aucun'),
    ('20','Potentiel'),
    ('30','Réservé'),
    ('40','Occupé'),
    ('50','Vacant');

-- ################################################################# Domaine valeur - Type de filiale  ###############################################


-- Table: m_economie.lt_sa_filiale

-- DROP TABLE m_economie.lt_sa_filiale;

CREATE TABLE m_economie.lt_sa_filiale
(
  filiale integer NOT NULL, -- Code de filiale GéoPic
  filiale_lib character varying(30), -- Libellé de filiale GéoPic
  CONSTRAINT lt_sa_filiale_pkkey PRIMARY KEY (filiale) -- Clé primaire de la table lt_sa_filiale
)
WITH (
  OIDS=FALSE
);
ALTER TABLE m_economie.lt_sa_filiale
  OWNER TO sig_create;

COMMENT ON TABLE m_economie.lt_sa_filiale
  IS 'Liste de valeurs du champ filiale (modèle GéoPic)';
COMMENT ON COLUMN m_economie.lt_sa_filiale.filiale IS 'Code de filiale GéoPic';
COMMENT ON COLUMN m_economie.lt_sa_filiale.filiale_lib IS 'Libellé de filiale GéoPic';

COMMENT ON CONSTRAINT lt_sa_filiale_pkkey ON m_economie.lt_sa_filiale IS 'Clé primaire de la table lt_sa_filiale';

INSERT INTO m_economie.lt_sa_filiale(
            filiale, filiale_lib)
    VALUES
    ('0','Filiale'),
    ('1','Entreprise indépendante'),
    ('2','Sans objet');


-- ################################################################# Domaine valeur - Type d'activité  ###############################################

-- Table: m_economie.lt_sa_tact

-- DROP TABLE m_economie.lt_sa_tact;

CREATE TABLE m_economie.lt_sa_tact
(
  l_tact character varying(2) NOT NULL, -- Code de l'activité du projet d'implantation sur les lots (spécifique à l'ARC)
  l_tact_lib character varying(30), -- Libellé de l'activité du projet d'implantation sur les lots (spécifique à l'ARC)
  CONSTRAINT lt_sa_tact_pkkey PRIMARY KEY (l_tact) -- Clé primaire de la table lt_sa_tact
)
WITH (
  OIDS=FALSE
);
ALTER TABLE m_economie.lt_sa_tact
  OWNER TO sig_create;

COMMENT ON TABLE m_economie.lt_sa_tact
  IS 'Liste de valeurs de l''activité du projet d''implantation sur les lots (spécifique à l''ARC)';
COMMENT ON COLUMN m_economie.lt_sa_tact.l_tact IS 'Code de l''activité du projet d''implantation sur les lots (spécifique à l''ARC)';
COMMENT ON COLUMN m_economie.lt_sa_tact.l_tact_lib IS 'Libellé de l''activité du projet d''implantation sur les lots (spécifique à l''ARC)';

COMMENT ON CONSTRAINT lt_sa_tact_pkkey ON m_economie.lt_sa_tact IS 'Clé primaire de la table lt_sa_tact';

INSERT INTO m_economie.lt_sa_tact(
            l_tact, l_tact_lib)
    VALUES
    ('00','Non renseigné'),
    ('10','Artisanat'),
    ('20','Commerce'),
    ('30','Industrie'),
    ('40','R & D'),
    ('50','Service/Négoce'),
    ('60','Tertiaire'),
    ('99','Autre');

-- ################################################################# Domaine valeur - Typologie des sites  ###############################################


-- Table: m_economie.lt_sa_typo

-- DROP TABLE m_economie.lt_sa_typo;

CREATE TABLE m_economie.lt_sa_typo
(
  typo character varying(2) NOT NULL, -- Code de la typologie GéoPicardie du site
  typo_lib character varying(40), -- Libellé de la typologie GéoPicardie du site
  CONSTRAINT lt_sa_typo_pkkey PRIMARY KEY (typo) -- Clé primaire de la table lt_sa_typo
)
WITH (
  OIDS=FALSE
);
ALTER TABLE m_economie.lt_sa_typo
  OWNER TO sig_create;
GRANT ALL ON TABLE m_economie.lt_sa_typo TO sig_create;
GRANT ALL ON TABLE m_economie.lt_sa_typo TO create_sig;
GRANT SELECT ON TABLE m_economie.lt_sa_typo TO read_sig;
GRANT SELECT, UPDATE, INSERT, DELETE ON TABLE m_economie.lt_sa_typo TO edit_sig;
COMMENT ON TABLE m_economie.lt_sa_typo
  IS 'Liste de valeurs de la typologie de la zone (table site)';
COMMENT ON COLUMN m_economie.lt_sa_typo.typo IS 'Code de la typologie GéoPicardie du site';
COMMENT ON COLUMN m_economie.lt_sa_typo.typo_lib IS 'Libellé de la typologie GéoPicardie du site';

COMMENT ON CONSTRAINT lt_sa_typo_pkkey ON m_economie.lt_sa_typo IS 'Clé primaire de la table lt_sa_typo';

INSERT INTO m_economie.lt_sa_typo(
            typo, typo_lib)
    VALUES
    ('00','Non renseigné'),
    ('10','Site monofonctionnel'),
    ('20','Site plurifonctionnel en périphérie'),
    ('30','Site plurifonctionnel en centre-ville'),
    ('40','Etablissement isolé');

-- ################################################################# Domaine valeur - Vocation des sites  ###############################################


-- Table: m_economie.lt_sa_voca

-- DROP TABLE m_economie.lt_sa_voca;

CREATE TABLE m_economie.lt_sa_voca
(
  site_voca character varying(2) NOT NULL, -- Code de la vocation du site
  voca_lib character varying(25), -- Libellé de la vocation du site
  CONSTRAINT lt_sa_voca_pkkey PRIMARY KEY (site_voca) -- Clé primaire de la table lt_sa_voca
)
WITH (
  OIDS=FALSE
);
ALTER TABLE m_economie.lt_sa_voca
  OWNER TO sig_create;

COMMENT ON TABLE m_economie.lt_sa_voca
  IS 'Liste de valeurs de vocation simplifiée de la zone (table site)';
COMMENT ON COLUMN m_economie.lt_sa_voca.site_voca IS 'Code de la vocation du site';
COMMENT ON COLUMN m_economie.lt_sa_voca.voca_lib IS 'Libellé de la vocation du site';

COMMENT ON CONSTRAINT lt_sa_voca_pkkey ON m_economie.lt_sa_voca IS 'Clé primaire de la table lt_sa_voca';

INSERT INTO m_economie.lt_sa_voca(
            site_voca, voca_lib)
    VALUES
    ('00','Non renseigné'),
    ('10','ZI - zone industrielle'),
    ('20','ZA - zone artisanale'),
    ('30','ZC - zone commerciale'),
    ('40','ZM - zone mixte');

-- ################################################################# Domaine valeur - Etat de commercialisation du local  ###############################################

-- Table: m_economie.lt_bal_ecomm

-- DROP TABLE m_economie.lt_bal_ecomm;

CREATE TABLE m_economie.lt_bal_ecomm
(
  etat_comm character varying(2) NOT NULL, -- Code de l'état de commercialisation du local
  lib_etat_comm character varying(50), -- Libellé de l'état de commercialisation du local
  CONSTRAINT lt_bal_ecomm_pkey PRIMARY KEY (etat_comm) -- Clé primaire de la table lt_bal_ecomm
)
WITH (
  OIDS=FALSE
);
ALTER TABLE m_economie.lt_bal_ecomm
  OWNER TO sig_create;

COMMENT ON TABLE m_economie.lt_bal_ecomm
  IS 'Liste de valeurs de l''état de commercialisation du local';
COMMENT ON COLUMN m_economie.lt_bal_ecomm.etat_comm IS 'Code de l''état de commercialisation du local';
COMMENT ON COLUMN m_economie.lt_bal_ecomm.lib_etat_comm IS 'Libellé de l''état de commercialisation du local';

COMMENT ON CONSTRAINT lt_bal_ecomm_pkey ON m_economie.lt_bal_ecomm IS 'Clé primaire de la table lt_bal_ecomm';

INSERT INTO m_amenagement.lt_bal_ecomm(
            etat_comm, lib_etat_comm)
    VALUES
    ('00','Non renseigné'),
    ('10','Disponible immédiatement'),
    ('20','Disponibilité à venir (ajouter une périodicité)'),
    ('30','En négociations avancées'),
    ('40','Négociations abouties (succès BAL)'),
    ('50','Négociations abouties (sans intervention BAL)'),
    ('99','Autre');
    
 -- ################################################################# Domaine valeur - Commercialisateur du local  ###############################################

-- Table: m_economie.lt_bal_ncomm

-- DROP TABLE m_economie.lt_bal_ncomm;

CREATE TABLE m_economie.lt_bal_ncomm
(
  code_comm character varying(2) NOT NULL, -- Code du commercialisateur des locaux
  lib_comm character varying(20), -- Libellé du commercialisateur des locaux
  CONSTRAINT lt_bal_ncomm_pkey PRIMARY KEY (code_comm) -- Clé primaire de la table lt_bal_ncomm
)
WITH (
  OIDS=FALSE
);
ALTER TABLE m_economie.lt_bal_ncomm
  OWNER TO sig_create;
GRANT ALL ON TABLE m_economie.lt_bal_ncomm TO sig_create;
GRANT ALL ON TABLE m_economie.lt_bal_ncomm TO create_sig;
GRANT SELECT ON TABLE m_economie.lt_bal_ncomm TO read_sig;
GRANT SELECT, UPDATE, INSERT, DELETE ON TABLE m_economie.lt_bal_ncomm TO edit_sig;
COMMENT ON TABLE m_economie.lt_bal_ncomm
  IS 'Liste de valeurs du commercialisateur des locaux';
COMMENT ON COLUMN m_economie.lt_bal_ncomm.code_comm IS 'Code du commercialisateur des locaux';
COMMENT ON COLUMN m_economie.lt_bal_ncomm.lib_comm IS 'Libellé du commercialisateur des locaux';

COMMENT ON CONSTRAINT lt_bal_ncomm_pkey ON m_economie.lt_bal_ncomm IS 'Clé primaire de la table lt_bal_ncomm';

-- pas de liste de valeur ici. Table nominative

 -- ################################################################# Domaine valeur - Source de la mise à jour du local  ###############################################

-- Table: m_economie.lt_bal_source

-- DROP TABLE m_economie.lt_bal_source;

CREATE TABLE m_economie.lt_bal_source
(
  source_maj character varying(2) NOT NULL, -- Code du moyen de mise à jour
  lib_source_maj character varying(30), -- Libellé du moyen de mise à jour
  CONSTRAINT lt_bal_source_pkey PRIMARY KEY (source_maj) -- Clé primaire de la table lt_bal_source
)
WITH (
  OIDS=FALSE
);
ALTER TABLE m_economie.lt_bal_source
  OWNER TO sig_create;
GRANT ALL ON TABLE m_economie.lt_bal_source TO sig_create;
GRANT ALL ON TABLE m_economie.lt_bal_source TO create_sig;
GRANT SELECT ON TABLE m_economie.lt_bal_source TO read_sig;
GRANT SELECT, UPDATE, INSERT, DELETE ON TABLE m_economie.lt_bal_source TO edit_sig;
COMMENT ON TABLE m_economie.lt_bal_source
  IS 'Liste de valeurs du moyen de mise à jour';
COMMENT ON COLUMN m_economie.lt_bal_source.source_maj IS 'Code du moyen de mise à jour';
COMMENT ON COLUMN m_economie.lt_bal_source.lib_source_maj IS 'Libellé du moyen de mise à jour';

COMMENT ON CONSTRAINT lt_bal_source_pkey ON m_economie.lt_bal_source IS 'Clé primaire de la table lt_bal_source';

INSERT INTO m_amenagement.lt_bal_source(
            source_maj, lib_source_maj)
    VALUES
    ('00','Non renseigné'),
    ('10','Propriétaire'),
    ('20','Commercialisateur'),
    ('30','Visite de terrain'),
    ('99','Autre');
    
-- ################################################################# Domaine valeur - Type de local  ###############################################


-- Table: m_economie.lt_bal_tlocal

-- DROP TABLE m_economie.lt_bal_tlocal;

CREATE TABLE m_economie.lt_bal_tlocal
(
  type_loc character varying(2) NOT NULL, -- Code du type de local
  lib_type_loc character varying(30), -- Libellé du type de local
  CONSTRAINT lt_bal_tlocal_pkey PRIMARY KEY (type_loc) -- Clé primaire de la table lt_bal_tlocal
)
WITH (
  OIDS=FALSE
);
ALTER TABLE m_economie.lt_bal_tlocal
  OWNER TO sig_create;

COMMENT ON TABLE m_economie.lt_bal_tlocal
  IS 'Liste de valeurs du type de local';
COMMENT ON COLUMN m_economie.lt_bal_tlocal.type_loc IS 'Code du type de local';
COMMENT ON COLUMN m_economie.lt_bal_tlocal.lib_type_loc IS 'Libellé du type de local';

COMMENT ON CONSTRAINT lt_bal_tlocal_pkey ON m_economie.lt_bal_tlocal IS 'Clé primaire de la table lt_bal_tlocal';

INSERT INTO m_amenagement.lt_bal_tlocal(
            type_loc, lib_type_loc)
    VALUES
    ('00','Non renseigné'),
    ('10','Industrie/Petite industrie'),
    ('20','"Atelier uniquement"'),
    ('30','Bureau'),
    ('40','Commerce'),
    ('41','Commerce de périphérie'),
    ('42','Commerce de centre-ville'),
    ('50','Atelier avec bureaux'),
    ('60','Profession libérale'),
    ('70','Bureau de RDC/Commerce'),
    ('80','Logistique entrepôt'),
    ('99','Terrain nu');
    


-- ################################################# Du schéma m_amenagement ##################################

-- ################################################################# Domaine valeur - Type d'espace public  ###############################################


-- Table: m_amenagement.lt_amt_empesp_pu

-- DROP TABLE m_amenagement.lt_amt_empesp_pu;

CREATE TABLE m_amenagement.lt_amt_empesp_pu
(
  vocaep character varying(2) NOT NULL, -- Code de la vocation de l'espace public
  vocaep_lib character varying(35), -- Libellé de la vocation de l'espace public
  CONSTRAINT lt_amt_empesp_pu_pkkey PRIMARY KEY (vocaep) -- Clé primaire de la table lt_amt_empesp_pu
)
WITH (
  OIDS=FALSE
);
ALTER TABLE m_amenagement.lt_amt_empesp_pu
  OWNER TO sig_create;

COMMENT ON TABLE m_amenagement.lt_amt_empesp_pu
  IS 'Vocation des espaces publics';
COMMENT ON COLUMN m_amenagement.lt_amt_empesp_pu.vocaep IS 'Code de la vocation de l''espace public';
COMMENT ON COLUMN m_amenagement.lt_amt_empesp_pu.vocaep_lib IS 'Libellé de la vocation de l''espace public';

COMMENT ON CONSTRAINT lt_amt_empesp_pu_pkkey ON m_amenagement.lt_amt_empesp_pu IS 'Clé primaire de la table lt_amt_empesp_pu';

INSERT INTO m_amenagement.lt_amt_empesp_pu(
            vocaep, vocaep_lib)
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

-- ################################################################# Domaine valeur - Etat d'aménagement  ###############################################


-- Table: m_amenagement.lt_sa_etat

-- DROP TABLE m_amenagement.lt_sa_etat;

CREATE TABLE m_amenagement.lt_sa_etat
(
  code character varying(2) NOT NULL, -- Code de la typologie de la situation du site au regard de l'aménagement
  valeur character varying(25), -- Code de la typologie de la situation du site au regard de l'aménagement
  CONSTRAINT lt_sa_etat_pkkey PRIMARY KEY (code) -- Clé primaire de la table lt_sa_etat
)
WITH (
  OIDS=FALSE
);
ALTER TABLE m_amenagement.lt_sa_etat
  OWNER TO sig_create;

COMMENT ON TABLE m_amenagement.lt_sa_etat
  IS 'Liste des valeurs de l''état du site';
COMMENT ON COLUMN m_amenagement.lt_sa_etat.code IS 'Code de la typologie de la situation du site au regard de l''aménagement';
COMMENT ON COLUMN m_amenagement.lt_sa_etat.valeur IS 'Code de la typologie de la situation du site au regard de l''aménagement';

COMMENT ON CONSTRAINT lt_sa_etat_pkkey ON m_amenagement.lt_sa_etat IS 'Clé primaire de la table lt_sa_etat';

INSERT INTO m_amenagement.lt_sa_etat(
            code, valeur)
    VALUES
    ('00','Non renseigné'),
    ('10','Existant'),
    ('20','Extension'),
    ('30','Création'),
    ('40','Déclassé'),
    ('50','Projet de déclassement');

-- ################################################################# Domaine valeur - Stade d'aménagement  ###############################################


-- Table: m_amenagement.lt_sa_stadeamng

-- DROP TABLE m_amenagement.lt_sa_stadeamng;

CREATE TABLE m_amenagement.lt_sa_stadeamng
(
  code character varying(2) NOT NULL, -- Code du stade d'aménagement du lot
  valeur character varying(15), -- Libellé du stade d'aménagement du lot
  CONSTRAINT lt_sa_stadeamng_pkkey PRIMARY KEY (code) -- Clé primaire de la table lt_sa_stadeamng
)
WITH (
  OIDS=FALSE
);
ALTER TABLE m_amenagement.lt_sa_stadeamng
  OWNER TO sig_create;

COMMENT ON TABLE m_amenagement.lt_sa_stadeamng
  IS 'Liste de valeurs du stade d''aménagement du lot';
COMMENT ON COLUMN m_amenagement.lt_sa_stadeamng.code IS 'Code du stade d''aménagement du lot';
COMMENT ON COLUMN m_amenagement.lt_sa_stadeamng.valeur IS 'Libellé du stade d''aménagement du lot';

COMMENT ON CONSTRAINT lt_sa_stadeamng_pkkey ON m_amenagement.lt_sa_stadeamng IS 'Clé primaire de la table lt_sa_stadeamng';

INSERT INTO m_amenagement.lt_sa_stadeamng(
            code, valeur)
    VALUES
    ('00','Non renseigné'),
    ('10','Aucun'),
    ('20','Non acquis'),
    ('30','Acquis'),
    ('40','Viabilisé');


-- ################################################################# Domaine valeur - Stade d'aménagement (ARC)  ###############################################

-- Table: m_amenagement.lt_sa_stadeamng2

-- DROP TABLE m_amenagement.lt_sa_stadeamng2;

CREATE TABLE m_amenagement.lt_sa_stadeamng2
(
  code character varying(2) NOT NULL, -- Code de l'état de disponibilité des lots selon le stade d'aménagement (spécifique à l'ARC)
  valeur character varying(50), -- Libellé de l'état de disponibilité des lots selon le stade d'aménagement (spécifique à l'ARC)
  CONSTRAINT lt_sa_stadeamng2_pkkey PRIMARY KEY (code) -- Clé primaire de la table lt_sa_stadeamng2
)
WITH (
  OIDS=FALSE
);
ALTER TABLE m_amenagement.lt_sa_stadeamng2
  OWNER TO sig_create;

COMMENT ON TABLE m_amenagement.lt_sa_stadeamng2
  IS 'Liste de valeurs du stade d''aménagement du lot spécifique à l''ARC';
COMMENT ON COLUMN m_amenagement.lt_sa_stadeamng2.code IS 'Code de l''état de disponibilité des lots selon le stade d''aménagement (spécifique à l''ARC)';
COMMENT ON COLUMN m_amenagement.lt_sa_stadeamng2.valeur IS 'Libellé de l''état de disponibilité des lots selon le stade d''aménagement (spécifique à l''ARC)';

COMMENT ON CONSTRAINT lt_sa_stadeamng2_pkkey ON m_amenagement.lt_sa_stadeamng2 IS 'Clé primaire de la table lt_sa_stadeamng2';

INSERT INTO m_amenagement.lt_sa_stadeamng2(
            code, valeur)
    VALUES
    ('00','Non renseigné'),
    ('10','Disponible (aménagé ou aménageable rapidement)'),
    ('20','Indisponible (terrain non acheté)'),
    ('30','Indisponible (terrain non aménagé)');

-- ################################################################# Domaine valeur - Stade de commercialisation  ###############################################

-- Table: m_amenagement.lt_sa_stadecomm

-- DROP TABLE m_amenagement.lt_sa_stadecomm;

CREATE TABLE m_amenagement.lt_sa_stadecomm
(
  code character varying(2) NOT NULL, -- Code de le typologie d'aménageur
  valeur character varying(20), -- Libellé de le typologie d'aménageur
  CONSTRAINT lt_sa_stadecomm_pkkey PRIMARY KEY (code) -- Clé primaire de la table lt_sa_stadecomm
)
WITH (
  OIDS=FALSE
);
ALTER TABLE m_amenagement.lt_sa_stadecomm
  OWNER TO sig_create;

COMMENT ON TABLE m_amenagement.lt_sa_stadecomm
  IS 'Liste de valeurs du stade de commercialisation';
COMMENT ON COLUMN m_amenagement.lt_sa_stadecomm.code IS 'Code de le typologie d''aménageur';
COMMENT ON COLUMN m_amenagement.lt_sa_stadecomm.valeur IS 'Libellé de le typologie d''aménageur';

COMMENT ON CONSTRAINT lt_sa_stadecomm_pkkey ON m_amenagement.lt_sa_stadecomm IS 'Clé primaire de la table lt_sa_stadecomm';

INSERT INTO m_amenagement.lt_sa_stadecomm(
            code, valeur)
    VALUES
    ('00','Non renseigné'),
    ('10','Aucun'),
    ('20','Commercialisable');

-- ################################################################# Domaine valeur - Stade de commercialisation (ARC)  ###############################################


-- Table: m_amenagement.lt_sa_stadecomm2

-- DROP TABLE m_amenagement.lt_sa_stadecomm2;

CREATE TABLE m_amenagement.lt_sa_stadecomm2
(
  code character varying(2) NOT NULL, -- Code du stade de commercialisation spécifique à l'ARC
  valeur character varying(80), -- Libellé du stade de commercialisation spécifique à l'ARC
  CONSTRAINT lt_sa_stadecomm2_pkkey PRIMARY KEY (code) -- Clé primaire de la table lt_sa_stadecomm2 spécifique à l'ARC
)
WITH (
  OIDS=FALSE
);
ALTER TABLE m_amenagement.lt_sa_stadecomm2
  OWNER TO sig_create;

COMMENT ON TABLE m_amenagement.lt_sa_stadecomm2
  IS 'Liste de valeurs du stade de commercialisation spécifique à l''ARC';
COMMENT ON COLUMN m_amenagement.lt_sa_stadecomm2.code IS 'Code du stade de commercialisation spécifique à l''ARC';
COMMENT ON COLUMN m_amenagement.lt_sa_stadecomm2.valeur IS 'Libellé du stade de commercialisation spécifique à l''ARC';

COMMENT ON CONSTRAINT lt_sa_stadecomm2_pkkey ON m_amenagement.lt_sa_stadecomm2 IS 'Clé primaire de la table lt_sa_stadecomm2 spécifique à l''ARC';

INSERT INTO m_amenagement.lt_sa_stadecomm2(
            code, valeur)
    VALUES
    ('00','Non renseigné'),
    ('11','En vente'),
    ('12','En vente (avec contrainte)'),
    ('20','Vendu'),
    ('31','Réservé (par une délibération du Conseil d''Agglomération)'),
    ('32','Réservé (option)'),
    ('99','Non commercialisé par un acteur public');


-- ################################################# Du schéma s_sirene ##################################

-- ################################################################# Domaine valeur - Vie des établissements  ###############################################

-- Table: s_sirene.lt_vetab

-- DROP TABLE s_sirene.lt_vetab;

CREATE TABLE s_sirene.lt_vetab
(
  l_vetab character varying(2) NOT NULL,
  vetab_lib character varying(15),
  CONSTRAINT lt_vetab_pkey PRIMARY KEY (l_vetab)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE s_sirene.lt_vetab
  OWNER TO sig_create;

COMMENT ON TABLE s_sirene.lt_vetab
  IS 'Liste de valeurs du champ filiale (modèle GéoPic)';

INSERT INTO s_sirene.lt_vetab(
            l_vetab, vetab_lib)
    VALUES
    ('00','Non renseigné'),
    ('10','Actif'),
    ('20','Inactif');

-- ################################################################# Domaine valeur - Naf niveau 1  ###############################################

-- Table: s_sirene.naf_n1

-- DROP TABLE s_sirene.naf_n1;

CREATE TABLE s_sirene.naf_n1
(
  code character varying(2),
  "libellé" character varying(147)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE s_sirene.naf_n1
  OWNER TO sig_create;

COMMENT ON TABLE s_sirene.naf_n1
  IS 'Libellé des codes NAF niveau 1 (dernière nomanclature)';

-- la liste des valeurs correspondant à la liste officielle de l'Insee (se reporter à cette liste pour visualiser toutes les valeurs

-- ################################################################# Domaine valeur - Naf niveau 2  ###############################################

-- Table: s_sirene.naf_n2

-- DROP TABLE s_sirene.naf_n2;

CREATE TABLE s_sirene.naf_n2
(
  code character varying(2),
  "libellé" character varying(139)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE s_sirene.naf_n2
  OWNER TO sig_create;

COMMENT ON TABLE s_sirene.naf_n2
  IS 'Libellé des codes NAF niveau 2 (dernière nomanclature)';

-- la liste des valeurs correspondant à la liste officielle de l'Insee (se reporter à cette liste pour visualiser toutes les valeurs

-- ################################################################# Domaine valeur - Naf niveau 3  ###############################################

-- Table: s_sirene.naf_n3

-- DROP TABLE s_sirene.naf_n3;

CREATE TABLE s_sirene.naf_n3
(
  code character varying(4),
  "libellé" character varying(147)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE s_sirene.naf_n3
  OWNER TO sig_create;

COMMENT ON TABLE s_sirene.naf_n3
  IS 'Libellé des codes NAF niveau 3 (dernière nomanclature)';

-- la liste des valeurs correspondant à la liste officielle de l'Insee (se reporter à cette liste pour visualiser toutes les valeurs

-- ################################################################# Domaine valeur - Naf niveau 4  ###############################################

-- Table: s_sirene.naf_n4

-- DROP TABLE s_sirene.naf_n4;

CREATE TABLE s_sirene.naf_n4
(
  code character varying(5),
  "libellé" character varying(147)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE s_sirene.naf_n4
  OWNER TO sig_create;

COMMENT ON TABLE s_sirene.naf_n4
  IS 'Libellé des codes NAF niveau 4 (dernière nomanclature)';


-- la liste des valeurs correspondant à la liste officielle de l'Insee (se reporter à cette liste pour visualiser toutes les valeurs

-- ################################################################# Domaine valeur - Naf niveau 5  ###############################################

-- Table: s_sirene.naf_n5

-- DROP TABLE s_sirene.naf_n5;

CREATE TABLE s_sirene.naf_n5
(
  code character varying(6),
  libelle character varying(147),
  code_apet700 character varying(6) -- Code des APET700 simplifié sans le . (comme dans SIRENE)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE s_sirene.naf_n5
  OWNER TO sig_create;

COMMENT ON TABLE s_sirene.naf_n5
  IS 'Libellé des codes NAF niveau 5 (dernière nomanclature)';
COMMENT ON COLUMN s_sirene.naf_n5.code_apet700 IS 'Code des APET700 simplifié sans le . (comme dans SIRENE)';

-- la liste des valeurs correspondant à la liste officielle de l'Insee (se reporter à cette liste pour visualiser toutes les valeurs


-- ####################################################################################################################################################
-- ###                                                                                                                                              ###
-- ###                                                                TABLE                                                           ###
-- ###                                                                                                                                              ###
-- ####################################################################################################################################################

-- ################################################# Du schéma r_objet ##################################

-- ################################################# Classe des objets établissements ##################################

-- Table: r_objet.geo_objet_etab

-- DROP TABLE r_objet.geo_objet_etab;

CREATE TABLE r_objet.geo_objet_etab
(
  idgeoet integer NOT NULL DEFAULT nextval('idgeo_seq'::regclass), -- Identifiant unique de l'objet
  op_sai character varying(80), -- Opérateur de saisir d'objet à l'ARC
  code_geo character varying(1), -- Code de précision du géocodage
  idban character varying(25), -- Identifant de la BAN (à rechercher)
  idsiret character varying(14), -- Identifiant SIRET de l'établissement
  info_int character varying(255), -- Information sur la période d'intégration de la géolocalisation
  info_prec character varying(50), -- Information sur l'affinage manuelle de la Géolocalisation réalisée ou non sur les nouveaux établissements intégrés
  geom geometry(Point,2154) NOT NULL, -- Champ contenant la géométrie
  l_nom_eco character varying(255), -- Nom de l'établissement issu du service du développement économique
  l_nom_sirene character varying(255), -- Libellé de l'établissement issu du fichier SIRENE
  date_sai timestamp without time zone, -- Date de saisie de l'objet
  date_maj timestamp without time zone, -- Date de mise à jour de l'objet
  l_vetab character varying(2), -- Vie de l'établissement issue de SIRENE
  l4_voie character varying(254), -- Adresse de l'établissement issue de SIRENE
  enseigne character varying(254), -- Enseigne de l'établissement issue de SIRENE
  src_geom character varying(2) DEFAULT '60'::character varying,
  insee character varying(5), -- Code Insee de la commune
  commune character varying(100), -- Libellé de la commune
  l_nom character varying(150), -- Libellé du nom de l'établissement spécifique si différent du nom SIRENE (nom usuel du service économie)
  CONSTRAINT geo_objet_etab_pkey PRIMARY KEY (idgeoet)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE r_objet.geo_objet_etab
  OWNER TO sig_create;

COMMENT ON TABLE r_objet.geo_objet_etab
  IS 'Données géographiques contenant la localisation des établissements';
COMMENT ON COLUMN r_objet.geo_objet_etab.idgeoet IS 'Identifiant unique de l''objet';
COMMENT ON COLUMN r_objet.geo_objet_etab.op_sai IS 'Opérateur de saisir d''objet à l''ARC';
COMMENT ON COLUMN r_objet.geo_objet_etab.code_geo IS 'Code de précision du géocodage';
COMMENT ON COLUMN r_objet.geo_objet_etab.idban IS 'Identifant de la BAN (à rechercher)';
COMMENT ON COLUMN r_objet.geo_objet_etab.idsiret IS 'Identifiant SIRET de l''établissement';
COMMENT ON COLUMN r_objet.geo_objet_etab.info_int IS 'Information sur la période d''intégration de la géolocalisation';
COMMENT ON COLUMN r_objet.geo_objet_etab.info_prec IS 'Information sur l''affinage manuelle de la Géolocalisation réalisée ou non sur les nouveaux établissements intégrés';
COMMENT ON COLUMN r_objet.geo_objet_etab.geom IS 'Champ contenant la géométrie';
COMMENT ON COLUMN r_objet.geo_objet_etab.l_nom_eco IS 'Nom de l''établissement issu du service du développement économique';
COMMENT ON COLUMN r_objet.geo_objet_etab.l_nom_sirene IS 'Libellé de l''établissement issu du fichier SIRENE';
COMMENT ON COLUMN r_objet.geo_objet_etab.date_sai IS 'Date de saisie de l''objet';
COMMENT ON COLUMN r_objet.geo_objet_etab.date_maj IS 'Date de mise à jour de l''objet';
COMMENT ON COLUMN r_objet.geo_objet_etab.l_vetab IS 'Vie de l''établissement issue de SIRENE';
COMMENT ON COLUMN r_objet.geo_objet_etab.l4_voie IS 'Adresse de l''établissement issue de SIRENE';
COMMENT ON COLUMN r_objet.geo_objet_etab.enseigne IS 'Enseigne de l''établissement issue de SIRENE';
COMMENT ON COLUMN r_objet.geo_objet_etab.insee IS 'Code Insee de la commune';
COMMENT ON COLUMN r_objet.geo_objet_etab.commune IS 'Libellé de la commune';
COMMENT ON COLUMN r_objet.geo_objet_etab.l_nom IS 'Libellé du nom de l''établissement spécifique si différent du nom SIRENE (nom usuel du service économie)';


-- Trigger: t_t1_etab_insert on r_objet.geo_objet_etab

-- DROP TRIGGER t_t1_etab_insert ON r_objet.geo_objet_etab;

CREATE TRIGGER t_t1_etab_insert
  BEFORE INSERT
  ON r_objet.geo_objet_etab
  FOR EACH ROW
  EXECUTE PROCEDURE r_objet.m_etab_insert();
ALTER TABLE r_objet.geo_objet_etab DISABLE TRIGGER t_t1_etab_insert;
COMMENT ON TRIGGER t_t1_etab_insert ON r_objet.geo_objet_etab IS 'Trigger plus utilisé pour l''insertion des établissements. Remplacé par un worflow FME d''intégration';

-- Trigger: t_t2_etab_insert_date_maj on r_objet.geo_objet_etab

-- DROP TRIGGER t_t2_etab_insert_date_maj ON r_objet.geo_objet_etab;

CREATE TRIGGER t_t2_etab_insert_date_maj
  BEFORE INSERT OR UPDATE
  ON r_objet.geo_objet_etab
  FOR EACH ROW
  EXECUTE PROCEDURE public.r_timestamp_maj();

-- Trigger: t_t4_etab_insert_date_sai on r_objet.geo_objet_etab

-- DROP TRIGGER t_t4_etab_insert_date_sai ON r_objet.geo_objet_etab;

CREATE TRIGGER t_t4_etab_insert_date_sai
  BEFORE INSERT
  ON r_objet.geo_objet_etab
  FOR EACH ROW
  EXECUTE PROCEDURE public.r_timestamp_sai();

-- Trigger: t_t5_geo_objet_etab_insee on r_objet.geo_objet_etab

-- DROP TRIGGER t_t5_geo_objet_etab_insee ON r_objet.geo_objet_etab;

CREATE TRIGGER t_t5_geo_objet_etab_insee
  BEFORE INSERT OR UPDATE OF geom
  ON r_objet.geo_objet_etab
  FOR EACH ROW
  EXECUTE PROCEDURE public.r_commune_pl();

-- Function: r_objet.ft_geo_etab_objet_idsite()

-- DROP FUNCTION r_objet.ft_geo_etab_objet_idsite();

CREATE OR REPLACE FUNCTION r_objet.ft_geo_etab_objet_idsite()
  RETURNS trigger AS
$BODY$

BEGIN

	UPDATE m_economie.an_sa_etab SET
							idsite= (
									SELECT DISTINCT
										idsite 
									FROM 
										r_objet.geo_objet_ope
									WHERE
										st_intersects(geo_objet_ope.geom,new.geom) = true and idsite <> '60382zz' and idsite <> '60665hb'
								
									)

	WHERE an_sa_etab.idgeoet=new.idgeoet;

	
	return new;
END
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
ALTER FUNCTION r_objet.ft_geo_etab_objet_idsite()
  OWNER TO sig_create;


-- Trigger: t_t6_geo_objet_etab_idsite on r_objet.geo_objet_etab

-- DROP TRIGGER t_t6_geo_objet_etab_idsite ON r_objet.geo_objet_etab;

CREATE TRIGGER t_t6_geo_objet_etab_idsite
  BEFORE UPDATE OF geom
  ON r_objet.geo_objet_etab
  FOR EACH ROW
  EXECUTE PROCEDURE r_objet.ft_geo_etab_objet_idsite();

-- Trigger: t_t8_suivi on r_objet.geo_objet_etab

-- DROP TRIGGER t_t8_suivi ON r_objet.geo_objet_etab;

CREATE TRIGGER t_t8_suivi
  AFTER INSERT OR UPDATE OR DELETE
  ON r_objet.geo_objet_etab
  FOR EACH ROW
  EXECUTE PROCEDURE m_economie.r_suivi_audit();

-- ################################################# Classe des objets espaces publics ##################################

-- Table: r_objet.geo_objet_empesp_pu

-- DROP TABLE r_objet.geo_objet_empesp_pu;

CREATE TABLE r_objet.geo_objet_empesp_pu
(
  idgeopu integer NOT NULL, -- Identifiant unique de l'objet
  op_sai character varying(80), -- Opérateur de saisir d'objet à l'ARC
  src_geom character varying(2) DEFAULT '00'::character varying, -- Référentiel spatial de saisie
  sup_m2 double precision, -- Surface totale de l'objet en m²
  geom geometry(MultiPolygon,2154) NOT NULL, -- Champ contenant la géométrie
  date_sai timestamp without time zone, -- Date de saisie de l'objet
  date_maj timestamp without time zone, -- Date de mise à jour de l'objet
  CONSTRAINT geo_objet_empesp_pu_pkey PRIMARY KEY (idgeopu)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE r_objet.geo_objet_empesp_pu
  OWNER TO sig_create;

COMMENT ON TABLE r_objet.geo_objet_empesp_pu
  IS 'Données géographiques contenant les espaces publics';
COMMENT ON COLUMN r_objet.geo_objet_empesp_pu.idgeopu IS 'Identifiant unique de l''objet';
COMMENT ON COLUMN r_objet.geo_objet_empesp_pu.op_sai IS 'Opérateur de saisir d''objet à l''ARC';
COMMENT ON COLUMN r_objet.geo_objet_empesp_pu.src_geom IS 'Référentiel spatial de saisie';
COMMENT ON COLUMN r_objet.geo_objet_empesp_pu.sup_m2 IS 'Surface totale de l''objet en m²';
COMMENT ON COLUMN r_objet.geo_objet_empesp_pu.geom IS 'Champ contenant la géométrie';
COMMENT ON COLUMN r_objet.geo_objet_empesp_pu.date_sai IS 'Date de saisie de l''objet';
COMMENT ON COLUMN r_objet.geo_objet_empesp_pu.date_maj IS 'Date de mise à jour de l''objet';

-- Trigger: t_t1_empesppu_insert_date_maj on r_objet.geo_objet_empesp_pu

-- DROP TRIGGER t_t1_empesppu_insert_date_maj ON r_objet.geo_objet_empesp_pu;

CREATE TRIGGER t_t1_empesppu_insert_date_maj
  BEFORE INSERT
  ON r_objet.geo_objet_empesp_pu
  FOR EACH ROW
  EXECUTE PROCEDURE public.r_timestamp_maj();

-- Trigger: t_t2_empesppu_insert_date_sai on r_objet.geo_objet_empesp_pu

-- DROP TRIGGER t_t2_empesppu_insert_date_sai ON r_objet.geo_objet_empesp_pu;

CREATE TRIGGER t_t2_empesppu_insert_date_sai
  BEFORE INSERT
  ON r_objet.geo_objet_empesp_pu
  FOR EACH ROW
  EXECUTE PROCEDURE public.r_timestamp_sai();

-- Trigger: t_t3_empesppu_insert_surf on r_objet.geo_objet_empesp_pu

-- DROP TRIGGER t_t3_empesppu_insert_surf ON r_objet.geo_objet_empesp_pu;

CREATE TRIGGER t_t3_empesppu_insert_surf
  BEFORE INSERT
  ON r_objet.geo_objet_empesp_pu
  FOR EACH ROW
  EXECUTE PROCEDURE public.r_sup_m2_maj();



-- ################################################# Classe des objets lots ##################################

-- Table: r_objet.geo_objet_fon_lot

-- DROP TABLE r_objet.geo_objet_fon_lot;

CREATE TABLE r_objet.geo_objet_fon_lot
(
  idgeolf integer NOT NULL, -- Identifiant unique de l'objet
  op_sai character varying(80), -- Opérateur de saisir d'objet à l'ARC
  src_geom character varying(2) DEFAULT '00'::character varying, -- Référentiel spatial de saisie
  sup_m2 double precision, -- Surface totale de l'objet en m²
  l_voca character varying(2) DEFAULT '00'::character varying, -- Vocation du foncier
  geom geometry(MultiPolygon,2154) NOT NULL, -- Champ contenant la géométrie
  date_sai timestamp without time zone, -- Date de saisie de l'objet
  date_maj timestamp without time zone, -- Date de mise à jour
  l_nom character varying(80), -- Nom de lot donné au moment du plan d'aménagement (ex : lot 1)
  CONSTRAINT geo_objet_fon_lot_pkey PRIMARY KEY (idgeolf)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE r_objet.geo_objet_fon_lot
  OWNER TO sig_create;

COMMENT ON TABLE r_objet.geo_objet_fon_lot
  IS 'Données géographiques contenant les lots fonciers des sites';
COMMENT ON COLUMN r_objet.geo_objet_fon_lot.idgeolf IS 'Identifiant unique de l''objet';
COMMENT ON COLUMN r_objet.geo_objet_fon_lot.op_sai IS 'Opérateur de saisir d''objet à l''ARC';
COMMENT ON COLUMN r_objet.geo_objet_fon_lot.src_geom IS 'Référentiel spatial de saisie';
COMMENT ON COLUMN r_objet.geo_objet_fon_lot.sup_m2 IS 'Surface totale de l''objet en m²';
COMMENT ON COLUMN r_objet.geo_objet_fon_lot.l_voca IS 'Vocation du foncier';
COMMENT ON COLUMN r_objet.geo_objet_fon_lot.geom IS 'Champ contenant la géométrie';
COMMENT ON COLUMN r_objet.geo_objet_fon_lot.date_sai IS 'Date de saisie de l''objet';
COMMENT ON COLUMN r_objet.geo_objet_fon_lot.date_maj IS 'Date de mise à jour';
COMMENT ON COLUMN r_objet.geo_objet_fon_lot.l_nom IS 'Nom de lot donné au moment du plan d''aménagement (ex : lot 1)';


-- Trigger: t_t1_foncier_insert_date_maj on r_objet.geo_objet_fon_lot

-- DROP TRIGGER t_t1_foncier_insert_date_maj ON r_objet.geo_objet_fon_lot;

CREATE TRIGGER t_t1_foncier_insert_date_maj
  BEFORE INSERT OR UPDATE
  ON r_objet.geo_objet_fon_lot
  FOR EACH ROW
  EXECUTE PROCEDURE public.r_timestamp_maj();

-- Trigger: t_t2_foncier_insert_surf on r_objet.geo_objet_fon_lot

-- DROP TRIGGER t_t2_foncier_insert_surf ON r_objet.geo_objet_fon_lot;

CREATE TRIGGER t_t2_foncier_insert_surf
  BEFORE INSERT OR UPDATE OF geom
  ON r_objet.geo_objet_fon_lot
  FOR EACH ROW
  EXECUTE PROCEDURE public.r_sup_m2_maj();


-- Function: r_objet.t_t3_foncier_l_nom()

-- DROP FUNCTION r_objet.t_t3_foncier_l_nom();

CREATE OR REPLACE FUNCTION r_objet.t_t3_foncier_l_nom()
  RETURNS trigger AS
$BODY$BEGIN

IF new.l_nom = '' THEN
new.l_nom = null;
END IF;

RETURN NEW;
END;$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
ALTER FUNCTION r_objet.t_t3_foncier_l_nom()
  OWNER TO sig_create;

COMMENT ON FUNCTION r_objet.t_t3_foncier_l_nom() IS 'Fonction dont l''objet de forcer à null le champ l_nom après effacement par exemple pour éviter les doubles cotes';


-- Trigger: t_t3_foncier_l_nom on r_objet.geo_objet_fon_lot

-- DROP TRIGGER t_t3_foncier_l_nom ON r_objet.geo_objet_fon_lot;

CREATE TRIGGER t_t3_foncier_l_nom
  BEFORE INSERT OR UPDATE OF l_nom
  ON r_objet.geo_objet_fon_lot
  FOR EACH ROW
  EXECUTE PROCEDURE r_objet.t_t3_foncier_l_nom();

-- Trigger: t_t3_modif_surfbrt on r_objet.geo_objet_fon_lot

-- DROP TRIGGER t_t3_modif_surfbrt ON r_objet.geo_objet_fon_lot;

CREATE TRIGGER t_t3_modif_surfbrt
  BEFORE UPDATE OF geom
  ON r_objet.geo_objet_fon_lot
  FOR EACH ROW
  EXECUTE PROCEDURE public.r_sup_m2_maj();
ALTER TABLE r_objet.geo_objet_fon_lot DISABLE TRIGGER t_t3_modif_surfbrt;
COMMENT ON TRIGGER t_t3_modif_surfbrt ON r_objet.geo_objet_fon_lot IS 'En doublon avec le le t2 ?';

-- Trigger: t_t4_suivi on r_objet.geo_objet_fon_lot

-- DROP TRIGGER t_t4_suivi ON r_objet.geo_objet_fon_lot;

CREATE TRIGGER t_t4_suivi
  AFTER INSERT OR UPDATE OR DELETE
  ON r_objet.geo_objet_fon_lot
  FOR EACH ROW
  EXECUTE PROCEDURE m_economie.r_suivi_audit();
ALTER TABLE r_objet.geo_objet_fon_lot DISABLE TRIGGER t_t4_suivi;


-- ################################################# Classe des objets opérations/sites ##################################

-- Table: r_objet.geo_objet_ope

-- DROP TABLE r_objet.geo_objet_ope;

CREATE TABLE r_objet.geo_objet_ope
(
  idgeopo integer NOT NULL DEFAULT nextval('idgeo_seq'::regclass), -- Identifiant unique de l'objet
  idsite character varying(7) NOT NULL,
  op_sai character varying(80), -- Opérateur de saisir d'objet à l'ARC
  src_geom character varying(2) DEFAULT '00'::character varying, -- Référentiel spatial de saisie
  sup_m2 double precision, -- Surface brute de l'objet en m²
  proced boolean, -- Information de connaissance si l'objet correspondant oui ou non à une procédure d'urbanisme (ZAC, lotissement, ...)
  destdomi character varying(2) NOT NULL,
  geom geometry(MultiPolygon,2154) NOT NULL, -- Champ contenant la géométrie
  date_sai timestamp without time zone, -- Date de saisie de l'objet
  date_maj timestamp without time zone, -- Date de mise à jour de l'objet
  CONSTRAINT old_geo_objet_ope_pkey PRIMARY KEY (idgeopo)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE r_objet.geo_objet_ope
  OWNER TO sig_create;

COMMENT ON TABLE r_objet.geo_objet_ope
  IS 'Données géographiques contenant les périmètres opérationnels (dont sites d''activité) ==> la mise à jour des données de cette table ainsi que les données métiers de la procédure s''effectue via la vue geo_v_proc dans le schéma r_objet.';
COMMENT ON COLUMN r_objet.geo_objet_ope.idgeopo IS 'Identifiant unique de l''objet';
COMMENT ON COLUMN r_objet.geo_objet_ope.op_sai IS 'Opérateur de saisir d''objet à l''ARC';
COMMENT ON COLUMN r_objet.geo_objet_ope.src_geom IS 'Référentiel spatial de saisie';
COMMENT ON COLUMN r_objet.geo_objet_ope.sup_m2 IS 'Surface brute de l''objet en m²';
COMMENT ON COLUMN r_objet.geo_objet_ope.proced IS 'Information de connaissance si l''objet correspondant oui ou non à une procédure d''urbanisme (ZAC, lotissement, ...)';
COMMENT ON COLUMN r_objet.geo_objet_ope.geom IS 'Champ contenant la géométrie';
COMMENT ON COLUMN r_objet.geo_objet_ope.date_sai IS 'Date de saisie de l''objet';
COMMENT ON COLUMN r_objet.geo_objet_ope.date_maj IS 'Date de mise à jour de l''objet';


-- Trigger: t_t1_geo_objet_ope_site_supm2 on r_objet.geo_objet_ope

-- DROP TRIGGER t_t1_geo_objet_ope_site_supm2 ON r_objet.geo_objet_ope;

CREATE TRIGGER t_t1_geo_objet_ope_site_supm2
  BEFORE INSERT OR UPDATE OF geom
  ON r_objet.geo_objet_ope
  FOR EACH ROW
  EXECUTE PROCEDURE public.r_sup_m2_maj();

-- Trigger: t_t2_geo_objet_ope_date_maj on r_objet.geo_objet_ope

-- DROP TRIGGER t_t2_geo_objet_ope_date_maj ON r_objet.geo_objet_ope;

CREATE TRIGGER t_t2_geo_objet_ope_date_maj
  BEFORE UPDATE
  ON r_objet.geo_objet_ope
  FOR EACH ROW
  EXECUTE PROCEDURE public.r_timestamp_maj();

-- Trigger: t_t3_geo_objet_ope_date_sai on r_objet.geo_objet_ope

-- DROP TRIGGER t_t3_geo_objet_ope_date_sai ON r_objet.geo_objet_ope;

CREATE TRIGGER t_t3_geo_objet_ope_date_sai
  BEFORE INSERT
  ON r_objet.geo_objet_ope
  FOR EACH ROW
  EXECUTE PROCEDURE public.r_timestamp_sai();

-- Function: r_objet.m_vm_site()

-- DROP FUNCTION r_objet.m_vm_site();

CREATE OR REPLACE FUNCTION r_objet.m_vm_site()
  RETURNS trigger AS
$BODY$

BEGIN

    DELETE FROM r_objet.geo_objet_site;
    INSERT INTO r_objet.geo_objet_site 
	SELECT row_number() OVER () AS gid,
	o.idsite,
	st_multi(st_union(o.geom))::geometry(MultiPolygon,2154) AS geom,
	st_area(st_union(o.geom)) AS surf
	FROM r_objet.geo_objet_ope o
	GROUP BY o.idsite;
       
    return new ;
END;

$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
ALTER FUNCTION r_objet.m_vm_site()
  OWNER TO sig_create;


-- Trigger: t_t4_geo_objet_ope_site on r_objet.geo_objet_ope

-- DROP TRIGGER t_t4_geo_objet_ope_site ON r_objet.geo_objet_ope;

CREATE TRIGGER t_t4_geo_objet_ope_site
  AFTER INSERT OR UPDATE OR DELETE
  ON r_objet.geo_objet_ope
  FOR EACH ROW
  EXECUTE PROCEDURE r_objet.m_vm_site();

-- ################################################# Classe des objets sites reconstitués ##################################

-- Table: r_objet.geo_objet_site

-- DROP TABLE r_objet.geo_objet_site;

CREATE TABLE r_objet.geo_objet_site
(
  gid integer,
  idsite character varying(7) NOT NULL, -- Identifiant du site
  geom geometry(MultiPolygon,2154),
  surf double precision, -- Surface total du site en m²
  CONSTRAINT geo_objet_vm_site_pkey PRIMARY KEY (idsite)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE r_objet.geo_objet_site
  OWNER TO sig_create;

COMMENT ON TABLE r_objet.geo_objet_site
  IS 'Table des sites (agrégation des objets de la table geo_objet_ope) pour la mise à jours des attributs métiers des sites. Cette table est mise à jour par un trigger s''executant sur l''insertion, la mise à jour et la suppression d''objet de la table geo_objet_ope) .';
COMMENT ON COLUMN r_objet.geo_objet_site.idsite IS 'Identifiant du site';
COMMENT ON COLUMN r_objet.geo_objet_site.surf IS 'Surface total du site en m²';


-- ################################################# Du schéma m_economie ##################################

-- ################################################# Classe des objets documents de lots ##################################

-- Table: m_economie.an_lot_doc_media

-- DROP TABLE m_economie.an_lot_doc_media;

CREATE TABLE m_economie.an_lot_doc_media
(
  id integer, -- Identifiant de lot
  media text, -- Champ Média de GEO
  miniature bytea, -- Champ miniature de GEO
  n_fichier text, -- Nom du fichier
  t_fichier text, -- Type de média dans GEO
  op_sai character varying(20), -- Opérateur de saisie (par défaut login de connexion à GEO)
  l_doc character varying(100), -- nom ou léger descriptif du document
  date_sai timestamp without time zone, -- Date de la saisie du document
  d_photo timestamp without time zone, -- Date de la prise de vue
  gid serial NOT NULL, -- Compteur (identifiant interne)
  CONSTRAINT an_lot_doc_media_pkey PRIMARY KEY (gid)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE m_economie.an_lot_doc_media
  OWNER TO sig_create;

COMMENT ON TABLE m_economie.an_lot_doc_media
  IS 'Table gérant les documents des lots (photo notamment) dans le module MEDIA dans GEO avec stockage des documents dans une arborescence de fichiers (saisie de docs par les utilisateurs)';
COMMENT ON COLUMN m_economie.an_lot_doc_media.id IS 'Identifiant de lot';
COMMENT ON COLUMN m_economie.an_lot_doc_media.media IS 'Champ Média de GEO';
COMMENT ON COLUMN m_economie.an_lot_doc_media.miniature IS 'Champ miniature de GEO';
COMMENT ON COLUMN m_economie.an_lot_doc_media.n_fichier IS 'Nom du fichier';
COMMENT ON COLUMN m_economie.an_lot_doc_media.t_fichier IS 'Type de média dans GEO';
COMMENT ON COLUMN m_economie.an_lot_doc_media.op_sai IS 'Opérateur de saisie (par défaut login de connexion à GEO)';
COMMENT ON COLUMN m_economie.an_lot_doc_media.l_doc IS 'nom ou léger descriptif du document';
COMMENT ON COLUMN m_economie.an_lot_doc_media.date_sai IS 'Date de la saisie du document';
COMMENT ON COLUMN m_economie.an_lot_doc_media.d_photo IS 'Date de la prise de vue';
COMMENT ON COLUMN m_economie.an_lot_doc_media.gid IS 'Compteur (identifiant interne)';


-- Trigger: t_t1_an_lot_doc_media_date_sai on m_economie.an_lot_doc_media

-- DROP TRIGGER t_t1_an_lot_doc_media_date_sai ON m_economie.an_lot_doc_media;

CREATE TRIGGER t_t1_an_lot_doc_media_date_sai
  BEFORE INSERT
  ON m_economie.an_lot_doc_media
  FOR EACH ROW
  EXECUTE PROCEDURE public.r_timestamp_sai();

                   
-- ################################################# Classe des objets des DIA ##################################

-- Table: m_economie.an_sa_dia

-- DROP TABLE m_economie.an_sa_dia;

CREATE TABLE m_economie.an_sa_dia
(
  gid serial NOT NULL, -- Identifiant unique interne
  idgeolf integer NOT NULL, -- Identifiant unique de l'entité géographique lot
  num_dia character varying(25), -- Numéro de la DIA
  date_dia timestamp without time zone, -- Date de la dernière DIA
  prix_v double precision, -- Prix de vente en euros
  nom_v character varying(80), -- Nom du vendeur
  nom_a character varying(80), -- Nom de l'acquéreur (seconde main)
  CONSTRAINT an_sa_dia_pkey PRIMARY KEY (gid)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE m_economie.an_sa_dia
  OWNER TO sig_create;

COMMENT ON TABLE m_economie.an_sa_dia
  IS 'Table alphanumérique contenant le suivi des DIA pour les lots à vocation économique (la gestion des DIA est géré par un outil d''OPERIS mais sans pouvoir récupérer les données brutes pour le moment)';
COMMENT ON COLUMN m_economie.an_sa_dia.gid IS 'Identifiant unique interne';
COMMENT ON COLUMN m_economie.an_sa_dia.idgeolf IS 'Identifiant unique de l''entité géographique lot';
COMMENT ON COLUMN m_economie.an_sa_dia.num_dia IS 'Numéro de la DIA';
COMMENT ON COLUMN m_economie.an_sa_dia.date_dia IS 'Date de la dernière DIA';
COMMENT ON COLUMN m_economie.an_sa_dia.prix_v IS 'Prix de vente en euros';
COMMENT ON COLUMN m_economie.an_sa_dia.nom_v IS 'Nom du vendeur';
COMMENT ON COLUMN m_economie.an_sa_dia.nom_a IS 'Nom de l''acquéreur (seconde main)';

                   
-- ################################################# Classe des objets des établissements ##################################
                  
-- Table: m_economie.an_sa_etab

-- DROP TABLE m_economie.an_sa_etab;

CREATE TABLE m_economie.an_sa_etab
(
  idgeoet integer NOT NULL, -- Identifiant unique géographique
  idsiren character varying(9) NOT NULL, -- Numéro SIRENE de l'établissement
  idsiret character varying(14), -- Numéro SIRET de l'établissement
  idsite character varying(10), -- Identifiant du site d'activité d'appartenance
  date_int date, -- Date renseignée par GéoPicardie lors de l'intégration du fichier dans la base (correspond aux dernières données reçues)
  op_sai character varying(80), -- Libellé de l'opérateur de Saisie
  org_sai character varying(80), -- Libellé de l'organisme dont dépend l'opérateur de saisie
  decalage character varying(7), -- Décalage entre SIRENE et le terrain
  l_nom character varying(255), -- Libellé du nom de l'établissement spécifique si différent du nom SIRENE (nom usuel du service économie)
  n_adres character varying(255), -- Libellé de la nouvelle adresse si l'établissement a déménagé
  filiale integer, -- Filiale ou entreprise indépendante (plus utilisé dans SIRENE depuis 2016)
  capital character varying(2), -- Pays d'origine si capitaux étrangers(plus utilisé dans SIRENE depuis 2016)
  eff_ent integer, -- Effectif total du groupe
  eff_etab integer, -- Effectif total de l'établissement
  eff_ent_etp double precision, -- Effectif total du groupe en etp
  eff_etab_etp double precision, -- Effectif de l'établissement en etp
  source_eff character varying(50), -- Source de l'effectif de l'établissement
  annee_eff integer, -- Année de l'effectif (issu de SIRENE)
  l_date_eff date, -- Date de l'effectif saisie par l'ARC
  shon double precision, -- Surface hors oeuvre nette (plus utilisé dans SIRENE depuis 2016)
  chiff_aff double precision, -- Chiffre d'affaires de l'établissement (plus utilisé dans SIRENE depuis 2016)
  annee_ca integer, -- Année du chiffre d'affaires (plus utilisé dans SIRENE depuis 2016)
  usage_comm integer DEFAULT 1, -- L'établissement apparaîtra dans les documents de communication
  etb_env character varying(255), -- Démarche environnementale mise en oeuvre par l'établissement (ex : convention de rejet, ....)
  l_nom_dir character varying(80), -- Libellé du nom du dirigeant de l'établissement par l'ARC
  date_maj_dir date, -- Date de mise à jour du dirigeant
  source_maj_dir character varying(50), -- Source de la mise à jour du dirigeant
  l_tel character varying(15), -- Numéro de téléphone de l'établissement
  l_mail character varying(80), -- Adresse mail de l'établissement
  l_observ character varying(255), -- Commentaires
  date_sai timestamp without time zone, -- Date de saisie des données attributaires
  date_maj timestamp without time zone, -- Date de mise à jour des données attributaires
  l_compte boolean DEFAULT true, -- Prise en compte de l'établissement pour le calcul des statistiques (nombre d'établissements et effectifs) dans les informations de synthèse....
  l_tel_dir character varying(15), -- Numéro de téléphone direct du dirigeant
  l_telp_dir character varying(15), -- Numéro de téléphone portable direct du dirigeant
  l_mail_dir character varying(80), -- Adresse email du dirigeant
  l_nom_drh character varying(255), -- Nom du DRH
  l_tel_drh character varying(15), -- Numéro de téléphone direct du DRH
  l_mail_drh character varying(80), -- Adresse email du DRH
  l_nom_ad character varying(255), -- Nom de l'assistante de direction
  l_tel_ad character varying(15), -- Numéro de téléphone direct de l'assistante de direction
  l_mail_ad character varying(80), -- Adresse email de l'assistante de direction
  l_url character varying(500), -- Lien du site internet de l'entreprise
  l_url_bil character varying(500), -- Lien vers le bilan en ligne de l'entreprise
  l_comp_ad character varying(100), -- Complément d'adresse (ex : nom du bâtiment)
  apet700 character varying(255), -- Code d'activité de l'établissement (issu de SIRENE et mis à jour lors de la mise à jour de SIRENE)
  libapet character varying(255), -- Libellé de l'activité de l'établissement (issu de SIRENE et mis à jour lors de la mise à jour de SIRENE)
  l_titre character varying(100), -- Titre du dirigeant
  eff_etab_d character varying(200), -- Précision (en détail) du nombre de CDD, CDI, intérim, ....
  l_nom_aut character varying(255), -- Nom de l'autre responsable
  l_titre_aut character varying(255), -- Titre de l'autre responsable
  l_tel_aut character varying(15), -- Téléphone de l'autre responsable
  l_mail_aut character varying(80), -- Email de l'autre responsable
  date_maj_drh timestamp without time zone, -- Date de mise à jour du contact DRH
  date_maj_ad timestamp without time zone, -- Date de mise à jour contact Assistante de direction
  date_maj_aut timestamp without time zone, -- Date de mise à jour du contact de l'autre responsable
  l_titre_drh character varying(100), -- Titre du contact DRH
  l_titre_ad character varying(100), -- Titre du contact de l'Assitante de direction
  l_drh_ss boolean DEFAULT true, -- Information sur le fait que la DRH soit sur le site ou non (par défaut oui)
  l_drh_ad character varying(150), -- Adresse extérieure de la DRH si pas sur site
  id serial NOT NULL, -- Identifiant unique interne
  l_telp_aut character varying(15), -- Téléphone portable de l'autre responsable
  CONSTRAINT an_sa_etab_pkey PRIMARY KEY (id)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE m_economie.an_sa_etab
  OWNER TO sig_create;

COMMENT ON TABLE m_economie.an_sa_etab
  IS 'Données métiers sur les établissements';
COMMENT ON COLUMN m_economie.an_sa_etab.idgeoet IS 'Identifiant unique géographique';
COMMENT ON COLUMN m_economie.an_sa_etab.idsiren IS 'Numéro SIRENE de l''établissement';
COMMENT ON COLUMN m_economie.an_sa_etab.idsiret IS 'Numéro SIRET de l''établissement';
COMMENT ON COLUMN m_economie.an_sa_etab.idsite IS 'Identifiant du site d''activité d''appartenance';
COMMENT ON COLUMN m_economie.an_sa_etab.date_int IS 'Date renseignée par GéoPicardie lors de l''intégration du fichier dans la base (correspond aux dernières données reçues)';
COMMENT ON COLUMN m_economie.an_sa_etab.op_sai IS 'Libellé de l''opérateur de Saisie';
COMMENT ON COLUMN m_economie.an_sa_etab.org_sai IS 'Libellé de l''organisme dont dépend l''opérateur de saisie';
COMMENT ON COLUMN m_economie.an_sa_etab.decalage IS 'Décalage entre SIRENE et le terrain';
COMMENT ON COLUMN m_economie.an_sa_etab.l_nom IS 'Libellé du nom de l''établissement spécifique si différent du nom SIRENE (nom usuel du service économie)';
COMMENT ON COLUMN m_economie.an_sa_etab.n_adres IS 'Libellé de la nouvelle adresse si l''établissement a déménagé';
COMMENT ON COLUMN m_economie.an_sa_etab.filiale IS 'Filiale ou entreprise indépendante (plus utilisé dans SIRENE depuis 2016)';
COMMENT ON COLUMN m_economie.an_sa_etab.capital IS 'Pays d''origine si capitaux étrangers(plus utilisé dans SIRENE depuis 2016)';
COMMENT ON COLUMN m_economie.an_sa_etab.eff_ent IS 'Effectif total du groupe';
COMMENT ON COLUMN m_economie.an_sa_etab.eff_etab IS 'Effectif total de l''établissement';
COMMENT ON COLUMN m_economie.an_sa_etab.eff_ent_etp IS 'Effectif total du groupe en etp';
COMMENT ON COLUMN m_economie.an_sa_etab.eff_etab_etp IS 'Effectif de l''établissement en etp';
COMMENT ON COLUMN m_economie.an_sa_etab.source_eff IS 'Source de l''effectif de l''établissement';
COMMENT ON COLUMN m_economie.an_sa_etab.annee_eff IS 'Année de l''effectif (issu de SIRENE)';
COMMENT ON COLUMN m_economie.an_sa_etab.l_date_eff IS 'Date de l''effectif saisie par l''ARC';
COMMENT ON COLUMN m_economie.an_sa_etab.shon IS 'Surface hors oeuvre nette (plus utilisé dans SIRENE depuis 2016)';
COMMENT ON COLUMN m_economie.an_sa_etab.chiff_aff IS 'Chiffre d''affaires de l''établissement (plus utilisé dans SIRENE depuis 2016)';
COMMENT ON COLUMN m_economie.an_sa_etab.annee_ca IS 'Année du chiffre d''affaires (plus utilisé dans SIRENE depuis 2016)';
COMMENT ON COLUMN m_economie.an_sa_etab.usage_comm IS 'L''établissement apparaîtra dans les documents de communication';
COMMENT ON COLUMN m_economie.an_sa_etab.etb_env IS 'Démarche environnementale mise en oeuvre par l''établissement (ex : convention de rejet, ....)';
COMMENT ON COLUMN m_economie.an_sa_etab.l_nom_dir IS 'Libellé du nom du dirigeant de l''établissement par l''ARC';
COMMENT ON COLUMN m_economie.an_sa_etab.date_maj_dir IS 'Date de mise à jour du dirigeant';
COMMENT ON COLUMN m_economie.an_sa_etab.source_maj_dir IS 'Source de la mise à jour du dirigeant';
COMMENT ON COLUMN m_economie.an_sa_etab.l_tel IS 'Numéro de téléphone de l''établissement';
COMMENT ON COLUMN m_economie.an_sa_etab.l_mail IS 'Adresse mail de l''établissement';
COMMENT ON COLUMN m_economie.an_sa_etab.l_observ IS 'Commentaires';
COMMENT ON COLUMN m_economie.an_sa_etab.date_sai IS 'Date de saisie des données attributaires';
COMMENT ON COLUMN m_economie.an_sa_etab.date_maj IS 'Date de mise à jour des données attributaires';
COMMENT ON COLUMN m_economie.an_sa_etab.l_compte IS 'Prise en compte de l''établissement pour le calcul des statistiques (nombre d''établissements et effectifs) dans les informations de synthèse.
Par défaut TRUE et laisse le choix à l''administrateur de la donnée de modifier cette valeur.';
COMMENT ON COLUMN m_economie.an_sa_etab.l_tel_dir IS 'Numéro de téléphone direct du dirigeant';
COMMENT ON COLUMN m_economie.an_sa_etab.l_telp_dir IS 'Numéro de téléphone portable direct du dirigeant';
COMMENT ON COLUMN m_economie.an_sa_etab.l_mail_dir IS 'Adresse email du dirigeant';
COMMENT ON COLUMN m_economie.an_sa_etab.l_nom_drh IS 'Nom du DRH';
COMMENT ON COLUMN m_economie.an_sa_etab.l_tel_drh IS 'Numéro de téléphone direct du DRH';
COMMENT ON COLUMN m_economie.an_sa_etab.l_mail_drh IS 'Adresse email du DRH';
COMMENT ON COLUMN m_economie.an_sa_etab.l_nom_ad IS 'Nom de l''assistante de direction';
COMMENT ON COLUMN m_economie.an_sa_etab.l_tel_ad IS 'Numéro de téléphone direct de l''assistante de direction';
COMMENT ON COLUMN m_economie.an_sa_etab.l_mail_ad IS 'Adresse email de l''assistante de direction';
COMMENT ON COLUMN m_economie.an_sa_etab.l_url IS 'Lien du site internet de l''entreprise';
COMMENT ON COLUMN m_economie.an_sa_etab.l_url_bil IS 'Lien vers le bilan en ligne de l''entreprise';
COMMENT ON COLUMN m_economie.an_sa_etab.l_comp_ad IS 'Complément d''adresse (ex : nom du bâtiment)';
COMMENT ON COLUMN m_economie.an_sa_etab.apet700 IS 'Code d''activité de l''établissement (issu de SIRENE et mis à jour lors de la mise à jour de SIRENE)';
COMMENT ON COLUMN m_economie.an_sa_etab.libapet IS 'Libellé de l''activité de l''établissement (issu de SIRENE et mis à jour lors de la mise à jour de SIRENE)';
COMMENT ON COLUMN m_economie.an_sa_etab.l_titre IS 'Titre du dirigeant';
COMMENT ON COLUMN m_economie.an_sa_etab.eff_etab_d IS 'Précision (en détail) du nombre de CDD, CDI, intérim, ....';
COMMENT ON COLUMN m_economie.an_sa_etab.l_nom_aut IS 'Nom de l''autre responsable';
COMMENT ON COLUMN m_economie.an_sa_etab.l_titre_aut IS 'Titre de l''autre responsable';
COMMENT ON COLUMN m_economie.an_sa_etab.l_tel_aut IS 'Téléphone de l''autre responsable';
COMMENT ON COLUMN m_economie.an_sa_etab.l_mail_aut IS 'Email de l''autre responsable';
COMMENT ON COLUMN m_economie.an_sa_etab.date_maj_drh IS 'Date de mise à jour du contact DRH';
COMMENT ON COLUMN m_economie.an_sa_etab.date_maj_ad IS 'Date de mise à jour contact Assistante de direction';
COMMENT ON COLUMN m_economie.an_sa_etab.date_maj_aut IS 'Date de mise à jour du contact de l''autre responsable';
COMMENT ON COLUMN m_economie.an_sa_etab.l_titre_drh IS 'Titre du contact DRH';
COMMENT ON COLUMN m_economie.an_sa_etab.l_titre_ad IS 'Titre du contact de l''Assitante de direction';
COMMENT ON COLUMN m_economie.an_sa_etab.l_drh_ss IS 'Information sur le fait que la DRH soit sur le site ou non (par défaut oui)';
COMMENT ON COLUMN m_economie.an_sa_etab.l_drh_ad IS 'Adresse extérieure de la DRH si pas sur site';
COMMENT ON COLUMN m_economie.an_sa_etab.id IS 'Identifiant unique interne';
COMMENT ON COLUMN m_economie.an_sa_etab.l_telp_aut IS 'Téléphone portable de l''autre responsable';


-- Trigger: t_t1_suivi on m_economie.an_sa_etab

-- DROP TRIGGER t_t1_suivi ON m_economie.an_sa_etab;

CREATE TRIGGER t_t1_suivi
  AFTER INSERT OR UPDATE OR DELETE
  ON m_economie.an_sa_etab
  FOR EACH ROW
  EXECUTE PROCEDURE m_economie.r_suivi_audit();

                   
-- ################################################# Classe des objets des lots ##################################


                   
-- ####################################################################################################################################################
-- ###                                                                                                                                              ###
-- ###                                                                        FKEY                                                                  ###
-- ###                                                                                                                                              ###
-- ####################################################################################################################################################

-- ################################################# Du schéma r_objet ##################################

  CONSTRAINT geo_objet_etab FOREIGN KEY (code_geo)
      REFERENCES r_objet.lt_objet_codegeo (code_geo) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT geo_objet_etab_srcgeom_fkey FOREIGN KEY (src_geom)
      REFERENCES r_objet.lt_src_geom (code) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION;

  CONSTRAINT geo_objet_empesp_pu_srcgeom_fkey FOREIGN KEY (src_geom)
      REFERENCES r_objet.lt_src_geom (code) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION;

  CONSTRAINT geo_objet_fon_lot_scrgeom_fkey FOREIGN KEY (src_geom)
      REFERENCES r_objet.lt_src_geom (code) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT lt_objet_vocafon_fkey FOREIGN KEY (l_voca)
      REFERENCES r_objet.lt_objet_vocafon (l_voca) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION;
      
  CONSTRAINT geo_objet_ope_scrgeom_fkey FOREIGN KEY (src_geom)
      REFERENCES r_objet.lt_src_geom (code) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT lt_destdomi_fkey FOREIGN KEY (destdomi)
      REFERENCES m_urbanisme_doc_cnig2014.lt_destdomi (destdomi) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION;

  CONSTRAINT lt_sa_decalage_fkey FOREIGN KEY (decalage)
      REFERENCES m_economie.lt_sa_decalage (decalage) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT lt_sa_filiale_fkey FOREIGN KEY (filiale)
      REFERENCES m_economie.lt_sa_filiale (filiale) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION;
                   
-- ####################################################################################################################################################
-- ###                                                                                                                                              ###
-- ###                                                                INDEX                                                           ###
-- ###                                                                                                                                              ###
-- ####################################################################################################################################################

-- ################################################# Du schéma r_objet ##################################

-- Index: r_objet.geo_objet_empesp_pu_geom_idx

-- DROP INDEX r_objet.geo_objet_empesp_pu_geom_idx;

CREATE INDEX geo_objet_empesp_pu_geom_idx
  ON r_objet.geo_objet_empesp_pu
  USING gist
  (geom);

-- Index: r_objet.geo_objet_etab_geom_idx

-- DROP INDEX r_objet.geo_objet_etab_geom_idx;

CREATE INDEX geo_objet_etab_geom_idx
  ON r_objet.geo_objet_etab
  USING gist
  (geom);


-- Index: r_objet.geo_objet_fon_lot_geom_idx

-- DROP INDEX r_objet.geo_objet_fon_lot_geom_idx;

CREATE INDEX geo_objet_fon_lot_geom_idx
  ON r_objet.geo_objet_fon_lot
  USING gist
  (geom);


-- Index: r_objet.geo_objet_ope_geom_idx

-- DROP INDEX r_objet.geo_objet_ope_geom_idx;

CREATE INDEX geo_objet_ope_geom_idx
  ON r_objet.geo_objet_ope
  USING gist
  (geom);

-- Index: r_objet.geo_objet_site_geom_idx

-- DROP INDEX r_objet.geo_objet_site_geom_idx;

CREATE INDEX geo_objet_site_geom_idx
  ON r_objet.geo_objet_site
  USING gist
  (geom);

-- Index: m_economie.idx_an_sa_etab_idsiret

-- DROP INDEX m_economie.idx_an_sa_etab_idsiret;

CREATE INDEX idx_an_sa_etab_idsiret
  ON m_economie.an_sa_etab
  USING btree
  (idsiret COLLATE pg_catalog."default");

-- Index: m_economie.idx_an_sa_etab_idsite

-- DROP INDEX m_economie.idx_an_sa_etab_idsite;

CREATE INDEX idx_an_sa_etab_idsite
  ON m_economie.an_sa_etab
  USING btree
  (idsite COLLATE pg_catalog."default");


