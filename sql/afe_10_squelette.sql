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





-- ####################################################################################################################################################
-- ###                                                                                                                                              ###
-- ###                                                                TABLE                                                           ###
-- ###                                                                                                                                              ###
-- ####################################################################################################################################################

-- ################################################# Table de relation lot - cession ##################################





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













