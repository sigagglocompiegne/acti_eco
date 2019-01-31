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

-- ################################################# du schéma objet Objet ##################################

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



-- ################################################# Du schéma m_amenagement ##################################

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



-- ####################################################################################################################################################
-- ###                                                                                                                                              ###
-- ###                                                                TABLE                                                           ###
-- ###                                                                                                                                              ###
-- ####################################################################################################################################################

-- ################################################# Du schéma r_objet ##################################

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





-- ####################################################################################################################################################
-- ###                                                                                                                                              ###
-- ###                                                                        FKEY                                                                  ###
-- ###                                                                                                                                              ###
-- ####################################################################################################################################################

-- ################################################# Du schéma r_objet ##################################

  CONSTRAINT geo_objet_fon_lot_scrgeom_fkey FOREIGN KEY (src_geom)
      REFERENCES r_objet.lt_src_geom (code) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT lt_objet_vocafon_fkey FOREIGN KEY (l_voca)
      REFERENCES r_objet.lt_objet_vocafon (l_voca) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION;
      
      
-- ####################################################################################################################################################
-- ###                                                                                                                                              ###
-- ###                                                                INDEX                                                           ###
-- ###                                                                                                                                              ###
-- ####################################################################################################################################################

-- ################################################# Du schéma r_objet ##################################


-- Index: r_objet.geo_objet_fon_lot_geom_idx

-- DROP INDEX r_objet.geo_objet_fon_lot_geom_idx;

CREATE INDEX geo_objet_fon_lot_geom_idx
  ON r_objet.geo_objet_fon_lot
  USING gist
  (geom);









