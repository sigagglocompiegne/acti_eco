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

/*
-- Schema: m_urbanisme_reg

-- DROP SCHEMA m_urbanisme_reg;

CREATE SCHEMA m_urbanisme_reg
  AUTHORIZATION sig_create;


COMMENT ON SCHEMA m_urbanisme_reg
  IS 'Données géographiques métiers sur l''urbanisme réglementaire';

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

-- ################################################# Séquence des identifiants des documents de cessions ##################################

-- Sequence: m_foncier.an_fon_doc_media_gid_seq

-- DROP SEQUENCE m_foncier.an_fon_doc_media_gid_seq;
/*
CREATE SEQUENCE m_foncier.an_fon_doc_media_gid_seq
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 1278
  CACHE 1;
ALTER TABLE m_foncier.an_fon_doc_media_gid_seq
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
  
-- ################################################# Séquence des identifiants des DIA ##################################

-- Sequence: m_economie.an_sa_dia_gid_seq

-- DROP SEQUENCE m_economie.an_sa_dia_gid_seq;
/*
CREATE SEQUENCE m_economie.an_sa_dia_gid_seq
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 4
  CACHE 1;
ALTER TABLE m_economie.an_sa_dia_gid_seq
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


-- ################################################# Séquence des identifiants pour les établissements (source API SIRENE) ##################################

-- Sequence: s_sirene.an_etablissement_api_gid_seq

-- DROP SEQUENCE s_sirene.an_etablissement_api_gid_seq;
/*
CREATE SEQUENCE s_sirene.an_etablissement_api_gid_seq
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 1
  CACHE 1;
ALTER TABLE s_sirene.an_etablissement_api_gid_seq
  OWNER TO sig_create;
*/

-- ################################################# Séquence des identifiants pour les unités légales (source API SIRENE) ##################################

-- Sequence: s_sirene.an_unitelegale_api_gid_seq

-- DROP SEQUENCE s_sirene.an_unitelegale_api_gid_seq;
/*
CREATE SEQUENCE s_sirene.an_unitelegale_api_gid_seq
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 1
  CACHE 1;
ALTER TABLE s_sirene.an_unitelegale_api_gid_seq
  OWNER TO sig_create;
*/

-- ################################################# Séquence des identifiants pour les sites mixte historiques ##################################

-- Sequence: m_amenagement.h_an_amt_site_mixte_gid_seq

-- DROP SEQUENCE m_amenagement.h_an_amt_site_mixte_gid_seq;
/*
CREATE SEQUENCE m_amenagement.h_an_amt_site_mixte_gid_seq
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 65
  CACHE 1;
ALTER TABLE m_amenagement.h_an_amt_site_mixte_gid_seq
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

-- ################################################################# Domaine valeur - Naf rev 1 niveau 5 ###############################################

-- Table: s_sirene.lt_nafrev1

-- DROP TABLE s_sirene.lt_nafrev1;

CREATE TABLE s_sirene.lt_nafrev1
(
  code character varying(6) NOT NULL, -- Code NAF niveau 5
  valeur character varying(122), -- Libellé code NAF niveau 5
  CONSTRAINT lt_nafrev1_pkey PRIMARY KEY (code)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE s_sirene.lt_nafrev1
  OWNER TO sig_create;

COMMENT ON TABLE s_sirene.lt_nafrev1
  IS 'Libellé des codes NAF (nomenclature d''activité française) niveau 5 (dernière nomanclature NAFRev1)';
COMMENT ON COLUMN s_sirene.lt_nafrev1.code IS 'Code NAF niveau 5';
COMMENT ON COLUMN s_sirene.lt_nafrev1.valeur IS 'Libellé code NAF niveau 5';

-- ################################################################# Domaine valeur - Naf rev 2 niveau 5 ###############################################

-- Table: s_sirene.lt_nafrev2

-- DROP TABLE s_sirene.lt_nafrev2;

CREATE TABLE s_sirene.lt_nafrev2
(
  code character varying(6) NOT NULL,
  valeur character varying(147),
  code_apet700 character varying(6),
  CONSTRAINT lt_nafrev2_pkey PRIMARY KEY (code)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE s_sirene.lt_nafrev2
  OWNER TO postgres;

COMMENT ON TABLE s_sirene.lt_nafrev2
  IS 'Libellé des codes NAF (nomenclature d''activité française) niveau 5 (dernière nomanclature NAFRev2)';

-- ################################################################# Domaine valeur - Naf 1993 ###############################################

-- Table: s_sirene.lt_naf1993

-- DROP TABLE s_sirene.lt_naf1993;

CREATE TABLE s_sirene.lt_naf1993
(
  code character varying(6) NOT NULL, -- Code NAF niveau 5
  valeur character varying(122), -- Libellé des codes NAF niveau 5
  CONSTRAINT lt_naf1993_pkey PRIMARY KEY (code)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE s_sirene.lt_naf1993
  OWNER TO sig_create;

COMMENT ON TABLE s_sirene.lt_naf1993
  IS 'Libellé des codes NAF (nomenclature d''activité française) niveau 5 (nomenclature de 1993 mise en place entre 2002 et 2003)';
COMMENT ON COLUMN s_sirene.lt_naf1993.code IS 'Code NAF niveau 5';
COMMENT ON COLUMN s_sirene.lt_naf1993.valeur IS 'Libellé des codes NAF niveau 5';

-- ################################################################# Domaine valeur - Nafa ###############################################

-- Table: s_sirene.lt_nafa

-- DROP TABLE s_sirene.lt_nafa;

CREATE TABLE s_sirene.lt_nafa
(
  code character varying(9) NOT NULL, -- Code de la catégorie NAFA
  valeur character varying(133), -- Libellé de la catégorie NAFA
  CONSTRAINT lt_nafa_pkey PRIMARY KEY (code)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE s_sirene.lt_nafa
  OWNER TO sig_create;

COMMENT ON TABLE s_sirene.lt_nafa
  IS 'Libélé des codes NAFA (nomenclature d''Activité Française de l''Artisanat)';
COMMENT ON COLUMN s_sirene.lt_nafa.code IS 'Code de la catégorie NAFA';
COMMENT ON COLUMN s_sirene.lt_nafa.valeur IS 'Libellé de la catégorie NAFA';

-- ################################################################# Domaine valeur - Nap ###############################################

-- Table: s_sirene.lt_nap

-- DROP TABLE s_sirene.lt_nap;

CREATE TABLE s_sirene.lt_nap
(
  code numeric(5,2) NOT NULL, -- Code de la NAP niveau 5
  valeur character varying(174), -- Libellé de la NAP niveau 5
  CONSTRAINT lt_nap_pkey PRIMARY KEY (code)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE s_sirene.lt_nap
  OWNER TO sig_create;

COMMENT ON TABLE s_sirene.lt_nap
  IS 'Libellé des codes NAP (nomenclature d''activités et de produits) niveau 5 (dernière nomanclature utilisée entre 1973 et 1992 et remplacé par la NAF)';
COMMENT ON COLUMN s_sirene.lt_nap.code IS 'Code de la NAP niveau 5';
COMMENT ON COLUMN s_sirene.lt_nap.valeur IS 'Libellé de la NAP niveau 5';

-- ################################################################# Domaine valeur - Code employeur ###############################################

-- Table: s_sirene.lt_cemployeur

-- DROP TABLE s_sirene.lt_cemployeur;

CREATE TABLE s_sirene.lt_cemployeur
(
  code character varying(1) NOT NULL, -- Code du caractère employeur de l'établissement
  valeur character varying(30), -- Libellé du caractère employeur de l'établissement (source : issu de SIRENE API)
  CONSTRAINT lt_cemployeur_pkey PRIMARY KEY (code)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE s_sirene.lt_cemployeur
  OWNER TO sig_create;

COMMENT ON TABLE s_sirene.lt_cemployeur
  IS 'Libélé des caractères employeurs de l''établissement (source : SIRENE API)';
COMMENT ON COLUMN s_sirene.lt_cemployeur.code IS 'Code du caractère employeur de l''établissement';
COMMENT ON COLUMN s_sirene.lt_cemployeur.valeur IS 'Libellé du caractère employeur de l''établissement (source : issu de SIRENE API)';

-- ################################################################# Domaine valeur - Economie sociale et solidaire ###############################################

-- Table: s_sirene.lt_essul

-- DROP TABLE s_sirene.lt_essul;

CREATE TABLE s_sirene.lt_essul
(
  code character varying(1) NOT NULL, -- Code d'appartenance à l'économie sociale et solidfaire des unités légales
  valeur character varying(75), -- Libellé d'appartenance à l'économie sociale et solidaire des unités légales (source : issu de SIRENE API)
  CONSTRAINT lt_essul_pkey PRIMARY KEY (code)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE s_sirene.lt_essul
  OWNER TO sig_create;

COMMENT ON TABLE s_sirene.lt_essul
  IS 'Libélé des codes d''appartenance à l''économie sociale et solidaire des unités légales (source : SIRENE API)';
COMMENT ON COLUMN s_sirene.lt_essul.code IS 'Code d''appartenance à l''économie sociale et solidfaire des unités légales';
COMMENT ON COLUMN s_sirene.lt_essul.valeur IS 'Libellé d''appartenance à l''économie sociale et solidaire des unités légales (source : issu de SIRENE API)';

-- ################################################################# Domaine valeur - Etat administratif ###############################################

-- Table: s_sirene.lt_etatadmin

-- DROP TABLE s_sirene.lt_etatadmin;

CREATE TABLE s_sirene.lt_etatadmin
(
  code character varying(1) NOT NULL, -- Code de l'état administratif de l'établissement
  valeur character varying(10), -- Libellé de l'état administratif de l'établissement
  CONSTRAINT lt_etatadmin_pkey PRIMARY KEY (code)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE s_sirene.lt_etatadmin
  OWNER TO sig_create;

COMMENT ON TABLE s_sirene.lt_etatadmin
  IS 'Libélé des états administratif de l''établissement (source : SIRENE API)';
COMMENT ON COLUMN s_sirene.lt_etatadmin.code IS 'Code de l''état administratif de l''établissement';
COMMENT ON COLUMN s_sirene.lt_etatadmin.valeur IS 'Libellé de l''état administratif de l''établissement';

-- ################################################################# Domaine valeur - Tranche d'effectif ###############################################
-- Table: s_sirene.lt_trancheeff

-- DROP TABLE s_sirene.lt_trancheeff;

CREATE TABLE s_sirene.lt_trancheeff
(
  code character varying(2) NOT NULL, -- Code des tranches d'effectifs des établissements
  valeur character varying(50), -- Libellé des tranches d'effectifs des établissements
  mediane integer, -- Nombre d'emploi affecté par défaut à eff_etab dans la table an_sa_etab à la mise à jour (si pas d'effectifs en source ARC) et à l'intégration des données SIRENE
  CONSTRAINT lt_trancheeff_pkey PRIMARY KEY (code)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE s_sirene.lt_trancheeff
  OWNER TO sig_create;

COMMENT ON TABLE s_sirene.lt_trancheeff
  IS 'Libélé des tranches d''effectifs des établissements (source : SIRENE API)';
COMMENT ON COLUMN s_sirene.lt_trancheeff.code IS 'Code des tranches d''effectifs des établissements';
COMMENT ON COLUMN s_sirene.lt_trancheeff.valeur IS 'Libellé des tranches d''effectifs des établissements';
COMMENT ON COLUMN s_sirene.lt_trancheeff.mediane IS 'Nombre d''emploi affecté par défaut à eff_etab dans la table an_sa_etab à la mise à jour (si pas d''effectifs en source ARC) et à l''intégration des données SIRENE';





-- ################################################# Du schéma m_urbanisme_reg ##################################

-- ################################################################# Domaine valeur - type de consommation  ###############################################

-- Table: m_urbanisme_reg.lt_conso_type

-- DROP TABLE m_urbanisme_reg.lt_conso_type;

CREATE TABLE m_urbanisme_reg.lt_conso_type
(
  l_conso_type character varying(2) NOT NULL, -- Code du type de consommation de surface
  l_conso_type_lib character varying(50), -- Libellé du type de consommation de surface
  CONSTRAINT lt_conso_type_pkkey PRIMARY KEY (l_conso_type) -- Clé primaire de la table l_conso_type
)
WITH (
  OIDS=FALSE
);
ALTER TABLE m_urbanisme_reg.lt_conso_type
  OWNER TO sig_create;

COMMENT ON TABLE m_urbanisme_reg.lt_conso_type
  IS 'Liste de valeurs des types de consommations foncières';
COMMENT ON COLUMN m_urbanisme_reg.lt_conso_type.l_conso_type IS 'Code du type de consommation de surface';
COMMENT ON COLUMN m_urbanisme_reg.lt_conso_type.l_conso_type_lib IS 'Libellé du type de consommation de surface';

COMMENT ON CONSTRAINT lt_conso_type_pkkey ON m_urbanisme_reg.lt_conso_type IS 'Clé primaire de la table l_conso_type';

INSERT INTO m_urbanisme_reg.lt_conso_type(
            l_conso_type, l_conso_type_lib)
    VALUES
    ('00','Non renseigné'),
    ('10','Renouvellement'),
    ('20','Extension'),
    ('30','Mixte');

-- ################################################################# Domaine valeur - phasage opérationnelle  ###############################################

-- Table: m_urbanisme_reg.lt_ope_phase

-- DROP TABLE m_urbanisme_reg.lt_ope_phase;

CREATE TABLE m_urbanisme_reg.lt_ope_phase
(
  l_ope_phase character varying(2) NOT NULL, -- Code de la phase de l'opération
  l_ope_phase_lib character varying(50), -- Libellé de la phase de l'opération
  CONSTRAINT lt_ope_phase_pkkey PRIMARY KEY (l_ope_phase) -- Clé primaire de la table lt_ope_phase
)
WITH (
  OIDS=FALSE
);
ALTER TABLE m_urbanisme_reg.lt_ope_phase
  OWNER TO sig_create;

COMMENT ON TABLE m_urbanisme_reg.lt_ope_phase
  IS 'Liste de valeurs des phases opérationnelles';
COMMENT ON COLUMN m_urbanisme_reg.lt_ope_phase.l_ope_phase IS 'Code de la phase de l''opération';
COMMENT ON COLUMN m_urbanisme_reg.lt_ope_phase.l_ope_phase_lib IS 'Libellé de la phase de l''opération';

COMMENT ON CONSTRAINT lt_ope_phase_pkkey ON m_urbanisme_reg.lt_ope_phase IS 'Clé primaire de la table lt_ope_phase';

INSERT INTO m_urbanisme_reg.lt_ope_phase(
            l_ope_phase, l_ope_phase_lib)
    VALUES
    ('00','Non renseigné'),
    ('10','Etude de faisabilité'),
    ('20','Acquisitions engagées - étude préopérationnelle'),
    ('30','Opérationnelle'),
    ('40','Achevée');


-- ################################################################# Domaine valeur - procédure foncière  ###############################################

-- Table: m_urbanisme_reg.lt_pr_fon_typ

-- DROP TABLE m_urbanisme_reg.lt_pr_fon_typ;

CREATE TABLE m_urbanisme_reg.lt_pr_fon_typ
(
  l_pr_fon_type character varying(2) NOT NULL, -- Code de la procédure foncière
  l_pr_fon_type_lib character varying(50), -- Libellé de la procédure foncière
  CONSTRAINT lt_pr_fon_typ_pkkey PRIMARY KEY (l_pr_fon_type) -- Clé primaire de la table lt_pr_fon_typ
)
WITH (
  OIDS=FALSE
);
ALTER TABLE m_urbanisme_reg.lt_pr_fon_typ
  OWNER TO sig_create;

COMMENT ON TABLE m_urbanisme_reg.lt_pr_fon_typ
  IS 'Liste de valeurs des procédures foncières';
COMMENT ON COLUMN m_urbanisme_reg.lt_pr_fon_typ.l_pr_fon_type IS 'Code de la procédure foncière';
COMMENT ON COLUMN m_urbanisme_reg.lt_pr_fon_typ.l_pr_fon_type_lib IS 'Libellé de la procédure foncière';

COMMENT ON CONSTRAINT lt_pr_fon_typ_pkkey ON m_urbanisme_reg.lt_pr_fon_typ IS 'Clé primaire de la table lt_pr_fon_typ';

INSERT INTO m_urbanisme_reg.lt_pr_fon_typ(
            l_pr_fon_type, l_pr_fon_type_lib)
    VALUES
    ('00','Non renseigné'),
    ('10','DUP'),
    ('20','Convention EPFLO'),
    ('30','Acquisitions amiables'),
    ('40','Opérateur privé');

-- ################################################################# Domaine valeur - type de procédure  ###############################################

-- Table: m_urbanisme_reg.lt_proced

-- DROP TABLE m_urbanisme_reg.lt_proced;

CREATE TABLE m_urbanisme_reg.lt_proced
(
  z_proced character varying(2) NOT NULL, -- Code de la procédure
  proced_lib character varying(20), -- Libellé de la procédure
  CONSTRAINT lt_proced_pkkey PRIMARY KEY (z_proced) -- Clé primaire de la table lt_proced
)
WITH (
  OIDS=FALSE
);
ALTER TABLE m_urbanisme_reg.lt_proced
  OWNER TO sig_create;

COMMENT ON TABLE m_urbanisme_reg.lt_proced
  IS 'Liste de valeurs des types de procédure';
COMMENT ON COLUMN m_urbanisme_reg.lt_proced.z_proced IS 'Code de la procédure';
COMMENT ON COLUMN m_urbanisme_reg.lt_proced.proced_lib IS 'Libellé de la procédure';

COMMENT ON CONSTRAINT lt_proced_pkkey ON m_urbanisme_reg.lt_proced IS 'Clé primaire de la table lt_proced';

INSERT INTO m_urbanisme_reg.lt_proced(
            z_proced, proced_lib)
    VALUES
    ('00','Non renseigné'),
    ('10','ZAC'),
    ('21','Lotissement PA'),
    ('22','Lotissement DP'),
    ('30','PC valant division'),
    ('40','AFU');

-- ################################################################# Domaine valeur - destination  ###############################################

-- cette liste de valeur est inclue dans le projet document d'urbanisme (lt_destdomi)

-- ####################################################################################################################################################
-- ###                                                                                                                                              ###
-- ###                                                                TABLE                                                           ###
-- ###                                                                                                                                              ###
-- ####################################################################################################################################################

-- ################################################# Du schéma r_objet ##################################


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


-- Trigger: t_t1_empesppu_insert_surf on r_objet.geo_objet_empesp_pu

-- DROP TRIGGER t_t1_empesppu_insert_surf ON r_objet.geo_objet_empesp_pu;

CREATE TRIGGER t_t1_empesppu_insert_surf
  BEFORE INSERT
  ON r_objet.geo_objet_empesp_pu
  FOR EACH ROW
  EXECUTE PROCEDURE public.ft_r_sup_m2_maj();



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
  CONSTRAINT geo_objet_fon_lot_pkey PRIMARY KEY (idgeolf),
  CONSTRAINT geo_objet_fon_lot_scrgeom_fkey FOREIGN KEY (src_geom)
      REFERENCES r_objet.lt_src_geom (code) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT lt_objet_vocafon_fkey FOREIGN KEY (l_voca)
      REFERENCES r_objet.lt_objet_vocafon (l_voca) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
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


-- Index: r_objet.geo_objet_fon_lot_geom_idx

-- DROP INDEX r_objet.geo_objet_fon_lot_geom_idx;

CREATE INDEX geo_objet_fon_lot_geom_idx
  ON r_objet.geo_objet_fon_lot
  USING gist
  (geom);


-- Trigger: t_t1_foncier_insert_date_maj on r_objet.geo_objet_fon_lot

-- DROP TRIGGER t_t1_foncier_insert_date_maj ON r_objet.geo_objet_fon_lot;

CREATE TRIGGER t_t1_foncier_insert_date_maj
  BEFORE INSERT OR UPDATE
  ON r_objet.geo_objet_fon_lot
  FOR EACH ROW
  EXECUTE PROCEDURE public.ft_r_timestamp_maj();

-- Trigger: t_t2_foncier_insert_surf on r_objet.geo_objet_fon_lot

-- DROP TRIGGER t_t2_foncier_insert_surf ON r_objet.geo_objet_fon_lot;

CREATE TRIGGER t_t2_foncier_insert_surf
  BEFORE INSERT OR UPDATE OF geom
  ON r_objet.geo_objet_fon_lot
  FOR EACH ROW
  EXECUTE PROCEDURE public.ft_r_sup_m2_maj();

-- Trigger: t_t3_foncier_l_nom on r_objet.geo_objet_fon_lot

-- DROP TRIGGER t_t3_foncier_l_nom ON r_objet.geo_objet_fon_lot;

CREATE TRIGGER t_t3_foncier_l_nom
  BEFORE INSERT OR UPDATE OF l_nom
  ON r_objet.geo_objet_fon_lot
  FOR EACH ROW
  EXECUTE PROCEDURE r_objet.ft_m_foncier_l_nom();

-- Function: r_objet.ft_m_foncier_l_nom()

-- DROP FUNCTION r_objet.ft_m_foncier_l_nom();

CREATE OR REPLACE FUNCTION r_objet.ft_m_foncier_l_nom()
  RETURNS trigger AS
$BODY$BEGIN

IF new.l_nom = '' THEN
new.l_nom = null;
END IF;

RETURN NEW;
END;$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
ALTER FUNCTION r_objet.ft_m_foncier_l_nom()
  OWNER TO sig_create;

COMMENT ON FUNCTION r_objet.ft_m_foncier_l_nom() IS 'Fonction dont l''objet de forcer à null le champ l_nom après effacement par exemple pour éviter les doubles cotes';

-- Trigger: t_t4_suivi on r_objet.geo_objet_fon_lot

-- DROP TRIGGER t_t4_suivi ON r_objet.geo_objet_fon_lot;

CREATE TRIGGER t_t4_suivi
  AFTER INSERT OR UPDATE OR DELETE
  ON r_objet.geo_objet_fon_lot
  FOR EACH ROW
  EXECUTE PROCEDURE m_economie.ft_r_suivi_audit();
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
  EXECUTE PROCEDURE public.ft_r_sup_m2_maj();

-- Trigger: t_t2_geo_objet_ope_date_maj on r_objet.geo_objet_ope

-- DROP TRIGGER t_t2_geo_objet_ope_date_maj ON r_objet.geo_objet_ope;

CREATE TRIGGER t_t2_geo_objet_ope_date_maj
  BEFORE UPDATE
  ON r_objet.geo_objet_ope
  FOR EACH ROW
  EXECUTE PROCEDURE public.ft_r_timestamp_maj();

-- Trigger: t_t3_geo_objet_ope_date_sai on r_objet.geo_objet_ope

-- DROP TRIGGER t_t3_geo_objet_ope_date_sai ON r_objet.geo_objet_ope;

CREATE TRIGGER t_t3_geo_objet_ope_date_sai
  BEFORE INSERT
  ON r_objet.geo_objet_ope
  FOR EACH ROW
  EXECUTE PROCEDURE public.ft_r_timestamp_sai();

-- Function: r_objet.ft_m_vm_site()

-- DROP FUNCTION r_objet.ft_m_vm_site();

CREATE OR REPLACE FUNCTION r_objet.ft_m_vm_site()
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
ALTER FUNCTION r_objet.ft_m_vm_site()
  OWNER TO sig_create;


-- Trigger: t_t4_geo_objet_ope_site on r_objet.geo_objet_ope

-- DROP TRIGGER t_t4_geo_objet_ope_site ON r_objet.geo_objet_ope;

CREATE TRIGGER t_t4_geo_objet_ope_site
  AFTER INSERT OR UPDATE OR DELETE
  ON r_objet.geo_objet_ope
  FOR EACH ROW
  EXECUTE PROCEDURE r_objet.ft_m_vm_site();
			 
-- Function: r_objet.ft_m_geo_vmr_proc()

-- DROP FUNCTION r_objet.ft_m_geo_vmr_proc();

CREATE OR REPLACE FUNCTION r_objet.ft_m_geo_vmr_proc()
  RETURNS trigger AS
$BODY$

BEGIN

    REFRESH MATERIALIZED VIEW x_apps.xapps_geo_vmr_proc;
    return new;
END
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
ALTER FUNCTION r_objet.ft_m_geo_vmr_proc()
  OWNER TO sig_create;
		 

-- Trigger: t_t5_xapps_geo_vmr_proc on r_objet.geo_objet_ope

-- DROP TRIGGER t_t5_xapps_geo_vmr_proc ON r_objet.geo_objet_ope;

CREATE TRIGGER t_t5_xapps_geo_vmr_proc
  AFTER INSERT OR UPDATE OR DELETE
  ON r_objet.geo_objet_ope
  FOR EACH ROW
  EXECUTE PROCEDURE r_objet.ft_m_geo_vmr_proc();
			 
-- Function: r_objet.ft_m_geo_vmr_proc()

-- DROP FUNCTION r_objet.ft_m_geo_vmr_proc();

CREATE OR REPLACE FUNCTION r_objet.ft_m_geo_vmr_proc()
  RETURNS trigger AS
$BODY$

BEGIN

    REFRESH MATERIALIZED VIEW x_apps.xapps_geo_vmr_proc;

    return new;

END
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
ALTER FUNCTION r_objet.ft_m_geo_vmr_proc()
  OWNER TO sig_create;
GRANT EXECUTE ON FUNCTION r_objet.ft_m_geo_vmr_proc() TO public;
GRANT EXECUTE ON FUNCTION r_objet.ft_m_geo_vmr_proc() TO sig_create;
GRANT EXECUTE ON FUNCTION r_objet.ft_m_geo_vmr_proc() TO create_sig;


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
  EXECUTE PROCEDURE public.ft_r_timestamp_sai();

                   
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
  dentree timestamp without time zone, -- Date d'entrée dans le fichier SIRENE
  dsortie timestamp without time zone, -- Date de sortie du fichier SIRENE
  etatadministratifetablissement character varying(1), -- Etat administratif de l'établissement dans le fichier SIEREN (attribut déjà présent dans SIRENE mais dupliqué ici pour le filtrage dans GEO, améliore les performances sans passer par une vue)
  old_siret character varying(14), -- Attribut de gestion servant uniquement temporairement à la récupération des contacts d'un ancien établissement qui aurait disparu pour les remettre dans le nouveau. Cet attribut est vidé parès mise à jour
  old_id integer, -- Attribut de gestion servant uniquement temporairement à la récupération des contacts d'un établissement spécifique non présent dans SIRENE mais apparu par la suite. Cet attribut est vidé parès mise à jour
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
COMMENT ON COLUMN m_economie.an_sa_etab.dentree IS 'Date d''entrée dans le fichier SIRENE';
COMMENT ON COLUMN m_economie.an_sa_etab.dsortie IS 'Date de sortie du fichier SIRENE';
COMMENT ON COLUMN m_economie.an_sa_etab.etatadministratifetablissement IS 'Etat administratif de l''établissement dans le fichier SIEREN (attribut déjà présent dans SIRENE mais dupliqué ici pour le filtrage dans GEO, améliore les performances sans passer par une vue)';
COMMENT ON COLUMN m_economie.an_sa_etab.old_siret IS 'Attribut de gestion servant uniquement temporairement à la récupération des contacts d''un ancien établissement qui aurait disparu pour les remettre dans le nouveau. Cet attribut est vidé parès mise à jour';
COMMENT ON COLUMN m_economie.an_sa_etab.old_id IS 'Attribut de gestion servant uniquement temporairement à la récupération des contacts d''un établissement spécifique non présent dans SIRENE mais apparu par la suite. Cet attribut est vidé parès mise à jour';


-- Trigger: t_t1_an_sa_etab_date_maj on m_economie.an_sa_etab

-- DROP TRIGGER t_t1_an_sa_etab_date_maj ON m_economie.an_sa_etab;

CREATE TRIGGER t_t1_an_sa_etab_date_maj
  BEFORE UPDATE
  ON m_economie.an_sa_etab
  FOR EACH ROW
  EXECUTE PROCEDURE public.ft_r_timestamp_maj();

-- Trigger: t_t1_l_nom_null on m_economie.an_sa_etab

-- DROP TRIGGER t_t1_l_nom_null ON m_economie.an_sa_etab;

CREATE TRIGGER t_t1_l_nom_null
  AFTER UPDATE
  ON m_economie.an_sa_etab
  FOR EACH ROW
  EXECUTE PROCEDURE m_economie.ft_m_an_sa_etab_l_nom_null();
ALTER TABLE m_economie.an_sa_etab DISABLE TRIGGER t_t1_l_nom_null;

-- Trigger: t_t2_suivi on m_economie.an_sa_etab

-- DROP TRIGGER t_t2_suivi ON m_economie.an_sa_etab;

CREATE TRIGGER t_t2_suivi
  AFTER INSERT OR UPDATE OR DELETE
  ON m_economie.an_sa_etab
  FOR EACH ROW
  EXECUTE PROCEDURE m_economie.ft_m_suivi_audit();
ALTER TABLE m_economie.an_sa_etab DISABLE TRIGGER t_t2_suivi;

-- Trigger: t_t4_an_sa_etab_oldsiret on m_economie.an_sa_etab

-- DROP TRIGGER t_t4_an_sa_etab_oldsiret ON m_economie.an_sa_etab;

CREATE TRIGGER t_t4_an_sa_etab_oldsiret
  AFTER UPDATE OF old_siret, old_id
  ON m_economie.an_sa_etab
  FOR EACH ROW
  EXECUTE PROCEDURE m_economie.ft_m_an_sa_etab_oldsiret();

-- Function: m_economie.ft_m_an_sa_etab_oldsiret()

-- DROP FUNCTION m_economie.ft_m_an_sa_etab_oldsiret();

CREATE OR REPLACE FUNCTION m_economie.ft_m_an_sa_etab_oldsiret()
  RETURNS trigger AS
$BODY$BEGIN


IF new.old_siret is not null or new.old_siret <> '' THEN

update m_economie.an_sa_etab set eff_etab = (select eff_etab from m_economie.an_sa_etab where idsiret = new.old_siret) WHERE idsiret=new.idsiret;
update m_economie.an_sa_etab set source_eff = (select source_eff from m_economie.an_sa_etab where idsiret = new.old_siret) WHERE idsiret=new.idsiret;
update m_economie.an_sa_etab set l_date_eff = (select l_date_eff from m_economie.an_sa_etab where idsiret = new.old_siret) WHERE idsiret=new.idsiret;
update m_economie.an_sa_etab set op_sai = (select op_sai from m_economie.an_sa_etab where idsiret = new.old_siret) WHERE idsiret=new.idsiret;
update m_economie.an_sa_etab set org_sai = (select org_sai from m_economie.an_sa_etab where idsiret = new.old_siret) WHERE idsiret=new.idsiret;
update m_economie.an_sa_etab set l_tel = (select l_tel from m_economie.an_sa_etab where idsiret = new.old_siret) WHERE idsiret=new.idsiret;
update m_economie.an_sa_etab set l_mail = (select l_mail from m_economie.an_sa_etab where idsiret = new.old_siret) WHERE idsiret=new.idsiret;
update m_economie.an_sa_etab set l_url = (select l_url from m_economie.an_sa_etab where idsiret = new.old_siret) WHERE idsiret=new.idsiret;
update m_economie.an_sa_etab set l_nom_dir = (select l_nom_dir from m_economie.an_sa_etab where idsiret = new.old_siret) WHERE idsiret=new.idsiret;
update m_economie.an_sa_etab set l_titre = (select l_titre from m_economie.an_sa_etab where idsiret = new.old_siret) WHERE idsiret=new.idsiret;
update m_economie.an_sa_etab set source_maj_dir = (select source_maj_dir from m_economie.an_sa_etab where idsiret = new.old_siret) WHERE idsiret=new.idsiret;
update m_economie.an_sa_etab set date_maj_dir = (select date_maj_dir from m_economie.an_sa_etab where idsiret = new.old_siret) WHERE idsiret=new.idsiret;
update m_economie.an_sa_etab set l_mail_dir = (select l_mail_dir from m_economie.an_sa_etab where idsiret = new.old_siret) WHERE idsiret=new.idsiret;
update m_economie.an_sa_etab set l_tel_dir = (select l_tel_dir from m_economie.an_sa_etab where idsiret = new.old_siret) WHERE idsiret=new.idsiret;
update m_economie.an_sa_etab set l_telp_dir = (select l_telp_dir from m_economie.an_sa_etab where idsiret = new.old_siret) WHERE idsiret=new.idsiret;
update m_economie.an_sa_etab set l_nom_aut = (select l_nom_aut from m_economie.an_sa_etab where idsiret = new.old_siret) WHERE idsiret=new.idsiret;
update m_economie.an_sa_etab set l_titre_aut = (select l_titre_aut from m_economie.an_sa_etab where idsiret = new.old_siret) WHERE idsiret=new.idsiret;
update m_economie.an_sa_etab set date_maj_aut = (select date_maj_aut from m_economie.an_sa_etab where idsiret = new.old_siret) WHERE idsiret=new.idsiret;
update m_economie.an_sa_etab set l_mail_aut = (select l_mail_aut from m_economie.an_sa_etab where idsiret = new.old_siret) WHERE idsiret=new.idsiret;
update m_economie.an_sa_etab set l_tel_aut = (select l_tel_aut from m_economie.an_sa_etab where idsiret = new.old_siret) WHERE idsiret=new.idsiret;
update m_economie.an_sa_etab set l_telp_aut = (select l_telp_aut from m_economie.an_sa_etab where idsiret = new.old_siret) WHERE idsiret=new.idsiret;
update m_economie.an_sa_etab set l_nom_drh = (select l_nom_drh from m_economie.an_sa_etab where idsiret = new.old_siret) WHERE idsiret=new.idsiret;
update m_economie.an_sa_etab set l_titre_drh = (select l_titre_drh from m_economie.an_sa_etab where idsiret = new.old_siret) WHERE idsiret=new.idsiret;
update m_economie.an_sa_etab set date_maj_drh = (select date_maj_drh from m_economie.an_sa_etab where idsiret = new.old_siret) WHERE idsiret=new.idsiret;
update m_economie.an_sa_etab set l_mail_drh = (select l_mail_drh from m_economie.an_sa_etab where idsiret = new.old_siret) WHERE idsiret=new.idsiret;
update m_economie.an_sa_etab set l_tel_drh = (select l_tel_drh from m_economie.an_sa_etab where idsiret = new.old_siret) WHERE idsiret=new.idsiret;
update m_economie.an_sa_etab set l_drh_ss = (select l_drh_ss from m_economie.an_sa_etab where idsiret = new.old_siret) WHERE idsiret=new.idsiret;
update m_economie.an_sa_etab set l_drh_ad = (select l_drh_ad from m_economie.an_sa_etab where idsiret = new.old_siret) WHERE idsiret=new.idsiret;
update m_economie.an_sa_etab set l_nom_ad = (select l_nom_ad from m_economie.an_sa_etab where idsiret = new.old_siret) WHERE idsiret=new.idsiret;
update m_economie.an_sa_etab set l_titre_ad = (select l_titre_ad from m_economie.an_sa_etab where idsiret = new.old_siret) WHERE idsiret=new.idsiret;
update m_economie.an_sa_etab set date_maj_ad = (select date_maj_ad from m_economie.an_sa_etab where idsiret = new.old_siret) WHERE idsiret=new.idsiret;
update m_economie.an_sa_etab set l_mail_ad = (select l_mail_ad from m_economie.an_sa_etab where idsiret = new.old_siret) WHERE idsiret=new.idsiret;
update m_economie.an_sa_etab set l_tel_ad = (select l_tel_ad from m_economie.an_sa_etab where idsiret = new.old_siret) WHERE idsiret=new.idsiret;
update m_economie.an_sa_etab set l_comp_ad = (select l_comp_ad from m_economie.an_sa_etab where idsiret = new.old_siret) WHERE idsiret=new.idsiret;
update m_economie.an_sa_etab set l_url_bil = (select l_url_bil from m_economie.an_sa_etab where idsiret = new.old_siret) WHERE idsiret=new.idsiret;
update m_economie.an_sa_etab set l_observ = (select l_observ from m_economie.an_sa_etab where idsiret = new.old_siret) WHERE idsiret=new.idsiret;

update m_economie.an_sa_etab set eff_etab_d = (select eff_etab_d from m_economie.an_sa_etab where idsiret = new.old_siret) WHERE idsiret=new.idsiret;
update m_economie.an_sa_etab set old_siret = null WHERE idsiret=new.idsiret;


END IF;

IF new.old_id is not null or new.old_id > 0 THEN

update m_economie.an_sa_etab set l_observ = (select l_observ from m_economie.geo_sa_etabp where idgeoet = new.old_id) WHERE idgeoet=new.idgeoet;
update m_economie.an_sa_etab set eff_etab = (select eff_etab from m_economie.geo_sa_etabp where idgeoet = new.old_id) WHERE idgeoet=new.idgeoet;
update m_economie.an_sa_etab set source_eff = (select source_eff from m_economie.geo_sa_etabp where idgeoet = new.old_id) WHERE idgeoet=new.idgeoet;
update m_economie.an_sa_etab set l_date_eff = (select date_eff from m_economie.geo_sa_etabp where idgeoet = new.old_id) WHERE idgeoet=new.idgeoet;
update m_economie.an_sa_etab set op_sai = (select op_sai from m_economie.geo_sa_etabp where idgeoet = new.old_id) WHERE idgeoet=new.idgeoet;
update m_economie.an_sa_etab set org_sai = (select org_sai from m_economie.geo_sa_etabp where idgeoet = new.old_id) WHERE idgeoet=new.idgeoet;
update m_economie.an_sa_etab set l_tel = (select l_tel from m_economie.geo_sa_etabp where idgeoet = new.old_id) WHERE idgeoet=new.idgeoet;
update m_economie.an_sa_etab set l_mail = (select l_mail from m_economie.geo_sa_etabp where idgeoet = new.old_id) WHERE idgeoet=new.idgeoet;
update m_economie.an_sa_etab set l_url = (select l_url from m_economie.geo_sa_etabp where idgeoet = new.old_id) WHERE idgeoet=new.idgeoet;
update m_economie.an_sa_etab set l_nom_dir = (select l_nom_dir from m_economie.geo_sa_etabp where idgeoet = new.old_id) WHERE idgeoet=new.idgeoet;
update m_economie.an_sa_etab set l_titre = (select l_titre from m_economie.geo_sa_etabp where idgeoet = new.old_id) WHERE idgeoet=new.idgeoet;
update m_economie.an_sa_etab set source_maj_dir = (select source_maj_dir from m_economie.geo_sa_etabp where idgeoet = new.old_id) WHERE idgeoet=new.idgeoet;
update m_economie.an_sa_etab set date_maj_dir = (select date_maj_dir from m_economie.geo_sa_etabp where idgeoet = new.old_id) WHERE idgeoet=new.idgeoet;
update m_economie.an_sa_etab set l_mail_dir = (select l_mail_dir from m_economie.geo_sa_etabp where idgeoet = new.old_id) WHERE idgeoet=new.idgeoet;
update m_economie.an_sa_etab set l_tel_dir = (select l_tel_dir from m_economie.geo_sa_etabp where idgeoet = new.old_id) WHERE idgeoet=new.idgeoet;
update m_economie.an_sa_etab set l_telp_dir = (select l_telp_dir from m_economie.geo_sa_etabp where idgeoet = new.old_id) WHERE idgeoet=new.idgeoet;
update m_economie.an_sa_etab set l_nom_aut = (select l_nom_aut from m_economie.geo_sa_etabp where idgeoet = new.old_id) WHERE idgeoet=new.idgeoet;
update m_economie.an_sa_etab set l_titre_aut = (select l_titre_aut from m_economie.geo_sa_etabp where idgeoet = new.old_id) WHERE idgeoet=new.idgeoet;
update m_economie.an_sa_etab set date_maj_aut = (select date_maj_aut from m_economie.geo_sa_etabp where idgeoet = new.old_id) WHERE idgeoet=new.idgeoet;
update m_economie.an_sa_etab set l_mail_aut = (select l_mail_aut from m_economie.geo_sa_etabp where idgeoet = new.old_id) WHERE idgeoet=new.idgeoet;
update m_economie.an_sa_etab set l_tel_aut = (select l_tel_aut from m_economie.geo_sa_etabp where idgeoet = new.old_id) WHERE idgeoet=new.idgeoet;
update m_economie.an_sa_etab set l_telp_aut = (select l_telp_aut from m_economie.geo_sa_etabp where idgeoet = new.old_id) WHERE idgeoet=new.idgeoet;
update m_economie.an_sa_etab set l_nom_drh = (select l_nom_drh from m_economie.geo_sa_etabp where idgeoet = new.old_id) WHERE idgeoet=new.idgeoet;
update m_economie.an_sa_etab set l_titre_drh = (select l_titre_drh from m_economie.geo_sa_etabp where idgeoet = new.old_id) WHERE idgeoet=new.idgeoet;
update m_economie.an_sa_etab set date_maj_drh = (select date_maj_drh from m_economie.geo_sa_etabp where idgeoet = new.old_id) WHERE idgeoet=new.idgeoet;
update m_economie.an_sa_etab set l_mail_drh = (select l_mail_drh from m_economie.geo_sa_etabp where idgeoet = new.old_id) WHERE idgeoet=new.idgeoet;
update m_economie.an_sa_etab set l_tel_drh = (select l_tel_drh from m_economie.geo_sa_etabp where idgeoet = new.old_id) WHERE idgeoet=new.idgeoet;
update m_economie.an_sa_etab set l_drh_ss = (select l_drh_ss from m_economie.geo_sa_etabp where idgeoet = new.old_id) WHERE idgeoet=new.idgeoet;
update m_economie.an_sa_etab set l_drh_ad = (select l_drh_ad from m_economie.geo_sa_etabp where idgeoet = new.old_id) WHERE idgeoet=new.idgeoet;
update m_economie.an_sa_etab set l_nom_ad = (select l_nom_ad from m_economie.geo_sa_etabp where idgeoet = new.old_id) WHERE idgeoet=new.idgeoet;
update m_economie.an_sa_etab set l_titre_ad = (select l_titre_ad from m_economie.geo_sa_etabp where idgeoet = new.old_id) WHERE idgeoet=new.idgeoet;
update m_economie.an_sa_etab set date_maj_ad = (select date_maj_ad from m_economie.geo_sa_etabp where idgeoet = new.old_id) WHERE idgeoet=new.idgeoet;
update m_economie.an_sa_etab set l_mail_ad = (select l_mail_ad from m_economie.geo_sa_etabp where idgeoet = new.old_id) WHERE idgeoet=new.idgeoet;
update m_economie.an_sa_etab set l_tel_ad = (select l_tel_ad from m_economie.geo_sa_etabp where idgeoet = new.old_id) WHERE idgeoet=new.idgeoet;

update m_economie.an_sa_etab set l_comp_ad = (select l_comp_ad from m_economie.geo_sa_etabp where idgeoet = new.old_id) WHERE idgeoet=new.idgeoet;
update m_economie.an_sa_etab set l_url_bil = (select l_url_bil from m_economie.geo_sa_etabp where idgeoet = new.old_id) WHERE idgeoet=new.idgeoet;
update m_economie.an_sa_etab set eff_etab_d = (select eff_etab_d from m_economie.geo_sa_etabp where idgeoet = new.old_id) WHERE idgeoet=new.idgeoet;


update m_economie.an_sa_etab set old_id = null WHERE idgeoet=new.idgeoet;

DELETE FROM m_economie.geo_sa_etabp where idgeoet = new.old_id;

END IF;



return new;
END$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
ALTER FUNCTION m_economie.ft_m_an_sa_etab_oldsiret()
  OWNER TO sig_create;

COMMENT ON FUNCTION m_economie.ft_m_an_sa_etab_oldsiret() IS 'Fonction dont l''objet est de récupérer les anciens contacts d''unb établissement fermé pour les réinscrires au même établissement ayant changer de SIRET';

			 
-- Trigger: t_t5_an_sa_etab_lcompte_local on m_economie.an_sa_etab

-- DROP TRIGGER t_t5_an_sa_etab_lcompte_local ON m_economie.an_sa_etab;

CREATE TRIGGER t_t5_an_sa_etab_lcompte_local
  AFTER UPDATE OF l_compte
  ON m_economie.an_sa_etab
  FOR EACH ROW
  EXECUTE PROCEDURE m_economie.ft_m_etiquette_local();
			 
-- Function: m_economie.ft_m_etiquette_local()

-- DROP FUNCTION m_economie.ft_m_etiquette_local();

CREATE OR REPLACE FUNCTION m_economie.ft_m_etiquette_local()
  RETURNS trigger AS
$BODY$

BEGIN
-- rafraichissement de la vue matérialisée des locaux pour affichage étiquette des noms
REFRESH MATERIALIZED VIEW x_apps.xapps_geo_vmr_local;
-- refraichissement de la vue matérialisée des points établissements à l'adresse
REFRESH MATERIALIZED VIEW x_apps.xapps_geo_vmr_etab_api;

return new;

END;


$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
ALTER FUNCTION m_economie.ft_m_etiquette_local()
  OWNER TO sig_create;




 
			 
-- ################################################# Classe des objets des lots ##################################

-- Table: m_economie.an_sa_lot

-- DROP TABLE m_economie.an_sa_lot;

CREATE TABLE m_economie.an_sa_lot
(
  idgeolf integer NOT NULL, -- Identifiant unique de l'entité géographique lot
  idsite character varying(10), -- Identifiant du site d'activité d'appartenance
  surf integer, -- Surface parcellaire occupée du lot
  l_surf_l character varying(15), -- Surface littérale parcellaire occupée du lot
  date_int date, -- Date renseignée par GéoPicardie lors de l'intégration (correspond aux dernières données reçues)
  op_sai character varying(80), -- Libellé de l'opérateur de saisie
  org_sai character varying(80), -- Libellé de l'organisme de saisie
  l_tact character varying(2) DEFAULT '00'::character varying, -- Type d'activité présent sur le lot
  l_tact_99 character varying(80), -- Précision de l'activité du lot (si Autre sélectionné dans l_tact)
  l_cnom character varying(20), -- Nom de code de l'acquéreur
  l_lnom character varying(80), -- Nom de l'acquéreur
  l_pvente_l character varying(15), -- Prix littéral de vente du lot en HT (ex:50€/m²)
  l_pcess_l character varying(15), -- Prix littéral de cession du lot en HT (ex:30€/m²)
  l_eff_dep integer, -- Effectif de départ prévu par l'implantation de l'établissement lors de l'octroi de la convention de subvention
  l_eff_n5 integer, -- Effectif prévu de l'établissement à n+5 par la convention d'octroi de subvention
  l_conv boolean, -- Accord ou non d'une convention d'octroi de subvention
  l_datefin_conv date, -- Date de fin de la convention d'octroi de subvention, liée à l'effectif n+5
  l_observ character varying(255), -- Observations diverses
  date_sai timestamp without time zone, -- Date de saisie des données attributaires
  date_maj timestamp without time zone, -- Date de mise à jour des données attributaires
  l_bati integer, -- Surface de bâtiments projetée en m²
  l_pc_depot timestamp without time zone, -- Date de dépôt du permis de construire
  l_pc_accord timestamp without time zone, -- Date d'obtention du permis de construire
  l_pc_tra timestamp without time zone, -- Date de commencement des travaux du permis de construire
  l_pc_fin timestamp without time zone, -- Date de fin des travaux du permis de construire
  l_pvente_e numeric(10,2), -- Prix de vente (ou cession) envisagé du lot en HT (€/m²) par le service économique
  l_pcess_e numeric(10,2), -- Prix de cession du lot en HT(€/m²) - plus utilisé (cf prix de cession du foncier)
  l_pc_num character varying(50), -- N° du permis de construire
  l_pc_mo character varying(100), -- Nom du mapitre d'oeuvre (architecte) du PC
  l_pers_v character varying(10), -- Année de la perspective de vente ou de cession
  l_oripro character varying(15), -- Information sur l'origine du projet. 3 valeurs possibles ENDOGENE ou EXOGENE ou non renseignée (pas de listes de valeurs créées, cette liste est paramétrée dans GEO)
  l_occupant character varying(100), -- Libellé de l'occupant (et non acquéreur initial)
  l_descrip character varying(1000), -- Descriptif du bâtiment construit sur le lot
  insee character varying(30), -- Code Insee du ou des communes
  commune character varying(250), -- Libellé de la ou des communes contenant le lot
  CONSTRAINT an_sa_lot_pkey PRIMARY KEY (idgeolf)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE m_economie.an_sa_lot
  OWNER TO sig_create;

COMMENT ON TABLE m_economie.an_sa_lot
  IS 'Table alphanumérique contenant les données des lots à vocation économique';
COMMENT ON COLUMN m_economie.an_sa_lot.idgeolf IS 'Identifiant unique de l''entité géographique lot';
COMMENT ON COLUMN m_economie.an_sa_lot.idsite IS 'Identifiant du site d''activité d''appartenance';
COMMENT ON COLUMN m_economie.an_sa_lot.surf IS 'Surface parcellaire occupée du lot';
COMMENT ON COLUMN m_economie.an_sa_lot.l_surf_l IS 'Surface littérale parcellaire occupée du lot';
COMMENT ON COLUMN m_economie.an_sa_lot.date_int IS 'Date renseignée par GéoPicardie lors de l''intégration (correspond aux dernières données reçues)';
COMMENT ON COLUMN m_economie.an_sa_lot.op_sai IS 'Libellé de l''opérateur de saisie';
COMMENT ON COLUMN m_economie.an_sa_lot.org_sai IS 'Libellé de l''organisme de saisie';
COMMENT ON COLUMN m_economie.an_sa_lot.l_tact IS 'Type d''activité présent sur le lot';
COMMENT ON COLUMN m_economie.an_sa_lot.l_tact_99 IS 'Précision de l''activité du lot (si Autre sélectionné dans l_tact)';
COMMENT ON COLUMN m_economie.an_sa_lot.l_cnom IS 'Nom de code de l''acquéreur';
COMMENT ON COLUMN m_economie.an_sa_lot.l_lnom IS 'Nom de l''acquéreur';
COMMENT ON COLUMN m_economie.an_sa_lot.l_pvente_l IS 'Prix littéral de vente du lot en HT (ex:50€/m²)';
COMMENT ON COLUMN m_economie.an_sa_lot.l_pcess_l IS 'Prix littéral de cession du lot en HT (ex:30€/m²)';
COMMENT ON COLUMN m_economie.an_sa_lot.l_eff_dep IS 'Effectif de départ prévu par l''implantation de l''établissement lors de l''octroi de la convention de subvention';
COMMENT ON COLUMN m_economie.an_sa_lot.l_eff_n5 IS 'Effectif prévu de l''établissement à n+5 par la convention d''octroi de subvention';
COMMENT ON COLUMN m_economie.an_sa_lot.l_conv IS 'Accord ou non d''une convention d''octroi de subvention';
COMMENT ON COLUMN m_economie.an_sa_lot.l_datefin_conv IS 'Date de fin de la convention d''octroi de subvention, liée à l''effectif n+5';
COMMENT ON COLUMN m_economie.an_sa_lot.l_observ IS 'Observations diverses';
COMMENT ON COLUMN m_economie.an_sa_lot.date_sai IS 'Date de saisie des données attributaires';
COMMENT ON COLUMN m_economie.an_sa_lot.date_maj IS 'Date de mise à jour des données attributaires';
COMMENT ON COLUMN m_economie.an_sa_lot.l_bati IS 'Surface de bâtiments projetée en m²';
COMMENT ON COLUMN m_economie.an_sa_lot.l_pc_depot IS 'Date de dépôt du permis de construire';
COMMENT ON COLUMN m_economie.an_sa_lot.l_pc_accord IS 'Date d''obtention du permis de construire';
COMMENT ON COLUMN m_economie.an_sa_lot.l_pc_tra IS 'Date de commencement des travaux du permis de construire';
COMMENT ON COLUMN m_economie.an_sa_lot.l_pc_fin IS 'Date de fin des travaux du permis de construire';
COMMENT ON COLUMN m_economie.an_sa_lot.l_pvente_e IS 'Prix de vente (ou cession) envisagé du lot en HT (€/m²) par le service économique';
COMMENT ON COLUMN m_economie.an_sa_lot.l_pcess_e IS 'Prix de cession du lot en HT(€/m²) - plus utilisé (cf prix de cession du foncier)';
COMMENT ON COLUMN m_economie.an_sa_lot.l_pc_num IS 'N° du permis de construire';
COMMENT ON COLUMN m_economie.an_sa_lot.l_pc_mo IS 'Nom du mapitre d''oeuvre (architecte) du PC';
COMMENT ON COLUMN m_economie.an_sa_lot.l_pers_v IS 'Année de la perspective de vente ou de cession';
COMMENT ON COLUMN m_economie.an_sa_lot.l_oripro IS 'Information sur l''origine du projet. 3 valeurs possibles ENDOGENE ou EXOGENE ou non renseignée (pas de listes de valeurs créées, cette liste est paramétrée dans GEO)';
COMMENT ON COLUMN m_economie.an_sa_lot.l_occupant IS 'Libellé de l''occupant (et non acquéreur initial)';
COMMENT ON COLUMN m_economie.an_sa_lot.l_descrip IS 'Descriptif du bâtiment construit sur le lot';
COMMENT ON COLUMN m_economie.an_sa_lot.insee IS 'Code Insee du ou des communes';
COMMENT ON COLUMN m_economie.an_sa_lot.commune IS 'Libellé de la ou des communes contenant le lot';


-- Trigger: t_t2_suivi on m_economie.an_sa_lot

-- DROP TRIGGER t_t2_suivi ON m_economie.an_sa_lot;

CREATE TRIGGER t_t2_suivi
  AFTER INSERT OR UPDATE OR DELETE
  ON m_economie.an_sa_lot
  FOR EACH ROW
  EXECUTE PROCEDURE m_economie.ft_r_suivi_audit();
ALTER TABLE m_economie.an_sa_lot DISABLE TRIGGER t_t2_suivi;

			 
-- ################################################# Classe des objets des sites ##################################

-- Table: m_economie.an_sa_site

-- DROP TABLE m_economie.an_sa_site;

CREATE TABLE m_economie.an_sa_site
(
  idsite character varying(10) NOT NULL, -- Identifiant du site d'activités
  idpole character varying(7), -- Identifiant du pôle d'appartenance
  site_voca character varying(2) DEFAULT '00'::character varying, -- Code de la vocation simplifiée de la zone
  site_nom character varying(80), -- Libellé du site
  site_etat character varying(2) DEFAULT '00'::character varying, -- Code de l'état du site
  date_int date, -- Date d'intégration par GéoPicardie dans la base (permet de connaître la dernière donnée intégrée)
  op_sai character varying(80), -- Libellé de la personne ayant saisie la mise à jour
  org_sai character varying(80), -- Organisme de saisie dont dépend l'opérateur de saisie
  typo character varying(2) DEFAULT '00'::character varying, -- Typologie du site
  dest character varying(2) DEFAULT '00'::character varying, -- Destination initiale du site (défini dans les documents d'urbanisme)
  p_implant character varying(10), -- Première implantation des entreprises sur le site (année ou date)
  z_mai_ouvr character varying(80), -- Nom du maître d'ouvrage
  z_compet character varying(80), -- Nom de la collectivité ayant dans ses compétences le développement de la zone
  z_amng character varying(80), -- Nom de l'aménageur de la zone
  z_gest character varying(80), -- Nom du gestionnaire de la zone
  z_anim character varying(80), -- Nom de l'animateur de la zone
  z_comm character varying(80), -- Structure de contact pour la commercialisation
  contact character varying(80), -- Libellé de la personne contact pour la commercialisation
  z_cession double precision, -- Conditions de cession en HT (euro/m²)
  z_env character varying(80), -- Démarche environnementale
  z_paysage character varying(80), -- Démarche paysagère
  z_rehab character varying(80), -- Procédure de réhabilitaion du site
  z_epu character varying(3), -- Traitement de l'eau d'épuration
  z_dechet character varying(80), -- Libellé du gestionnaire des déchets
  z_tr_slect character varying(3), -- Présence d'un tri sélectif sur le site
  res_ass double precision, -- Linéaire de réseau d'assainissement
  res_pluvia double precision, -- Linéaire de réseau d'eau pluviale
  res_eau double precision, -- Débit du réseau d'eau potable
  res_gaz double precision, -- Débit du réseau de gaz
  res_elect double precision, -- Débit du réseau électrique
  res_net character varying(80), -- Type de réseau internet
  res_db_net double precision, -- Débit internet
  z_auto character varying(10), -- Libellé de l'autoroute la plus proche
  z_dst_auto double precision, -- Distance en km du diffuseur autoroutier par la route
  z_tps_auto double precision, -- Temps d'accès en minutes du diffuseur autoroutier par la route
  z_ar_f character varying(80), -- Nom de l'aéroport fret le plus proche
  z_dst_ar_f double precision, -- Distance en km de l'aéroport de fret par la route
  z_ar_v character varying(80), -- Nom de l'aéroport de voyageurs le plus proche
  z_dst_ar_v double precision, -- Distance en km de l'aéroport de voyageurs par la route
  z_fr_f character varying(80), -- Gare de fret la plus proche
  z_dst_fr_f double precision, -- Distance en km de la gare de fret la plus proche par la route
  z_fr_v character varying(80), -- Gare de voyageurs la plus proche
  z_dst_fr_v double precision, -- Distance en km de la gare de voyageurs la plus proche par la route
  z_pmm character varying(3), -- Présence d'une plate-forme multimodale
  z_dst_pmm double precision, -- Distance en km de la plate-forme multimodale la plus proche par la route
  serv_tc integer, -- Nombre de ligne de transport en commun desservant le site
  circ_douce character varying(3), -- Accès aux sites par un mode doux (pistes cyclables)
  serv_rest integer, -- Nombre de restaurants ou à proximité immédiate
  serv_crech integer, -- Nombre de crèches ou à proximité immédiate
  serv_autre character varying(80), -- Libellé des autres services disponibles sur le site
  serv_collt character varying(80), -- Services collectifs présent sur le site (mutualisation, partage de services)
  z_aide_pb character varying(2), -- Code de valeurs des aides publiques appliquées sur le site (AFR, ZFU, ZRR, aucun)
  l_dated_aide_pb date, -- Date de début de la période des aides publiques
  l_datef_aide_pb date, -- Date de fin de la période des aides publiques
  date_sai timestamp without time zone, -- Date de saisie des données attributaires
  date_maj timestamp without time zone, -- Date de mise à jour des données attributaires
  d_paris integer, -- Distance en km de paris
  t_paris integer, -- Temps d'accès à Paris en minutes
  d_lille integer, -- Distance en km d'accès à Lille
  t_lille integer, -- Temps d'accès à Lille en minutes
  l_dauto character varying(200), -- Libellé du diffuseur autoroutier le plus proche
  l_dtgvhp integer, -- Distance de la gare RGV Haute Picardie
  l_ttgvhp integer, -- Temps d'accès à la gare TGV Haute Picardie
  l_dtgvcdg integer, -- Distance de la Gare TGV Roissy-Charles de Gaulle
  l_ttgvcdg integer, -- Temps d'accès à la Gare TGV Roissy-Charles de Gaulle
  l_tgcomp integer, -- Temps d'accès à la gare de Compiègne
  l_dtille integer, -- Distance de l'aéroport de Beauvais-Tillé
  l_ttille integer, -- Temps d'accès à l'aéroport de Beauvais-Tillé
  l_dcdg integer, -- Distance de l'aéroport de Roissy-Charles de Gaulle
  l_tcdg integer, -- Temps d'accès à l'aéroport de Roissy-Charles de Gaulle
  l_dlesquin integer, -- Distance de l'aéroport de Lille-Lesquin
  l_tlesquin integer, -- Temps d'accès à l'aéroport Lille-Lesquin
  zae boolean, -- Information sur le fait que le site soit une ZAE (sauf celle indiquée dans la table m_amenagement.geo_amt_zae)  ou non (compétence ARC selon la délibération du CA du 21 décembre 2017). Cette donnée permet de créer une vue matérialisée des ZAE complètes (geo_vmr_zae) avec les informations de la table m_amenagement.geo_amt_zae
  l_cc_aep_lib character varying(100), -- Nom du concessionnaire de l'eau potable
  l_cc_aep_nom character varying(100), -- Nom du contact du concessionnaire d'eau potable
  l_cc_aep_poste character varying(50), -- Libellé du poste du contact du concessionnaire d'eau potable
  l_cc_aep_tel character varying(15), -- Numéro de téléphone du contact du concessionnaire d'eau potable
  l_cc_aep_telp character varying(15), -- Numéro de téléphone portable du contact du concessionnaire d'eau potable
  l_cc_aep_mail character varying(50), -- Mail du contact du concessionnaire d'eau potable
  l_cc_elect_lib character varying(100), -- Nom du concessionnaire d'électricité
  l_cc_elect_nom character varying(100), -- Nom du contact du concessionnaire d'électricité
  l_cc_elect_poste character varying(50), -- Libellé du poste du contact du concessionnaire d'électricité
  l_cc_elect_tel character varying(15), -- Numéro de téléphone du contact du concessionnaire d'électricité
  l_cc_elect_telp character varying(15), -- Numéro de téléphone portable du contact du concessionnaire d'électricité
  l_cc_elect_mail character varying(50), -- Mail du contact du concessionnaire d'électricité
  l_cc_gaz_lib character varying(100), -- Nom du concessionnaire de gaz
  l_cc_gaz_nom character varying(100), -- Nom du contact du concessionnaire de gaz
  l_cc_gaz_poste character varying(50), -- Libellé du poste du contact du concessionnaire de gaz
  l_cc_gaz_tel character varying(15), -- Numéro de téléphone du contact du concessionnaire de gaz
  l_cc_gaz_telp character varying(15), -- Numéro de téléphone portable du contact du concessionnaire de gaz
  l_cc_gaz_mail character varying(50), -- Mail du contact du concessionnaire de gaz
  l_cc_tel_lib character varying(100), -- Nom du concessionnaire télécom
  l_cc_tel_nom character varying(100), -- Nom du contact du concessionnaire télécom
  l_cc_tel_poste character varying(50), -- Libellé du poste du contact du concessionnaire télécom
  l_cc_tel_tel character varying(15), -- Numéro de téléphone du contact du concessionnaire télécom
  l_cc_tel_telp character varying(15), -- Numéro de téléphone portable du contact du concessionnaire télécom
  l_cc_tel_mail character varying(50), -- Mail du contact du concessionnaire télécom
  CONSTRAINT an_sa_site_pkey PRIMARY KEY (idsite) -- Clé primaire de la table geo_sa_p_site

)
WITH (
  OIDS=FALSE
);
ALTER TABLE m_economie.an_sa_site
  OWNER TO sig_create;

COMMENT ON TABLE m_economie.an_sa_site
  IS 'Information alphanumérique sur les Sites d''activités économiques. Les objets virtuels de référence sont gérés dans le schéma r_objet';
COMMENT ON COLUMN m_economie.an_sa_site.idsite IS 'Identifiant du site d''activités';
COMMENT ON COLUMN m_economie.an_sa_site.idpole IS 'Identifiant du pôle d''appartenance';
COMMENT ON COLUMN m_economie.an_sa_site.site_voca IS 'Code de la vocation simplifiée de la zone';
COMMENT ON COLUMN m_economie.an_sa_site.site_nom IS 'Libellé du site';
COMMENT ON COLUMN m_economie.an_sa_site.site_etat IS 'Code de l''état du site';
COMMENT ON COLUMN m_economie.an_sa_site.date_int IS 'Date d''intégration par GéoPicardie dans la base (permet de connaître la dernière donnée intégrée)';
COMMENT ON COLUMN m_economie.an_sa_site.op_sai IS 'Libellé de la personne ayant saisie la mise à jour';
COMMENT ON COLUMN m_economie.an_sa_site.org_sai IS 'Organisme de saisie dont dépend l''opérateur de saisie';
COMMENT ON COLUMN m_economie.an_sa_site.typo IS 'Typologie du site';
COMMENT ON COLUMN m_economie.an_sa_site.dest IS 'Destination initiale du site (défini dans les documents d''urbanisme)';
COMMENT ON COLUMN m_economie.an_sa_site.p_implant IS 'Première implantation des entreprises sur le site (année ou date)';
COMMENT ON COLUMN m_economie.an_sa_site.z_mai_ouvr IS 'Nom du maître d''ouvrage';
COMMENT ON COLUMN m_economie.an_sa_site.z_compet IS 'Nom de la collectivité ayant dans ses compétences le développement de la zone';
COMMENT ON COLUMN m_economie.an_sa_site.z_amng IS 'Nom de l''aménageur de la zone';
COMMENT ON COLUMN m_economie.an_sa_site.z_gest IS 'Nom du gestionnaire de la zone';
COMMENT ON COLUMN m_economie.an_sa_site.z_anim IS 'Nom de l''animateur de la zone';
COMMENT ON COLUMN m_economie.an_sa_site.z_comm IS 'Structure de contact pour la commercialisation';
COMMENT ON COLUMN m_economie.an_sa_site.contact IS 'Libellé de la personne contact pour la commercialisation';
COMMENT ON COLUMN m_economie.an_sa_site.z_cession IS 'Conditions de cession en HT (euro/m²)';
COMMENT ON COLUMN m_economie.an_sa_site.z_env IS 'Démarche environnementale';
COMMENT ON COLUMN m_economie.an_sa_site.z_paysage IS 'Démarche paysagère';
COMMENT ON COLUMN m_economie.an_sa_site.z_rehab IS 'Procédure de réhabilitaion du site';
COMMENT ON COLUMN m_economie.an_sa_site.z_epu IS 'Traitement de l''eau d''épuration';
COMMENT ON COLUMN m_economie.an_sa_site.z_dechet IS 'Libellé du gestionnaire des déchets';
COMMENT ON COLUMN m_economie.an_sa_site.z_tr_slect IS 'Présence d''un tri sélectif sur le site';
COMMENT ON COLUMN m_economie.an_sa_site.res_ass IS 'Linéaire de réseau d''assainissement';
COMMENT ON COLUMN m_economie.an_sa_site.res_pluvia IS 'Linéaire de réseau d''eau pluviale';
COMMENT ON COLUMN m_economie.an_sa_site.res_eau IS 'Débit du réseau d''eau potable';
COMMENT ON COLUMN m_economie.an_sa_site.res_gaz IS 'Débit du réseau de gaz';
COMMENT ON COLUMN m_economie.an_sa_site.res_elect IS 'Débit du réseau électrique';
COMMENT ON COLUMN m_economie.an_sa_site.res_net IS 'Type de réseau internet';
COMMENT ON COLUMN m_economie.an_sa_site.res_db_net IS 'Débit internet';
COMMENT ON COLUMN m_economie.an_sa_site.z_auto IS 'Libellé de l''autoroute la plus proche';
COMMENT ON COLUMN m_economie.an_sa_site.z_dst_auto IS 'Distance en km du diffuseur autoroutier par la route';
COMMENT ON COLUMN m_economie.an_sa_site.z_tps_auto IS 'Temps d''accès en minutes du diffuseur autoroutier par la route';
COMMENT ON COLUMN m_economie.an_sa_site.z_ar_f IS 'Nom de l''aéroport fret le plus proche';
COMMENT ON COLUMN m_economie.an_sa_site.z_dst_ar_f IS 'Distance en km de l''aéroport de fret par la route';
COMMENT ON COLUMN m_economie.an_sa_site.z_ar_v IS 'Nom de l''aéroport de voyageurs le plus proche';
COMMENT ON COLUMN m_economie.an_sa_site.z_dst_ar_v IS 'Distance en km de l''aéroport de voyageurs par la route';
COMMENT ON COLUMN m_economie.an_sa_site.z_fr_f IS 'Gare de fret la plus proche';
COMMENT ON COLUMN m_economie.an_sa_site.z_dst_fr_f IS 'Distance en km de la gare de fret la plus proche par la route';
COMMENT ON COLUMN m_economie.an_sa_site.z_fr_v IS 'Gare de voyageurs la plus proche';
COMMENT ON COLUMN m_economie.an_sa_site.z_dst_fr_v IS 'Distance en km de la gare de voyageurs la plus proche par la route';
COMMENT ON COLUMN m_economie.an_sa_site.z_pmm IS 'Présence d''une plate-forme multimodale';
COMMENT ON COLUMN m_economie.an_sa_site.z_dst_pmm IS 'Distance en km de la plate-forme multimodale la plus proche par la route';
COMMENT ON COLUMN m_economie.an_sa_site.serv_tc IS 'Nombre de ligne de transport en commun desservant le site';
COMMENT ON COLUMN m_economie.an_sa_site.circ_douce IS 'Accès aux sites par un mode doux (pistes cyclables)';
COMMENT ON COLUMN m_economie.an_sa_site.serv_rest IS 'Nombre de restaurants ou à proximité immédiate';
COMMENT ON COLUMN m_economie.an_sa_site.serv_crech IS 'Nombre de crèches ou à proximité immédiate';
COMMENT ON COLUMN m_economie.an_sa_site.serv_autre IS 'Libellé des autres services disponibles sur le site';
COMMENT ON COLUMN m_economie.an_sa_site.serv_collt IS 'Services collectifs présent sur le site (mutualisation, partage de services)';
COMMENT ON COLUMN m_economie.an_sa_site.z_aide_pb IS 'Code de valeurs des aides publiques appliquées sur le site (AFR, ZFU, ZRR, aucun)';
COMMENT ON COLUMN m_economie.an_sa_site.l_dated_aide_pb IS 'Date de début de la période des aides publiques';
COMMENT ON COLUMN m_economie.an_sa_site.l_datef_aide_pb IS 'Date de fin de la période des aides publiques';
COMMENT ON COLUMN m_economie.an_sa_site.date_sai IS 'Date de saisie des données attributaires';
COMMENT ON COLUMN m_economie.an_sa_site.date_maj IS 'Date de mise à jour des données attributaires';
COMMENT ON COLUMN m_economie.an_sa_site.d_paris IS 'Distance en km de paris';
COMMENT ON COLUMN m_economie.an_sa_site.t_paris IS 'Temps d''accès à Paris en minutes';
COMMENT ON COLUMN m_economie.an_sa_site.d_lille IS 'Distance en km d''accès à Lille';
COMMENT ON COLUMN m_economie.an_sa_site.t_lille IS 'Temps d''accès à Lille en minutes';
COMMENT ON COLUMN m_economie.an_sa_site.l_dauto IS 'Libellé du diffuseur autoroutier le plus proche';
COMMENT ON COLUMN m_economie.an_sa_site.l_dtgvhp IS 'Distance de la gare RGV Haute Picardie';
COMMENT ON COLUMN m_economie.an_sa_site.l_ttgvhp IS 'Temps d''accès à la gare TGV Haute Picardie';
COMMENT ON COLUMN m_economie.an_sa_site.l_dtgvcdg IS 'Distance de la Gare TGV Roissy-Charles de Gaulle';
COMMENT ON COLUMN m_economie.an_sa_site.l_ttgvcdg IS 'Temps d''accès à la Gare TGV Roissy-Charles de Gaulle';
COMMENT ON COLUMN m_economie.an_sa_site.l_tgcomp IS 'Temps d''accès à la gare de Compiègne';
COMMENT ON COLUMN m_economie.an_sa_site.l_dtille IS 'Distance de l''aéroport de Beauvais-Tillé';
COMMENT ON COLUMN m_economie.an_sa_site.l_ttille IS 'Temps d''accès à l''aéroport de Beauvais-Tillé';
COMMENT ON COLUMN m_economie.an_sa_site.l_dcdg IS 'Distance de l''aéroport de Roissy-Charles de Gaulle';
COMMENT ON COLUMN m_economie.an_sa_site.l_tcdg IS 'Temps d''accès à l''aéroport de Roissy-Charles de Gaulle';
COMMENT ON COLUMN m_economie.an_sa_site.l_dlesquin IS 'Distance de l''aéroport de Lille-Lesquin';
COMMENT ON COLUMN m_economie.an_sa_site.l_tlesquin IS 'Temps d''accès à l''aéroport Lille-Lesquin';
COMMENT ON COLUMN m_economie.an_sa_site.zae IS 'Information sur le fait que le site soit une ZAE (sauf celle indiquée dans la table m_amenagement.geo_amt_zae)  ou non (compétence ARC selon la délibération du CA du 21 décembre 2017). Cette donnée permet de créer une vue matérialisée des ZAE complètes (geo_vmr_zae) avec les informations de la table m_amenagement.geo_amt_zae';
COMMENT ON COLUMN m_economie.an_sa_site.l_cc_aep_lib IS 'Nom du concessionnaire de l''eau potable';
COMMENT ON COLUMN m_economie.an_sa_site.l_cc_aep_nom IS 'Nom du contact du concessionnaire d''eau potable';
COMMENT ON COLUMN m_economie.an_sa_site.l_cc_aep_poste IS 'Libellé du poste du contact du concessionnaire d''eau potable';
COMMENT ON COLUMN m_economie.an_sa_site.l_cc_aep_tel IS 'Numéro de téléphone du contact du concessionnaire d''eau potable';
COMMENT ON COLUMN m_economie.an_sa_site.l_cc_aep_telp IS 'Numéro de téléphone portable du contact du concessionnaire d''eau potable';
COMMENT ON COLUMN m_economie.an_sa_site.l_cc_aep_mail IS 'Mail du contact du concessionnaire d''eau potable';
COMMENT ON COLUMN m_economie.an_sa_site.l_cc_elect_lib IS 'Nom du concessionnaire d''électricité';
COMMENT ON COLUMN m_economie.an_sa_site.l_cc_elect_nom IS 'Nom du contact du concessionnaire d''électricité';
COMMENT ON COLUMN m_economie.an_sa_site.l_cc_elect_poste IS 'Libellé du poste du contact du concessionnaire d''électricité';
COMMENT ON COLUMN m_economie.an_sa_site.l_cc_elect_tel IS 'Numéro de téléphone du contact du concessionnaire d''électricité';
COMMENT ON COLUMN m_economie.an_sa_site.l_cc_elect_telp IS 'Numéro de téléphone portable du contact du concessionnaire d''électricité';
COMMENT ON COLUMN m_economie.an_sa_site.l_cc_elect_mail IS 'Mail du contact du concessionnaire d''électricité';
COMMENT ON COLUMN m_economie.an_sa_site.l_cc_gaz_lib IS 'Nom du concessionnaire de gaz';
COMMENT ON COLUMN m_economie.an_sa_site.l_cc_gaz_nom IS 'Nom du contact du concessionnaire de gaz';
COMMENT ON COLUMN m_economie.an_sa_site.l_cc_gaz_poste IS 'Libellé du poste du contact du concessionnaire de gaz';
COMMENT ON COLUMN m_economie.an_sa_site.l_cc_gaz_tel IS 'Numéro de téléphone du contact du concessionnaire de gaz';
COMMENT ON COLUMN m_economie.an_sa_site.l_cc_gaz_telp IS 'Numéro de téléphone portable du contact du concessionnaire de gaz';
COMMENT ON COLUMN m_economie.an_sa_site.l_cc_gaz_mail IS 'Mail du contact du concessionnaire de gaz';
COMMENT ON COLUMN m_economie.an_sa_site.l_cc_tel_lib IS 'Nom du concessionnaire télécom';
COMMENT ON COLUMN m_economie.an_sa_site.l_cc_tel_nom IS 'Nom du contact du concessionnaire télécom';
COMMENT ON COLUMN m_economie.an_sa_site.l_cc_tel_poste IS 'Libellé du poste du contact du concessionnaire télécom';
COMMENT ON COLUMN m_economie.an_sa_site.l_cc_tel_tel IS 'Numéro de téléphone du contact du concessionnaire télécom';
COMMENT ON COLUMN m_economie.an_sa_site.l_cc_tel_telp IS 'Numéro de téléphone portable du contact du concessionnaire télécom';
COMMENT ON COLUMN m_economie.an_sa_site.l_cc_tel_mail IS 'Mail du contact du concessionnaire télécom';

COMMENT ON CONSTRAINT an_sa_site_pkey ON m_economie.an_sa_site IS 'Clé primaire de la table geo_sa_p_site';


CREATE TRIGGER t_t1_suivi
  AFTER INSERT OR UPDATE OR DELETE
  ON m_economie.an_sa_site
  FOR EACH ROW
  EXECUTE PROCEDURE m_economie.ft_r_suivi_audit();

			 
-- ################################################# Classe des objets des documents de sites ##################################

-- Table: m_economie.an_site_doc_media

-- DROP TABLE m_economie.an_site_doc_media;

CREATE TABLE m_economie.an_site_doc_media
(
  id character varying(10), -- Identifiant de site
  media text, -- Champ Média de GEO
  miniature bytea, -- Champ miniature de GEO
  n_fichier text, -- Nom du fichier
  t_fichier text, -- Type de média dans GEO
  op_sai character varying(20), -- Opérateur de saisie (par défaut login de connexion à GEO)
  l_doc character varying(100), -- nom ou léger descriptif du document
  date_sai timestamp without time zone, -- Date de la saisie du document
  d_photo timestamp without time zone, -- Date de la prise de vue
  gid integer NOT NULL DEFAULT nextval('m_economie.an_site_doc_media_gig_seq'::regclass), -- Compteur (identifiant interne)
  CONSTRAINT an_site_doc_media_pkey PRIMARY KEY (gid)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE m_economie.an_site_doc_media
  OWNER TO sig_create;

COMMENT ON TABLE m_economie.an_site_doc_media
  IS 'Table gérant les documents des sites d''activité (photo notamment) dans le module MEDIA dans GEO avec stockage des documents dans une arborescence de fichiers (saisie de docs par les utilisateurs)';
COMMENT ON COLUMN m_economie.an_site_doc_media.id IS 'Identifiant de site';
COMMENT ON COLUMN m_economie.an_site_doc_media.media IS 'Champ Média de GEO';
COMMENT ON COLUMN m_economie.an_site_doc_media.miniature IS 'Champ miniature de GEO';
COMMENT ON COLUMN m_economie.an_site_doc_media.n_fichier IS 'Nom du fichier';
COMMENT ON COLUMN m_economie.an_site_doc_media.t_fichier IS 'Type de média dans GEO';
COMMENT ON COLUMN m_economie.an_site_doc_media.op_sai IS 'Opérateur de saisie (par défaut login de connexion à GEO)';
COMMENT ON COLUMN m_economie.an_site_doc_media.l_doc IS 'nom ou léger descriptif du document';
COMMENT ON COLUMN m_economie.an_site_doc_media.date_sai IS 'Date de la saisie du document';
COMMENT ON COLUMN m_economie.an_site_doc_media.d_photo IS 'Date de la prise de vue';
COMMENT ON COLUMN m_economie.an_site_doc_media.gid IS 'Compteur (identifiant interne)';


-- Trigger: t_t1_an_site_doc_media_date_sai on m_economie.an_site_doc_media

-- DROP TRIGGER t_t1_an_site_doc_media_date_sai ON m_economie.an_site_doc_media;

CREATE TRIGGER t_t1_an_site_doc_media_date_sai
  BEFORE INSERT
  ON m_economie.an_site_doc_media
  FOR EACH ROW
  EXECUTE PROCEDURE public.ft_r_timestamp_sai();

			 
-- ################################################# Classe des objets de la bourse aux locaux ##################################

-- Table: m_economie.geo_sa_bal

-- DROP TABLE m_economie.geo_sa_bal;

CREATE TABLE m_economie.geo_sa_bal
(
  idgeobal integer NOT NULL, -- Identifiant géographique
  idsite character varying(10), -- Identifiant du site d'activité d'appartenance
  date_maj timestamp without time zone, -- Date de mise à jour
  op_sai character varying(50), -- Opérateur de saisie
  org_sai character varying(100), -- Organisme de saisie
  contact character varying(50), -- Libellé du Contact ARC
  l_nom_loc character varying(255), -- Libellé du local
  l_nom_prop character varying(80), -- Libellé du propriétaire du local
  tel_prop character varying(15), -- Numéro de téléphone du propriétaire
  mail_prop character varying(80), -- Adresse email du propriétaire
  code_comm character varying(2) DEFAULT '00'::character varying, -- Code de valeur du nom du commercialisateur
  code_comm_99 character varying(50), -- Précision du code de valeur 99 pour le nom du commercialisateur
  tel_comm character varying(14), -- Numéro de téléphone du commercialisateur
  mail_comm character varying(80), -- Adresse email du commercialisateur
  date_maj_loc timestamp without time zone, -- Date de mise à jour des données sur le local
  etat_comm character varying(2) DEFAULT '00'::character varying, -- Code de valeur de l'état de commercialisation du local
  date_dispo timestamp without time zone, -- Date de disponibilité du local si pas immédiate
  source_maj character varying(2) DEFAULT '00'::character varying, -- Code de valeur de la source de la mise à jour du local
  source_maj_99 character varying(50), -- Précision du code de valeur 99 pour la source de la mise à jour du local
  url_1 character varying(500), -- Lien 1 internet vers une présentation du local
  url_2 character varying(500), -- Lien 2 internet vers une présentation du local
  url_3 character varying(500), -- Lien 3 internet vers une présentation du local
  surf_loc integer, -- Surface totale disponible du local en m²
  divisible boolean DEFAULT false, -- Information sur la disponibilité du local (oui ou non)
  surf_div_min integer, -- Surface minimale disponible du local en m² (si divisible)
  type_loc character varying(20) DEFAULT '00'::character varying, -- Code de valeur du type de local
  adres character varying(255), -- Libellé de l'adresse du local
  insee character varying(5), -- Code Insee de la commune
  commune character varying(100), -- Libellé de la commune
  dispo_loc boolean DEFAULT false, -- Information si le local est disponible à la location (oui ou non)
  loyer_annuel_s integer, -- Montant du loyer mensuel en HT/m²/mois
  loyer_annuel integer, -- Montant du loyer annuel en HT/m²/an
  p_vente_s integer, -- Prix de vente du local en HT/m²
  p_vente integer, -- Prix de vente du local en HT
  nom_etab_prec character varying(80), -- Nom de l'établissement précédent du local
  act_etab_prec character varying(80), -- Activité de l'établissement occupant précédemment le local
  description_loc character varying(500), -- Descriptif du local
  nom_etab_nego character varying(255), -- Nom du ou des établissement(s) avec le(s)quel(s) les négociations sont en cours
  date_accord timestamp without time zone, -- Date de l'aboutissement des négociations
  nom_etab_preneur character varying(80), -- Nom de l'établissement avec lequel les négociations ont abouti
  act_etab_preneur character varying(80), -- Activité de l'établissement avec lequel les négociations ont abouti
  geom geometry(Point,2154), -- Champ contenant la géométrie des objets
  date_sai timestamp without time zone, -- Date de saisie des données
  src_geom character varying(2) DEFAULT '20'::character varying, -- Référentiel spatial utilisé pour la saisie
  bail_com_m double precision, -- Montant du bail commercial
  dispo_vte character varying(20), -- Disponibilité à la vente (oui, non, oui occupé)
  CONSTRAINT geo_sa_bal_pkey PRIMARY KEY (idgeobal)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE m_economie.geo_sa_bal
  OWNER TO sig_create;

COMMENT ON TABLE m_economie.geo_sa_bal
  IS 'Table contenant la localisation des locaux contenus dans la BAL (bourse aux locaux)';
COMMENT ON COLUMN m_economie.geo_sa_bal.idgeobal IS 'Identifiant géographique';
COMMENT ON COLUMN m_economie.geo_sa_bal.idsite IS 'Identifiant du site d''activité d''appartenance';
COMMENT ON COLUMN m_economie.geo_sa_bal.date_maj IS 'Date de mise à jour';
COMMENT ON COLUMN m_economie.geo_sa_bal.op_sai IS 'Opérateur de saisie';
COMMENT ON COLUMN m_economie.geo_sa_bal.org_sai IS 'Organisme de saisie';
COMMENT ON COLUMN m_economie.geo_sa_bal.contact IS 'Libellé du Contact ARC';
COMMENT ON COLUMN m_economie.geo_sa_bal.l_nom_loc IS 'Libellé du local';
COMMENT ON COLUMN m_economie.geo_sa_bal.l_nom_prop IS 'Libellé du propriétaire du local';
COMMENT ON COLUMN m_economie.geo_sa_bal.tel_prop IS 'Numéro de téléphone du propriétaire';
COMMENT ON COLUMN m_economie.geo_sa_bal.mail_prop IS 'Adresse email du propriétaire';
COMMENT ON COLUMN m_economie.geo_sa_bal.code_comm IS 'Code de valeur du nom du commercialisateur';
COMMENT ON COLUMN m_economie.geo_sa_bal.code_comm_99 IS 'Précision du code de valeur 99 pour le nom du commercialisateur';
COMMENT ON COLUMN m_economie.geo_sa_bal.tel_comm IS 'Numéro de téléphone du commercialisateur';
COMMENT ON COLUMN m_economie.geo_sa_bal.mail_comm IS 'Adresse email du commercialisateur';
COMMENT ON COLUMN m_economie.geo_sa_bal.date_maj_loc IS 'Date de mise à jour des données sur le local';
COMMENT ON COLUMN m_economie.geo_sa_bal.etat_comm IS 'Code de valeur de l''état de commercialisation du local';
COMMENT ON COLUMN m_economie.geo_sa_bal.date_dispo IS 'Date de disponibilité du local si pas immédiate';
COMMENT ON COLUMN m_economie.geo_sa_bal.source_maj IS 'Code de valeur de la source de la mise à jour du local';
COMMENT ON COLUMN m_economie.geo_sa_bal.source_maj_99 IS 'Précision du code de valeur 99 pour la source de la mise à jour du local';
COMMENT ON COLUMN m_economie.geo_sa_bal.url_1 IS 'Lien 1 internet vers une présentation du local';
COMMENT ON COLUMN m_economie.geo_sa_bal.url_2 IS 'Lien 2 internet vers une présentation du local';
COMMENT ON COLUMN m_economie.geo_sa_bal.url_3 IS 'Lien 3 internet vers une présentation du local';
COMMENT ON COLUMN m_economie.geo_sa_bal.surf_loc IS 'Surface totale disponible du local en m²';
COMMENT ON COLUMN m_economie.geo_sa_bal.divisible IS 'Information sur la disponibilité du local (oui ou non)';
COMMENT ON COLUMN m_economie.geo_sa_bal.surf_div_min IS 'Surface minimale disponible du local en m² (si divisible)';
COMMENT ON COLUMN m_economie.geo_sa_bal.type_loc IS 'Code de valeur du type de local';
COMMENT ON COLUMN m_economie.geo_sa_bal.adres IS 'Libellé de l''adresse du local';
COMMENT ON COLUMN m_economie.geo_sa_bal.insee IS 'Code Insee de la commune';
COMMENT ON COLUMN m_economie.geo_sa_bal.commune IS 'Libellé de la commune';
COMMENT ON COLUMN m_economie.geo_sa_bal.dispo_loc IS 'Information si le local est disponible à la location (oui ou non)';
COMMENT ON COLUMN m_economie.geo_sa_bal.loyer_annuel_s IS 'Montant du loyer mensuel en HT/m²/mois';
COMMENT ON COLUMN m_economie.geo_sa_bal.loyer_annuel IS 'Montant du loyer annuel en HT/m²/an';
COMMENT ON COLUMN m_economie.geo_sa_bal.p_vente_s IS 'Prix de vente du local en HT/m²';
COMMENT ON COLUMN m_economie.geo_sa_bal.p_vente IS 'Prix de vente du local en HT';
COMMENT ON COLUMN m_economie.geo_sa_bal.nom_etab_prec IS 'Nom de l''établissement précédent du local';
COMMENT ON COLUMN m_economie.geo_sa_bal.act_etab_prec IS 'Activité de l''établissement occupant précédemment le local';
COMMENT ON COLUMN m_economie.geo_sa_bal.description_loc IS 'Descriptif du local';
COMMENT ON COLUMN m_economie.geo_sa_bal.nom_etab_nego IS 'Nom du ou des établissement(s) avec le(s)quel(s) les négociations sont en cours';
COMMENT ON COLUMN m_economie.geo_sa_bal.date_accord IS 'Date de l''aboutissement des négociations';
COMMENT ON COLUMN m_economie.geo_sa_bal.nom_etab_preneur IS 'Nom de l''établissement avec lequel les négociations ont abouti';
COMMENT ON COLUMN m_economie.geo_sa_bal.act_etab_preneur IS 'Activité de l''établissement avec lequel les négociations ont abouti';
COMMENT ON COLUMN m_economie.geo_sa_bal.geom IS 'Champ contenant la géométrie des objets';
COMMENT ON COLUMN m_economie.geo_sa_bal.date_sai IS 'Date de saisie des données';
COMMENT ON COLUMN m_economie.geo_sa_bal.src_geom IS 'Référentiel spatial utilisé pour la saisie';
COMMENT ON COLUMN m_economie.geo_sa_bal.bail_com_m IS 'Montant du bail commercial';
COMMENT ON COLUMN m_economie.geo_sa_bal.dispo_vte IS 'Disponibilité à la vente (oui, non, oui occupé)';

			 
-- Function: m_economie.ft_m_bal_insert()

-- DROP FUNCTION m_economie.ft_m_bal_insert();

CREATE OR REPLACE FUNCTION m_economie.ft_m_bal_insert()
  RETURNS trigger AS
$BODY$

DECLARE v_idgeolf integer;

BEGIN

    v_idgeolf := (SELECT nextval('idgeo_seq'::regclass));

    new.idgeobal = v_idgeolf;

    -- insertion du numéro du site
    new.idsite := (SELECT DISTINCT
				an_sa_site.idsite 
		  FROM 
				m_economie.an_sa_site, r_objet.geo_objet_ope
		  WHERE
				geo_objet_ope.idsite=an_sa_site.idsite
		  AND
				st_intersects(geo_objet_ope.geom,new.geom) = true
		  );
     -- insertion du code insee
     new.insee :=	(SELECT DISTINCT
				geo_osm_commune.insee AS insee
			FROM 
				r_osm.geo_osm_commune
			WHERE 
				st_intersects(new.geom,r_osm.geo_osm_commune.geom) = true
                        ); 

    -- recherche du libellé de la commune
    new.commune :=	(SELECT DISTINCT
				geo_osm_commune.commune AS commune
			FROM 
				r_osm.geo_osm_commune
			WHERE 
				st_intersects(new.geom,r_osm.geo_osm_commune.geom) = true
                        ); 
     
    return new ;
END;




$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
ALTER FUNCTION m_economie.ft_m_bal_insert()
  OWNER TO sig_create;




-- Trigger: t_t1_bal_insert on m_economie.geo_sa_bal

-- DROP TRIGGER t_t1_bal_insert ON m_economie.geo_sa_bal;

CREATE TRIGGER t_t1_bal_insert
  BEFORE INSERT
  ON m_economie.geo_sa_bal
  FOR EACH ROW
  EXECUTE PROCEDURE m_economie.ft_m_bal_insert();

-- Trigger: t_t2_bal_insert_date_sai on m_economie.geo_sa_bal

-- DROP TRIGGER t_t2_bal_insert_date_sai ON m_economie.geo_sa_bal;

CREATE TRIGGER t_t2_bal_insert_date_sai
  BEFORE INSERT
  ON m_economie.geo_sa_bal
  FOR EACH ROW
  EXECUTE PROCEDURE public.ft_r_timestamp_sai();

				 
-- Function: m_economie.m_bal_update()

-- DROP FUNCTION m_economie.m_bal_update();

CREATE OR REPLACE FUNCTION m_economie.ft_m_bal_update()
  RETURNS trigger AS
$BODY$

BEGIN

    -- insertion du numéro du site
    new.idsite := (SELECT DISTINCT
				an_sa_site.idsite 
		  FROM 
				m_economie.an_sa_site, r_objet.geo_objet_ope
		  WHERE
				geo_objet_ope.idsite=an_sa_site.idsite
		  AND
				st_intersects(geo_objet_ope.geom,new.geom) = true
		  );
     -- insertion du code insee
     new.insee :=	(SELECT DISTINCT
				geo_osm_commune.insee AS insee
			FROM 
				r_osm.geo_osm_commune
			WHERE 
				st_intersects(new.geom,r_osm.geo_osm_commune.geom) = true
                        ); 

    -- recherche du libellé de la commune
    new.commune :=	(SELECT DISTINCT
				geo_osm_commune.commune AS commune
			FROM 
				r_osm.geo_osm_commune
			WHERE 
				st_intersects(new.geom,r_osm.geo_osm_commune.geom) = true
                        ); 
    return new ;
END;




$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
ALTER FUNCTION m_economie.ft_m_bal_update()
  OWNER TO sig_create;


				 
-- Trigger: t_t3_bal_update on m_economie.geo_sa_bal

-- DROP TRIGGER t_t3_bal_update ON m_economie.geo_sa_bal;

CREATE TRIGGER t_t3_bal_update
  BEFORE UPDATE
  ON m_economie.geo_sa_bal
  FOR EACH ROW
  EXECUTE PROCEDURE m_economie.ft_m_bal_update();

-- Trigger: t_t4_bal_update_date_maj on m_economie.geo_sa_bal

-- DROP TRIGGER t_t4_bal_update_date_maj ON m_economie.geo_sa_bal;

CREATE TRIGGER t_t4_bal_update_date_maj
  BEFORE UPDATE
  ON m_economie.geo_sa_bal
  FOR EACH ROW
  EXECUTE PROCEDURE public.ft_r_timestamp_maj();

-- Trigger: t_t5_suivi on m_economie.geo_sa_bal

-- DROP TRIGGER t_t5_suivi ON m_economie.geo_sa_bal;

CREATE TRIGGER t_t5_suivi
  AFTER INSERT OR UPDATE OR DELETE
  ON m_economie.geo_sa_bal
  FOR EACH ROW
  EXECUTE PROCEDURE m_economie.ft_r_suivi_audit();

				 
-- ################################################# Classe des objets des établissements spécifiques ##################################

-- Table: m_economie.geo_sa_local

-- DROP TABLE m_economie.geo_sa_local;

CREATE TABLE m_economie.geo_sa_local
(
  idgeoloc integer NOT NULL DEFAULT nextval('idgeo_seq'::regclass), -- Identifiant unique du local
  idgeolf integer, -- Identifiant unique du lot foncier d'appartenance
  usage character varying(100), -- Usage du local si pas d'occupants identifiés
  sup_m2 double precision, -- Surface en m² du local
  geom geometry(Polygon,2154), -- Champ stockant la géométrie des objets
  l_occupp character varying(255), -- Libellé du bâtiment ou occupant principale
  CONSTRAINT geo_sa_local_pkey PRIMARY KEY (idgeoloc)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE m_economie.geo_sa_local
  OWNER TO sig_create;

COMMENT ON TABLE m_economie.geo_sa_local
  IS 'Table géographique contenant la localisation des locaux. Par défaut les objets reprennent ceux des lots fonciers. Au besoin des sous-découpages sont créés (galerie commerciale, division de lots, ...)';
COMMENT ON COLUMN m_economie.geo_sa_local.idgeoloc IS 'Identifiant unique du local';
COMMENT ON COLUMN m_economie.geo_sa_local.idgeolf IS 'Identifiant unique du lot foncier d''appartenance';
COMMENT ON COLUMN m_economie.geo_sa_local.usage IS 'Usage du local si pas d''occupants identifiés';
COMMENT ON COLUMN m_economie.geo_sa_local.sup_m2 IS 'Surface en m² du local';
COMMENT ON COLUMN m_economie.geo_sa_local.geom IS 'Champ stockant la géométrie des objets';
COMMENT ON COLUMN m_economie.geo_sa_local.l_occupp IS 'Libellé du bâtiment ou occupant principale';


-- Trigger: t_t1_local_insert_update_etab on m_economie.geo_sa_local

-- DROP TRIGGER t_t1_local_insert_update_etab ON m_economie.geo_sa_local;

CREATE TRIGGER t_t1_local_insert_update_etab
  BEFORE INSERT OR UPDATE OF geom
  ON m_economie.geo_sa_local
  FOR EACH ROW
  EXECUTE PROCEDURE m_economie.ft_m_local_insert_update();

-- Trigger: t_t2_local_delete_etab on m_economie.geo_sa_local

-- DROP TRIGGER t_t2_local_delete_etab ON m_economie.geo_sa_local;

CREATE TRIGGER t_t2_local_delete_etab
  AFTER DELETE
  ON m_economie.geo_sa_local
  FOR EACH ROW
  EXECUTE PROCEDURE m_economie.ft_m_local_delete_etab();

-- Trigger: t_t3_etiquette_local_refresh on m_economie.geo_sa_local

-- DROP TRIGGER t_t3_etiquette_local_refresh ON m_economie.geo_sa_local;

CREATE TRIGGER t_t3_etiquette_local_refresh
  AFTER INSERT OR UPDATE
  ON m_economie.geo_sa_local
  FOR EACH ROW
  EXECUTE PROCEDURE m_economie.ft_m_etiquette_local();

-- Function: m_economie.ft_m_local_insert_update()

-- DROP FUNCTION m_economie.ft_m_local_insert_update();

CREATE OR REPLACE FUNCTION m_economie.ft_m_local_insert_update()
  RETURNS trigger AS
$BODY$


DECLARE v_idgeolf integer;
BEGIN



	-- mise à jour des appartenances des établissements à l'adresse dans la table lk_localsiret
	-- si le local ne contient pas d'adresse, ne supprime pas les relations du local avec les établissements si non oui 

        -- à la mise à jour
        IF (TG_OP = 'UPDATE') THEN
	-- si il n'y a pas d'adresse sur le lot je ne fais rien pour conserver éventuellement les établissements affectés à ce local manuellement dans GEO
	IF 
		(SELECT count(*) FROM m_economie.geo_sa_local l , x_apps.xapps_geo_vmr_adresse a
		WHERE st_intersects(new.geom,a.geom))= 0
	THEN
		INSERT INTO m_economie.lk_localsiret (idgeoloc,siret)
		SELECT DISTINCT new.idgeoloc,lk.siret FROM m_economie.geo_sa_local l , x_apps.xapps_geo_vmr_adresse a , m_economie.lk_adresseetablissement lk
		WHERE st_intersects(new.geom,a.geom) AND a.id_adresse = lk.idadresse;


        ELSE 
		DELETE FROM m_economie.lk_localsiret lk WHERE lk.idgeoloc = old.idgeoloc;
		INSERT INTO m_economie.lk_localsiret (idgeoloc,siret)
		SELECT DISTINCT new.idgeoloc, lk.siret FROM m_economie.geo_sa_local l , x_apps.xapps_geo_vmr_adresse a , m_economie.lk_adresseetablissement lk
		WHERE st_intersects(new.geom,a.geom) AND a.id_adresse = lk.idadresse;
	END IF;
	END IF;

	-- à l'insertion
	IF (TG_OP = 'INSERT') THEN
	        v_idgeolf = (SELECT l.idgeolf FROM r_objet.geo_objet_fon_lot l WHERE st_intersects(l.geom,st_pointonsurface(new.geom)));
		-- mise à jour des appartenances des établissements à l'adresse dans la table lk_localsiret
                new.idgeolf = v_idgeolf;
                -- si il existe des siret accrochés à l'ancien lot foncier les réaafecter à ce local si non j'insère par défaut
                -- si il n'y a pas d'adresse sur le lot je ne fais rien pour conserver éventuellement les établissements affectés à ce local manuellement dans GEO
		IF 
			
			(SELECT count(*) FROM m_economie.geo_sa_local l , x_apps.xapps_geo_vmr_adresse a
			WHERE st_intersects(new.geom,a.geom)) = 0
		THEN

			UPDATE m_economie.lk_localsiret SET idgeoloc = new.idgeoloc WHERE idgeoloc = v_idgeolf;


		ELSE
			DELETE FROM m_economie.lk_localsiret WHERE idgeoloc = v_idgeolf;
			INSERT INTO m_economie.lk_localsiret (idgeoloc,siret)
			SELECT DISTINCT new.idgeoloc, lk.siret FROM m_economie.geo_sa_local l , x_apps.xapps_geo_vmr_adresse a , m_economie.lk_adresseetablissement lk
			WHERE st_intersects(new.geom,a.geom) AND a.id_adresse = lk.idadresse;
			
		END IF;
		



	END IF ;

RETURN NEW;
END;$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
ALTER FUNCTION m_economie.ft_m_local_insert_update()
  OWNER TO sig_create;

COMMENT ON FUNCTION m_economie.ft_m_local_insert_update() IS 'Fonction dont l''objet de rechercher les établissements dans le local si celui-ci croise une adresse et de les intégrer dans la table lk_localsiret';

					    
-- Function: m_economie.ft_m_local_delete_etab()

-- DROP FUNCTION m_economie.ft_m_local_delete_etab();

CREATE OR REPLACE FUNCTION m_economie.ft_m_local_delete_etab()
  RETURNS trigger AS
$BODY$



BEGIN

	DELETE FROM m_economie.lk_localsiret WHERE idgeoloc = old.idgeoloc;
		IF old.idgeolf is not NULL THEN
			INSERT INTO m_economie.lk_localsiret (idgeoloc,siret)
			SELECT DISTINCT old.idgeolf,lk.siret FROM r_objet.geo_objet_fon_lot l , x_apps.xapps_geo_vmr_adresse a , m_economie.lk_adresseetablissement lk
			WHERE st_intersects(l.geom,a.geom) AND l.l_voca='20' AND a.id_adresse = lk.idadresse AND l.idgeolf = old.idgeolf;
		END IF;
	REFRESH MATERIALIZED VIEW x_apps.xapps_geo_vmr_local;

        

RETURN NEW;
END;$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
ALTER FUNCTION m_economie.ft_m_local_delete_etab()
  OWNER TO sig_create;

COMMENT ON FUNCTION m_economie.ft_m_local_delete_etab() IS 'Fonction dont l''objet est de supprimer dans la table lk_localsiret les relations du local avec les établissements présents';

-- Function: m_economie.ft_m_etiquette_local()

-- DROP FUNCTION m_economie.ft_m_etiquette_local();

CREATE OR REPLACE FUNCTION m_economie.ft_m_etiquette_local()
  RETURNS trigger AS
$BODY$

BEGIN
-- rafraichissement de la vue matérialisée des locaux pour affichage étiquette des noms
REFRESH MATERIALIZED VIEW x_apps.xapps_geo_vmr_local;
-- refraichissement de la vue matérialisée des points établissements à l'adresse
REFRESH MATERIALIZED VIEW x_apps.xapps_geo_vmr_etab_api;

return new;

END;


$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
ALTER FUNCTION m_economie.ft_m_etiquette_local()
  OWNER TO sig_create;




-- ################################################# Classe des objets des poles ############################

-- Table: m_economie.geo_sa_pole

-- DROP TABLE m_economie.geo_sa_pole;

CREATE TABLE m_economie.geo_sa_pole
(
  idpole character varying(7) NOT NULL, -- Identifiant unique du pôle d'activité
  nom_pole character varying(100), -- Libellé du pôle d'activités
  date_sai timestamp without time zone DEFAULT now(), -- Date de saisie
  date_maj timestamp without time zone, -- Date de mise à jour
  date_int date, -- Date renseignée par GéoPicardie lors de l'intégration du fichier dans la base (correspond aux dernières données reçues)
  op_sai character varying(50), -- Opérateur de saisie
  org_sai character varying(100), -- Organisme de saisie
  dest character varying(2) DEFAULT '00'::character varying, -- Destination du pôle (issue de la destination des sites)
  geom geometry(Polygon,2154), -- Champ contenant la géométrie des objets
  src_geom character varying(2) DEFAULT '00'::character varying, -- Référentiel spatial pour la saisie des données
  CONSTRAINT geo_sa_pole_pkey PRIMARY KEY (idpole)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE m_economie.geo_sa_pole
  OWNER TO sig_create;

COMMENT ON TABLE m_economie.geo_sa_pole
  IS 'Pôle d''activités économiques (regroupement de site). Usage statistique au niveau Régional';
COMMENT ON COLUMN m_economie.geo_sa_pole.idpole IS 'Identifiant unique du pôle d''activité';
COMMENT ON COLUMN m_economie.geo_sa_pole.nom_pole IS 'Libellé du pôle d''activités';
COMMENT ON COLUMN m_economie.geo_sa_pole.date_sai IS 'Date de saisie';
COMMENT ON COLUMN m_economie.geo_sa_pole.date_maj IS 'Date de mise à jour';
COMMENT ON COLUMN m_economie.geo_sa_pole.date_int IS 'Date renseignée par GéoPicardie lors de l''intégration du fichier dans la base (correspond aux dernières données reçues)';
COMMENT ON COLUMN m_economie.geo_sa_pole.op_sai IS 'Opérateur de saisie';
COMMENT ON COLUMN m_economie.geo_sa_pole.org_sai IS 'Organisme de saisie';
COMMENT ON COLUMN m_economie.geo_sa_pole.dest IS 'Destination du pôle (issue de la destination des sites)';
COMMENT ON COLUMN m_economie.geo_sa_pole.geom IS 'Champ contenant la géométrie des objets';
COMMENT ON COLUMN m_economie.geo_sa_pole.src_geom IS 'Référentiel spatial pour la saisie des données';


-- Trigger: t_t1_pole_insert_date_maj on m_economie.geo_sa_pole

-- DROP TRIGGER t_t1_pole_insert_date_maj ON m_economie.geo_sa_pole;

CREATE TRIGGER t_t1_pole_insert_date_maj
  BEFORE INSERT
  ON m_economie.geo_sa_pole
  FOR EACH ROW
  EXECUTE PROCEDURE public.ft_r_timestamp_maj();

-- Trigger: t_t2_pole_insert_date_sai on m_economie.geo_sa_pole

-- DROP TRIGGER t_t2_pole_insert_date_sai ON m_economie.geo_sa_pole;

CREATE TRIGGER t_t2_pole_insert_date_sai
  BEFORE INSERT
  ON m_economie.geo_sa_pole
  FOR EACH ROW
  EXECUTE PROCEDURE public.ft_r_timestamp_sai();

-- Function: public.ft_r_timestamp_maj()

-- DROP FUNCTION public.ft_r_timestamp_maj();

CREATE OR REPLACE FUNCTION public.ft_r_timestamp_maj()
  RETURNS trigger AS
$BODY$BEGIN
new.date_maj=current_timestamp;
return new;
END$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
ALTER FUNCTION public.ft_r_timestamp_maj()
  OWNER TO sig_create;

-- ################################################# Classe des objets des sites en zone urbaine (données externes GéoPicardie) ############################
				  
-- Table: m_economie.geo_sa_site_zu

-- DROP TABLE m_economie.geo_sa_site_zu;

CREATE TABLE m_economie.geo_sa_site_zu
(
  idsite character varying(254) NOT NULL,
  idpole character varying(254),
  site_nom character varying(254),
  site_etat character varying(254),
  surf_brt bigint,
  surf_net bigint,
  date_sai character varying(254),
  date_maj character varying(254),
  op_sai character varying(254),
  org_sai character varying(254),
  ref_spa character varying(254),
  prec_qtv bigint,
  typo character varying(254),
  geom geometry(MultiPolygon,2154),
  CONSTRAINT geo_sa_site_zu_pkey PRIMARY KEY (idsite)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE m_economie.geo_sa_site_zu
  OWNER TO sig_create;

COMMENT ON TABLE m_economie.geo_sa_site_zu
  IS 'Délimitation des sites des secteurs de centre-ville (zone urbaine) issue d''un traitement GéoPicardie.
Couche extraite du portail GéoPicardie le 2 mai 2017';

-- ################################################# Classe des objets historiques des établissements ############################

-- Table: m_economie.h_an_sa_etab

-- DROP TABLE m_economie.h_an_sa_etab;

CREATE TABLE m_economie.h_an_sa_etab
(
  idgeoet integer, -- Identifiant unique géographique
  idsiren character varying(9), -- Numéro SIRENE de l'établissement
  idsiret character varying(14), -- Numéro SIRET de l'établissement
  idsite character varying(10), -- Identifiant du site d'activité d'appartenance
  date_maj timestamp without time zone, -- Date de mise à jour par le producteur
  date_h timestamp without time zone, -- Date de mise en historique
  l_nom character varying(255), -- Enseigne dans SIRENE
  l1_nomen character varying(255), -- Raison sociale de l'établissement dans SIRENE
  enseigne character varying(255),
  eff_etab integer, -- Effectif total de l'établissement
  eff_etab_etp double precision, -- Effectif de l'établissement en etp
  source_eff character varying(100), -- Source de l'effectif de l'établissement
  annee_eff integer, -- Année de l'effectif (issu de SIRENE)
  l_date_eff date, -- Date de l'effectif saisie par l'ARC
  l_nom_dir character varying(100), -- Libellé du nom du dirigeant de l'établissement par l'ARC
  l_observ character varying(255), -- Commentaires
  t_source character varying(30), -- Nom de la table source
  geom geometry(Point,2154) NOT NULL,
  gid serial NOT NULL,
  CONSTRAINT h_an_sa_etab_pkey PRIMARY KEY (gid)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE m_economie.h_an_sa_etab
  OWNER TO sig_create;

COMMENT ON TABLE m_economie.h_an_sa_etab
  IS E'Table contenant les données historisées des établissements.
Cette table est incrémentée chaque année par un Workflow FME (Y:\\Ressources\\4-Partage\\3-Procedures\\FME\\prod\\ECO\\historisation_annuelle_site_etab.fmw)';
COMMENT ON COLUMN m_economie.h_an_sa_etab.idgeoet IS 'Identifiant unique géographique';
COMMENT ON COLUMN m_economie.h_an_sa_etab.idsiren IS 'Numéro SIRENE de l''établissement';
COMMENT ON COLUMN m_economie.h_an_sa_etab.idsiret IS 'Numéro SIRET de l''établissement';
COMMENT ON COLUMN m_economie.h_an_sa_etab.idsite IS 'Identifiant du site d''activité d''appartenance';
COMMENT ON COLUMN m_economie.h_an_sa_etab.date_maj IS 'Date de mise à jour par le producteur';
COMMENT ON COLUMN m_economie.h_an_sa_etab.date_h IS 'Date de mise en historique';
COMMENT ON COLUMN m_economie.h_an_sa_etab.l_nom IS 'Enseigne dans SIRENE';
COMMENT ON COLUMN m_economie.h_an_sa_etab.l1_nomen IS 'Raison sociale de l''établissement dans SIRENE';
COMMENT ON COLUMN m_economie.h_an_sa_etab.eff_etab IS 'Effectif total de l''établissement';
COMMENT ON COLUMN m_economie.h_an_sa_etab.eff_etab_etp IS 'Effectif de l''établissement en etp';
COMMENT ON COLUMN m_economie.h_an_sa_etab.source_eff IS 'Source de l''effectif de l''établissement';
COMMENT ON COLUMN m_economie.h_an_sa_etab.annee_eff IS 'Année de l''effectif (issu de SIRENE)';
COMMENT ON COLUMN m_economie.h_an_sa_etab.l_date_eff IS 'Date de l''effectif saisie par l''ARC';
COMMENT ON COLUMN m_economie.h_an_sa_etab.l_nom_dir IS 'Libellé du nom du dirigeant de l''établissement par l''ARC';
COMMENT ON COLUMN m_economie.h_an_sa_etab.l_observ IS 'Commentaires';
COMMENT ON COLUMN m_economie.h_an_sa_etab.t_source IS 'Nom de la table source';


-- ################################################# Classe des objets historiques des sites d'activités ############################

-- Table: m_economie.h_an_sa_site

-- DROP TABLE m_economie.h_an_sa_site;

CREATE TABLE m_economie.h_an_sa_site
(
  idsite character varying(10),
  site_nom character varying(80),
  dest text,
  voca text,
  date_h timestamp with time zone,
  annee_h integer,
  nb_etab text,
  eff_etab text,
  surf_dispo_vente character varying,
  surf_dedie_act character varying,
  surf_reserve_projet character varying,
  id serial NOT NULL, -- Identifiant unique interne
  CONSTRAINT h_an_sa_site_pkey PRIMARY KEY (id)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE m_economie.h_an_sa_site
  OWNER TO sig_create;

COMMENT ON TABLE m_economie.h_an_sa_site
  IS E'Table contenant les données historisées des sites à vocation économique (1er historisation 1er janvier 2018). Le millésime correspond au 1er janvier de l''année.
Cette table est incrémentée chaque année par un Workflow FME (Y:\\Ressources\\4-Partage\\3-Procedures\\FME\\prod\\ECO\\historisation_annuelle_site_etab.fmw)';
COMMENT ON COLUMN m_economie.h_an_sa_site.id IS 'Identifiant unique interne';

-- ################################################# Classe des objets des logs ############################

				  -- Table: m_economie.log_suivi_audit

-- DROP TABLE m_economie.log_suivi_audit;

CREATE TABLE m_economie.log_suivi_audit
(
  objet character varying(10),
  d_maj timestamp without time zone,
  "user" character varying(50),
  relid character varying(255),
  l_schema character varying(100),
  l_table character varying(100),
  idgeo integer,
  modif character varying(5000),
  geom geometry(MultiPolygon,2154),
  geom1 geometry(Point,2154)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE m_economie.log_suivi_audit
  OWNER TO sig_create;
				 
-- ################################################# Classe des objets des locaux (hors BAL) ############################

-- Table: m_economie.geo_sa_local

-- DROP TABLE m_economie.geo_sa_local;

CREATE TABLE m_economie.geo_sa_local
(
  idgeoloc integer NOT NULL DEFAULT nextval('idgeo_seq'::regclass), -- Identifiant unique du local
  idgeolf integer, -- Identifiant unique du lot foncier d'appartenance
  usage character varying(100), -- Usage du local si pas d'occupants identifiés
  sup_m2 double precision, -- Surface en m² du local
  geom geometry(Polygon,2154), -- Champ stockant la géométrie des objets
  l_occupp character varying(255), -- Libellé du bâtiment ou occupant principale
  CONSTRAINT geo_sa_local_pkey PRIMARY KEY (idgeoloc)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE m_economie.geo_sa_local
  OWNER TO sig_create;

COMMENT ON TABLE m_economie.geo_sa_local
  IS 'Table géographique contenant la localisation des locaux. Par défaut les objets reprennent ceux des lots fonciers. Au besoin des sous-découpages sont créés (galerie commerciale, division de lots, ...)';
COMMENT ON COLUMN m_economie.geo_sa_local.idgeoloc IS 'Identifiant unique du local';
COMMENT ON COLUMN m_economie.geo_sa_local.idgeolf IS 'Identifiant unique du lot foncier d''appartenance';
COMMENT ON COLUMN m_economie.geo_sa_local.usage IS 'Usage du local si pas d''occupants identifiés';
COMMENT ON COLUMN m_economie.geo_sa_local.sup_m2 IS 'Surface en m² du local';
COMMENT ON COLUMN m_economie.geo_sa_local.geom IS 'Champ stockant la géométrie des objets';
COMMENT ON COLUMN m_economie.geo_sa_local.l_occupp IS 'Libellé du bâtiment ou occupant principale';



-- Trigger: t_t1_local_insert_update_etab on m_economie.geo_sa_local

-- DROP TRIGGER t_t1_local_insert_update_etab ON m_economie.geo_sa_local;

CREATE TRIGGER t_t1_local_insert_update_etab
  BEFORE INSERT OR UPDATE OF geom
  ON m_economie.geo_sa_local
  FOR EACH ROW
  EXECUTE PROCEDURE m_economie.ft_m_local_insert_update();

-- Function: m_economie.ft_m_local_insert_update()

-- DROP FUNCTION m_economie.ft_m_local_insert_update();

CREATE OR REPLACE FUNCTION m_economie.ft_m_local_insert_update()
  RETURNS trigger AS
$BODY$


DECLARE v_idgeolf integer;
BEGIN

	NEW.sup_m2=round(cast(st_area(new.geom) as numeric),0);

	-- mise à jour des appartenances des établissements à l'adresse dans la table lk_localsiret
	-- si le local ne contient pas d'adresse, ne supprime pas les relations du local avec les établissements si non oui 

        -- à la mise à jour
        IF (TG_OP = 'UPDATE') THEN
	-- si il n'y a pas d'adresse sur le lot je ne fais rien pour conserver éventuellement les établissements affectés à ce local manuellement dans GEO
	IF 
		(SELECT count(*) FROM m_economie.geo_sa_local l , x_apps.xapps_geo_vmr_adresse a
		WHERE st_intersects(new.geom,a.geom))= 0
	THEN
		INSERT INTO m_economie.lk_localsiret (idgeoloc,siret)
		SELECT DISTINCT new.idgeoloc,lk.siret FROM m_economie.geo_sa_local l , x_apps.xapps_geo_vmr_adresse a , m_economie.lk_adresseetablissement lk
		WHERE st_intersects(new.geom,a.geom) AND a.id_adresse = lk.idadresse;


        ELSE 
		DELETE FROM m_economie.lk_localsiret lk WHERE lk.idgeoloc = old.idgeoloc;
		INSERT INTO m_economie.lk_localsiret (idgeoloc,siret)
		SELECT DISTINCT new.idgeoloc, lk.siret FROM m_economie.geo_sa_local l , x_apps.xapps_geo_vmr_adresse a , m_economie.lk_adresseetablissement lk
		WHERE st_intersects(new.geom,a.geom) AND a.id_adresse = lk.idadresse;
	END IF;
	END IF;

	-- à l'insertion
	IF (TG_OP = 'INSERT') THEN
	        v_idgeolf = (SELECT l.idgeolf FROM r_objet.geo_objet_fon_lot l WHERE st_intersects(l.geom,st_pointonsurface(new.geom)));
		-- mise à jour des appartenances des établissements à l'adresse dans la table lk_localsiret
                new.idgeolf = v_idgeolf;
                -- si il existe des siret accrochés à l'ancien lot foncier les réaafecter à ce local si non j'insère par défaut
                -- si il n'y a pas d'adresse sur le lot je ne fais rien pour conserver éventuellement les établissements affectés à ce local manuellement dans GEO
		IF 
			
			(SELECT count(*) FROM m_economie.geo_sa_local l , x_apps.xapps_geo_vmr_adresse a
			WHERE st_intersects(new.geom,a.geom)) = 0
		THEN

			UPDATE m_economie.lk_localsiret SET idgeoloc = new.idgeoloc WHERE idgeoloc = v_idgeolf;


		ELSE
			DELETE FROM m_economie.lk_localsiret WHERE idgeoloc = v_idgeolf;
			INSERT INTO m_economie.lk_localsiret (idgeoloc,siret)
			SELECT DISTINCT new.idgeoloc, lk.siret FROM m_economie.geo_sa_local l , x_apps.xapps_geo_vmr_adresse a , m_economie.lk_adresseetablissement lk
			WHERE st_intersects(new.geom,a.geom) AND a.id_adresse = lk.idadresse;
			
		END IF;
		



	END IF ;

RETURN NEW;
END;$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
ALTER FUNCTION m_economie.ft_m_local_insert_update()
  OWNER TO sig_create;

COMMENT ON FUNCTION m_economie.ft_m_local_insert_update() IS 'Fonction dont l''objet de rechercher les établissements dans le local si celui-ci croise une adresse et de les intégrer dans la table lk_localsiret';

				 
-- Trigger: t_t2_local_delete_etab on m_economie.geo_sa_local

-- DROP TRIGGER t_t2_local_delete_etab ON m_economie.geo_sa_local;

CREATE TRIGGER t_t2_local_delete_etab
  AFTER DELETE
  ON m_economie.geo_sa_local
  FOR EACH ROW
  EXECUTE PROCEDURE m_economie.ft_m_local_delete_etab();

-- Function: m_economie.ft_m_local_delete_etab()

-- DROP FUNCTION m_economie.ft_m_local_delete_etab();

CREATE OR REPLACE FUNCTION m_economie.ft_m_local_delete_etab()
  RETURNS trigger AS
$BODY$



BEGIN

	DELETE FROM m_economie.lk_localsiret WHERE idgeoloc = old.idgeoloc;
		IF old.idgeolf is not NULL THEN
			INSERT INTO m_economie.lk_localsiret (idgeoloc,siret)
			SELECT DISTINCT old.idgeolf,lk.siret FROM r_objet.geo_objet_fon_lot l , x_apps.xapps_geo_vmr_adresse a , m_economie.lk_adresseetablissement lk
			WHERE st_intersects(l.geom,a.geom) AND l.l_voca='20' AND a.id_adresse = lk.idadresse AND l.idgeolf = old.idgeolf;
		END IF;
	REFRESH MATERIALIZED VIEW x_apps.xapps_geo_vmr_local;

        

RETURN NEW;
END;$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
ALTER FUNCTION m_economie.ft_m_local_delete_etab()
  OWNER TO sig_create;

COMMENT ON FUNCTION m_economie.ft_m_local_delete_etab() IS 'Fonction dont l''objet est de supprimer dans la table lk_localsiret les relations du local avec les établissements présents';
					    

-- Trigger: t_t3_etiquette_local_refresh on m_economie.geo_sa_local

-- DROP TRIGGER t_t3_etiquette_local_refresh ON m_economie.geo_sa_local;

CREATE TRIGGER t_t3_etiquette_local_refresh
  AFTER INSERT OR UPDATE OR DELETE
  ON m_economie.geo_sa_local
  FOR EACH ROW
  EXECUTE PROCEDURE m_economie.ft_m_etiquette_local();

-- Function: m_economie.ft_m_etiquette_local()

-- DROP FUNCTION m_economie.ft_m_etiquette_local();

CREATE OR REPLACE FUNCTION m_economie.ft_m_etiquette_local()
  RETURNS trigger AS
$BODY$

BEGIN
-- rafraichissement de la vue matérialisée des locaux pour affichage étiquette des noms
REFRESH MATERIALIZED VIEW x_apps.xapps_geo_vmr_local;
-- refraichissement de la vue matérialisée des points établissements à l'adresse
REFRESH MATERIALIZED VIEW x_apps.xapps_geo_vmr_etab_api;

return new;

END;


$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
ALTER FUNCTION m_economie.ft_m_etiquette_local()
  OWNER TO sig_create;

-- ################################# Classe des objets des liens entre adresse et établissements ############################
	
-- Table: m_economie.lk_adresseetablissement

-- DROP TABLE m_economie.lk_adresseetablissement;

CREATE TABLE m_economie.lk_adresseetablissement
(
  idadresse bigint, -- Identifiant unique de l'adresse
  siret character varying(14) -- N° SIRET de l'établissement
)
WITH (
  OIDS=FALSE
);
ALTER TABLE m_economie.lk_adresseetablissement
  OWNER TO create_sig;

COMMENT ON TABLE m_economie.lk_adresseetablissement
  IS 'Table de lien permettant d''affecter les adresses de localisations aux établissements issus de la donnée SIRENE de l''Insee';
COMMENT ON COLUMN m_economie.lk_adresseetablissement.idadresse IS 'Identifiant unique de l''adresse';
COMMENT ON COLUMN m_economie.lk_adresseetablissement.siret IS 'N° SIRET de l''établissement';


-- Trigger: t_t1_lk_adresseetablissement_siret_update on m_economie.lk_adresseetablissement

-- DROP TRIGGER t_t1_lk_adresseetablissement_siret_update ON m_economie.lk_adresseetablissement;

CREATE TRIGGER t_t1_lk_adresseetablissement_siret_update
  BEFORE INSERT OR UPDATE
  ON m_economie.lk_adresseetablissement
  FOR EACH ROW
  EXECUTE PROCEDURE m_economie.ft_m_lk_adresseetablissement_siret_update();

-- Function: m_economie.ft_m_lk_adresseetablissement_siret_update()

-- DROP FUNCTION m_economie.ft_m_lk_adresseetablissement_siret_update();

CREATE OR REPLACE FUNCTION m_economie.ft_m_lk_adresseetablissement_siret_update()
  RETURNS trigger AS
$BODY$

BEGIN

-- si j'ai déjà un établissement à une adresse et qu'il est adressé à une autre, je supprime d'abord les appariemments

DELETE FROM m_economie.lk_adresseetablissement WHERE siret = new.siret;

return new;

END;


$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
ALTER FUNCTION m_economie.ft_m_lk_adresseetablissement_siret_update()
  OWNER TO sig_create;


					    
-- Trigger: t_t2_lk_adresseetablissement_idsite on m_economie.lk_adresseetablissement

-- DROP TRIGGER t_t2_lk_adresseetablissement_idsite ON m_economie.lk_adresseetablissement;

CREATE TRIGGER t_t2_lk_adresseetablissement_idsite
  BEFORE INSERT OR UPDATE
  ON m_economie.lk_adresseetablissement
  FOR EACH ROW
  EXECUTE PROCEDURE m_economie.ft_m_lk_adresseetablissement_idsite();

-- Function: m_economie.ft_m_lk_adresseetablissement_idsite()

-- DROP FUNCTION m_economie.ft_m_lk_adresseetablissement_idsite();

CREATE OR REPLACE FUNCTION m_economie.ft_m_lk_adresseetablissement_idsite()
  RETURNS trigger AS
$BODY$


BEGIN


UPDATE m_economie.an_sa_etab SET idsite = 
(SELECT DISTINCT idsite FROM r_objet.geo_objet_ope WHERE st_intersects(geo_objet_ope.geom,(SELECT a.geom FROM x_apps.xapps_geo_vmr_adresse a WHERE a.id_adresse = new.idadresse)) = true and idsite <> '60382zz')
WHERE idsiret = new.siret;



return new;

END;


$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
ALTER FUNCTION m_economie.ft_m_lk_adresseetablissement_idsite()
  OWNER TO sig_create;

					    
-- Trigger: t_t3_lk_adresseetablissement_idsite_delete on m_economie.lk_adresseetablissement

-- DROP TRIGGER t_t3_lk_adresseetablissement_idsite_delete ON m_economie.lk_adresseetablissement;

CREATE TRIGGER t_t3_lk_adresseetablissement_idsite_delete
  AFTER DELETE
  ON m_economie.lk_adresseetablissement
  FOR EACH ROW
  EXECUTE PROCEDURE m_economie.ft_m_lk_adresseetablissement_idsite_delete();

-- Function: m_economie.ft_m_lk_adresseetablissement_idsite_delete()

-- DROP FUNCTION m_economie.ft_m_lk_adresseetablissement_idsite_delete();

CREATE OR REPLACE FUNCTION m_economie.ft_m_lk_adresseetablissement_idsite_delete()
  RETURNS trigger AS
$BODY$

BEGIN

-- suppression de l'appariemment du siret à l'adresse
DELETE FROM m_economie.lk_adresseetablissement WHERE siret = old.siret;
-- suppression de l'établissement affecté au local
DELETE FROM m_economie.lk_localsiret WHERE siret = old.siret;
return new;

END;


$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
ALTER FUNCTION m_economie.ft_m_lk_adresseetablissement_idsite_delete()
  OWNER TO sig_create;

				       
								       
-- Trigger: t_t4_lk_etablissementlocal on m_economie.lk_adresseetablissement

-- DROP TRIGGER t_t4_lk_etablissementlocal ON m_economie.lk_adresseetablissement;

CREATE TRIGGER t_t4_lk_etablissementlocal
  AFTER INSERT OR UPDATE OR DELETE
  ON m_economie.lk_adresseetablissement
  FOR EACH ROW
  EXECUTE PROCEDURE m_economie.ft_m_lk_adresseetablissement();

-- Function: m_economie.ft_m_lk_adresseetablissement()

-- DROP FUNCTION m_economie.ft_m_lk_adresseetablissement();

CREATE OR REPLACE FUNCTION m_economie.ft_m_lk_adresseetablissement()
  RETURNS trigger AS
$BODY$

BEGIN

IF (TG_OP = 'UPDATE') THEN
        -- si l'adresse est sur un local spécifique
	IF 
	(
		SELECT count(*) FROM m_economie.geo_sa_local l , x_apps.xapps_geo_vmr_adresse a , m_economie.lk_adresseetablissement lk
		WHERE st_intersects(l.geom,a.geom) AND a.id_adresse = lk.idadresse AND lk.siret = new.siret
	) = 0
	THEN
		INSERT INTO m_economie.lk_localsiret (idgeoloc,siret)
		SELECT DISTINCT l.idgeoloc,new.siret FROM m_economie.geo_sa_local l , x_apps.xapps_geo_vmr_adresse a , m_economie.lk_adresseetablissement lk
		WHERE st_intersects(l.geom,a.geom) AND a.id_adresse = lk.idadresse AND lk.siret = new.siret;
	ELSE
		DELETE FROM m_economie.lk_localsiret lk WHERE lk.siret = new.siret;
		INSERT INTO m_economie.lk_localsiret (idgeoloc,siret)
		SELECT DISTINCT l.idgeoloc,new.siret FROM m_economie.geo_sa_local l , x_apps.xapps_geo_vmr_adresse a , m_economie.lk_adresseetablissement lk
		WHERE st_intersects(l.geom,a.geom) AND a.id_adresse = lk.idadresse AND lk.siret = new.siret;
        -- si non sur un lot
	IF 
		(SELECT count(*) FROM r_objet.geo_objet_fon_lot l , x_apps.xapps_geo_vmr_adresse a , m_economie.lk_adresseetablissement lk
		WHERE st_intersects(l.geom,a.geom) AND l.l_voca='20' AND a.id_adresse = lk.idadresse AND lk.siret = new.siret) = 0
	THEN
		INSERT INTO m_economie.lk_localsiret (idgeoloc,siret)
		SELECT DISTINCT l.idgeolf,new.siret FROM r_objet.geo_objet_fon_lot l , x_apps.xapps_geo_vmr_adresse a , m_economie.lk_adresseetablissement lk
		WHERE st_intersects(l.geom,a.geom) AND l.l_voca='20' AND a.id_adresse = lk.idadresse AND lk.siret = new.siret;
        ELSE
		DELETE FROM m_economie.lk_localsiret lk WHERE lk.siret = new.siret;
		INSERT INTO m_economie.lk_localsiret (idgeoloc,siret)
		SELECT DISTINCT l.idgeolf,new.siret FROM r_objet.geo_objet_fon_lot l , x_apps.xapps_geo_vmr_adresse a , m_economie.lk_adresseetablissement lk
		WHERE st_intersects(l.geom,a.geom) AND l.l_voca='20' AND a.id_adresse = lk.idadresse AND lk.siret = new.siret;
	END IF;
END IF;
END IF;

IF (TG_OP = 'INSERT') THEN

-- mise à jour des appartenances des établissements au local dans la table lk_localsiret
-- si l'adresse intersect un local
IF (
	SELECT count(*) FROM m_economie.geo_sa_local l , x_apps.xapps_geo_vmr_adresse a , m_economie.lk_adresseetablissement lk
	WHERE st_intersects(l.geom,a.geom) AND a.id_adresse = lk.idadresse AND lk.siret = new.siret
   ) > 0 THEN
INSERT INTO m_economie.lk_localsiret (idgeoloc,siret)
SELECT DISTINCT l.idgeoloc,new.siret FROM m_economie.geo_sa_local l , x_apps.xapps_geo_vmr_adresse a , m_economie.lk_adresseetablissement lk
WHERE st_intersects(l.geom,a.geom) AND a.id_adresse = lk.idadresse AND lk.siret = new.siret;
ELSE
-- si non l'adresse intersect un lot
INSERT INTO m_economie.lk_localsiret (idgeoloc,siret)
SELECT DISTINCT l.idgeolf,new.siret FROM r_objet.geo_objet_fon_lot l , x_apps.xapps_geo_vmr_adresse a , m_economie.lk_adresseetablissement lk
WHERE st_intersects(l.geom,a.geom) AND l.l_voca='20' AND a.id_adresse = lk.idadresse AND lk.siret = new.siret;
END IF;

END IF;

-- rafraichissement de la vue matérialisée des locaux pour affichage étiquette des noms
REFRESH MATERIALIZED VIEW x_apps.xapps_geo_vmr_local;
-- refraichissement de la vue matérialisée des points établissements à l'adresse
REFRESH MATERIALIZED VIEW x_apps.xapps_geo_vmr_etab_api;

return new;

END;


$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
ALTER FUNCTION m_economie.ft_m_lk_adresseetablissement()
  OWNER TO sig_create;


-- ################################# Classe des objets des liens entre local et établissements ############################					    
					    
-- Table: m_economie.lk_localsiret

-- DROP TABLE m_economie.lk_localsiret;

CREATE TABLE m_economie.lk_localsiret
(
  idgeoloc integer, -- Identifiant du local
  siret character varying(14) -- N° SIRET de l'établissement
)
WITH (
  OIDS=FALSE
);
ALTER TABLE m_economie.lk_localsiret
  OWNER TO sig_create;

COMMENT ON TABLE m_economie.lk_localsiret
  IS 'Table de lien permettant de gérer l''occupation d''un local par n établissements';
COMMENT ON COLUMN m_economie.lk_localsiret.idgeoloc IS 'Identifiant du local';
COMMENT ON COLUMN m_economie.lk_localsiret.siret IS 'N° SIRET de l''établissement';

-- Function: m_economie.ft_m_lk_localsiret()

-- DROP FUNCTION m_economie.ft_m_lk_localsiret();

CREATE OR REPLACE FUNCTION m_economie.ft_m_lk_localsiret()
  RETURNS trigger AS
$BODY$

BEGIN
-- rafraichissement de la vue matérialisée des locaux pour affichage étiquette des noms
REFRESH MATERIALIZED VIEW x_apps.xapps_geo_vmr_local;


return new;

END;


$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
ALTER FUNCTION m_economie.ft_m_lk_localsiret()
  OWNER TO sig_create;
GRANT EXECUTE ON FUNCTION m_economie.ft_m_lk_localsiret() TO public;
GRANT EXECUTE ON FUNCTION m_economie.ft_m_lk_localsiret() TO sig_create;
GRANT EXECUTE ON FUNCTION m_economie.ft_m_lk_localsiret() TO create_sig;
GRANT EXECUTE ON FUNCTION m_economie.ft_m_lk_localsiret() TO edit_sig;


-- Trigger: t_t1_lk_localsiret on m_economie.lk_localsiret

-- DROP TRIGGER t_t1_lk_localsiret ON m_economie.lk_localsiret;

CREATE TRIGGER t_t1_lk_localsiret
  AFTER INSERT OR UPDATE OR DELETE
  ON m_economie.lk_localsiret
  FOR EACH ROW
  EXECUTE PROCEDURE m_economie.ft_m_lk_localsiret();

					    
-- ################################################# Du schéma m_amenagement ##################################

-- ################################################# Classe des objets espaces publics ##################################

-- Table: m_amenagement.an_amt_esppu

-- DROP TABLE m_amenagement.an_amt_esppu;

CREATE TABLE m_amenagement.an_amt_esppu
(
  idgeopu integer NOT NULL, -- Identifiant unique géographique de référence de l'objet virtuel
  idsite character varying(10), -- Identifiant unique du site
  idpole character varying(7), -- Identifiant unique du pole
  date_int date, -- Date d'intégration par GéoPicardie dans la base (permet de connaître la dernière donnée intégrée)
  op_sai character varying(80), -- Libellé de la personne ayant saisie la mise à jour
  org_sai character varying(80), -- Organisme de saisie dont dépend l'opérateur de saisie
  vocaep character varying(2) DEFAULT '00'::character varying, -- Code de valeurs des vocations des espaces publics
  date_sai timestamp without time zone, -- Date de saisie des données attributaires
  date_maj timestamp without time zone, -- Date de mises à jour des données attributaires
  CONSTRAINT an_amt_esppu_pkey PRIMARY KEY (idgeopu)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE m_amenagement.an_amt_esppu
  OWNER TO sig_create;

COMMENT ON TABLE m_amenagement.an_amt_esppu
  IS 'Information alphanumérique sur les emprises des espaces publiques contenus dans les sites opérationnels. Les objets virtuels de référence sont gérés dans le schéma r_objet';
COMMENT ON COLUMN m_amenagement.an_amt_esppu.idgeopu IS 'Identifiant unique géographique de référence de l''objet virtuel';
COMMENT ON COLUMN m_amenagement.an_amt_esppu.idsite IS 'Identifiant unique du site';
COMMENT ON COLUMN m_amenagement.an_amt_esppu.idpole IS 'Identifiant unique du pole';
COMMENT ON COLUMN m_amenagement.an_amt_esppu.date_int IS 'Date d''intégration par GéoPicardie dans la base (permet de connaître la dernière donnée intégrée)';
COMMENT ON COLUMN m_amenagement.an_amt_esppu.op_sai IS 'Libellé de la personne ayant saisie la mise à jour';
COMMENT ON COLUMN m_amenagement.an_amt_esppu.org_sai IS 'Organisme de saisie dont dépend l''opérateur de saisie';
COMMENT ON COLUMN m_amenagement.an_amt_esppu.vocaep IS 'Code de valeurs des vocations des espaces publics';
COMMENT ON COLUMN m_amenagement.an_amt_esppu.date_sai IS 'Date de saisie des données attributaires';
COMMENT ON COLUMN m_amenagement.an_amt_esppu.date_maj IS 'Date de mises à jour des données attributaires';

				  
-- ################################################# Classe des objets des lots divers ##################################

				  
-- Table: m_amenagement.an_amt_lot_divers

-- DROP TABLE m_amenagement.an_amt_lot_divers;

CREATE TABLE m_amenagement.an_amt_lot_divers
(
  idgeolf integer NOT NULL, -- Identifiant unique géographique de référence de l'objet virtuel
  idsite character varying(10), -- Identifiant unique du site
  op_sai character varying(80), -- Libellé de la personne ayant saisie la mise à jour
  org_sai character varying(80), -- Organisme de saisie dont dépend l'opérateur de saisie
  l_nom character varying(100), -- Libellé
  surf double precision, -- Surface du lot divers en m²
  date_sai timestamp without time zone, -- Date de saisie des données attributaires
  date_maj timestamp without time zone, -- Date de mise à jour des données attributaires
  l_phase character varying(10), -- Phase opérationnelle éventuelle
  l_surf_l character varying(15),
  CONSTRAINT an_amt_lot_divers_pkey PRIMARY KEY (idgeolf)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE m_amenagement.an_amt_lot_divers
  OWNER TO sig_create;

COMMENT ON TABLE m_amenagement.an_amt_lot_divers
  IS 'Information alphanumérique sur les lots divers';
COMMENT ON COLUMN m_amenagement.an_amt_lot_divers.idgeolf IS 'Identifiant unique géographique de référence de l''objet virtuel';
COMMENT ON COLUMN m_amenagement.an_amt_lot_divers.idsite IS 'Identifiant unique du site';
COMMENT ON COLUMN m_amenagement.an_amt_lot_divers.op_sai IS 'Libellé de la personne ayant saisie la mise à jour';
COMMENT ON COLUMN m_amenagement.an_amt_lot_divers.org_sai IS 'Organisme de saisie dont dépend l''opérateur de saisie';
COMMENT ON COLUMN m_amenagement.an_amt_lot_divers.l_nom IS 'Libellé';
COMMENT ON COLUMN m_amenagement.an_amt_lot_divers.surf IS 'Surface du lot divers en m²';
COMMENT ON COLUMN m_amenagement.an_amt_lot_divers.date_sai IS 'Date de saisie des données attributaires';
COMMENT ON COLUMN m_amenagement.an_amt_lot_divers.date_maj IS 'Date de mise à jour des données attributaires';
COMMENT ON COLUMN m_amenagement.an_amt_lot_divers.l_phase IS 'Phase opérationnelle éventuelle';


-- ################################################# Classe des objets des lots équipements ##################################

-- Table: m_amenagement.an_amt_lot_equ

-- DROP TABLE m_amenagement.an_amt_lot_equ;

CREATE TABLE m_amenagement.an_amt_lot_equ
(
  idgeolf integer NOT NULL, -- Identifiant unique géographique de référence de l'objet virtuel
  idsite character varying(10), -- Identifiant unique du site
  op_sai character varying(80), -- Libellé de la personne ayant saisie la mise à jour
  org_sai character varying(80), -- Organisme de saisie dont dépend l'opérateur de saisie
  l_nom character varying(100), -- Libellé de l'équipement
  surf double precision, -- Surface du lot équipement en m²
  date_sai timestamp without time zone, -- Date de saisie des données attributaires
  date_maj timestamp without time zone, -- Date de mise à jour des données attributaires
  l_phase character varying(10), -- Phase opérationnelle éventuelle
  l_surf_l character varying(15), -- Surface littérale parcellaire occupée du lot
  CONSTRAINT an_amt_lot_equ_pkey PRIMARY KEY (idgeolf)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE m_amenagement.an_amt_lot_equ
  OWNER TO sig_create;

COMMENT ON TABLE m_amenagement.an_amt_lot_equ
  IS 'Information alphanumérique sur les lots équipements';
COMMENT ON COLUMN m_amenagement.an_amt_lot_equ.idgeolf IS 'Identifiant unique géographique de référence de l''objet virtuel';
COMMENT ON COLUMN m_amenagement.an_amt_lot_equ.idsite IS 'Identifiant unique du site';
COMMENT ON COLUMN m_amenagement.an_amt_lot_equ.op_sai IS 'Libellé de la personne ayant saisie la mise à jour';
COMMENT ON COLUMN m_amenagement.an_amt_lot_equ.org_sai IS 'Organisme de saisie dont dépend l''opérateur de saisie';
COMMENT ON COLUMN m_amenagement.an_amt_lot_equ.l_nom IS 'Libellé de l''équipement';
COMMENT ON COLUMN m_amenagement.an_amt_lot_equ.surf IS 'Surface du lot équipement en m²';
COMMENT ON COLUMN m_amenagement.an_amt_lot_equ.date_sai IS 'Date de saisie des données attributaires';
COMMENT ON COLUMN m_amenagement.an_amt_lot_equ.date_maj IS 'Date de mise à jour des données attributaires';
COMMENT ON COLUMN m_amenagement.an_amt_lot_equ.l_phase IS 'Phase opérationnelle éventuelle';
COMMENT ON COLUMN m_amenagement.an_amt_lot_equ.l_surf_l IS 'Surface littérale parcellaire occupée du lot';


-- ################################################# Classe des objets des lots habitats ##################################
  
				  
-- Table: m_amenagement.an_amt_lot_hab

-- DROP TABLE m_amenagement.an_amt_lot_hab;

CREATE TABLE m_amenagement.an_amt_lot_hab
(
  idgeolf integer NOT NULL, -- Identifiant unique de l'entité géographique lot
  idsite character varying(10), -- Identifiant du site d'activité d'appartenance
  surf integer, -- Surface parcellaire occupée du lot
  l_surf_l character varying(15), -- Surface littérale parcellaire occupée du lot
  op_sai character varying(80), -- Libellé de l'opérateur de saisie
  org_sai character varying(80), -- Libellé de l'organisme de saisie
  l_pvente double precision, -- Prix de vente du lot en HT (€/m²)
  l_pvente_l character varying(15), -- Prix littéral de vente du lot en HT (ex:50€/m²)
  nb_log integer, -- Nombre total de logements
  nb_logind integer, -- Nombre de logements individuels
  nb_logindgr integer, -- Nombre de logements individuels groupés
  nb_logcol integer, -- Nombre de logements collectifs
  nb_logaide integer, -- Dont nombre de logements aidés
  l_observ character varying(255), -- Observations diverses
  date_sai timestamp without time zone, -- Date de saisie des données attributaires
  date_maj timestamp without time zone, -- Date de mise à jour des données attributaires
  l_phase character varying(20), -- Information facultative sur l'appartenance du lot à un éventuel phasage de l'opération
  nb_log_r integer DEFAULT 0, -- Nombre de logements total réalisé
  nb_logind_r integer DEFAULT 0, -- Nombre de logements individuels réalisé
  nb_logindgr_r integer DEFAULT 0, -- Nombre de logements individuels groupés réalisé
  nb_logcol_r integer DEFAULT 0, -- Nombre de logements collectifs réalisé
  nb_logaide_r integer DEFAULT 0, -- Nombre de logements aidés réalisé
  l_pvente_lot integer, -- Prix de vente du lot (ht)
  nb_logaide_loc_r integer, -- Nombre de logements aidés en location réalisé
  nb_logaide_acc_r integer, -- Nombre de logements aidés en accession réalisé
  CONSTRAINT an_amt_lot_hab_pkey PRIMARY KEY (idgeolf)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE m_amenagement.an_amt_lot_hab
  OWNER TO sig_create;

COMMENT ON TABLE m_amenagement.an_amt_lot_hab
  IS 'Table alphanumérique contenant les données des lots à vocation habitat';
COMMENT ON COLUMN m_amenagement.an_amt_lot_hab.idgeolf IS 'Identifiant unique de l''entité géographique lot';
COMMENT ON COLUMN m_amenagement.an_amt_lot_hab.idsite IS 'Identifiant du site d''activité d''appartenance';
COMMENT ON COLUMN m_amenagement.an_amt_lot_hab.surf IS 'Surface parcellaire occupée du lot';
COMMENT ON COLUMN m_amenagement.an_amt_lot_hab.l_surf_l IS 'Surface littérale parcellaire occupée du lot';
COMMENT ON COLUMN m_amenagement.an_amt_lot_hab.op_sai IS 'Libellé de l''opérateur de saisie';
COMMENT ON COLUMN m_amenagement.an_amt_lot_hab.org_sai IS 'Libellé de l''organisme de saisie';
COMMENT ON COLUMN m_amenagement.an_amt_lot_hab.l_pvente IS 'Prix de vente du lot en HT (€/m²)';
COMMENT ON COLUMN m_amenagement.an_amt_lot_hab.l_pvente_l IS 'Prix littéral de vente du lot en HT (ex:50€/m²)';
COMMENT ON COLUMN m_amenagement.an_amt_lot_hab.nb_log IS 'Nombre total de logements';
COMMENT ON COLUMN m_amenagement.an_amt_lot_hab.nb_logind IS 'Nombre de logements individuels';
COMMENT ON COLUMN m_amenagement.an_amt_lot_hab.nb_logindgr IS 'Nombre de logements individuels groupés';
COMMENT ON COLUMN m_amenagement.an_amt_lot_hab.nb_logcol IS 'Nombre de logements collectifs';
COMMENT ON COLUMN m_amenagement.an_amt_lot_hab.nb_logaide IS 'Dont nombre de logements aidés';
COMMENT ON COLUMN m_amenagement.an_amt_lot_hab.l_observ IS 'Observations diverses';
COMMENT ON COLUMN m_amenagement.an_amt_lot_hab.date_sai IS 'Date de saisie des données attributaires';
COMMENT ON COLUMN m_amenagement.an_amt_lot_hab.date_maj IS 'Date de mise à jour des données attributaires';
COMMENT ON COLUMN m_amenagement.an_amt_lot_hab.l_phase IS 'Information facultative sur l''appartenance du lot à un éventuel phasage de l''opération';
COMMENT ON COLUMN m_amenagement.an_amt_lot_hab.nb_log_r IS 'Nombre de logements total réalisé';
COMMENT ON COLUMN m_amenagement.an_amt_lot_hab.nb_logind_r IS 'Nombre de logements individuels réalisé';
COMMENT ON COLUMN m_amenagement.an_amt_lot_hab.nb_logindgr_r IS 'Nombre de logements individuels groupés réalisé';
COMMENT ON COLUMN m_amenagement.an_amt_lot_hab.nb_logcol_r IS 'Nombre de logements collectifs réalisé';
COMMENT ON COLUMN m_amenagement.an_amt_lot_hab.nb_logaide_r IS 'Nombre de logements aidés réalisé';
COMMENT ON COLUMN m_amenagement.an_amt_lot_hab.l_pvente_lot IS 'Prix de vente du lot (ht)';
COMMENT ON COLUMN m_amenagement.an_amt_lot_hab.nb_logaide_loc_r IS 'Nombre de logements aidés en location réalisé';
COMMENT ON COLUMN m_amenagement.an_amt_lot_hab.nb_logaide_acc_r IS 'Nombre de logements aidés en accession réalisé';

				  
-- Trigger: t_t3_r_suivi_audit on m_amenagement.an_amt_lot_hab

-- DROP TRIGGER t_t3_r_suivi_audit ON m_amenagement.an_amt_lot_hab;

CREATE TRIGGER t_t3_r_suivi_audit
  AFTER INSERT OR UPDATE OR DELETE
  ON m_amenagement.an_amt_lot_hab
  FOR EACH ROW
  EXECUTE PROCEDURE m_economie.ft_r_suivi_audit();
ALTER TABLE m_amenagement.an_amt_lot_hab DISABLE TRIGGER t_t3_r_suivi_audit;


-- ################################################# Classe des objets des lots mixtes ##################################
 

-- Table: m_amenagement.an_amt_lot_mixte

-- DROP TABLE m_amenagement.an_amt_lot_mixte;

CREATE TABLE m_amenagement.an_amt_lot_mixte
(
  idgeolf integer NOT NULL, -- Identifiant unique de l'entité géographique lot
  idsite character varying(10), -- Identifiant du site d'appartenance
  surf integer, -- Surface parcellaire occupée du lot
  l_surf_l character varying(15), -- Surface littérale parcellaire occupée du lot
  op_sai character varying(80), -- Libellé de l'opérateur de saisie
  org_sai character varying(80), -- Libellé de l'organisme de saisie
  l_pvente double precision, -- Prix de vente du lot en HT (€/m²)
  l_pvente_l character varying(15), -- Prix littéral de vente du lot en HT (ex:50€/m²)
  nb_log integer DEFAULT 0, -- Nombre total de logements
  nb_logind integer DEFAULT 0, -- Nombre de logements individuels
  nb_logindgr integer DEFAULT 0, -- Nombre de logements individuels groupés
  nb_logcol integer DEFAULT 0, -- Nombre de logements collectifs
  nb_logaide integer DEFAULT 0, -- Dont nombre de logements aidés
  l_observ character varying(255), -- Observations diverses
  date_sai timestamp without time zone, -- Date de saisie des données attributaires
  date_maj timestamp without time zone, -- Date de mise à jour des données attributaires
  l_phase character varying(20), -- Information facultative sur l'appartenance du lot à un éventuel phasage de l'opération
  nb_log_r integer DEFAULT 0, -- Nombre de logements total réalisé
  nb_logind_r integer DEFAULT 0, -- Nombre de logements individuels réalisé
  nb_logindgr_r integer DEFAULT 0, -- Nombre de logements individuels groupés réalisé
  nb_logcol_r integer DEFAULT 0, -- Nombre de logements collectifs réalisé
  nb_logaide_r integer DEFAULT 0, -- Nombre de logements aidés réalisé
  l_pvente_lot integer, -- Prix de vente du lot (ht)
  l_tact character varying(2) DEFAULT '00'::character varying, -- Type d'activité présent sur le lot
  l_tact_99 character varying(80), -- Précision de l'activité du lot (si Autre sélectionné dans l_tact)
  l_nom_equ character varying(100), -- Libellé des équipements prévus sur le lot
  nb_logaide_loc_r integer, -- Nombre de logements aidés en location réalisé
  nb_logaide_acc_r integer, -- Nombre de logements aidés en accession réalisé
  l_lnom character varying(250), -- Nom(s) du ou des acquéreurs du lot ou d'une partie des bâtiments
  CONSTRAINT an_amt_lot_mixte_pkey PRIMARY KEY (idgeolf)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE m_amenagement.an_amt_lot_mixte
  OWNER TO sig_create;

COMMENT ON TABLE m_amenagement.an_amt_lot_mixte
  IS 'Table alphanumérique contenant les données des lots à vocation mixte';
COMMENT ON COLUMN m_amenagement.an_amt_lot_mixte.idgeolf IS 'Identifiant unique de l''entité géographique lot';
COMMENT ON COLUMN m_amenagement.an_amt_lot_mixte.idsite IS 'Identifiant du site d''appartenance';
COMMENT ON COLUMN m_amenagement.an_amt_lot_mixte.surf IS 'Surface parcellaire occupée du lot';
COMMENT ON COLUMN m_amenagement.an_amt_lot_mixte.l_surf_l IS 'Surface littérale parcellaire occupée du lot';
COMMENT ON COLUMN m_amenagement.an_amt_lot_mixte.op_sai IS 'Libellé de l''opérateur de saisie';
COMMENT ON COLUMN m_amenagement.an_amt_lot_mixte.org_sai IS 'Libellé de l''organisme de saisie';
COMMENT ON COLUMN m_amenagement.an_amt_lot_mixte.l_pvente IS 'Prix de vente du lot en HT (€/m²)';
COMMENT ON COLUMN m_amenagement.an_amt_lot_mixte.l_pvente_l IS 'Prix littéral de vente du lot en HT (ex:50€/m²)';
COMMENT ON COLUMN m_amenagement.an_amt_lot_mixte.nb_log IS 'Nombre total de logements';
COMMENT ON COLUMN m_amenagement.an_amt_lot_mixte.nb_logind IS 'Nombre de logements individuels';
COMMENT ON COLUMN m_amenagement.an_amt_lot_mixte.nb_logindgr IS 'Nombre de logements individuels groupés';
COMMENT ON COLUMN m_amenagement.an_amt_lot_mixte.nb_logcol IS 'Nombre de logements collectifs';
COMMENT ON COLUMN m_amenagement.an_amt_lot_mixte.nb_logaide IS 'Dont nombre de logements aidés';
COMMENT ON COLUMN m_amenagement.an_amt_lot_mixte.l_observ IS 'Observations diverses';
COMMENT ON COLUMN m_amenagement.an_amt_lot_mixte.date_sai IS 'Date de saisie des données attributaires';
COMMENT ON COLUMN m_amenagement.an_amt_lot_mixte.date_maj IS 'Date de mise à jour des données attributaires';
COMMENT ON COLUMN m_amenagement.an_amt_lot_mixte.l_phase IS 'Information facultative sur l''appartenance du lot à un éventuel phasage de l''opération';
COMMENT ON COLUMN m_amenagement.an_amt_lot_mixte.nb_log_r IS 'Nombre de logements total réalisé';
COMMENT ON COLUMN m_amenagement.an_amt_lot_mixte.nb_logind_r IS 'Nombre de logements individuels réalisé';
COMMENT ON COLUMN m_amenagement.an_amt_lot_mixte.nb_logindgr_r IS 'Nombre de logements individuels groupés réalisé';
COMMENT ON COLUMN m_amenagement.an_amt_lot_mixte.nb_logcol_r IS 'Nombre de logements collectifs réalisé';
COMMENT ON COLUMN m_amenagement.an_amt_lot_mixte.nb_logaide_r IS 'Nombre de logements aidés réalisé';
COMMENT ON COLUMN m_amenagement.an_amt_lot_mixte.l_pvente_lot IS 'Prix de vente du lot (ht)';
COMMENT ON COLUMN m_amenagement.an_amt_lot_mixte.l_tact IS 'Type d''activité présent sur le lot';
COMMENT ON COLUMN m_amenagement.an_amt_lot_mixte.l_tact_99 IS 'Précision de l''activité du lot (si Autre sélectionné dans l_tact)';
COMMENT ON COLUMN m_amenagement.an_amt_lot_mixte.l_nom_equ IS 'Libellé des équipements prévus sur le lot';
COMMENT ON COLUMN m_amenagement.an_amt_lot_mixte.nb_logaide_loc_r IS 'Nombre de logements aidés en location réalisé';
COMMENT ON COLUMN m_amenagement.an_amt_lot_mixte.nb_logaide_acc_r IS 'Nombre de logements aidés en accession réalisé';
COMMENT ON COLUMN m_amenagement.an_amt_lot_mixte.l_lnom IS 'Nom(s) du ou des acquéreurs du lot ou d''une partie des bâtiments';


-- Trigger: t_t2_r_suivi_audit on m_amenagement.an_amt_lot_mixte

-- DROP TRIGGER t_t2_r_suivi_audit ON m_amenagement.an_amt_lot_mixte;

CREATE TRIGGER t_t2_r_suivi_audit
  AFTER INSERT OR UPDATE OR DELETE
  ON m_amenagement.an_amt_lot_mixte
  FOR EACH ROW
  EXECUTE PROCEDURE m_economie.ft_r_suivi_audit();
ALTER TABLE m_amenagement.an_amt_lot_mixte DISABLE TRIGGER t_t2_r_suivi_audit;

				  
-- ################################################# Classe des objets des stades d'aménagements et de commercialisation ##################################
 
				  
-- Table: m_amenagement.an_amt_lot_stade

-- DROP TABLE m_amenagement.an_amt_lot_stade;

CREATE TABLE m_amenagement.an_amt_lot_stade
(
  idgeolf integer NOT NULL, -- Identifiant unique de l'entité géographique lot
  idsite character varying(10), -- Identifiant du site d'activité d'appartenance
  stade_amng character varying(2) DEFAULT '00'::character varying, -- Code du stade d'aménagement du foncier
  l_amng2 character varying(2) DEFAULT '00'::character varying, -- Code du stade d'aménagement du foncier spécifique à l'ARC
  stade_comm character varying(2) DEFAULT '00'::character varying, -- Code du stade de commercialisation du foncier
  l_comm2 character varying(2) DEFAULT '00'::character varying, -- Code du stade de commercialisation du foncier spécifique à l'ARC
  l_comm2_12 character varying(80), -- Spécification de la contrainte du lot en vente (code 12 du champ l_comm2)
  etat_occup character varying(2) DEFAULT '00'::character varying, -- Code de l'état d'occupation du foncier
  CONSTRAINT an_amt_lot_stade_pkey PRIMARY KEY (idgeolf)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE m_amenagement.an_amt_lot_stade
  OWNER TO sig_create;

COMMENT ON TABLE m_amenagement.an_amt_lot_stade
  IS 'Table alphanumérique contenant les données de la classe stade d''aménagement et de commercialisation';
COMMENT ON COLUMN m_amenagement.an_amt_lot_stade.idgeolf IS 'Identifiant unique de l''entité géographique lot';
COMMENT ON COLUMN m_amenagement.an_amt_lot_stade.idsite IS 'Identifiant du site d''activité d''appartenance';
COMMENT ON COLUMN m_amenagement.an_amt_lot_stade.stade_amng IS 'Code du stade d''aménagement du foncier';
COMMENT ON COLUMN m_amenagement.an_amt_lot_stade.l_amng2 IS 'Code du stade d''aménagement du foncier spécifique à l''ARC';
COMMENT ON COLUMN m_amenagement.an_amt_lot_stade.stade_comm IS 'Code du stade de commercialisation du foncier';
COMMENT ON COLUMN m_amenagement.an_amt_lot_stade.l_comm2 IS 'Code du stade de commercialisation du foncier spécifique à l''ARC';
COMMENT ON COLUMN m_amenagement.an_amt_lot_stade.l_comm2_12 IS 'Spécification de la contrainte du lot en vente (code 12 du champ l_comm2)';
COMMENT ON COLUMN m_amenagement.an_amt_lot_stade.etat_occup IS 'Code de l''état d''occupation du foncier';

				  
-- Function: m_amenagement.ft_m_foncier_modif_geopic()

-- DROP FUNCTION m_amenagement.ft_m_foncier_modif_geopic();

CREATE OR REPLACE FUNCTION m_amenagement.ft_m_foncier_modif_geopic()
  RETURNS trigger AS
$BODY$

BEGIN

    -- mise à jour des champs stade_amng et stade_comm en fonction des champs l_comm2, l_amng2 saisies 
    if new.l_amng2 = '10' then
       UPDATE m_amenagement.an_amt_lot_stade SET  stade_amng = '40' WHERE idgeolf=new.idgeolf;
    end if;
    if new.l_amng2 = '20' then
       UPDATE m_amenagement.an_amt_lot_stade SET  stade_amng = '20' WHERE idgeolf=new.idgeolf;
    end if;
    if new.l_amng2 = '30' then
       UPDATE m_amenagement.an_amt_lot_stade SET  stade_amng = '30' WHERE idgeolf=new.idgeolf;
    end if;

    if new.l_comm2 = '11' or new.l_comm2 = '12' then
       UPDATE m_amenagement.an_amt_lot_stade SET  stade_comm = '20' WHERE idgeolf=new.idgeolf;
    end if;
    if new.l_comm2 = '20' or (new.l_comm2 = '31' or new.l_comm2 = '32') then
       UPDATE m_amenagement.an_amt_lot_stade SET  stade_comm = '10' WHERE idgeolf=new.idgeolf;
    end if;
    if new.l_comm2 = '00' then
       UPDATE m_amenagement.an_amt_lot_stade SET  stade_comm = '00' WHERE idgeolf=new.idgeolf;
    end if;
    if new.l_amng2 = '00' then
       UPDATE m_amenagement.an_amt_lot_stade SET  stade_amng = '00' WHERE idgeolf=new.idgeolf;
    end if;


     return new ;

END;

$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
ALTER FUNCTION m_amenagement.ft_m_foncier_modif_geopic()
  OWNER TO sig_create;

COMMENT ON FUNCTION m_amenagement.ft_m_foncier_modif_geopic() IS 'Fonction gérant l''automatisation des attributs stade d''aménagement et de commercialisation en fonction des disponibilités et du stade de commercilaisation spécifique à l''ARC';


-- Trigger: t_t1_foncier_modif_geopic on m_amenagement.an_amt_lot_stade

-- DROP TRIGGER t_t1_foncier_modif_geopic ON m_amenagement.an_amt_lot_stade;

CREATE TRIGGER t_t1_foncier_modif_geopic
  AFTER INSERT OR UPDATE OF l_comm2, l_amng2
  ON m_amenagement.an_amt_lot_stade
  FOR EACH ROW
  EXECUTE PROCEDURE m_amenagement.ft_m_foncier_modif_geopic();

				  
-- ################################################# Classe des objets des sites équipements ##################################
 				  
-- Table: m_amenagement.an_amt_site_equ

-- DROP TABLE m_amenagement.an_amt_site_equ;

CREATE TABLE m_amenagement.an_amt_site_equ
(
  idgeopo integer NOT NULL, -- Identifiant unique géographique de référence de l'objet virtuel
  idsite character varying(10), -- Identifiant du site équipement
  site_nom character varying(80), -- Libellé du site
  site_etat character varying(2) DEFAULT '00'::character varying, -- Code de l'état du site
  op_sai character varying(80), -- Libellé de la personne ayant saisie la mise à jour
  org_sai character varying(80), -- Organisme de saisie dont dépend l'opérateur de saisie
  z_mai_ouvr character varying(80), -- Nom du maître d'ouvrage
  z_compet character varying(80), -- Nom de la collectivité ayant dans ses compétences le développement de la zone
  z_amng character varying(80), -- Nom de l'aménageur de la zone
  z_gest character varying(80), -- Nom du gestionnaire de la zone
  z_anim character varying(80), -- Nom de l'animateur de la zone
  z_comm character varying(80), -- Structure de contact pour la commercialisation
  contact character varying(80), -- Libellé de la personne contact pour la commercialisation
  date_sai timestamp without time zone, -- Date de saisie des données attributaires
  date_maj timestamp without time zone, -- Date de mise à jour des données attributaires
  CONSTRAINT an_amt_site_equ_pkey PRIMARY KEY (idgeopo) -- Clé primaire de la table an_amt_site_equ

)
WITH (
  OIDS=FALSE
);
ALTER TABLE m_amenagement.an_amt_site_equ
  OWNER TO sig_create;

COMMENT ON TABLE m_amenagement.an_amt_site_equ
  IS 'Information alphanumérique sur les Sites à vocation équipement. Les objets virtuels de référence sont gérés dans le schéma r_objet';
COMMENT ON COLUMN m_amenagement.an_amt_site_equ.idgeopo IS 'Identifiant unique géographique de référence de l''objet virtuel';
COMMENT ON COLUMN m_amenagement.an_amt_site_equ.idsite IS 'Identifiant du site équipement';
COMMENT ON COLUMN m_amenagement.an_amt_site_equ.site_nom IS 'Libellé du site';
COMMENT ON COLUMN m_amenagement.an_amt_site_equ.site_etat IS 'Code de l''état du site';
COMMENT ON COLUMN m_amenagement.an_amt_site_equ.op_sai IS 'Libellé de la personne ayant saisie la mise à jour';
COMMENT ON COLUMN m_amenagement.an_amt_site_equ.org_sai IS 'Organisme de saisie dont dépend l''opérateur de saisie';
COMMENT ON COLUMN m_amenagement.an_amt_site_equ.z_mai_ouvr IS 'Nom du maître d''ouvrage';
COMMENT ON COLUMN m_amenagement.an_amt_site_equ.z_compet IS 'Nom de la collectivité ayant dans ses compétences le développement de la zone';
COMMENT ON COLUMN m_amenagement.an_amt_site_equ.z_amng IS 'Nom de l''aménageur de la zone';
COMMENT ON COLUMN m_amenagement.an_amt_site_equ.z_gest IS 'Nom du gestionnaire de la zone';
COMMENT ON COLUMN m_amenagement.an_amt_site_equ.z_anim IS 'Nom de l''animateur de la zone';
COMMENT ON COLUMN m_amenagement.an_amt_site_equ.z_comm IS 'Structure de contact pour la commercialisation';
COMMENT ON COLUMN m_amenagement.an_amt_site_equ.contact IS 'Libellé de la personne contact pour la commercialisation';
COMMENT ON COLUMN m_amenagement.an_amt_site_equ.date_sai IS 'Date de saisie des données attributaires';
COMMENT ON COLUMN m_amenagement.an_amt_site_equ.date_maj IS 'Date de mise à jour des données attributaires';

COMMENT ON CONSTRAINT an_amt_site_equ_pkey ON m_amenagement.an_amt_site_equ IS 'Clé primaire de la table an_amt_site_equ';


-- ################################################# Classe des objets des sites habitat ##################################

-- Table: m_amenagement.an_amt_site_habitat

-- DROP TABLE m_amenagement.an_amt_site_habitat;

CREATE TABLE m_amenagement.an_amt_site_habitat
(
  idgeopo integer NOT NULL, -- Identifiant unique géographique de référence de l'objet virtuel
  idsite character varying(10), -- Identifiant du site habitat
  site_nom character varying(80), -- Libellé du site
  site_etat character varying(2) DEFAULT '00'::character varying, -- Code de l'état du site
  op_sai character varying(80), -- Libellé de la personne ayant saisie la mise à jour
  org_sai character varying(80), -- Organisme de saisie dont dépend l'opérateur de saisie
  nb_log integer, -- Nombre de logements prévue sur le site
  z_mai_ouvr character varying(80), -- Nom du maître d'ouvrage
  z_compet character varying(80), -- Nom de la collectivité ayant dans ses compétences le développement de la zone
  z_amng character varying(80), -- Nom de l'aménageur de la zone
  z_gest character varying(80), -- Nom du gestionnaire de la zone
  z_anim character varying(80), -- Nom de l'animateur de la zone
  z_comm character varying(80), -- Structure de contact pour la commercialisation
  contact character varying(80), -- Libellé de la personne contact pour la commercialisation
  date_sai timestamp without time zone, -- Date de saisie des données attributaires
  date_maj timestamp without time zone, -- Date de mise à jour des données attributaires
  CONSTRAINT an_amt_p_habitat_pkey PRIMARY KEY (idgeopo) -- Clé primaire de la table an_amt_site_habitat

)
WITH (
  OIDS=FALSE
);
ALTER TABLE m_amenagement.an_amt_site_habitat
  OWNER TO sig_create;

COMMENT ON TABLE m_amenagement.an_amt_site_habitat
  IS 'Information alphanumérique sur les Sites à vocation habitat. Les objets virtuels de référence sont gérés dans le schéma r_objet';
COMMENT ON COLUMN m_amenagement.an_amt_site_habitat.idgeopo IS 'Identifiant unique géographique de référence de l''objet virtuel';
COMMENT ON COLUMN m_amenagement.an_amt_site_habitat.idsite IS 'Identifiant du site habitat';
COMMENT ON COLUMN m_amenagement.an_amt_site_habitat.site_nom IS 'Libellé du site';
COMMENT ON COLUMN m_amenagement.an_amt_site_habitat.site_etat IS 'Code de l''état du site';
COMMENT ON COLUMN m_amenagement.an_amt_site_habitat.op_sai IS 'Libellé de la personne ayant saisie la mise à jour';
COMMENT ON COLUMN m_amenagement.an_amt_site_habitat.org_sai IS 'Organisme de saisie dont dépend l''opérateur de saisie';
COMMENT ON COLUMN m_amenagement.an_amt_site_habitat.nb_log IS 'Nombre de logements prévue sur le site';
COMMENT ON COLUMN m_amenagement.an_amt_site_habitat.z_mai_ouvr IS 'Nom du maître d''ouvrage';
COMMENT ON COLUMN m_amenagement.an_amt_site_habitat.z_compet IS 'Nom de la collectivité ayant dans ses compétences le développement de la zone';
COMMENT ON COLUMN m_amenagement.an_amt_site_habitat.z_amng IS 'Nom de l''aménageur de la zone';
COMMENT ON COLUMN m_amenagement.an_amt_site_habitat.z_gest IS 'Nom du gestionnaire de la zone';
COMMENT ON COLUMN m_amenagement.an_amt_site_habitat.z_anim IS 'Nom de l''animateur de la zone';
COMMENT ON COLUMN m_amenagement.an_amt_site_habitat.z_comm IS 'Structure de contact pour la commercialisation';
COMMENT ON COLUMN m_amenagement.an_amt_site_habitat.contact IS 'Libellé de la personne contact pour la commercialisation';
COMMENT ON COLUMN m_amenagement.an_amt_site_habitat.date_sai IS 'Date de saisie des données attributaires';
COMMENT ON COLUMN m_amenagement.an_amt_site_habitat.date_maj IS 'Date de mise à jour des données attributaires';

COMMENT ON CONSTRAINT an_amt_p_habitat_pkey ON m_amenagement.an_amt_site_habitat IS 'Clé primaire de la table an_amt_site_habitat';

				  
-- ################################################# Classe des objets des sites mixte ##################################

-- Table: m_amenagement.an_amt_site_mixte

-- DROP TABLE m_amenagement.an_amt_site_mixte;

CREATE TABLE m_amenagement.an_amt_site_mixte
(
  idgeopo integer NOT NULL, -- Identifiant unique géographique de référence de l'objet virtuel
  idsite character varying(10), -- Identifiant du site mixte
  idpole character varying(7), -- Identifiant du pôle d'appartenance (si existe)
  site_voca character varying(2) DEFAULT '00'::character varying, -- Code de la vocation simplifiée de la zone
  site_nom character varying(80), -- Libellé du site
  site_etat character varying(2) DEFAULT '00'::character varying, -- Code de l'état du site
  date_int date, -- Date d'intégration par GéoPicardie dans la base (permet de connaître la dernière donnée intégrée)
  op_sai character varying(80), -- Libellé de la personne ayant saisie la mise à jour
  org_sai character varying(80), -- Organisme de saisie dont dépend l'opérateur de saisie
  typo character varying(2) DEFAULT '00'::character varying, -- Typologie du site
  dest character varying(2) DEFAULT '00'::character varying, -- Destination initiale du site (défini dans les documents d'urbanisme)
  p_implant character varying(10), -- Première implantation des entreprises sur le site (année ou date)
  z_mai_ouvr character varying(80), -- Nom du maître d'ouvrage
  z_compet character varying(80), -- Nom de la collectivité ayant dans ses compétences le développement de la zone
  z_amng character varying(80), -- Nom de l'aménageur de la zone
  z_gest character varying(80), -- Nom du gestionnaire de la zone
  z_anim character varying(80), -- Nom de l'animateur de la zone
  z_comm character varying(80), -- Structure de contact pour la commercialisation
  contact character varying(80), -- Libellé de la personne contact pour la commercialisation
  z_cession_eco double precision, -- Conditions de cession en HT (euro/m²) pour les lots à vocation économique
  z_cession_hab double precision, -- Conditions de cession en HT (euro/m²) pour les lots à vocation habitat
  z_env character varying(80), -- Démarche environnementale
  z_paysage character varying(80), -- Démarche paysagère
  z_rehab character varying(80), -- Procédure de réhabilitaion du site
  z_epu character varying(3), -- Traitement de l'eau d'épuration
  z_dechet character varying(80), -- Libellé du gestionnaire des déchets
  z_tr_slect character varying(3), -- Présence d'un tri sélectif sur le site
  res_ass double precision, -- Linéaire de réseau d'assainissement
  res_pluvia double precision, -- Linéaire de réseau d'eau pluviale
  res_eau double precision, -- Débit du réseau d'eau potable
  res_gaz double precision, -- Débit du réseau de gaz
  res_elect double precision, -- Débit du réseau électrique
  res_net character varying(80), -- Type de réseau internet
  res_db_net double precision, -- Débit internet
  z_auto character varying(10), -- Libellé de l'autoroute la plus proche
  z_dst_auto double precision, -- Distance en km du diffuseur autoroutier par la route
  z_tps_auto double precision, -- Temps d'accès en minutes du diffuseur autoroutier par la route
  z_ar_f character varying(80), -- Nom de l'aéroport fret le plus proche
  z_dst_ar_f double precision, -- Distance en km de l'aéroport de fret par la route
  z_ar_v character varying(80), -- Nom de l'aéroport de voyageurs le plus proche
  z_dst_ar_v double precision, -- Distance en km de l'aéroport de voyageurs par la route
  z_fr_f character varying(80), -- Gare de fret la plus proche
  z_dst_fr_f double precision, -- Distance en km de la gare de fret la plus proche par la route
  z_fr_v character varying(80), -- Gare de voyageurs la plus proche
  z_dst_fr_v double precision, -- Distance en km de la gare de voyageurs la plus proche par la route
  z_pmm character varying(3), -- Présence d'une plate-forme multimodale
  z_dst_pmm double precision, -- Distance en km de la plate-forme multimodale la plus proche par la route
  serv_tc integer, -- Nombre de ligne de transport en commun desservant le site
  circ_douce character varying(3), -- Accès aux sites par un mode doux (pistes cyclables)
  serv_rest integer, -- Nombre de restaurants ou à proximité immédiate
  serv_crech integer, -- Nombre de crèches ou à proximité immédiate
  serv_autre character varying(80), -- Libellé des autres services disponibles sur le site
  serv_collt character varying(80), -- Services collectifs présent sur le site (mutualisation, partage de services)
  z_aide_pb character varying(2), -- Code de valeurs des aides publiques appliquées sur le site (AFR, ZFU, ZRR, aucun)
  l_dated_aide_pb date, -- Date de début de la période des aides publiques
  l_datef_aide_pb date, -- Date de fin de la période des aides publiques
  date_sai timestamp without time zone, -- Date de saisie des données attributaires
  date_maj timestamp without time zone, -- Date de mise à jour des données attributaires
  d_paris integer, -- Distance en km de Paris
  t_paris integer, -- Temps d'accès en minutes à Paris
  d_lille integer, -- Distance en km à Lille
  t_lille integer, -- Temps d'accès en minutes à Lille
  l_dauto character varying(200), -- Libellé de ou des diffuseurs autoroutiers le ou les plus proches
  l_dtgvhp integer, -- Distance à la gare TGV Haute-Picardie
  l_ttgvhp integer, -- Temps d'accès en minutes à la gare TGV Haute Picardie
  l_dtgvcdg integer, -- Distancr en km de la gare TGV Roissy-CDG
  l_ttgvcdg integer, -- Temps d'accès en minutes à la gare TGV Roissy-CDG
  l_tgcomp integer, -- Temps d'accès en minutes à la gare de Compiègne
  l_dtille integer, -- Distance en km de l'aéroport de Beauvais-Tillé
  l_ttille integer, -- Temps d'accès en minutes à l'aéroport de Beauvais-Tillé
  l_dcdg integer, -- Distance en km à l'aéroport de Roissy-Charles de Gaulle
  l_tcdg integer, -- Temps d'accès à l'aéroport en minutes à l'aéroport Roissy Charles de Gaulle
  l_dlesquin integer, -- Distance en km de l'aéroport Lille-Lesquin
  l_tlesquin integer, -- Temps d'accès en minutes à l'aéroport Lille-Lesquin
  nb_log integer DEFAULT 0, -- Nombre de logements prévisionnel
  zae boolean, -- Information sur le fait que le site soit une ZAE (sauf celle indiquée dans la table m_amenagement.geo_amt_zae)  ou non (compétence ARC selon la délibération du CA du 21 décembre 2017). Cette donnée permet de créer une vue matérialisée des ZAE complètes (geo_vmr_zae) avec les informations de la table m_amenagement.geo_amt_zae
  CONSTRAINT an_amt_site_mixte_pkey PRIMARY KEY (idgeopo) -- Clé primaire de la table an_amt_site_mixte
 
)
WITH (
  OIDS=FALSE
);
ALTER TABLE m_amenagement.an_amt_site_mixte
  OWNER TO sig_create;

COMMENT ON TABLE m_amenagement.an_amt_site_mixte
  IS 'Information alphanumérique sur les Sites d''activités mixte (habitat/Activité). Les objets virtuels de référence sont gérés dans le schéma r_objet';
COMMENT ON COLUMN m_amenagement.an_amt_site_mixte.idgeopo IS 'Identifiant unique géographique de référence de l''objet virtuel';
COMMENT ON COLUMN m_amenagement.an_amt_site_mixte.idsite IS 'Identifiant du site mixte';
COMMENT ON COLUMN m_amenagement.an_amt_site_mixte.idpole IS 'Identifiant du pôle d''appartenance (si existe)';
COMMENT ON COLUMN m_amenagement.an_amt_site_mixte.site_voca IS 'Code de la vocation simplifiée de la zone';
COMMENT ON COLUMN m_amenagement.an_amt_site_mixte.site_nom IS 'Libellé du site';
COMMENT ON COLUMN m_amenagement.an_amt_site_mixte.site_etat IS 'Code de l''état du site';
COMMENT ON COLUMN m_amenagement.an_amt_site_mixte.date_int IS 'Date d''intégration par GéoPicardie dans la base (permet de connaître la dernière donnée intégrée)';
COMMENT ON COLUMN m_amenagement.an_amt_site_mixte.op_sai IS 'Libellé de la personne ayant saisie la mise à jour';
COMMENT ON COLUMN m_amenagement.an_amt_site_mixte.org_sai IS 'Organisme de saisie dont dépend l''opérateur de saisie';
COMMENT ON COLUMN m_amenagement.an_amt_site_mixte.typo IS 'Typologie du site';
COMMENT ON COLUMN m_amenagement.an_amt_site_mixte.dest IS 'Destination initiale du site (défini dans les documents d''urbanisme)';
COMMENT ON COLUMN m_amenagement.an_amt_site_mixte.p_implant IS 'Première implantation des entreprises sur le site (année ou date)';
COMMENT ON COLUMN m_amenagement.an_amt_site_mixte.z_mai_ouvr IS 'Nom du maître d''ouvrage';
COMMENT ON COLUMN m_amenagement.an_amt_site_mixte.z_compet IS 'Nom de la collectivité ayant dans ses compétences le développement de la zone';
COMMENT ON COLUMN m_amenagement.an_amt_site_mixte.z_amng IS 'Nom de l''aménageur de la zone';
COMMENT ON COLUMN m_amenagement.an_amt_site_mixte.z_gest IS 'Nom du gestionnaire de la zone';
COMMENT ON COLUMN m_amenagement.an_amt_site_mixte.z_anim IS 'Nom de l''animateur de la zone';
COMMENT ON COLUMN m_amenagement.an_amt_site_mixte.z_comm IS 'Structure de contact pour la commercialisation';
COMMENT ON COLUMN m_amenagement.an_amt_site_mixte.contact IS 'Libellé de la personne contact pour la commercialisation';
COMMENT ON COLUMN m_amenagement.an_amt_site_mixte.z_cession_eco IS 'Conditions de cession en HT (euro/m²) pour les lots à vocation économique';
COMMENT ON COLUMN m_amenagement.an_amt_site_mixte.z_cession_hab IS 'Conditions de cession en HT (euro/m²) pour les lots à vocation habitat';
COMMENT ON COLUMN m_amenagement.an_amt_site_mixte.z_env IS 'Démarche environnementale';
COMMENT ON COLUMN m_amenagement.an_amt_site_mixte.z_paysage IS 'Démarche paysagère';
COMMENT ON COLUMN m_amenagement.an_amt_site_mixte.z_rehab IS 'Procédure de réhabilitaion du site';
COMMENT ON COLUMN m_amenagement.an_amt_site_mixte.z_epu IS 'Traitement de l''eau d''épuration';
COMMENT ON COLUMN m_amenagement.an_amt_site_mixte.z_dechet IS 'Libellé du gestionnaire des déchets';
COMMENT ON COLUMN m_amenagement.an_amt_site_mixte.z_tr_slect IS 'Présence d''un tri sélectif sur le site';
COMMENT ON COLUMN m_amenagement.an_amt_site_mixte.res_ass IS 'Linéaire de réseau d''assainissement';
COMMENT ON COLUMN m_amenagement.an_amt_site_mixte.res_pluvia IS 'Linéaire de réseau d''eau pluviale';
COMMENT ON COLUMN m_amenagement.an_amt_site_mixte.res_eau IS 'Débit du réseau d''eau potable';
COMMENT ON COLUMN m_amenagement.an_amt_site_mixte.res_gaz IS 'Débit du réseau de gaz';
COMMENT ON COLUMN m_amenagement.an_amt_site_mixte.res_elect IS 'Débit du réseau électrique';
COMMENT ON COLUMN m_amenagement.an_amt_site_mixte.res_net IS 'Type de réseau internet';
COMMENT ON COLUMN m_amenagement.an_amt_site_mixte.res_db_net IS 'Débit internet';
COMMENT ON COLUMN m_amenagement.an_amt_site_mixte.z_auto IS 'Libellé de l''autoroute la plus proche';
COMMENT ON COLUMN m_amenagement.an_amt_site_mixte.z_dst_auto IS 'Distance en km du diffuseur autoroutier par la route';
COMMENT ON COLUMN m_amenagement.an_amt_site_mixte.z_tps_auto IS 'Temps d''accès en minutes du diffuseur autoroutier par la route';
COMMENT ON COLUMN m_amenagement.an_amt_site_mixte.z_ar_f IS 'Nom de l''aéroport fret le plus proche';
COMMENT ON COLUMN m_amenagement.an_amt_site_mixte.z_dst_ar_f IS 'Distance en km de l''aéroport de fret par la route';
COMMENT ON COLUMN m_amenagement.an_amt_site_mixte.z_ar_v IS 'Nom de l''aéroport de voyageurs le plus proche';
COMMENT ON COLUMN m_amenagement.an_amt_site_mixte.z_dst_ar_v IS 'Distance en km de l''aéroport de voyageurs par la route';
COMMENT ON COLUMN m_amenagement.an_amt_site_mixte.z_fr_f IS 'Gare de fret la plus proche';
COMMENT ON COLUMN m_amenagement.an_amt_site_mixte.z_dst_fr_f IS 'Distance en km de la gare de fret la plus proche par la route';
COMMENT ON COLUMN m_amenagement.an_amt_site_mixte.z_fr_v IS 'Gare de voyageurs la plus proche';
COMMENT ON COLUMN m_amenagement.an_amt_site_mixte.z_dst_fr_v IS 'Distance en km de la gare de voyageurs la plus proche par la route';
COMMENT ON COLUMN m_amenagement.an_amt_site_mixte.z_pmm IS 'Présence d''une plate-forme multimodale';
COMMENT ON COLUMN m_amenagement.an_amt_site_mixte.z_dst_pmm IS 'Distance en km de la plate-forme multimodale la plus proche par la route';
COMMENT ON COLUMN m_amenagement.an_amt_site_mixte.serv_tc IS 'Nombre de ligne de transport en commun desservant le site';
COMMENT ON COLUMN m_amenagement.an_amt_site_mixte.circ_douce IS 'Accès aux sites par un mode doux (pistes cyclables)';
COMMENT ON COLUMN m_amenagement.an_amt_site_mixte.serv_rest IS 'Nombre de restaurants ou à proximité immédiate';
COMMENT ON COLUMN m_amenagement.an_amt_site_mixte.serv_crech IS 'Nombre de crèches ou à proximité immédiate';
COMMENT ON COLUMN m_amenagement.an_amt_site_mixte.serv_autre IS 'Libellé des autres services disponibles sur le site';
COMMENT ON COLUMN m_amenagement.an_amt_site_mixte.serv_collt IS 'Services collectifs présent sur le site (mutualisation, partage de services)';
COMMENT ON COLUMN m_amenagement.an_amt_site_mixte.z_aide_pb IS 'Code de valeurs des aides publiques appliquées sur le site (AFR, ZFU, ZRR, aucun)';
COMMENT ON COLUMN m_amenagement.an_amt_site_mixte.l_dated_aide_pb IS 'Date de début de la période des aides publiques';
COMMENT ON COLUMN m_amenagement.an_amt_site_mixte.l_datef_aide_pb IS 'Date de fin de la période des aides publiques';
COMMENT ON COLUMN m_amenagement.an_amt_site_mixte.date_sai IS 'Date de saisie des données attributaires';
COMMENT ON COLUMN m_amenagement.an_amt_site_mixte.date_maj IS 'Date de mise à jour des données attributaires';
COMMENT ON COLUMN m_amenagement.an_amt_site_mixte.d_paris IS 'Distance en km de Paris';
COMMENT ON COLUMN m_amenagement.an_amt_site_mixte.t_paris IS 'Temps d''accès en minutes à Paris';
COMMENT ON COLUMN m_amenagement.an_amt_site_mixte.d_lille IS 'Distance en km à Lille';
COMMENT ON COLUMN m_amenagement.an_amt_site_mixte.t_lille IS 'Temps d''accès en minutes à Lille';
COMMENT ON COLUMN m_amenagement.an_amt_site_mixte.l_dauto IS 'Libellé de ou des diffuseurs autoroutiers le ou les plus proches';
COMMENT ON COLUMN m_amenagement.an_amt_site_mixte.l_dtgvhp IS 'Distance à la gare TGV Haute-Picardie';
COMMENT ON COLUMN m_amenagement.an_amt_site_mixte.l_ttgvhp IS 'Temps d''accès en minutes à la gare TGV Haute Picardie';
COMMENT ON COLUMN m_amenagement.an_amt_site_mixte.l_dtgvcdg IS 'Distancr en km de la gare TGV Roissy-CDG';
COMMENT ON COLUMN m_amenagement.an_amt_site_mixte.l_ttgvcdg IS 'Temps d''accès en minutes à la gare TGV Roissy-CDG';
COMMENT ON COLUMN m_amenagement.an_amt_site_mixte.l_tgcomp IS 'Temps d''accès en minutes à la gare de Compiègne';
COMMENT ON COLUMN m_amenagement.an_amt_site_mixte.l_dtille IS 'Distance en km de l''aéroport de Beauvais-Tillé';
COMMENT ON COLUMN m_amenagement.an_amt_site_mixte.l_ttille IS 'Temps d''accès en minutes à l''aéroport de Beauvais-Tillé';
COMMENT ON COLUMN m_amenagement.an_amt_site_mixte.l_dcdg IS 'Distance en km à l''aéroport de Roissy-Charles de Gaulle';
COMMENT ON COLUMN m_amenagement.an_amt_site_mixte.l_tcdg IS 'Temps d''accès à l''aéroport en minutes à l''aéroport Roissy Charles de Gaulle';
COMMENT ON COLUMN m_amenagement.an_amt_site_mixte.l_dlesquin IS 'Distance en km de l''aéroport Lille-Lesquin';
COMMENT ON COLUMN m_amenagement.an_amt_site_mixte.l_tlesquin IS 'Temps d''accès en minutes à l''aéroport Lille-Lesquin';
COMMENT ON COLUMN m_amenagement.an_amt_site_mixte.nb_log IS 'Nombre de logements prévisionnel';
COMMENT ON COLUMN m_amenagement.an_amt_site_mixte.zae IS 'Information sur le fait que le site soit une ZAE (sauf celle indiquée dans la table m_amenagement.geo_amt_zae)  ou non (compétence ARC selon la délibération du CA du 21 décembre 2017). Cette donnée permet de créer une vue matérialisée des ZAE complètes (geo_vmr_zae) avec les informations de la table m_amenagement.geo_amt_zae';

COMMENT ON CONSTRAINT an_amt_site_mixte_pkey ON m_amenagement.an_amt_site_mixte IS 'Clé primaire de la table an_amt_site_mixte';

				  
-- ################################################# Classe des objets historique des sites mixte ##################################

-- Table: m_amenagement.h_an_amt_site_mixte

-- DROP TABLE m_amenagement.h_an_amt_site_mixte;

CREATE TABLE m_amenagement.h_an_amt_site_mixte
(
  annee_h integer,
  date_extract timestamp without time zone,
  date_h timestamp without time zone,
  dest character varying(50),
  eff_etab character varying(20),
  idsite character varying(10),
  nb_etab character varying(20),
  site_nom character varying(80),
  surf_dedie_act character varying(30),
  surf_dedie_mixte character varying(30),
  surf_dispo_vente_eco character varying(30),
  surf_dispo_vente_mixte character varying(30),
  surf_reserve_projet_eco character varying(30),
  surf_reserve_projet_mixte character varying(30),
  voca character varying(50),
  gid serial NOT NULL,
  CONSTRAINT h_an_amt_site_mixte_pkey PRIMARY KEY (gid)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE m_amenagement.h_an_amt_site_mixte
  OWNER TO sig_create;

				  
-- ################################################# Classe des objets ZAE transférées ##################################

				  -- Table: m_amenagement.geo_amt_zae_transfere

-- DROP TABLE m_amenagement.geo_amt_zae_transfere;

CREATE TABLE m_amenagement.geo_amt_zae_transfere
(
  idzae character varying(10) NOT NULL, -- Identifiant unique de la zae (dans le cas d'une ZAE commune à un site prend l'identifiant du site d'activité ou mixte)
  insee character varying(50), -- Code(s) insee des communes recoupées par une ZAE
  commune character varying(100), -- Libellé(s) des communes recoupées par une ZAE
  op_sai character varying(80), -- Opérateur qui à saisie la donnée
  org_sai character varying(150), -- Organisme dont l'opérateur de saisie appartient
  observ character varying(254), -- Commentaires diverses
  src_geom character varying(2), -- Référentiel géographique utilisé pour la saisie des données (liste de valeur)
  date_sai timestamp without time zone, -- Date de saisie de la données
  date_maj timestamp without time zone, -- Date de mise à jour de la donnée
  sup_m2 integer, -- Superficie en m²
  l_zae character varying(250), -- Libellé de la ZAE inscrite dans la délibération du 21 décembre 2017
  geom geometry(MultiPolygon,2154),
  CONSTRAINT geo_amt_zae_pkey PRIMARY KEY (idzae);
)
WITH (
  OIDS=FALSE
);
ALTER TABLE m_amenagement.geo_amt_zae_transfere
  OWNER TO sig_create;

COMMENT ON TABLE m_amenagement.geo_amt_zae_transfere
  IS 'Table géographique contenant uniquement les zones d''activités de compétence communale qui ont été transférées sous compétence intercommunale (ZAE). Approuvés par le CA du 21 décembre 2017 dans le cadre de la prise de compétence économique sur les zones d''activités communales. La vue complète des ZAE se trouve dans le schéma x_apps.xapps_geo_v_zae (pour les ZAE uniquement) et m_economie.geo_v_site_eco (pour l''ensemble des sites d''activités dont les ZAE)';
COMMENT ON COLUMN m_amenagement.geo_amt_zae_transfere.idzae IS 'Identifiant unique de la zae (dans le cas d''une ZAE commune à un site prend l''identifiant du site d''activité ou mixte)';
COMMENT ON COLUMN m_amenagement.geo_amt_zae_transfere.insee IS 'Code(s) insee des communes recoupées par une ZAE';
COMMENT ON COLUMN m_amenagement.geo_amt_zae_transfere.commune IS 'Libellé(s) des communes recoupées par une ZAE';
COMMENT ON COLUMN m_amenagement.geo_amt_zae_transfere.op_sai IS 'Opérateur qui à saisie la donnée';
COMMENT ON COLUMN m_amenagement.geo_amt_zae_transfere.org_sai IS 'Organisme dont l''opérateur de saisie appartient';
COMMENT ON COLUMN m_amenagement.geo_amt_zae_transfere.observ IS 'Commentaires diverses';
COMMENT ON COLUMN m_amenagement.geo_amt_zae_transfere.src_geom IS 'Référentiel géographique utilisé pour la saisie des données (liste de valeur)';
COMMENT ON COLUMN m_amenagement.geo_amt_zae_transfere.date_sai IS 'Date de saisie de la données';
COMMENT ON COLUMN m_amenagement.geo_amt_zae_transfere.date_maj IS 'Date de mise à jour de la donnée';
COMMENT ON COLUMN m_amenagement.geo_amt_zae_transfere.sup_m2 IS 'Superficie en m²';
COMMENT ON COLUMN m_amenagement.geo_amt_zae_transfere.l_zae IS 'Libellé de la ZAE inscrite dans la délibération du 21 décembre 2017';


				  
-- ################################################# Du schéma m_foncier ##################################

-- ################################################# Classe des objets cessions ##################################

-- Table: m_foncier.an_cession

-- DROP TABLE m_foncier.an_cession;

CREATE TABLE m_foncier.an_cession
(
  idces character varying(6) NOT NULL DEFAULT nextval('m_foncier.ces_seq'::regclass), -- Identifiant du dossier de cession ou n° de dossier
  l_rel character varying(2) DEFAULT '10'::character varying, -- Type de relation avec les lots
  l_compo boolean DEFAULT false, -- Composition de la cession : si true (coché) la cession ne correspond pas au lot vendu par le service économie (cf le commentaire pour plus de précision)
  l_etat character varying(2) DEFAULT '00'::character varying, -- Code de l'état du dossier de cession
  l_orga character varying(50) DEFAULT '00'::character varying, -- Code du nom de l'organisme
  d_delib_1 date, -- Date de la délibération de l'organisme cédant 1 ou de décision du président en cas de droit de préemption
  d_delib_2 date, -- Date de la délibération de l'organisme cédant 2
  d_delib_3 date, -- Date de la délibération de l'organisme cédant 3
  insee character varying(5), -- Code insee de la commune
  l_date_i date, -- Date d'ouverture du dossier dans le SIG
  l_voca character varying(2) DEFAULT '00'::character varying, -- Code de la vocation de la cession
  l_acque character varying(80), -- Nom de l'acquéreur
  l_parcelle_i character varying(500), -- Numéro(s) de(s) parcelle(s) initiale(s) concernée(s) par le périmètre
  l_parcelle_f character varying(500), -- Numéro(s) de(s) nouvelle(s) parcelle(s) concernée(s) par le périmètre
  d_esti_1 date, -- Date d'estimation des domaines 1
  d_esti_2 date, -- Date d'estimation des domaines 2
  d_esti_3 date, -- Date d'estimation des domaines 3
  l_esti_ht double precision, -- Montant total de(s) estimation(s) des domaines
  l_surf integer, -- Superficie cadastrée du périmètre de cession en m²
  l_condi character varying(2) DEFAULT '00'::character varying, -- Code de conditions de cession
  l_type character varying(2) DEFAULT '00'::character varying, -- Code du type d'acte de cession
  d_prome date, -- Date de la promesse de vente
  d_acte date, -- Date de l'acte
  l_notaire character varying(2) DEFAULT '00'::character varying, -- Code du nom de l'étude notariale
  l_notaire_a character varying(254), -- Nom de l'étude notariale si pas dans la liste des études notariales du champ l_notaire
  l_pvente_ht double precision, -- Montant de la vente HT
  l_pvente_ttc double precision, -- Montant de la vente TTC
  l_frais_a boolean DEFAULT false, -- Type de frais : aucun (champ non utilisé)
  l_frais_b boolean DEFAULT false, -- Type de frais : Géomètre  (champ non utilisé)
  l_frais_c boolean DEFAULT false, -- Type de frais : Notaire  (champ non utilisé)
  l_frais_d boolean DEFAULT false, -- Type de frais : Agence immobilière  (champ non utilisé)
  l_frais_e boolean DEFAULT false, -- Type de frais : Indemnités diverses  (champ non utilisé)
  l_mfrais_ht double precision, -- Frais cumulés de cession en € HT (champ non utilisé)
  l_mfrais_ttc double precision, -- Frais cumulés de cession en € TTC
  l_pvente_s double precision, -- Prix de vente en € HT au m² (sans les frais)
  l_type_a boolean DEFAULT false, -- Typologie du montant de cession : terrain
  l_type_b boolean DEFAULT false, -- Typologie du montant de cession : bâti
  l_type_c boolean DEFAULT false, -- Typologie du montant de cession : SHON
  l_observ character varying(255), -- Commentaires
  d_maj timestamp without time zone, -- Date de mise à jour des informations
  l_mfrais_g_ttc double precision, -- Montant des frais de géomètre TTC
  l_mfrais_n_ttc double precision, -- Montant des frais de notaires ttc
  l_mfrais_a_ttc double precision, -- Montant des autres frais (agence, ...)
  idsite character varying(10), -- Identifiant du site
  idces_d character varying(10), -- Ancien numéro de cession DynMap
  CONSTRAINT an_cession_pkey PRIMARY KEY (idces)
  
)
WITH (
  OIDS=FALSE
);
ALTER TABLE m_foncier.an_cession
  OWNER TO sig_create;

COMMENT ON TABLE m_foncier.an_cession
  IS 'Table alphanumérique contenant les données des cessions de lots';
COMMENT ON COLUMN m_foncier.an_cession.idces IS 'Identifiant du dossier de cession ou n° de dossier';
COMMENT ON COLUMN m_foncier.an_cession.l_rel IS 'Type de relation avec les lots';
COMMENT ON COLUMN m_foncier.an_cession.l_compo IS 'Composition de la cession : si true (coché) la cession ne correspond pas au lot vendu par le service économie (cf le commentaire pour plus de précision)';
COMMENT ON COLUMN m_foncier.an_cession.l_etat IS 'Code de l''état du dossier de cession';
COMMENT ON COLUMN m_foncier.an_cession.l_orga IS 'Code du nom de l''organisme';
COMMENT ON COLUMN m_foncier.an_cession.d_delib_1 IS 'Date de la délibération de l''organisme cédant 1 ou de décision du président en cas de droit de préemption';
COMMENT ON COLUMN m_foncier.an_cession.d_delib_2 IS 'Date de la délibération de l''organisme cédant 2';
COMMENT ON COLUMN m_foncier.an_cession.d_delib_3 IS 'Date de la délibération de l''organisme cédant 3';
COMMENT ON COLUMN m_foncier.an_cession.insee IS 'Code insee de la commune';
COMMENT ON COLUMN m_foncier.an_cession.l_date_i IS 'Date d''ouverture du dossier dans le SIG';
COMMENT ON COLUMN m_foncier.an_cession.l_voca IS 'Code de la vocation de la cession';
COMMENT ON COLUMN m_foncier.an_cession.l_acque IS 'Nom de l''acquéreur';
COMMENT ON COLUMN m_foncier.an_cession.l_parcelle_i IS 'Numéro(s) de(s) parcelle(s) initiale(s) concernée(s) par le périmètre';
COMMENT ON COLUMN m_foncier.an_cession.l_parcelle_f IS 'Numéro(s) de(s) nouvelle(s) parcelle(s) concernée(s) par le périmètre';
COMMENT ON COLUMN m_foncier.an_cession.d_esti_1 IS 'Date d''estimation des domaines 1';
COMMENT ON COLUMN m_foncier.an_cession.d_esti_2 IS 'Date d''estimation des domaines 2';
COMMENT ON COLUMN m_foncier.an_cession.d_esti_3 IS 'Date d''estimation des domaines 3';
COMMENT ON COLUMN m_foncier.an_cession.l_esti_ht IS 'Montant total de(s) estimation(s) des domaines';
COMMENT ON COLUMN m_foncier.an_cession.l_surf IS 'Superficie cadastrée du périmètre de cession en m²';
COMMENT ON COLUMN m_foncier.an_cession.l_condi IS 'Code de conditions de cession';
COMMENT ON COLUMN m_foncier.an_cession.l_type IS 'Code du type d''acte de cession';
COMMENT ON COLUMN m_foncier.an_cession.d_prome IS 'Date de la promesse de vente';
COMMENT ON COLUMN m_foncier.an_cession.d_acte IS 'Date de l''acte';
COMMENT ON COLUMN m_foncier.an_cession.l_notaire IS 'Code du nom de l''étude notariale';
COMMENT ON COLUMN m_foncier.an_cession.l_notaire_a IS 'Nom de l''étude notariale si pas dans la liste des études notariales du champ l_notaire';
COMMENT ON COLUMN m_foncier.an_cession.l_pvente_ht IS 'Montant de la vente HT';
COMMENT ON COLUMN m_foncier.an_cession.l_pvente_ttc IS 'Montant de la vente TTC';
COMMENT ON COLUMN m_foncier.an_cession.l_frais_a IS 'Type de frais : aucun (champ non utilisé)';
COMMENT ON COLUMN m_foncier.an_cession.l_frais_b IS 'Type de frais : Géomètre  (champ non utilisé)';
COMMENT ON COLUMN m_foncier.an_cession.l_frais_c IS 'Type de frais : Notaire  (champ non utilisé)';
COMMENT ON COLUMN m_foncier.an_cession.l_frais_d IS 'Type de frais : Agence immobilière  (champ non utilisé)';
COMMENT ON COLUMN m_foncier.an_cession.l_frais_e IS 'Type de frais : Indemnités diverses  (champ non utilisé)';
COMMENT ON COLUMN m_foncier.an_cession.l_mfrais_ht IS 'Frais cumulés de cession en € HT (champ non utilisé)';
COMMENT ON COLUMN m_foncier.an_cession.l_mfrais_ttc IS 'Frais cumulés de cession en € TTC';
COMMENT ON COLUMN m_foncier.an_cession.l_pvente_s IS 'Prix de vente en € HT au m² (sans les frais)';
COMMENT ON COLUMN m_foncier.an_cession.l_type_a IS 'Typologie du montant de cession : terrain';
COMMENT ON COLUMN m_foncier.an_cession.l_type_b IS 'Typologie du montant de cession : bâti';
COMMENT ON COLUMN m_foncier.an_cession.l_type_c IS 'Typologie du montant de cession : SHON';
COMMENT ON COLUMN m_foncier.an_cession.l_observ IS 'Commentaires';
COMMENT ON COLUMN m_foncier.an_cession.d_maj IS 'Date de mise à jour des informations';
COMMENT ON COLUMN m_foncier.an_cession.l_mfrais_g_ttc IS 'Montant des frais de géomètre TTC';
COMMENT ON COLUMN m_foncier.an_cession.l_mfrais_n_ttc IS 'Montant des frais de notaires ttc';
COMMENT ON COLUMN m_foncier.an_cession.l_mfrais_a_ttc IS 'Montant des autres frais (agence, ...)';
COMMENT ON COLUMN m_foncier.an_cession.idsite IS 'Identifiant du site';
COMMENT ON COLUMN m_foncier.an_cession.idces_d IS 'Ancien numéro de cession DynMap';


-- Trigger: t_t1_suivi on m_foncier.an_cession

-- DROP TRIGGER t_t1_suivi ON m_foncier.an_cession;

CREATE TRIGGER t_t1_suivi
  AFTER INSERT OR UPDATE OR DELETE
  ON m_foncier.an_cession
  FOR EACH ROW
  EXECUTE PROCEDURE m_economie.ft_r_suivi_audit();
ALTER TABLE m_foncier.an_cession DISABLE TRIGGER t_t1_suivi;

			  
-- ################################################# Classe des objets document de cessions ##################################

-- Table: m_foncier.an_fon_doc_media

-- DROP TABLE m_foncier.an_fon_doc_media;

CREATE TABLE m_foncier.an_fon_doc_media
(
  gid serial NOT NULL,
  id character varying(10), -- Identifiant de cession ou d'acquisition
  media text, -- Champ Média de GEO
  miniature bytea, -- Champ miniature de GEO
  n_fichier text, -- Nom du fichier
  t_fichier text, -- Type de média dans GEO
  op_sai character varying(100), -- Libellé de l'opérateur ayant intégrer le document
  date_sai timestamp without time zone, -- Date d'intégration du document
  l_type character varying(2), -- Code du type de document de cessions ou d'acquisitions
  l_prec character varying(50), -- Précision sur le document
  CONSTRAINT an_fon_doc_media_pkey PRIMARY KEY (gid)

)
WITH (
  OIDS=FALSE
);
ALTER TABLE m_foncier.an_fon_doc_media
  OWNER TO sig_create;

COMMENT ON TABLE m_foncier.an_fon_doc_media
  IS 'Table gérant la liste des documents de suivi d''une cession ou d''une acquisition et gérer avec le module média dans GEO (application Foncier)';
COMMENT ON COLUMN m_foncier.an_fon_doc_media.id IS 'Identifiant de cession ou d''acquisition';
COMMENT ON COLUMN m_foncier.an_fon_doc_media.media IS 'Champ Média de GEO';
COMMENT ON COLUMN m_foncier.an_fon_doc_media.miniature IS 'Champ miniature de GEO';
COMMENT ON COLUMN m_foncier.an_fon_doc_media.n_fichier IS 'Nom du fichier';
COMMENT ON COLUMN m_foncier.an_fon_doc_media.t_fichier IS 'Type de média dans GEO';
COMMENT ON COLUMN m_foncier.an_fon_doc_media.op_sai IS 'Libellé de l''opérateur ayant intégrer le document';
COMMENT ON COLUMN m_foncier.an_fon_doc_media.date_sai IS 'Date d''intégration du document';
COMMENT ON COLUMN m_foncier.an_fon_doc_media.l_type IS 'Code du type de document de cessions ou d''acquisitions';
COMMENT ON COLUMN m_foncier.an_fon_doc_media.l_prec IS 'Précision sur le document';


-- Trigger: t_t1_an_fon_doc_media_insert_date_sai on m_foncier.an_fon_doc_media

-- DROP TRIGGER t_t1_an_fon_doc_media_insert_date_sai ON m_foncier.an_fon_doc_media;

CREATE TRIGGER t_t1_an_fon_doc_media_insert_date_sai
  BEFORE INSERT
  ON m_foncier.an_fon_doc_media
  FOR EACH ROW
  EXECUTE PROCEDURE public.ft_r_timestamp_sai();

				  
-- ################################################# Classe des objets des acquisitions ##################################

-- Table: m_foncier.geo_fon_acqui

-- DROP TABLE m_foncier.geo_fon_acqui;

CREATE TABLE m_foncier.geo_fon_acqui
(
  idgeoaf integer NOT NULL DEFAULT nextval('m_foncier.ces_seq'::regclass), -- Identifiant unique de l'objet
  idacq character varying(10), -- Identifiant du dossier (issu de DynMap)
  l_etat character varying(2), -- Code de l'état de l'acquisition du foncier
  l_orga character varying(2), -- Code de l'organisme acquéreur
  d_delib1 timestamp without time zone, -- Date de la délibération (1)
  d_delib2 timestamp without time zone, -- Date de la délibération (2)
  d_delib3 timestamp without time zone, -- Date de la délibération (3)
  insee character varying(20), -- Code Insee de la commune
  d_int timestamp without time zone, -- Date d'ouverture du dossier
  l_voca character varying(2), -- Code de la vocation de l'acquisition
  lib_proprio character varying(100), -- Libellé du propriétaire initial
  lib_par_i character varying(254), -- Identifiant des parcelles initiales
  lib_par_f character varying(50), -- Identifiant des parcelles finales
  d_esti1 timestamp without time zone, -- Date d'estimation(1)
  d_esti2 timestamp without time zone, -- Date d'estimation(2)
  d_esti3 timestamp without time zone, -- Date d'estimation(3)
  m_esti double precision, -- Montant de l'estimation en € HT
  lib_surf integer, -- Surface cadastrée en m²
  l_condi character varying(2), -- Code de la condition de cession
  l_type character varying(2), -- Code du type d'acte
  d_prom timestamp without time zone, -- Date de la promesse de vente
  d_acte timestamp without time zone, -- Date de l'acte de vente
  l_notaire character varying(2), -- Code du Nom du notaire
  l_notaire_a character varying(50), -- Autre(s) notaire(s)
  m_acquiht double precision, -- Montant de l'acquisition en € HT
  m_acquittc double precision, -- Montant de l'acquisition en € TTC
  l_mfrais double precision, -- Montant des frais global
  l_mfrais_g_ttc double precision, -- Montant des frais de géomètre TTC
  l_mfrais_n_ttc double precision, -- Montant des frais de notaire TTC
  l_mfrais_a_ttc double precision, -- Montant des frais autres (agences, divers, ...) TTC
  l_macqui_s double precision, -- Montant de l'acquisition en € HT par m²
  l_type_a boolean, -- Type de montant : terrain
  l_type_b boolean, -- Type de montant : bâti
  l_type_c boolean, -- Type de montant : surface de plancher
  date_maj timestamp without time zone, -- Date de mise à jour des données
  geom geometry(MultiPolygon,2154),
  commune character varying(100),
  l_observ character varying(255), -- Observations diverses
  src_geom character varying DEFAULT '20'::character varying, -- Référentiel spatial utilisé pour la saisie
  idsite character varying(10), -- Identifiant unique du site
  CONSTRAINT geo_fon_acqui_pkey PRIMARY KEY (idgeoaf)
  
)
WITH (
  OIDS=FALSE
);
ALTER TABLE m_foncier.geo_fon_acqui
  OWNER TO sig_create;

COMMENT ON TABLE m_foncier.geo_fon_acqui
  IS 'Table contenant les données sur les acquisitons foncières réalisées par l''ARC et la ville de Compiègne';
COMMENT ON COLUMN m_foncier.geo_fon_acqui.idgeoaf IS 'Identifiant unique de l''objet';
COMMENT ON COLUMN m_foncier.geo_fon_acqui.idacq IS 'Identifiant du dossier (issu de DynMap)';
COMMENT ON COLUMN m_foncier.geo_fon_acqui.l_etat IS 'Code de l''état de l''acquisition du foncier';
COMMENT ON COLUMN m_foncier.geo_fon_acqui.l_orga IS 'Code de l''organisme acquéreur';
COMMENT ON COLUMN m_foncier.geo_fon_acqui.d_delib1 IS 'Date de la délibération (1)';
COMMENT ON COLUMN m_foncier.geo_fon_acqui.d_delib2 IS 'Date de la délibération (2)';
COMMENT ON COLUMN m_foncier.geo_fon_acqui.d_delib3 IS 'Date de la délibération (3)';
COMMENT ON COLUMN m_foncier.geo_fon_acqui.insee IS 'Code Insee de la commune';
COMMENT ON COLUMN m_foncier.geo_fon_acqui.d_int IS 'Date d''ouverture du dossier';
COMMENT ON COLUMN m_foncier.geo_fon_acqui.l_voca IS 'Code de la vocation de l''acquisition';
COMMENT ON COLUMN m_foncier.geo_fon_acqui.lib_proprio IS 'Libellé du propriétaire initial';
COMMENT ON COLUMN m_foncier.geo_fon_acqui.lib_par_i IS 'Identifiant des parcelles initiales';
COMMENT ON COLUMN m_foncier.geo_fon_acqui.lib_par_f IS 'Identifiant des parcelles finales';
COMMENT ON COLUMN m_foncier.geo_fon_acqui.d_esti1 IS 'Date d''estimation(1)';
COMMENT ON COLUMN m_foncier.geo_fon_acqui.d_esti2 IS 'Date d''estimation(2)';
COMMENT ON COLUMN m_foncier.geo_fon_acqui.d_esti3 IS 'Date d''estimation(3)';
COMMENT ON COLUMN m_foncier.geo_fon_acqui.m_esti IS 'Montant de l''estimation en € HT';
COMMENT ON COLUMN m_foncier.geo_fon_acqui.lib_surf IS 'Surface cadastrée en m²';
COMMENT ON COLUMN m_foncier.geo_fon_acqui.l_condi IS 'Code de la condition de cession';
COMMENT ON COLUMN m_foncier.geo_fon_acqui.l_type IS 'Code du type d''acte';
COMMENT ON COLUMN m_foncier.geo_fon_acqui.d_prom IS 'Date de la promesse de vente';
COMMENT ON COLUMN m_foncier.geo_fon_acqui.d_acte IS 'Date de l''acte de vente';
COMMENT ON COLUMN m_foncier.geo_fon_acqui.l_notaire IS 'Code du Nom du notaire';
COMMENT ON COLUMN m_foncier.geo_fon_acqui.l_notaire_a IS 'Autre(s) notaire(s)';
COMMENT ON COLUMN m_foncier.geo_fon_acqui.m_acquiht IS 'Montant de l''acquisition en € HT';
COMMENT ON COLUMN m_foncier.geo_fon_acqui.m_acquittc IS 'Montant de l''acquisition en € TTC';
COMMENT ON COLUMN m_foncier.geo_fon_acqui.l_mfrais IS 'Montant des frais global';
COMMENT ON COLUMN m_foncier.geo_fon_acqui.l_mfrais_g_ttc IS 'Montant des frais de géomètre TTC';
COMMENT ON COLUMN m_foncier.geo_fon_acqui.l_mfrais_n_ttc IS 'Montant des frais de notaire TTC';
COMMENT ON COLUMN m_foncier.geo_fon_acqui.l_mfrais_a_ttc IS 'Montant des frais autres (agences, divers, ...) TTC';
COMMENT ON COLUMN m_foncier.geo_fon_acqui.l_macqui_s IS 'Montant de l''acquisition en € HT par m²';
COMMENT ON COLUMN m_foncier.geo_fon_acqui.l_type_a IS 'Type de montant : terrain';
COMMENT ON COLUMN m_foncier.geo_fon_acqui.l_type_b IS 'Type de montant : bâti';
COMMENT ON COLUMN m_foncier.geo_fon_acqui.l_type_c IS 'Type de montant : surface de plancher';
COMMENT ON COLUMN m_foncier.geo_fon_acqui.date_maj IS 'Date de mise à jour des données';
COMMENT ON COLUMN m_foncier.geo_fon_acqui.l_observ IS 'Observations diverses';
COMMENT ON COLUMN m_foncier.geo_fon_acqui.src_geom IS 'Référentiel spatial utilisé pour la saisie';
COMMENT ON COLUMN m_foncier.geo_fon_acqui.idsite IS 'Identifiant unique du site';



-- Function: m_foncier.ft_m_ces_acq_idsite()

-- DROP FUNCTION m_foncier.ft_m_ces_acq_idsite();

CREATE OR REPLACE FUNCTION m_foncier.ft_m_ces_acq_idsite()
  RETURNS trigger AS
$BODY$


BEGIN


     
    -- insertion du numéro du site
    new.idsite := (SELECT DISTINCT
				idsite 
		  FROM 
				r_objet.geo_objet_site
		  WHERE
				st_intersects(st_pointonsurface(new.geom),geo_objet_site.geom) = true
		  );
  
    return new;
END;

$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
ALTER FUNCTION m_foncier.ft_m_ces_acq_idsite()
  OWNER TO sig_create;


-- Trigger: t_t1_idsite on m_foncier.geo_fon_acqui

-- DROP TRIGGER t_t1_idsite ON m_foncier.geo_fon_acqui;

CREATE TRIGGER t_t1_idsite
  BEFORE INSERT OR UPDATE
  ON m_foncier.geo_fon_acqui
  FOR EACH ROW
  EXECUTE PROCEDURE m_foncier.ft_m_ces_acq_idsite();

-- Trigger: t_t2_insee on m_foncier.geo_fon_acqui

-- DROP TRIGGER t_t2_insee ON m_foncier.geo_fon_acqui;

CREATE TRIGGER t_t2_insee
  BEFORE INSERT OR UPDATE
  ON m_foncier.geo_fon_acqui
  FOR EACH ROW
  EXECUTE PROCEDURE public.ft_r_commune_pl();

-- Trigger: t_t3_insert_date_maj on m_foncier.geo_fon_acqui

-- DROP TRIGGER t_t3_insert_date_maj ON m_foncier.geo_fon_acqui;

CREATE TRIGGER t_t3_insert_date_maj
  BEFORE INSERT OR UPDATE
  ON m_foncier.geo_fon_acqui
  FOR EACH ROW
  EXECUTE PROCEDURE public.ft_r_timestamp_maj();

-- ################################################# Classe des objets des relations cessions - lot ##################################
				  
-- Table: m_foncier.lk_cession_lot

-- DROP TABLE m_foncier.lk_cession_lot;

CREATE TABLE m_foncier.lk_cession_lot
(
  idgeolf integer NOT NULL, -- Identifiant géographique du lot
  idces character varying(6), -- Identifiant du dossier de cession
  CONSTRAINT lk_cession_lot_pkey PRIMARY KEY (idgeolf)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE m_foncier.lk_cession_lot
  OWNER TO sig_create;

COMMENT ON TABLE m_foncier.lk_cession_lot
  IS 'Table de lien entre les lots et les dossiers de cession';
COMMENT ON COLUMN m_foncier.lk_cession_lot.idgeolf IS 'Identifiant géographique du lot';
COMMENT ON COLUMN m_foncier.lk_cession_lot.idces IS 'Identifiant du dossier de cession';


-- ################################################# Du schéma s_sirene ##################################

-- ################################################# Classe des objets des établissements issus de la données SIRENE de l'INSEE ##################################

-- Table: s_sirene.an_etablissement

-- DROP TABLE s_sirene.an_etablissement;

CREATE TABLE s_sirene.an_etablissement
(
  siret character varying(14),
  siren character varying(9),
  nic integer,
  l1_nomen character varying(255),
  l2_comp character varying(255),
  l3_cadr character varying(255),
  l4_voie character varying(255),
  l5_disp character varying(255),
  l6_post character varying(255),
  l7_etrg character varying(255),
  rpet smallint,
  depet smallint,
  arronet smallint,
  ctonet smallint,
  comet smallint,
  libcom character varying(255),
  du smallint,
  tu smallint,
  uu smallint,
  epci numeric(255,0),
  tcd smallint,
  zemet smallint,
  codevoie character varying(255),
  numvoie integer,
  indrep character varying(255),
  typvoie character varying(255),
  libvoie character varying(255),
  codpos integer,
  cedex integer,
  zr1 character varying(255),
  siege smallint,
  enseigne character varying(255),
  nom_com character varying(255),
  natetab smallint,
  libnatetab character varying(255),
  apet700 character varying(255),
  libapet character varying(255),
  dapet integer,
  tefet character varying(255),
  efetcent character varying(255),
  defet integer,
  origine character varying(255),
  dcret integer,
  amintret integer,
  activnat character varying(255),
  lieuact character varying(255),
  actisurf smallint,
  saisonat character varying(255),
  modet character varying(255),
  prodet character varying(255),
  prodpart character varying(3),
  auxilt smallint,
  zr2 character varying(255),
  nomen_long character varying(255),
  sigle character varying(255),
  civilite smallint,
  nj integer,
  libnj character varying(255),
  apen700 character varying(255),
  libapen character varying(255),
  dapen integer,
  aprm character varying(255),
  tefen character varying(255),
  efencent character varying(255),
  defen integer,
  categorie character varying(255),
  dcren integer,
  amintren integer,
  monoact smallint,
  moden character varying(255),
  proden character varying(255),
  esaann integer,
  tca smallint,
  esaapen character varying(255),
  esasec1n character varying(255),
  esasec2n character varying(255),
  esasec3n character varying(255),
  esasec4n character varying(255),
  regimp smallint,
  monoreg smallint,
  zr3 character varying(255),
  rpen smallint,
  vmaj character varying(255),
  vmaj1 character varying(255),
  vmaj2 character varying(255),
  vmaj3 character varying(255),
  ind_publipo smallint,
  l_vetab character varying(2),
  dsortie date,
  dentree date,
  idgeoet integer,
  depcomen character varying(6),
  date_maj timestamp without time zone, -- Date de mise à jour des données (dernière intégration des mises à jour SIRENE)
  gid serial NOT NULL, -- Compteur (identifiant unique)
  CONSTRAINT an_etablissement_pkey PRIMARY KEY (gid)

)
WITH (
  OIDS=FALSE
);
ALTER TABLE s_sirene.an_etablissement
  OWNER TO sig_create;

COMMENT ON TABLE s_sirene.an_etablissement
  IS 'Liste des établissements de la base de données SIRENE depuis le fichier de livraison de juillet 2012. Les champs l_vetab, dsortie, dentree et idgeoet sont des champs de gestion interne pour le suivi des établissements actifs dans le fichier.';
COMMENT ON COLUMN s_sirene.an_etablissement.date_maj IS 'Date de mise à jour des données (dernière intégration des mises à jour SIRENE)';
COMMENT ON COLUMN s_sirene.an_etablissement.gid IS 'Compteur (identifiant unique)';



-- ################################################# Du schéma m_urbanisme_reg ##################################

-- ################################################# Classe des objets des procédures ##################################

-- Table: m_urbanisme_reg.an_proced

-- DROP TABLE m_urbanisme_reg.an_proced;

CREATE TABLE m_urbanisme_reg.an_proced
(
  idgeopo integer NOT NULL, -- Identifiant unique de l'entité géographique lot
  idsite character varying(10) NOT NULL, -- Identifiant du site d'appartenance
  l_ope_nom character varying(255), -- Libellé de l'opération
  l_ope_alias character varying(255), -- Alias du nom de l'opération
  dest character varying(2) DEFAULT '00'::character varying, -- Code de la destination du Site (issu de la liste des valeurs du modèle CNIG sur les PLU)
  z_proced character varying(2) DEFAULT '00'::character varying, -- Code de la procédure d'aménagement
  op_sai character varying(80), -- Libellé de la personne ayant saisie l'objet
  l_ope_phase character varying(2), -- Phase de l'opération
  l_ope_moa character varying(80), -- Maitrise d'ouvrage de l'opération
  l_conso_type character varying(2), -- Type de consommation foncière
  l_pr_urb boolean NOT NULL DEFAULT false, -- Procédure d'urbanisme
  date_crea date, -- Date de réalisation
  l_pr_fon boolean NOT NULL DEFAULT false, -- Procédure foncière
  l_pr_fon_date date, -- Date de la procédure foncière
  l_surf_ha double precision, -- Superficie totale programmée de l'opération en ha
  l_existe boolean NOT NULL DEFAULT true, -- Existance du site
  l_pr_fon_type character varying(2), -- Procédure foncière engagée
  l_ref_compta character varying(5), -- Référence comptable du projet
  l_observ character varying(255), -- Commentaire
  date_sai timestamp without time zone, -- Date de saisie des données attributaires
  date_maj timestamp without time zone, -- Date de mise à jour des données attributaires
  l_surf_cess_ha numeric(10,2), -- Surface cessible programmée en ha
  l_date_clo timestamp without time zone, -- Date de cloture de l'opération
  l_nb_log integer, -- Nombre total de logements programmés
  l_nb_logind integer, -- Nombre de logements individuels programmés
  l_nb_logindgr integer, -- Nombre de logements individuels groupés programmés
  l_nb_logcol integer, -- Nombre de logements collectifs programmés
  l_nb_logaide integer, -- Nombre total de logements aidés programmés
  l_nb_logaide_loc integer, -- Nombre total de logements aidés en location programmés
  l_nb_logaide_acc integer, -- Nombre total de logements en accession en location programmés
  l_nom_cp character varying(80), -- Nom du chef de projet suivant la procédure
  CONSTRAINT an_proced_pkey PRIMARY KEY (idgeopo)
  
)
WITH (
  OIDS=FALSE
);
ALTER TABLE m_urbanisme_reg.an_proced
  OWNER TO sig_create;

COMMENT ON TABLE m_urbanisme_reg.an_proced
  IS 'Table alphanumérique contenant les données des sites opérationnels gérés par l''ARC';
COMMENT ON COLUMN m_urbanisme_reg.an_proced.idgeopo IS 'Identifiant unique de l''entité géographique lot';
COMMENT ON COLUMN m_urbanisme_reg.an_proced.idsite IS 'Identifiant du site d''appartenance';
COMMENT ON COLUMN m_urbanisme_reg.an_proced.l_ope_nom IS 'Libellé de l''opération';
COMMENT ON COLUMN m_urbanisme_reg.an_proced.l_ope_alias IS 'Alias du nom de l''opération';
COMMENT ON COLUMN m_urbanisme_reg.an_proced.dest IS 'Code de la destination du Site (issu de la liste des valeurs du modèle CNIG sur les PLU)';
COMMENT ON COLUMN m_urbanisme_reg.an_proced.z_proced IS 'Code de la procédure d''aménagement';
COMMENT ON COLUMN m_urbanisme_reg.an_proced.op_sai IS 'Libellé de la personne ayant saisie l''objet';
COMMENT ON COLUMN m_urbanisme_reg.an_proced.l_ope_phase IS 'Phase de l''opération';
COMMENT ON COLUMN m_urbanisme_reg.an_proced.l_ope_moa IS 'Maitrise d''ouvrage de l''opération';
COMMENT ON COLUMN m_urbanisme_reg.an_proced.l_conso_type IS 'Type de consommation foncière';
COMMENT ON COLUMN m_urbanisme_reg.an_proced.l_pr_urb IS 'Procédure d''urbanisme';
COMMENT ON COLUMN m_urbanisme_reg.an_proced.date_crea IS 'Date de réalisation';
COMMENT ON COLUMN m_urbanisme_reg.an_proced.l_pr_fon IS 'Procédure foncière';
COMMENT ON COLUMN m_urbanisme_reg.an_proced.l_pr_fon_date IS 'Date de la procédure foncière';
COMMENT ON COLUMN m_urbanisme_reg.an_proced.l_surf_ha IS 'Superficie totale programmée de l''opération en ha';
COMMENT ON COLUMN m_urbanisme_reg.an_proced.l_existe IS 'Existance du site';
COMMENT ON COLUMN m_urbanisme_reg.an_proced.l_pr_fon_type IS 'Procédure foncière engagée';
COMMENT ON COLUMN m_urbanisme_reg.an_proced.l_ref_compta IS 'Référence comptable du projet';
COMMENT ON COLUMN m_urbanisme_reg.an_proced.l_observ IS 'Commentaire';
COMMENT ON COLUMN m_urbanisme_reg.an_proced.date_sai IS 'Date de saisie des données attributaires';
COMMENT ON COLUMN m_urbanisme_reg.an_proced.date_maj IS 'Date de mise à jour des données attributaires';
COMMENT ON COLUMN m_urbanisme_reg.an_proced.l_surf_cess_ha IS 'Surface cessible programmée en ha';
COMMENT ON COLUMN m_urbanisme_reg.an_proced.l_date_clo IS 'Date de cloture de l''opération';
COMMENT ON COLUMN m_urbanisme_reg.an_proced.l_nb_log IS 'Nombre total de logements programmés';
COMMENT ON COLUMN m_urbanisme_reg.an_proced.l_nb_logind IS 'Nombre de logements individuels programmés';
COMMENT ON COLUMN m_urbanisme_reg.an_proced.l_nb_logindgr IS 'Nombre de logements individuels groupés programmés';
COMMENT ON COLUMN m_urbanisme_reg.an_proced.l_nb_logcol IS 'Nombre de logements collectifs programmés';
COMMENT ON COLUMN m_urbanisme_reg.an_proced.l_nb_logaide IS 'Nombre total de logements aidés programmés';
COMMENT ON COLUMN m_urbanisme_reg.an_proced.l_nb_logaide_loc IS 'Nombre total de logements aidés en location programmés';
COMMENT ON COLUMN m_urbanisme_reg.an_proced.l_nb_logaide_acc IS 'Nombre total de logements en accession en location programmés';
COMMENT ON COLUMN m_urbanisme_reg.an_proced.l_nom_cp IS 'Nom du chef de projet suivant la procédure';


-- Trigger: t_t1_an_proced_date_maj on m_urbanisme_reg.an_proced

-- DROP TRIGGER t_t1_an_proced_date_maj ON m_urbanisme_reg.an_proced;

CREATE TRIGGER t_t1_an_proced_date_maj
  BEFORE INSERT OR UPDATE
  ON m_urbanisme_reg.an_proced
  FOR EACH ROW
  EXECUTE PROCEDURE public.ft_r_timestamp_maj();


				  
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

CONSTRAINT an_sa_lot_tact_fkey FOREIGN KEY (l_tact)
      REFERENCES m_economie.lt_sa_tact (l_tact) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
			 
  CONSTRAINT an_sa_site_etat_fkey FOREIGN KEY (site_etat)
      REFERENCES m_amenagement.lt_sa_etat (code) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT lt_sa_aidepb_fkey FOREIGN KEY (z_aide_pb)
      REFERENCES m_economie.lt_sa_aidepb (z_aide_pb) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT lt_sa_dest_fkey FOREIGN KEY (dest)
      REFERENCES m_economie.lt_sa_dest (dest) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT lt_sa_typo_fkey FOREIGN KEY (typo)
      REFERENCES m_economie.lt_sa_typo (typo) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT lt_sa_voca_fkey FOREIGN KEY (site_voca)
      REFERENCES m_economie.lt_sa_voca (site_voca) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION;

CONSTRAINT geo_sa_bal_srcgeom_fkey FOREIGN KEY (src_geom)
      REFERENCES r_objet.lt_src_geom (code) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT lt_bal_ecomm_fkey FOREIGN KEY (etat_comm)
      REFERENCES m_economie.lt_bal_ecomm (etat_comm) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT lt_bal_ncomm_fkey FOREIGN KEY (code_comm)
      REFERENCES m_economie.lt_bal_ncomm (code_comm) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT lt_bal_source_fkey FOREIGN KEY (source_maj)
      REFERENCES m_economie.lt_bal_source (source_maj) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT lt_bal_tlocal_fkey FOREIGN KEY (type_loc)
      REFERENCES m_economie.lt_bal_tlocal (type_loc) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION;

  CONSTRAINT geo_sa_etabp_srcgeom_fkey FOREIGN KEY (src_geom)
      REFERENCES r_objet.lt_src_geom (code) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION;
				  
  CONSTRAINT geo_sa_pole_srcgeom_fkey FOREIGN KEY (src_geom)
      REFERENCES r_objet.lt_src_geom (code) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT lt_sa_dest_fkey FOREIGN KEY (dest)
      REFERENCES m_economie.lt_sa_dest (dest) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION;
				  

  CONSTRAINT lt_amt_empesp_pu_fkey FOREIGN KEY (vocaep)
      REFERENCES m_amenagement.lt_amt_empesp_pu (vocaep) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION;
				  
  CONSTRAINT an_sa_lot_etatoccup_fkey FOREIGN KEY (etat_occup)
      REFERENCES m_amenagement.lt_sa_etat (code) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT an_sa_lot_l_amng2_fkey FOREIGN KEY (l_amng2)
      REFERENCES m_amenagement.lt_sa_stadeamng2 (code) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT an_sa_lot_l_comm2_fkey FOREIGN KEY (l_comm2)
      REFERENCES m_amenagement.lt_sa_stadecomm2 (code) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT an_sa_lot_stade_comm_fkey FOREIGN KEY (stade_comm)
      REFERENCES m_amenagement.lt_sa_stadecomm (code) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT an_sa_lot_stadeamng_fkey FOREIGN KEY (stade_amng)
      REFERENCES m_amenagement.lt_sa_stadeamng (code) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION;
				  
  CONSTRAINT an_amt_site_equ_etat_fkey FOREIGN KEY (site_etat)
      REFERENCES m_amenagement.lt_sa_etat (code) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION;

  CONSTRAINT an_amt_site_habitat_etat_fkey FOREIGN KEY (site_etat)
      REFERENCES m_amenagement.lt_sa_etat (code) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION;

 CONSTRAINT an_amt_site_mixte_etat_fkey FOREIGN KEY (site_etat)
      REFERENCES m_amenagement.lt_sa_etat (code) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT lt_sa_aidepb_fkey FOREIGN KEY (z_aide_pb)
      REFERENCES m_economie.lt_sa_aidepb (z_aide_pb) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT lt_sa_dest_fkey FOREIGN KEY (dest)
      REFERENCES m_economie.lt_sa_dest (dest) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT lt_sa_typo_fkey FOREIGN KEY (typo)
      REFERENCES m_economie.lt_sa_typo (typo) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT lt_sa_voca_fkey FOREIGN KEY (site_voca)
      REFERENCES m_economie.lt_sa_voca (site_voca) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION;
				  
CONSTRAINT lt_ces_cond_fkey FOREIGN KEY (l_condi)
      REFERENCES m_foncier.lt_ces_cond (l_condi) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT lt_ces_etat_fkey FOREIGN KEY (l_etat)
      REFERENCES m_foncier.lt_ces_etat (l_etat) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT lt_ces_nota_fkey FOREIGN KEY (l_notaire)
      REFERENCES m_foncier.lt_ces_nota (l_notaire) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT lt_ces_orga_fkey FOREIGN KEY (l_orga)
      REFERENCES m_foncier.lt_ces_orga (l_orga) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT lt_ces_tact_fkey FOREIGN KEY (l_type)
      REFERENCES m_foncier.lt_ces_tact (l_type) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT lt_ces_voca_fkey FOREIGN KEY (l_voca)
      REFERENCES m_foncier.lt_ces_voca (l_voca) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION;


  CONSTRAINT an_fon_doc_media_fkey FOREIGN KEY (l_type)
      REFERENCES m_foncier.lt_ces_doc (l_type) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION;

CONSTRAINT geo_fon_acqui_condi_fkey FOREIGN KEY (l_condi)
      REFERENCES m_foncier.lt_ces_cond (l_condi) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT geo_fon_acqui_notaire_fkey FOREIGN KEY (l_notaire)
      REFERENCES m_foncier.lt_ces_nota (l_notaire) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT geo_fon_acqui_srcgeom_fkey FOREIGN KEY (src_geom)
      REFERENCES r_objet.lt_src_geom (code) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT geo_fon_acqui_type_fkey FOREIGN KEY (l_type)
      REFERENCES m_foncier.lt_ces_tact (l_type) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT geo_fon_acquis_etat_fkey FOREIGN KEY (l_etat)
      REFERENCES m_foncier.lt_ces_etat (l_etat) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT geo_fon_acquis_orga_fkey FOREIGN KEY (l_orga)
      REFERENCES m_foncier.lt_ces_orga (l_orga) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT geo_fon_acquis_voca_fkey FOREIGN KEY (l_voca)
      REFERENCES m_foncier.lt_ces_voca (l_voca) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION;
				  
  CONSTRAINT lt_vetab_fkey FOREIGN KEY (l_vetab)
      REFERENCES s_sirene.lt_vetab (l_vetab) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION;

CONSTRAINT an_proced_consotype_fkey FOREIGN KEY (l_conso_type)
      REFERENCES m_urbanisme_reg.lt_conso_type (l_conso_type) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT an_proced_phase_fkey FOREIGN KEY (l_ope_phase)
      REFERENCES m_urbanisme_reg.lt_ope_phase (l_ope_phase) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT an_proced_prfontype_fkey FOREIGN KEY (l_pr_fon_type)
      REFERENCES m_urbanisme_reg.lt_pr_fon_typ (l_pr_fon_type) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT lt_amt_peri_ope_z_proced_fkey FOREIGN KEY (z_proced)
      REFERENCES m_urbanisme_reg.lt_proced (z_proced) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT lt_destdomi_fkey FOREIGN KEY (dest)
      REFERENCES m_urbanisme_doc.lt_destdomi (destdomi) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION;		
				  
  CONSTRAINT geo_amt_zae_scr_geom_fkey FOREIGN KEY (src_geom)
      REFERENCES r_objet.lt_src_geom (code) MATCH SIMPLE
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

-- Index: m_economie.idx_an_site_doc_media_id

-- DROP INDEX m_economie.idx_an_site_doc_media_id;

CREATE INDEX idx_an_site_doc_media_id
  ON m_economie.an_site_doc_media
  USING btree
  (id COLLATE pg_catalog."default");
			 

-- Index: m_economie.geo_sa_bal_geom_idx

-- DROP INDEX m_economie.geo_sa_bal_geom_idx;

CREATE INDEX geo_sa_bal_geom_idx
  ON m_economie.geo_sa_bal
  USING gist
  (geom);

-- Index: m_economie.idx_geo_sa_bal_code_comm

-- DROP INDEX m_economie.idx_geo_sa_bal_code_comm;

CREATE INDEX idx_geo_sa_bal_code_comm
  ON m_economie.geo_sa_bal
  USING btree
  (code_comm COLLATE pg_catalog."default");

-- Index: m_economie.idx_geo_sa_bal_etat_comm

-- DROP INDEX m_economie.idx_geo_sa_bal_etat_comm;

CREATE INDEX idx_geo_sa_bal_etat_comm
  ON m_economie.geo_sa_bal
  USING btree
  (etat_comm COLLATE pg_catalog."default");

-- Index: m_economie.idx_geo_sa_bal_idsite

-- DROP INDEX m_economie.idx_geo_sa_bal_idsite;

CREATE INDEX idx_geo_sa_bal_idsite
  ON m_economie.geo_sa_bal
  USING btree
  (idsite COLLATE pg_catalog."default");

-- Index: m_economie.idx_geo_sa_bal_source_maj

-- DROP INDEX m_economie.idx_geo_sa_bal_source_maj;

CREATE INDEX idx_geo_sa_bal_source_maj
  ON m_economie.geo_sa_bal
  USING btree
  (source_maj COLLATE pg_catalog."default");

-- Index: m_economie.idx_geo_sa_bal_type_loc

-- DROP INDEX m_economie.idx_geo_sa_bal_type_loc;

CREATE INDEX idx_geo_sa_bal_type_loc
  ON m_economie.geo_sa_bal
  USING btree
  (type_loc COLLATE pg_catalog."default");
				 

-- Index: m_economie.geo_sa_etabp_geom_idx

-- DROP INDEX m_economie.geo_sa_etabp_geom_idx;

CREATE INDEX geo_sa_etabp_geom_idx
  ON m_economie.geo_sa_etabp
  USING gist
  (geom);


-- Index: m_economie.geo_sa_pole_geom_idx

-- DROP INDEX m_economie.geo_sa_pole_geom_idx;

CREATE INDEX geo_sa_pole_geom_idx
  ON m_economie.geo_sa_pole
  USING gist
  (geom);

				  
-- Index: m_economie.geo_sa_site_zu_geom_idx

-- DROP INDEX m_economie.geo_sa_site_zu_geom_idx;

CREATE INDEX geo_sa_site_zu_geom_idx
  ON m_economie.geo_sa_site_zu
  USING gist
  (geom);

- Index: m_foncier.an_fon_doc_media_id_idx

-- DROP INDEX m_foncier.an_fon_doc_media_id_idx;

CREATE INDEX an_fon_doc_media_id_idx
  ON m_foncier.an_fon_doc_media
  USING btree
  (id COLLATE pg_catalog."default");

-- Index: m_foncier.idx_an_fon_doc_media_l_type

-- DROP INDEX m_foncier.idx_an_fon_doc_media_l_type;

CREATE INDEX idx_an_fon_doc_media_l_type
  ON m_foncier.an_fon_doc_media
  USING btree
  (l_type COLLATE pg_catalog."default");
				  
-- Index: m_foncier.geo_fon_acqui_geom_idx

-- DROP INDEX m_foncier.geo_fon_acqui_geom_idx;

CREATE INDEX geo_fon_acqui_geom_idx
  ON m_foncier.geo_fon_acqui
  USING gist
  (geom);

-- Index: m_foncier.idx_lk_cession_lot_idces

-- DROP INDEX m_foncier.idx_lk_cession_lot_idces;

CREATE INDEX idx_lk_cession_lot_idces
  ON m_foncier.lk_cession_lot
  USING btree
  (idces COLLATE pg_catalog."default");
				 
-- Index: s_sirene.idx_an_etablissement_apet700

-- DROP INDEX s_sirene.idx_an_etablissement_apet700;

CREATE INDEX idx_an_etablissement_apet700
  ON s_sirene.an_etablissement
  USING btree
  (apet700 COLLATE pg_catalog."default");

-- Index: s_sirene.idx_an_etablissement_siret

-- DROP INDEX s_sirene.idx_an_etablissement_siret;

CREATE INDEX idx_an_etablissement_siret
  ON s_sirene.an_etablissement
  USING btree
  (siret COLLATE pg_catalog."default");
