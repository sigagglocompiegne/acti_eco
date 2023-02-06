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
--------------

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
---------------------

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
-- DROP TABLE IF EXISTS m_amenagement.lt_amt_empesp_pu;
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

-- tables :
-----------

-- DROP TABLE IF EXISTS m_activite_eco.an_eco_bati_loc_media;
-- DROP TABLE IF EXISTS m_activite_eco.an_eco_contact;
-- DROP TABLE IF EXISTS m_activite_eco.an_eco_dia;
-- DROP TABLE IF EXISTS m_activite_eco.an_eco_etab;
-- DROP TABLE IF EXISTS m_activite_eco.an_eco_etab_rad;
-- DROP TABLE IF EXISTS m_activite_eco.an_eco_evenmt;
-- DROP TABLE IF EXISTS m_activite_eco.an_eco_evenmt_media;
-- DROP TABLE IF EXISTS m_activite_eco.an_eco_loc_act;
-- DROP TABLE IF EXISTS m_activite_eco.an_eco_loc_media;
-- DROP TABLE IF EXISTS m_activite_eco.an_eco_log;
-- DROP TABLE IF EXISTS m_activite_eco.an_eco_lot;
-- DROP TABLE IF EXISTS m_activite_eco.an_eco_lot_media;
-- DROP TABLE IF EXISTS m_activite_eco.an_eco_media;
-- DROP TABLE IF EXISTS m_activite_eco.an_eco_pole;
-- DROP TABLE IF EXISTS m_activite_eco.geo_eco_etabp;
-- DROP TABLE IF EXISTS m_activite_eco.geo_eco_loc_act;
-- DROP TABLE IF EXISTS m_activite_eco.geo_eco_site;
-- DROP TABLE IF EXISTS m_activite_eco.h_an_eco_etab;
-- DROP TABLE IF EXISTS m_activite_eco.h_an_eco_site;
-- DROP TABLE IF EXISTS m_activite_eco.h_an_eco_site_emploi;
-- DROP TABLE IF EXISTS m_activite_eco.lk_adresseetablissement;
-- DROP TABLE IF EXISTS m_activite_eco.lk_eco_contact;
-- DROP TABLE IF EXISTS m_activite_eco.lk_eco_etab_site;
-- DROP TABLE IF EXISTS m_activite_eco.lk_eco_loc_adr;
-- DROP TABLE IF EXISTS m_activite_eco.lk_eco_loc_etab;
-- DROP TABLE IF EXISTS m_activite_eco.lk_eco_loc_evenmt_contact;
-- DROP TABLE IF EXISTS m_activite_eco.lk_eco_loc_site;
-- DROP TABLE IF EXISTS m_activite_eco.lk_eco_proc;
-- DROP TABLE IF EXISTS m_activite_eco.lk_passageadresse;
-- DROP TABLE IF EXISTS m_amenagement.an_amt_esppu;
-- DROP TABLE IF EXISTS m_amenagement.an_amt_esppublic;
-- DROP TABLE IF EXISTS m_amenagement.an_amt_lot_divers;
-- DROP TABLE IF EXISTS m_amenagement.an_amt_lot_equip;
-- DROP TABLE IF EXISTS m_amenagement.an_amt_lot_esppublic;
-- DROP TABLE IF EXISTS m_amenagement.an_amt_lot_habitat;
-- DROP TABLE IF EXISTS m_amenagement.an_amt_lot_mixt;
-- DROP TABLE IF EXISTS m_amenagement.an_amt_lot_stade
-- DROP TABLE IF EXISTS m_amenagement.lk_amt_lot_site;
-- DROP TABLE IF EXISTS m_urbanisme_reg.an_proc_media;
-- DROP TABLE IF EXISTS m_urbanisme_reg.an_proced_log;
-- DROP TABLE IF EXISTS m_urbanisme_reg.geo_proced;
-- DROP TABLE IF EXISTS r_objet.geo_objet_empesp_pu;
-- DROP TABLE IF EXISTS r_objet.geo_objet_fon_lot;

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
-- ###                                                                     FONCTIONS                                                                ###
-- ###                                                                                                                                              ###
-- ####################################################################################################################################################

-- ##########################################################################################################
-- ################################################# SCHEMA M_ACTIVITE_ECO ##################################
-- ##########################################################################################################

-- ################################################################# ft_m_after_insert_loc  ###############################################

-- FUNCTION: m_activite_eco.ft_m_after_insert_loc()
-- DROP FUNCTION m_activite_eco.ft_m_after_insert_loc();

CREATE OR REPLACE FUNCTION m_activite_eco.ft_m_after_insert_loc()
    RETURNS trigger
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE NOT LEAKPROOF
AS $BODY$

BEGIN

  INSERT INTO m_activite_eco.an_eco_loc_act (idloc,typ2,occup)
  SELECT idloc,
  CASE
  	WHEN new.typ1 = '10' THEN '50'  
	WHEN new.typ1 = '20' THEN '40'
	WHEN new.typ1 = '30' THEN '30'
	WHEN new.typ1 = '40' THEN '10' 
  ELSE '00'
  END
  ,'00' FROM m_activite_eco.geo_eco_loc_act WHERE idloc = new.idloc;

  return new;
END;

$BODY$;

COMMENT ON FUNCTION m_activite_eco.ft_m_after_insert_loc()
    IS 'Fonction gérant l''intégration d''un local par défaut à la saisie d''bâtiment';

-- ################################################################# ft_m_an_eco_etab_l_nom_null  ###############################################

CREATE OR REPLACE FUNCTION m_activite_eco.ft_m_an_eco_etab_l_nom_null()
    RETURNS trigger
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE NOT LEAKPROOF
AS $BODY$

begin

 -- gestion des valeurs '' quand suppression d'une valeur dans une fiche GEO
 update m_activite_eco.an_eco_etab set l_nom = null where l_nom = '';        

	return new; 
end;

$BODY$;

COMMENT ON FUNCTION m_activite_eco.ft_m_an_eco_etab_l_nom_null()
    IS 'Fonction forçant le champ à null quand insertion ou mise à jour de l''attribut pour éviter les '''' (pb d''afficchage des étiquettes dans GEO)';

-- ################################################################# ft_m_an_eco_log  ###############################################

CREATE OR REPLACE FUNCTION m_activite_eco.ft_m_an_eco_log()
    RETURNS trigger
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE NOT LEAKPROOF
AS $BODY$

DECLARE v_idlog integer;
DECLARE v_dataold character varying(50000);
DECLARE v_datanew character varying(50000);
DECLARE v_name_table character varying(254);

BEGIN

-- INSERT
IF (TG_OP = 'INSERT') THEN

  v_idlog := nextval('m_activite_eco.an_eco_log_seq'::regclass);
  v_datanew := ROW(NEW.*); ------------------------------------ On concatène tous les attributs dans un seul

  ---
  INSERT INTO m_activite_eco.an_eco_log (idlog, tablename, type_ope, dataold, datanew, date_maj)
  SELECT
  v_idlog,
  TG_TABLE_NAME,
  'INSERT',
  NULL,
  v_datanew,
  now();

  ---
  
  RETURN NEW;
  

-- UPDATE
ELSIF (TG_OP = 'UPDATE') THEN 
  ---
  
   v_idlog := nextval('m_activite_eco.an_eco_log_seq'::regclass);
  v_dataold := ROW(OLD.*);------------------------------------ On concatène tous les anciens attributs dans un seul
  v_datanew := ROW(NEW.*);------------------------------------ On concatène tous les nouveaux attributs dans un seul	
  v_name_table := TG_TABLE_NAME;

  ---
  
  INSERT INTO m_activite_eco.an_eco_log (idlog, tablename,  type_ope, dataold, datanew, date_maj)
  SELECT
  v_idlog,
  v_name_table,
  'UPDATE',
  v_dataold,
  v_datanew,
  now();
  RETURN NEW;

-- DELETE
ELSIF (TG_OP = 'DELETE') THEN 
  ---
  
  v_idlog := nextval('m_activite_eco.an_eco_log_seq'::regclass);
  v_dataold := ROW(OLD.*);------------------------------------ On concatène tous les anciens attributs dans un seul
  v_name_table := TG_TABLE_NAME;

  ---
  
  INSERT INTO m_activite_eco.an_eco_log (idlog, tablename,  type_ope, dataold, datanew, date_maj)
  SELECT
  v_idlog,
  v_name_table,
  'DELETE',
  v_dataold,
  NULL,
  now();
  RETURN NEW;
  

END IF;

end;

$BODY$;

COMMENT ON FUNCTION m_activite_eco.ft_m_an_eco_log()
    IS 'Fonction gérant l''insertion d''une opération effectuée sur les données d''activités économique dans la table des logs';

-- #################################################################  ft_m_before_modif_loc  ###############################################

CREATE OR REPLACE FUNCTION m_activite_eco.ft_m_before_modif_loc()
    RETURNS trigger
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE NOT LEAKPROOF
AS $BODY$

BEGIN

  IF (SELECT count(*) FROM m_activite_eco.an_eco_loc_act WHERE idloc = new.idloc) =0 THEN
  
   INSERT INTO m_activite_eco.an_eco_loc_act (idloc,typ2,occup)
   SELECT idloc,
   CASE
  	 WHEN new.typ1 = '10' THEN '50'  
	 WHEN new.typ1 = '20' THEN '40'
	 WHEN new.typ1 = '30' THEN '30'
	 WHEN new.typ1 = '40' THEN '10' 
   ELSE '00'
   END
   ,'00' FROM m_activite_eco.geo_eco_loc_act WHERE idloc = new.idloc;
   
  
   END IF;

return new;
END;

$BODY$;

COMMENT ON FUNCTION m_activite_eco.ft_m_before_modif_loc()
    IS 'Fonction gérant l''intégration d''un local par défaut à la modification d'' un bâtiment si pas de local';


-- #################################################################  ft_m_controle_saisie_contact  ###############################################

CREATE OR REPLACE FUNCTION m_activite_eco.ft_m_controle_saisie_contact()
    RETURNS trigger
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE NOT LEAKPROOF
AS $BODY$

BEGIN
    
    IF (trim(new.telp) IS NULL OR trim(new.telp) = '') AND (trim(new.tel) IS NULL OR trim(new.tel) = '') AND (trim(new.email) IS NULL OR trim(new.email) = '') THEN
	RAISE EXCEPTION 'Vous devez au moins remplir un n° de téléphone ou un email pour créer un contact';
	END IF;
	IF  trim(new.tel) IS NOT NULL AND trim(new.tel) <> '' THEN
		IF left(new.tel,1) <> '0' THEN
			RAISE EXCEPTION 'Le numéro de téléphone ne peut commencer que par le chiffre 0.';
		END IF;
	END IF;
    IF trim(new.telp) IS NOT NULL AND trim(new.telp) <> '' THEN
	   IF left(new.telp,1) <> '0' THEN
        	RAISE EXCEPTION 'Le numéro de téléphone portable ne peut commencer que par le chiffre 0.';
	   END IF;
	END IF;	
    IF trim(new.tel) IS NOT NULL AND trim(new.tel) <> '' THEN
		IF (SELECT to_number(new.tel,'999999999')) < 10000000 OR (SELECT to_number(new.tel,'999999999')) > 99999999 THEN
        RAISE EXCEPTION 'Le numéro de téléphone ne correspond pas à un numéro valide.';
		END IF;
	END IF;	
	IF trim(new.telp) IS NOT NULL AND trim(new.telp) <> '' THEN
		IF (SELECT to_number(new.telp,'999999999')) < 10000000 OR (SELECT to_number(new.telp,'999999999')) > 99999999 THEN
        RAISE EXCEPTION 'Le numéro de téléphone portable ne correspond pas à un numéro valide.';
		END IF;
	END IF;	
	IF trim(new.tel) IS NOT NULL AND trim(new.tel) <> '' THEN
	     IF length(new.tel)-1 <> length(to_number(new.tel,'9999999999')::text) THEN
		 RAISE EXCEPTION 'Le numéro de téléphone saisie contient des lettres ou des caractères non chiffrés.';
		 END IF;

    END IF;
	IF trim(new.telp) IS NOT NULL AND trim(new.telp) <> '' THEN
	     IF length(new.telp)-1 <> length(to_number(new.telp,'9999999999')::text) THEN
		 RAISE EXCEPTION 'Le numéro de téléphone portable saisie contient des lettres ou des caractères non chiffrés.';
		 END IF;
	END IF;
	IF trim(new.email) IS NOT NULL AND trim(new.email) <> '' THEN
	   IF trim(new.email) not like '%@%' THEN
	   RAISE EXCEPTION 'Votre email ne contient pas le caractère @.';
	   END IF;
	END IF;
	IF trim(new.email) IS NOT NULL AND trim(new.email) <> '' THEN
	   IF trim(new.email) not like '%.%' THEN
	   RAISE EXCEPTION 'Votre email ne contient pas le caractère .fr, .com, ...';
	   END IF;
	END IF;

    return new ;
END;

$BODY$;

COMMENT ON FUNCTION m_activite_eco.ft_m_controle_saisie_contact()
    IS 'Fonction de contrôle de saisie d''un contact';


-- #################################################################  ft_m_delete_an_eco_contact  ###############################################

CREATE OR REPLACE FUNCTION m_activite_eco.ft_m_delete_an_eco_contact()
    RETURNS trigger
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE NOT LEAKPROOF
AS $BODY$

BEGIN

     	DELETE FROM m_activite_eco.lk_eco_contact WHERE idcontact = old.idcontact;
		DELETE FROM m_activite_eco.lk_eco_loc_evenmt_contact WHERE idcontact = old.idcontact;

     return new ;

END;

$BODY$;

COMMENT ON FUNCTION m_activite_eco.ft_m_delete_an_eco_contact()
    IS 'Fonction gérant la suppression des contacts dans les tables de relation avec les objets';


-- #################################################################  ft_m_delete_an_eco_evenmt  ###############################################

CREATE OR REPLACE FUNCTION m_activite_eco.ft_m_delete_an_eco_evenmt()
    RETURNS trigger
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE NOT LEAKPROOF
AS $BODY$

BEGIN

     	DELETE FROM m_activite_eco.lk_eco_loc_evenmt_contact WHERE idevenmt = old.idevenmt;
		
return new ;

END;

$BODY$;

COMMENT ON FUNCTION m_activite_eco.ft_m_delete_an_eco_evenmt()
    IS 'Fonction gérant la suppression des contacts dans les tables de relation avec les objets';



-- #################################################################  ft_m_delete_loc_rel  ###############################################

CREATE OR REPLACE FUNCTION m_activite_eco.ft_m_delete_loc_rel()
    RETURNS trigger
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE NOT LEAKPROOF
AS $BODY$

BEGIN

     	DELETE FROM m_activite_eco.lk_eco_loc_site WHERE idloc = old.idloc;
	   /* DELETE FROM m_activite_eco.lk_eco_bati_loc WHERE idloc = old.idloc; */
		DELETE FROM m_activite_eco.lk_eco_contact WHERE idobjet = old.idloc;
		DELETE FROM m_activite_eco.an_eco_loc_act WHERE idloc = old.idloc;

     return new ;

END;

$BODY$;

COMMENT ON FUNCTION m_activite_eco.ft_m_delete_loc_rel()
    IS 'Fonction gérant la suppression des relations dans les tables de relation avec les sites et les locaux d''activités';

-- #################################################################  ft_m_delete_site  ###############################################

CREATE OR REPLACE FUNCTION m_activite_eco.ft_m_delete_site()
    RETURNS trigger
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE NOT LEAKPROOF
AS $BODY$

BEGIN

	DELETE FROM m_activite_eco.lk_eco_etab_site WHERE idsite = old.idsite;
	DELETE FROM m_activite_eco.lk_eco_loc_site WHERE idsite = old.idsite;
	DELETE FROM m_amenagement.lk_amt_lot_site WHERE idsite = old.idsite;

return new ;

END;

$BODY$;

COMMENT ON FUNCTION m_activite_eco.ft_m_delete_site()
    IS 'Fonction gérant la suppression d''appartenance d''un établissement à un site d''activité quand celui-ci est supprimé';

-- #################################################################  ft_m_etabp_null  ###############################################

CREATE OR REPLACE FUNCTION m_activite_eco.ft_m_etabp_null()
    RETURNS trigger
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE NOT LEAKPROOF
AS $BODY$

BEGIN

    -- insertion du numéro du site
    UPDATE m_activite_eco.geo_eco_etabp SET idsiren = null WHERE idsiren='';
    UPDATE m_activite_eco.geo_eco_etabp SET idsiret = null WHERE idsiret='';
    UPDATE m_activite_eco.geo_eco_etabp SET op_sai = null WHERE op_sai='';
    UPDATE m_activite_eco.geo_eco_etabp SET nom = null WHERE nom='';
    UPDATE m_activite_eco.geo_eco_etabp SET source_eff = null WHERE source_eff='';
    UPDATE m_activite_eco.geo_eco_etabp SET ape = null WHERE ape='';
    UPDATE m_activite_eco.geo_eco_etabp SET observ = null WHERE observ='';
    return new ;
END;

$BODY$;

COMMENT ON FUNCTION m_activite_eco.ft_m_etabp_null()
    IS 'Fonction gérant le formatage des attributs des établissements spécifiques à null à la mise à jour pour éviter les faux null à l''enregistrement';


-- #################################################################  ft_m_geo_eco_etabp_idobjet  ###############################################

-CREATE OR REPLACE FUNCTION m_activite_eco.ft_m_geo_eco_etabp_idobjet()
    RETURNS trigger
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE NOT LEAKPROOF
AS $BODY$

BEGIN

new.idobjet := 'EHS' || new.idgeoet;

return new ;

END;

$BODY$;

COMMENT ON FUNCTION m_activite_eco.ft_m_geo_eco_etabp_idobjet()
    IS 'Fonction gérant le reconstruction de l''identifiant objet pour l''association des contacts dans les relations n--m dans GEO';


-- #################################################################  ft_m_geo_eco_etabp_site  ###############################################

CREATE OR REPLACE FUNCTION m_activite_eco.ft_m_geo_eco_etabp_site()
    RETURNS trigger
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE NOT LEAKPROOF
AS $BODY$

BEGIN

IF (TG_OP = 'INSERT') THEN
        --RAISE EXCEPTION USING MESSAGE = 'OK insert: ' || new.siret; 
		-- association d'un établissement à un ou plusieurs sites
		INSERT INTO m_activite_eco.lk_eco_etab_site (idsite,siret)
		SELECT s.idsite, 'EHS' || new.idgeoet 
			FROM m_activite_eco.geo_eco_site s
		WHERE 
		st_intersects(NEW.geom,s.geom) IS TRUE;

ELSIF (TG_OP = 'UPDATE') THEN

       DELETE FROM m_activite_eco.lk_eco_etab_site WHERE siret = 'EHS' || old.idgeoet;
	   
	   	-- association d'un établissement à un ou plusieurs sites
		INSERT INTO m_activite_eco.lk_eco_etab_site (idsite,siret)
		SELECT s.idsite, 'EHS' || new.idgeoet 
			FROM m_activite_eco.geo_eco_site s
		WHERE 
		st_intersects(NEW.geom,s.geom) IS TRUE;

ELSIF (TG_OP = 'DELETE') THEN

	DELETE FROM m_activite_eco.lk_eco_etab_site WHERE siret = 'EHS' || old.idgeoet;
	DELETE FROM m_activite_eco.lk_eco_contact WHERE idobjet = 'EHS' || old.idgeoet;

END IF;

return new ;

END;

$BODY$;

COMMENT ON FUNCTION m_activite_eco.ft_m_geo_eco_etabp_site()
    IS 'Fonction gérant l''insertion d''appartenance d''un établissement (hors SIRENE) à un ou plusieurs sites d''activité';

-- #################################################################  ft_m_geo_eco_loc_act_delete  ###############################################

CREATE OR REPLACE FUNCTION m_activite_eco.ft_m_geo_eco_loc_act_delete()
    RETURNS trigger
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE NOT LEAKPROOF
AS $BODY$

BEGIN
    

	DELETE FROM m_activite_eco.an_eco_evenmt WHERE idobjet = old.idloc;
	DELETE FROM m_activite_eco.lk_eco_loc_adr WHERE idloc = old.idloc;
	DELETE FROM m_activite_eco.an_eco_media WHERE id = old.idloc;
	DELETE FROM m_activite_eco.lk_eco_contact WHERE idobjet =  old.idloc;
	
    return new ;
END;

$BODY$;

COMMENT ON FUNCTION m_activite_eco.ft_m_geo_eco_loc_act_delete()
    IS 'Fonction gérant la suppression en cascade des informations liées aux locaux d''activité quand suppression';

-- #################################################################  ft_m_insert_etab_site  ###############################################

CREATE OR REPLACE FUNCTION m_activite_eco.ft_m_insert_etab_site()
    RETURNS trigger
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE NOT LEAKPROOF
AS $BODY$

BEGIN

IF (TG_OP = 'INSERT') THEN
        --RAISE EXCEPTION USING MESSAGE = 'OK insert: ' || new.siret; 
		-- association d'un établissement à un ou plusieurs sites
		INSERT INTO m_activite_eco.lk_eco_etab_site (idsite,siret)
		SELECT s.idsite, new.siret 
			FROM m_activite_eco.geo_eco_site s, x_apps.xapps_geo_vmr_adresse a, m_activite_eco.lk_adresseetablissement ae
		WHERE ae.siret = new.siret AND ae.idadresse = a.id_adresse AND
		
		st_intersects(a.geom,s.geom) IS TRUE;

ELSIF (TG_OP = 'UPDATE') THEN

       DELETE FROM m_activite_eco.lk_eco_etab_site WHERE siret = old.siret;
	   
	   	-- association d'un établissement à un ou plusieurs sites
		INSERT INTO m_activite_eco.lk_eco_etab_site (idsite,siret)
		SELECT s.idsite, new.siret 
			FROM m_activite_eco.geo_eco_site s, x_apps.xapps_geo_vmr_adresse a, m_activite_eco.lk_adresseetablissement ae
		WHERE ae.siret = new.siret AND ae.idadresse = a.id_adresse AND
		
		st_intersects(a.geom,s.geom) IS TRUE;

ELSIF (TG_OP = 'DELETE') THEN

	DELETE FROM m_activite_eco.lk_eco_etab_site WHERE siret = old.siret;

END IF;

return new ;

END;

$BODY$;

COMMENT ON FUNCTION m_activite_eco.ft_m_insert_etab_site()
    IS 'Fonction gérant l''insertion d''appartenance d''un établissement à un ou plusieurs sites d''activité';

-- #################################################################  ft_m_insert_update_epci  ###############################################

CREATE OR REPLACE FUNCTION m_activite_eco.ft_m_insert_update_epci()
    RETURNS trigger
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE NOT LEAKPROOF
AS $BODY$

begin

-- insertion de l'epci depuis la table des utilisateurs de GEO
IF TG_OP = 'INSERT' THEN

new.epci := (SELECT values FROM public.custom_attributes WHERE name = 'epci' AND user_login = NEW.op_sai);

ELSEIF TG_OP = 'UPDATE' THEN

new.epci := (SELECT values FROM public.custom_attributes WHERE name = 'epci' AND user_login = NEW.op_sai);

END IF;

return new; 

end;

$BODY$;

COMMENT ON FUNCTION m_activite_eco.ft_m_insert_update_epci()
    IS 'Fonction insérant le nom de l''EPCI comme autorité compétente du contact permettant d''étanchéifier l''accès aux données dans l''application GEO';

-- #################################################################  ft_m_insert_update_loc_lot  ###############################################

CREATE OR REPLACE FUNCTION m_activite_eco.ft_m_insert_update_loc_lot()
    RETURNS trigger
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE NOT LEAKPROOF
AS $BODY$

BEGIN
   
IF TG_OP = 'INSERT' THEN   
     new.idgeolf := (SELECT f.idgeolf FROM r_objet.geo_objet_fon_lot f WHERE st_intersects(new.geom,f.geom) IS TRUE);
	 
ELSEIF TG_OP = 'UPDATE' THEN
	 IF st_equals(old.geom,new.geom) IS FALSE THEN
	 new.idgeolf := (SELECT f.idgeolf FROM r_objet.geo_objet_fon_lot f WHERE st_intersects(new.geom,f.geom) IS TRUE);
	 END IF;

END IF;

     return new ;

END;

$BODY$;

COMMENT ON FUNCTION m_activite_eco.ft_m_insert_update_loc_lot()
    IS 'Fonction gérant la récupération de l''idgeolf dans la classe geo_eco_loc_act';

-- #################################################################  ft_m_insert_update_loc_lot  ###############################################

CREATE OR REPLACE FUNCTION m_activite_eco.ft_m_insert_update_loc_rel()
    RETURNS trigger
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE NOT LEAKPROOF
AS $BODY$

BEGIN

IF TG_OP = 'INSERT' THEN
     	-- association d'un local à un ou plusieurs sites
		INSERT INTO m_activite_eco.lk_eco_loc_site (idsite,idloc)
		SELECT idsite, new.idloc FROM m_activite_eco.geo_eco_site WHERE st_intersects(new.geom,geom) IS TRUE;
		
		/*
        -- association d'un local à un bâtiment
		INSERT INTO m_activite_eco.lk_eco_bati_loc (idbati,idloc)
		SELECT idbati, new.idloc FROM m_activite_eco.geo_eco_bati_act WHERE st_intersects(st_pointonsurface(new.geom),geom) IS TRUE;
		*/
		
ELSEIF TG_OP = 'UPDATE' THEN

		IF st_equals(old.geom, new.geom) IS FALSE THEN
		    -- je supprime l'ancienne relation
			DELETE FROM m_activite_eco.lk_eco_loc_site WHERE idloc = new.idloc;
			-- association d'un local à un ou plusieurs sites
			INSERT INTO m_activite_eco.lk_eco_loc_site (idsite,idloc)
			SELECT idsite, new.idloc FROM m_activite_eco.geo_eco_site WHERE st_intersects(new.geom,geom) IS TRUE;
		END IF;

END IF;

     return new ;

END;

$BODY$;

COMMENT ON FUNCTION m_activite_eco.ft_m_insert_update_loc_rel()
    IS 'Fonction gérant l''affectation des locaux aux différentes échelles de relations (site, bâtiment)';

-- #################################################################  ft_m_insert_update_site  ###############################################

CREATE OR REPLACE FUNCTION m_activite_eco.ft_m_insert_update_site()
    RETURNS trigger
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE NOT LEAKPROOF
AS $BODY$

BEGIN

new.geom1 := st_multi(st_buffer(new.geom,-0.5));

IF (TG_OP = 'INSERT') THEN

		INSERT INTO m_activite_eco.lk_eco_etab_site (idsite,siret)
		SELECT new.idsite, ae.siret 
			FROM x_apps.xapps_geo_vmr_adresse a, m_activite_eco.lk_adresseetablissement ae
		WHERE ae.idadresse = a.id_adresse AND
		st_intersects(a.geom,new.geom) IS TRUE;
		
		INSERT INTO m_activite_eco.lk_eco_loc_site (idloc,idsite)
		SELECT l.idloc, new.idsite 
			FROM m_activite_eco.geo_eco_loc_act l
		WHERE st_intersects(l.geom,new.geom) IS TRUE;
		
		INSERT INTO m_amenagement.lk_amt_lot_site (idsite,idgeolf)
		SELECT new.idsite, l.idgeolf
			FROM r_objet.geo_objet_fon_lot l
		WHERE st_intersects(st_pointonsurface(l.geom),new.geom) IS TRUE;

ELSIF (TG_OP = 'UPDATE') THEN
	--	RAISE EXCEPTION 'Ok';
       -- vérification des geom
	   IF st_equals(old.geom, new.geom) IS false THEN
       DELETE FROM m_activite_eco.lk_eco_etab_site WHERE idsite = old.idsite;
	   DELETE FROM m_activite_eco.lk_eco_loc_site WHERE idsite = old.idsite;
	   DELETE FROM m_amenagement.lk_amt_lot_site WHERE idsite = old.idsite;
	   
	   	-- association d'un établissement à un ou plusieurs sites
		INSERT INTO m_activite_eco.lk_eco_etab_site (idsite,siret)
		SELECT new.idsite, ae.siret 
			FROM x_apps.xapps_geo_vmr_adresse a, m_activite_eco.lk_adresseetablissement ae
		WHERE ae.idadresse = a.id_adresse AND
		st_intersects(a.geom,new.geom) IS TRUE;
		
		-- association des bâtiments à un site
		INSERT INTO m_activite_eco.lk_eco_loc_site (idloc,idsite)
		SELECT l.idloc, new.idsite 
			FROM m_activite_eco.geo_eco_loc_act l
		WHERE st_intersects(st_pointonsurface(l.geom),new.geom) IS TRUE;
		
		-- association d'un site aux lots
		INSERT INTO m_amenagement.lk_amt_lot_site (idsite,idgeolf)
		SELECT new.idsite, l.idgeolf
			FROM r_objet.geo_objet_fon_lot l
		WHERE st_intersects(st_pointonsurface(l.geom),new.geom) IS TRUE;
		
		END IF;

END IF;

return new ;

END;

$BODY$;

COMMENT ON FUNCTION m_activite_eco.ft_m_insert_update_site()
    IS 'Fonction gérant l''appartenance d''un établissement à un ou plusieurs sites d''activité à la création d''un site, à sa mise à jour';

-- #################################################################  ft_m_lk_adresseetablissement_compte_after  ###############################################

CREATE OR REPLACE FUNCTION m_activite_eco.ft_m_lk_adresseetablissement_compte_after()
    RETURNS trigger
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE NOT LEAKPROOF
AS $BODY$

BEGIN

-- refraichissement de la vue matérialisée des points établissements à l'adresse
REFRESH MATERIALIZED VIEW m_activite_eco.xapps_geo_vmr_etab_api;
REFRESH MATERIALIZED VIEW m_activite_eco.xapps_an_vmr_site_act_10;
REFRESH MATERIALIZED VIEW m_activite_eco.xapps_geo_vmr_etab_api_export_site;

return new;

END;

$BODY$;

COMMENT ON FUNCTION m_activite_eco.ft_m_lk_adresseetablissement_compte_after()
    IS 'Fonction gérant le rafraichissement des vues matérialisées concernées après la mise à jour d''une adresse (géolocalisation) d''un établissement Sirene';

-- #################################################################  ft_m_lk_adresseetablissement_delete  ###############################################

CREATE OR REPLACE FUNCTION m_activite_eco.ft_m_lk_adresseetablissement_delete()
    RETURNS trigger
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE NOT LEAKPROOF
AS $BODY$

BEGIN

-- suppression de l'appariemment du siret à l'adresse
DELETE FROM m_activite_eco.lk_adresseetablissement WHERE siret = old.siret;

-- suppression de l'appariemment du siret au site
DELETE FROM m_activite_eco.lk_eco_etab_site WHERE siret = old.siret;

return new;

END;

$BODY$;

COMMENT ON FUNCTION m_activite_eco.ft_m_lk_adresseetablissement_delete()
    IS 'Fonction gérant la suppression en cascade des données d''association de l''établissement à la suppression de sa géolocalisation à l''adresse';

-- #################################################################  ft_m_lk_adresseetablissement_update  ###############################################

CREATE FUNCTION m_activite_eco.ft_m_lk_adresseetablissement_update()
    RETURNS trigger
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE NOT LEAKPROOF
AS $BODY$

BEGIN

-- si j'ai déjà un établissement à une adresse et qu'il est adressé à une autre, je supprime d'abord les appariemments
IF (SELECT COUNT(*) FROM m_activite_eco.lk_adresseetablissement WHERE siret = new.siret) > 0 THEN
DELETE FROM m_activite_eco.lk_adresseetablissement WHERE siret = new.siret;
END IF;

return new;

END;

$BODY$;

COMMENT ON FUNCTION m_activite_eco.ft_m_lk_adresseetablissement_update()
    IS 'Fonction gérant à la mise à jour la suppression des associations existantes d''adresse/établissement';

-- #################################################################  ft_m_refresh_loc_etab  ###############################################

CREATE OR REPLACE FUNCTION m_activite_eco.ft_m_refresh_loc_etab()
    RETURNS trigger
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE NOT LEAKPROOF
AS $BODY$

BEGIN

-- refraichissement de la vue matérialisée des points établissements à l'adresse
REFRESH MATERIALIZED VIEW m_activite_eco.xapps_geo_vmr_etab_api;
REFRESH MATERIALIZED VIEW m_activite_eco.xapps_geo_vmr_etab_api_export_site;
REFRESH MATERIALIZED VIEW m_activite_eco.xapps_an_vmr_site_act_10;

return new;

END;

$BODY$;

COMMENT ON FUNCTION m_activite_eco.ft_m_refresh_etab_lcompte()
    IS 'Fonction gérant le rafraichissement des vues matérialisées à la modification des informations métiers "établissement"';


-- #################################################################  ft_m_refresh_loc_etabp  ###############################################


CREATE OR REPLACE FUNCTION m_activite_eco.ft_m_refresh_loc_etabp()
    RETURNS trigger
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE NOT LEAKPROOF
AS $BODY$

BEGIN

-- refraichissement de la vue matérialisée des exports des sites
REFRESH MATERIALIZED VIEW m_activite_eco.xapps_geo_vmr_etab_api_export_site;

return new;

END;

$BODY$;

COMMENT ON FUNCTION m_activite_eco.ft_m_refresh_etabp()
    IS 'Fonction gérant le rafraichissement des vues matérialisée à la mise à jour d''un établissement spécifique';

-- #################################################################  ft_m_refresh_view_bati_act  ###############################################

CREATE OR REPLACE FUNCTION m_activite_eco.ft_m_refresh_view_bati_act()
    RETURNS trigger
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE NOT LEAKPROOF
AS $BODY$

BEGIN
   
	REFRESH MATERIALIZED VIEW m_activite_eco.xapps_geo_vmr_lot_plan_situation;
	REFRESH MATERIALIZED VIEW m_activite_eco.xapps_geo_vmr_plan_situ_bati_act;

     return new ;

END;

$BODY$;

COMMENT ON FUNCTION m_activite_eco.ft_m_refresh_view_bati_act()
    IS 'Fonction rafraichissant les vues matérialisés des bâtiments et du plan de situation pour l''affichage par défaut dans l''applicaiton Act.Eco';

-- #################################################################  ft_m_refresh_view_site  ###############################################

CREATE OR REPLACE FUNCTION m_activite_eco.ft_m_refresh_view_site()
    RETURNS trigger
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE NOT LEAKPROOF
AS $BODY$

BEGIN

	REFRESH MATERIALIZED VIEW m_activite_eco.xapps_an_vmr_site_act_10;
    REFRESH MATERIALIZED VIEW m_activite_eco.xapps_geo_vmr_etab_api;
    REFRESH MATERIALIZED VIEW m_activite_eco.xapps_geo_vmr_etab_api_export_site;

return new ;

END;

$BODY$;

COMMENT ON FUNCTION m_activite_eco.ft_m_refresh_view_site()
    IS 'Fonction gérant la refraichissement des vues matérialisées applicatives après insertion, mise à jour ou suppression d''un site dans sa géométrie';

-- #################################################################  ft_m_secu_zae_arc  ###############################################

CREATE OR REPLACE FUNCTION m_activite_eco.ft_m_secu_zae_arc()
    RETURNS trigger
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE NOT LEAKPROOF
AS $BODY$

BEGIN

IF (TG_OP = 'INSERT') THEN

IF new.epci = 'arc' AND new.typsite = '10' THEN
 RAISE EXCEPTION 'Vous ne pouvez pas saisir un périmètre de ZAE'; 
END IF;

return new ;

ELSIF (TG_OP = 'UPDATE') THEN

IF old.epci = 'arc' AND old.typsite = '10' AND st_equals(old.geom,new.geom) IS FALSE THEN
 RAISE EXCEPTION 'Vous ne pouvez pas modifier un périmètre de ZAE'; 
END IF;

IF old.epci = 'arc' AND old.typsite = '10' AND new.site_nom <> old.site_nom THEN
 RAISE EXCEPTION 'Vous ne pouvez pas modifier le libellé de la ZAE'; 
END IF;

IF old.epci = 'arc' AND old.typsite = '10' AND new.typsite <> old.typsite THEN
 RAISE EXCEPTION 'Vous ne pouvez pas modifier le type de site d''une ZAE'; 
END IF;

IF old.epci = 'arc' AND old.typsite = '10' AND new.site_etat <> old.site_etat THEN
 RAISE EXCEPTION 'Vous ne pouvez pas modifier l''état du site d''une ZAE'; 
END IF;

IF old.epci = 'arc' AND old.typsite = '10' AND new.commune <> old.commune THEN
 RAISE EXCEPTION 'Vous ne pouvez pas modifier la commune d''une ZAE'; 
END IF;

return new ;

ELSIF (TG_OP = 'DELETE') THEN

IF old.epci = 'arc' AND old.typsite = '10' THEN
 RAISE EXCEPTION 'Vous ne pouvez pas supprimer un périmètre de ZAE'; 
END IF;

return old;

END IF;

  
END;

$BODY$;

COMMENT ON FUNCTION m_activite_eco.ft_m_secu_zae_arc()
    IS 'Fonction gérant la sécurité de saisie sur l''ARC concernant les ZAE';


-- #################################################################  ft_m_site_surf_epci  ###############################################

CREATE OR REPLACE FUNCTION m_activite_eco.ft_m_site_surf_epci()
    RETURNS trigger
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE NOT LEAKPROOF
AS $BODY$

BEGIN

IF (TG_OP = 'INSERT') THEN

NEW.surf_brt := round(st_area(new.geom)::numeric,0);

NEW.epci :=
(SELECT
                CASE
                    WHEN e.cepci::text = '200067965'::text THEN 'arc'::text
                    WHEN e.cepci::text = '246000749'::text THEN 'cclo'::text
                    WHEN e.cepci::text = '246000772'::text THEN 'cc2v'::text
                    WHEN e.cepci::text = '246000897'::text THEN 'ccpe'::text
                    ELSE NULL::text
                END AS epci
FROM r_osm.geo_vm_osm_epci_grdc e
WHERE st_intersects(st_pointonsurface(NEW.geom), e.geom) IS TRUE
);

ELSIF (TG_OP = 'UPDATE') THEN

IF st_equals(NEW.geom,OLD.geom) IS false THEN

NEW.surf_brt := round(st_area(new.geom)::numeric,0);
NEW.epci :=
(SELECT
                CASE
                    WHEN e.cepci::text = '200067965'::text THEN 'arc'::text
                    WHEN e.cepci::text = '246000749'::text THEN 'cclo'::text
                    WHEN e.cepci::text = '246000772'::text THEN 'cc2v'::text
                    WHEN e.cepci::text = '246000897'::text THEN 'ccpe'::text
                    ELSE NULL::text
                END AS epci
FROM r_osm.geo_vm_osm_epci_grdc e
WHERE st_intersects(st_pointonsurface(NEW.geom), e.geom) IS TRUE 
);
END IF;

END IF;

return new ;

END;

$BODY$;

COMMENT ON FUNCTION m_activite_eco.ft_m_site_surf_epci()
    IS 'Fonction gérant la mise à jour des différentes surfaces';


-- ##########################################################################################################
-- ################################################# SCHEMA M_AMENAGEMENT ##################################
-- ##########################################################################################################

-- ################################################################# ft_m_foncier_modif_geopic  ###############################################

CREATE OR REPLACE FUNCTION m_amenagement.ft_m_foncier_modif_geopic()
    RETURNS trigger
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE NOT LEAKPROOF
AS $BODY$

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

$BODY$;

COMMENT ON FUNCTION m_amenagement.ft_m_foncier_modif_geopic()
    IS 'Fonction gérant l''automatisation des attributs stade d''aménagement et de commercialisation en fonction des disponibilités et du stade de commercilaisation spécifique à l''ARC';

-- ################################################################# ft_m_lot_insert  ###############################################

CREATE OR REPLACE FUNCTION m_amenagement.ft_m_lot_insert()
    RETURNS trigger
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE NOT LEAKPROOF
AS $BODY$
DECLARE v_idgeolf integer;
DECLARE v_idces integer;
DECLARE lot_surf integer;

BEGIN

	ALTER TABLE r_objet.geo_objet_fon_lot
    DISABLE TRIGGER t_t0_secu_geom_epci;

    v_idgeolf := (SELECT nextval('r_objet.idgeo_seq'::regclass));

    INSERT INTO r_objet.geo_objet_fon_lot (idgeolf,op_sai,src_geom,l_voca,geom,l_nom,epci)
	SELECT v_idgeolf,new.op_sai,new.ref_spa,new.l_voca,new.geom,new.l_nom,new.epci;

	INSERT INTO m_amenagement.an_amt_lot_stade (idgeolf,l_amng2,l_comm2,l_comm2_12,etat_occup)
	SELECT v_idgeolf, new.l_amng2,new.l_comm2,new.l_comm2_12,new.etat_occup;

    IF new.l_voca = '20' THEN
	
	INSERT INTO m_activite_eco.an_eco_lot (idgeolf,tact,date_sai,op_sai)
	SELECT v_idgeolf,'00',now(),'geo2';
	
	END IF;
	
	IF new.l_voca = '10' THEN
	
	INSERT INTO m_amenagement.an_amt_lot_esppublic (idgeolf)
	SELECT v_idgeolf;
	END IF;
	
	IF new.l_voca <> '20' AND new.l_voca <> '10' THEN
		
	RAISE EXCEPTION 'Non prise en charge des saisies hors lots économiques et espace public pour le moment. S''adresser à l''adminsitrateur SIG';
	
	END IF;
	
	ALTER TABLE  r_objet.geo_objet_fon_lot
    ENABLE TRIGGER t_t0_secu_geom_epci;

    return new ;
END;

$BODY$;

COMMENT ON FUNCTION m_amenagement.ft_m_lot_insert()
    IS 'Fonction gérant l''intégration des informations des lots en fonction de leur vocation à la saisie des objets';

-- ##########################################################################################################
-- ################################################# SCHEMA M_URBANISME_REG ##################################
-- ##########################################################################################################

-- ################################################################# ft_m_an_proced_log  ###############################################

CREATE OR REPLACE FUNCTION m_urbanisme_reg.ft_m_an_proced_log()
    RETURNS trigger
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE NOT LEAKPROOF
AS $BODY$

DECLARE v_idlog integer;
DECLARE v_dataold text;
DECLARE v_datanew text;
DECLARE v_name_table character varying(80);

BEGIN

-- INSERT
IF (TG_OP = 'INSERT') THEN

  v_idlog := nextval('m_urbanisme_reg.an_proced_log_seq'::regclass);
  v_datanew := ROW(NEW.*); ------------------------------------ On concatène tous les attributs dans un seul

  ---
  INSERT INTO m_urbanisme_reg.an_proced_log (idlog, tablename, type_ope, dataold, datanew, date_maj)
  SELECT
  v_idlog,
  TG_TABLE_NAME,
  'INSERT',
  NULL,
  v_datanew,
  now();

  ---
  
  RETURN NEW;
  

-- UPDATE
ELSIF (TG_OP = 'UPDATE') THEN 
  ---
  
   v_idlog := nextval('m_urbanisme_reg.an_proced_log_seq'::regclass);
  v_dataold := ROW(OLD.*);------------------------------------ On concatène tous les anciens attributs dans un seul
  v_datanew := ROW(NEW.*);------------------------------------ On concatène tous les nouveaux attributs dans un seul	
  v_name_table := TG_TABLE_NAME;

  ---
  
  INSERT INTO m_urbanisme_reg.an_proced_log (idlog, tablename,  type_ope, dataold, datanew, date_maj)
  SELECT
  v_idlog,
  v_name_table,
  'UPDATE',
  v_dataold,
  v_datanew,
  now();
  RETURN NEW;

-- DELETE
ELSIF (TG_OP = 'DELETE') THEN 
  ---
  
  v_idlog := nextval('m_urbanisme_reg.an_proced_log_seq'::regclass);
  v_dataold := ROW(OLD.*);------------------------------------ On concatène tous les anciens attributs dans un seul
  v_name_table := TG_TABLE_NAME;

  ---
  
  INSERT INTO m_urbanisme_reg.an_proced_log (idlog, tablename,  type_ope, dataold, datanew, date_maj)
  SELECT
  v_idlog,
  v_name_table,
  'DELETE',
  v_dataold,
  NULL,
  now();
  RETURN NEW;
  

END IF;

end;

$BODY$;

COMMENT ON FUNCTION m_urbanisme_reg.ft_m_an_proced_log()
    IS 'Fonction gérant l''insertion d''une opération effectuée sur les données des procédures d''aménagements dans la table des logs';

-- ################################################################# ft_m_proc_surf_epci  ###############################################

CREATE OR REPLACE FUNCTION m_urbanisme_reg.ft_m_proc_surf_epci()
    RETURNS trigger
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE NOT LEAKPROOF
AS $BODY$

BEGIN

IF (TG_OP = 'INSERT') THEN

NEW.surf_ha := round(st_area(new.geom)::numeric,0)/10000;
NEW.sup_m2 := st_area(new.geom)::numeric;

NEW.epci :=
(SELECT
                CASE
                    WHEN e.cepci::text = '200067965'::text THEN 'arc'::text
                    WHEN e.cepci::text = '246000749'::text THEN 'cclo'::text
                    WHEN e.cepci::text = '246000772'::text THEN 'cc2v'::text
                    WHEN e.cepci::text = '246000897'::text THEN 'ccpe'::text
                    ELSE NULL::text
                END AS epci
FROM r_osm.geo_vm_osm_epci_grdc e
WHERE st_intersects(st_pointonsurface(NEW.geom), e.geom) IS TRUE
);

ELSIF (TG_OP = 'UPDATE') THEN

IF st_equals(NEW.geom,OLD.geom) IS false THEN

NEW.surf_ha := round(st_area(new.geom)::numeric,0)/10000;
NEW.sup_m2 := st_area(new.geom)::numeric;

NEW.epci :=
(SELECT
                CASE
                    WHEN e.cepci::text = '200067965'::text THEN 'arc'::text
                    WHEN e.cepci::text = '246000749'::text THEN 'cclo'::text
                    WHEN e.cepci::text = '246000772'::text THEN 'cc2v'::text
                    WHEN e.cepci::text = '246000897'::text THEN 'ccpe'::text
                    ELSE NULL::text
                END AS epci
FROM r_osm.geo_vm_osm_epci_grdc e
WHERE st_intersects(st_pointonsurface(NEW.geom), e.geom) IS TRUE 
);
END IF;

END IF;

return new ;

END;

$BODY$;

ALTER FUNCTION m_urbanisme_reg.ft_m_proc_surf_epci()
    OWNER TO create_sig;

GRANT EXECUTE ON FUNCTION m_urbanisme_reg.ft_m_proc_surf_epci() TO PUBLIC;

GRANT EXECUTE ON FUNCTION m_urbanisme_reg.ft_m_proc_surf_epci() TO create_sig;

COMMENT ON FUNCTION m_urbanisme_reg.ft_m_proc_surf_epci()
    IS 'Fonction gérant la mise à jour des surfaces, et de l''appartenance à une EPCI';

-- ##########################################################################################################
-- ################################################# SCHEMA R_OBJET ##################################
-- ##########################################################################################################

-- ################################################################# ft_m_delete_objet_fon  ###############################################

CREATE OR REPLACE FUNCTION r_objet.ft_m_delete_objet_fon()
    RETURNS trigger
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE NOT LEAKPROOF
AS $BODY$

BEGIN
    IF (select insee from r_osm.geo_osm_commune where st_intersects(st_pointonsurface(old.geom),geom)) 
	 IN ('60023','60067','60068','60070','60151','60156','60159','60323','60325','60326','60337','60338','60382','60402','60447',
		'60447','60578','60579','60597','60600','60665','60667','60674') THEN 
    
    IF (SELECT count(*) FROM m_foncier.an_cession c, m_foncier.lk_cession_lot lk WHERE lk.idces = c.idces AND lk.idgeolf= old.idgeolf AND 
		(c.l_date_i IS NOT NULL OR c.d_delib_1 IS NOT NULL OR c.d_esti_1 IS NOT NULL OR c.d_prome IS NOT NULL OR c.d_acte IS NOT NULL)) > 1 THEN

	RAISE EXCEPTION 'Vous ne pouvez pas supprimer ce lot car des informations de cession y sont liés et exploités.';
	ELSE

    DELETE FROM m_foncier.an_cession WHERE idces=(SELECT lf.idces FROM m_foncier.an_cession f, m_foncier.lk_cession_lot lf WHERE f.idces=lf.idces AND lf.idgeolf=old.idgeolf);
    DELETE FROM m_foncier.lk_cession_lot WHERE idgeolf=old.idgeolf;

    END IF;
	ELSE
	DELETE FROM m_foncier.an_fon_cession_horsarc_media WHERE id = old.idgeolf;
	
	END IF;
	
		
    DELETE FROM m_amenagement.lk_amt_lot_site WHERE idgeolf=old.idgeolf;
    DELETE FROM m_activite_eco.an_eco_lot WHERE idgeolf=old.idgeolf;
    DELETE FROM m_amenagement.an_amt_lot_stade WHERE idgeolf=old.idgeolf;
	
	DELETE FROM m_amenagement.an_amt_lot_esppublic WHERE idgeolf=old.idgeolf;
    DELETE FROM m_amenagement.an_amt_lot_habitat WHERE idgeolf=old.idgeolf;
    DELETE FROM m_amenagement.an_amt_lot_mixt WHERE idgeolf=old.idgeolf;
    DELETE FROM m_amenagement.an_amt_lot_divers WHERE idgeolf=old.idgeolf;
	DELETE FROM m_amenagement.an_amt_lot_equip WHERE idgeolf=old.idgeolf;
	
    return new ;

END;

$BODY$;

COMMENT ON FUNCTION r_objet.ft_m_delete_objet_fon()
    IS 'Fonction gérant la suppression des données correspondant à la gestion des lots avec contrôle sur les communes de l''ARC qui ne peut pas supprimer si cession associée';

-- ################################################################# ft_m_foncier_l_nom  ###############################################

CREATE OR FUNCTION r_objet.ft_m_foncier_l_nom()
    RETURNS trigger
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE NOT LEAKPROOF
AS $BODY$BEGIN

IF new.l_nom = '' THEN
new.l_nom = null;
END IF;

RETURN NEW;
END;$BODY$;

COMMENT ON FUNCTION r_objet.ft_m_foncier_l_nom()
    IS 'Fonction dont l''objet de forcer à null le champ l_nom après effacement par exemple pour éviter les doubles cotes';

-- ################################################################# ft_m_insert_update_objet_fon  ###############################################

CREATE OR REPLACE FUNCTION r_objet.ft_m_insert_update_objet_fon()
    RETURNS trigger
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE NOT LEAKPROOF
AS $BODY$

DECLARE v_idces integer; 
DECLARE v_idgeolf integer;

BEGIN

	 
	 -- ici contrôle si hors ARC ne passe pas
     IF (select insee from r_osm.geo_osm_commune where st_intersects(st_pointonsurface(new.geom),geom)) 
	 IN ('60023','60067','60068','60070','60151','60156','60159','60323','60325','60326','60337','60338','60382','60402','60447',
		'60447','60578','60579','60597','60600','60665','60667','60674') THEN 

     -- calcul de l'identifiant du dossier de cession
     v_idces := (SELECT nextval('m_foncier.ces_seq'::regclass));
	 --v_idgeolf := (SELECT nextval('r_objet.idgeo_seq'::regclass));

     -- insertion de tous lots fonciers dans la table métier foncier
     INSERT INTO m_foncier.lk_cession_lot SELECT new.idgeolf, v_idces;	

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
						new.l_nom,
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
						null,
						null
						);

		END IF;
		
		-- association d'un lot à un ou plusieurs sites
		INSERT INTO m_amenagement.lk_amt_lot_site (idsite,idgeolf)
		SELECT idsite, new.idgeolf FROM m_activite_eco.geo_eco_site WHERE st_intersects(st_pointonsurface(new.geom),geom) IS TRUE;
		

     return new ;

END;

$BODY$;

COMMENT ON FUNCTION r_objet.ft_m_insert_update_objet_fon()
    IS 'Fonction gérant l''insertion et les mises à jour des données correspondant à la gestion des lots dans la classe cession et lien lot/cession';

-- ################################################################# ft_m_insert_update_surf_l  ###############################################

CREATE OR REPLACE FUNCTION r_objet.ft_m_insert_update_surf_l()
    RETURNS trigger
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE NOT LEAKPROOF
AS $BODY$

DECLARE v_sup_m2 integer;

BEGIN

IF TG_OP ='INSERT' THEN
    IF new.surf IS NULL THEN 
	new.surf = new.sup_m2;
	new.surf_l = 
	 						
					  
						
								   CASE WHEN length(cast (new.surf as character varying)) >= 1 and length(cast (new.surf as character varying)) <= 3 THEN new.surf || 'm²'
								  	 WHEN length(cast (new.surf as character varying)) = 4 THEN replace(to_char(new.surf,'FM9G999'),',',' ') || 'm²'
								   	WHEN length(cast (new.surf as character varying)) = 5 THEN replace(to_char(new.surf,'FM99G999'),',',' ') || 'm²'
								   	WHEN length(cast (new.surf as character varying)) = 6 THEN replace(to_char(new.surf,'FM999G999'),',',' ') || 'm²'
								   	WHEN length(cast (new.surf as character varying)) = 7 THEN replace(to_char(new.surf,'FM9G999G999'),',',' ') || 'm²'
								  	 WHEN length(cast (new.surf as character varying)) = 8 THEN replace(to_char(new.surf,'FM99G999G999'),',',' ') || 'm²'
								   END
								   ;
	 END IF;
END IF;
IF TG_OP='UPDATE' THEN
    IF new.surf IS NULL OR (new.surf IS NOT NULL AND st_equals (new.geom,old.geom) IS FALSE) THEN 
	new.surf = new.sup_m2;
	new.surf_l = 
	 						
					  
						
								   CASE WHEN length(cast (new.surf as character varying)) >= 1 and length(cast (new.surf as character varying)) <= 3 THEN new.surf || 'm²'
								  	 WHEN length(cast (new.surf as character varying)) = 4 THEN replace(to_char(new.surf,'FM9G999'),',',' ') || 'm²'
								   	WHEN length(cast (new.surf as character varying)) = 5 THEN replace(to_char(new.surf,'FM99G999'),',',' ') || 'm²'
								   	WHEN length(cast (new.surf as character varying)) = 6 THEN replace(to_char(new.surf,'FM999G999'),',',' ') || 'm²'
								   	WHEN length(cast (new.surf as character varying)) = 7 THEN replace(to_char(new.surf,'FM9G999G999'),',',' ') || 'm²'
								  	 WHEN length(cast (new.surf as character varying)) = 8 THEN replace(to_char(new.surf,'FM99G999G999'),',',' ') || 'm²'
								   END
								   ;
	 END IF; 

	 IF new.surf <> old.surf THEN
	 new.surf_l = 
								   CASE WHEN length(cast (new.surf as character varying)) >= 1 and length(cast (new.surf as character varying)) <= 3 THEN new.surf || 'm²'
								  	 WHEN length(cast (new.surf as character varying)) = 4 THEN replace(to_char(new.surf,'FM9G999'),',',' ') || 'm²'
								   	WHEN length(cast (new.surf as character varying)) = 5 THEN replace(to_char(new.surf,'FM99G999'),',',' ') || 'm²'
								   	WHEN length(cast (new.surf as character varying)) = 6 THEN replace(to_char(new.surf,'FM999G999'),',',' ') || 'm²'
								   	WHEN length(cast (new.surf as character varying)) = 7 THEN replace(to_char(new.surf,'FM9G999G999'),',',' ') || 'm²'
								  	 WHEN length(cast (new.surf as character varying)) = 8 THEN replace(to_char(new.surf,'FM99G999G999'),',',' ') || 'm²'
								   END
								   ;   
		END IF;
END IF;		

return new;

END;

$BODY$;

COMMENT ON FUNCTION r_objet.ft_m_insert_update_surf_l()
    IS 'Fonction gérant l''insertion et les mises à jour des surfaces litérales';



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
-- ################################################# SCHEMA M_AMENAGAMENT ##################################
-- ##########################################################################################################


-- ################################################################# Domaine valeur - lt_amt_empesp_pu  ###############################################

-- liste de valeurs associées à la classe des objets des emprises publics réalisé dans la cadre d'un test. Plus utilisées à ce jour.

CREATE TABLE m_amenagement.lt_amt_empesp_pu
(
    code character varying(2) COLLATE pg_catalog."default" NOT NULL,
    valeur character varying(35) COLLATE pg_catalog."default",
    CONSTRAINT lt_amt_empesp_pu_new_pkkey PRIMARY KEY (code)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

COMMENT ON TABLE m_amenagement.lt_amt_empesp_pu
    IS 'Vocation des espaces publics';

COMMENT ON COLUMN m_amenagement.lt_amt_empesp_pu.code
    IS 'Code de la vocation de l''espace public';

COMMENT ON COLUMN m_amenagement.lt_amt_empesp_pu.valeur
    IS 'Libellé de la vocation de l''espace public';
    
COMMENT ON CONSTRAINT lt_amt_empesp_pu_new_pkkey ON m_amenagement.lt_amt_empesp_pu
    IS 'Clé primaire de la table lt_amt_empesp_pu';

 INSERT INTO m_activite_eco.lt_amt_empesp_pu(
            code, valeur)
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

-- ##########################################################################################################
-- ################################################# SCHEMA M_ACTIVITE_ECO ##################################
-- ##########################################################################################################


-- ################################################# Classe des objets Médias des bâtiments d'activité : an_eco_bati_loc_media ##################################

CREATE TABLE m_activite_eco.an_eco_bati_loc_media
(
    gid integer NOT NULL DEFAULT nextval('m_activite_eco.an_eco_bati_loc_media_seq'::regclass),
    id text COLLATE pg_catalog."default",
    media text COLLATE pg_catalog."default",
    miniature bytea,
    n_fichier text COLLATE pg_catalog."default",
    t_fichier text COLLATE pg_catalog."default",
    date_sai timestamp without time zone,
    date_maj timestamp without time zone,
    op_sai character varying(20) COLLATE pg_catalog."default",
    op_maj character varying(20) COLLATE pg_catalog."default",
    l_doc character varying(100) COLLATE pg_catalog."default",
    t_doc character varying(2) COLLATE pg_catalog."default" DEFAULT '00'::character varying,
    d_photo timestamp without time zone,
    alaune boolean NOT NULL DEFAULT false,
    CONSTRAINT an_eco_bati_loc_media_pkey PRIMARY KEY (gid),
    CONSTRAINT an_eco_bati_loc_media_t_doc_fkey FOREIGN KEY (t_doc)
        REFERENCES m_activite_eco.lt_eco_tdocmedia (code) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

COMMENT ON TABLE m_activite_eco.an_eco_bati_loc_media
    IS 'Table gérant les documents intégrés pour la gestion des données des bâtiments d''activités';

COMMENT ON COLUMN m_activite_eco.an_eco_bati_loc_media.gid
    IS 'Compteur (identifiant interne)';

COMMENT ON COLUMN m_activite_eco.an_eco_bati_loc_media.id
    IS 'Identifiant interne non signifiant de l''objet saisi';

COMMENT ON COLUMN m_activite_eco.an_eco_bati_loc_media.media
    IS 'Champ Média de GEO';

COMMENT ON COLUMN m_activite_eco.an_eco_bati_loc_media.miniature
    IS 'Champ miniature de GEO';

COMMENT ON COLUMN m_activite_eco.an_eco_bati_loc_media.n_fichier
    IS 'Nom du fichier';

COMMENT ON COLUMN m_activite_eco.an_eco_bati_loc_media.t_fichier
    IS 'Type de média dans GEO';

COMMENT ON COLUMN m_activite_eco.an_eco_bati_loc_media.date_sai
    IS 'Date de la saisie du document';

COMMENT ON COLUMN m_activite_eco.an_eco_bati_loc_media.date_maj
    IS 'Date de mise à jour';

COMMENT ON COLUMN m_activite_eco.an_eco_bati_loc_media.op_sai
    IS 'Opérateur de saisie (par défaut login de connexion à GEO)';

COMMENT ON COLUMN m_activite_eco.an_eco_bati_loc_media.op_maj
    IS 'Opérateur de mise à jour';

COMMENT ON COLUMN m_activite_eco.an_eco_bati_loc_media.l_doc
    IS 'Titre du document ou légère description';

COMMENT ON COLUMN m_activite_eco.an_eco_bati_loc_media.t_doc
    IS 'Type de documents';

COMMENT ON COLUMN m_activite_eco.an_eco_bati_loc_media.d_photo
    IS 'Date de la prise de vue';
    
-- Index: an_eco_bati_loc_media_gid_idx
-- DROP INDEX m_activite_eco.an_eco_bati_loc_media_gid_idx;

CREATE INDEX an_eco_bati_loc_media_gid_idx
    ON m_activite_eco.an_eco_bati_loc_media USING btree
    (gid ASC NULLS LAST)
    TABLESPACE pg_default;
    
-- Index: an_eco_bati_loc_media_idx
-- DROP INDEX m_activite_eco.an_eco_bati_loc_media_idx;

CREATE INDEX an_eco_bati_loc_media_idx
    ON m_activite_eco.an_eco_bati_loc_media USING btree
    (id COLLATE pg_catalog."default" ASC NULLS LAST)
    TABLESPACE pg_default;

-- Trigger: t_t1_date_maj
-- DROP TRIGGER t_t1_date_maj ON m_activite_eco.an_eco_bati_loc_media;

CREATE TRIGGER t_t1_date_maj
    BEFORE UPDATE 
    ON m_activite_eco.an_eco_bati_loc_media
    FOR EACH ROW
    EXECUTE PROCEDURE public.ft_r_timestamp_maj();

-- ################################################# Classe des objets des contacts : an_eco_contact ##################################

CREATE TABLE m_activite_eco.an_eco_contact
(
    idcontact integer NOT NULL DEFAULT nextval('m_activite_eco.an_eco_contact_seq'::regclass),
    nom character varying(254) COLLATE pg_catalog."default",
    typcontact character varying(2) COLLATE pg_catalog."default" DEFAULT '00'::character varying,
    tel character varying(10) COLLATE pg_catalog."default",
    telp character varying(10) COLLATE pg_catalog."default",
    email character varying(100) COLLATE pg_catalog."default",
    date_sai timestamp without time zone,
    date_maj timestamp without time zone,
    op_sai character varying(80) COLLATE pg_catalog."default",
    op_maj character varying(80) COLLATE pg_catalog."default",
    epci character varying(10) COLLATE pg_catalog."default",
    observ character varying(1000) COLLATE pg_catalog."default",
    idobjet character varying(15) COLLATE pg_catalog."default",
    idevenmt integer,
    source character varying(100) COLLATE pg_catalog."default",
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

COMMENT ON COLUMN m_activite_eco.an_eco_contact.op_maj
    IS 'Opérateur de mise à jour';

COMMENT ON COLUMN m_activite_eco.an_eco_contact.epci
    IS 'Autorité compétente';

COMMENT ON COLUMN m_activite_eco.an_eco_contact.observ
    IS 'Observations diverses';

COMMENT ON COLUMN m_activite_eco.an_eco_contact.idobjet
    IS 'Clé temporaire pour la relation direct dans GEO en attendant la correction sur les relations N..M';

COMMENT ON COLUMN m_activite_eco.an_eco_contact.idevenmt
    IS 'Identifiant unique non signifiant de l''''évènement (en attente résolution pb relation N..M dans Geo';

COMMENT ON COLUMN m_activite_eco.an_eco_contact.source
    IS 'Source de la mise à jour du contact';
    
-- Index: an_eco_contact_idcontact_idx
-- DROP INDEX m_activite_eco.an_eco_contact_idcontact_idx;

CREATE INDEX an_eco_contact_idcontact_idx
    ON m_activite_eco.an_eco_contact USING btree
    (idcontact ASC NULLS LAST)
    TABLESPACE pg_default;

-- Trigger: t_t100_log
-- DROP TRIGGER t_t100_log ON m_activite_eco.an_eco_contact;

CREATE TRIGGER t_t100_log
    AFTER INSERT OR DELETE OR UPDATE 
    ON m_activite_eco.an_eco_contact
    FOR EACH ROW
    EXECUTE PROCEDURE m_activite_eco.ft_m_an_eco_log();

-- Trigger: t_t1_date_sai
-- DROP TRIGGER t_t1_date_sai ON m_activite_eco.an_eco_contact;

CREATE TRIGGER t_t1_date_sai
    BEFORE INSERT
    ON m_activite_eco.an_eco_contact
    FOR EACH ROW
    EXECUTE PROCEDURE public.ft_r_timestamp_sai();

-- Trigger: t_t2_date_maj
-- DROP TRIGGER t_t2_date_maj ON m_activite_eco.an_eco_contact;

CREATE TRIGGER t_t2_date_maj
    BEFORE UPDATE 
    ON m_activite_eco.an_eco_contact
    FOR EACH ROW
    EXECUTE PROCEDURE public.ft_r_timestamp_maj();

-- Trigger: t_t3_insert_update_epci
-- DROP TRIGGER t_t3_insert_update_epci ON m_activite_eco.an_eco_contact;

CREATE TRIGGER t_t3_insert_update_epci
    BEFORE INSERT OR UPDATE 
    ON m_activite_eco.an_eco_contact
    FOR EACH ROW
    EXECUTE PROCEDURE m_activite_eco.ft_m_insert_update_epci();

-- Trigger: t_t4_controle_saisie_contact
-- DROP TRIGGER t_t4_controle_saisie_contact ON m_activite_eco.an_eco_contact;

CREATE TRIGGER t_t4_controle_saisie_contact
    BEFORE INSERT OR UPDATE 
    ON m_activite_eco.an_eco_contact
    FOR EACH ROW
    EXECUTE PROCEDURE m_activite_eco.ft_m_controle_saisie_contact();

-- Trigger: t_t5_an_eco_contact_delete
-- DROP TRIGGER t_t5_an_eco_contact_delete ON m_activite_eco.an_eco_contact;

CREATE TRIGGER t_t5_an_eco_contact_delete
    AFTER DELETE
    ON m_activite_eco.an_eco_contact
    FOR EACH ROW
    EXECUTE PROCEDURE m_activite_eco.ft_m_delete_an_eco_contact();


-- ##########################################################################################################
-- ################################################# SCHEMA M_AMENGAMENT ##################################
-- ##########################################################################################################


-- ################################################# Classe des objets Médias des bâtiments d'activité : an_eco_bati_loc_media ##################################
