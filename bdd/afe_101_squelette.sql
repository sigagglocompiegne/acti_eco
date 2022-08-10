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

/* LISTE DE VALEUR */
DROP TABLE IF EXISTS m_activite_eco.lt_eco_dest;

/* SEQUENCE */
DROP SEQUENCE IF EXISTS m_activite_eco.geo_eco_pole_seq;


-- ####################################################################################################################################################
-- ###                                                                                                                                              ###
-- ###                                                                SCHEMA                                                                        ###
-- ###                                                                                                                                              ###
-- ####################################################################################################################################################

-- SCHEMA: m_activite_eco

-- DROP SCHEMA m_activite_eco ;

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



-- ####################################################################################################################################################
-- ###                                                                                                                                              ###
-- ###                                                                SEQUENCE                                                                      ###
-- ###                                                                                                                                              ###
-- ####################################################################################################################################################

-- ################################################# [nom séquence] ##################################

-- SEQUENCE: m_activite_eco.geo_eco_pole_seq

-- DROP SEQUENCE m_activite_eco.geo_eco_pole_seq;

CREATE SEQUENCE m_activite_eco.geo_eco_pole_seq
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 9223372036854775807
    CACHE 1;

ALTER SEQUENCE m_activite_eco.geo_eco_pole_seq
    OWNER TO create_sig;

GRANT ALL ON SEQUENCE m_activite_eco.geo_eco_pole_seq TO PUBLIC;
GRANT ALL ON SEQUENCE m_activite_eco.geo_eco_pole_seq TO create_sig;


-- ####################################################################################################################################################
-- ###                                                                                                                                              ###
-- ###                                                                DOMAINES DE VALEURS                                                           ###
-- ###                                                                                                                                              ###
-- ####################################################################################################################################################

-- ################################################################# Domaine valeur - [lt_eco_dest]  ###############################################

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





-- ####################################################################################################################################################
-- ###                                                                                                                                              ###
-- ###                                                                TABLE                                                                         ###
-- ###                                                                                                                                              ###
-- ####################################################################################################################################################


-- ################################################# [geo_eco_pole] ##################################

-- Table: m_activite_eco.an_eco_pole

-- DROP TABLE m_activite_eco.an_eco_pole;

CREATE TABLE m_activite_eco.an_eco_pole
(
    idpole integer NOT NULL DEFAULT nextval('m_activite_eco.geo_eco_pole_seq'::regclass),
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
    IS 'Identifiant unique du pôle d''activité';

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



-- Table: m_economie.an_sa_site

-- DROP TABLE m_economie.an_sa_site;

CREATE TABLE m_economie.an_sa_site
(
    idsite integer COLLATE pg_catalog."default",
    idsitereg character varying(7) COLLATE pg_catalog."default",
    idpole integer,
    site_voca character varying(2) COLLATE pg_catalog."default" DEFAULT '00'::character varying,
    site_nom character varying(80) COLLATE pg_catalog."default",
    site_etat character varying(2) COLLATE pg_catalog."default" DEFAULT '00'::character varying,
    date_int date,
    op_sai character varying(80) COLLATE pg_catalog."default",
    org_sai character varying(80) COLLATE pg_catalog."default",
    typo character varying(2) COLLATE pg_catalog."default" DEFAULT '00'::character varying,
    dest character varying(2) COLLATE pg_catalog."default" DEFAULT '00'::character varying,
    p_implant character varying(10) COLLATE pg_catalog."default",
    z_mai_ouvr character varying(80) COLLATE pg_catalog."default",
    z_compet character varying(80) COLLATE pg_catalog."default",
    z_amng character varying(80) COLLATE pg_catalog."default",
    z_gest character varying(80) COLLATE pg_catalog."default",
    z_anim character varying(80) COLLATE pg_catalog."default",
    z_comm character varying(80) COLLATE pg_catalog."default",
    contact character varying(80) COLLATE pg_catalog."default",
    z_cession double precision,
    z_env character varying(80) COLLATE pg_catalog."default",
    z_paysage character varying(80) COLLATE pg_catalog."default",
    z_rehab character varying(80) COLLATE pg_catalog."default",
    z_epu character varying(3) COLLATE pg_catalog."default",
    z_dechet character varying(80) COLLATE pg_catalog."default",
    z_tr_slect character varying(3) COLLATE pg_catalog."default",
    res_ass double precision,
    res_pluvia double precision,
    res_eau double precision,
    res_gaz double precision,
    res_elect double precision,
    res_net character varying(80) COLLATE pg_catalog."default",
    res_db_net double precision,
    z_auto character varying(10) COLLATE pg_catalog."default",
    z_dst_auto double precision,
    z_tps_auto double precision,
    z_ar_f character varying(80) COLLATE pg_catalog."default",
    z_dst_ar_f double precision,
    z_ar_v character varying(80) COLLATE pg_catalog."default",
    z_dst_ar_v double precision,
    z_fr_f character varying(80) COLLATE pg_catalog."default",
    z_dst_fr_f double precision,
    z_fr_v character varying(80) COLLATE pg_catalog."default",
    z_dst_fr_v double precision,
    z_pmm character varying(3) COLLATE pg_catalog."default",
    z_dst_pmm double precision,
    serv_tc integer,
    circ_douce character varying(3) COLLATE pg_catalog."default",
    serv_rest integer,
    serv_crech integer,
    serv_autre character varying(80) COLLATE pg_catalog."default",
    serv_collt character varying(80) COLLATE pg_catalog."default",
    z_aide_pb character varying(2) COLLATE pg_catalog."default",
    l_dated_aide_pb date,
    l_datef_aide_pb date,
    date_sai timestamp without time zone,
    date_maj timestamp without time zone,
    d_paris integer,
    t_paris integer,
    d_lille integer,
    t_lille integer,
    l_dauto character varying(200) COLLATE pg_catalog."default",
    l_dtgvhp integer,
    l_ttgvhp integer,
    l_dtgvcdg integer,
    l_ttgvcdg integer,
    l_tgcomp integer,
    l_dtille integer,
    l_ttille integer,
    l_dcdg integer,
    l_tcdg integer,
    l_dlesquin integer,
    l_tlesquin integer,
    zae boolean,
    l_cc_aep_lib character varying(100) COLLATE pg_catalog."default",
    l_cc_aep_nom character varying(100) COLLATE pg_catalog."default",
    l_cc_aep_poste character varying(50) COLLATE pg_catalog."default",
    l_cc_aep_tel character varying(15) COLLATE pg_catalog."default",
    l_cc_aep_telp character varying(15) COLLATE pg_catalog."default",
    l_cc_aep_mail character varying(50) COLLATE pg_catalog."default",
    l_cc_elect_lib character varying(100) COLLATE pg_catalog."default",
    l_cc_elect_nom character varying(100) COLLATE pg_catalog."default",
    l_cc_elect_poste character varying(50) COLLATE pg_catalog."default",
    l_cc_elect_tel character varying(15) COLLATE pg_catalog."default",
    l_cc_elect_telp character varying(15) COLLATE pg_catalog."default",
    l_cc_elect_mail character varying(50) COLLATE pg_catalog."default",
    l_cc_gaz_lib character varying(100) COLLATE pg_catalog."default",
    l_cc_gaz_nom character varying(100) COLLATE pg_catalog."default",
    l_cc_gaz_poste character varying(50) COLLATE pg_catalog."default",
    l_cc_gaz_tel character varying(15) COLLATE pg_catalog."default",
    l_cc_gaz_telp character varying(15) COLLATE pg_catalog."default",
    l_cc_gaz_mail character varying(50) COLLATE pg_catalog."default",
    l_cc_tel_lib character varying(100) COLLATE pg_catalog."default",
    l_cc_tel_nom character varying(100) COLLATE pg_catalog."default",
    l_cc_tel_poste character varying(50) COLLATE pg_catalog."default",
    l_cc_tel_tel character varying(15) COLLATE pg_catalog."default",
    l_cc_tel_telp character varying(15) COLLATE pg_catalog."default",
    l_cc_tel_mail character varying(50) COLLATE pg_catalog."default",
    serv_tc_g boolean NOT NULL DEFAULT false,
    serv_tc_lig character varying(50) COLLATE pg_catalog."default",
    serv_tc_pas integer,
    commune character varying(255) COLLATE pg_catalog."default",
    CONSTRAINT an_sa_site_pkey PRIMARY KEY (idsite),
    CONSTRAINT an_sa_site_etat_fkey FOREIGN KEY (site_etat)
        REFERENCES m_amenagement.lt_sa_etat (code) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT lt_sa_aidepb_fkey FOREIGN KEY (z_aide_pb)
        REFERENCES m_economie.lt_sa_aidepb (z_aide_pb) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT lt_sa_dest_fkey FOREIGN KEY (dest)
        REFERENCES m_economie.lt_sa_dest (dest) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT lt_sa_typo_fkey FOREIGN KEY (typo)
        REFERENCES m_economie.lt_sa_typo (typo) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT lt_sa_voca_fkey FOREIGN KEY (site_voca)
        REFERENCES m_economie.lt_sa_voca (site_voca) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE m_economie.an_sa_site
    OWNER to create_sig;

GRANT ALL ON TABLE m_economie.an_sa_site TO sig_create;

GRANT SELECT ON TABLE m_economie.an_sa_site TO sig_read;

GRANT ALL ON TABLE m_economie.an_sa_site TO create_sig;

GRANT INSERT, SELECT, UPDATE, DELETE ON TABLE m_economie.an_sa_site TO sig_edit;

COMMENT ON TABLE m_economie.an_sa_site
    IS 'Information alphanumérique sur les Sites d''activités économiques. Les objets virtuels de référence sont gérés dans le schéma r_objet';

COMMENT ON COLUMN m_economie.an_sa_site.idsite
    IS 'Identifiant du site d''activités';

COMMENT ON COLUMN m_economie.an_sa_site.idpole
    IS 'Identifiant du pôle d''appartenance';

COMMENT ON COLUMN m_economie.an_sa_site.site_voca
    IS 'Code de la vocation simplifiée de la zone';

COMMENT ON COLUMN m_economie.an_sa_site.site_nom
    IS 'Libellé du site';

COMMENT ON COLUMN m_economie.an_sa_site.site_etat
    IS 'Code de l''état du site';

COMMENT ON COLUMN m_economie.an_sa_site.date_int
    IS 'Date d''intégration par GéoPicardie dans la base (permet de connaître la dernière donnée intégrée)';

COMMENT ON COLUMN m_economie.an_sa_site.op_sai
    IS 'Libellé de la personne ayant saisie la mise à jour';

COMMENT ON COLUMN m_economie.an_sa_site.org_sai
    IS 'Organisme de saisie dont dépend l''opérateur de saisie';

COMMENT ON COLUMN m_economie.an_sa_site.typo
    IS 'Typologie du site';

COMMENT ON COLUMN m_economie.an_sa_site.dest
    IS 'Destination initiale du site (défini dans les documents d''urbanisme)';

COMMENT ON COLUMN m_economie.an_sa_site.p_implant
    IS 'Première implantation des entreprises sur le site (année ou date)';

COMMENT ON COLUMN m_economie.an_sa_site.z_mai_ouvr
    IS 'Nom du maître d''ouvrage';

COMMENT ON COLUMN m_economie.an_sa_site.z_compet
    IS 'Nom de la collectivité ayant dans ses compétences le développement de la zone';

COMMENT ON COLUMN m_economie.an_sa_site.z_amng
    IS 'Nom de l''aménageur de la zone';

COMMENT ON COLUMN m_economie.an_sa_site.z_gest
    IS 'Nom du gestionnaire de la zone';

COMMENT ON COLUMN m_economie.an_sa_site.z_anim
    IS 'Nom de l''animateur de la zone';

COMMENT ON COLUMN m_economie.an_sa_site.z_comm
    IS 'Structure de contact pour la commercialisation';

COMMENT ON COLUMN m_economie.an_sa_site.contact
    IS 'Libellé de la personne contact pour la commercialisation';

COMMENT ON COLUMN m_economie.an_sa_site.z_cession
    IS 'Conditions de cession en HT (euro/m²)';

COMMENT ON COLUMN m_economie.an_sa_site.z_env
    IS 'Démarche environnementale';

COMMENT ON COLUMN m_economie.an_sa_site.z_paysage
    IS 'Démarche paysagère';

COMMENT ON COLUMN m_economie.an_sa_site.z_rehab
    IS 'Procédure de réhabilitaion du site';

COMMENT ON COLUMN m_economie.an_sa_site.z_epu
    IS 'Traitement de l''eau d''épuration';

COMMENT ON COLUMN m_economie.an_sa_site.z_dechet
    IS 'Libellé du gestionnaire des déchets';

COMMENT ON COLUMN m_economie.an_sa_site.z_tr_slect
    IS 'Présence d''un tri sélectif sur le site';

COMMENT ON COLUMN m_economie.an_sa_site.res_ass
    IS 'Linéaire de réseau d''assainissement';

COMMENT ON COLUMN m_economie.an_sa_site.res_pluvia
    IS 'Linéaire de réseau d''eau pluviale';

COMMENT ON COLUMN m_economie.an_sa_site.res_eau
    IS 'Débit du réseau d''eau potable';

COMMENT ON COLUMN m_economie.an_sa_site.res_gaz
    IS 'Débit du réseau de gaz';

COMMENT ON COLUMN m_economie.an_sa_site.res_elect
    IS 'Débit du réseau électrique';

COMMENT ON COLUMN m_economie.an_sa_site.res_net
    IS 'Type de réseau internet';

COMMENT ON COLUMN m_economie.an_sa_site.res_db_net
    IS 'Débit internet';

COMMENT ON COLUMN m_economie.an_sa_site.z_auto
    IS 'Libellé de l''autoroute la plus proche';

COMMENT ON COLUMN m_economie.an_sa_site.z_dst_auto
    IS 'Distance en km du diffuseur autoroutier par la route';

COMMENT ON COLUMN m_economie.an_sa_site.z_tps_auto
    IS 'Temps d''accès en minutes du diffuseur autoroutier par la route';

COMMENT ON COLUMN m_economie.an_sa_site.z_ar_f
    IS 'Nom de l''aéroport fret le plus proche';

COMMENT ON COLUMN m_economie.an_sa_site.z_dst_ar_f
    IS 'Distance en km de l''aéroport de fret par la route';

COMMENT ON COLUMN m_economie.an_sa_site.z_ar_v
    IS 'Nom de l''aéroport de voyageurs le plus proche';

COMMENT ON COLUMN m_economie.an_sa_site.z_dst_ar_v
    IS 'Distance en km de l''aéroport de voyageurs par la route';

COMMENT ON COLUMN m_economie.an_sa_site.z_fr_f
    IS 'Gare de fret la plus proche';

COMMENT ON COLUMN m_economie.an_sa_site.z_dst_fr_f
    IS 'Distance en km de la gare de fret la plus proche par la route';

COMMENT ON COLUMN m_economie.an_sa_site.z_fr_v
    IS 'Gare de voyageurs la plus proche';

COMMENT ON COLUMN m_economie.an_sa_site.z_dst_fr_v
    IS 'Distance en km de la gare de voyageurs la plus proche par la route';

COMMENT ON COLUMN m_economie.an_sa_site.z_pmm
    IS 'Présence d''une plate-forme multimodale';

COMMENT ON COLUMN m_economie.an_sa_site.z_dst_pmm
    IS 'Distance en km de la plate-forme multimodale la plus proche par la route';

COMMENT ON COLUMN m_economie.an_sa_site.serv_tc
    IS 'Nombre de ligne de transport en commun desservant le site';

COMMENT ON COLUMN m_economie.an_sa_site.circ_douce
    IS 'Accès aux sites par un mode doux (pistes cyclables)';

COMMENT ON COLUMN m_economie.an_sa_site.serv_rest
    IS 'Nombre de restaurants ou à proximité immédiate';

COMMENT ON COLUMN m_economie.an_sa_site.serv_crech
    IS 'Nombre de crèches ou à proximité immédiate';

COMMENT ON COLUMN m_economie.an_sa_site.serv_autre
    IS 'Libellé des autres services disponibles sur le site';

COMMENT ON COLUMN m_economie.an_sa_site.serv_collt
    IS 'Services collectifs présent sur le site (mutualisation, partage de services)';

COMMENT ON COLUMN m_economie.an_sa_site.z_aide_pb
    IS 'Code de valeurs des aides publiques appliquées sur le site (AFR, ZFU, ZRR, aucun)';

COMMENT ON COLUMN m_economie.an_sa_site.l_dated_aide_pb
    IS 'Date de début de la période des aides publiques';

COMMENT ON COLUMN m_economie.an_sa_site.l_datef_aide_pb
    IS 'Date de fin de la période des aides publiques';

COMMENT ON COLUMN m_economie.an_sa_site.date_sai
    IS 'Date de saisie des données attributaires';

COMMENT ON COLUMN m_economie.an_sa_site.date_maj
    IS 'Date de mise à jour des données attributaires';

COMMENT ON COLUMN m_economie.an_sa_site.d_paris
    IS 'Distance en km de paris';

COMMENT ON COLUMN m_economie.an_sa_site.t_paris
    IS 'Temps d''accès à Paris en minutes';

COMMENT ON COLUMN m_economie.an_sa_site.d_lille
    IS 'Distance en km d''accès à Lille';

COMMENT ON COLUMN m_economie.an_sa_site.t_lille
    IS 'Temps d''accès à Lille en minutes';

COMMENT ON COLUMN m_economie.an_sa_site.l_dauto
    IS 'Libellé du diffuseur autoroutier le plus proche';

COMMENT ON COLUMN m_economie.an_sa_site.l_dtgvhp
    IS 'Distance de la gare RGV Haute Picardie';

COMMENT ON COLUMN m_economie.an_sa_site.l_ttgvhp
    IS 'Temps d''accès à la gare TGV Haute Picardie';

COMMENT ON COLUMN m_economie.an_sa_site.l_dtgvcdg
    IS 'Distance de la Gare TGV Roissy-Charles de Gaulle';

COMMENT ON COLUMN m_economie.an_sa_site.l_ttgvcdg
    IS 'Temps d''accès à la Gare TGV Roissy-Charles de Gaulle';

COMMENT ON COLUMN m_economie.an_sa_site.l_tgcomp
    IS 'Temps d''accès à la gare de Compiègne';

COMMENT ON COLUMN m_economie.an_sa_site.l_dtille
    IS 'Distance de l''aéroport de Beauvais-Tillé';

COMMENT ON COLUMN m_economie.an_sa_site.l_ttille
    IS 'Temps d''accès à l''aéroport de Beauvais-Tillé';

COMMENT ON COLUMN m_economie.an_sa_site.l_dcdg
    IS 'Distance de l''aéroport de Roissy-Charles de Gaulle';

COMMENT ON COLUMN m_economie.an_sa_site.l_tcdg
    IS 'Temps d''accès à l''aéroport de Roissy-Charles de Gaulle';

COMMENT ON COLUMN m_economie.an_sa_site.l_dlesquin
    IS 'Distance de l''aéroport de Lille-Lesquin';

COMMENT ON COLUMN m_economie.an_sa_site.l_tlesquin
    IS 'Temps d''accès à l''aéroport Lille-Lesquin';

COMMENT ON COLUMN m_economie.an_sa_site.zae
    IS 'Information sur le fait que le site soit une ZAE (sauf celle indiquée dans la table m_amenagement.geo_amt_zae)  ou non (compétence ARC selon la délibération du CA du 21 décembre 2017). Cette donnée permet de créer une vue matérialisée des ZAE complètes (geo_vmr_zae) avec les informations de la table m_amenagement.geo_amt_zae';

COMMENT ON COLUMN m_economie.an_sa_site.l_cc_aep_lib
    IS 'Nom du concessionnaire de l''eau potable';

COMMENT ON COLUMN m_economie.an_sa_site.l_cc_aep_nom
    IS 'Nom du contact du concessionnaire d''eau potable';

COMMENT ON COLUMN m_economie.an_sa_site.l_cc_aep_poste
    IS 'Libellé du poste du contact du concessionnaire d''eau potable';

COMMENT ON COLUMN m_economie.an_sa_site.l_cc_aep_tel
    IS 'Numéro de téléphone du contact du concessionnaire d''eau potable';

COMMENT ON COLUMN m_economie.an_sa_site.l_cc_aep_telp
    IS 'Numéro de téléphone portable du contact du concessionnaire d''eau potable';

COMMENT ON COLUMN m_economie.an_sa_site.l_cc_aep_mail
    IS 'Mail du contact du concessionnaire d''eau potable';

COMMENT ON COLUMN m_economie.an_sa_site.l_cc_elect_lib
    IS 'Nom du concessionnaire d''électricité';

COMMENT ON COLUMN m_economie.an_sa_site.l_cc_elect_nom
    IS 'Nom du contact du concessionnaire d''électricité';

COMMENT ON COLUMN m_economie.an_sa_site.l_cc_elect_poste
    IS 'Libellé du poste du contact du concessionnaire d''électricité';

COMMENT ON COLUMN m_economie.an_sa_site.l_cc_elect_tel
    IS 'Numéro de téléphone du contact du concessionnaire d''électricité';

COMMENT ON COLUMN m_economie.an_sa_site.l_cc_elect_telp
    IS 'Numéro de téléphone portable du contact du concessionnaire d''électricité';

COMMENT ON COLUMN m_economie.an_sa_site.l_cc_elect_mail
    IS 'Mail du contact du concessionnaire d''électricité';

COMMENT ON COLUMN m_economie.an_sa_site.l_cc_gaz_lib
    IS 'Nom du concessionnaire de gaz';

COMMENT ON COLUMN m_economie.an_sa_site.l_cc_gaz_nom
    IS 'Nom du contact du concessionnaire de gaz';

COMMENT ON COLUMN m_economie.an_sa_site.l_cc_gaz_poste
    IS 'Libellé du poste du contact du concessionnaire de gaz';

COMMENT ON COLUMN m_economie.an_sa_site.l_cc_gaz_tel
    IS 'Numéro de téléphone du contact du concessionnaire de gaz';

COMMENT ON COLUMN m_economie.an_sa_site.l_cc_gaz_telp
    IS 'Numéro de téléphone portable du contact du concessionnaire de gaz';

COMMENT ON COLUMN m_economie.an_sa_site.l_cc_gaz_mail
    IS 'Mail du contact du concessionnaire de gaz';

COMMENT ON COLUMN m_economie.an_sa_site.l_cc_tel_lib
    IS 'Nom du concessionnaire télécom';

COMMENT ON COLUMN m_economie.an_sa_site.l_cc_tel_nom
    IS 'Nom du contact du concessionnaire télécom';

COMMENT ON COLUMN m_economie.an_sa_site.l_cc_tel_poste
    IS 'Libellé du poste du contact du concessionnaire télécom';

COMMENT ON COLUMN m_economie.an_sa_site.l_cc_tel_tel
    IS 'Numéro de téléphone du contact du concessionnaire télécom';

COMMENT ON COLUMN m_economie.an_sa_site.l_cc_tel_telp
    IS 'Numéro de téléphone portable du contact du concessionnaire télécom';

COMMENT ON COLUMN m_economie.an_sa_site.l_cc_tel_mail
    IS 'Mail du contact du concessionnaire télécom';

COMMENT ON COLUMN m_economie.an_sa_site.serv_tc_g
    IS 'Service de transport en commun gratuit';

COMMENT ON COLUMN m_economie.an_sa_site.serv_tc_lig
    IS 'Ligne de transport en commun desservant le site';

COMMENT ON COLUMN m_economie.an_sa_site.serv_tc_pas
    IS 'Nombre de passage quotidien cumulés des lignes de transport en commun desservant le site';

COMMENT ON COLUMN m_economie.an_sa_site.commune
    IS 'Libellé des communes d''assises du site d''activités';
COMMENT ON CONSTRAINT an_sa_site_pkey ON m_economie.an_sa_site
    IS 'Clé primaire de la table geo_sa_p_site';





				  
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



