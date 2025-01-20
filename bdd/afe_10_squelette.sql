/*Amt_Fon_Eco V1.0*/
/*Creation du squelette de la structure des données (table, séquence, trigger,...) */
/* afe_10_squelette.sql */
/*PostGIS*/

/* Propriétaire : GeoCompiegnois - http://geo.compiegnois.fr/ */
/* Auteur : Grégory Bodet */

-- ####################################################################################################################################################
-- ###                                                                                                                                              ###
-- ###                                                                SCHEMA                                                                        ###
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
-- DROP TABLE IF EXISTS m_activite_eco.lt_eco_moatype;
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
-- DROP TABLE IF EXISTS m_amnagement.lt_amt_maifon;
-- DROP TABLE IF EXISTS m_amenagement.lt_amt_etatoccup;
-- DROP TABLE IF EXISTS m_amenagement.lt_amt_terrusage;

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

-- ################################################# an_eco_uf_seq ##################################
-- m_activite_eco.an_eco_uf_seq definition

-- DROP SEQUENCE m_activite_eco.an_eco_uf_seq;

CREATE SEQUENCE m_activite_eco.an_eco_uf_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 9223372036854775807
	START 1
	NO CYCLE;

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
     	-- association d'un bâtiment à un ou plusieurs sites
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
			-- association d'un bâtiment à un ou plusieurs sites
			INSERT INTO m_activite_eco.lk_eco_loc_site (idsite,idloc)
			SELECT idsite, new.idloc FROM m_activite_eco.geo_eco_site WHERE st_intersects(new.geom,geom) IS TRUE;
		END IF;

END IF;

     return new ;

END;

$BODY$;

COMMENT ON FUNCTION m_activite_eco.ft_m_insert_update_loc_rel()
    IS 'Fonction gérant l''affectation des bâtiments aux différentes échelles de relations (site, bâtiment)';

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
new.site_id := (select c.insee from r_osm.geo_vm_osm_commune_grdc c where st_intersects(c.geom,(st_pointonsurface(new.geom))) is true)  || '_SITE-ECO_' || new.idsite ;

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

-- DROP FUNCTION m_amenagement.ft_m_foncier_modif_geopic();

CREATE OR REPLACE FUNCTION m_amenagement.ft_m_foncier_modif_geopic()
 RETURNS trigger
 LANGUAGE plpgsql
AS $function$

BEGIN

    -- mise à jour des champs stade_amng et stade_comm en fonction des champs l_comm2, l_amng2 saisies 
	if new.l_amng2 = '00' then
       UPDATE m_amenagement.an_amt_lot_stade SET  stade_amng = '00' WHERE idgeolf=new.idgeolf;
    end if;
    if new.l_amng2 = '10' then
       UPDATE m_amenagement.an_amt_lot_stade SET  stade_amng = '40' WHERE idgeolf=new.idgeolf;
    end if;
    if new.l_amng2 = '20' then
       UPDATE m_amenagement.an_amt_lot_stade SET  stade_amng = '20' WHERE idgeolf=new.idgeolf;
    end if;
    if new.l_amng2 = '30' then
       UPDATE m_amenagement.an_amt_lot_stade SET  stade_amng = '30' WHERE idgeolf=new.idgeolf;
    end if;
   	if new.l_amng2 = '99' then
       UPDATE m_amenagement.an_amt_lot_stade SET  stade_amng = '99' WHERE idgeolf=new.idgeolf;
    end if;
   	if new.l_amng2 = 'ZZ' then
       UPDATE m_amenagement.an_amt_lot_stade SET  stade_amng = 'ZZ' WHERE idgeolf=new.idgeolf;
    end if;

     if new.l_comm2 = '00' then
       UPDATE m_amenagement.an_amt_lot_stade SET  stade_comm = '00' WHERE idgeolf=new.idgeolf;
    end if;
    if new.l_comm2 = '11' or new.l_comm2 = '12' then
       UPDATE m_amenagement.an_amt_lot_stade SET  stade_comm = '20' WHERE idgeolf=new.idgeolf;
    end if;
    if new.l_comm2 = '20' or (new.l_comm2 = '31' or new.l_comm2 = '32') then
       UPDATE m_amenagement.an_amt_lot_stade SET  stade_comm = '10' WHERE idgeolf=new.idgeolf;
    end if;
    if new.l_comm2 = '99' then
       UPDATE m_amenagement.an_amt_lot_stade SET  stade_comm = '99' WHERE idgeolf=new.idgeolf;
    end if;
    if new.l_comm2 = 'ZZ' then
       UPDATE m_amenagement.an_amt_lot_stade SET  stade_comm = 'ZZ' WHERE idgeolf=new.idgeolf;
    end if;


     return new ;

END;

$function$
;

COMMENT ON FUNCTION m_amenagement.ft_m_foncier_modif_geopic() IS 'Fonction gérant l''automatisation des attributs stade d''aménagement et de commercialisation en fonction des disponibilités et du stade de commercilaisation spécifique à l''ARC';


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

-- ################################################################# ft_m_promotion_update  ###############################################

-- DROP FUNCTION m_amenagement.ft_m_promotion_update();

CREATE OR REPLACE FUNCTION m_amenagement.ft_m_promotion_update()
 RETURNS trigger
 LANGUAGE plpgsql
AS $function$

BEGIN

-- mise à jour des codes promotions depuis la vue opendata après la mise à jour des stades d'aménagements
update m_activite_eco.geo_eco_site 
set promot = p.code from m_activite_eco.xopendata_geo_eco_site_cnig c, m_activite_eco.lt_eco_promot p 
where c.promotion = p.valeur
and geo_eco_site.epci = 'arc' and c.site_id = geo_eco_site.site_id;

     return new ;

END;

$function$
;

COMMENT ON FUNCTION m_amenagement.ft_m_promotion_update() IS 'Fonction gérant l''automatisation de la promotion pour l''ARC lorsqu''un terrain est disponible et en vente';



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
 LANGUAGE plpgsql
AS $function$

DECLARE v_idces integer; 
DECLARE v_idgeolf integer;

BEGIN

	 
	 -- ici contrôle si hors ARC ne passe pas
     IF (select insee from r_osm.geo_osm_commune where st_intersects(st_pointonsurface(new.geom),geom)) 
	 	IN ('60023','60067','60068','60070','60151','60156','60159','60323','60325','60326','60337','60338','60382','60402','60447',
			'60447','60578','60579','60597','60600','60665','60667','60674') THEN 
	 	if new.op_sai <> 'Service foncier' then
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
		end if;
	
	    if (SELECT count(*) FROM m_activite_eco.geo_eco_site WHERE st_intersects(st_pointonsurface(new.geom),geom) IS true) > 0 THEN
		-- association d'un lot à un ou plusieurs sites
		INSERT INTO m_amenagement.lk_amt_lot_site (idsite,idgeolf)
		SELECT idsite, new.idgeolf FROM m_activite_eco.geo_eco_site WHERE st_intersects(st_pointonsurface(new.geom),geom) IS TRUE;
		end if;
   
	    if (SELECT count(*) FROM m_activite_eco.geo_eco_loc_act WHERE st_intersects(new.geom,geom) IS true) > 0 THEN
	       	       update m_activite_eco.geo_eco_loc_act set idgeolf = new.idgeolf where st_intersects(new.geom,geom) is true;
	       end if;
	
     return new ;

END;

$function$
;

COMMENT ON FUNCTION r_objet.ft_m_insert_update_objet_fon() IS 'Fonction gérant l''insertion et les mises à jour des données correspondant à la gestion des lots dans la classe cession et lien lot/cession';





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
    ('70','Service/Négoce'),
    ('80','Touristique'),
    ('91','Portuaire'),
    ('92','Aéroportuaire');

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
    ('30','Commercialisateur'),
    ('40','Agence immobilière');

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

-- ################################################################# Domaine valeur - lt_eco_moatype  ###############################################

CREATE TABLE m_activite_eco.lt_eco_moatype
(
    code character varying(2) COLLATE pg_catalog."default" NOT NULL,
    valeur character varying(40) COLLATE pg_catalog."default",
    CONSTRAINT lt_eco_moatype_pkey PRIMARY KEY (code)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

COMMENT ON TABLE m_activite_eco.lt_eco_moatype
    IS 'Liste de valeurs du type de maîtrise d''ouvrage';

COMMENT ON COLUMN m_activite_eco.lt_eco_moatype.code
    IS 'Code type de maîtrise d''ouvrage';

COMMENT ON COLUMN m_activite_eco.lt_eco_moatype.valeur
    IS 'Libellé de la maîtrise d''ouvrage';
    
-- Index: lt_eco_moatype_code_idx
-- DROP INDEX m_activite_eco.lt_eco_moatype_code_idx;

CREATE INDEX lt_eco_moatype_code_idx
    ON m_activite_eco.lt_eco_moatype USING btree
    (code COLLATE pg_catalog."default" ASC NULLS LAST)
    TABLESPACE pg_default;   

 INSERT INTO m_activite_eco.lt_eco_moatype(
            code, valeur)
    VALUES
    ('00','Non renseigné'),
    ('10','Commune'),
    ('20','EPCI'),
    ('30','Société d''économie mixte'),
    ('40','Chambre de commerce et industrie'),
    ('50','Etat'),
    ('60','privé');

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
    ('00','Non renseigné'),	 
    ('10','Existant et actif'),
    ('20','Extension'),
    ('21','En projet'),	 
    ('30','Création'),
    ('40','Déclassé'),
    ('50','Projet de déclassement'),
    ('60','Annulé')
    ;

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
    ('40','Viabilisé'),
    ('99','Autre'),
    ('ZZ','Non concerné');
    
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
    ('30','Indisponible (terrain non aménagé)'),
    ('99','Autre'),
    ('ZZ','Non concerné');

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
    ('20','Commercialisable'),
    ('99','Autre'),
    ('ZZ','Non concerné');

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

 INSERT INTO m_amenagement.lt_amt_stadecomm2(
            code, valeur)
    VALUES
    ('00','Non renseigné'),
    ('11','En vente'),
    ('12','En vente (avec contrainte)'),
    ('20','Vendu'),
    ('32','Réservé (option)'),
    ('99','Non commercialisé par un acteur public'),
    ('31','Réservé (par une délibération de l''EPCI)'),
    ('99','Autre'),
    ('ZZ','Non concerné');

-- ################################################################# Domaine valeur - lt_amt_etatoccup  ###############################################

CREATE TABLE m_amenagement.lt_amt_etatoccup
(
    code character varying(2) COLLATE pg_catalog."default" NOT NULL,
    valeur character varying(150) COLLATE pg_catalog."default",
    CONSTRAINT lt_amt_etatoccup_pkey PRIMARY KEY (code)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

COMMENT ON TABLE m_amenagement.lt_amt_etatoccup
    IS 'Liste de valeurs des états d''occupation du terrain issu du standard des sites d''activités du CNIG 2023';

COMMENT ON COLUMN m_amenagement.lt_amt_etatoccup.code IS 'Code de la valeur de l''occupation du terrain';
COMMENT ON COLUMN m_amenagement.lt_amt_etatoccup.valeur IS 'Libellé de la valeur de l''occupation du terrain';

CREATE INDEX lt_amt_etatoccup_idx
    ON m_amenagement.lt_amt_etatoccup USING btree
    (code COLLATE pg_catalog."default" ASC NULLS LAST)
    TABLESPACE pg_default;

INSERT INTO m_amenagement.lt_amt_etatoccup(
            code, valeur)
    VALUES
    ('00','Non renseignée'),
    ('10','inoccupé'),
    ('20','occupé'),
    ('21','occupation transitoire'),
    ('30','vacant'),
    ('40','friche'),
    ('99','Autre'),
    ('ZZ','Non concerné')
    ;

-- ################################################################# Domaine valeur - lt_amt_maifon  ###############################################

CREATE TABLE m_amenagement.lt_amt_maifon
(
    code character varying(2) COLLATE pg_catalog."default" NOT NULL,
    valeur character varying(150) COLLATE pg_catalog."default",
    CONSTRAINT lt_amt_maifon_pkey PRIMARY KEY (code)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

COMMENT ON TABLE m_amenagement.lt_amt_maifon
    IS 'Liste de valeurs de la maitrise foncière du terrain issu du standard des sites d''activités du CNIG 2023';

COMMENT ON COLUMN m_amenagement.lt_amt_maifon.code IS 'Code de la valeur de la maîtrise foncière';
COMMENT ON COLUMN m_amenagement.lt_amt_maifon.valeur IS 'Libellé de la valeur de la maîtrise foncière';

CREATE INDEX lt_amt_maifon_idx
    ON m_amenagement.lt_amt_maifon USING btree
    (code COLLATE pg_catalog."default" ASC NULLS LAST)
    TABLESPACE pg_default;

INSERT INTO m_amenagement.lt_amt_maifon(
            code, valeur)
    VALUES
    ('00','Non renseignée'),
    ('01','personne physique'),
    ('02','Etat'),
    ('03','région'),
    ('04','département'),
    ('05','EPCI, structure intercommunale'),
    ('06','commune'),
    ('07','autre collectivité territoriale'),
    ('08','organisme de logement social'),
    ('09','établissement public foncier'),
    ('10','SEM ou SPLA'),
    ('11','aménageur'),
    ('12','investisseur professionnel'),
    ('13','établissement de santé et structure sociale'),
    ('14','établissement de tourisme et structure de loisir sportive ou culturelle'),
    ('15','établissemebt industriel et commercial'),
    ('16','organisation de gestion foncière et immobilière'),
    ('17','établissement d'enseignement d'étude et de recherche'),
    ('99','Autre'),
    ('ZZ','Non concerné');


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
    ('10','Renouvellement urbain'),
    ('20','Extension urbaine'),
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
    typcontact_aut character varying(50) COLLATE pg_catalog."default",
    source_maj timestamp without time zone,
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

COMMENT ON COLUMN m_activite_eco.an_eco_contact.typcontact_aut
    IS 'Autre type de contact (à remplir si typcontact = autre)';

COMMENT ON COLUMN m_activite_eco.an_eco_contact.source_maj
    IS 'Date de la dernière mise à joru de la source';

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

-- ################################################# Classe des objets des DIA : an_eco_dia ##################################

CREATE TABLE m_activite_eco.an_eco_dia
(
    gid integer NOT NULL DEFAULT nextval('m_activite_eco.an_eco_dia_seq'::regclass),
    idgeolf integer NOT NULL,
    num_dia character varying(25) COLLATE pg_catalog."default",
    date_dia timestamp without time zone,
    prix_v double precision,
    nom_v character varying(80) COLLATE pg_catalog."default",
    nom_a character varying(80) COLLATE pg_catalog."default",
    date_sai timestamp without time zone,
    date_maj timestamp without time zone,
    op_sai character varying(80) COLLATE pg_catalog."default",
    op_maj character varying(80) COLLATE pg_catalog."default",
    CONSTRAINT an_sa_dia_pkey PRIMARY KEY (gid)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

COMMENT ON TABLE m_activite_eco.an_eco_dia
    IS 'Table alphanumérique contenant le suivi des DIA pour les lots à vocation économique (la gestion des DIA est géré par un outil d''OPERIS mais sans pouvoir récupérer les données brutes pour le moment)';

COMMENT ON COLUMN m_activite_eco.an_eco_dia.gid
    IS 'Identifiant unique interne';

COMMENT ON COLUMN m_activite_eco.an_eco_dia.idgeolf
    IS 'Identifiant unique de l''entité géographique lot';

COMMENT ON COLUMN m_activite_eco.an_eco_dia.num_dia
    IS 'Numéro de la DIA';

COMMENT ON COLUMN m_activite_eco.an_eco_dia.date_dia
    IS 'Date de la dernière DIA';

COMMENT ON COLUMN m_activite_eco.an_eco_dia.prix_v
    IS 'Prix de vente en euros';

COMMENT ON COLUMN m_activite_eco.an_eco_dia.nom_v
    IS 'Nom du vendeur';

COMMENT ON COLUMN m_activite_eco.an_eco_dia.nom_a
    IS 'Nom de l''acquéreur (seconde main)';

COMMENT ON COLUMN m_activite_eco.an_eco_dia.date_maj
    IS 'Date de mise à jour des données attributaires';

COMMENT ON COLUMN m_activite_eco.an_eco_dia.op_sai
    IS 'Libellé de la personne ayant saisie l''objet initialisament';

COMMENT ON COLUMN m_activite_eco.an_eco_dia.op_maj
    IS 'Opérateur de mise à jour';
    
-- Index: an_eco_dia_gid_idx
-- DROP INDEX m_activite_eco.an_eco_dia_gid_idx;

CREATE INDEX an_eco_dia_gid_idx
    ON m_activite_eco.an_eco_dia USING btree
    (gid ASC NULLS LAST)
    TABLESPACE pg_default;
    
-- Index: idx_7098_idgeolf
-- DROP INDEX m_activite_eco.idx_7098_idgeolf;

CREATE INDEX idx_7098_idgeolf
    ON m_activite_eco.an_eco_dia USING btree
    (idgeolf ASC NULLS LAST)
    TABLESPACE pg_default;

-- Trigger: t_t100_log
-- DROP TRIGGER t_t100_log ON m_activite_eco.an_eco_dia;

CREATE TRIGGER t_t100_log
    AFTER INSERT OR DELETE OR UPDATE 
    ON m_activite_eco.an_eco_dia
    FOR EACH ROW
    EXECUTE PROCEDURE m_activite_eco.ft_m_an_eco_log();

-- Trigger: t_t1_date_sai
-- DROP TRIGGER t_t1_date_sai ON m_activite_eco.an_eco_dia;

CREATE TRIGGER t_t1_date_sai
    BEFORE INSERT
    ON m_activite_eco.an_eco_dia
    FOR EACH ROW
    EXECUTE PROCEDURE public.ft_r_timestamp_sai();

-- Trigger: t_t2_date_maj
-- DROP TRIGGER t_t2_date_maj ON m_activite_eco.an_eco_dia;

CREATE TRIGGER t_t2_date_maj
    BEFORE UPDATE 
    ON m_activite_eco.an_eco_dia
    FOR EACH ROW
    EXECUTE PROCEDURE public.ft_r_timestamp_maj();

-- ################################################# Classe métier des données établissements : an_eco_etab ##################################

CREATE TABLE m_activite_eco.an_eco_etab
(
    id integer NOT NULL DEFAULT nextval('m_activite_eco.an_eco_etab_seq'::regclass),
    idgeoet integer,
    idsiren character varying(9) COLLATE pg_catalog."default",
    idsiret character varying(14) COLLATE pg_catalog."default",
    l_nom character varying(255) COLLATE pg_catalog."default",
    n_adres character varying(255) COLLATE pg_catalog."default",
    eff_etab integer,
    eff_etab_d character varying(200) COLLATE pg_catalog."default",
    source_eff character varying(50) COLLATE pg_catalog."default",
    annee_eff integer,
    l_date_eff date,
    l_compte boolean DEFAULT true,
    apet700 character varying(255) COLLATE pg_catalog."default",
    libapet character varying(255) COLLATE pg_catalog."default",
    l_url character varying(500) COLLATE pg_catalog."default",
    dentree timestamp without time zone,
    dsortie timestamp without time zone,
    etatadministratifetablissement character varying(1) COLLATE pg_catalog."default",
    old_siret character varying(14) COLLATE pg_catalog."default",
    old_id integer,
    date_int date,
    observ character varying(255) COLLATE pg_catalog."default",
    op_sai character varying(80) COLLATE pg_catalog."default",
    op_maj character varying(80) COLLATE pg_catalog."default",
    date_sai timestamp without time zone,
    date_maj timestamp without time zone,
    insee character varying(10) COLLATE pg_catalog."default",
    CONSTRAINT an_eco_etab_pkey PRIMARY KEY (id)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

COMMENT ON TABLE m_activite_eco.an_eco_etab
    IS 'Données métiers sur les établissements';

COMMENT ON COLUMN m_activite_eco.an_eco_etab.id
    IS 'Identifiant unique interne';

COMMENT ON COLUMN m_activite_eco.an_eco_etab.idgeoet
    IS 'Identifiant unique géographique
Ancien identifiant ne sert plus depuis la géolocalisation des étab à l''adresse';

COMMENT ON COLUMN m_activite_eco.an_eco_etab.idsiren
    IS 'Numéro SIRENE de l''établissement';

COMMENT ON COLUMN m_activite_eco.an_eco_etab.idsiret
    IS 'Numéro SIRET de l''établissement';

COMMENT ON COLUMN m_activite_eco.an_eco_etab.l_nom
    IS 'Libellé du nom de l''établissement spécifique si différent du nom SIRENE (nom usuel du service économie)';

COMMENT ON COLUMN m_activite_eco.an_eco_etab.n_adres
    IS 'Libellé de la nouvelle adresse si l''établissement a déménagé';

COMMENT ON COLUMN m_activite_eco.an_eco_etab.eff_etab
    IS 'Effectif total de l''établissement';

COMMENT ON COLUMN m_activite_eco.an_eco_etab.eff_etab_d
    IS 'Précision (en détail) du nombre de CDD, CDI, intérim, ....';

COMMENT ON COLUMN m_activite_eco.an_eco_etab.source_eff
    IS 'Source de l''effectif de l''établissement';

COMMENT ON COLUMN m_activite_eco.an_eco_etab.annee_eff
    IS 'Année de l''effectif (issu de SIRENE)';

COMMENT ON COLUMN m_activite_eco.an_eco_etab.l_date_eff
    IS 'Date de l''effectif saisie par l''ARC';

COMMENT ON COLUMN m_activite_eco.an_eco_etab.l_compte
    IS 'Prise en compte de l''établissement pour le calcul des statistiques (nombre d''établissements et effectifs) dans les informations de synthèse.
Par défaut TRUE et laisse le choix à l''administrateur de la donnée de modifier cette valeur.';

COMMENT ON COLUMN m_activite_eco.an_eco_etab.apet700
    IS 'Code d''activité de l''établissement (issu de SIRENE et mis à jour lors de la mise à jour de SIRENE)';

COMMENT ON COLUMN m_activite_eco.an_eco_etab.libapet
    IS 'Libellé de l''activité de l''établissement (issu de SIRENE et mis à jour lors de la mise à jour de SIRENE)';

COMMENT ON COLUMN m_activite_eco.an_eco_etab.l_url
    IS 'Lien du site internet de l''entreprise';

COMMENT ON COLUMN m_activite_eco.an_eco_etab.dentree
    IS 'Date d''entrée dans le fichier SIRENE déduite de l''insertion via l''API pour les nouveaux établissements apparus entre 2 mises à jour';

COMMENT ON COLUMN m_activite_eco.an_eco_etab.dsortie
    IS 'Date de sortie du fichier SIRENE déduite de l''insertion via l''API pour les anciens établissements disparus entre 2 mises à jour';

COMMENT ON COLUMN m_activite_eco.an_eco_etab.etatadministratifetablissement
    IS 'Etat administratif de l''établissement dans le fichier SIEREN (attribut déjà présent dans SIRENE mais dupliqué ici pour le filtrage dans GEO, améliore les performances sans passer par une vue)';

COMMENT ON COLUMN m_activite_eco.an_eco_etab.old_siret
    IS 'Attribut de gestion servant uniquement temporairement à la récupération des contacts d''un ancien établissement qui aurait disparu pour les remettre dans le nouveau. Cet attribut est vidé parès mise à jour';

COMMENT ON COLUMN m_activite_eco.an_eco_etab.old_id
    IS 'Attribut de gestion servant uniquement temporairement à la récupération des contacts d''un établissement spécifique non présent dans SIRENE mais apparu par la suite. Cet attribut est vidé parès mise à jour';

COMMENT ON COLUMN m_activite_eco.an_eco_etab.date_int
    IS 'Date renseignée par GéoPicardie lors de l''intégration du fichier dans la base (correspond aux dernières données reçues)';

COMMENT ON COLUMN m_activite_eco.an_eco_etab.observ
    IS 'Commentaires';

COMMENT ON COLUMN m_activite_eco.an_eco_etab.op_sai
    IS 'Libellé de l''opérateur de Saisie';

COMMENT ON COLUMN m_activite_eco.an_eco_etab.op_maj
    IS 'Opérateur de mise à jour';

COMMENT ON COLUMN m_activite_eco.an_eco_etab.date_sai
    IS 'Date de saisie des données attributaires';

COMMENT ON COLUMN m_activite_eco.an_eco_etab.date_maj
    IS 'Date de mise à jour des données attributaires';

COMMENT ON COLUMN m_activite_eco.an_eco_etab.insee
    IS 'Code Insee de la commune (provenance SIRENE, mise à jour après intégration par trimestre dans le FME d''intégration API');
    
-- Index: an_eco_etab_id_idx
-- DROP INDEX m_activite_eco.an_eco_etab_id_idx;

CREATE INDEX an_eco_etab_id_idx
    ON m_activite_eco.an_eco_etab USING btree
    (id ASC NULLS LAST)
    TABLESPACE pg_default;
    
-- Index: an_eco_etab_idsiret_idx
-- DROP INDEX m_activite_eco.an_eco_etab_idsiret_idx;

CREATE INDEX an_eco_etab_idsiret_idx
    ON m_activite_eco.an_eco_etab USING btree
    (idsiret COLLATE pg_catalog."default" ASC NULLS LAST)
    TABLESPACE pg_default;

-- Trigger: t_t100_log
-- DROP TRIGGER t_t100_log ON m_activite_eco.an_eco_etab;

CREATE TRIGGER t_t100_log
    AFTER INSERT OR DELETE OR UPDATE 
    ON m_activite_eco.an_eco_etab
    FOR EACH ROW
    EXECUTE PROCEDURE m_activite_eco.ft_m_an_eco_log();

-- Trigger: t_t1_an_eco_etab_date_sai
-- DROP TRIGGER t_t1_an_eco_etab_date_sai ON m_activite_eco.an_eco_etab;

CREATE TRIGGER t_t1_an_eco_etab_date_sai
    BEFORE INSERT
    ON m_activite_eco.an_eco_etab
    FOR EACH ROW
    EXECUTE PROCEDURE public.ft_r_timestamp_sai();

-- Trigger: t_t2_an_eco_etab_date_maj
-- DROP TRIGGER t_t2_an_eco_etab_date_maj ON m_activite_eco.an_eco_etab;

CREATE TRIGGER t_t2_an_eco_etab_date_maj
    BEFORE UPDATE 
    ON m_activite_eco.an_eco_etab
    FOR EACH ROW
    EXECUTE PROCEDURE public.ft_r_timestamp_maj();

-- Trigger: t_t3_l_nom_null
-- DROP TRIGGER t_t3_l_nom_null ON m_activite_eco.an_eco_etab;

CREATE TRIGGER t_t3_l_nom_null
    AFTER UPDATE 
    ON m_activite_eco.an_eco_etab
    FOR EACH ROW
    EXECUTE PROCEDURE m_activite_eco.ft_m_an_eco_etab_l_nom_null();

-- Trigger: t_t5_an_eco_etab_lcompte_local
-- DROP TRIGGER t_t5_an_eco_etab_lcompte_local ON m_activite_eco.an_eco_etab;

CREATE TRIGGER t_t5_an_eco_etab_lcompte_local
    AFTER UPDATE 
    ON m_activite_eco.an_eco_etab
    FOR EACH ROW
    EXECUTE PROCEDURE m_activite_eco.ft_m_refresh_etab_lcompte();

-- ################################################# Classe des établissements radiés : an_eco_etab_rad ##################################

CREATE TABLE m_activite_eco.an_eco_etab_rad
(
    gid integer NOT NULL DEFAULT nextval('m_activite_eco.an_eco_etab_rad_seq'::regclass),
    siren character varying(9) COLLATE pg_catalog."default",
    date_rad timestamp without time zone,
    CONSTRAINT an_eco_etab_rad_pkey PRIMARY KEY (gid)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

COMMENT ON TABLE m_activite_eco.an_eco_etab_rad
    IS 'Table alphanumérique contenant les SIREN des unités légales radiées (informations issues des fichiers OpenData de 2012 au 23/11/2021 du site InfoGreffe)';

COMMENT ON COLUMN m_activite_eco.an_eco_etab_rad.gid
    IS 'Identifiant unique interne';

COMMENT ON COLUMN m_activite_eco.an_eco_etab_rad.siren
    IS 'Identifiant SIRNE de l''unité légale';

COMMENT ON COLUMN m_activite_eco.an_eco_etab_rad.date_rad
    IS 'Date de la radiation';
    
-- Index: an_eco_etab_rad_gid_idx
-- DROP INDEX m_activite_eco.an_eco_etab_rad_gid_idx;

CREATE INDEX an_eco_etab_rad_gid_idx
    ON m_activite_eco.an_eco_etab_rad USING btree
    (gid ASC NULLS LAST)
    TABLESPACE pg_default;

-- ################################################# Classe des évènements : an_eco_evenmt ##################################

CREATE TABLE m_activite_eco.an_eco_evenmt
(
    idevenmt integer NOT NULL DEFAULT nextval('m_activite_eco.an_eco_evenmt_seq'::regclass),
    idobjet character varying(10) COLLATE pg_catalog."default",
    libelle character varying(254) COLLATE pg_catalog."default",
    typevenmt character varying(2) COLLATE pg_catalog."default",
    motif character varying(254) COLLATE pg_catalog."default",
    date_evenmt timestamp without time zone,
    nom_contact character varying(100) COLLATE pg_catalog."default",
    date_sai timestamp without time zone,
    date_maj timestamp without time zone,
    op_sai character varying(80) COLLATE pg_catalog."default",
    op_maj character varying(80) COLLATE pg_catalog."default",
    epci text COLLATE pg_catalog."default",
    observ character varying(1000) COLLATE pg_catalog."default",
    date_rel timestamp without time zone,
    e_term boolean DEFAULT false,
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

COMMENT ON TABLE m_activite_eco.an_eco_evenmt
    IS 'Table alphanumérique de l''ensemble des contacts liés à la thématique activité économique';

COMMENT ON COLUMN m_activite_eco.an_eco_evenmt.idevenmt
    IS 'Identifiant unique non signifiant du contact';

COMMENT ON COLUMN m_activite_eco.an_eco_evenmt.idobjet
    IS 'Identifiant de l''objet lié';

COMMENT ON COLUMN m_activite_eco.an_eco_evenmt.libelle
    IS 'Libellé de l''évènement';

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

COMMENT ON COLUMN m_activite_eco.an_eco_evenmt.op_maj
    IS 'Opérateur de mise à jour';

COMMENT ON COLUMN m_activite_eco.an_eco_evenmt.epci
    IS 'Autorité compétente';

COMMENT ON COLUMN m_activite_eco.an_eco_evenmt.observ
    IS 'Observations diverses';

COMMENT ON COLUMN m_activite_eco.an_eco_evenmt.date_rel
    IS 'Date d''une relance éventuelle à prévoir';

COMMENT ON COLUMN m_activite_eco.an_eco_evenmt.e_term
    IS 'Evènement terminé';
    
-- Index: an_eco_evenmt_idevenmt_idx
-- DROP INDEX m_activite_eco.an_eco_evenmt_idevenmt_idx;

CREATE INDEX an_eco_evenmt_idevenmt_idx
    ON m_activite_eco.an_eco_evenmt USING btree
    (idevenmt ASC NULLS LAST)
    TABLESPACE pg_default;
    
-- Index: an_eco_evenmt_idobjet_idx
-- DROP INDEX m_activite_eco.an_eco_evenmt_idobjet_idx;

CREATE INDEX an_eco_evenmt_idobjet_idx
    ON m_activite_eco.an_eco_evenmt USING btree
    (idobjet COLLATE pg_catalog."default" ASC NULLS LAST)
    TABLESPACE pg_default;

-- Trigger: t_t100_log
-- DROP TRIGGER t_t100_log ON m_activite_eco.an_eco_evenmt;

CREATE TRIGGER t_t100_log
    AFTER INSERT OR DELETE OR UPDATE 
    ON m_activite_eco.an_eco_evenmt
    FOR EACH ROW
    EXECUTE PROCEDURE m_activite_eco.ft_m_an_eco_log();

-- Trigger: t_t1_date_sai
-- DROP TRIGGER t_t1_date_sai ON m_activite_eco.an_eco_evenmt;

CREATE TRIGGER t_t1_date_sai
    BEFORE INSERT
    ON m_activite_eco.an_eco_evenmt
    FOR EACH ROW
    EXECUTE PROCEDURE public.ft_r_timestamp_sai();

-- Trigger: t_t2_date_maj
-- DROP TRIGGER t_t2_date_maj ON m_activite_eco.an_eco_evenmt;

CREATE TRIGGER t_t2_date_maj
    BEFORE UPDATE 
    ON m_activite_eco.an_eco_evenmt
    FOR EACH ROW
    EXECUTE PROCEDURE public.ft_r_timestamp_maj();

-- Trigger: t_t3_an_eco_evenmt_delete
-- DROP TRIGGER t_t3_an_eco_evenmt_delete ON m_activite_eco.an_eco_evenmt;

CREATE TRIGGER t_t3_an_eco_evenmt_delete
    AFTER DELETE
    ON m_activite_eco.an_eco_evenmt
    FOR EACH ROW
    EXECUTE PROCEDURE m_activite_eco.ft_m_delete_an_eco_evenmt();

-- Trigger: t_t4_an_eco_evenmt_insert_update
-- DROP TRIGGER t_t4_an_eco_evenmt_insert_update ON m_activite_eco.an_eco_evenmt;

CREATE TRIGGER t_t4_an_eco_evenmt_insert_update
    BEFORE INSERT OR UPDATE 
    ON m_activite_eco.an_eco_evenmt
    FOR EACH ROW
    EXECUTE PROCEDURE m_activite_eco.ft_m_insert_update_epci();

-- ################################################# Classe des objets Médias des évènements : an_eco_evenmt_media ##################################

CREATE TABLE m_activite_eco.an_eco_evenmt_media
(
    gid integer NOT NULL DEFAULT nextval('m_activite_eco.an_eco_evenmt_media_seq'::regclass),
    id integer,
    media text COLLATE pg_catalog."default",
    miniature bytea,
    n_fichier text COLLATE pg_catalog."default",
    t_fichier text COLLATE pg_catalog."default",
    op_sai character varying(20) COLLATE pg_catalog."default",
    op_maj character varying(20) COLLATE pg_catalog."default",
    date_sai timestamp without time zone,
    date_maj timestamp without time zone,
    l_doc character varying(100) COLLATE pg_catalog."default",
    t_doc character varying(2) COLLATE pg_catalog."default" DEFAULT '00'::character varying,
    d_photo timestamp without time zone,
    CONSTRAINT an_eco_evenmt_media_pkey PRIMARY KEY (gid),
    CONSTRAINT an_eco_evenmt_media_t_doc_fkey FOREIGN KEY (t_doc)
        REFERENCES m_activite_eco.lt_eco_tdocmedia (code) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

COMMENT ON TABLE m_activite_eco.an_eco_evenmt_media
    IS 'Table gérant les documents intégrés pour la gestion des données des sites, lots et locaux et bâtiments d''activité';

COMMENT ON COLUMN m_activite_eco.an_eco_evenmt_media.gid
    IS 'Compteur (identifiant interne)';

COMMENT ON COLUMN m_activite_eco.an_eco_evenmt_media.id
    IS 'Identifiant interne non signifiant de l''objet saisi';

COMMENT ON COLUMN m_activite_eco.an_eco_evenmt_media.media
    IS 'Champ Média de GEO';

COMMENT ON COLUMN m_activite_eco.an_eco_evenmt_media.miniature
    IS 'Champ miniature de GEO';

COMMENT ON COLUMN m_activite_eco.an_eco_evenmt_media.n_fichier
    IS 'Nom du fichier';

COMMENT ON COLUMN m_activite_eco.an_eco_evenmt_media.t_fichier
    IS 'Type de média dans GEO';

COMMENT ON COLUMN m_activite_eco.an_eco_evenmt_media.op_sai
    IS 'Opérateur de saisie (par défaut login de connexion à GEO)';

COMMENT ON COLUMN m_activite_eco.an_eco_evenmt_media.op_maj
    IS 'Opérateur de mise à jour';

COMMENT ON COLUMN m_activite_eco.an_eco_evenmt_media.date_sai
    IS 'Date de la saisie du document';

COMMENT ON COLUMN m_activite_eco.an_eco_evenmt_media.l_doc
    IS 'Titre du document ou légère description';

COMMENT ON COLUMN m_activite_eco.an_eco_evenmt_media.t_doc
    IS 'Type de documents';

COMMENT ON COLUMN m_activite_eco.an_eco_evenmt_media.d_photo
    IS 'Date de la prise de vue';
    
-- Index: an_eco_evenmt_media_gid_idx
-- DROP INDEX m_activite_eco.an_eco_evenmt_media_gid_idx;

CREATE INDEX an_eco_evenmt_media_gid_idx
    ON m_activite_eco.an_eco_evenmt_media USING btree
    (gid ASC NULLS LAST)
    TABLESPACE pg_default;
    
-- Index: an_eco_evenmt_media_id_idx
-- DROP INDEX m_activite_eco.an_eco_evenmt_media_id_idx;

CREATE INDEX an_eco_evenmt_media_id_idx
    ON m_activite_eco.an_eco_evenmt_media USING btree
    (id ASC NULLS LAST)
    TABLESPACE pg_default;

-- Trigger: t_t100_log
-- DROP TRIGGER t_t100_log ON m_activite_eco.an_eco_evenmt_media;

CREATE TRIGGER t_t100_log
    AFTER INSERT OR DELETE OR UPDATE 
    ON m_activite_eco.an_eco_evenmt_media
    FOR EACH ROW
    EXECUTE PROCEDURE m_activite_eco.ft_m_an_eco_log();

-- Trigger: t_t1_date_maj
-- DROP TRIGGER t_t1_date_maj ON m_activite_eco.an_eco_evenmt_media;

CREATE TRIGGER t_t1_date_maj
    BEFORE UPDATE 
    ON m_activite_eco.an_eco_evenmt_media
    FOR EACH ROW
    EXECUTE PROCEDURE public.ft_r_timestamp_maj();

-- ################################################# Classe des objets des locaux d'activité : an_eco_loc_act ##################################

CREATE TABLE m_activite_eco.an_eco_loc_act
(
    id character varying(15) COLLATE pg_catalog."default" NOT NULL DEFAULT ('LOC'::text || nextval('m_activite_eco.an_eco_loc_act_seq'::regclass)),
    idloc character varying(10) COLLATE pg_catalog."default" NOT NULL,
    libelle character varying(150) COLLATE pg_catalog."default",
    typ2 character varying(2) COLLATE pg_catalog."default",
    surf_p integer,
    descript character varying(5000) COLLATE pg_catalog."default",
    occup character varying(2) COLLATE pg_catalog."default" DEFAULT '00'::character varying,
    pvente integer,
    pventem2 double precision,
    loyer integer,
    loyerm2 double precision,
    occupant character varying(80) COLLATE pg_catalog."default",
    l_url character varying(254) COLLATE pg_catalog."default",
    sourceloc character varying(254) COLLATE pg_catalog."default",
    observ character varying(1000) COLLATE pg_catalog."default",
    date_sai timestamp without time zone,
    date_maj timestamp without time zone,
    op_sai character varying(20) COLLATE pg_catalog."default",
    op_maj character varying(20) COLLATE pg_catalog."default"
    sourceloc_maj timestamp without time zone,
    CONSTRAINT an_eco_loc_act_pkey PRIMARY KEY (id),
    CONSTRAINT geo_eco_loc_act_occup_fkey FOREIGN KEY (occup)
        REFERENCES m_activite_eco.lt_eco_occuploc (code) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT geo_eco_loc_act_typ2_fkey FOREIGN KEY (typ2)
        REFERENCES m_activite_eco.lt_eco_typoccup (code) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

COMMENT ON TABLE m_activite_eco.an_eco_loc_act
    IS 'Données géographiques contenant les locaux d''activités identifiés';

COMMENT ON COLUMN m_activite_eco.an_eco_loc_act.id
    IS 'Identifiant unique de l''unité local';

COMMENT ON COLUMN m_activite_eco.an_eco_loc_act.idloc
    IS 'Identifiant unique du bâtiment ou du local';

COMMENT ON COLUMN m_activite_eco.an_eco_loc_act.libelle
    IS 'Nom usuel du local';

COMMENT ON COLUMN m_activite_eco.an_eco_loc_act.typ2
    IS 'Typologie d''occupation du local';

COMMENT ON COLUMN m_activite_eco.an_eco_loc_act.surf_p
    IS 'Surface de plancher';

COMMENT ON COLUMN m_activite_eco.an_eco_loc_act.descript
    IS 'Elément descriptif du local';

COMMENT ON COLUMN m_activite_eco.an_eco_loc_act.occup
    IS 'Type d''occupation du local';

COMMENT ON COLUMN m_activite_eco.an_eco_loc_act.pvente
    IS 'Prix de vente en € du local';

COMMENT ON COLUMN m_activite_eco.an_eco_loc_act.pventem2
    IS 'Prix de vente au m² en € du local';

COMMENT ON COLUMN m_activite_eco.an_eco_loc_act.loyer
    IS 'Loyer mensuel en € du local';

COMMENT ON COLUMN m_activite_eco.an_eco_loc_act.loyerm2
    IS 'Loyer mensuel au m² en € du local';

COMMENT ON COLUMN m_activite_eco.an_eco_loc_act.occupant
    IS 'Libellé de l''occupant si établissement non lié';

COMMENT ON COLUMN m_activite_eco.an_eco_loc_act.l_url
    IS 'Lien URL vers une référence externe';

COMMENT ON COLUMN m_activite_eco.an_eco_loc_act.sourceloc
    IS 'Source des informations du local';

COMMENT ON COLUMN m_activite_eco.an_eco_loc_act.observ
    IS 'Observations diverses';

COMMENT ON COLUMN m_activite_eco.an_eco_loc_act.date_sai
    IS 'Date de saisie du local';

COMMENT ON COLUMN m_activite_eco.an_eco_loc_act.date_maj
    IS 'Date de mise à jour du local';

COMMENT ON COLUMN m_activite_eco.an_eco_loc_act.op_sai
    IS 'Opérateur de saisie';

COMMENT ON COLUMN m_activite_eco.an_eco_loc_act.op_maj
    IS 'Opérateur de mise à jour';


COMMENT ON COLUMN m_activite_eco.an_eco_loc_act.sourceloc_maj
    IS 'Date de mise à jour des informations du local';

-- Index: an_eco_loc_act_id_idloc_idx
-- DROP INDEX m_activite_eco.an_eco_loc_act_id_idloc_idx;

CREATE INDEX an_eco_loc_act_id_idloc_idx
    ON m_activite_eco.an_eco_loc_act USING btree
    (idloc COLLATE pg_catalog."default" ASC NULLS LAST)
    TABLESPACE pg_default;
    
-- Index: an_eco_loc_act_id_idx
-- DROP INDEX m_activite_eco.an_eco_loc_act_id_idx;

CREATE INDEX an_eco_loc_act_id_idx
    ON m_activite_eco.an_eco_loc_act USING btree
    (id COLLATE pg_catalog."default" ASC NULLS LAST)
    TABLESPACE pg_default;

-- Trigger: t_t100_log
-- DROP TRIGGER t_t100_log ON m_activite_eco.an_eco_loc_act;

CREATE TRIGGER t_t100_log
    AFTER INSERT OR DELETE OR UPDATE 
    ON m_activite_eco.an_eco_loc_act
    FOR EACH ROW
    EXECUTE PROCEDURE m_activite_eco.ft_m_an_eco_log();

-- Trigger: t_t1_date_sai
-- DROP TRIGGER t_t1_date_sai ON m_activite_eco.an_eco_loc_act;

CREATE TRIGGER t_t1_date_sai
    BEFORE INSERT
    ON m_activite_eco.an_eco_loc_act
    FOR EACH ROW
    EXECUTE PROCEDURE public.ft_r_timestamp_sai();

-- Trigger: t_t2_date_maj
-- DROP TRIGGER t_t2_date_maj ON m_activite_eco.an_eco_loc_act;

CREATE TRIGGER t_t2_date_maj
    BEFORE UPDATE 
    ON m_activite_eco.an_eco_loc_act
    FOR EACH ROW
    EXECUTE PROCEDURE public.ft_r_timestamp_maj();

-- Trigger: t_t3_geo_eco_loc_act_delete
-- DROP TRIGGER t_t3_geo_eco_loc_act_delete ON m_activite_eco.an_eco_loc_act;

CREATE TRIGGER t_t3_geo_eco_loc_act_delete
    AFTER DELETE
    ON m_activite_eco.an_eco_loc_act
    FOR EACH ROW
    EXECUTE PROCEDURE m_activite_eco.ft_m_geo_eco_loc_act_delete();

-- ################################################# Classe des objets Médias des locaux d'activité : an_eco_loc_media ##################################

CREATE TABLE m_activite_eco.an_eco_loc_media
(
    gid integer NOT NULL DEFAULT nextval('m_activite_eco.an_eco_loc_media_seq'::regclass),
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
    CONSTRAINT an_eco_loc_media_pkey PRIMARY KEY (gid),
    CONSTRAINT an_eco_loc_media_t_doc_fkey FOREIGN KEY (t_doc)
        REFERENCES m_activite_eco.lt_eco_tdocmedia (code) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

COMMENT ON TABLE m_activite_eco.an_eco_loc_media
    IS 'Table gérant les documents intégrés pour la gestion des données des locaux d''activités';

COMMENT ON COLUMN m_activite_eco.an_eco_loc_media.gid
    IS 'Compteur (identifiant interne)';

COMMENT ON COLUMN m_activite_eco.an_eco_loc_media.id
    IS 'Identifiant interne non signifiant de l''objet saisi';

COMMENT ON COLUMN m_activite_eco.an_eco_loc_media.media
    IS 'Champ Média de GEO';

COMMENT ON COLUMN m_activite_eco.an_eco_loc_media.miniature
    IS 'Champ miniature de GEO';

COMMENT ON COLUMN m_activite_eco.an_eco_loc_media.n_fichier
    IS 'Nom du fichier';

COMMENT ON COLUMN m_activite_eco.an_eco_loc_media.t_fichier
    IS 'Type de média dans GEO';

COMMENT ON COLUMN m_activite_eco.an_eco_loc_media.date_sai
    IS 'Date de la saisie du document';

COMMENT ON COLUMN m_activite_eco.an_eco_loc_media.date_maj
    IS 'Date de mise à jour';

COMMENT ON COLUMN m_activite_eco.an_eco_loc_media.op_sai
    IS 'Opérateur de saisie (par défaut login de connexion à GEO)';

COMMENT ON COLUMN m_activite_eco.an_eco_loc_media.op_maj
    IS 'Opérateur de mise à jour';

COMMENT ON COLUMN m_activite_eco.an_eco_loc_media.l_doc
    IS 'Titre du document ou légère description';

COMMENT ON COLUMN m_activite_eco.an_eco_loc_media.t_doc
    IS 'Type de documents';

COMMENT ON COLUMN m_activite_eco.an_eco_loc_media.d_photo
    IS 'Date de la prise de vue';
    
-- Index: an_eco_loc_media_gid_idx
-- DROP INDEX m_activite_eco.an_eco_loc_media_gid_idx;

CREATE INDEX an_eco_loc_media_gid_idx
    ON m_activite_eco.an_eco_loc_media USING btree
    (gid ASC NULLS LAST)
    TABLESPACE pg_default;
    
-- Index: an_eco_loc_media_id_idx
-- DROP INDEX m_activite_eco.an_eco_loc_media_id_idx;

CREATE INDEX an_eco_loc_media_id_idx
    ON m_activite_eco.an_eco_loc_media USING btree
    (id COLLATE pg_catalog."default" ASC NULLS LAST)
    TABLESPACE pg_default;

-- Trigger: t_t100_log
-- DROP TRIGGER t_t100_log ON m_activite_eco.an_eco_loc_media;

CREATE TRIGGER t_t100_log
    AFTER INSERT OR DELETE OR UPDATE 
    ON m_activite_eco.an_eco_loc_media
    FOR EACH ROW
    EXECUTE PROCEDURE m_activite_eco.ft_m_an_eco_log();

-- Trigger: t_t1_date_maj
-- DROP TRIGGER t_t1_date_maj ON m_activite_eco.an_eco_loc_media;

CREATE TRIGGER t_t1_date_maj
    BEFORE UPDATE 
    ON m_activite_eco.an_eco_loc_media
    FOR EACH ROW
    EXECUTE PROCEDURE public.ft_r_timestamp_maj();

-- ################################################# Classe des logs : an_eco_log ##################################

CREATE TABLE m_activite_eco.an_eco_log
(
    idlog integer NOT NULL,
    tablename character varying(80) COLLATE pg_catalog."default" NOT NULL,
    type_ope text COLLATE pg_catalog."default" NOT NULL,
    dataold text COLLATE pg_catalog."default",
    datanew text COLLATE pg_catalog."default",
    date_maj timestamp without time zone DEFAULT now(),
    CONSTRAINT an_eco_log_pkey PRIMARY KEY (idlog)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

COMMENT ON TABLE m_activite_eco.an_eco_log
    IS 'Table des opérations effectuées sur les données activités économiques à l''insert, update et delete';

COMMENT ON COLUMN m_activite_eco.an_eco_log.idlog
    IS 'Identifiant unique';

COMMENT ON COLUMN m_activite_eco.an_eco_log.tablename
    IS 'Nom de la classe concernée par une opération';

COMMENT ON COLUMN m_activite_eco.an_eco_log.type_ope
    IS 'Type d''opération';

COMMENT ON COLUMN m_activite_eco.an_eco_log.dataold
    IS 'Anciennes données';

COMMENT ON COLUMN m_activite_eco.an_eco_log.datanew
    IS 'Nouvelles données';

COMMENT ON COLUMN m_activite_eco.an_eco_log.date_maj
    IS 'Date d''exécution de l''opération';
    
-- ################################################# Classe des objets des lots : an_eco_lot ##################################

CREATE TABLE m_activite_eco.an_eco_lot
(
    idgeolf integer NOT NULL,
    tact character varying(2) COLLATE pg_catalog."default" DEFAULT '00'::character varying,
    cnom character varying(20) COLLATE pg_catalog."default",
    lnom character varying(80) COLLATE pg_catalog."default",
    observ character varying(255) COLLATE pg_catalog."default",
    bati integer,
    pc_depot timestamp without time zone,
    pc_accord timestamp without time zone,
    pc_tra timestamp without time zone,
    pc_fin timestamp without time zone,
    pvente_e numeric(10,2),
    pc_num character varying(50) COLLATE pg_catalog."default",
    pc_mo character varying(100) COLLATE pg_catalog."default",
    pers_v character varying(10) COLLATE pg_catalog."default",
    oripro character varying(15) COLLATE pg_catalog."default",
    occupant character varying(100) COLLATE pg_catalog."default",
    descrip character varying(1000) COLLATE pg_catalog."default",
    date_sai timestamp without time zone,
    date_maj timestamp without time zone,
    op_sai character varying(20) COLLATE pg_catalog."default",
    op_maj character varying(20) COLLATE pg_catalog."default",
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

COMMENT ON TABLE m_activite_eco.an_eco_lot
    IS 'Table alphanumérique contenant les données des lots à vocation économique';

COMMENT ON COLUMN m_activite_eco.an_eco_lot.idgeolf
    IS 'Identifiant unique de l''entité géographique lot';

COMMENT ON COLUMN m_activite_eco.an_eco_lot.tact
    IS 'Type d''activité présent sur le lot';

COMMENT ON COLUMN m_activite_eco.an_eco_lot.cnom
    IS 'Nom de code de l''acquéreur';

COMMENT ON COLUMN m_activite_eco.an_eco_lot.lnom
    IS 'Nom de l''acquéreur';

COMMENT ON COLUMN m_activite_eco.an_eco_lot.observ
    IS 'Observations diverses';

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

COMMENT ON COLUMN m_activite_eco.an_eco_lot.date_sai
    IS 'Date de saisie';

COMMENT ON COLUMN m_activite_eco.an_eco_lot.date_maj
    IS 'Date de mise à jour';

COMMENT ON COLUMN m_activite_eco.an_eco_lot.op_sai
    IS 'Opérateur de saisie';

COMMENT ON COLUMN m_activite_eco.an_eco_lot.op_maj
    IS 'Opérateur de mise à jour';
    
-- Index: an_eco_lot_idgeolf_idx
-- DROP INDEX m_activite_eco.an_eco_lot_idgeolf_idx;

CREATE INDEX an_eco_lot_idgeolf_idx
    ON m_activite_eco.an_eco_lot USING btree
    (idgeolf ASC NULLS LAST)
    TABLESPACE pg_default;

-- Trigger: t_t100_log
-- DROP TRIGGER t_t100_log ON m_activite_eco.an_eco_lot;

CREATE TRIGGER t_t100_log
    AFTER INSERT OR DELETE OR UPDATE 
    ON m_activite_eco.an_eco_lot
    FOR EACH ROW
    EXECUTE PROCEDURE m_activite_eco.ft_m_an_eco_log();

-- Trigger: t_t1_date_maj
-- DROP TRIGGER t_t1_date_maj ON m_activite_eco.an_eco_lot;

CREATE TRIGGER t_t1_date_maj
    BEFORE UPDATE 
    ON m_activite_eco.an_eco_lot
    FOR EACH ROW
    EXECUTE PROCEDURE public.ft_r_timestamp_maj();

-- Trigger: t_t2_refresh_view
-- DROP TRIGGER t_t2_refresh_view ON m_activite_eco.an_eco_lot;

CREATE TRIGGER t_t2_refresh_view
    AFTER UPDATE OF cnom, lnom
    ON m_activite_eco.an_eco_lot
    FOR EACH ROW
    EXECUTE PROCEDURE m_activite_eco.ft_m_refresh_view_bati_act();

-- ################################################# Classe des objets Médias des lots : an_eco_lot_media ##################################

CREATE TABLE m_activite_eco.an_eco_lot_media
(
    gid integer NOT NULL DEFAULT nextval('m_activite_eco.an_eco_media_seq'::regclass),
    id integer,
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
    alaune boolean DEFAULT false,
    alaunesite boolean DEFAULT false,
    CONSTRAINT an_eco_lot_media_pkey PRIMARY KEY (gid),
    CONSTRAINT an_eco_lot_media_t_doc_fkey FOREIGN KEY (t_doc)
        REFERENCES m_activite_eco.lt_eco_tdocmedia (code) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

COMMENT ON TABLE m_activite_eco.an_eco_lot_media
    IS 'Table gérant les documents intégrés pour la gestion des données des lots d''activité';

COMMENT ON COLUMN m_activite_eco.an_eco_lot_media.gid
    IS 'Compteur (identifiant interne)';

COMMENT ON COLUMN m_activite_eco.an_eco_lot_media.id
    IS 'Identifiant interne non signifiant de l''objet saisi';

COMMENT ON COLUMN m_activite_eco.an_eco_lot_media.media
    IS 'Champ Média de GEO';

COMMENT ON COLUMN m_activite_eco.an_eco_lot_media.miniature
    IS 'Champ miniature de GEO';

COMMENT ON COLUMN m_activite_eco.an_eco_lot_media.n_fichier
    IS 'Nom du fichier';

COMMENT ON COLUMN m_activite_eco.an_eco_lot_media.t_fichier
    IS 'Type de média dans GEO';

COMMENT ON COLUMN m_activite_eco.an_eco_lot_media.date_sai
    IS 'Date de la saisie du document';

COMMENT ON COLUMN m_activite_eco.an_eco_lot_media.date_maj
    IS 'Date de mise à jour';

COMMENT ON COLUMN m_activite_eco.an_eco_lot_media.op_sai
    IS 'Opérateur de saisie (par défaut login de connexion à GEO)';

COMMENT ON COLUMN m_activite_eco.an_eco_lot_media.op_maj
    IS 'Opérateur de mise à jour';

COMMENT ON COLUMN m_activite_eco.an_eco_lot_media.l_doc
    IS 'Titre du document ou légère description';

COMMENT ON COLUMN m_activite_eco.an_eco_lot_media.t_doc
    IS 'Type de documents';

COMMENT ON COLUMN m_activite_eco.an_eco_lot_media.d_photo
    IS 'Date de la prise de vue';

COMMENT ON COLUMN m_activite_eco.an_eco_lot_media.alaune
    IS 'Média poussé à la une de l''annonce immobilière';

COMMENT ON COLUMN m_activite_eco.an_eco_lot_media.alaunesite
    IS 'Média poussé à la une de la fiche de présentation du site';
    
-- Index: an_eco_lot_media_gid_idx
-- DROP INDEX m_activite_eco.an_eco_lot_media_gid_idx;

CREATE INDEX an_eco_lot_media_gid_idx
    ON m_activite_eco.an_eco_lot_media USING btree
    (gid ASC NULLS LAST)
    TABLESPACE pg_default;
    
-- Index: an_eco_lot_media_id_idx
-- DROP INDEX m_activite_eco.an_eco_lot_media_id_idx;

CREATE INDEX an_eco_lot_media_id_idx
    ON m_activite_eco.an_eco_lot_media USING btree
    (id ASC NULLS LAST)
    TABLESPACE pg_default;

-- Trigger: t_t100_log
-- DROP TRIGGER t_t100_log ON m_activite_eco.an_eco_lot_media;

CREATE TRIGGER t_t100_log
    AFTER INSERT OR DELETE OR UPDATE 
    ON m_activite_eco.an_eco_lot_media
    FOR EACH ROW
    EXECUTE PROCEDURE m_activite_eco.ft_m_an_eco_log();

-- Trigger: t_t1_date_maj
-- DROP TRIGGER t_t1_date_maj ON m_activite_eco.an_eco_lot_media;

CREATE TRIGGER t_t1_date_maj
    BEFORE UPDATE 
    ON m_activite_eco.an_eco_lot_media
    FOR EACH ROW
    EXECUTE PROCEDURE public.ft_r_timestamp_maj();

-- ################################################# Classe des objets Médias des sites d'activité : an_eco_media ##################################

CREATE TABLE m_activite_eco.an_eco_media
(
    gid integer NOT NULL DEFAULT nextval('m_activite_eco.an_eco_media_seq'::regclass),
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
    alaune boolean DEFAULT false,
    alaunesite boolean DEFAULT false,
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

COMMENT ON TABLE m_activite_eco.an_eco_media
    IS 'Table gérant les documents intégrés pour la gestion des données des sites, lots et locaux et bâtiments d''activité';

COMMENT ON COLUMN m_activite_eco.an_eco_media.gid
    IS 'Compteur (identifiant interne)';

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

COMMENT ON COLUMN m_activite_eco.an_eco_media.date_sai
    IS 'Date de la saisie du document';

COMMENT ON COLUMN m_activite_eco.an_eco_media.date_maj
    IS 'Date de mise à jour';

COMMENT ON COLUMN m_activite_eco.an_eco_media.op_sai
    IS 'Opérateur de saisie (par défaut login de connexion à GEO)';

COMMENT ON COLUMN m_activite_eco.an_eco_media.op_maj
    IS 'Opérateur de mise à jour';

COMMENT ON COLUMN m_activite_eco.an_eco_media.l_doc
    IS 'Titre du document ou légère description';

COMMENT ON COLUMN m_activite_eco.an_eco_media.t_doc
    IS 'Type de documents';

COMMENT ON COLUMN m_activite_eco.an_eco_media.d_photo
    IS 'Date de la prise de vue';

COMMENT ON COLUMN m_activite_eco.an_eco_media.alaune
    IS 'Média poussé à la une de l''annonce immobilière';

COMMENT ON COLUMN m_activite_eco.an_eco_media.alaunesite
    IS 'Média poussé à la une de la fiche de présentation du site';
    
-- Index: an_eco_media_gid_idx
-- DROP INDEX m_activite_eco.an_eco_media_gid_idx;

CREATE INDEX an_eco_media_gid_idx
    ON m_activite_eco.an_eco_media USING btree
    (gid ASC NULLS LAST)
    TABLESPACE pg_default;
    
-- Index: an_eco_media_id_idx
-- DROP INDEX m_activite_eco.an_eco_media_id_idx;

CREATE INDEX an_eco_media_id_idx
    ON m_activite_eco.an_eco_media USING btree
    (id COLLATE pg_catalog."default" ASC NULLS LAST)
    TABLESPACE pg_default;

-- Trigger: t_t100_log
-- DROP TRIGGER t_t100_log ON m_activite_eco.an_eco_media;

CREATE TRIGGER t_t100_log
    AFTER INSERT OR DELETE OR UPDATE 
    ON m_activite_eco.an_eco_media
    FOR EACH ROW
    EXECUTE PROCEDURE m_activite_eco.ft_m_an_eco_log();

-- Trigger: t_t1_date_maj
-- DROP TRIGGER t_t1_date_maj ON m_activite_eco.an_eco_media;

CREATE TRIGGER t_t1_date_maj
    BEFORE UPDATE 
    ON m_activite_eco.an_eco_media
    FOR EACH ROW
    EXECUTE PROCEDURE public.ft_r_timestamp_maj();

-- ################################################# Classe des objets des pôles d'activité : an_eco_pole ##################################

-- table en cours de refonte

-- ################################################# Classe des objets des établissements spécifiques : geo_eco_etabp ##################################

CREATE TABLE m_activite_eco.geo_eco_etabp
(
    idgeoet integer NOT NULL DEFAULT nextval('r_objet.idgeo_seq'::regclass),
    idsiren character varying(9) COLLATE pg_catalog."default",
    idsiret character varying(14) COLLATE pg_catalog."default",
    nom character varying(255) COLLATE pg_catalog."default",
    adresse character varying(255) COLLATE pg_catalog."default",
    eff_etab integer,
    eff_etab_d character varying(200) COLLATE pg_catalog."default",
    source_eff character varying(50) COLLATE pg_catalog."default",
    date_eff date,
    ape character varying(2) COLLATE pg_catalog."default" DEFAULT '00'::character varying,
    l_url character varying(500) COLLATE pg_catalog."default",
    l_url_bil character varying(500) COLLATE pg_catalog."default",
    l_compte boolean DEFAULT true,
    observ character varying(255) COLLATE pg_catalog."default",
    date_sai timestamp without time zone,
    date_maj timestamp without time zone,
    op_sai character varying(80) COLLATE pg_catalog."default",
    op_maj character varying(80) COLLATE pg_catalog."default",
    src_geom character varying(2) COLLATE pg_catalog."default" DEFAULT '20'::character varying,
    insee character varying(5) COLLATE pg_catalog."default",
    commune character varying(80) COLLATE pg_catalog."default",
    geom geometry(Point,2154) NOT NULL,
    idobjet character varying(15) COLLATE pg_catalog."default",
    CONSTRAINT geo_eco_etabp_pkey PRIMARY KEY (idgeoet),
    CONSTRAINT geo_eco_etabp_ape_fkey FOREIGN KEY (ape)
        REFERENCES s_sirene.naf_n1 (code) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT geo_eco_etabp_srcgeom_fkey FOREIGN KEY (src_geom)
        REFERENCES r_objet.lt_src_geom (code) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

COMMENT ON TABLE m_activite_eco.geo_eco_etabp
    IS 'Données métiers sur les établissements non présent dans SIRENE (transition dans l''attente de leur intégration dans ce même fichier)';

COMMENT ON COLUMN m_activite_eco.geo_eco_etabp.idgeoet
    IS 'Identifiant géographique unique';

COMMENT ON COLUMN m_activite_eco.geo_eco_etabp.idsiren
    IS 'Numéro SIRENE de l''établissement (si connu)';

COMMENT ON COLUMN m_activite_eco.geo_eco_etabp.idsiret
    IS 'Numéro SIRET de l''établissement (si connu)';

COMMENT ON COLUMN m_activite_eco.geo_eco_etabp.nom
    IS 'Libellé du nom de l''établissement spécifique';

COMMENT ON COLUMN m_activite_eco.geo_eco_etabp.adresse
    IS 'Adresse de l''établissement';

COMMENT ON COLUMN m_activite_eco.geo_eco_etabp.eff_etab
    IS 'Effectif total de l''établissement';

COMMENT ON COLUMN m_activite_eco.geo_eco_etabp.eff_etab_d
    IS 'Précision (en détail) du nombre de CDD, CDI, intérim, ....';

COMMENT ON COLUMN m_activite_eco.geo_eco_etabp.source_eff
    IS 'Source de l''effectif de l''établissement';

COMMENT ON COLUMN m_activite_eco.geo_eco_etabp.date_eff
    IS 'Date de l''effectif';

COMMENT ON COLUMN m_activite_eco.geo_eco_etabp.ape
    IS 'Code APE de l''établissement (Naf de niveau 1)';

COMMENT ON COLUMN m_activite_eco.geo_eco_etabp.l_url
    IS 'Lien du site internet de l''entreprise';

COMMENT ON COLUMN m_activite_eco.geo_eco_etabp.l_url_bil
    IS 'Lien vers le bilan en ligne de l''entreprise';

COMMENT ON COLUMN m_activite_eco.geo_eco_etabp.l_compte
    IS 'Prise en compte de l''établissement pour le calcul des statistiques (nombre d''établissements et effectifs) dans les informations de synthèse.
Par défaut TRUE et laisse le choix à l''administrateur de la donnée de modifier cette valeur.';

COMMENT ON COLUMN m_activite_eco.geo_eco_etabp.observ
    IS 'Commentaires';

COMMENT ON COLUMN m_activite_eco.geo_eco_etabp.date_sai
    IS 'Date de saisie par le producteur';

COMMENT ON COLUMN m_activite_eco.geo_eco_etabp.date_maj
    IS 'Date de mise à jour';

COMMENT ON COLUMN m_activite_eco.geo_eco_etabp.op_sai
    IS 'Libellé de l''opérateur de Saisie';

COMMENT ON COLUMN m_activite_eco.geo_eco_etabp.op_maj
    IS 'Opérateur de mise à  jour';

COMMENT ON COLUMN m_activite_eco.geo_eco_etabp.src_geom
    IS 'Référentiel spatial utilisé pour la saisie';

COMMENT ON COLUMN m_activite_eco.geo_eco_etabp.insee
    IS 'Code Insee de la commune';

COMMENT ON COLUMN m_activite_eco.geo_eco_etabp.commune
    IS 'Libellé de la commune';

COMMENT ON COLUMN m_activite_eco.geo_eco_etabp.geom
    IS 'Champ contenant la géométrie des objets';

COMMENT ON COLUMN m_activite_eco.geo_eco_etabp.idobjet
    IS 'Reconstruction de l''identifiant objet via un trigger pour l''''association des contacts dans les relations n--m dans GEO';
    
-- Index: geo_eco_etabp_geom_idx
-- DROP INDEX m_activite_eco.geo_eco_etabp_geom_idx;

CREATE INDEX geo_eco_etabp_geom_idx
    ON m_activite_eco.geo_eco_etabp USING gist
    (geom)
    TABLESPACE pg_default;
    
-- Index: geo_eco_etabp_idobjet_idx
-- DROP INDEX m_activite_eco.geo_eco_etabp_idobjet_idx;

CREATE INDEX geo_eco_etabp_idobjet_idx
    ON m_activite_eco.geo_eco_etabp USING btree
    (idobjet COLLATE pg_catalog."default" ASC NULLS LAST)
    TABLESPACE pg_default;

-- Trigger: t_t100_log
-- DROP TRIGGER t_t100_log ON m_activite_eco.geo_eco_etabp;

CREATE TRIGGER t_t100_log
    AFTER INSERT OR DELETE OR UPDATE 
    ON m_activite_eco.geo_eco_etabp
    FOR EACH ROW
    EXECUTE PROCEDURE m_activite_eco.ft_m_an_eco_log();

-- Trigger: t_t1_geo_eco_etabp_date_sai
-- DROP TRIGGER t_t1_geo_eco_etabp_date_sai ON m_activite_eco.geo_eco_etabp;

CREATE TRIGGER t_t1_geo_eco_etabp_date_sai
    BEFORE INSERT
    ON m_activite_eco.geo_eco_etabp
    FOR EACH ROW
    EXECUTE PROCEDURE public.ft_r_timestamp_sai();

-- Trigger: t_t2_geo_eco_etabp_date_maj
-- DROP TRIGGER t_t2_geo_eco_etabp_date_maj ON m_activite_eco.geo_eco_etabp;

CREATE TRIGGER t_t2_geo_eco_etabp_date_maj
    BEFORE UPDATE 
    ON m_activite_eco.geo_eco_etabp
    FOR EACH ROW
    EXECUTE PROCEDURE public.ft_r_timestamp_maj();

-- Trigger: t_t3_geo_eco_etabp_insee_commune
-- DROP TRIGGER t_t3_geo_eco_etabp_insee_commune ON m_activite_eco.geo_eco_etabp;

CREATE TRIGGER t_t3_geo_eco_etabp_insee_commune
    BEFORE INSERT OR UPDATE OF geom
    ON m_activite_eco.geo_eco_etabp
    FOR EACH ROW
    EXECUTE PROCEDURE public.ft_r_commune_pl();

-- Trigger: t_t4_secu_geom_sb_epci
-- DROP TRIGGER t_t4_secu_geom_sb_epci ON m_activite_eco.geo_eco_etabp;

CREATE TRIGGER t_t4_secu_geom_sb_epci
    BEFORE INSERT OR UPDATE OF geom
    ON m_activite_eco.geo_eco_etabp
    FOR EACH ROW
    EXECUTE PROCEDURE public.ft_m_secu_geom_p_epci();

-- Trigger: t_t5_geo_eco_etabp_idobjet
-- DROP TRIGGER t_t5_geo_eco_etabp_idobjet ON m_activite_eco.geo_eco_etabp;

CREATE TRIGGER t_t5_geo_eco_etabp_idobjet
    BEFORE INSERT OR UPDATE 
    ON m_activite_eco.geo_eco_etabp
    FOR EACH ROW
    EXECUTE PROCEDURE m_activite_eco.ft_m_geo_eco_etabp_idobjet();

-- Trigger: t_t6_geo_eco_etabp_null
-- DROP TRIGGER t_t6_geo_eco_etabp_null ON m_activite_eco.geo_eco_etabp;

CREATE TRIGGER t_t6_geo_eco_etabp_null
    AFTER INSERT OR UPDATE 
    ON m_activite_eco.geo_eco_etabp
    FOR EACH ROW
    EXECUTE PROCEDURE m_activite_eco.ft_m_etabp_null();

-- Trigger: t_t7_geo_eco_etabp_site
-- DROP TRIGGER t_t7_geo_eco_etabp_site ON m_activite_eco.geo_eco_etabp;

CREATE TRIGGER t_t7_geo_eco_etabp_site
    AFTER INSERT OR DELETE OR UPDATE 
    ON m_activite_eco.geo_eco_etabp
    FOR EACH ROW
    EXECUTE PROCEDURE m_activite_eco.ft_m_geo_eco_etabp_site();

-- Trigger: t_t8_refresh_view
-- DROP TRIGGER t_t8_refresh_view ON m_activite_eco.geo_eco_etabp;

CREATE TRIGGER t_t8_refresh_view
    AFTER INSERT OR DELETE OR UPDATE 
    ON m_activite_eco.geo_eco_etabp
    FOR EACH ROW
    EXECUTE PROCEDURE m_activite_eco.ft_m_refresh_etabp();

-- ################################################# Classe des objets des bâtiments d'activité : geo_eco_loc_act ##################################

CREATE TABLE m_activite_eco.geo_eco_loc_act
(
    idloc character varying(15) COLLATE pg_catalog."default" NOT NULL DEFAULT ('BA'::text || nextval('m_activite_eco.geo_eco_loc_act_seq'::regclass)),
    lib_bati character varying(150) COLLATE pg_catalog."default",
    typ1 character varying(2) COLLATE pg_catalog."default" DEFAULT '00'::character varying,
    adresse_a character varying(100) COLLATE pg_catalog."default",
    op_sai character varying(80) COLLATE pg_catalog."default",
    op_maj character varying(80) COLLATE pg_catalog."default",
    date_sai timestamp without time zone,
    date_maj timestamp without time zone,
    observ character varying(1000) COLLATE pg_catalog."default",
    insee character varying(5) COLLATE pg_catalog."default",
    commune character varying(100) COLLATE pg_catalog."default",
    epci character varying(10) COLLATE pg_catalog."default",
    src_geom character varying(2) COLLATE pg_catalog."default" DEFAULT '00'::character varying,
    geom geometry(Point,2154) NOT NULL,
    idgeolf integer,
    p_etiq boolean DEFAULT true,
    CONSTRAINT geo_eco_loc_act_pkey PRIMARY KEY (idloc),
    CONSTRAINT geo_eco_loc_act_geom_fkey FOREIGN KEY (src_geom)
        REFERENCES r_objet.lt_src_geom (code) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT geo_eco_loc_act_typ_fkey FOREIGN KEY (typ1)
        REFERENCES m_activite_eco.lt_eco_typloc (code) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

COMMENT ON TABLE m_activite_eco.geo_eco_loc_act
    IS 'Données géographiques contenant les locaux d''activités identifiés';

COMMENT ON COLUMN m_activite_eco.geo_eco_loc_act.idloc
    IS 'Identifiant unique de l''objet';

COMMENT ON COLUMN m_activite_eco.geo_eco_loc_act.lib_bati
    IS 'Libellé du bâtiment';

COMMENT ON COLUMN m_activite_eco.geo_eco_loc_act.typ1
    IS 'Typologie de local';

COMMENT ON COLUMN m_activite_eco.geo_eco_loc_act.adresse_a
    IS 'Adresse libre si inexistante dans la BAL (adresse non conforme, lieux-dit, ...)';

COMMENT ON COLUMN m_activite_eco.geo_eco_loc_act.op_sai
    IS 'Opérateur de saisie d''objet à l''ARC';

COMMENT ON COLUMN m_activite_eco.geo_eco_loc_act.op_maj
    IS 'Opérateur de mise à jour';

COMMENT ON COLUMN m_activite_eco.geo_eco_loc_act.date_sai
    IS 'Date de saisie de l''objet';

COMMENT ON COLUMN m_activite_eco.geo_eco_loc_act.date_maj
    IS 'Date de mise à jour';

COMMENT ON COLUMN m_activite_eco.geo_eco_loc_act.observ
    IS 'Observations diverses';

COMMENT ON COLUMN m_activite_eco.geo_eco_loc_act.insee
    IS 'Code Insee de la commune d''assise du local';

COMMENT ON COLUMN m_activite_eco.geo_eco_loc_act.commune
    IS 'Libellé de la commune d''assise du local';

COMMENT ON COLUMN m_activite_eco.geo_eco_loc_act.epci
    IS 'Autorité compétente';

COMMENT ON COLUMN m_activite_eco.geo_eco_loc_act.src_geom
    IS 'Référentiel spatial de saisie';

COMMENT ON COLUMN m_activite_eco.geo_eco_loc_act.geom
    IS 'Champ contenant la géométrie';

COMMENT ON COLUMN m_activite_eco.geo_eco_loc_act.idgeolf
    IS 'Identifiant du lot foncier si présent';

COMMENT ON COLUMN m_activite_eco.geo_eco_loc_act.p_etiq
    IS 'Priorisation de l''affichage du nom du bâtiment sur la carte Plan de situation dans GEO';
    
-- Index: geo_eco_loc_act_geom_idx
-- DROP INDEX m_activite_eco.geo_eco_loc_act_geom_idx;

CREATE INDEX geo_eco_loc_act_geom_idx
    ON m_activite_eco.geo_eco_loc_act USING gist
    (geom)
    TABLESPACE pg_default;
    
-- Index: geo_eco_loc_act_idloc_idx
-- DROP INDEX m_activite_eco.geo_eco_loc_act_idloc_idx;

CREATE INDEX geo_eco_loc_act_idloc_idx
    ON m_activite_eco.geo_eco_loc_act USING btree
    (idloc COLLATE pg_catalog."default" ASC NULLS LAST)
    TABLESPACE pg_default;

-- Trigger: t_t100_log
-- DROP TRIGGER t_t100_log ON m_activite_eco.geo_eco_loc_act;

CREATE TRIGGER t_t100_log
    AFTER INSERT OR DELETE OR UPDATE 
    ON m_activite_eco.geo_eco_loc_act
    FOR EACH ROW
    EXECUTE PROCEDURE m_activite_eco.ft_m_an_eco_log();

-- Trigger: t_t10_after_insert_loc
-- DROP TRIGGER t_t10_after_insert_loc ON m_activite_eco.geo_eco_loc_act;

CREATE TRIGGER t_t10_after_insert_loc
    AFTER INSERT
    ON m_activite_eco.geo_eco_loc_act
    FOR EACH ROW
    EXECUTE PROCEDURE m_activite_eco.ft_m_after_insert_loc();

-- Trigger: t_t11_refresh_view
-- DROP TRIGGER t_t11_refresh_view ON m_activite_eco.geo_eco_loc_act;

CREATE TRIGGER t_t11_refresh_view
    AFTER INSERT OR DELETE OR UPDATE OF lib_bati, geom
    ON m_activite_eco.geo_eco_loc_act
    FOR EACH ROW
    EXECUTE PROCEDURE m_activite_eco.ft_m_refresh_view_bati_act();

-- Trigger: t_t1_date_sai
-- DROP TRIGGER t_t1_date_sai ON m_activite_eco.geo_eco_loc_act;

CREATE TRIGGER t_t1_date_sai
    BEFORE INSERT
    ON m_activite_eco.geo_eco_loc_act
    FOR EACH ROW
    EXECUTE PROCEDURE public.ft_r_timestamp_sai();

-- Trigger: t_t2_date_maj
-- DROP TRIGGER t_t2_date_maj ON m_activite_eco.geo_eco_loc_act;

CREATE TRIGGER t_t2_date_maj
    BEFORE UPDATE 
    ON m_activite_eco.geo_eco_loc_act
    FOR EACH ROW
    EXECUTE PROCEDURE public.ft_r_timestamp_maj();

-- Trigger: t_t3_geo_eco_loc_act_insert_update
-- DROP TRIGGER t_t3_geo_eco_loc_act_insert_update ON m_activite_eco.geo_eco_loc_act;

CREATE TRIGGER t_t3_geo_eco_loc_act_insert_update
    BEFORE INSERT OR UPDATE 
    ON m_activite_eco.geo_eco_loc_act
    FOR EACH ROW
    EXECUTE PROCEDURE m_activite_eco.ft_m_insert_update_loc_rel();

-- Trigger: t_t4_insert_update_idgeolf
-- DROP TRIGGER t_t4_insert_update_idgeolf ON m_activite_eco.geo_eco_loc_act;

CREATE TRIGGER t_t4_insert_update_idgeolf
    BEFORE INSERT OR UPDATE 
    ON m_activite_eco.geo_eco_loc_act
    FOR EACH ROW
    EXECUTE PROCEDURE m_activite_eco.ft_m_insert_update_loc_lot();

-- Trigger: t_t5_secu_geom_sb_epci
-- DROP TRIGGER t_t5_secu_geom_sb_epci ON m_activite_eco.geo_eco_loc_act;

CREATE TRIGGER t_t5_secu_geom_sb_epci
    BEFORE INSERT OR UPDATE OF geom
    ON m_activite_eco.geo_eco_loc_act
    FOR EACH ROW
    EXECUTE PROCEDURE public.ft_m_secu_geom_p_epci();

-- Trigger: t_t6_geo_eco_loc_act_delete
-- DROP TRIGGER t_t6_geo_eco_loc_act_delete ON m_activite_eco.geo_eco_loc_act;

CREATE TRIGGER t_t6_geo_eco_loc_act_delete
    AFTER DELETE
    ON m_activite_eco.geo_eco_loc_act
    FOR EACH ROW
    EXECUTE PROCEDURE m_activite_eco.ft_m_delete_loc_rel();

-- Trigger: t_t7_geo_eco_loc_act_insee_commune
-- DROP TRIGGER t_t7_geo_eco_loc_act_insee_commune ON m_activite_eco.geo_eco_loc_act;

CREATE TRIGGER t_t7_geo_eco_loc_act_insee_commune
    BEFORE INSERT OR UPDATE 
    ON m_activite_eco.geo_eco_loc_act
    FOR EACH ROW
    EXECUTE PROCEDURE public.ft_r_commune_c();

-- Trigger: t_t8_autorite_competente
-- DROP TRIGGER t_t8_autorite_competente ON m_activite_eco.geo_eco_loc_act;

CREATE TRIGGER t_t8_autorite_competente
    BEFORE INSERT OR UPDATE OF geom
    ON m_activite_eco.geo_eco_loc_act
    FOR EACH ROW
    EXECUTE PROCEDURE public.ft_r_autorite_competente();

-- Trigger: t_t9_before_modif_loc
-- DROP TRIGGER t_t9_before_modif_loc ON m_activite_eco.geo_eco_loc_act;

CREATE TRIGGER t_t9_before_modif_loc
    BEFORE UPDATE 
    ON m_activite_eco.geo_eco_loc_act
    FOR EACH ROW
    EXECUTE PROCEDURE m_activite_eco.ft_m_before_modif_loc();

-- ################################################# Classe des objets des sites d'activité : geo_eco_site ##################################

CREATE TABLE m_activite_eco.geo_eco_site
(
    idsite character varying(5) COLLATE pg_catalog."default" NOT NULL DEFAULT ('S'::text || nextval('m_activite_eco.geo_eco_site_seq'::regclass)),
    idsitereg character varying(7) COLLATE pg_catalog."default",
    idpole character varying(7) COLLATE pg_catalog."default",
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
    z_fr_f character varying(80) COLLATE pg_catalog."default",
    z_dst_fr_f integer,
    z_fr_v character varying(80) COLLATE pg_catalog."default",
    z_dst_fr_v integer,
    z_pmm boolean DEFAULT false,
    z_dst_pmm integer,
    serv_tc boolean DEFAULT false,
    serv_tc_nb integer,
    serv_tc_fr character varying(80) COLLATE pg_catalog."default",
    serv_tc_g boolean DEFAULT false,
    circ_douce boolean DEFAULT false,
    serv_rest boolean DEFAULT false,
    serv_rest_nb integer,
    serv_crech boolean DEFAULT false,
    serv_crech_nb integer,
    serv_autre character varying(1000) COLLATE pg_catalog."default",
    z_aide_pb boolean DEFAULT false,
    src_geom character varying(2) COLLATE pg_catalog."default" DEFAULT '00'::character varying,
    src_date character varying(4) COLLATE pg_catalog."default" DEFAULT '0000'::bpchar,
    date_sai timestamp without time zone,
    date_maj timestamp without time zone,
    op_sai character varying(80) COLLATE pg_catalog."default",
    op_maj character varying(80) COLLATE pg_catalog."default",
    epci character varying(10) COLLATE pg_catalog."default",
    observ character varying(1000) COLLATE pg_catalog."default",
    geom geometry(MultiPolygon,2154),
    geom1 geometry(MultiPolygon,2154),
    site_id varchar(20),	
    moa_type varcahr(2),
    l_url varchar,
    z_pmm_n varchar(50),
    promotion boolean DEFAULT false,
    promo_comment varchar(1000),	
    CONSTRAINT geo_eco_site_pkey PRIMARY KEY (idsite),
    CONSTRAINT geo_eco_site_dest_fkey FOREIGN KEY (dest)
        REFERENCES m_activite_eco.lt_eco_dest (code) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT geo_eco_site_etat_fkey FOREIGN KEY (site_etat)
        REFERENCES m_amenagement.lt_amt_etat_occup (code) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT geo_eco_site_geom_fkey FOREIGN KEY (src_geom)
        REFERENCES r_objet.lt_src_geom (code) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT geo_eco_site_typo_fkey FOREIGN KEY (typo)
        REFERENCES m_activite_eco.lt_eco_typo (code) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT geo_eco_site_typsite_fkey FOREIGN KEY (typsite)
        REFERENCES m_activite_eco.lt_eco_typsite (code) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT geo_eco_site_voca_fkey FOREIGN KEY (site_voca)
        REFERENCES m_activite_eco.lt_eco_voca (code) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
    CONSTRAINT geo_eco_site_moatype_fkey FOREIGN KEY (moa_type)
        REFERENCES m_activite_eco.lt_eco_moatype (code) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION	
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

COMMENT ON TABLE m_activite_eco.geo_eco_site
    IS 'Classe des objets Sites d''activités économiques.';

COMMENT ON COLUMN m_activite_eco.geo_eco_site.idsite
    IS 'Identifiant interne non signifiant des site d''activités';

COMMENT ON COLUMN m_activite_eco.geo_eco_site.idsitereg
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
    IS 'Autres destinations ou précisions sur la destination';

COMMENT ON COLUMN m_activite_eco.geo_eco_site.date_crea
    IS 'Année de création du site';

COMMENT ON COLUMN m_activite_eco.geo_eco_site.p_implant
    IS 'Première implantation des entreprises sur le site (année ou date)';

COMMENT ON COLUMN m_activite_eco.geo_eco_site.commune
    IS 'Libellé des communes d''assises du site d''activités';

COMMENT ON COLUMN m_activite_eco.geo_eco_site.z_proced
    IS 'Le site est-il issu d''une procédure d''aménagement';

COMMENT ON COLUMN m_activite_eco.geo_eco_site.surf_brt
    IS 'Surface totale du site';

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

COMMENT ON COLUMN m_activite_eco.geo_eco_site.serv_tc_nb
    IS 'Nombre de lignes desservant le site';

COMMENT ON COLUMN m_activite_eco.geo_eco_site.serv_tc_fr
    IS 'Fréquence moyenne des lignes desservant le site';

COMMENT ON COLUMN m_activite_eco.geo_eco_site.serv_tc_g
    IS 'Gratuité des transports en commun';

COMMENT ON COLUMN m_activite_eco.geo_eco_site.circ_douce
    IS 'Présence de circulation douce accédant au site (pistes cyclables)';

COMMENT ON COLUMN m_activite_eco.geo_eco_site.serv_rest
    IS 'Présence de restaurants ou à proximité immédiate';

COMMENT ON COLUMN m_activite_eco.geo_eco_site.serv_rest_nb
    IS 'Nombre de points de restauration sur le site ou à proximité';

COMMENT ON COLUMN m_activite_eco.geo_eco_site.serv_crech
    IS 'Présence de crèches ou à proximité immédiate';

COMMENT ON COLUMN m_activite_eco.geo_eco_site.serv_crech_nb
    IS 'Nombre de crèche sur le site ou à proximité';

COMMENT ON COLUMN m_activite_eco.geo_eco_site.serv_autre
    IS 'Libellé des autres services disponibles sur le site';

COMMENT ON COLUMN m_activite_eco.geo_eco_site.z_aide_pb
    IS 'Aides publiques bénéficiaires au site';

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

COMMENT ON COLUMN m_activite_eco.geo_eco_site.op_maj
    IS 'Opérateur de mise à jour';

COMMENT ON COLUMN m_activite_eco.geo_eco_site.epci
    IS 'Autorité compétente';

COMMENT ON COLUMN m_activite_eco.geo_eco_site.observ
    IS 'Observations diverses';

COMMENT ON COLUMN m_activite_eco.geo_eco_site.geom
    IS 'Géométrie des objets sites';

COMMENT ON COLUMN m_activite_eco.geo_eco_site.geom1
    IS 'Géométrie des objets sites avec un buffer négatif de 0,5m';


COMMENT ON COLUMN m_activite_eco.geo_eco_site.site_id
    IS 'Identifiant spécifique au standard CNIG';


COMMENT ON COLUMN m_activite_eco.geo_eco_site.moa_type
    IS 'Type de maitrise d''ouvrage';


COMMENT ON COLUMN m_activite_eco.geo_eco_site.l_url
    IS 'Lien URL vers un média de présentation';


COMMENT ON COLUMN m_activite_eco.geo_eco_site.z_pmm_n
    IS 'Nom de la plate-forme multi modale (au moins route et fluvial)';

COMMENT ON COLUMN m_activite_eco.geo_eco_site.promotion
    IS 'Accord pour promouvoir l'offre foncière disponible d'un site';

COMMENT ON COLUMN m_activite_eco.geo_eco_site.promo_comment
    IS 'Commentaire libre pour échange avec les équipes de Geo2France';

-- Index: geo_eco_site_geom_idx
-- DROP INDEX m_activite_eco.geo_eco_site_geom_idx;

CREATE INDEX geo_eco_site_geom_idx
    ON m_activite_eco.geo_eco_site USING gist
    (geom)
    TABLESPACE pg_default;
    
-- Index: geo_eco_site_idsite_idx
-- DROP INDEX m_activite_eco.geo_eco_site_idsite_idx;

CREATE INDEX geo_eco_site_idsite_idx
    ON m_activite_eco.geo_eco_site USING btree
    (idsite COLLATE pg_catalog."default" ASC NULLS LAST)
    TABLESPACE pg_default;

-- Trigger: t_t100_log
-- DROP TRIGGER t_t100_log ON m_activite_eco.geo_eco_site;

CREATE TRIGGER t_t100_log
    AFTER INSERT OR DELETE OR UPDATE 
    ON m_activite_eco.geo_eco_site
    FOR EACH ROW
    EXECUTE PROCEDURE m_activite_eco.ft_m_an_eco_log();

-- Trigger: t_t1_date_sai
-- DROP TRIGGER t_t1_date_sai ON m_activite_eco.geo_eco_site;

CREATE TRIGGER t_t1_date_sai
    BEFORE INSERT
    ON m_activite_eco.geo_eco_site
    FOR EACH ROW
    EXECUTE PROCEDURE public.ft_r_timestamp_sai();

-- Trigger: t_t2_date_maj
-- DROP TRIGGER t_t2_date_maj ON m_activite_eco.geo_eco_site;

CREATE TRIGGER t_t2_date_maj
    BEFORE INSERT OR UPDATE 
    ON m_activite_eco.geo_eco_site
    FOR EACH ROW
    EXECUTE PROCEDURE public.ft_r_timestamp_maj();

-- Trigger: t_t3_surf_epci
-- DROP TRIGGER t_t3_surf_epci ON m_activite_eco.geo_eco_site;

CREATE TRIGGER t_t3_surf_epci
    BEFORE INSERT OR UPDATE 
    ON m_activite_eco.geo_eco_site
    FOR EACH ROW
    EXECUTE PROCEDURE m_activite_eco.ft_m_site_surf_epci();

-- Trigger: t_t4_secu_geom_sb_epci
-- DROP TRIGGER t_t4_secu_geom_sb_epci ON m_activite_eco.geo_eco_site;

CREATE TRIGGER t_t4_secu_geom_sb_epci
    BEFORE INSERT OR UPDATE OF geom
    ON m_activite_eco.geo_eco_site
    FOR EACH ROW
    EXECUTE PROCEDURE public.ft_m_secu_geom_sb_epci();

-- Trigger: t_t5_secu_zae_arc
-- DROP TRIGGER t_t5_secu_zae_arc ON m_activite_eco.geo_eco_site;

CREATE TRIGGER t_t5_secu_zae_arc
    BEFORE INSERT OR DELETE OR UPDATE 
    ON m_activite_eco.geo_eco_site
    FOR EACH ROW
    EXECUTE PROCEDURE m_activite_eco.ft_m_secu_zae_arc();

-- Trigger: t_t6_site_delete
-- DROP TRIGGER t_t6_site_delete ON m_activite_eco.geo_eco_site;

CREATE TRIGGER t_t6_site_delete
    AFTER DELETE
    ON m_activite_eco.geo_eco_site
    FOR EACH ROW
    EXECUTE PROCEDURE m_activite_eco.ft_m_delete_site();

-- Trigger: t_t7_refresh
-- DROP TRIGGER t_t7_refresh ON m_activite_eco.geo_eco_site;

CREATE TRIGGER t_t7_refresh
    AFTER INSERT OR DELETE OR UPDATE OF geom
    ON m_activite_eco.geo_eco_site
    FOR EACH ROW
    EXECUTE PROCEDURE m_activite_eco.ft_m_refresh_view_site();

-- Trigger: t_t8_site_insert_update
-- DROP TRIGGER t_t8_site_insert_update ON m_activite_eco.geo_eco_site;

CREATE TRIGGER t_t8_site_insert_update
    BEFORE INSERT OR UPDATE OF geom
    ON m_activite_eco.geo_eco_site
    FOR EACH ROW
    EXECUTE PROCEDURE m_activite_eco.ft_m_insert_update_site();

-- ################################################# Classe des objets historiques des établissements : h_an_eco_etab ##################################

CREATE TABLE m_activite_eco.h_an_eco_etab
(
    gid integer NOT NULL DEFAULT nextval('m_activite_eco.h_an_eco_etab_seq'::regclass),
    idgeoet integer,
    idsiren character varying(9) COLLATE pg_catalog."default",
    idsiret character varying(14) COLLATE pg_catalog."default",
    idsite character varying(10) COLLATE pg_catalog."default",
    date_maj timestamp without time zone,
    date_h timestamp without time zone,
    l_nom character varying(255) COLLATE pg_catalog."default",
    l1_nomen character varying(255) COLLATE pg_catalog."default",
    eff_etab integer,
    eff_etab_etp double precision,
    source_eff character varying(100) COLLATE pg_catalog."default",
    annee_eff integer,
    l_date_eff date,
    l_nom_dir character varying(100) COLLATE pg_catalog."default",
    l_observ character varying(255) COLLATE pg_catalog."default",
    t_source character varying(30) COLLATE pg_catalog."default",
    geom geometry(Point,2154),
    CONSTRAINT h_an_eco_etab_pkey PRIMARY KEY (gid)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

COMMENT ON TABLE m_activite_eco.h_an_eco_etab
    IS 'Table contenant les données historisées des établissements.
Cette table est incrémentée chaque année par un Workflow FME (Y:\Ressources\4-Partage\3-Procedures\FME\prod\ECO\historisation_annuelle_site_etab.fmw)
La géométrie des points n''est plus historisés depuis la localisation des établissements à l''adresse';

COMMENT ON COLUMN m_activite_eco.h_an_eco_etab.gid
    IS 'Identifiant unique non signifiant';

COMMENT ON COLUMN m_activite_eco.h_an_eco_etab.idgeoet
    IS 'Identifiant unique géographique';

COMMENT ON COLUMN m_activite_eco.h_an_eco_etab.idsiren
    IS 'Numéro SIRENE de l''établissement';

COMMENT ON COLUMN m_activite_eco.h_an_eco_etab.idsiret
    IS 'Numéro SIRET de l''établissement';

COMMENT ON COLUMN m_activite_eco.h_an_eco_etab.idsite
    IS 'Identifiant du site d''activité d''appartenance';

COMMENT ON COLUMN m_activite_eco.h_an_eco_etab.date_maj
    IS 'Date de mise à jour par le producteur';

COMMENT ON COLUMN m_activite_eco.h_an_eco_etab.date_h
    IS 'Date de mise en historique';

COMMENT ON COLUMN m_activite_eco.h_an_eco_etab.l_nom
    IS 'Enseigne dans SIRENE';

COMMENT ON COLUMN m_activite_eco.h_an_eco_etab.l1_nomen
    IS 'Raison sociale de l''établissement dans SIRENE';

COMMENT ON COLUMN m_activite_eco.h_an_eco_etab.eff_etab
    IS 'Effectif total de l''établissement';

COMMENT ON COLUMN m_activite_eco.h_an_eco_etab.eff_etab_etp
    IS 'Effectif de l''établissement en etp';

COMMENT ON COLUMN m_activite_eco.h_an_eco_etab.source_eff
    IS 'Source de l''effectif de l''établissement';

COMMENT ON COLUMN m_activite_eco.h_an_eco_etab.annee_eff
    IS 'Année de l''effectif (issu de SIRENE)';

COMMENT ON COLUMN m_activite_eco.h_an_eco_etab.l_date_eff
    IS 'Date de l''effectif saisie par l''ARC';

COMMENT ON COLUMN m_activite_eco.h_an_eco_etab.l_nom_dir
    IS 'Libellé du nom du dirigeant de l''établissement par l''ARC';

COMMENT ON COLUMN m_activite_eco.h_an_eco_etab.l_observ
    IS 'Commentaires';

COMMENT ON COLUMN m_activite_eco.h_an_eco_etab.t_source
    IS 'Nom de la table source';
    
-- Index: h_an_eco_etab_gid_idx
-- DROP INDEX m_activite_eco.h_an_eco_etab_gid_idx;

CREATE INDEX h_an_eco_etab_gid_idx
    ON m_activite_eco.h_an_eco_etab USING btree
    (gid ASC NULLS LAST)
    TABLESPACE pg_default;

-- ################################################# Classe des objets historique des sites d'activité : h_an_eco_site ##################################

CREATE TABLE m_activite_eco.h_an_eco_site
(
    id integer NOT NULL DEFAULT nextval('m_activite_eco.h_an_eco_site_seq'::regclass),
    idsite character varying(10) COLLATE pg_catalog."default",
    site_nom character varying(80) COLLATE pg_catalog."default",
    dest text COLLATE pg_catalog."default",
    voca text COLLATE pg_catalog."default",
    date_h timestamp with time zone,
    annee_h integer,
    nb_etab text COLLATE pg_catalog."default",
    eff_etab text COLLATE pg_catalog."default",
    surf_dispo_vente character varying COLLATE pg_catalog."default",
    surf_dedie_act character varying COLLATE pg_catalog."default",
    surf_reserve_projet character varying COLLATE pg_catalog."default",
    CONSTRAINT h_an_eco_site_pkey PRIMARY KEY (id)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

COMMENT ON TABLE m_activite_eco.h_an_eco_site
    IS 'Table contenant les données historisées des sites à vocation économique (1er historisation 1er janvier 2018). Le millésime correspond au 1er janvier de l''année.
Cette table est incrémentée chaque année par un Workflow FME (Y:\Ressources\4-Partage\3-Procedures\FME\prod\ECO\historisation_annuelle_site_etab.fmw)';

COMMENT ON COLUMN m_activite_eco.h_an_eco_site.id
    IS 'Identifiant unique interne';
    
-- Index: h_an_eco_site_id_idx
-- DROP INDEX m_activite_eco.h_an_eco_site_id_idx;

CREATE INDEX h_an_eco_site_id_idx
    ON m_activite_eco.h_an_eco_site USING btree
    (id ASC NULLS LAST)
    TABLESPACE pg_default;

-- ################################################# Classe des objets synthèse emploi/effectif des historiques des sites : h_an_eco_site_emploi ##################################

CREATE TABLE m_activite_eco.h_an_eco_site_emploi
(
    id integer NOT NULL,
    idsite character varying(10) COLLATE pg_catalog."default",
    annee_h integer,
    nb_etab integer,
    eff_etab integer,
    CONSTRAINT h_an_eco_site_emploi_pkey PRIMARY KEY (id)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

COMMENT ON TABLE m_activite_eco.h_an_eco_site_emploi
    IS 'Table contenant la synthèse des emplois et du nombre d''entreprises historisés par année. Cette table est produite avec la classe h_an_eco_site';

COMMENT ON COLUMN m_activite_eco.h_an_eco_site_emploi.id
    IS 'Identifiant interne non signifiant';

COMMENT ON COLUMN m_activite_eco.h_an_eco_site_emploi.idsite
    IS 'Identifiant du site d''activité historisé';

COMMENT ON COLUMN m_activite_eco.h_an_eco_site_emploi.annee_h
    IS 'Année d''historisation';

COMMENT ON COLUMN m_activite_eco.h_an_eco_site_emploi.nb_etab
    IS 'Nombre d''établissements de l''année historisée';

COMMENT ON COLUMN m_activite_eco.h_an_eco_site_emploi.eff_etab
    IS 'Nombre d''emplois de l''année historisée';
    
-- Index: h_an_eco_site_emploi_id_idx
-- DROP INDEX m_activite_eco.h_an_eco_site_emploi_id_idx;

CREATE INDEX h_an_eco_site_emploi_id_idx
    ON m_activite_eco.h_an_eco_site_emploi USING btree
    (id ASC NULLS LAST)
    TABLESPACE pg_default;
    
-- Index: idx_8897_idsite
-- DROP INDEX m_activite_eco.idx_8897_idsite;

CREATE INDEX idx_8897_idsite
    ON m_activite_eco.h_an_eco_site_emploi USING btree
    (idsite COLLATE pg_catalog."default" ASC NULLS LAST)
    TABLESPACE pg_default;

-- ################################################# Classe des objets associant les établissements à une adresse : lk_adresseetablissement ##################################

CREATE TABLE m_activite_eco.lk_adresseetablissement
(
    idadresse bigint,
    siret character varying(14) COLLATE pg_catalog."default",
    id bigint NOT NULL DEFAULT nextval('m_activite_eco.lk_adresseetablissement_seq'::regclass),
    CONSTRAINT lk_adresseetablissement_pkey PRIMARY KEY (id)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

COMMENT ON TABLE m_activite_eco.lk_adresseetablissement
    IS 'Table de lien permettant d''affecter les adresses de localisations aux établissements issus de la donnée SIRENE de l''Insee';

COMMENT ON COLUMN m_activite_eco.lk_adresseetablissement.idadresse
    IS 'Identifiant unique de l''adresse';

COMMENT ON COLUMN m_activite_eco.lk_adresseetablissement.siret
    IS 'N° SIRET de l''établissement';

COMMENT ON COLUMN m_activite_eco.lk_adresseetablissement.id
    IS 'Identifiant unique non siggnifiant';
    
-- Index: lk_adresseetablissement_id_idx
-- DROP INDEX m_activite_eco.lk_adresseetablissement_id_idx;

CREATE INDEX lk_adresseetablissement_id_idx
    ON m_activite_eco.lk_adresseetablissement USING btree
    (id ASC NULLS LAST)
    TABLESPACE pg_default;
    
-- Index: lk_adresseetablissement_idadresse_idx
-- DROP INDEX m_activite_eco.lk_adresseetablissement_idadresse_idx;

CREATE INDEX lk_adresseetablissement_idadresse_idx
    ON m_activite_eco.lk_adresseetablissement USING btree
    (idadresse ASC NULLS LAST)
    TABLESPACE pg_default;
    
-- Index: lk_adresseetablissement_siret_idx
-- DROP INDEX m_activite_eco.lk_adresseetablissement_siret_idx;

CREATE INDEX lk_adresseetablissement_siret_idx
    ON m_activite_eco.lk_adresseetablissement USING btree
    (siret COLLATE pg_catalog."default" ASC NULLS LAST)
    TABLESPACE pg_default;

-- Trigger: t_t100_log
-- DROP TRIGGER t_t100_log ON m_activite_eco.lk_adresseetablissement;

CREATE TRIGGER t_t100_log
    AFTER INSERT OR DELETE OR UPDATE 
    ON m_activite_eco.lk_adresseetablissement
    FOR EACH ROW
    EXECUTE PROCEDURE m_activite_eco.ft_m_an_eco_log();

-- Trigger: t_t1_lk_adresseetablissement_update
-- DROP TRIGGER t_t1_lk_adresseetablissement_update ON m_activite_eco.lk_adresseetablissement;

CREATE TRIGGER t_t1_lk_adresseetablissement_update
    BEFORE INSERT OR UPDATE 
    ON m_activite_eco.lk_adresseetablissement
    FOR EACH ROW
    EXECUTE PROCEDURE m_activite_eco.ft_m_lk_adresseetablissement_update();

-- Trigger: t_t3_lk_adresseetablissement_delete
-- DROP TRIGGER t_t3_lk_adresseetablissement_delete ON m_activite_eco.lk_adresseetablissement;

CREATE TRIGGER t_t3_lk_adresseetablissement_delete
    AFTER DELETE
    ON m_activite_eco.lk_adresseetablissement
    FOR EACH ROW
    EXECUTE PROCEDURE m_activite_eco.ft_m_lk_adresseetablissement_delete();

-- Trigger: t_t4_etab_site
-- DROP TRIGGER t_t4_etab_site ON m_activite_eco.lk_adresseetablissement;

CREATE TRIGGER t_t4_etab_site
    AFTER INSERT OR UPDATE 
    ON m_activite_eco.lk_adresseetablissement
    FOR EACH ROW
    EXECUTE PROCEDURE m_activite_eco.ft_m_insert_etab_site();

-- Trigger: t_t9_lk_etablissement_compte_after
-- DROP TRIGGER t_t9_lk_etablissement_compte_after ON m_activite_eco.lk_adresseetablissement;

CREATE TRIGGER t_t9_lk_etablissement_compte_after
    AFTER INSERT OR DELETE OR UPDATE 
    ON m_activite_eco.lk_adresseetablissement
    FOR EACH ROW
    EXECUTE PROCEDURE m_activite_eco.ft_m_lk_adresseetablissement_compte_after();

-- ################################################# Classe des objets associant les contacts aux aobjets économiques : lk_eco_contact ##################################

CREATE TABLE m_activite_eco.lk_eco_contact
(
    id integer NOT NULL DEFAULT nextval('m_activite_eco.lk_eco_contact_seq'::regclass),
    idcontact integer NOT NULL,
    idobjet character varying(15) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT lk_eco_contact_pkey PRIMARY KEY (id)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

COMMENT ON TABLE m_activite_eco.lk_eco_contact
    IS 'Table alphanumérique de l''ensemble des contacts liés à la thématique activité économique';

COMMENT ON COLUMN m_activite_eco.lk_eco_contact.id
    IS 'Identifiant unique non signifiant';

COMMENT ON COLUMN m_activite_eco.lk_eco_contact.idcontact
    IS 'Identifiant unique non signifiant du contact';

COMMENT ON COLUMN m_activite_eco.lk_eco_contact.idobjet
    IS 'Identifiant unique non signifiant de l''objet en référence';
    
-- Index: idx_6500_idobjet
-- DROP INDEX m_activite_eco.idx_6500_idobjet;

CREATE INDEX idx_6500_idobjet
    ON m_activite_eco.lk_eco_contact USING btree
    (idobjet COLLATE pg_catalog."default" ASC NULLS LAST)
    TABLESPACE pg_default;
    
-- Index: idx_9814_idcontact
-- DROP INDEX m_activite_eco.idx_9814_idcontact;

CREATE INDEX idx_9814_idcontact
    ON m_activite_eco.lk_eco_contact USING btree
    (idcontact ASC NULLS LAST)
    TABLESPACE pg_default;
    
-- Index: lk_eco_contact_id_idx
-- DROP INDEX m_activite_eco.lk_eco_contact_id_idx;

CREATE INDEX lk_eco_contact_id_idx
    ON m_activite_eco.lk_eco_contact USING btree
    (id ASC NULLS LAST)
    TABLESPACE pg_default;

-- Trigger: t_t100_log
-- DROP TRIGGER t_t100_log ON m_activite_eco.lk_eco_contact;

CREATE TRIGGER t_t100_log
    AFTER INSERT OR DELETE OR UPDATE 
    ON m_activite_eco.lk_eco_contact
    FOR EACH ROW
    EXECUTE PROCEDURE m_activite_eco.ft_m_an_eco_log();

-- ################################################# Classe des objets associant les établissements à un ou plusieurs sites : lk_eco_etab_site ##################################

CREATE TABLE m_activite_eco.lk_eco_etab_site
(
    idsite character varying(5) COLLATE pg_catalog."default" NOT NULL,
    siret character varying(14) COLLATE pg_catalog."default" NOT NULL,
    id integer NOT NULL DEFAULT nextval('m_activite_eco.lk_eco_etab_site_seq'::regclass),
    CONSTRAINT lk_eco_etab_site_pkey PRIMARY KEY (id)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

COMMENT ON TABLE m_activite_eco.lk_eco_etab_site
    IS 'Table de lien permettant d''affecter les établissements à un ou plusieurs sites';

COMMENT ON COLUMN m_activite_eco.lk_eco_etab_site.idsite
    IS 'Identifiant unique du site d''activité';

COMMENT ON COLUMN m_activite_eco.lk_eco_etab_site.siret
    IS 'N° SIRET de l''établissement';

COMMENT ON COLUMN m_activite_eco.lk_eco_etab_site.id
    IS 'Identifiant unique non signifiant';
    
-- Index: lk_eco_etab_site_id_idx
-- DROP INDEX m_activite_eco.lk_eco_etab_site_id_idx;

CREATE INDEX lk_eco_etab_site_id_idx
    ON m_activite_eco.lk_eco_etab_site USING btree
    (id ASC NULLS LAST)
    TABLESPACE pg_default;
    
-- Index: lk_eco_etab_site_idsite_idx
-- DROP INDEX m_activite_eco.lk_eco_etab_site_idsite_idx;

CREATE INDEX lk_eco_etab_site_idsite_idx
    ON m_activite_eco.lk_eco_etab_site USING btree
    (idsite COLLATE pg_catalog."default" ASC NULLS LAST)
    TABLESPACE pg_default;
    
-- Index: lk_eco_etab_site_siret_idx
-- DROP INDEX m_activite_eco.lk_eco_etab_site_siret_idx;

CREATE INDEX lk_eco_etab_site_siret_idx
    ON m_activite_eco.lk_eco_etab_site USING btree
    (siret COLLATE pg_catalog."default" ASC NULLS LAST)
    TABLESPACE pg_default;

-- Trigger: t_t100_log
-- DROP TRIGGER t_t100_log ON m_activite_eco.lk_eco_etab_site;

CREATE TRIGGER t_t100_log
    AFTER INSERT OR DELETE OR UPDATE 
    ON m_activite_eco.lk_eco_etab_site
    FOR EACH ROW
    EXECUTE PROCEDURE m_activite_eco.ft_m_an_eco_log();

-- ################################################# Classe des objets associant les locaux d'activité à une adresse : lk_eco_loc_adr ##################################

-- classe d'objets inutilisée pour le moment

-- ################################################# Classe des objets associant les locaux d'activité à un établissement : lk_eco_loc_etab ##################################

-- classe d'objets inutilisée pour le moment

-- ################################################# Classe des objets associant les contactzs des évènements : lk_eco_loc_evenmt_contact ##################################

CREATE TABLE m_activite_eco.lk_eco_loc_evenmt_contact
(
    id integer NOT NULL DEFAULT nextval('m_activite_eco.lk_eco_loc_evenmt_contact_seq'::regclass),
    idcontact integer NOT NULL,
    idevenmt integer NOT NULL,
    CONSTRAINT lk_eco_loc_evenmt_contact_pkey PRIMARY KEY (id)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

COMMENT ON TABLE m_activite_eco.lk_eco_loc_evenmt_contact
    IS 'Table alphanumérique d''appartenance d''un contact à un évènement';

COMMENT ON COLUMN m_activite_eco.lk_eco_loc_evenmt_contact.id
    IS 'Identifiant unique non signifiant de la relation';

COMMENT ON COLUMN m_activite_eco.lk_eco_loc_evenmt_contact.idcontact
    IS 'Identifiant unique non signifiant du contact';

COMMENT ON COLUMN m_activite_eco.lk_eco_loc_evenmt_contact.idevenmt
    IS 'Identifiant unique de l''évènement';
    
-- Index: lk_eco_loc_evenmt_contact_id_idx
-- DROP INDEX m_activite_eco.lk_eco_loc_evenmt_contact_id_idx;

CREATE INDEX lk_eco_loc_evenmt_contact_id_idx
    ON m_activite_eco.lk_eco_loc_evenmt_contact USING btree
    (id ASC NULLS LAST)
    TABLESPACE pg_default;
    
-- Index: lk_eco_loc_evenmt_contact_idcontact_idx
-- DROP INDEX m_activite_eco.lk_eco_loc_evenmt_contact_idcontact_idx;

CREATE INDEX lk_eco_loc_evenmt_contact_idcontact_idx
    ON m_activite_eco.lk_eco_loc_evenmt_contact USING btree
    (idcontact ASC NULLS LAST)
    TABLESPACE pg_default;
    
-- Index: lk_eco_loc_evenmt_contact_idevenmt_idx
-- DROP INDEX m_activite_eco.lk_eco_loc_evenmt_contact_idevenmt_idx;

CREATE INDEX lk_eco_loc_evenmt_contact_idevenmt_idx
    ON m_activite_eco.lk_eco_loc_evenmt_contact USING btree
    (idevenmt ASC NULLS LAST)
    TABLESPACE pg_default;

-- Trigger: t_t100_log
-- DROP TRIGGER t_t100_log ON m_activite_eco.lk_eco_loc_evenmt_contact;

CREATE TRIGGER t_t100_log
    AFTER INSERT OR DELETE OR UPDATE 
    ON m_activite_eco.lk_eco_loc_evenmt_contact
    FOR EACH ROW
    EXECUTE PROCEDURE m_activite_eco.ft_m_an_eco_log();

-- ################################################# Classe des objets associant les bâtiments d'activité à un ou plusieurs sites d'activité : lk_eco_loc_site ##################################

CREATE TABLE m_activite_eco.lk_eco_loc_site
(
    id integer NOT NULL DEFAULT nextval('m_activite_eco.lk_eco_loc_site_seq'::regclass),
    idloc character varying(15) COLLATE pg_catalog."default" NOT NULL,
    idsite character varying(5) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT lk_eco_loc_site_pkey PRIMARY KEY (id)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

COMMENT ON TABLE m_activite_eco.lk_eco_loc_site
    IS 'Table alphanumérique d''appartenance des locaux d''activité à un ou plusieurs sites';

COMMENT ON COLUMN m_activite_eco.lk_eco_loc_site.id
    IS 'Identifiant unique non signifiant de la relation';

COMMENT ON COLUMN m_activite_eco.lk_eco_loc_site.idloc
    IS 'Identifiant unique non signifiant de l''objet local d''activité';

COMMENT ON COLUMN m_activite_eco.lk_eco_loc_site.idsite
    IS 'Identifiant unique non signifiant de l''objet site';
    
-- Index: lk_eco_loc_site_id_idx
-- DROP INDEX m_activite_eco.lk_eco_loc_site_id_idx;

CREATE INDEX lk_eco_loc_site_id_idx
    ON m_activite_eco.lk_eco_loc_site USING btree
    (id ASC NULLS LAST)
    TABLESPACE pg_default;
    
-- Index: lk_eco_loc_site_idloc_idx
-- DROP INDEX m_activite_eco.lk_eco_loc_site_idloc_idx;

CREATE INDEX lk_eco_loc_site_idloc_idx
    ON m_activite_eco.lk_eco_loc_site USING btree
    (idloc COLLATE pg_catalog."default" ASC NULLS LAST)
    TABLESPACE pg_default;
    
-- Index: lk_eco_loc_site_idsite_idx
-- DROP INDEX m_activite_eco.lk_eco_loc_site_idsite_idx;

CREATE INDEX lk_eco_loc_site_idsite_idx
    ON m_activite_eco.lk_eco_loc_site USING btree
    (idsite COLLATE pg_catalog."default" ASC NULLS LAST)
    TABLESPACE pg_default;

-- Trigger: t_t100_log
-- DROP TRIGGER t_t100_log ON m_activite_eco.lk_eco_loc_site;

CREATE TRIGGER t_t100_log
    AFTER INSERT OR DELETE OR UPDATE 
    ON m_activite_eco.lk_eco_loc_site
    FOR EACH ROW
    EXECUTE PROCEDURE m_activite_eco.ft_m_an_eco_log();

-- ################################################# Classe des objets associant un site d'activité à une ou plusieurs procédure : lk_eco_proc ##################################

CREATE TABLE m_activite_eco.lk_eco_proc
(
    id integer NOT NULL DEFAULT nextval('m_activite_eco.lk_eco_proc_seq'::regclass),
    idproc character varying(5) COLLATE pg_catalog."default" NOT NULL,
    idsite character varying(5) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT lk_eco_proc_pkey PRIMARY KEY (id)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

COMMENT ON TABLE m_activite_eco.lk_eco_proc
    IS 'Table alphanumérique de l''ensemble des procédures d''aménagement présentes sur le site';

COMMENT ON COLUMN m_activite_eco.lk_eco_proc.id
    IS 'Identifiant unique non signifiant';

COMMENT ON COLUMN m_activite_eco.lk_eco_proc.idproc
    IS 'Identifiant unique non signifiant de l''objet procédure';

COMMENT ON COLUMN m_activite_eco.lk_eco_proc.idsite
    IS 'Identifiant unique non signifiant de l''objet site';
    
-- Index: idx_376_idproc
-- DROP INDEX m_activite_eco.idx_376_idproc;

CREATE INDEX idx_376_idproc
    ON m_activite_eco.lk_eco_proc USING btree
    (idproc COLLATE pg_catalog."default" ASC NULLS LAST)
    TABLESPACE pg_default;
    
-- Index: idx_6160_idsite
-- DROP INDEX m_activite_eco.idx_6160_idsite;

CREATE INDEX idx_6160_idsite
    ON m_activite_eco.lk_eco_proc USING btree
    (idsite COLLATE pg_catalog."default" ASC NULLS LAST)
    TABLESPACE pg_default;
    
-- Index: lk_eco_proc_id_idx
-- DROP INDEX m_activite_eco.lk_eco_proc_id_idx;

CREATE INDEX lk_eco_proc_id_idx
    ON m_activite_eco.lk_eco_proc USING btree
    (id ASC NULLS LAST)
    TABLESPACE pg_default;

-- Trigger: t_t100_log
-- DROP TRIGGER t_t100_log ON m_activite_eco.lk_eco_proc;

CREATE TRIGGER t_t100_log
    AFTER INSERT OR DELETE OR UPDATE 
    ON m_activite_eco.lk_eco_proc
    FOR EACH ROW
    EXECUTE PROCEDURE m_activite_eco.ft_m_an_eco_log();



-- ################################################# Classe des objets des établissements spécifiques : an_eco_uf ##################################

-- m_activite_eco.an_eco_uf definition

-- Drop table

-- DROP TABLE m_activite_eco.an_eco_uf;

CREATE TABLE m_activite_eco.an_eco_uf (
	gid int4 DEFAULT nextval('m_activite_eco.an_eco_uf_seq'::regclass) NOT NULL, -- Identifiant unique interne
	idsite varchar(7) NOT NULL, -- Identifiant du site
	site_uf_nbre int4 NULL, -- nombre d'unités foncières du site économique 
	site_uf_vacant_nbre int4 NULL, -- nombre d'unités foncières vacantes du site économique 
	site_taux_vacance float8 NULL, -- taux de vacance de la ZAE suivant article L318-8-2 CU (pourcentage)
	site_uf_bati_nbre int4 NULL, -- nombre d'unités foncières bâties
	url text NULL, -- Lien vers l'inventaire
	source_d text NULL, -- Organisme qui a réalisé l'inventaire
	dbinsert timestamp NULL, -- Date de saisie
	dbupdate timestamp NULL, -- Date de mise à jour
	op_sai varchar(80) NULL, -- Opérateur de saisie
	op_maj varchar(80) NULL, -- Opérateur de mise à jour
	annnee_d int4 NULL, -- Annnée de l'inventaire
	CONSTRAINT an_eco_uf_pkey PRIMARY KEY (gid)
);
CREATE INDEX idx_5349_idsite ON m_activite_eco.an_eco_uf USING btree (idsite);
COMMENT ON TABLE m_activite_eco.an_eco_uf IS 'Table alphanumérique contenant les informations relatives aux unités foncières demandées par le standard CNIG et réalisé à partir d''inventaire';

-- Column comments

COMMENT ON COLUMN m_activite_eco.an_eco_uf.gid IS 'Identifiant unique interne';
COMMENT ON COLUMN m_activite_eco.an_eco_uf.idsite IS 'Identifiant du site';
COMMENT ON COLUMN m_activite_eco.an_eco_uf.site_uf_nbre IS 'nombre d''unités foncières du site économique ';
COMMENT ON COLUMN m_activite_eco.an_eco_uf.site_uf_vacant_nbre IS 'nombre d''unités foncières vacantes du site économique ';
COMMENT ON COLUMN m_activite_eco.an_eco_uf.site_taux_vacance IS 'taux de vacance de la ZAE suivant article L318-8-2 CU (pourcentage)';
COMMENT ON COLUMN m_activite_eco.an_eco_uf.site_uf_bati_nbre IS 'nombre d''unités foncières bâties';
COMMENT ON COLUMN m_activite_eco.an_eco_uf.url IS 'Lien vers l''inventaire';
COMMENT ON COLUMN m_activite_eco.an_eco_uf.source_d IS 'Organisme qui a réalisé l''inventaire';
COMMENT ON COLUMN m_activite_eco.an_eco_uf.dbinsert IS 'Date de saisie';
COMMENT ON COLUMN m_activite_eco.an_eco_uf.dbupdate IS 'Date de mise à jour';
COMMENT ON COLUMN m_activite_eco.an_eco_uf.op_sai IS 'Opérateur de saisie';
COMMENT ON COLUMN m_activite_eco.an_eco_uf.op_maj IS 'Opérateur de mise à jour';
COMMENT ON COLUMN m_activite_eco.an_eco_uf.annnee_d IS 'Annnée de l''inventaire';

create trigger t_t1_dbinsert before
insert
    on
    m_activite_eco.an_eco_uf for each row execute procedure ft_r_timestamp_dbinsert();

create trigger t_t2_dbupdate before
update
    on
    m_activite_eco.an_eco_uf for each row execute procedure ft_r_timestamp_dbupdate();

-- ##########################################################################################################
-- ################################################# SCHEMA M_AMENAGAMENT ##################################
-- ##########################################################################################################


-- ################################################# Classe attributaires des objets lots espaces publics : an_amt_esppublic ##################################

CREATE TABLE m_amenagement.an_amt_esppublic
(
    idgeopu integer NOT NULL,
    idpole character varying(7) COLLATE pg_catalog."default",
    date_int date,
    op_sai character varying(80) COLLATE pg_catalog."default",
    org_sai character varying(80) COLLATE pg_catalog."default",
    vocaep character varying(2) COLLATE pg_catalog."default" DEFAULT '00'::character varying,
    date_sai timestamp without time zone,
    date_maj timestamp without time zone,
    epci character varying(10) COLLATE pg_catalog."default",
    CONSTRAINT an_amt_esppublic_pkey PRIMARY KEY (idgeopu),
    CONSTRAINT lt_amt_empesp_pu_fkey FOREIGN KEY (vocaep)
        REFERENCES m_amenagement.lt_amt_empesp_pu (code) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

COMMENT ON TABLE m_amenagement.an_amt_esppublic
    IS 'Information alphanumérique sur les emprises des espaces publiques contenus dans les sites opérationnels. Les objets virtuels de référence sont gérés dans le schéma r_objet';

COMMENT ON COLUMN m_amenagement.an_amt_esppublic.idgeopu
    IS 'Identifiant unique géographique de référence de l''objet virtuel';

COMMENT ON COLUMN m_amenagement.an_amt_esppublic.idpole
    IS 'Identifiant unique du pole';

COMMENT ON COLUMN m_amenagement.an_amt_esppublic.date_int
    IS 'Date d''intégration par GéoPicardie dans la base (permet de connaître la dernière donnée intégrée)';

COMMENT ON COLUMN m_amenagement.an_amt_esppublic.op_sai
    IS 'Libellé de la personne ayant saisie la mise à jour';

COMMENT ON COLUMN m_amenagement.an_amt_esppublic.org_sai
    IS 'Organisme de saisie dont dépend l''opérateur de saisie';

COMMENT ON COLUMN m_amenagement.an_amt_esppublic.vocaep
    IS 'Code de valeurs des vocations des espaces publics';

COMMENT ON COLUMN m_amenagement.an_amt_esppublic.date_sai
    IS 'Date de saisie des données attributaires';

COMMENT ON COLUMN m_amenagement.an_amt_esppublic.date_maj
    IS 'Date de mises à jour des données attributaires';

COMMENT ON COLUMN m_amenagement.an_amt_esppublic.epci
    IS 'Autorité compétente';

-- Trigger: t_t100_log
-- DROP TRIGGER t_t100_log ON m_amenagement.an_amt_esppublic;

CREATE TRIGGER t_t100_log
    AFTER INSERT OR DELETE OR UPDATE 
    ON m_amenagement.an_amt_esppublic
    FOR EACH ROW
    EXECUTE PROCEDURE m_activite_eco.ft_m_an_eco_log();

-- ################################################# Classe attributaires des objets lots divers : an_amt_lot_divers ##################################

CREATE TABLE m_amenagement.an_amt_lot_divers
(
    idgeolf integer NOT NULL,
    nom character varying(100) COLLATE pg_catalog."default",
    observ character varying(1000) COLLATE pg_catalog."default",
    op_maj character varying(80) COLLATE pg_catalog."default",
    CONSTRAINT an_amt_lot_divers_pkey PRIMARY KEY (idgeolf)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

COMMENT ON TABLE m_amenagement.an_amt_lot_divers
    IS 'Information alphanumérique sur les lots divers';

COMMENT ON COLUMN m_amenagement.an_amt_lot_divers.idgeolf
    IS 'Identifiant unique géographique de référence de l''objet virtuel';

COMMENT ON COLUMN m_amenagement.an_amt_lot_divers.nom
    IS 'Libellé';

COMMENT ON COLUMN m_amenagement.an_amt_lot_divers.observ
    IS 'Observations';

COMMENT ON COLUMN m_amenagement.an_amt_lot_divers.op_maj
    IS 'Opérateur de mise à jour';

-- Trigger: t_t100_log
-- DROP TRIGGER t_t100_log ON m_amenagement.an_amt_lot_divers;

CREATE TRIGGER t_t100_log
    AFTER INSERT OR DELETE OR UPDATE 
    ON m_amenagement.an_amt_lot_divers
    FOR EACH ROW
    EXECUTE PROCEDURE m_activite_eco.ft_m_an_eco_log();

-- ################################################# Classe attributaires des objets lots équipements : an_amt_lot_equip ##################################

CREATE TABLE m_amenagement.an_amt_lot_equip
(
    idgeolf integer NOT NULL,
    nom character varying(100) COLLATE pg_catalog."default",
    observ character varying(255) COLLATE pg_catalog."default",
    op_maj character varying(80) COLLATE pg_catalog."default",
    CONSTRAINT an_amt_lot_equip_pkey PRIMARY KEY (idgeolf)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

COMMENT ON TABLE m_amenagement.an_amt_lot_equip
    IS 'Information alphanumérique sur les lots équipements';

COMMENT ON COLUMN m_amenagement.an_amt_lot_equip.idgeolf
    IS 'Identifiant unique géographique de référence de l''objet virtuel';

COMMENT ON COLUMN m_amenagement.an_amt_lot_equip.nom
    IS 'Libellé de l''équipement';

COMMENT ON COLUMN m_amenagement.an_amt_lot_equip.observ
    IS 'Observations diverses';

COMMENT ON COLUMN m_amenagement.an_amt_lot_equip.op_maj
    IS 'Opérateur de mise à jour';

-- Trigger: t_t100_log
-- DROP TRIGGER t_t100_log ON m_amenagement.an_amt_lot_equip;

CREATE TRIGGER t_t100_log
    AFTER INSERT OR DELETE OR UPDATE 
    ON m_amenagement.an_amt_lot_equip
    FOR EACH ROW
    EXECUTE PROCEDURE m_activite_eco.ft_m_an_eco_log();

-- ################################################# Classe attributaires des objets lots espace public : an_amt_lot_esppublic ##################################

CREATE TABLE m_amenagement.an_amt_lot_esppublic
(
    idgeolf integer NOT NULL,
    nom character varying(100) COLLATE pg_catalog."default",
    observ character varying(255) COLLATE pg_catalog."default",
    op_maj character varying(80) COLLATE pg_catalog."default",
    CONSTRAINT an_amt_lot_esppublic_pkey PRIMARY KEY (idgeolf)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

COMMENT ON TABLE m_amenagement.an_amt_lot_esppublic
    IS 'Information alphanumérique sur les lots "espace public"';

COMMENT ON COLUMN m_amenagement.an_amt_lot_esppublic.idgeolf
    IS 'Identifiant unique géographique de référence de l''objet virtuel';

COMMENT ON COLUMN m_amenagement.an_amt_lot_esppublic.nom
    IS 'Libellé de l''équipement';

COMMENT ON COLUMN m_amenagement.an_amt_lot_esppublic.observ
    IS 'Observations diverses';

COMMENT ON COLUMN m_amenagement.an_amt_lot_esppublic.op_maj
    IS 'Opérateur de mise à jour';

-- Trigger: t_t100_log
-- DROP TRIGGER t_t100_log ON m_amenagement.an_amt_lot_esppublic;

CREATE TRIGGER t_t100_log
    AFTER INSERT OR DELETE OR UPDATE 
    ON m_amenagement.an_amt_lot_esppublic
    FOR EACH ROW
    EXECUTE PROCEDURE m_activite_eco.ft_m_an_eco_log();

-- ################################################# Classe attributaires des objets lots habitat : an_amt_lot_habitat ##################################

CREATE TABLE m_amenagement.an_amt_lot_habitat
(
    idgeolf integer NOT NULL,
    pvente_e character varying(15) COLLATE pg_catalog."default",
    nb_log integer,
    nb_logind integer,
    nb_logindgr integer,
    nb_logcol integer,
    nb_logaide integer,
    observ character varying(255) COLLATE pg_catalog."default",
    nb_log_r integer DEFAULT 0,
    nb_logind_r integer DEFAULT 0,
    nb_logindgr_r integer DEFAULT 0,
    nb_logcol_r integer DEFAULT 0,
    nb_logaide_r integer DEFAULT 0,
    nb_logaide_loc_r integer,
    nb_logaide_acc_r integer,
    op_maj character varying(80) COLLATE pg_catalog."default",
    CONSTRAINT an_amt_lot_habitat_pkey PRIMARY KEY (idgeolf)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

COMMENT ON TABLE m_amenagement.an_amt_lot_habitat
    IS 'Table alphanumérique contenant les données des lots à vocation habitat';

COMMENT ON COLUMN m_amenagement.an_amt_lot_habitat.idgeolf
    IS 'Identifiant unique de l''entité géographique lot';

COMMENT ON COLUMN m_amenagement.an_amt_lot_habitat.pvente_e
    IS 'Prix littéral de vente du lot en HT et en m² (ex:50€/m²)';

COMMENT ON COLUMN m_amenagement.an_amt_lot_habitat.nb_log
    IS 'Nombre total de logements';

COMMENT ON COLUMN m_amenagement.an_amt_lot_habitat.nb_logind
    IS 'Nombre de logements individuels';

COMMENT ON COLUMN m_amenagement.an_amt_lot_habitat.nb_logindgr
    IS 'Nombre de logements individuels groupés';

COMMENT ON COLUMN m_amenagement.an_amt_lot_habitat.nb_logcol
    IS 'Nombre de logements collectifs';

COMMENT ON COLUMN m_amenagement.an_amt_lot_habitat.nb_logaide
    IS 'Dont nombre de logements aidés';

COMMENT ON COLUMN m_amenagement.an_amt_lot_habitat.observ
    IS 'Observations diverses';

COMMENT ON COLUMN m_amenagement.an_amt_lot_habitat.nb_log_r
    IS 'Nombre de logements total réalisé';

COMMENT ON COLUMN m_amenagement.an_amt_lot_habitat.nb_logind_r
    IS 'Nombre de logements individuels réalisé';

COMMENT ON COLUMN m_amenagement.an_amt_lot_habitat.nb_logindgr_r
    IS 'Nombre de logements individuels groupés réalisé';

COMMENT ON COLUMN m_amenagement.an_amt_lot_habitat.nb_logcol_r
    IS 'Nombre de logements collectifs réalisé';

COMMENT ON COLUMN m_amenagement.an_amt_lot_habitat.nb_logaide_r
    IS 'Nombre de logements aidés réalisé';

COMMENT ON COLUMN m_amenagement.an_amt_lot_habitat.nb_logaide_loc_r
    IS 'Nombre de logements aidés en location réalisé';

COMMENT ON COLUMN m_amenagement.an_amt_lot_habitat.nb_logaide_acc_r
    IS 'Nombre de logements aidés en accession réalisé';

COMMENT ON COLUMN m_amenagement.an_amt_lot_habitat.op_maj
    IS 'Opérateur de mise à jour';

-- Trigger: t_t100_log
-- DROP TRIGGER t_t100_log ON m_amenagement.an_amt_lot_habitat;

CREATE TRIGGER t_t100_log
    AFTER INSERT OR DELETE OR UPDATE 
    ON m_amenagement.an_amt_lot_habitat
    FOR EACH ROW
    EXECUTE PROCEDURE m_activite_eco.ft_m_an_eco_log();

-- ################################################# Classe attributaires des objets lots mixte : an_amt_lot_mixt ##################################

CREATE TABLE m_amenagement.an_amt_lot_mixt
(
    idgeolf integer NOT NULL,
    pvente_e character varying(15) COLLATE pg_catalog."default",
    nb_log integer DEFAULT 0,
    nb_logind integer DEFAULT 0,
    nb_logindgr integer DEFAULT 0,
    nb_logcol integer DEFAULT 0,
    nb_logaide integer DEFAULT 0,
    observ character varying(255) COLLATE pg_catalog."default",
    nb_log_r integer DEFAULT 0,
    nb_logind_r integer DEFAULT 0,
    nb_logindgr_r integer DEFAULT 0,
    nb_logcol_r integer DEFAULT 0,
    nb_logaide_r integer DEFAULT 0,
    tact character varying(2) COLLATE pg_catalog."default" DEFAULT '00'::character varying,
    nom_equ character varying(100) COLLATE pg_catalog."default",
    nb_logaide_loc_r integer,
    nb_logaide_acc_r integer,
    lnom character varying(250) COLLATE pg_catalog."default",
    op_maj character varying(80) COLLATE pg_catalog."default",
    CONSTRAINT an_amt_lot_mixt_pkey PRIMARY KEY (idgeolf)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

COMMENT ON TABLE m_amenagement.an_amt_lot_mixt
    IS 'Table alphanumérique contenant les données des lots à vocation mixte';

COMMENT ON COLUMN m_amenagement.an_amt_lot_mixt.idgeolf
    IS 'Identifiant unique de l''entité géographique lot';

COMMENT ON COLUMN m_amenagement.an_amt_lot_mixt.pvente_e
    IS 'Prix littéral de vente du lot en HT et m² (ex:50€/m²) estimé par le service';

COMMENT ON COLUMN m_amenagement.an_amt_lot_mixt.nb_log
    IS 'Nombre total de logements';

COMMENT ON COLUMN m_amenagement.an_amt_lot_mixt.nb_logind
    IS 'Nombre de logements individuels';

COMMENT ON COLUMN m_amenagement.an_amt_lot_mixt.nb_logindgr
    IS 'Nombre de logements individuels groupés';

COMMENT ON COLUMN m_amenagement.an_amt_lot_mixt.nb_logcol
    IS 'Nombre de logements collectifs';

COMMENT ON COLUMN m_amenagement.an_amt_lot_mixt.nb_logaide
    IS 'Dont nombre de logements aidés';

COMMENT ON COLUMN m_amenagement.an_amt_lot_mixt.observ
    IS 'Observations diverses';

COMMENT ON COLUMN m_amenagement.an_amt_lot_mixt.nb_log_r
    IS 'Nombre de logements total réalisé';

COMMENT ON COLUMN m_amenagement.an_amt_lot_mixt.nb_logind_r
    IS 'Nombre de logements individuels réalisé';

COMMENT ON COLUMN m_amenagement.an_amt_lot_mixt.nb_logindgr_r
    IS 'Nombre de logements individuels groupés réalisé';

COMMENT ON COLUMN m_amenagement.an_amt_lot_mixt.nb_logcol_r
    IS 'Nombre de logements collectifs réalisé';

COMMENT ON COLUMN m_amenagement.an_amt_lot_mixt.nb_logaide_r
    IS 'Nombre de logements aidés réalisé';

COMMENT ON COLUMN m_amenagement.an_amt_lot_mixt.tact
    IS 'Type d''activité présent sur le lot';

COMMENT ON COLUMN m_amenagement.an_amt_lot_mixt.nom_equ
    IS 'Libellé des équipements prévus sur le lot';

COMMENT ON COLUMN m_amenagement.an_amt_lot_mixt.nb_logaide_loc_r
    IS 'Nombre de logements aidés en location réalisé';

COMMENT ON COLUMN m_amenagement.an_amt_lot_mixt.nb_logaide_acc_r
    IS 'Nombre de logements aidés en accession réalisé';

COMMENT ON COLUMN m_amenagement.an_amt_lot_mixt.lnom
    IS 'Nom(s) du ou des acquéreurs du lot ou d''une partie des bâtiments';

COMMENT ON COLUMN m_amenagement.an_amt_lot_mixt.op_maj
    IS 'Opérateur de mise à jour';

-- Trigger: t_t100_log
-- DROP TRIGGER t_t100_log ON m_amenagement.an_amt_lot_mixt;

CREATE TRIGGER t_t100_log
    AFTER INSERT OR DELETE OR UPDATE 
    ON m_amenagement.an_amt_lot_mixt
    FOR EACH ROW
    EXECUTE PROCEDURE m_activite_eco.ft_m_an_eco_log();

-- ################################################# Classe attributaires des stades d'aménagement des lots : an_amt_lot_stade ##################################

CREATE TABLE m_amenagement.an_amt_lot_stade
(
    idgeolf integer NOT NULL,
    idsite character varying(10) COLLATE pg_catalog."default",
    stade_amng character varying(2) COLLATE pg_catalog."default" DEFAULT '00'::character varying,
    l_amng2 character varying(2) COLLATE pg_catalog."default" DEFAULT '00'::character varying,
    stade_comm character varying(2) COLLATE pg_catalog."default" DEFAULT '00'::character varying,
    l_comm2 character varying(2) COLLATE pg_catalog."default" DEFAULT '00'::character varying,
    l_comm2_12 character varying(80) COLLATE pg_catalog."default",
    etat_occup character varying(2) COLLATE pg_catalog."default" DEFAULT '00'::character varying,
    op_maj character varying(80) COLLATE pg_catalog."default",
    maifon character varying(2) COLLATE pg_catalog."default" DEFAULT '00'::character varying,
    usage character varying(2) COLLATE pg_catalog."default" DEFAULT '00'::character varying,
    CONSTRAINT an_amt_lot_stade_pkey PRIMARY KEY (idgeolf),
    CONSTRAINT an_amt_lot_l_amng2_fkey FOREIGN KEY (l_amng2)
        REFERENCES m_amenagement.lt_amt_stadeamng2 (code) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT an_amt_lot_l_comm2_fkey FOREIGN KEY (l_comm2)
        REFERENCES m_amenagement.lt_amt_stadecomm2 (code) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT an_amt_lot_stade_comm_fkey FOREIGN KEY (stade_comm)
        REFERENCES m_amenagement.lt_amt_stadecomm (code) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT an_amt_lot_stadeamng_fkey FOREIGN KEY (stade_amng)
        REFERENCES m_amenagement.lt_amt_stadeamng (code) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT an_amt_lot_maifon_fkey FOREIGN KEY (maifon)
        REFERENCES m_amenagement.lt_amt_maifon (code) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT an_amt_lot_etatoccup_fkey FOREIGN KEY (etat_occup)
        REFERENCES m_amenagement.lt_amt_etatoccup (code) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT an_amt_lot_usage_fkey FOREIGN KEY (usage)
        REFERENCES m_amenagement.lt_amt_terrusage (code) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION	
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

COMMENT ON TABLE m_amenagement.an_amt_lot_stade
    IS 'Table alphanumérique contenant les données de la classe stade d''aménagement et de commercialisation';

COMMENT ON COLUMN m_amenagement.an_amt_lot_stade.idgeolf
    IS 'Identifiant unique de l''entité géographique lot';

COMMENT ON COLUMN m_amenagement.an_amt_lot_stade.idsite
    IS 'Identifiant du site d''activité d''appartenance';

COMMENT ON COLUMN m_amenagement.an_amt_lot_stade.stade_amng
    IS 'Code du stade d''aménagement du foncier';

COMMENT ON COLUMN m_amenagement.an_amt_lot_stade.l_amng2
    IS 'Code du stade d''aménagement du foncier spécifique à l''ARC';

COMMENT ON COLUMN m_amenagement.an_amt_lot_stade.stade_comm
    IS 'Code du stade de commercialisation du foncier';

COMMENT ON COLUMN m_amenagement.an_amt_lot_stade.l_comm2
    IS 'Code du stade de commercialisation du foncier spécifique à l''ARC';

COMMENT ON COLUMN m_amenagement.an_amt_lot_stade.l_comm2_12
    IS 'Spécification de la contrainte du lot en vente (code 12 du champ l_comm2)';

COMMENT ON COLUMN m_amenagement.an_amt_lot_stade.op_maj
    IS 'Opérateur de mise à jour';

COMMENT ON COLUMN m_amenagement.an_amt_lot_stade.maifon
    IS 'Maîtrise foncière du terrain';

COMMENT ON COLUMN m_amenagement.an_amt_lot_stade.etatoccup
    IS 'Etat d''occupation du terrain';

-- Trigger: t_t100_log
-- DROP TRIGGER t_t100_log ON m_amenagement.an_amt_lot_stade;

CREATE TRIGGER t_t100_log
    AFTER INSERT OR DELETE OR UPDATE 
    ON m_amenagement.an_amt_lot_stade
    FOR EACH ROW
    EXECUTE PROCEDURE m_activite_eco.ft_m_an_eco_log();

-- Trigger: t_t1_foncier_modif_geopic
-- DROP TRIGGER t_t1_foncier_modif_geopic ON m_amenagement.an_amt_lot_stade;

CREATE TRIGGER t_t1_foncier_modif_geopic
    AFTER INSERT OR UPDATE OF l_amng2, l_comm2
    ON m_amenagement.an_amt_lot_stade
    FOR EACH ROW
    EXECUTE PROCEDURE m_amenagement.ft_m_foncier_modif_geopic();

-- ################################################# Classe attributaires des associations d'appartenance d'un lot à 1 ou plusieurs sites : lk_amt_lot_site ##################################

CREATE TABLE m_amenagement.lk_amt_lot_site
(
    id integer NOT NULL DEFAULT nextval('m_amenagement.lk_amt_lot_site_seq'::regclass),
    idsite character varying(5) COLLATE pg_catalog."default" NOT NULL,
    idgeolf integer NOT NULL,
    CONSTRAINT lk_amt_lot_site_pkey PRIMARY KEY (id)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

COMMENT ON TABLE m_amenagement.lk_amt_lot_site
    IS 'Table alphanumérique d''appartenance des lots à un ou plusieurs sites';

COMMENT ON COLUMN m_amenagement.lk_amt_lot_site.id
    IS 'Identifiant unique non signifiant de la relation';

COMMENT ON COLUMN m_amenagement.lk_amt_lot_site.idsite
    IS 'Identifiant unique non signifiant de l''objet site';

COMMENT ON COLUMN m_amenagement.lk_amt_lot_site.idgeolf
    IS 'Identifiant unique non signifiant de l''objet lot';
    
-- Index: idx_8905_idsite
-- DROP INDEX m_amenagement.idx_8905_idsite;

CREATE INDEX idx_8905_idsite
    ON m_amenagement.lk_amt_lot_site USING btree
    (idsite COLLATE pg_catalog."default" ASC NULLS LAST)
    TABLESPACE pg_default;
    
-- Index: idx_9470_idgeolf
-- DROP INDEX m_amenagement.idx_9470_idgeolf;

CREATE INDEX idx_9470_idgeolf
    ON m_amenagement.lk_amt_lot_site USING btree
    (idgeolf ASC NULLS LAST)
    TABLESPACE pg_default;

-- Trigger: t_t100_log
-- DROP TRIGGER t_t100_log ON m_amenagement.lk_amt_lot_site;

CREATE TRIGGER t_t100_log
    AFTER INSERT OR DELETE OR UPDATE 
    ON m_amenagement.lk_amt_lot_site
    FOR EACH ROW
    EXECUTE PROCEDURE m_activite_eco.ft_m_an_eco_log();

-- ##########################################################################################################
-- ################################################# SCHEMA M_URBANISME_REG ##################################
-- ##########################################################################################################

-- ################################################# Classe attributaires des médias associés aux procédures : an_proc_media ##################################

CREATE TABLE m_urbanisme_reg.an_proc_media
(
    gid integer NOT NULL DEFAULT nextval('m_urbanisme_reg.an_proc_media_seq'::regclass),
    id text COLLATE pg_catalog."default",
    media text COLLATE pg_catalog."default",
    miniature bytea,
    n_fichier text COLLATE pg_catalog."default",
    t_fichier text COLLATE pg_catalog."default",
    op_sai character varying(20) COLLATE pg_catalog."default",
    date_sai timestamp without time zone,
    l_doc character varying(100) COLLATE pg_catalog."default",
    t_doc character varying(2) COLLATE pg_catalog."default" DEFAULT '00'::character varying,
    date_maj timestamp without time zone,
    op_maj character varying(20) COLLATE pg_catalog."default",
    CONSTRAINT an_proc_media_pkey PRIMARY KEY (gid),
    CONSTRAINT an_proc_media_t_doc_fkey FOREIGN KEY (t_doc)
        REFERENCES m_activite_eco.lt_eco_tdocmedia (code) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

COMMENT ON TABLE m_urbanisme_reg.an_proc_media
    IS 'Table gérant les documents intégrés pour la gestion des procédures d''aménagement';

COMMENT ON COLUMN m_urbanisme_reg.an_proc_media.gid
    IS 'Compteur (identifiant interne)';

COMMENT ON COLUMN m_urbanisme_reg.an_proc_media.id
    IS 'Identifiant interne non signifiant de l''objet saisi';

COMMENT ON COLUMN m_urbanisme_reg.an_proc_media.media
    IS 'Champ Média de GEO';

COMMENT ON COLUMN m_urbanisme_reg.an_proc_media.miniature
    IS 'Champ miniature de GEO';

COMMENT ON COLUMN m_urbanisme_reg.an_proc_media.n_fichier
    IS 'Nom du fichier';

COMMENT ON COLUMN m_urbanisme_reg.an_proc_media.t_fichier
    IS 'Type de média dans GEO';

COMMENT ON COLUMN m_urbanisme_reg.an_proc_media.op_sai
    IS 'Opérateur de saisie (par défaut login de connexion à GEO)';

COMMENT ON COLUMN m_urbanisme_reg.an_proc_media.date_sai
    IS 'Date de la saisie du document';

COMMENT ON COLUMN m_urbanisme_reg.an_proc_media.l_doc
    IS 'Titre du document ou légère description';

COMMENT ON COLUMN m_urbanisme_reg.an_proc_media.date_maj
    IS 'Date de mise à jour';

COMMENT ON COLUMN m_urbanisme_reg.an_proc_media.op_maj
    IS 'Opérateur de mise à jour';
    
-- Index: an_proc_media_gid_idx
-- DROP INDEX m_urbanisme_reg.an_proc_media_gid_idx;

CREATE INDEX an_proc_media_gid_idx
    ON m_urbanisme_reg.an_proc_media USING btree
    (gid ASC NULLS LAST)
    TABLESPACE pg_default;

-- Trigger: t_t100_log
-- DROP TRIGGER t_t100_log ON m_urbanisme_reg.an_proc_media;

CREATE TRIGGER t_t100_log
    AFTER INSERT OR DELETE OR UPDATE 
    ON m_urbanisme_reg.an_proc_media
    FOR EACH ROW
    EXECUTE PROCEDURE m_urbanisme_reg.ft_m_an_proced_log();

-- Trigger: t_t1_date_maj
-- DROP TRIGGER t_t1_date_maj ON m_urbanisme_reg.an_proc_media;

CREATE TRIGGER t_t1_date_maj
    BEFORE UPDATE 
    ON m_urbanisme_reg.an_proc_media
    FOR EACH ROW
    EXECUTE PROCEDURE public.ft_r_timestamp_maj();

-- ################################################# Classe attributaires des logs associés aux classes des procédures : an_proced_log ##################################

CREATE TABLE m_urbanisme_reg.an_proced_log
(
    idlog integer NOT NULL,
    tablename character varying(80) COLLATE pg_catalog."default" NOT NULL,
    type_ope text COLLATE pg_catalog."default" NOT NULL,
    dataold text COLLATE pg_catalog."default",
    datanew text COLLATE pg_catalog."default",
    date_maj timestamp without time zone DEFAULT now(),
    CONSTRAINT an_proced_log_pkey PRIMARY KEY (idlog)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

COMMENT ON TABLE m_urbanisme_reg.an_proced_log
    IS 'Table des opérations effectuées sur les données des procédures d''aménagement à l''insert, update et delete';

COMMENT ON COLUMN m_urbanisme_reg.an_proced_log.idlog
    IS 'Identifiant unique';

COMMENT ON COLUMN m_urbanisme_reg.an_proced_log.tablename
    IS 'Nom de la classe concernée par une opération';

COMMENT ON COLUMN m_urbanisme_reg.an_proced_log.type_ope
    IS 'Type d''opération';

COMMENT ON COLUMN m_urbanisme_reg.an_proced_log.dataold
    IS 'Anciennes données';

COMMENT ON COLUMN m_urbanisme_reg.an_proced_log.datanew
    IS 'Nouvelles données';

COMMENT ON COLUMN m_urbanisme_reg.an_proced_log.date_maj
    IS 'Date d''exécution de l''opération';

-- ################################################# Classe d'objets des procédures d'aménagement : geo_proced ##################################

CREATE TABLE m_urbanisme_reg.geo_proced
(
    idproc character varying(5) COLLATE pg_catalog."default" NOT NULL DEFAULT ('PR'::text || nextval('m_urbanisme_reg.geo_proc_seq'::regclass)),
    idsite character varying(10) COLLATE pg_catalog."default",
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
    sup_m2 double precision,
    existe boolean NOT NULL DEFAULT true,
    pr_fon_type character varying(2) COLLATE pg_catalog."default",
    ref_compta character varying(5) COLLATE pg_catalog."default",
    surf_cess_ha numeric(10,2),
    date_clo timestamp without time zone,
    nom_cp character varying(80) COLLATE pg_catalog."default",
    nb_log integer,
    nb_logind integer,
    nb_logindgr integer,
    nb_logcol integer,
    nb_logaide integer,
    nb_logaide_loc integer,
    nb_logaide_acc integer,
    op_sai character varying(80) COLLATE pg_catalog."default",
    op_maj character varying(80) COLLATE pg_catalog."default",
    date_sai timestamp without time zone,
    date_maj timestamp without time zone,
    src_geom character varying(2) COLLATE pg_catalog."default" DEFAULT '21'::character varying,
    epci character varying(10) COLLATE pg_catalog."default",
    observ character varying(1000) COLLATE pg_catalog."default",
    geom geometry(MultiPolygon,2154),
    geom1 geometry(MultiPolygon,2154),
    idgeopo bigint,
    nb_log_r integer,
    nb_logind_r integer,
    nb_logindgr_r integer,
    nb_logcol_r integer,
    nb_logaide_r integer,
    nb_logaide_loc_r integer,
    nb_logaide_acc_r integer,
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

COMMENT ON TABLE m_urbanisme_reg.geo_proced
    IS 'Classe d''objets contenant les données des procédures d''aménagement';

COMMENT ON COLUMN m_urbanisme_reg.geo_proced.idproc
    IS 'Identifiant non signifiant de la procédure';

COMMENT ON COLUMN m_urbanisme_reg.geo_proced.idsite
    IS 'Attributs à supprimer après migration nase eco';

COMMENT ON COLUMN m_urbanisme_reg.geo_proced.nom
    IS 'Libellé de l''opération';

COMMENT ON COLUMN m_urbanisme_reg.geo_proced.alias
    IS 'Alias du nom de l''opération';

COMMENT ON COLUMN m_urbanisme_reg.geo_proced.dest
    IS 'Code de la destination du Site (issu de la liste des valeurs du modèle CNIG sur les PLU)';

COMMENT ON COLUMN m_urbanisme_reg.geo_proced.z_proced
    IS 'Code de la procédure d''aménagement';

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

COMMENT ON COLUMN m_urbanisme_reg.geo_proced.surf_cess_ha
    IS 'Surface cessible programmée en ha';

COMMENT ON COLUMN m_urbanisme_reg.geo_proced.date_clo
    IS 'Date de cloture de l''opération';

COMMENT ON COLUMN m_urbanisme_reg.geo_proced.nom_cp
    IS 'Nom du chef de projet suivant la procédure';

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

COMMENT ON COLUMN m_urbanisme_reg.geo_proced.op_sai
    IS 'Libellé de la personne ayant saisie l''objet';

COMMENT ON COLUMN m_urbanisme_reg.geo_proced.date_sai
    IS 'Date de saisie des données attributaires';

COMMENT ON COLUMN m_urbanisme_reg.geo_proced.date_maj
    IS 'Date de mise à jour des données attributaires';

COMMENT ON COLUMN m_urbanisme_reg.geo_proced.epci
    IS 'Autorité compétente';

COMMENT ON COLUMN m_urbanisme_reg.geo_proced.observ
    IS 'Observations diverses';

COMMENT ON COLUMN m_urbanisme_reg.geo_proced.geom
    IS 'Géométrie des objets';

COMMENT ON COLUMN m_urbanisme_reg.geo_proced.nb_log_r
    IS 'Nombre de logements réalisés';

COMMENT ON COLUMN m_urbanisme_reg.geo_proced.nb_logind_r
    IS 'Nombre de logements réalisés en individuel';

COMMENT ON COLUMN m_urbanisme_reg.geo_proced.nb_logindgr_r
    IS 'Nombre de logements réalisés en individuel groupé';

COMMENT ON COLUMN m_urbanisme_reg.geo_proced.nb_logcol_r
    IS 'Nombre de logements réalisé en collectif';

COMMENT ON COLUMN m_urbanisme_reg.geo_proced.nb_logaide_r
    IS 'Nombre de logements réalisé aidé';

COMMENT ON COLUMN m_urbanisme_reg.geo_proced.nb_logaide_loc_r
    IS 'Nombre de logements réalisé aidé en location';

COMMENT ON COLUMN m_urbanisme_reg.geo_proced.nb_logaide_acc_r
    IS 'Nombre de logements réalisés en accession';
    
-- Index: geo_proced_geom_idx
-- DROP INDEX m_urbanisme_reg.geo_proced_geom_idx;

CREATE INDEX geo_proced_geom_idx
    ON m_urbanisme_reg.geo_proced USING gist
    (geom)
    TABLESPACE pg_default;
    
-- Index: geo_proced_idproc_idx
-- DROP INDEX m_urbanisme_reg.geo_proced_idproc_idx;

CREATE INDEX geo_proced_idproc_idx
    ON m_urbanisme_reg.geo_proced USING btree
    (idproc COLLATE pg_catalog."default" ASC NULLS LAST)
    TABLESPACE pg_default;

-- Trigger: t_t100_log
-- DROP TRIGGER t_t100_log ON m_urbanisme_reg.geo_proced;

CREATE TRIGGER t_t100_log
    AFTER INSERT OR DELETE OR UPDATE 
    ON m_urbanisme_reg.geo_proced
    FOR EACH ROW
    EXECUTE PROCEDURE m_urbanisme_reg.ft_m_an_proced_log();

-- Trigger: t_t1_date_sai
-- DROP TRIGGER t_t1_date_sai ON m_urbanisme_reg.geo_proced;

CREATE TRIGGER t_t1_date_sai
    BEFORE INSERT
    ON m_urbanisme_reg.geo_proced
    FOR EACH ROW
    EXECUTE PROCEDURE public.ft_r_timestamp_sai();

-- Trigger: t_t2_date_maj
-- DROP TRIGGER t_t2_date_maj ON m_urbanisme_reg.geo_proced;

CREATE TRIGGER t_t2_date_maj
    BEFORE INSERT OR UPDATE 
    ON m_urbanisme_reg.geo_proced
    FOR EACH ROW
    EXECUTE PROCEDURE public.ft_r_timestamp_maj();

-- Trigger: t_t3_surf_epci
-- DROP TRIGGER t_t3_surf_epci ON m_urbanisme_reg.geo_proced;

CREATE TRIGGER t_t3_surf_epci
    BEFORE INSERT OR UPDATE 
    ON m_urbanisme_reg.geo_proced
    FOR EACH ROW
    EXECUTE PROCEDURE m_urbanisme_reg.ft_m_proc_surf_epci();

-- Trigger: t_t4_secu_geom_sb_epci
-- DROP TRIGGER t_t4_secu_geom_sb_epci ON m_urbanisme_reg.geo_proced;

CREATE TRIGGER t_t4_secu_geom_sb_epci
    BEFORE INSERT OR UPDATE OF geom
    ON m_urbanisme_reg.geo_proced
    FOR EACH ROW
    EXECUTE PROCEDURE public.ft_m_secu_geom_sb_epci();

-- ##########################################################################################################
-- ################################################# SCHEMA R_OBJET ##################################
-- ##########################################################################################################

-- ################################################# Classe d'objets des lots fonciers : geo_objet_fon_lot ##################################
-- Table: r_objet.geo_objet_fon_lot

-- DROP TABLE r_objet.geo_objet_fon_lot;

CREATE TABLE r_objet.geo_objet_fon_lot
(
    idgeolf integer NOT NULL DEFAULT nextval('r_objet.idgeo_seq'::regclass),
    op_sai character varying(80) COLLATE pg_catalog."default",
    src_geom character varying(2) COLLATE pg_catalog."default" DEFAULT '00'::character varying,
    sup_m2 double precision,
    l_voca character varying(2) COLLATE pg_catalog."default" DEFAULT '00'::character varying,
    geom geometry(MultiPolygon,2154) NOT NULL,
    date_sai timestamp without time zone,
    date_maj timestamp without time zone,
    l_nom character varying(80) COLLATE pg_catalog."default",
    op_maj character varying(80) COLLATE pg_catalog."default",
    insee character varying(5) COLLATE pg_catalog."default",
    commune character varying(80) COLLATE pg_catalog."default",
    epci character varying(10) COLLATE pg_catalog."default",
    surf integer,
    surf_l character varying(15) COLLATE pg_catalog."default",
    CONSTRAINT geo_objet_fon_lot_pkey PRIMARY KEY (idgeolf),
    CONSTRAINT geo_objet_fon_lot_scrgeom_fkey FOREIGN KEY (src_geom)
        REFERENCES r_objet.lt_src_geom (code) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT lt_objet_vocafon_fkey FOREIGN KEY (l_voca)
        REFERENCES r_objet.lt_objet_vocafon (code) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;


COMMENT ON TABLE r_objet.geo_objet_fon_lot
    IS 'Données géographiques contenant les lots fonciers des sites';

COMMENT ON COLUMN r_objet.geo_objet_fon_lot.idgeolf
    IS 'Identifiant unique de l''objet';

COMMENT ON COLUMN r_objet.geo_objet_fon_lot.op_sai
    IS 'Opérateur de saisir d''objet à l''ARC';

COMMENT ON COLUMN r_objet.geo_objet_fon_lot.src_geom
    IS 'Référentiel spatial de saisie';

COMMENT ON COLUMN r_objet.geo_objet_fon_lot.sup_m2
    IS 'Surface totale de l''objet en m²';

COMMENT ON COLUMN r_objet.geo_objet_fon_lot.l_voca
    IS 'Vocation du foncier';

COMMENT ON COLUMN r_objet.geo_objet_fon_lot.geom
    IS 'Champ contenant la géométrie';

COMMENT ON COLUMN r_objet.geo_objet_fon_lot.date_sai
    IS 'Date de saisie de l''objet';

COMMENT ON COLUMN r_objet.geo_objet_fon_lot.date_maj
    IS 'Date de mise à jour';

COMMENT ON COLUMN r_objet.geo_objet_fon_lot.l_nom
    IS 'Nom de lot donné au moment du plan d''aménagement (ex : lot 1)';

COMMENT ON COLUMN r_objet.geo_objet_fon_lot.op_maj
    IS 'Opérateur de mise à jour';

COMMENT ON COLUMN r_objet.geo_objet_fon_lot.insee
    IS 'Code insee de la commune';

COMMENT ON COLUMN r_objet.geo_objet_fon_lot.commune
    IS 'Libellé de la commune';

COMMENT ON COLUMN r_objet.geo_objet_fon_lot.epci
    IS 'Autorité compétente';

COMMENT ON COLUMN r_objet.geo_objet_fon_lot.surf
    IS 'Surface occupée du lot en m² (surface saisie par l''utilisateur si différente de la surface SIG)';

COMMENT ON COLUMN r_objet.geo_objet_fon_lot.surf_l
    IS 'Surface littérale occupée du lot en m² (surface saisie par l''utilisateur si différente de la surface SIG)';



-- Index: geo_objet_fon_lot_idgeolf_idx
-- DROP INDEX r_objet.geo_objet_fon_lot_idgeolf_idx;

CREATE INDEX geo_objet_fon_lot_idgeolf_idx
    ON r_objet.geo_objet_fon_lot USING btree
    (idgeolf ASC NULLS LAST)
    TABLESPACE pg_default;

-- Index: geo_objet_fon_lot_geom_idx
-- DROP INDEX r_objet.geo_objet_fon_lot_geom_idx;

CREATE INDEX geo_objet_fon_lot_geom_idx
    ON r_objet.geo_objet_fon_lot USING gist
    (geom)
    TABLESPACE pg_default;

-- Trigger: t_t0_secu_geom_epci
-- DROP TRIGGER t_t0_secu_geom_epci ON r_objet.geo_objet_fon_lot;

CREATE TRIGGER t_t0_secu_geom_epci
    BEFORE INSERT OR UPDATE OF geom
    ON r_objet.geo_objet_fon_lot
    FOR EACH ROW
    EXECUTE PROCEDURE public.ft_m_secu_geom_sb_epci();

-- Trigger: t_t100_log
-- DROP TRIGGER t_t100_log ON r_objet.geo_objet_fon_lot;

CREATE TRIGGER t_t100_log
    AFTER INSERT OR DELETE OR UPDATE 
    ON r_objet.geo_objet_fon_lot
    FOR EACH ROW
    EXECUTE PROCEDURE m_activite_eco.ft_m_an_eco_log();

-- Trigger: t_t11_delete_objet_fon
-- DROP TRIGGER t_t11_delete_objet_fon ON r_objet.geo_objet_fon_lot;

CREATE TRIGGER t_t11_delete_objet_fon
    AFTER DELETE
    ON r_objet.geo_objet_fon_lot
    FOR EACH ROW
    EXECUTE PROCEDURE r_objet.ft_m_delete_objet_fon();

-- Trigger: t_t12_refresh_view
-- DROP TRIGGER t_t12_refresh_view ON r_objet.geo_objet_fon_lot;

CREATE TRIGGER t_t12_refresh_view
    AFTER INSERT OR DELETE OR UPDATE OF geom
    ON r_objet.geo_objet_fon_lot
    FOR EACH ROW
    EXECUTE PROCEDURE m_activite_eco.ft_m_refresh_view_bati_act();

-- Trigger: t_t1_etab_insert_date_sai
-- DROP TRIGGER t_t1_etab_insert_date_sai ON r_objet.geo_objet_fon_lot;

CREATE TRIGGER t_t1_etab_insert_date_sai
    BEFORE INSERT
    ON r_objet.geo_objet_fon_lot
    FOR EACH ROW
    EXECUTE PROCEDURE public.ft_r_timestamp_sai();

-- Trigger: t_t2_foncier_insert_date_maj
-- DROP TRIGGER t_t2_foncier_insert_date_maj ON r_objet.geo_objet_fon_lot;

CREATE TRIGGER t_t2_foncier_insert_date_maj
    BEFORE UPDATE 
    ON r_objet.geo_objet_fon_lot
    FOR EACH ROW
    EXECUTE PROCEDURE public.ft_r_timestamp_maj();

-- Trigger: t_t3_foncier_insert_surf
-- DROP TRIGGER t_t3_foncier_insert_surf ON r_objet.geo_objet_fon_lot;

CREATE TRIGGER t_t3_foncier_insert_surf
    BEFORE INSERT OR UPDATE OF geom
    ON r_objet.geo_objet_fon_lot
    FOR EACH ROW
    EXECUTE PROCEDURE public.ft_r_sup_m2_maj();

-- Trigger: t_t4_foncier_l_nom
-- DROP TRIGGER t_t4_foncier_l_nom ON r_objet.geo_objet_fon_lot;

CREATE TRIGGER t_t4_foncier_l_nom
    BEFORE INSERT OR UPDATE OF l_nom
    ON r_objet.geo_objet_fon_lot
    FOR EACH ROW
    EXECUTE PROCEDURE r_objet.ft_m_foncier_l_nom();

-- Trigger: t_t5_insee_commune
-- DROP TRIGGER t_t5_insee_commune ON r_objet.geo_objet_fon_lot;

CREATE TRIGGER t_t5_insee_commune
    BEFORE INSERT OR UPDATE OF geom
    ON r_objet.geo_objet_fon_lot
    FOR EACH ROW
    EXECUTE PROCEDURE public.ft_r_commune_c();

-- Trigger: t_t6_insert_update_objet_fon_surf_l
-- DROP TRIGGER t_t6_insert_update_objet_fon_surf_l ON r_objet.geo_objet_fon_lot;

CREATE TRIGGER t_t6_insert_update_objet_fon_surf_l
    BEFORE INSERT OR UPDATE OF geom, surf
    ON r_objet.geo_objet_fon_lot
    FOR EACH ROW
    EXECUTE PROCEDURE r_objet.ft_m_insert_update_surf_l();

-- Trigger: t_t7_insert_objet_fon
-- DROP TRIGGER t_t7_insert_objet_fon ON r_objet.geo_objet_fon_lot;

CREATE TRIGGER t_t7_insert_objet_fon
    BEFORE INSERT
    ON r_objet.geo_objet_fon_lot
    FOR EACH ROW
    EXECUTE PROCEDURE r_objet.ft_m_insert_update_objet_fon();

-- Trigger: t_t9_autorite_competente
-- DROP TRIGGER t_t9_autorite_competente ON r_objet.geo_objet_fon_lot;

CREATE TRIGGER t_t9_autorite_competente
    BEFORE INSERT OR UPDATE OF geom
    ON r_objet.geo_objet_fon_lot
    FOR EACH ROW
    EXECUTE PROCEDURE public.ft_r_autorite_competente();




