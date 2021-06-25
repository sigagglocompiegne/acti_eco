/*Amt_fon_Eco V1.0*/
/*Creation des vues de gestion stockées dans le schéma contenant les tables */
/* afe_60_vues_gestion.sql */
/*PostGIS*/

/* Propriétaire : GeoCompiegnois - http://geo.compiegnois.fr/ */
/* Auteur : Grégory Bodet */



-- ####################################################################################################################################################
-- ###                                                                                                                                              ###
-- ###                                                              VUES DE GESTION                                                                 ###
-- ###                                                                                                                                              ###
-- ####################################################################################################################################################

-- ########################################################### SCHEMA r_objet #########################

-- ########################################################### Vue de gestion des espaces publics #########################

-- View: r_objet.geo_v_empesp_pu

-- DROP VIEW r_objet.geo_v_empesp_pu;

CREATE OR REPLACE VIEW r_objet.geo_v_empesp_pu AS 
 SELECT o.idgeopu,
    o.op_sai,
    o.src_geom AS ref_spa,
    o.sup_m2,
    o.date_sai,
    o.date_maj,
    ep.idsite,
    ep.date_sai AS date_sai_att,
    ep.date_maj AS date_maj_att,
    ep.date_int,
    ep.op_sai AS op_sai_att,
    ep.org_sai AS org_sai_att,
    ep.vocaep,
    o.geom
   FROM m_amenagement.an_amt_esppu ep,
    r_objet.geo_objet_empesp_pu o
  WHERE ep.idgeopu = o.idgeopu;

ALTER TABLE r_objet.geo_v_empesp_pu
  OWNER TO sig_create;

COMMENT ON VIEW r_objet.geo_v_empesp_pu
  IS 'Vue éditable des emprises des espaces publics sur les sites';

-- Function: r_objet.ft_m_empesppu_delete()

-- DROP FUNCTION r_objet.ft_m_empesppu_delete();

CREATE OR REPLACE FUNCTION r_objet.ft_m_empesppu_delete()
  RETURNS trigger AS
$BODY$

BEGIN
    DELETE FROM m_amenagement.an_amt_esppu WHERE idgeopu=old.idgeopu;
    DELETE FROM r_objet.geo_objet_empesp_pu WHERE idgeopu=old.idgeopu;
    return new ;
END;

$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
ALTER FUNCTION r_objet.ft_m_empesppu_delete()
  OWNER TO sig_create;



-- Function: r_objet.ft_m_empesppu_insert()

-- DROP FUNCTION r_objet.ft_m_empesppu_insert();

CREATE OR REPLACE FUNCTION r_objet.ft_m_empesppu_insert()
  RETURNS trigger AS
$BODY$

DECLARE v_idgeopu integer;

BEGIN

    v_idgeopu := (SELECT nextval('idgeo_seq'::regclass));

    INSERT INTO r_objet.geo_objet_empesp_pu SELECT v_idgeopu,new.op_sai,new.ref_spa,null,new.geom,null,null;

    INSERT INTO m_amenagement.an_amt_esppu SELECT v_idgeopu,
						 	(
							SELECT DISTINCT
								idsite 
							FROM 
								r_objet.geo_objet_ope
							WHERE
								st_intersects(geo_objet_ope.geom,st_pointonsurface(new.geom)) = true
								
							), -- recherche auto de l'IDSITE
							(
							SELECT DISTINCT
								geo_sa_pole.idpole 
							FROM 
								m_economie.geo_sa_pole
							WHERE
								st_intersects(geo_sa_pole.geom,st_pointonsurface(new.geom)) = true
								
							), -- recherche auto de l'IDPOLE
							null,
							new.op_sai_att,
							new.org_sai_att,
							new.vocaep,
							now(),
							now()
						  ;	

    return new ;
END;

$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
ALTER FUNCTION r_objet.ft_m_empesppu_insert()
  OWNER TO sig_create;



-- Trigger: delete_empesp_pu on r_objet.geo_v_empesp_pu

-- DROP TRIGGER delete_empesp_pu ON r_objet.geo_v_empesp_pu;

CREATE TRIGGER t_t1_delete_empesp_pu
  INSTEAD OF DELETE
  ON r_objet.geo_v_empesp_pu
  FOR EACH ROW
  EXECUTE PROCEDURE r_objet.ft_m_empesppu_insert();

-- Function: r_objet.ft_m_empesppu_insert()

-- DROP FUNCTION r_objet.ft_m_empesppu_insert();

CREATE OR REPLACE FUNCTION r_objet.ft_m_empesppu_insert()
  RETURNS trigger AS
$BODY$

DECLARE v_idgeopu integer;

BEGIN

    v_idgeopu := (SELECT nextval('idgeo_seq'::regclass));

    INSERT INTO r_objet.geo_objet_empesp_pu SELECT v_idgeopu,new.op_sai,new.ref_spa,null,new.geom,null,null;

    INSERT INTO m_amenagement.an_amt_esppu SELECT v_idgeopu,
						 	(
							SELECT DISTINCT
								idsite 
							FROM 
								r_objet.geo_objet_ope
							WHERE
								st_intersects(geo_objet_ope.geom,st_pointonsurface(new.geom)) = true
								
							), -- recherche auto de l'IDSITE
							(
							SELECT DISTINCT
								geo_sa_pole.idpole 
							FROM 
								m_economie.geo_sa_pole
							WHERE
								st_intersects(geo_sa_pole.geom,st_pointonsurface(new.geom)) = true
								
							), -- recherche auto de l'IDPOLE
							null,
							new.op_sai_att,
							new.org_sai_att,
							new.vocaep,
							now(),
							now()
						  ;	

    return new ;
END;

$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
ALTER FUNCTION r_objet.ft_m_empesppu_insert()
  OWNER TO sig_create;

									      
-- Trigger: insert_empesp_pu on r_objet.geo_v_empesp_pu

-- DROP TRIGGER insert_empesp_pu ON r_objet.geo_v_empesp_pu;

CREATE TRIGGER t_t2_insert_empesp_pu
  INSTEAD OF INSERT
  ON r_objet.geo_v_empesp_pu
  FOR EACH ROW
  EXECUTE PROCEDURE r_objet.ft_m_empesppu_insert();
									      
-- Function: r_objet.ft_m_empesp_pu_update()

-- DROP FUNCTION r_objet.ft_m_empesp_pu_update();

CREATE OR REPLACE FUNCTION r_objet.ft_m_empesp_pu_update()
  RETURNS trigger AS
$BODY$

BEGIN

 
	UPDATE r_objet.geo_objet_empesp_pu SET geom = new.geom, date_maj = now(), src_geom=new.ref_spa, op_sai=new.op_sai,sup_m2=round(cast(st_area(new.geom) as numeric),0) WHERE idgeopu = new.idgeopu;

	UPDATE m_amenagement.an_amt_esppu SET
							idsite=new.idsite,
							date_maj = now(),
							op_sai = new.op_sai_att,
							org_sai = new.org_sai_att,
							vocaep = new.vocaep
	WHERE an_amt_esppu.idgeopu=new.idgeopu;

	return new;
END
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
ALTER FUNCTION r_objet.ft_m_empesp_pu_update()
  OWNER TO sig_create;

									      
-- Trigger: update_empesp_pu on r_objet.geo_v_empesp_pu

-- DROP TRIGGER update_empesp_pu ON r_objet.geo_v_empesp_pu;

CREATE TRIGGER t_t3_update_empesp_pu
  INSTEAD OF UPDATE
  ON r_objet.geo_v_empesp_pu
  FOR EACH ROW
  EXECUTE PROCEDURE r_objet.ft_m_empesp_pu_update();

									      
-- ########################################################### Vue de gestion des lots #########################

-- View: r_objet.geo_v_lot

-- DROP VIEW r_objet.geo_v_lot;

CREATE OR REPLACE VIEW r_objet.geo_v_lot AS 
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
  OWNER TO sig_create;

COMMENT ON VIEW r_objet.geo_v_lot
  IS 'Vue éditable des lots fonciers (toutes vocations) uniquement pour l''administration SIG';
									      
									      
									      
-- Trigger: t_t1_foncier_delete on r_objet.geo_v_lot

-- DROP TRIGGER t_t1_foncier_delete ON r_objet.geo_v_lot;

CREATE TRIGGER t_t1_foncier_delete
  INSTEAD OF DELETE
  ON r_objet.geo_v_lot
  FOR EACH ROW
  EXECUTE PROCEDURE r_objet.ft_m_foncier_delete();
									      
-- Function: r_objet.ft_m_foncier_delete()

-- DROP FUNCTION r_objet.ft_m_foncier_delete();

CREATE OR REPLACE FUNCTION r_objet.ft_m_foncier_delete()
  RETURNS trigger AS
$BODY$

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

    return new ;
END;

$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
ALTER FUNCTION r_objet.ft_m_foncier_delete()
  OWNER TO sig_create;

COMMENT ON FUNCTION r_objet.ft_m_foncier_delete() IS 'Fonction gérant la suppression des informations des lots toutes vocations si suppression de l''objet';
							      
									      
									      
								      
									      
-- Trigger: t_t2_foncier_insert on r_objet.geo_v_lot

-- DROP TRIGGER t_t2_foncier_insert ON r_objet.geo_v_lot;

CREATE TRIGGER t_t2_foncier_insert
  INSTEAD OF INSERT
  ON r_objet.geo_v_lot
  FOR EACH ROW
  EXECUTE PROCEDURE r_objet.ft_m_foncier_insert();

-- FUNCTION: r_objet.ft_m_foncier_insert()

-- DROP FUNCTION r_objet.ft_m_foncier_insert();

CREATE FUNCTION r_objet.ft_m_foncier_insert()
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

						INSERT INTO m_economie.an_sa_lot SELECT v_idgeolf,
						 
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
			 
						 
-- Trigger: t_t3_foncier_update on r_objet.geo_v_lot

-- DROP TRIGGER t_t3_foncier_update ON r_objet.geo_v_lot;

CREATE TRIGGER t_t3_foncier_update
  INSTEAD OF UPDATE
  ON r_objet.geo_v_lot
  FOR EACH ROW
  EXECUTE PROCEDURE r_objet.ft_m_foncier_update();

						 -- Function: r_objet.ft_m_foncier_update()

-- DROP FUNCTION r_objet.ft_m_foncier_update();

CREATE OR REPLACE FUNCTION r_objet.ft_m_foncier_update()
  RETURNS trigger AS
$BODY$

DECLARE lot_surf integer;

BEGIN

   UPDATE r_objet.geo_objet_fon_lot SET geom = new.geom, date_maj = now(), src_geom = new.ref_spa, op_sai=new.op_sai, l_voca = new.l_voca, l_nom = new.l_nom WHERE idgeolf = new.idgeolf; 

   UPDATE m_amenagement.an_amt_lot_stade SET stade_amng = new.stade_amng, l_amng2 = new.l_amng2, stade_comm = new.stade_comm, l_comm2 = new.l_comm2, l_comm2_12 = new.l_comm2_12, etat_occup =  new.etat_occup WHERE idgeolf = new.idgeolf;

/* ******************************************* */
/* GESTION DES LOTS MUTANTS DE NON DEFINI VERS */
/* ******************************************* */

    -- si ma vocation foncière passe de non définie à équipement, insertion d'une ligne dans la table métier
    if old.l_voca='00' and new.l_voca='10' then
	lot_surf:=round(cast(st_area(new.geom) as numeric),0);
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
	lot_surf:=round(cast(st_area(new.geom) as numeric),0);

	INSERT INTO m_economie.an_sa_lot SELECT new.idgeolf,
						 
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
        lot_surf:=round(cast(st_area(new.geom) as numeric),0);
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
	lot_surf:=round(cast(st_area(new.geom) as numeric),0);
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
        lot_surf:=round(cast(st_area(new.geom) as numeric),0);
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
	lot_surf:=round(cast(st_area(new.geom) as numeric),0);
	DELETE FROM m_amenagement.an_amt_lot_equ WHERE idgeolf=old.idgeolf;

	INSERT INTO m_economie.an_sa_lot SELECT new.idgeolf,
						 
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
	lot_surf:=round(cast(st_area(new.geom) as numeric),0);
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
	lot_surf:=round(cast(st_area(new.geom) as numeric),0);
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
	lot_surf:=round(cast(st_area(new.geom) as numeric),0);
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
	DELETE FROM m_economie.an_sa_lot WHERE idgeolf=old.idgeolf;
    end if;

    -- si ma vocation foncière passe d'économie à équipements, suppression de la ligne dans la table métier économie et insertion dans équipement
    if old.l_voca='20' and new.l_voca='10' then
	lot_surf:=round(cast(st_area(new.geom) as numeric),0);
	DELETE FROM m_economie.an_sa_lot WHERE idgeolf=old.idgeolf;

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
	lot_surf:=round(cast(st_area(new.geom) as numeric),0);
	DELETE FROM m_economie.an_sa_lot WHERE idgeolf=old.idgeolf;
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
	lot_surf:=round(cast(st_area(new.geom) as numeric),0);
	DELETE FROM m_economie.an_sa_lot WHERE idgeolf=old.idgeolf;

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
	DELETE FROM m_economie.an_sa_lot WHERE idgeolf=old.idgeolf;
    end if;
    
-- si ma vocation foncière passe d'économie à mixte, suppression de la ligne dans la table métier économie et insertion dans mixte
    
    if (old.l_voca='20') and (new.l_voca='60') then
	lot_surf:=round(cast(st_area(new.geom) as numeric),0);
	DELETE FROM m_economie.an_sa_lot WHERE idgeolf=old.idgeolf;
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
	lot_surf:=round(cast(st_area(new.geom) as numeric),0);
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
	lot_surf:=round(cast(st_area(new.geom) as numeric),0);
	DELETE FROM m_amenagement.an_amt_lot_hab WHERE idgeolf=old.idgeolf;
	INSERT INTO m_economie.an_sa_lot SELECT new.idgeolf,
						 
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
	lot_surf:=round(cast(st_area(new.geom) as numeric),0);
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
	lot_surf:=round(cast(st_area(new.geom) as numeric),0);
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
	lot_surf:=round(cast(st_area(new.geom) as numeric),0);
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
	lot_surf:=round(cast(st_area(new.geom) as numeric),0);
	DELETE FROM m_amenagement.an_amt_lot_divers WHERE idgeolf=old.idgeolf;
	INSERT INTO m_economie.an_sa_lot SELECT new.idgeolf,
						 
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
	lot_surf:=round(cast(st_area(new.geom) as numeric),0);
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
	lot_surf:=round(cast(st_area(new.geom) as numeric),0);
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
	lot_surf:=round(cast(st_area(new.geom) as numeric),0);
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
	lot_surf:=round(cast(st_area(new.geom) as numeric),0);
	INSERT INTO m_economie.an_sa_lot SELECT new.idgeolf,
						 
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
	lot_surf:=round(cast(st_area(new.geom) as numeric),0);
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
	lot_surf:=round(cast(st_area(new.geom) as numeric),0);
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
	lot_surf:=round(cast(st_area(new.geom) as numeric),0);
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
	lot_surf:=round(cast(st_area(new.geom) as numeric),0);
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
	lot_surf:=round(cast(st_area(new.geom) as numeric),0);
	DELETE FROM m_amenagement.an_amt_lot_mixte WHERE idgeolf=old.idgeolf;
	INSERT INTO m_economie.an_sa_lot SELECT new.idgeolf,
						 
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
	lot_surf:=round(cast(st_area(new.geom) as numeric),0);
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
	lot_surf:=round(cast(st_area(new.geom) as numeric),0);
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

	-- mise à jour des appartenances des établissements à l'adresse dans la table lk_localsiret
	-- si le lot ne contient pas d'adresse, ne supprime pas les relations du lot avec les établissements si non oui 
	IF 
		(SELECT count(*) FROM r_objet.geo_objet_fon_lot l , x_apps.xapps_geo_vmr_adresse a , m_economie.lk_adresseetablissement lk
		WHERE st_intersects(new.geom,a.geom) AND new.l_voca='20' AND a.id_adresse = lk.idadresse AND l.idgeolf = new.idgeolf) = 0
	THEN
		INSERT INTO m_economie.lk_localsiret (idgeoloc,siret)
		SELECT DISTINCT new.idgeolf,lk.siret FROM r_objet.geo_objet_fon_lot l , x_apps.xapps_geo_vmr_adresse a , m_economie.lk_adresseetablissement lk
		WHERE st_intersects(new.geom,a.geom) AND new.l_voca='20' AND a.id_adresse = lk.idadresse;
        ELSE
		DELETE FROM m_economie.lk_localsiret lk WHERE lk.idgeoloc = old.idgeolf;
		INSERT INTO m_economie.lk_localsiret (idgeoloc,siret)
		SELECT DISTINCT new.idgeolf,lk.siret FROM r_objet.geo_objet_fon_lot l , x_apps.xapps_geo_vmr_adresse a , m_economie.lk_adresseetablissement lk
		WHERE st_intersects(new.geom,a.geom) AND new.l_voca='20' AND a.id_adresse = lk.idadresse;
	END IF;

    return new ;
END;

$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
ALTER FUNCTION r_objet.ft_m_foncier_update()
  OWNER TO sig_create;

COMMENT ON FUNCTION r_objet.ft_m_foncier_update() IS 'Fonction gérant la mise à jour des informations des lots en fonction de leur vocation à la modification de la vocation des objets';

										     
-- Trigger: t_t5_etiquette_local_refresh on r_objet.geo_v_lot

-- DROP TRIGGER t_t5_etiquette_local_refresh ON r_objet.geo_v_lot;

CREATE TRIGGER t_t5_etiquette_local_refresh
  INSTEAD OF INSERT OR UPDATE OR DELETE
  ON r_objet.geo_v_lot
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


										     
-- ########################################################### Vue de gestion des procédures d'aménagements #########################
								       
-- View: r_objet.geo_v_proc

-- DROP VIEW r_objet.geo_v_proc;

CREATE OR REPLACE VIEW r_objet.geo_v_proc AS 
 SELECT o.idgeopo,
    o.idsite,
    o.op_sai AS op_sai_obj,
    o.src_geom AS ref_spa,
    o.sup_m2,
    o.proced,
    o.destdomi,
    o.date_sai AS date_sai_obj,
    o.date_maj AS date_maj_obj,
    so.l_ope_nom,
    so.l_ope_alias,
    so.dest,
    so.z_proced,
    so.date_sai,
    so.date_maj,
    so.op_sai,
    so.l_ope_phase,
    so.l_ope_moa,
    so.l_conso_type,
    so.l_pr_urb,
    so.date_crea,
    so.l_pr_fon,
    so.l_pr_fon_date,
    so.l_surf_ha,
    so.l_existe,
    so.l_pr_fon_type,
    so.l_ref_compta,
    so.l_observ,
    o.geom
   FROM r_objet.geo_objet_ope o
     LEFT JOIN m_urbanisme_reg.an_proced so ON o.idgeopo = so.idgeopo;

ALTER TABLE r_objet.geo_v_proc
  OWNER TO sig_create;

COMMENT ON VIEW r_objet.geo_v_proc
  IS 'Vue éditable des procédures d''aménagement pour la saisie des objets et des attributs';

	
-- Function: r_objet.ft_m_delete_proc()

-- DROP FUNCTION r_objet.ft_m_delete_proc();

CREATE OR REPLACE FUNCTION r_objet.ft_m_delete_proc()
  RETURNS trigger AS
$BODY$


BEGIN

      if (select count(*) FROM r_objet.geo_objet_ope WHERE idsite=old.idsite) = 1 THEN
    DELETE FROM m_economie.an_sa_site WHERE idsite=old.idsite;
    DELETE FROM m_urbanisme_reg.an_proced WHERE idsite=old.idsite;
    DELETE FROM m_amenagement.an_amt_site_mixte WHERE idsite=old.idsite;
    DELETE FROM m_amenagement.an_amt_site_habitat WHERE idsite=old.idsite;
    DELETE FROM m_amenagement.an_amt_site_equ WHERE idsite=old.idsite;
    end if;
    if (select count(*) FROM r_objet.geo_objet_ope WHERE idsite=old.idsite) > 1 THEN
    DELETE FROM m_urbanisme_reg.an_proced WHERE idgeopo=old.idgeopo;
    end if;

    DELETE FROM r_objet.geo_objet_ope WHERE idgeopo=old.idgeopo;

    return old ;
END;

$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
ALTER FUNCTION r_objet.ft_m_delete_proc()
  OWNER TO sig_create;
										     
										     
-- Trigger: t_t1_delete_proc on r_objet.geo_v_proc

-- DROP TRIGGER t_t1_delete_proc ON r_objet.geo_v_proc;

CREATE TRIGGER t_t1_delete_proc
  INSTEAD OF DELETE
  ON r_objet.geo_v_proc
  FOR EACH ROW
  EXECUTE PROCEDURE r_objet.ft_m_delete_proc();

										     
-- FUNCTION: r_objet.ft_m_insert_proc()

-- DROP FUNCTION r_objet.ft_m_insert_proc();

CREATE FUNCTION r_objet.ft_m_insert_proc()
    RETURNS trigger
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE NOT LEAKPROOF
AS $BODY$

DECLARE v_idgeopo integer;

BEGIN

     v_idgeopo := (SELECT nextval('idgeo_seq'::regclass));

     INSERT INTO r_objet.geo_objet_ope SELECT v_idgeopo, new.idsite,new.op_sai_obj,new.ref_spa,round(cast(st_area(new.geom) as numeric),0),new.proced,new.destdomi,new.geom,now(),now();
     

     -- gérer l'insertion ici dans la table métier si proced=true ou proced=false
    -- insertion dans la tablé métier HABITAT et PROCED (avec insert ci-dessus)
    if 
	new.proced=true and new.destdomi='01' 
    and
	(select count(*) from m_urbanisme_reg.an_proced where idsite=new.idsite) = 0
    and
        (select count(*) from m_amenagement.an_amt_site_habitat where idsite=new.idsite) = 0
    then

	-- revoir l'ordre ici en fonction des mouvements de structure entre les 2 bases (test et prod)
	INSERT INTO m_urbanisme_reg.an_proced SELECT v_idgeopo,
						     new.idsite,
						     new.l_ope_nom,--l_ope_nom
						     new.l_ope_alias,-- l_ope_alias
						     new.dest,-- dest
						     new.z_proced,--z_proced
						     new.op_sai,--op_sai
						     new.l_ope_phase,--l_ope_phase
						     new.l_ope_moa,--l_ope_moa
						     new.l_conso_type,--l_conso_type
						     new.l_pr_urb,--l_pr_urb
						     new.date_crea,--date_crea
						     new.l_pr_fon,--l_pr_fon
						     new.l_pr_fon_date,--l_pr_fon_date
						     round(cast(st_area(new.geom)/10000 as numeric),2), -- l_surf_ha
						     new.l_existe,--l_existe
						     new.l_pr_fon_type,--l_pr_fon_type
						     new.l_ref_compta,--l_ref_compta
						     new.l_observ,--l_observ
						     now(),--date_sai
						     now(),--date_maj
						     null, -- surface cessible en ha
						     null, -- date cloture de l'opération
						     null, -- nb de logements programmés
						     null, -- nb de logements individuels programmés
						     null, -- nb de logements individuels groupés programmés
						     null, -- nb de logemebts collectifs programmés
						     null, -- Nombre total de logements aidés programmés
						     null, -- Nombre total de logements aidés en location programmés
						     null, -- Nombre total de logements en accession en location programmés
					             null -- Nom du chef de projet suivant la procédure
						     ;	
	 INSERT INTO m_amenagement.an_amt_site_habitat SELECT
								v_idgeopo, -- identifiant géographique
								new.idsite, -- identifiant du site
								null, -- site nom
								null, -- état du site
								null, -- opérateur de saisie
								null, -- organisme de saisie
								null, -- nombre de logements
								null, -- maitre d'ouvrage
								null, -- organisme compétent
								null, -- aménageur
								null, -- gestionnaire
								null, -- animateur
								null, -- commercialisateur
								null, -- contact
								now(), -- date de saisie
								now() -- date de mise à jour
								;
    
    end if;

    -- insertion dans la tablé métier ACTIVITE et PROCED (avec insert ci-dessus)
    if 
	new.proced=true and new.destdomi='02' 
    and
	(select count(*) from m_urbanisme_reg.an_proced where idsite=new.idsite) = 0
    and
        (select count(*) from m_economie.an_sa_site where idsite=new.idsite) = 0
    then
	-- revoir l'ordre ici en fonction des mouvements de structure entre les 2 bases (test et prod)
	INSERT INTO m_urbanisme_reg.an_proced SELECT v_idgeopo,
						     new.idsite,
						     new.l_ope_nom,--l_ope_nom
						     new.l_ope_alias,-- l_ope_alias
						     new.dest,-- dest
						     new.z_proced,--z_proced
						     new.op_sai,--op_sai
						     new.l_ope_phase,--l_ope_phase
						     new.l_ope_moa,--l_ope_moa
						     new.l_conso_type,--l_conso_type
						     new.l_pr_urb,--l_pr_urb
						     new.date_crea,--date_crea
						     new.l_pr_fon,--l_pr_fon
						     new.l_pr_fon_date,--l_pr_fon_date
						     round(cast(st_area(new.geom)/10000 as numeric),2), -- l_surf_ha
						     new.l_existe,--l_existe
						     new.l_pr_fon_type,--l_pr_fon_type
						     new.l_ref_compta,--l_ref_compta
						     new.l_observ,--l_observ
						     now(),--date_sai
						     now(),--date_maj
			     null, -- surface cessible en ha
						     null, -- date cloture de l'opération
						     null, -- nb de logements programmés
						     null, -- nb de logements individuels programmés
						     null, -- nb de logements individuels groupés programmés
						     null, -- nb de logemebts collectifs programmés
						     null, -- Nombre total de logements aidés programmés
						     null, -- Nombre total de logements aidés en location programmés
						     null, -- Nombre total de logements en accession en location programmés
					             null -- Nom du chef de projet suivant la procédure
					             
						     ;	
	INSERT INTO m_economie.an_sa_site SELECT 	
							new.idsite,--idsite
							(
							SELECT DISTINCT
								geo_sa_pole.idpole 
							FROM 
								m_economie.geo_sa_pole, r_objet.geo_objet_ope, m_urbanisme_reg.an_proced
							WHERE
								geo_objet_ope.idgeopo=an_proced.idgeopo
							AND
								an_proced.idgeopo=new.idgeopo
							AND
								st_intersects(geo_objet_ope.geom,geo_sa_pole.geom) = true
								
							), -- recherche auto de l'IDPOLE
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
							null,
							null,
							null, --prix de cession moyen (impossible à calculer à cette étape car par de idsite renseigné)
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
							null,
							null,
							null,
							null,
							null,
							null,
							null,
							null,
							false
							;
    

    end if;
    
    -- insertion dans la tablé métier MIXTE et PROCED (avec insert ci-dessus)
    if 
	new.proced=true and new.destdomi='03' 
    and
	(select count(*) from m_urbanisme_reg.an_proced where idsite=new.idsite) = 0
    and
        (select count(*) from m_amenagement.an_amt_site_mixte where idsite=new.idsite) = 0
    then
	-- revoir l'ordre ici en fonction des mouvements de structure entre les 2 bases (test et prod)
	INSERT INTO m_urbanisme_reg.an_proced SELECT v_idgeopo,
						     new.idsite,
						     new.l_ope_nom,--l_ope_nom
						     new.l_ope_alias,-- l_ope_alias
						     new.dest,-- dest
						     new.z_proced,--z_proced
						     new.op_sai,--op_sai
						     new.l_ope_phase,--l_ope_phase
						     new.l_ope_moa,--l_ope_moa
						     new.l_conso_type,--l_conso_type
						     new.l_pr_urb,--l_pr_urb
						     new.date_crea,--date_crea
						     new.l_pr_fon,--l_pr_fon
						     new.l_pr_fon_date,--l_pr_fon_date
						     round(cast(st_area(new.geom)/10000 as numeric),2), -- l_surf_ha
						     new.l_existe,--l_existe
						     new.l_pr_fon_type,--l_pr_fon_type
						     new.l_ref_compta,--l_ref_compta
						     new.l_observ,--l_observ
						     now(),--date_sai
						     now(),--date_maj
				     null, -- surface cessible en ha
						     null, -- date cloture de l'opération
						     null, -- nb de logements programmés
						     null, -- nb de logements individuels programmés
						     null, -- nb de logements individuels groupés programmés
						     null, -- nb de logemebts collectifs programmés
						     null, -- Nombre total de logements aidés programmés
						     null, -- Nombre total de logements aidés en location programmés
						     null, -- Nombre total de logements en accession en location programmés
					             null -- Nom du chef de projet suivant la procédure
						     ;	

	INSERT INTO m_amenagement.an_amt_site_mixte SELECT v_idgeopo,
							new.idsite,--idsite
							(
							SELECT DISTINCT
								geo_sa_pole.idpole 
							FROM 
								m_economie.geo_sa_pole, r_objet.geo_objet_ope, m_urbanisme_reg.an_proced
							WHERE
								geo_objet_ope.idgeopo=an_proced.idgeopo
							AND
								an_proced.idgeopo=new.idgeopo
							AND
								st_intersects(geo_objet_ope.geom,geo_sa_pole.geom) = true
								
							), -- recherche auto de l'IDPOLE
							null, -- vocation du site
							null, -- libellé
							null, -- état du site
							null, -- date intégration GéoPic
							null,--opérateur de saisie
							null,--organisme de saisie
							null,--typologie
							null,--destination
							null,--première implantation
							null,-- Maître d'ouvrage
							null,-- compétence
							null, -- aménageur
							null,-- gestionnaire
							null, -- animateur
							null, -- commercialisateur
							null,-- contact
							null, --prix de cession moyen eco (impossible à calculer à cette étape car par de idsite renseigné)
							null, --prix de cession moyen hab (impossible à calculer à cette étape car par de idsite renseigné)
							null, -- env
							null, --paysage
							null,-- rehab
							null,-- epu
							null,-- dechet
							null,-- tri
							null,-- ass
							null,--pluvia
							null,--eau
							null,--gaz
							null,--elect
							null,--net
							null,--db_net
							null,--auto
							null,--dst_auto
							null,--tps_auto
							null,--ar_f
							null,--dst_ar_f
							null,--ar_v
							null,--dst_ar_v
							null,--z_fr_f
							null,--dst fr_f
							null,--fr_v
							null,--dst_fr_v
							null,--pmm
							null,--dst_pmm
							null,--serv_tc
							null,--circ douce
							null,--serv rest
							null,--serv creche
							null,--serv_autre
							null,--serv coll
							null, -- aide_pb
							null, -- date d aide début
							null, -- date d aide fin
							now(), -- date de saisie
							now() -- date de mise à jour
							;
    end if;
    -- insertion dans la tablé métier EQUIPEMENT et PROCED (avec insert ci-dessus)
    if 
	new.proced=true and new.destdomi='05' 
    and
	(select count(*) from m_urbanisme_reg.an_proced where idsite=new.idsite) = 0
    and
        (select count(*) from m_amenagement.an_amt_site_equ where idsite=new.idsite) = 0
    then
	-- revoir l'ordre ici en fonction des mouvements de structure entre les 2 bases (test et prod)
	INSERT INTO m_urbanisme_reg.an_proced SELECT v_idgeopo,
						  new.idsite,
						     new.l_ope_nom,--l_ope_nom
						     new.l_ope_alias,-- l_ope_alias
						     new.dest,-- dest
						     new.z_proced,--z_proced
						     new.op_sai,--op_sai
						     new.l_ope_phase,--l_ope_phase
						     new.l_ope_moa,--l_ope_moa
						     new.l_conso_type,--l_conso_type
						     new.l_pr_urb,--l_pr_urb
						     new.date_crea,--date_crea
						     new.l_pr_fon,--l_pr_fon
						     new.l_pr_fon_date,--l_pr_fon_date
						     round(cast(st_area(new.geom)/10000 as numeric),2), -- l_surf_ha
						     new.l_existe,--l_existe
						     new.l_pr_fon_type,--l_pr_fon_type
						     new.l_ref_compta,--l_ref_compta
						     new.l_observ,--l_observ
						     now(),--date_sai
						     now(),--date_maj
			     null, -- surface cessible en ha
						     null, -- date cloture de l'opération
						     null, -- nb de logements programmés
						     null, -- nb de logements individuels programmés
						     null, -- nb de logements individuels groupés programmés
						     null, -- nb de logemebts collectifs programmés
						     null, -- Nombre total de logements aidés programmés
						     null, -- Nombre total de logements aidés en location programmés
						     null, -- Nombre total de logements en accession en location programmés
					             null -- Nom du chef de projet suivant la procédure
						     ;	

	INSERT INTO m_amenagement.an_amt_site_equ SELECT v_idgeopo,
							new.idsite, -- identifiant du site
							null, -- libellé
							null, -- état du site
							null,--opérateur de saisie
							null,--organisme de saisie
							null,-- Maître d'ouvrage
							null,-- compétence
							null, -- aménageur
							null,-- gestionnaire
							null, -- animateur
							null, -- commercialisateur
							null,-- contact
							now(), -- date de saisie
							now() -- date de mise à jour
							;
    end if;

   
    -- GESTION du champ proced=false
    if new.proced = false and new.destdomi='01' 
    and
        (select count(*) from m_amenagement.an_amt_site_habitat where idsite=new.idsite) = 0
    then
    -- insertion dans la tablé métier HABITAT
	INSERT INTO m_amenagement.an_amt_site_habitat SELECT
								v_idgeopo, -- identifiant géographique
								new.idsite, -- identifiant du site
								null, -- site nom
								null, -- état du site
								null, -- opérateur de saisie
								null, -- organisme de saisie
								null, -- nombre de logements
								null, -- maitre d'ouvrage
								null, -- organisme compétent
								null, -- aménageur
								null, -- gestionnaire
								null, -- animateur
								null, -- commercialisateur
								null, -- contact
								now(), -- date de saisie
								now() -- date de mise à jour
								;

    end if;
    if new.proced = false and new.destdomi='02'
    and
        (select count(*) from m_economie.an_sa_site where idsite=new.idsite) = 0
    then
    -- insertion dans la tablé métier ACTIVITE
	INSERT INTO m_economie.an_sa_site SELECT 	
							new.idsite,--idsite
							(
							SELECT DISTINCT
								geo_sa_pole.idpole 
							FROM 
								m_economie.geo_sa_pole, r_objet.geo_objet_ope, m_urbanisme_reg.an_proced
							WHERE
								geo_objet_ope.idgeopo=an_proced.idgeopo
							AND
								an_proced.idgeopo=new.idgeopo
							AND
								st_intersects(geo_objet_ope.geom,geo_sa_pole.geom) = true
								
							), -- recherche auto de l'IDPOLE
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
							null,
							null,
							null, --prix de cession moyen (impossible à calculer à cette étape car par de idsite renseigné)
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
							null,
							null,
							null,
							null,
							null,
							null,
							null,
							null,
							false
							;

    end if;
    if new.proced = false and new.destdomi='03'
    and
        (select count(*) from m_amenagement.an_amt_site_mixte where idsite=new.idsite) = 0
    then
    -- insertion dans la tablé métier MIXTE
	INSERT INTO m_amenagement.an_amt_site_mixte SELECT v_idgeopo,
							new.idsite,--idsite
							(
							SELECT DISTINCT
								geo_sa_pole.idpole 
							FROM 
								m_economie.geo_sa_pole, r_objet.geo_objet_ope, m_urbanisme_reg.an_proced
							WHERE
								geo_objet_ope.idgeopo=an_proced.idgeopo
							AND
								an_proced.idgeopo=new.idgeopo
							AND
								st_intersects(geo_objet_ope.geom,geo_sa_pole.geom) = true
								
							), -- recherche auto de l'IDPOLE
							null, -- vocation du site
							null, -- libellé
							null, -- état du site
							null, -- date intégration GéoPic
							null,--opérateur de saisie
							null,--organisme de saisie
							null,--typologie
							null,--destination
							null,--première implantation
							null,-- Maître d'ouvrage
							null,-- compétence
							null, -- aménageur
							null,-- gestionnaire
							null, -- animateur
							null, -- commercialisateur
							null,-- contact
							null, --prix de cession moyen eco (impossible à calculer à cette étape car par de idsite renseigné)
							null, --prix de cession moyen hab (impossible à calculer à cette étape car par de idsite renseigné)
							null, -- env
							null, --paysage
							null,-- rehab
							null,-- epu
							null,-- dechet
							null,-- tri
							null,-- ass
							null,--pluvia
							null,--eau
							null,--gaz
							null,--elect
							null,--net
							null,--db_net
							null,--auto
							null,--dst_auto
							null,--tps_auto
							null,--ar_f
							null,--dst_ar_f
							null,--ar_v
							null,--dst_ar_v
							null,--z_fr_f
							null,--dst fr_f
							null,--fr_v
							null,--dst_fr_v
							null,--pmm
							null,--dst_pmm
							null,--serv_tc
							null,--circ douce
							null,--serv rest
							null,--serv creche
							null,--serv_autre
							null,--serv coll
							null, -- aide_pb
							null, -- date d aide début
							null, -- date d aide fin
							now(), -- date de saisie
							now() -- date de mise à jour
							;

    end if;
    if new.proced = false and new.destdomi='05'
    and
        (select count(*) from m_amenagement.an_amt_site_equ where idsite=new.idsite) = 0
    then
    -- insertion dans la tablé métier EQUIPEMENT
	INSERT INTO m_amenagement.an_amt_site_equ SELECT v_idgeopo,
							new.idsite, -- identifiant du site
							null, -- libellé
							null, -- état du site
							null,--opérateur de saisie
							null,--organisme de saisie
							null,-- Maître d'ouvrage
							null,-- compétence
							null, -- aménageur
							null,-- gestionnaire
							null, -- animateur
							null, -- commercialisateur
							null,-- contact
							now(), -- date de saisie
							now() -- date de mise à jour
							;

    end if;
     return new;
END
$BODY$;

ALTER FUNCTION r_objet.ft_m_insert_proc()
    OWNER TO create_sig;

GRANT EXECUTE ON FUNCTION r_objet.ft_m_insert_proc() TO PUBLIC;

GRANT EXECUTE ON FUNCTION r_objet.ft_m_insert_proc() TO create_sig;






										     
-- Trigger: t_t2_insert_proc on r_objet.geo_v_proc

-- DROP TRIGGER t_t2_insert_proc ON r_objet.geo_v_proc;

CREATE TRIGGER t_t2_insert_proc
  INSTEAD OF INSERT
  ON r_objet.geo_v_proc
  FOR EACH ROW
  EXECUTE PROCEDURE r_objet.ft_m_insert_proc();

-- Function: r_objet.ft_m_update_proc()

-- DROP FUNCTION r_objet.ft_m_update_proc();

CREATE OR REPLACE FUNCTION r_objet.ft_m_update_proc()
  RETURNS trigger AS
$BODY$

BEGIN
	UPDATE r_objet.geo_objet_ope SET op_sai=new.op_sai_obj, src_geom=new.ref_spa, sup_m2=round(cast(st_area(new.geom) as numeric),0),proced=new.proced, destdomi=new.destdomi, geom=new.geom, date_maj=now()
        WHERE idgeopo=new.idgeopo; 

        -- si la procédure est vrai et avant faux, on insère un enregistrement dans la table des procédures
	if new.proced=true and old.proced=false then
	INSERT INTO m_urbanisme_reg.an_proced SELECT new.idgeopo,
						     new.idsite,
						     new.l_ope_nom,--l_ope_nom
						     new.l_ope_alias,-- l_ope_alias
						     new.dest,-- dest
						     new.z_proced,--z_proced
						     new.op_sai,--op_sai
						     new.l_ope_phase,--l_ope_phase
						     new.l_ope_moa,--l_ope_moa
						     new.l_conso_type,--l_conso_type
						     new.l_pr_urb,--l_pr_urb
						     new.date_crea,--date_crea
						     new.l_pr_fon,--l_pr_fon
						     new.l_pr_fon_date,--l_pr_fon_date
						     round(cast(st_area(new.geom)/10000 as numeric),2), -- l_surf_ha
						     new.l_existe,--l_existe
						     new.l_pr_fon_type,--l_pr_fon_type
						     new.l_ref_compta,--l_ref_compta
						     new.l_observ,--l_observ
						     now(),--date_sai
						     now()--date_maj
						     ;	
        end if;
        -- si la procédure est faux et maintenant vrai, il faut supprimer l'enregistrement dans la table des procédures
        if new.proced=false and old.proced=true then
	DELETE FROM m_urbanisme_reg.an_proced WHERE idgeopo=old.idgeopo;
        end if;
        
        if (new.proced=true and old.proced=true) or (new.proced=false and old.proced=false) then
        
	UPDATE m_urbanisme_reg.an_proced SET l_ope_nom=new.l_ope_nom, l_ope_alias=new.l_ope_alias, dest=new.dest,z_proced=new.z_proced,op_sai=new.op_sai,l_ope_phase=new.l_ope_phase,l_ope_moa=new.l_ope_moa,
						     l_conso_type=new.l_conso_type,l_pr_urb=new.l_pr_urb, date_crea=new.date_crea,  l_pr_fon=new.l_pr_fon, l_pr_fon_date=new.l_pr_fon_date,l_surf_ha=round(cast(st_area(new.geom)/10000 as numeric),2), 
						     l_existe=new.l_existe,l_pr_fon_type=new.l_pr_fon_type,l_ref_compta=new.l_ref_compta, l_observ=new.l_observ,date_maj=now()
				         WHERE idgeopo=new.idgeopo;	

	end if;
	
     return new;
END
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
ALTER FUNCTION r_objet.ft_m_update_proc()
  OWNER TO sig_create;


				  
-- Trigger: t_t3_update_proc on r_objet.geo_v_proc

-- DROP TRIGGER t_t3_update_proc ON r_objet.geo_v_proc;

CREATE TRIGGER t_t3_update_proc
  INSTEAD OF UPDATE
  ON r_objet.geo_v_proc
  FOR EACH ROW
  EXECUTE PROCEDURE r_objet.ft_m_update_proc();

-- ########################################################### SCHEMA m_foncier #########################

-- ########################################################### Vue de gestion des cessions (attributs) #########################


-- View: m_foncier.geo_v_cession

-- DROP VIEW m_foncier.geo_v_cession;

CREATE OR REPLACE VIEW m_foncier.geo_v_cession
 AS
 SELECT o.idgeolf,
    c.idces,
    c.idces AS idces_lk,
    c.idces_d,
    c.l_rel,
    c.l_compo,
    c.l_etat,
    o.l_voca AS voca_ces,
    o.l_nom,
    ''::character varying AS lot_l_nom,
    NULL::integer AS lhab_nb_log,
    NULL::integer AS lhab_nb_logind,
    NULL::integer AS lhab_nb_logindgr,
    NULL::integer AS lhab_nb_logcol,
    NULL::integer AS lhab_nb_logaide,
    NULL::character varying AS llot_observ,
    NULL::integer AS lhab_nb_log_r,
    NULL::integer AS lhab_nb_logind_r,
    NULL::integer AS lhab_nb_logindgr_r,
    NULL::integer AS lhab_nb_logcol_r,
    NULL::integer AS lhab_nb_logaide_r,
    NULL::integer AS lhab_nb_logaide_loc_r,
    NULL::integer AS lhab_nb_logaide_acc_r,
    '00'::character varying AS llot_tact,
        CASE
            WHEN c.l_etat::text = '10'::text OR c.l_etat::text = '20'::text OR c.l_etat::text = '30'::text OR c.l_etat::text = '50'::text THEN 'En cours de cession'::text
            WHEN c.l_etat::text = '40'::text THEN 'Cédé'::text
            WHEN c.l_etat::text = '01'::text THEN 'Libre'::text
            WHEN c.l_etat::text = '00'::text THEN 'Non renseigné'::text
            WHEN c.l_etat::text = '99'::text THEN 'Non cédé par un public'::text
            ELSE NULL::text
        END AS l_etat_lib,
    c.l_orga,
    c.d_delib_1,
    c.d_delib_2,
    c.d_delib_3,
    c.d_delib_4,
    c.insee,
    c.l_date_i,
    c.l_voca,
    c.l_acque,
    c.l_parcelle_i,
    c.l_parcelle_f,
    c.d_esti_1,
    c.d_esti_2,
    c.d_esti_3,
    c.l_esti_ht,
    c.l_surf,
    c.l_condi,
    c.l_type,
    c.d_prome,
    c.d_acte,
    c.l_notaire,
    c.l_notaire_a,
    c.l_pvente_ht,
    c.l_pvente_ttc,
    c.l_mfrais_ht,
    c.l_mfrais_ttc,
    c.l_mfrais_g_ttc,
    c.l_mfrais_n_ttc,
    c.l_mfrais_a_ttc,
    c.l_pvente_s,
    c.l_frais_a,
    c.l_frais_b,
    c.l_frais_c,
    c.l_frais_d,
    c.l_frais_e,
    c.l_type_a,
    c.l_type_b,
    c.l_type_c,
    c.l_observ,
    c.date_sai,
    c.date_maj,
    c.idsite,
    c.op_sai,
    o.geom
   FROM m_foncier.an_cession c,
    m_foncier.lk_cession_lot lc,
    r_objet.geo_objet_fon_lot o
  WHERE c.idces::text = lc.idces::text AND lc.idgeolf = o.idgeolf;

ALTER TABLE m_foncier.geo_v_cession
    OWNER TO create_sig;
COMMENT ON VIEW m_foncier.geo_v_cession
    IS 'Vue éditable des cessions de lots et possibilité d''ajout d''un lot par le service foncier';

GRANT ALL ON TABLE m_foncier.geo_v_cession TO sig_create;
GRANT SELECT ON TABLE m_foncier.geo_v_cession TO sig_read;
GRANT ALL ON TABLE m_foncier.geo_v_cession TO create_sig;
GRANT INSERT, SELECT, UPDATE, DELETE ON TABLE m_foncier.geo_v_cession TO sig_edit;

CREATE TRIGGER t_t1_cess_nlot_delete
    INSTEAD OF DELETE
    ON m_foncier.geo_v_cession
    FOR EACH ROW
    EXECUTE PROCEDURE m_foncier.ft_m_cess_nlot_delete();


CREATE TRIGGER t_t2_cess_nlot
    INSTEAD OF INSERT
    ON m_foncier.geo_v_cession
    FOR EACH ROW
    EXECUTE PROCEDURE m_foncier.ft_m_cess_nlot_insert();


CREATE TRIGGER t_t3_cess_nlot
    INSTEAD OF UPDATE 
    ON m_foncier.geo_v_cession
    FOR EACH ROW
    EXECUTE PROCEDURE m_foncier.ft_m_cess_nlot_update();



				  
-- Function: m_foncier.ft_m_cess_nlot_delete()
-- DROP FUNCTION m_foncier.ft_m_cess_nlot_delete();

CREATE OR REPLACE FUNCTION m_foncier.ft_m_cess_nlot_delete()
  RETURNS trigger AS
$BODY$
BEGIN

 -- pré-test pour vérifier si le lot n'est pas dans une zone d'aménagement, si non renvoie une exception et ne fait rien (dans GEO il faut créer un message pour l'utilisateur)
IF (SELECT count(*) FROM r_objet.geo_objet_fon_lot o WHERE o.op_sai <> 'Service foncier' AND idgeolf = old.idgeolf) >= 1 THEN
RAISE EXCEPTION 'La cession à supprimer est dans une opération d''aménagements. Vous pouvez seulement supprimer un lot hors de ces zones. Merci de vous rapprochez du service Information Géographique pour la suppression de votre cession.';
ELSE

    DELETE FROM m_foncier.an_cession WHERE idces=(SELECT lf.idces FROM m_foncier.an_cession f, m_foncier.lk_cession_lot lf WHERE f.idces=lf.idces AND lf.idgeolf=old.idgeolf);
    DELETE FROM m_foncier.lk_cession_lot WHERE idgeolf=old.idgeolf;
    DELETE FROM m_amenagement.an_amt_lot_stade WHERE idgeolf=old.idgeolf;
    DELETE FROM m_amenagement.an_amt_lot_hab WHERE idgeolf=old.idgeolf;
    DELETE FROM m_amenagement.an_amt_lot_equ WHERE idgeolf=old.idgeolf;
    DELETE FROM m_amenagement.an_amt_lot_mixte WHERE idgeolf=old.idgeolf;
    DELETE FROM m_amenagement.an_amt_lot_divers WHERE idgeolf=old.idgeolf;
    DELETE FROM m_economie.an_sa_lot WHERE idgeolf=old.idgeolf;
    DELETE FROM r_objet.geo_objet_fon_lot WHERE idgeolf=old.idgeolf;
END IF;
     return new ;
END;
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
ALTER FUNCTION m_foncier.ft_m_cess_nlot_delete()
  OWNER TO sig_create;

COMMENT ON FUNCTION m_foncier.ft_m_cess_nlot_delete() IS 'Fonction gérant la suppression des cessions (lots) uniquement dans le tissu (hors zone d''aménagement)';
				  
-- Trigger: t_t1_cess_nlot_delete on m_foncier.geo_v_cession
-- DROP TRIGGER t_t1_cess_nlot_delete ON m_foncier.geo_v_cession;

CREATE TRIGGER t_t1_cess_nlot_delete
  INSTEAD OF DELETE
  ON m_foncier.geo_v_cession
  FOR EACH ROW
  EXECUTE PROCEDURE m_foncier.ft_m_cess_nlot_delete();

-- FUNCTION: m_foncier.ft_m_cess_nlot_insert()

-- DROP FUNCTION m_foncier.ft_m_cess_nlot_insert();

CREATE FUNCTION m_foncier.ft_m_cess_nlot_insert()
    RETURNS trigger
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE NOT LEAKPROOF
AS $BODY$

-- déclaration de variable pré-calculée avant intégration dans la base ou servant de tests de condition
DECLARE v_l_comm2 character varying;
DECLARE v_stade_amng character varying;
DECLARE v_l_amng2 character varying;
DECLARE v_idgeolf integer;
DECLARE v_idces integer;
DECLARE lot_surf integer;

BEGIN

-- récupération d'un identifiant d'objet
v_idgeolf := (SELECT nextval('idgeo_seq'::regclass));

-- récupération d'un nidentifiant cession
v_idces := (SELECT nextval('m_foncier.ces_seq'::regclass));

-- calcul de la surface du lot
lot_surf:=round(cast(st_area(new.geom) as numeric),0);

-- gestion des attributs intégrés dans la table m_amenagement.an_amt_lot_stade en fonction de l'état du dossier de cessions

        -- automatisation de l'état de commercialisation pour les lots (uniquement la cas terrain cédé mis à jour par le service foncier)
	IF new.l_etat ='40' THEN
	v_l_comm2 :='20';
	v_stade_amng :='40';
	v_l_amng2 := '10';
	END IF;

        -- automatisation de l'état de commercialisation pour les lots
	IF new.l_etat ='01' THEN
	v_l_comm2 :='11';
	v_stade_amng :='40';
	v_l_amng2 := '10';
	END IF;

	IF new.l_etat ='10' THEN
	v_l_comm2 :='32';
	v_stade_amng :='40';
	v_l_amng2 := '10';
	END IF;
	
	IF (new.l_etat ='20' or new.l_etat ='30') THEN
	v_l_comm2 :='31';
	v_stade_amng :='40';
	v_l_amng2 := '10';
	END IF;
	
	IF new.l_etat ='40'  THEN
	v_l_comm2 :='20';
	v_stade_amng :='40';
	v_l_amng2 := '10';
	END IF;
	
	IF new.l_etat ='50'  THEN
	v_l_comm2 :='00';
	END IF;
	
	IF new.l_etat ='60'  THEN
	v_l_comm2 :='00';
	v_stade_amng :='30';
	v_l_amng2 := '10';

	END IF;
	IF new.l_etat ='99'  THEN
	v_l_comm2 :='99';
	v_stade_amng :='00';
	v_l_amng2 := '00';
	END IF;
	
	IF new.l_etat ='00' THEN
	v_l_comm2 :='00';
	v_stade_amng :='00';
	v_l_amng2 := '00';
	END IF;

-- pré-test pour vérifier si le lot est bien sur l'ARC et pas sur un autre lot, si non renvoie une exception et ne fait rien (dans GEO il faut créer un message pour l'utilisateur)

IF ST_Disjoint(new.geom,(SELECT c.geom FROM r_osm.geo_vm_osm_contour_arc c)) = true OR (SELECT count(*) FROM r_objet.geo_objet_fon_lot o WHERE st_intersects(st_buffer(new.geom,-1),o.geom) AND idgeolf <> v_idgeolf ) >= 1  THEN

RAISE EXCEPTION 'La cession saisie est dans une opération d''aménagements. Vous pouvez seulement saisir un lot hors de ces zones. Merci de vous rapprochez du service Information Géographique pour la saisie de votre cession.';

ELSE
-- insertion des informations dans les tables correspondants selon la vocation saisie
        -- si la vocation est non renseignée
	IF new.voca_ces = '00' or new.voca_ces = '' or new.voca_ces is null THEN
	

	RAISE EXCEPTION 'La vocation ne peut pas être non renseignée ici.'; --(générer un message pour GEO afficher dans la fiche d'information

	END IF;

	-- si la vocation est un équipement public, insertion dans geo_objet_fon_lot, an_amt_lot_stade,an_amt_lot_equ, lk_cession_lot et an_cession
	IF new.voca_ces = '10' THEN
                -- insertion dans la table objet
		INSERT INTO r_objet.geo_objet_fon_lot SELECT v_idgeolf,'Service foncier','11',null,'10',new.geom,null,null,new.l_nom;
                -- insertion dans la table des stades d'aménagement et de commercialisation
	        INSERT INTO m_amenagement.an_amt_lot_stade SELECT v_idgeolf, 
		(SELECT DISTINCT idsite FROM r_objet.geo_objet_ope WHERE st_intersects(geo_objet_ope.geom,ST_PointOnSurface(new.geom)) = true AND idsite <> '60159ak')
		, v_stade_amng, v_l_amng2, null, v_l_comm2, null,'00';
                -- insertion dans la table des lots thématiques
                INSERT INTO m_amenagement.an_amt_lot_equ SELECT v_idgeolf,(SELECT DISTINCT idsite FROM r_objet.geo_objet_ope WHERE st_intersects(geo_objet_ope.geom,ST_PointOnSurface(new.geom)) = true),
							'Service Foncier',
							'ARC',
							new.lot_l_nom,
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
                -- insertion dans la table de relation lot/cession
		INSERT INTO m_foncier.lk_cession_lot SELECT v_idgeolf, v_idces;	
                -- insertion dans la table des attributs de cession
		INSERT INTO m_foncier.an_cession VALUES (
						v_idces, -- idces
						'10',
						false, -- relation
						new.l_etat,
						new.l_orga,
						new.d_delib_1,
						new.d_delib_2,
						new.d_delib_3,
						(SELECT insee FROM r_osm.geo_osm_commune WHERE st_intersects(st_pointonsurface(new.geom),geom)),
						new.l_date_i,
						new.l_voca,
						new.l_acque,
						new.l_parcelle_i,
						new.l_parcelle_f,
						new.d_esti_1,
						new.d_esti_2,
						new.d_esti_3,
						new.l_esti_ht,
						new.l_surf,
						new.l_condi,
						new.l_type,
						new.d_prome,
						new.d_acte,
						new.l_notaire,
						new.l_notaire_a,
						new.l_pvente_ht,
						new.l_pvente_ttc,
						new.l_frais_a,
						new.l_frais_b,
						new.l_frais_c,
						new.l_frais_d,
						new.l_frais_e,
						new.l_mfrais_ht,
						new.l_mfrais_ttc,
						new.l_pvente_s,
						new.l_type_a,
						new.l_type_b,
						new.l_type_c,
						new.l_observ,
						null,
						new.l_mfrais_g_ttc,
						new.l_mfrais_n_ttc,
						new.l_mfrais_a_ttc,
						(SELECT DISTINCT
								idsite 
							FROM 
								r_objet.geo_objet_ope
							WHERE
								st_intersects(geo_objet_ope.geom,new.geom) = true
						AND idsite <> '60159ak'
								
							),
						null,
						new.d_delib_4,
			null,
			null,
			null
						);
	END IF;

	-- si la vocation est économique, insertion dans geo_objet_fon_lot, an_amt_lot_stade,an_sa_lot (m_economie), lk_cession_lot  et an_cession
	IF new.voca_ces = '20' THEN
                -- insertion dans la table objet
		INSERT INTO r_objet.geo_objet_fon_lot SELECT v_idgeolf,'Service foncier','11',null,'20',new.geom,null,null,new.l_nom;
                -- insertion dans la table des stades d'aménagement et de commercialisation
	        INSERT INTO m_amenagement.an_amt_lot_stade SELECT v_idgeolf, 
		(SELECT DISTINCT idsite FROM r_objet.geo_objet_ope WHERE st_intersects(geo_objet_ope.geom,ST_PointOnSurface(new.geom)) = true AND idsite <> '60159ak'), v_stade_amng, v_l_amng2, null, v_l_comm2, null,'00';
		-- insertion dans la table des lots thématiques
		INSERT INTO m_economie.an_sa_lot SELECT v_idgeolf,
						 
						 (
							SELECT DISTINCT
								idsite 
							FROM 
								r_objet.geo_objet_ope
							WHERE
								st_intersects(geo_objet_ope.geom,ST_PointOnSurface(new.geom)) = true AND idsite <> '60159ak'
								
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
						  'Service foncier',
						  'ARC',
						  new.llot_tact,
						  null,
						  null,
						  new.l_acque,
						  null,
						  null,
						  null,
						  null,
						  false,
						  null,
						  new.llot_observ,
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
						  null,
						  null,
						  null,
						  null,
						  null,
						  (select string_agg(insee, ', ') from r_osm.geo_osm_commune where st_intersects(st_buffer(new.geom,-1),geom)),
						  (select string_agg(commune, ', ') from r_osm.geo_osm_commune where st_intersects(st_buffer(new.geom,-1),geom))
						  ;
		-- insertion dans la table de relation lot/cession
		INSERT INTO m_foncier.lk_cession_lot SELECT v_idgeolf, v_idces;	
                -- insertion dans la table des attributs de cession
		INSERT INTO m_foncier.an_cession VALUES (
						v_idces, -- idces
						'10',
						false, -- relation
						new.l_etat,
						new.l_orga,
						new.d_delib_1,
						new.d_delib_2,
						new.d_delib_3,
						(SELECT insee FROM r_osm.geo_osm_commune WHERE st_intersects(st_pointonsurface(new.geom),geom)),
						new.l_date_i,
						new.l_voca,
						new.l_acque,
						new.l_parcelle_i,
						new.l_parcelle_f,
						new.d_esti_1,
						new.d_esti_2,
						new.d_esti_3,
						new.l_esti_ht,
						new.l_surf,
						new.l_condi,
						new.l_type,
						new.d_prome,
						new.d_acte,
						new.l_notaire,
						new.l_notaire_a,
						new.l_pvente_ht,
						new.l_pvente_ttc,
						new.l_frais_a,
						new.l_frais_b,
						new.l_frais_c,
						new.l_frais_d,
						new.l_frais_e,
						new.l_mfrais_ht,
						new.l_mfrais_ttc,
						new.l_pvente_s,
						new.l_type_a,
						new.l_type_b,
						new.l_type_c,
						new.l_observ,
						null,
						new.l_mfrais_g_ttc,
						new.l_mfrais_n_ttc,
						new.l_mfrais_a_ttc,
						(SELECT DISTINCT
								idsite 
							FROM 
								r_objet.geo_objet_ope
							WHERE
								st_intersects(geo_objet_ope.geom,new.geom) = true AND idsite <> '60159ak'
								
							),
						null,
						new.d_delib_4,
			null,
				null,
				null
						);
	END IF;

	-- si la vocation est habitat, insertion dans geo_objet_fon_lot, an_amt_lot_stade,an_amt_lot_hab, lk_cession_lot  et an_cession
	IF new.voca_ces = '30' THEN
		-- insertion dans la table objet
		INSERT INTO r_objet.geo_objet_fon_lot SELECT v_idgeolf,'Service foncier','11',null,'30',new.geom,null,null,new.l_nom;
                -- insertion dans la table des stades d'aménagement et de commercialisation
	        INSERT INTO m_amenagement.an_amt_lot_stade SELECT v_idgeolf, (SELECT DISTINCT idsite FROM r_objet.geo_objet_ope WHERE st_intersects(geo_objet_ope.geom,ST_PointOnSurface(new.geom)) = true AND idsite <> '60159ak'), v_stade_amng, v_l_amng2, null, v_l_comm2, null,'00';
		-- insertion dans la table des lots thématiques
		INSERT INTO m_amenagement.an_amt_lot_hab SELECT v_idgeolf,
						 (
							SELECT DISTINCT
								idsite 
							FROM 
								r_objet.geo_objet_ope
							WHERE
								st_intersects(geo_objet_ope.geom,ST_PointOnSurface(new.geom)) = true AND idsite <> '60159ak'
								
						  ), -- recherche idsite
						  lot_surf,
						
								   CASE WHEN length(cast (lot_surf as character varying)) >= 1 and length(cast (lot_surf as character varying)) <= 3 THEN lot_surf || 'm²'
								   WHEN length(cast (lot_surf as character varying)) = 4 THEN replace(to_char(lot_surf,'FM9G999'),',',' ') || 'm²'
								   WHEN length(cast (lot_surf as character varying)) = 5 THEN replace(to_char(lot_surf,'FM99G999'),',',' ') || 'm²'
								   WHEN length(cast (lot_surf as character varying)) = 6 THEN replace(to_char(lot_surf,'FM999G999'),',',' ') || 'm²'
								   WHEN length(cast (lot_surf as character varying)) = 7 THEN replace(to_char(lot_surf,'FM9G999G999'),',',' ') || 'm²'
								   WHEN length(cast (lot_surf as character varying)) = 8 THEN replace(to_char(lot_surf,'FM99G999G999'),',',' ') || 'm²'
								   END,
						  'Service foncier',
						  'ARC',
						  null,
						  null,
						  new.lhab_nb_log,
						  new.lhab_nb_logind,
						  new.lhab_nb_logindgr,
						  new.lhab_nb_logcol,
						  new.lhab_nb_logaide,
						  new.llot_observ,
						  now(),
						  now(),
						  null,
						  new.lhab_nb_log_r,
						  new.lhab_nb_logind_r,
						  new.lhab_nb_logindgr_r,
						  new.lhab_nb_logcol_r,
						  new.lhab_nb_logaide_r,
						  null,
						  new.lhab_nb_logaide_loc_r,
						  new.lhab_nb_logaide_acc_r
						  ;
		-- insertion dans la table de relation lot/cession
		INSERT INTO m_foncier.lk_cession_lot SELECT v_idgeolf, v_idces;	
                -- insertion dans la table des attributs de cession
		INSERT INTO m_foncier.an_cession VALUES (
						v_idces, -- idces
						'10',
						false, -- relation
						new.l_etat,
						new.l_orga,
						new.d_delib_1,
						new.d_delib_2,
						new.d_delib_3,
						(SELECT insee FROM r_osm.geo_osm_commune WHERE st_intersects(st_pointonsurface(new.geom),geom)),
						new.l_date_i,
						new.l_voca,
						new.l_acque,
						new.l_parcelle_i,
						new.l_parcelle_f,
						new.d_esti_1,
						new.d_esti_2,
						new.d_esti_3,
						new.l_esti_ht,
						new.l_surf,
						new.l_condi,
						new.l_type,
						new.d_prome,
						new.d_acte,
						new.l_notaire,
						new.l_notaire_a,
						new.l_pvente_ht,
						new.l_pvente_ttc,
						new.l_frais_a,
						new.l_frais_b,
						new.l_frais_c,
						new.l_frais_d,
						new.l_frais_e,
						new.l_mfrais_ht,
						new.l_mfrais_ttc,
						new.l_pvente_s,
						new.l_type_a,
						new.l_type_b,
						new.l_type_c,
						new.l_observ,
						null,
						new.l_mfrais_g_ttc,
						new.l_mfrais_n_ttc,
						new.l_mfrais_a_ttc,
						(SELECT DISTINCT
								idsite 
							FROM 
								r_objet.geo_objet_ope
							WHERE
								st_intersects(geo_objet_ope.geom,new.geom) = true AND idsite <> '60159ak'
								
							),
						null,
						new.d_delib_4,
				null,
				null,
				null
						);
	END IF;

	-- si la vocation est divers, insertion dans geo_objet_fon_lot, an_amt_lot_stade,an_amt_lot_divers, lk_cession_lot  et an_cession
	IF new.voca_ces = '40' THEN
		-- insertion dans la table objet
		INSERT INTO r_objet.geo_objet_fon_lot SELECT v_idgeolf,'Service foncier','11',null,'40',new.geom,null,null,new.l_nom;
                -- insertion dans la table des stades d'aménagement et de commercialisation
	        INSERT INTO m_amenagement.an_amt_lot_stade SELECT v_idgeolf, (SELECT DISTINCT idsite FROM r_objet.geo_objet_ope WHERE st_intersects(geo_objet_ope.geom,ST_PointOnSurface(new.geom)) = true AND idsite <> '60159ak'), v_stade_amng, v_l_amng2, null, v_l_comm2, null,'00';
		-- insertion dans la table des lots thématiques
		INSERT INTO m_amenagement.an_amt_lot_divers SELECT v_idgeolf,
							(
							SELECT DISTINCT
								idsite 
							FROM 
								r_objet.geo_objet_ope
							WHERE
								st_intersects(geo_objet_ope.geom,new.geom) = true AND idsite <> '60159ak'
								 
							),-- recherche auto de l'IDSITE
							'Service foncier',
							'ARC',
							new.lot_l_nom,
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
		-- insertion dans la table de relation lot/cession
		INSERT INTO m_foncier.lk_cession_lot SELECT v_idgeolf, v_idces;	
                -- insertion dans la table des attributs de cession
		INSERT INTO m_foncier.an_cession VALUES (
						v_idces, -- idces
						'10',
						false, -- relation
						new.l_etat,
						new.l_orga,
						new.d_delib_1,
						new.d_delib_2,
						new.d_delib_3,
						(SELECT insee FROM r_osm.geo_osm_commune WHERE st_intersects(st_pointonsurface(new.geom),geom)),
						new.l_date_i,
						new.l_voca,
						new.l_acque,
						new.l_parcelle_i,
						new.l_parcelle_f,
						new.d_esti_1,
						new.d_esti_2,
						new.d_esti_3,
						new.l_esti_ht,
						new.l_surf,
						new.l_condi,
						new.l_type,
						new.d_prome,
						new.d_acte,
						new.l_notaire,
						new.l_notaire_a,
						new.l_pvente_ht,
						new.l_pvente_ttc,
						new.l_frais_a,
						new.l_frais_b,
						new.l_frais_c,
						new.l_frais_d,
						new.l_frais_e,
						new.l_mfrais_ht,
						new.l_mfrais_ttc,
						new.l_pvente_s,
						new.l_type_a,
						new.l_type_b,
						new.l_type_c,
						new.l_observ,
						null,
						new.l_mfrais_g_ttc,
						new.l_mfrais_n_ttc,
						new.l_mfrais_a_ttc,
						(SELECT DISTINCT
								idsite 
							FROM 
								r_objet.geo_objet_ope
							WHERE
								st_intersects(geo_objet_ope.geom,new.geom) = true AND idsite <> '60159ak'
								
							),
						null,
						new.d_delib_4,
				null,
				null,
				null
						);
	END IF;

	-- si la vocation est espace public, insertion dans geo_objet_fon_lot, an_amt_lot_stade, lk_cession_lot  et an_cession
	IF new.voca_ces = '50' THEN
		-- insertion dans la table objet
		INSERT INTO r_objet.geo_objet_fon_lot SELECT v_idgeolf,'Service foncier','11',null,'50',new.geom,null,null,new.l_nom;
                -- insertion dans la table des stades d'aménagement et de commercialisation
	        INSERT INTO m_amenagement.an_amt_lot_stade SELECT v_idgeolf, 
		(SELECT DISTINCT idsite FROM r_objet.geo_objet_ope WHERE 
		st_intersects(geo_objet_ope.geom,ST_PointOnSurface(new.geom)) = true AND idsite <> '60159ak')
		, v_stade_amng, v_l_amng2, null, v_l_comm2, null,'00';
		
		-- insertion dans la table de relation lot/cession
		INSERT INTO m_foncier.lk_cession_lot SELECT v_idgeolf, v_idces;	
                -- insertion dans la table des attributs de cession
		INSERT INTO m_foncier.an_cession VALUES (
						v_idces, -- idces
						'10',
						false, -- relation
						new.l_etat,
						new.l_orga,
						new.d_delib_1,
						new.d_delib_2,
						new.d_delib_3,
						(SELECT insee FROM r_osm.geo_osm_commune WHERE st_intersects(st_pointonsurface(new.geom),geom)),
						new.l_date_i,
						new.l_voca,
						new.l_acque,
						new.l_parcelle_i,
						new.l_parcelle_f,
						new.d_esti_1,
						new.d_esti_2,
						new.d_esti_3,
						new.l_esti_ht,
						new.l_surf,
						new.l_condi,
						new.l_type,
						new.d_prome,
						new.d_acte,
						new.l_notaire,
						new.l_notaire_a,
						new.l_pvente_ht,
						new.l_pvente_ttc,
						new.l_frais_a,
						new.l_frais_b,
						new.l_frais_c,
						new.l_frais_d,
						new.l_frais_e,
						new.l_mfrais_ht,
						new.l_mfrais_ttc,
						new.l_pvente_s,
						new.l_type_a,
						new.l_type_b,
						new.l_type_c,
						new.l_observ,
						null,
						new.l_mfrais_g_ttc,
						new.l_mfrais_n_ttc,
						new.l_mfrais_a_ttc,
						(SELECT DISTINCT
								idsite 
							FROM 
								r_objet.geo_objet_ope
							WHERE
								st_intersects(geo_objet_ope.geom,new.geom) = true AND idsite <> '60159ak'
								
							),
						null,
						new.d_delib_4,
				null,
				null,
				null
						);
	END IF;

	-- si la vocation est mixte, insertion dans geo_objet_fon_lot, an_amt_lot_stade,an_amt_lot_mixte, lk_cession_lot  et an_cession
	IF new.voca_ces = '60' THEN
		-- insertion dans la table objet
		INSERT INTO r_objet.geo_objet_fon_lot SELECT v_idgeolf,'Service foncier','11',null,'60',new.geom,null,null,new.l_nom;
                -- insertion dans la table des stades d'aménagement et de commercialisation
	        INSERT INTO m_amenagement.an_amt_lot_stade SELECT v_idgeolf, (SELECT DISTINCT idsite FROM r_objet.geo_objet_ope WHERE st_intersects(geo_objet_ope.geom,ST_PointOnSurface(new.geom)) = true AND idsite <> '60159ak'), v_stade_amng, v_l_amng2, null, v_l_comm2, null,'00';

		-- insertion dans la table des lots thématiques
		INSERT INTO m_amenagement.an_amt_lot_mixte SELECT v_idgeolf,
						 (
							SELECT DISTINCT
								idsite 
							FROM 
								r_objet.geo_objet_ope
							WHERE
								st_intersects(geo_objet_ope.geom,ST_PointOnSurface(new.geom)) = true AND idsite <> '60159ak'
								
						  ), -- recherche idsite
						  lot_surf,
						
								   CASE WHEN length(cast (lot_surf as character varying)) >= 1 and length(cast (lot_surf as character varying)) <= 3 THEN lot_surf || 'm²'
								   WHEN length(cast (lot_surf as character varying)) = 4 THEN replace(to_char(lot_surf,'FM9G999'),',',' ') || 'm²'
								   WHEN length(cast (lot_surf as character varying)) = 5 THEN replace(to_char(lot_surf,'FM99G999'),',',' ') || 'm²'
								   WHEN length(cast (lot_surf as character varying)) = 6 THEN replace(to_char(lot_surf,'FM999G999'),',',' ') || 'm²'
								   WHEN length(cast (lot_surf as character varying)) = 7 THEN replace(to_char(lot_surf,'FM9G999G999'),',',' ') || 'm²'
								   WHEN length(cast (lot_surf as character varying)) = 8 THEN replace(to_char(lot_surf,'FM99G999G999'),',',' ') || 'm²'
								   END,
						  'Service Foncier',
						  'ARC',
						  null,
						  null,
						  new.lhab_nb_log,
						  new.lhab_nb_logind,
						  new.lhab_nb_logindgr,
						  new.lhab_nb_logcol,
						  new.lhab_nb_logaide,
						  new.llot_observ,
						  now(),
						  now(),
						  null,
						  new.lhab_nb_log_r,
						  new.lhab_nb_logind_r,
						  new.lhab_nb_logindgr_r,
						  new.lhab_nb_logcol_r,
						  new.lhab_nb_logaide_r,
						  null,
						  new.llot_tact,
						  null,
						  new.lot_l_nom,
                                                  new.lhab_nb_logaide_loc_r,
                                                  new.lhab_nb_logaide_acc_r,
                                                  new.l_acque						  
						  ;
		-- insertion dans la table de relation lot/cession
		INSERT INTO m_foncier.lk_cession_lot SELECT v_idgeolf, v_idces;	
                -- insertion dans la table des attributs de cession
		INSERT INTO m_foncier.an_cession VALUES (
						v_idces, -- idces
						'10',
						false, -- relation
						new.l_etat,
						new.l_orga,
						new.d_delib_1,
						new.d_delib_2,
						new.d_delib_3,
						(SELECT insee FROM r_osm.geo_osm_commune WHERE st_intersects(st_pointonsurface(new.geom),geom)),
						new.l_date_i,
						new.l_voca,
						new.l_acque,
						new.l_parcelle_i,
						new.l_parcelle_f,
						new.d_esti_1,
						new.d_esti_2,
						new.d_esti_3,
						new.l_esti_ht,
						new.l_surf,
						new.l_condi,
						new.l_type,
						new.d_prome,
						new.d_acte,
						new.l_notaire,
						new.l_notaire_a,
						new.l_pvente_ht,
						new.l_pvente_ttc,
						new.l_frais_a,
						new.l_frais_b,
						new.l_frais_c,
						new.l_frais_d,
						new.l_frais_e,
						new.l_mfrais_ht,
						new.l_mfrais_ttc,
						new.l_pvente_s,
						new.l_type_a,
						new.l_type_b,
						new.l_type_c,
						new.l_observ,
						null,
						new.l_mfrais_g_ttc,
						new.l_mfrais_n_ttc,
						new.l_mfrais_a_ttc,
						(SELECT DISTINCT
								idsite 
							FROM 
								r_objet.geo_objet_ope
							WHERE
								st_intersects(geo_objet_ope.geom,st_pointonsurface(new.geom)) = true AND idsite <> '60159ak'
								
							),
						null,
						new.d_delib_4,
						null,
						null,
						null
						);
	END IF;

END IF;

	
     return new ;

END;

$BODY$;

ALTER FUNCTION m_foncier.ft_m_cess_nlot_insert()
    OWNER TO create_sig;

GRANT EXECUTE ON FUNCTION m_foncier.ft_m_cess_nlot_insert() TO PUBLIC;

GRANT EXECUTE ON FUNCTION m_foncier.ft_m_cess_nlot_insert() TO create_sig;

COMMENT ON FUNCTION m_foncier.ft_m_cess_nlot_insert()
    IS 'Fonction gérant l''insertion des cessions (lots) dans le tissu (hors zone d''aménagement)';
			  
-- Trigger: t_t2_cess_nlot on m_foncier.geo_v_cession
-- DROP TRIGGER t_t2_cess_nlot ON m_foncier.geo_v_cession;

CREATE TRIGGER t_t2_cess_nlot
  INSTEAD OF INSERT
  ON m_foncier.geo_v_cession
  FOR EACH ROW
  EXECUTE PROCEDURE m_foncier.ft_m_cess_nlot_insert();

-- FUNCTION: m_foncier.ft_m_cess_nlot_update()

-- DROP FUNCTION m_foncier.ft_m_cess_nlot_update();

CREATE FUNCTION m_foncier.ft_m_cess_nlot_update()
    RETURNS trigger
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE NOT LEAKPROOF
AS $BODY$

BEGIN
/* A REVOIR */

     -- vérification du changement de la référence du dossier et qu'il s'agisse d'un dossier comportant au moins 2 lots
     if (old.idces <> new.idces_lk) and old.l_rel='10' and new.l_rel='20' then
	UPDATE m_foncier.lk_cession_lot SET idces=new.idces_lk WHERE idgeolf=new.idgeolf;
	UPDATE m_foncier.an_cession SET l_rel=new.l_rel WHERE idces=new.idces_lk;
	DELETE FROM m_foncier.an_cession WHERE idces=old.idces;
     end if;	

     -- mise à jour du code du nom de lot dans la table objet

	IF ST_Equals(new.geom,old.geom) is false THEN

	RAISE EXCEPTION 'Le lot ne peut pas être modifié en géométrie. Faire une demande de modification au Service Information Géographique.'; --(générer un message pour GEO afficher dans la fiche d'information

     

     ELSE

	UPDATE r_objet.geo_objet_fon_lot SET l_nom = new.l_nom, geom = new.geom WHERE idgeolf = new.idgeolf;

     END IF;
     
     -- insertion des champs à mettre à jour 
     UPDATE m_foncier.an_cession SET
        idces_d = new.idces_d,
	l_rel = new.l_rel,
	l_compo = new.l_compo,
	l_etat = new.l_etat,
	l_orga = new.l_orga,
	d_delib_1 = new.d_delib_1,
	d_delib_2 = new.d_delib_2,
	d_delib_3 = new.d_delib_3,
	d_delib_4 = new.d_delib_4,
	insee = new.insee,
	l_date_i = new.l_date_i,
	l_voca = new.l_voca,
	l_acque = CASE WHEN new.l_acque IS NULL or new.l_acque = '' THEN null ELSE new.l_acque END,
	l_parcelle_i = new.l_parcelle_i,
	l_parcelle_f = new.l_parcelle_f,
	d_esti_1 = new.d_esti_1,
	d_esti_2 = new.d_esti_2,
	d_esti_3 = new.d_esti_3,
	l_esti_ht = new.l_esti_ht,
	l_surf = new.l_surf,
	l_condi = new.l_condi,
	l_type = new.l_type,
	d_prome = new.d_prome,
	d_acte = new.d_acte,
	l_notaire = new.l_notaire,
	l_notaire_a = new.l_notaire_a,
	l_pvente_ht = new.l_pvente_ht,
	l_pvente_ttc = new.l_pvente_ttc,
	l_mfrais_ttc = new.l_mfrais_ttc,
	l_mfrais_g_ttc = new.l_mfrais_g_ttc,
	l_mfrais_n_ttc = new.l_mfrais_n_ttc,
	l_mfrais_a_ttc = new.l_mfrais_a_ttc,
	l_pvente_s = new.l_pvente_s,
	l_type_a = new.l_type_a,
	l_type_b = new.l_type_b,
	l_type_c = new.l_type_c,
	l_observ = new.l_observ,
	idsite=new.idsite
	WHERE an_cession.idces=new.idces;

        -- automatisation de l'état de commercialisation pour les lots
	IF new.l_etat ='01' THEN
	update m_amenagement.an_amt_lot_stade set l_comm2='11',stade_amng='40',l_amng2 = '10' where idgeolf IN (select idgeolf from m_foncier.lk_cession_lot where idces=new.idces);
	END IF;
	IF new.l_etat ='10' THEN
	update m_amenagement.an_amt_lot_stade set l_comm2='32',stade_amng='40',l_amng2 = '10' where idgeolf IN  (select idgeolf from m_foncier.lk_cession_lot where idces=new.idces);
	END IF;
	IF (new.l_etat ='20' or new.l_etat ='30') THEN
	update m_amenagement.an_amt_lot_stade set l_comm2='31',stade_amng='40',l_amng2 = '10' where idgeolf IN  (select idgeolf from m_foncier.lk_cession_lot where idces=new.idces);
	END IF;
	IF new.l_etat ='40'  THEN
	update m_amenagement.an_amt_lot_stade set l_comm2='20',stade_amng='40',l_amng2 = '10' where idgeolf IN  (select idgeolf from m_foncier.lk_cession_lot where idces=new.idces);
	END IF;
	IF new.l_etat ='50'  THEN
	update m_amenagement.an_amt_lot_stade set l_comm2='00' where idgeolf IN  (select idgeolf from m_foncier.lk_cession_lot where idces=new.idces);
	END IF;
	IF new.l_etat ='60'  THEN
	update m_amenagement.an_amt_lot_stade set l_comm2='00',stade_amng='30',l_amng2 = '10' where idgeolf IN  (select idgeolf from m_foncier.lk_cession_lot where idces=new.idces);
	END IF;
	IF new.l_etat ='99'  THEN
	update m_amenagement.an_amt_lot_stade set l_comm2='99',stade_amng='00',l_amng2 = '00' where idgeolf IN  (select idgeolf from m_foncier.lk_cession_lot where idces=new.idces);
	END IF;
	IF new.l_etat ='00' THEN
	update m_amenagement.an_amt_lot_stade set l_comm2='00',stade_amng='00',l_amng2 = '00' where idgeolf IN  (select idgeolf from m_foncier.lk_cession_lot where idces=new.idces);
	END IF;

	
     return new ;

END;

$BODY$;

ALTER FUNCTION m_foncier.ft_m_cess_nlot_update()
    OWNER TO create_sig;

GRANT EXECUTE ON FUNCTION m_foncier.ft_m_cess_nlot_update() TO PUBLIC;

GRANT EXECUTE ON FUNCTION m_foncier.ft_m_cess_nlot_update() TO create_sig;

COMMENT ON FUNCTION m_foncier.ft_m_cess_nlot_update()
    IS 'Fonction gérant la mise à jour des données des cessions foncières et la gestion des stades d''aménagement et de commercilaisation des lots en cas de cession vendu';

						 
-- Trigger: t_t3_cess_nlot on m_foncier.geo_v_cession
-- DROP TRIGGER t_t3_cess_nlot ON m_foncier.geo_v_cession;

CREATE TRIGGER t_t3_cess_nlot
  INSTEAD OF UPDATE
   ON m_foncier.geo_v_cession
  FOR EACH ROW
  EXECUTE PROCEDURE m_foncier.ft_m_cess_nlot_update();				  

				  
				  
-- ########################################################### SCHEMA m_economie #########################

-- ########################################################### Vue exploitant les mises à jour de SIRENE (ici établissement créé lors de la dernière mise à jour) #########################

-- View: m_economie.an_v_sa_etab_cree_majsirene

-- DROP VIEW m_economie.an_v_sa_etab_cree_majsirene;

CREATE OR REPLACE VIEW m_economie.an_v_sa_etab_cree_majsirene AS 
 WITH req_site AS (
         SELECT s_1.idsite,
            s_1.site_nom
           FROM m_economie.an_sa_site s_1
        ), req_etab AS (
         SELECT e_1.idsite,
            s_1.siret,
            "left"(s_1.siret::text, 9) AS siren,
            s_1.l1_nomen AS nom,
            e_1.l_nom AS complement_nom,
            s_1.enseigne AS complement_nom_1,
            s_1.l4_voie AS adresse,
            s_1.l6_post AS bp,
            s_1.libcom AS commune,
            s_1.apet700,
            s_1.libapet AS libapt700,
            e_1.eff_etab AS effectif,
            e_1.source_eff,
            e_1.annee_eff
           FROM s_sirene.an_etablissement s_1,
            m_economie.an_sa_etab e_1
          WHERE s_1.siret::text = e_1.idsiret::text AND s_1.dentree = '2018-12-01'::date
        )
 SELECT DISTINCT s.site_nom,
    e.siret,
    e.siren,
    e.nom,
    e.complement_nom,
    e.complement_nom_1,
    e.adresse,
    e.bp,
    e.commune,
    e.apet700,
    e.libapt700,
    e.effectif,
    e.source_eff,
    e.annee_eff
   FROM req_etab e
     LEFT JOIN req_site s ON e.idsite::text = s.idsite::text
  ORDER BY s.site_nom, e.commune;

ALTER TABLE m_economie.an_v_sa_etab_cree_majsirene
  OWNER TO sig_create;

COMMENT ON VIEW m_economie.an_v_sa_etab_cree_majsirene
  IS 'Vue alphanumérique gérant les établissements créés lors de la dernière mise à jour. Intégrées au traitement FME globale pour gérer la sortie du fichier Excel de synthèqe communiqué au service du développement économique';

-- ########################################################### Vue exploitant les mises à jour de SIRENE (ici établissement supprimé lors de la dernière mise à jour) #########################

-- View: m_economie.ft_m_an_v_sa_etab_sup_majsirene

-- DROP VIEW m_economie.ft_m_an_v_sa_etab_sup_majsirene;

CREATE OR REPLACE VIEW m_economie.ft_m_an_v_sa_etab_sup_majsirene AS 
 WITH req_site AS (
         SELECT s_1.idsite,
            s_1.site_nom
           FROM m_economie.an_sa_site s_1
        ), req_etab AS (
         SELECT e_1.idsite,
            s_1.siret,
            "left"(s_1.siret::text, 9) AS siren,
            s_1.l1_nomen AS nom,
            e_1.l_nom AS complement_nom,
            s_1.enseigne AS complement_nom_1,
            s_1.l4_voie AS adresse,
            s_1.l6_post AS bp,
            s_1.libcom AS commune,
            s_1.apet700,
            s_1.libapet AS libapt700,
            e_1.eff_etab AS effectif,
            e_1.eff_etab_d AS effectif_detail,
            e_1.source_eff,
            e_1.annee_eff,
            e_1.l_date_eff
           FROM s_sirene.an_etablissement s_1,
            m_economie.an_sa_etab e_1
          WHERE s_1.siret::text = e_1.idsiret::text AND s_1.dsortie = '2018-12-01'::date
        )
 SELECT DISTINCT s.site_nom,
    e.siret,
    e.siren,
    e.nom,
    e.complement_nom,
    e.complement_nom_1,
    e.adresse,
    e.bp,
    e.commune,
    e.apet700,
    e.libapt700,
    e.effectif,
    e.effectif_detail,
    e.source_eff,
    e.annee_eff,
    e.l_date_eff
   FROM req_etab e
     LEFT JOIN req_site s ON e.idsite::text = s.idsite::text
  ORDER BY s.site_nom, e.commune;

ALTER TABLE m_economie.ft_m_an_v_sa_etab_sup_majsirene
  OWNER TO sig_create;

COMMENT ON VIEW m_economie.ft_m_an_v_sa_etab_sup_majsirene
  IS 'Vue alphanumérique gérant les établissements supprimés lors de la dernière mise à jour. Intégrées au traitement FME globale pour gérer la sortie du fichier Excel de synthèqe communiqué au service du développement économique';


			  
-- ########################################################### Vue de gestion des lots à vocation économique #########################

-- View: m_economie.geo_v_lot_eco

-- DROP VIEW m_economie.geo_v_lot_eco;

CREATE OR REPLACE VIEW m_economie.geo_v_lot_eco AS 
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
    f.l_pers_v,
    s.etat_occup,
    f.surf,
    f.l_surf_l,
    f.date_sai AS date_sai_att,
    f.date_maj AS date_maj_att,
    f.date_int,
    f.op_sai AS op_sai_att,
    f.org_sai AS org_sai_att,
    f.l_tact,
    f.l_tact_99,
    f.l_cnom,
    f.l_lnom,
    f.l_occupant,
    f.l_pvente_e,
    f.l_pvente_e AS l_pvente,
    f.l_pvente_l,
    f.l_pcess_e AS l_pcess,
    f.l_pcess_l,
    f.l_eff_dep,
    f.l_eff_n5,
    f.l_conv,
    f.l_datefin_conv,
    f.l_observ,
    f.l_bati,
    f.l_pc_depot,
    f.l_pc_accord,
    f.l_pc_tra,
    f.l_pc_fin,
    f.l_pc_num,
    f.l_pc_mo,
    f.l_oripro,
    f.l_descrip,
    f.commune,
    o.geom
   FROM m_economie.an_sa_lot f,
    r_objet.geo_objet_fon_lot o,
    m_amenagement.an_amt_lot_stade s
  WHERE o.l_voca::text = '20'::text AND f.idgeolf = o.idgeolf AND o.idgeolf = s.idgeolf;

ALTER TABLE m_economie.geo_v_lot_eco
  OWNER TO sig_create;

COMMENT ON VIEW m_economie.geo_v_lot_eco
  IS 'Vue éditable des lots à vocation économique';

-- Trigger: t_t1_delete_lot_eco on m_economie.geo_v_lot_eco

-- DROP TRIGGER t_t1_delete_lot_eco ON m_economie.geo_v_lot_eco;

CREATE TRIGGER t_t1_delete_lot_eco
  INSTEAD OF DELETE
  ON m_economie.geo_v_lot_eco
  FOR EACH ROW
  EXECUTE PROCEDURE m_economie.ft_m_delete_lot_eco();
-- Function: m_economie.ft_m_delete_lot_eco()

-- DROP FUNCTION m_economie.ft_m_delete_lot_eco();

CREATE OR REPLACE FUNCTION m_economie.ft_m_delete_lot_eco()
  RETURNS trigger AS
$BODY$


BEGIN

    DELETE FROM m_foncier.an_cession WHERE idces=(SELECT lf.idces FROM m_foncier.an_cession f, m_foncier.lk_cession_lot lf WHERE f.idces=lf.idces AND lf.idgeolf=old.idgeolf);
    DELETE FROM m_foncier.lk_cession_lot WHERE idgeolf=old.idgeolf;
    DELETE FROM m_economie.an_sa_lot WHERE idgeolf=old.idgeolf;
    DELETE FROM r_objet.geo_objet_fon_lot WHERE idgeolf=old.idgeolf;
    DELETE FROM m_amenagement.an_amt_lot_stade WHERE idgeolf=old.idgeolf;
    return new ;

END;

$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
ALTER FUNCTION m_economie.ft_m_delete_lot_eco()
  OWNER TO sig_create;

COMMENT ON FUNCTION m_economie.ft_m_delete_lot_eco() IS 'Fonction gérant la suppression des données correspondant à la gestion des lots à vocation économique';

				 
-- Trigger: t_t2_insert_lot_eco on m_economie.geo_v_lot_eco

-- DROP TRIGGER t_t2_insert_lot_eco ON m_economie.geo_v_lot_eco;

CREATE TRIGGER t_t2_insert_lot_eco
  INSTEAD OF INSERT
  ON m_economie.geo_v_lot_eco
  FOR EACH ROW
  EXECUTE PROCEDURE m_economie.ft_m_insert_lot_eco();

-- Function: m_economie.ft_m_insert_lot_eco()

-- DROP FUNCTION m_economie.ft_m_insert_lot_eco();

CREATE OR REPLACE FUNCTION m_economie.ft_m_insert_lot_eco()
  RETURNS trigger AS
$BODY$

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
								st_intersects(geo_objet_ope.geom,ST_PointOnSurface(new.geom)) = true
								
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
    

						INSERT INTO m_economie.an_sa_lot SELECT v_idgeolf,
						 CASE WHEN new.idsite IS NULL or new.idsite = '' THEN
						 (
							SELECT DISTINCT
								idsite 
							FROM 
								r_objet.geo_objet_ope
							WHERE
								st_intersects(geo_objet_ope.geom,ST_PointOnSurface(new.geom)) = true
								
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
						  new.l_tact,
						  new.l_tact_99,
						  new.l_cnom,
						  new.l_lnom,
						  new.l_pvente_l,
						  new.l_pcess_l,
						  new.l_eff_dep,
						  new.l_eff_n5,
						  new.l_conv,
						  new.l_datefin_conv,
						  new.l_observ,
						  now(),
						  now(),
						  new.l_bati,
						  new.l_pc_depot,
						  new.l_pc_accord,
						  new.l_pc_tra,
						  new.l_pc_fin,
						  new.l_pvente_e,
						  new.l_pcess,
						  null,
						  null,
						  null,
						  null,
						  new.l_occupant,
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
								st_intersects(geo_objet_ope.geom,st_pointonsurface(new.geom)) = true
								
							)
						  ELSE
						  new.idsite
						  END
						,
							null
						);

-- mise à jour des appartenances des établissements à l'adresse dans la table lk_localsiret
INSERT INTO m_economie.lk_localsiret (idgeoloc,siret)
SELECT DISTINCT v_idgeolf,lk.siret FROM r_objet.geo_objet_fon_lot l , x_apps.xapps_geo_vmr_adresse a , m_economie.lk_adresseetablissement lk
WHERE st_intersects(new.geom,a.geom) AND new.l_voca='20' AND a.id_adresse = lk.idadresse;

     return new ;

END;

$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
ALTER FUNCTION m_economie.ft_m_insert_lot_eco()
  OWNER TO sig_create;

COMMENT ON FUNCTION m_economie.ft_m_insert_lot_eco() IS 'Fonction gérant la mise à jour des données correspondant à la gestion des lots à vocation économique';

				 
-- Trigger: t_t3_modif_lot_eco on m_economie.geo_v_lot_eco

-- DROP TRIGGER t_t3_modif_lot_eco ON m_economie.geo_v_lot_eco;

CREATE TRIGGER t_t3_modif_lot_eco
  INSTEAD OF UPDATE
  ON m_economie.geo_v_lot_eco
  FOR EACH ROW
  EXECUTE PROCEDURE m_economie.ft_m_modif_lot_eco();

-- Function: m_economie.ft_m_modif_lot_eco()

-- DROP FUNCTION m_economie.ft_m_modif_lot_eco();

CREATE OR REPLACE FUNCTION m_economie.ft_m_modif_lot_eco()
  RETURNS trigger AS
$BODY$

DECLARE DECLARE lot_surf integer;

BEGIN

--calcul de la surface de l'objet
lot_surf:=round(cast(st_area(new.geom) as numeric),0);

		UPDATE r_objet.geo_objet_fon_lot SET geom = new.geom, date_maj = now(), src_geom = new.ref_spa, op_sai=new.op_sai,l_nom = new.l_nom WHERE idgeolf = new.idgeolf;

		UPDATE m_amenagement.an_amt_lot_stade SET stade_amng = new.stade_amng, l_amng2 = new.l_amng2, stade_comm = new.stade_comm, l_comm2 = new.l_comm2, l_comm2_12 = new.l_comm2_12, etat_occup =  new.etat_occup WHERE idgeolf = new.idgeolf;

		UPDATE m_economie.an_sa_lot SET
							surf = new.surf,
							l_surf_l = 
								   CASE WHEN length(cast (new.surf as character varying)) >= 1 and length(cast (new.surf as character varying)) <= 3 THEN new.surf || 'm²'
								   WHEN length(cast (new.surf as character varying)) = 4 THEN replace(to_char(new.surf,'FM9G999'),',',' ') || 'm²'
								   WHEN length(cast (new.surf as character varying)) = 5 THEN replace(to_char(new.surf,'FM99G999'),',',' ') || 'm²'
								   WHEN length(cast (new.surf as character varying)) = 6 THEN replace(to_char(new.surf,'FM999G999'),',',' ') || 'm²'
								   WHEN length(cast (new.surf as character varying)) = 7 THEN replace(to_char(new.surf,'FM9G999G999'),',',' ') || 'm²'
								   WHEN length(cast (new.surf as character varying)) = 8 THEN replace(to_char(new.surf,'FM99G999G999'),',',' ') || 'm²'
								   END,
							date_maj = now(),
							op_sai = new.op_sai_att,
							org_sai = new.org_sai_att,
							l_tact = new.l_tact,
							l_tact_99 = new.l_tact_99,
							l_cnom = new.l_cnom,
							l_lnom = new.l_lnom,
							l_pvente_e = new.l_pvente_e,
							l_pvente_l = new.l_pvente_e || '€/m²',
							l_pcess_e = new.l_pcess,
							l_pcess_l = new.l_pcess || '€/m²',
							l_eff_dep = new.l_eff_dep,
							l_eff_n5 = new.l_eff_n5,
							l_conv = new.l_conv,
							l_datefin_conv = new.l_datefin_conv,
							l_observ = new.l_observ,
							l_bati = new.l_bati,
							l_pc_depot = new.l_pc_depot,
							l_pc_accord = new.l_pc_accord,
							l_pc_tra = new.l_pc_tra,
							l_pc_fin = new.l_pc_fin,
							l_pc_num=new.l_pc_num,
							l_pc_mo=new.l_pc_mo,
							l_pers_v=new.l_pers_v,
							l_oripro = new.l_oripro,
							l_occupant=new.l_occupant,
							l_descrip=new.l_descrip
		WHERE an_sa_lot.idgeolf=new.idgeolf;

	-- mise à jour des appartenances des établissements à l'adresse dans la table lk_localsiret
	-- si le lot ne contient pas d'adresse, ne supprime pas les relations du lot avec les établissements si non oui 


   
	IF 
		(SELECT count(*) FROM r_objet.geo_objet_fon_lot l , x_apps.xapps_geo_vmr_adresse a , m_economie.lk_adresseetablissement lk
		WHERE st_intersects(new.geom,a.geom) AND new.l_voca='20' AND a.id_adresse = lk.idadresse AND l.idgeolf = new.idgeolf) = 0
	THEN
		INSERT INTO m_economie.lk_localsiret (idgeoloc,siret)
		SELECT DISTINCT new.idgeolf,lk.siret FROM r_objet.geo_objet_fon_lot l , x_apps.xapps_geo_vmr_adresse a , m_economie.lk_adresseetablissement lk
		WHERE st_intersects(new.geom,a.geom) AND new.l_voca='20' AND a.id_adresse = lk.idadresse;
        ELSE
		DELETE FROM m_economie.lk_localsiret lk WHERE lk.idgeoloc = old.idgeolf;
		INSERT INTO m_economie.lk_localsiret (idgeoloc,siret)
		SELECT DISTINCT new.idgeolf,lk.siret FROM r_objet.geo_objet_fon_lot l , x_apps.xapps_geo_vmr_adresse a , m_economie.lk_adresseetablissement lk
		WHERE st_intersects(new.geom,a.geom) AND new.l_voca='20' AND a.id_adresse = lk.idadresse;
	END IF;


     return new;
END
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
ALTER FUNCTION m_economie.ft_m_modif_lot_eco()
  OWNER TO sig_create;


						 
-- Trigger: t_t5_etiquette_local_refresh on m_economie.geo_v_lot_eco

-- DROP TRIGGER t_t5_etiquette_local_refresh ON m_economie.geo_v_lot_eco;

CREATE TRIGGER t_t5_etiquette_local_refresh
  INSTEAD OF INSERT OR UPDATE OR DELETE
  ON m_economie.geo_v_lot_eco
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



										     
-- ########################################################### Vue de gestion des sites à vocation économique #########################

-- View: m_economie.geo_v_site_eco

-- DROP VIEW m_economie.geo_v_site_eco;

CREATE OR REPLACE VIEW m_economie.geo_v_site_eco AS 
 SELECT o.gid,
    o.idsite,
    sa.idpole,
    sa.site_voca,
    sa.site_nom,
    sa.site_etat,
    sa.zae,
    sa.date_sai AS date_sai_att,
    sa.date_maj AS date_maj_att,
    sa.date_int,
    sa.op_sai AS op_sai_att,
    sa.org_sai AS org_sai_att,
    sa.typo,
    sa.dest,
    sa.p_implant,
    sa.z_mai_ouvr,
    sa.z_compet,
    sa.z_amng,
    sa.z_gest,
    sa.z_anim,
    sa.z_comm,
    sa.contact,
    sa.z_cession,
    sa.z_env,
    sa.z_paysage,
    sa.z_rehab,
    sa.z_epu,
    sa.z_dechet,
    sa.z_tr_slect,
    sa.res_ass,
    sa.res_pluvia,
    sa.res_eau,
    sa.res_gaz,
    sa.res_elect,
    sa.res_net,
    sa.res_db_net,
    sa.z_auto,
    sa.z_dst_auto,
    sa.z_tps_auto,
    sa.z_ar_f,
    sa.z_dst_ar_f,
    sa.z_ar_v,
    sa.z_dst_ar_v,
    sa.z_fr_f,
    sa.z_dst_fr_f,
    sa.z_fr_v,
    sa.z_dst_fr_v,
    sa.d_paris,
    sa.d_lille,
    sa.t_paris,
    sa.t_lille,
    sa.l_dauto,
    sa.l_dtgvhp,
    sa.l_ttgvhp,
    sa.l_dtgvcdg,
    sa.l_ttgvcdg,
    sa.l_tgcomp,
    sa.l_dtille,
    sa.l_ttille,
    sa.l_dcdg,
    sa.l_tcdg,
    sa.l_dlesquin,
    sa.l_tlesquin,
    sa.z_pmm,
    sa.z_dst_pmm,
    sa.serv_tc,
    sa.circ_douce,
    sa.serv_rest,
    sa.serv_crech,
    sa.serv_autre,
    sa.serv_collt,
    sa.z_aide_pb,
    sa.l_dated_aide_pb,
    sa.l_datef_aide_pb,
    sa.l_cc_aep_lib,
    sa.l_cc_aep_nom,
    sa.l_cc_aep_poste,
    sa.l_cc_aep_tel,
    sa.l_cc_aep_telp,
    sa.l_cc_aep_mail,
    sa.l_cc_elect_lib,
    sa.l_cc_elect_nom,
    sa.l_cc_elect_poste,
    sa.l_cc_elect_tel,
    sa.l_cc_elect_telp,
    sa.l_cc_elect_mail,
    sa.l_cc_gaz_lib,
    sa.l_cc_gaz_nom,
    sa.l_cc_gaz_poste,
    sa.l_cc_gaz_tel,
    sa.l_cc_gaz_telp,
    sa.l_cc_gaz_mail,
    sa.l_cc_tel_lib,
    sa.l_cc_tel_nom,
    sa.l_cc_tel_poste,
    sa.l_cc_tel_tel,
    sa.l_cc_tel_telp,
    sa.l_cc_tel_mail,
    o.surf,
    o.geom
   FROM m_economie.an_sa_site sa,
    r_objet.geo_objet_site o
  WHERE sa.idsite::text = o.idsite::text;

ALTER TABLE m_economie.geo_v_site_eco
  OWNER TO sig_create;

COMMENT ON VIEW m_economie.geo_v_site_eco
  IS 'Vue éditable des sites à destination économique gérés (ZAE) ou non (hors ZAE) par l''ARC. Pour filtrer l''appartenance à une ZAE,utiliser le champ ZAE (true or false)';

-- Function: m_economie.ft_m_modif_site_eco()

-- DROP FUNCTION m_economie.ft_m_modif_site_eco();

CREATE OR REPLACE FUNCTION m_economie.ft_m_modif_site_eco()
  RETURNS trigger AS
$BODY$
BEGIN

UPDATE m_economie.an_sa_site SET
    idsite=new.idsite,  
    idpole = new.idpole, 
    site_voca = new.site_voca, 
    site_nom = new.site_nom, 
    site_etat = new.site_etat,  
    op_sai = new.op_sai_att, 
    org_sai = new.org_sai_att, 
    typo = new.typo, 
    dest = new.dest,
    p_implant = new.p_implant, 
    z_mai_ouvr = new.z_mai_ouvr, 
    z_compet = new.z_compet, 
    z_amng = new.z_amng, 
    z_gest = new.z_gest, 
    z_anim = new.z_anim, 
    z_comm = new.z_comm, 
    contact = new.contact, 
    z_cession = new.z_cession,
    z_env = new.z_env, 
    z_paysage = new.z_paysage, 
    z_rehab = new.z_rehab, 
    z_epu = new.z_epu, 
    z_dechet = new.z_dechet, 
    z_tr_slect = new.z_tr_slect, 
    d_paris=new.d_paris,
    d_lille=new.d_lille,
    t_paris=new.t_paris,
    t_lille=new.t_lille,
    l_dauto=new.l_dauto,
    l_dtgvhp=new.l_dtgvhp,
    l_ttgvhp=new.l_ttgvhp,
    l_dtgvcdg=new.l_dtgvcdg,
    l_ttgvcdg=new.l_ttgvcdg,
    l_tgcomp=new.l_tgcomp,
    l_dtille=new.l_dtille,
    l_ttille=new.l_ttille,
    l_dcdg=new.l_dcdg,
    l_tcdg=new.l_tcdg,
    l_dlesquin=new.l_dlesquin,
    l_tlesquin=new.l_tlesquin,
    res_ass = new.res_ass, 
    res_pluvia = new.res_pluvia, 
    res_eau = new.res_eau, 
    res_gaz = new.res_gaz, 
    res_elect = new.res_elect, 
    res_net = new.res_net, 
    res_db_net = new.res_db_net, 
    z_auto = new.z_auto, 
    z_dst_auto = new.z_dst_auto, 
    z_tps_auto = new.z_tps_auto, 
    z_ar_f = new.z_ar_f, 
    z_dst_ar_f = new.z_dst_ar_f, 
    z_ar_v = new.z_ar_v, 
    z_dst_ar_v = new.z_dst_ar_v, 
    z_fr_f = new.z_fr_f, 
    z_dst_fr_f = new.z_dst_fr_f, 
    z_fr_v = new.z_fr_v, 
    z_dst_fr_v = new.z_dst_fr_v, 
    z_pmm = new.z_pmm, 
    z_dst_pmm = new.z_dst_pmm, 
    serv_tc = new.serv_tc, 
    circ_douce = new.circ_douce, 
    serv_rest = new.serv_rest, 
    serv_crech = new.serv_crech, 
    serv_autre = new.serv_autre, 
    serv_collt = new.serv_collt, 
    z_aide_pb = new.z_aide_pb, 
    l_dated_aide_pb = new.l_dated_aide_pb, 
    l_datef_aide_pb = new.l_datef_aide_pb,
    l_cc_aep_lib = new.l_cc_aep_lib,
    l_cc_aep_nom = new.l_cc_aep_nom,
    l_cc_aep_poste = new.l_cc_aep_poste,
    l_cc_aep_tel = new.l_cc_aep_tel,
    l_cc_aep_telp = new.l_cc_aep_telp,
    l_cc_aep_mail = new.l_cc_aep_mail,
    l_cc_elect_lib = new.l_cc_elect_lib,
    l_cc_elect_nom = new.l_cc_elect_nom,
    l_cc_elect_poste = new.l_cc_elect_poste,
    l_cc_elect_tel = new.l_cc_elect_tel,
    l_cc_elect_telp = new.l_cc_elect_telp,
    l_cc_elect_mail = new.l_cc_elect_mail,
    l_cc_gaz_lib = new.l_cc_gaz_lib,
    l_cc_gaz_nom = new.l_cc_gaz_nom,
    l_cc_gaz_poste = new.l_cc_gaz_poste,
    l_cc_gaz_tel = new.l_cc_gaz_tel,
    l_cc_gaz_telp = new.l_cc_gaz_telp,
    l_cc_gaz_mail = new.l_cc_gaz_mail,
    l_cc_tel_lib = new.l_cc_tel_lib,
    l_cc_tel_nom = new.l_cc_tel_nom,
    l_cc_tel_poste = new.l_cc_tel_poste,
    l_cc_tel_tel = new.l_cc_tel_tel,
    l_cc_tel_telp = new.l_cc_tel_telp,
    l_cc_tel_mail = new.l_cc_tel_mail,
    zae = new.zae,
    date_maj = now()
  WHERE an_sa_site.idsite = new.idsite;

     return new;
END
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
ALTER FUNCTION m_economie.ft_m_modif_site_eco()
  OWNER TO sig_create;

										     
-- Trigger: modif_site_eco on m_economie.geo_v_site_eco

-- DROP TRIGGER modif_site_eco ON m_economie.geo_v_site_eco;

CREATE TRIGGER t_t1_modif_site_eco
  INSTEAD OF UPDATE
  ON m_economie.geo_v_site_eco
  FOR EACH ROW
  EXECUTE PROCEDURE m_economie.ft_m_modif_site_eco();


-- ########################################################### SCHEMA m_amenagement #########################

-- ########################################################### Vue de visualisation des espaces publics #########################

-- View: m_amenagement.geo_v_empesp_pu

-- DROP VIEW m_amenagement.geo_v_empesp_pu;

CREATE OR REPLACE VIEW m_amenagement.geo_v_empesp_pu AS 
 SELECT o.idgeopu,
    ep.idsite,
    ep.date_sai AS date_sai_att,
    ep.date_maj AS date_maj_att,
    ep.date_int,
    ep.op_sai AS op_sai_att,
    ep.org_sai AS org_sai_att,
    ep.vocaep,
    o.geom
   FROM m_amenagement.an_amt_esppu ep,
    r_objet.geo_objet_empesp_pu o
  WHERE ep.idgeopu = o.idgeopu;

ALTER TABLE m_amenagement.geo_v_empesp_pu
  OWNER TO sig_create;

COMMENT ON VIEW m_amenagement.geo_v_empesp_pu
  IS 'Vue géographique des emprises des espaces publics sur les sites (en faire une vue éditable)';

										     
-- ########################################################### Vue de gestion des lots à vocation divers #########################
										     
-- View: m_amenagement.geo_v_lot_divers

-- DROP VIEW m_amenagement.geo_v_lot_divers;

CREATE OR REPLACE VIEW m_amenagement.geo_v_lot_divers AS 
 SELECT o.idgeolf,
    s.stade_amng,
    s.l_amng2,
    s.stade_comm,
    s.l_comm2,
    s.l_comm2_12,
    s.etat_occup,
    d.date_sai,
    d.date_maj,
    d.op_sai,
    d.org_sai,
    o.src_geom AS ref_spa,
    d.surf,
    d.l_surf_l,
    o.l_voca,
    d.l_nom,
    o.l_nom AS l_nom_lot,
    d.l_phase,
    o.geom
   FROM r_objet.geo_objet_fon_lot o,
    m_amenagement.an_amt_lot_divers d,
    m_amenagement.an_amt_lot_stade s
  WHERE d.idgeolf = o.idgeolf AND o.l_voca::text = '40'::text AND o.idgeolf = s.idgeolf;

ALTER TABLE m_amenagement.geo_v_lot_divers
  OWNER TO sig_create;

COMMENT ON VIEW m_amenagement.geo_v_lot_divers
  IS 'Vue éditable géographique des lots à vocation divers';

-- Function: m_amenagement.ft_m_delete_lot_divers()

-- DROP FUNCTION m_amenagement.ft_m_delete_lot_divers();

CREATE OR REPLACE FUNCTION m_amenagement.ft_m_delete_lot_divers()
  RETURNS trigger AS
$BODY$


BEGIN

    DELETE FROM m_foncier.an_cession WHERE idces=(SELECT lf.idces FROM m_foncier.an_cession f, m_foncier.lk_cession_lot lf WHERE f.idces=lf.idces AND lf.idgeolf=old.idgeolf);
    DELETE FROM m_foncier.lk_cession_lot WHERE idgeolf=old.idgeolf;
    DELETE FROM m_amenagement.an_amt_lot_divers WHERE idgeolf=old.idgeolf;
    DELETE FROM m_amenagement.an_amt_lot_stade WHERE idgeolf=old.idgeolf;
    DELETE FROM r_objet.geo_objet_fon_lot WHERE idgeolf=old.idgeolf;
    return new ;

END;

$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
ALTER FUNCTION m_amenagement.ft_m_delete_lot_divers()
  OWNER TO sig_create;

COMMENT ON FUNCTION m_amenagement.ft_m_delete_lot_divers() IS 'Fonction gérant la suppression des données liées aux lots à vocation divers lors de la suppression de l''objet';
									     
										     
-- Trigger: t_t1_delete_lot_divers on m_amenagement.geo_v_lot_divers

-- DROP TRIGGER t_t1_delete_lot_divers ON m_amenagement.geo_v_lot_divers;

CREATE TRIGGER t_t1_delete_lot_divers
  INSTEAD OF DELETE
  ON m_amenagement.geo_v_lot_divers
  FOR EACH ROW
  EXECUTE PROCEDURE m_amenagement.ft_m_delete_lot_divers();
	     
-- Function: m_amenagement.ft_m_insert_lot_divers()

-- DROP FUNCTION m_amenagement.ft_m_insert_lot_divers();

CREATE OR REPLACE FUNCTION m_amenagement.ft_m_insert_lot_divers()
  RETURNS trigger AS
$BODY$

DECLARE v_idces integer;
DECLARE v_idgeolf integer;
DECLARE lot_surf integer;

BEGIN

     v_idgeolf := (SELECT nextval('idgeo_seq'::regclass));

     INSERT INTO r_objet.geo_objet_fon_lot SELECT v_idgeolf,new.op_sai,new.ref_spa,null,'40',new.geom,null,null,new.l_nom_lot;

     INSERT INTO m_amenagement.an_amt_lot_stade SELECT v_idgeolf,
						 (
							SELECT DISTINCT
								idsite 
							FROM 
								r_objet.geo_objet_ope
							WHERE
								st_intersects(geo_objet_ope.geom,ST_PointOnSurface(new.geom)) = true
								
						  ),
						  new.stade_amng,
						  new.l_amng2,
						  new.stade_comm,
						  new.l_comm2,
						  new.l_comm2_12,
						  new.etat_occup;

     lot_surf:=round(cast(st_area(new.geom) as numeric),0);

    -- insertion des lots uniquements mixte 
    -- recherche si le lot dessiner est dans un site : si oui copie une ligne dans le métier site et foncier, si non copie uniquement dans le métier foncier
    

						INSERT INTO m_amenagement.an_amt_lot_divers SELECT v_idgeolf,
							(
							SELECT DISTINCT
								idsite 
							FROM 
								r_objet.geo_objet_ope
							WHERE
								st_intersects(geo_objet_ope.geom,new.geom) = true
								
							),-- recherche auto de l'IDSITE
							new.op_sai,
							new.org_sai,
							new.l_nom,
							lot_surf,
							now(),
							null,
							new.l_phase,
							CASE WHEN length(cast (lot_surf as character varying)) >= 1 and length(cast (lot_surf as character varying)) <= 3 THEN lot_surf || 'm²'
								   WHEN length(cast (lot_surf as character varying)) = 4 THEN replace(to_char(lot_surf,'FM9G999'),',',' ') || 'm²'
								   WHEN length(cast (lot_surf as character varying)) = 5 THEN replace(to_char(lot_surf,'FM99G999'),',',' ') || 'm²'
								   WHEN length(cast (lot_surf as character varying)) = 6 THEN replace(to_char(lot_surf,'FM999G999'),',',' ') || 'm²'
								   WHEN length(cast (lot_surf as character varying)) = 7 THEN replace(to_char(lot_surf,'FM9G999G999'),',',' ') || 'm²'
								   WHEN length(cast (lot_surf as character varying)) = 8 THEN replace(to_char(lot_surf,'FM99G999G999'),',',' ') || 'm²'
								   END
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
								st_intersects(geo_objet_ope.geom,st_pointonsurface(new.geom)) = true
								
							),
							null
						);

     return new ;

END;

$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
ALTER FUNCTION m_amenagement.ft_m_insert_lot_divers()
  OWNER TO sig_create;

COMMENT ON FUNCTION m_amenagement.ft_m_insert_lot_divers() IS 'Fonction gérant l''insertion des données liées aux lots à vocation divers lors de l''insertion de l''objet';

						 
-- Trigger: t_t2_insert_lot_divers on m_amenagement.geo_v_lot_divers

-- DROP TRIGGER t_t2_insert_lot_divers ON m_amenagement.geo_v_lot_divers;

CREATE TRIGGER t_t2_insert_lot_divers
  INSTEAD OF INSERT
  ON m_amenagement.geo_v_lot_divers
  FOR EACH ROW
  EXECUTE PROCEDURE m_amenagement.ft_m_insert_lot_divers();

						 
-- Function: m_amenagement.ft_m_modif_lot_divers()

-- DROP FUNCTION m_amenagement.ft_m_modif_lot_divers();

CREATE OR REPLACE FUNCTION m_amenagement.ft_m_modif_lot_divers()
  RETURNS trigger AS
$BODY$

DECLARE DECLARE lot_surf integer;

BEGIN

--calcul de la surface de l'objet
lot_surf:=round(cast(st_area(new.geom) as numeric),0);

		UPDATE r_objet.geo_objet_fon_lot SET geom = new.geom, date_maj = now(), src_geom = new.ref_spa, op_sai=new.op_sai,l_nom = new.l_nom_lot WHERE idgeolf = new.idgeolf;

	        UPDATE m_amenagement.an_amt_lot_stade SET stade_amng = new.stade_amng, l_amng2 = new.l_amng2, stade_comm = new.stade_comm, l_comm2 = new.l_comm2, l_comm2_12 = new.l_comm2_12, etat_occup =  new.etat_occup WHERE idgeolf = new.idgeolf;

		UPDATE m_amenagement.an_amt_lot_divers SET

							surf = new.surf,
							l_surf_l = 
							CASE WHEN length(cast (new.surf as character varying)) >= 1 and length(cast (new.surf as character varying)) <= 3 THEN new.surf || 'm²'
								   WHEN length(cast (new.surf as character varying)) = 4 THEN replace(to_char(new.surf,'FM9G999'),',',' ') || 'm²'
								   WHEN length(cast (new.surf as character varying)) = 5 THEN replace(to_char(new.surf,'FM99G999'),',',' ') || 'm²'
								   WHEN length(cast (new.surf as character varying)) = 6 THEN replace(to_char(new.surf,'FM999G999'),',',' ') || 'm²'
								   WHEN length(cast (new.surf as character varying)) = 7 THEN replace(to_char(new.surf,'FM9G999G999'),',',' ') || 'm²'
								   WHEN length(cast (new.surf as character varying)) = 8 THEN replace(to_char(new.surf,'FM99G999G999'),',',' ') || 'm²'
								   END,
							op_sai = new.op_sai,
							org_sai = new.org_sai,
							l_nom = new.l_nom,
							date_maj = now(),
							l_phase = new.l_phase
		WHERE an_amt_lot_divers.idgeolf=new.idgeolf;

     return new;
END
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
ALTER FUNCTION m_amenagement.ft_m_modif_lot_divers()
  OWNER TO sig_create;

COMMENT ON FUNCTION m_amenagement.ft_m_modif_lot_divers() IS 'Fonction gérant la mise à jour des données liées aux lots à vocation divers lors de la mise à jour de l''objet';
						 
						 
-- Trigger: t_t3_modif_lot_divers on m_amenagement.geo_v_lot_divers

-- DROP TRIGGER t_t3_modif_lot_divers ON m_amenagement.geo_v_lot_divers;

CREATE TRIGGER t_t3_modif_lot_divers
  INSTEAD OF UPDATE
  ON m_amenagement.geo_v_lot_divers
  FOR EACH ROW
  EXECUTE PROCEDURE m_amenagement.ft_m_modif_lot_divers();

-- ########################################################### Vue de gestion des lots à vocation équipement #########################

-- View: m_amenagement.geo_v_lot_equ

-- DROP VIEW m_amenagement.geo_v_lot_equ;

CREATE OR REPLACE VIEW m_amenagement.geo_v_lot_equ AS 
 SELECT o.idgeolf,
    s.stade_amng,
    s.l_amng2,
    s.stade_comm,
    s.l_comm2,
    s.l_comm2_12,
    s.etat_occup,
    eu.date_sai,
    eu.date_maj,
    eu.op_sai,
    eu.org_sai,
    o.src_geom AS ref_spa,
    eu.surf,
    eu.l_surf_l,
    o.l_voca,
    eu.l_nom,
    o.l_nom AS l_nom_lot,
    eu.l_phase,
    o.geom
   FROM r_objet.geo_objet_fon_lot o,
    m_amenagement.an_amt_lot_equ eu,
    m_amenagement.an_amt_lot_stade s
  WHERE eu.idgeolf = o.idgeolf AND o.l_voca::text = '10'::text AND o.idgeolf = s.idgeolf;

ALTER TABLE m_amenagement.geo_v_lot_equ
  OWNER TO sig_create;

COMMENT ON VIEW m_amenagement.geo_v_lot_equ
  IS 'Vue éditable géographique des lots à vocation d''équipement';

-- Function: m_amenagement.ft_m_delete_lot_equ()

-- DROP FUNCTION m_amenagement.ft_m_delete_lot_equ();

CREATE OR REPLACE FUNCTION m_amenagement.ft_m_delete_lot_equ()
  RETURNS trigger AS
$BODY$


BEGIN

    DELETE FROM m_foncier.an_cession WHERE idces=(SELECT lf.idces FROM m_foncier.an_cession f, m_foncier.lk_cession_lot lf WHERE f.idces=lf.idces AND lf.idgeolf=old.idgeolf);
    DELETE FROM m_foncier.lk_cession_lot WHERE idgeolf=old.idgeolf;
    DELETE FROM m_amenagement.an_amt_lot_equ WHERE idgeolf=old.idgeolf;
    DELETE FROM m_amenagement.an_amt_lot_stade WHERE idgeolf=old.idgeolf;
    DELETE FROM r_objet.geo_objet_fon_lot WHERE idgeolf=old.idgeolf;
    return new ;

END;

$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
ALTER FUNCTION m_amenagement.ft_m_delete_lot_equ()
  OWNER TO sig_create;

COMMENT ON FUNCTION m_amenagement.ft_m_delete_lot_equ() IS 'Fonction gérant la suppression des données liées aux lots à vocation équipement lors de la suppression de l''objet';

										     
-- Trigger: t_t1_delete_lot_equ on m_amenagement.geo_v_lot_equ

-- DROP TRIGGER t_t1_delete_lot_equ ON m_amenagement.geo_v_lot_equ;

CREATE TRIGGER t_t1_delete_lot_equ
  INSTEAD OF DELETE
  ON m_amenagement.geo_v_lot_equ
  FOR EACH ROW
  EXECUTE PROCEDURE m_amenagement.ft_m_delete_lot_equ();


-- Function: m_amenagement.ft_m_insert_lot_equ()

-- DROP FUNCTION m_amenagement.ft_m_insert_lot_equ();

CREATE OR REPLACE FUNCTION m_amenagement.ft_m_insert_lot_equ()
  RETURNS trigger AS
$BODY$

DECLARE v_idces integer;
DECLARE v_idgeolf integer;
DECLARE lot_surf integer;

BEGIN

     v_idgeolf := (SELECT nextval('idgeo_seq'::regclass));

     INSERT INTO r_objet.geo_objet_fon_lot SELECT v_idgeolf,new.op_sai,new.ref_spa,null,'10',new.geom,null,null,new.l_nom_lot;

     INSERT INTO m_amenagement.an_amt_lot_stade SELECT v_idgeolf,
						 CASE WHEN new.idsite IS NULL or new.idsite = '' THEN
						 (
							SELECT DISTINCT
								idsite 
							FROM 
								r_objet.geo_objet_ope
							WHERE
								st_intersects(geo_objet_ope.geom,ST_PointOnSurface(new.geom)) = true
								
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

    -- insertion des lots uniquements mixte 
    -- recherche si le lot dessiner est dans un site : si oui copie une ligne dans le métier site et foncier, si non copie uniquement dans le métier foncier
    

						INSERT INTO m_amenagement.an_amt_lot_equ SELECT v_idgeolf,
							CASE WHEN new.idsite IS NULL or new.idsite = '' THEN
							(
							SELECT DISTINCT
								idsite 
							FROM 
								r_objet.geo_objet_ope
							WHERE
								st_intersects(geo_objet_ope.geom,new.geom) = true
								
							)
							ELSE
							new.idsite
							END
							,-- recherche auto de l'IDSITE
							new.op_sai,
							new.org_sai,
							new.l_nom,
							lot_surf,
							now(),
							null,
							new.l_phase,
							CASE WHEN length(cast (lot_surf as character varying)) >= 1 and length(cast (lot_surf as character varying)) <= 3 THEN lot_surf || 'm²'
								   WHEN length(cast (lot_surf as character varying)) = 4 THEN replace(to_char(lot_surf,'FM9G999'),',',' ') || 'm²'
								   WHEN length(cast (lot_surf as character varying)) = 5 THEN replace(to_char(lot_surf,'FM99G999'),',',' ') || 'm²'
								   WHEN length(cast (lot_surf as character varying)) = 6 THEN replace(to_char(lot_surf,'FM999G999'),',',' ') || 'm²'
								   WHEN length(cast (lot_surf as character varying)) = 7 THEN replace(to_char(lot_surf,'FM9G999G999'),',',' ') || 'm²'
								   WHEN length(cast (lot_surf as character varying)) = 8 THEN replace(to_char(lot_surf,'FM99G999G999'),',',' ') || 'm²'
								   END
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
						CASE WHEN new.idsite IS NULL or new.idsite = '' THEN
						(SELECT DISTINCT
								idsite 
							FROM 
								r_objet.geo_objet_ope
							WHERE
								st_intersects(geo_objet_ope.geom,st_pointonsurface(new.geom)) = true
								
							)
						  ELSE
						  new.idsite
						  END

							,
							null
						);

     return new ;

END;

$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
ALTER FUNCTION m_amenagement.ft_m_insert_lot_equ()
  OWNER TO sig_create;

COMMENT ON FUNCTION m_amenagement.ft_m_insert_lot_equ() IS 'Fonction gérant l''insertion des données liées aux lots à vocation équipement lors de l''insertion de l''objet';

-- Trigger: t_t2_insert_lot_equ on m_amenagement.geo_v_lot_equ

-- DROP TRIGGER t_t2_insert_lot_equ ON m_amenagement.geo_v_lot_equ;

CREATE TRIGGER t_t2_insert_lot_equ
  INSTEAD OF INSERT
  ON m_amenagement.geo_v_lot_equ
  FOR EACH ROW
  EXECUTE PROCEDURE m_amenagement.ft_m_insert_lot_equ();

						 
-- Function: m_amenagement.ft_m_modif_lot_equ()

-- DROP FUNCTION m_amenagement.ft_m_modif_lot_equ();

CREATE OR REPLACE FUNCTION m_amenagement.ft_m_modif_lot_equ()
  RETURNS trigger AS
$BODY$

DECLARE DECLARE lot_surf integer;

BEGIN

--calcul de la surface de l'objet
lot_surf:=round(cast(st_area(new.geom) as numeric),0);


		UPDATE r_objet.geo_objet_fon_lot SET geom = new.geom, date_maj = now(), src_geom = new.ref_spa, op_sai=new.op_sai,l_nom = new.l_nom_lot WHERE idgeolf = new.idgeolf;

	        UPDATE m_amenagement.an_amt_lot_stade SET stade_amng = new.stade_amng, l_amng2 = new.l_amng2, stade_comm = new.stade_comm, l_comm2 = new.l_comm2, l_comm2_12 = new.l_comm2_12, etat_occup =  new.etat_occup WHERE idgeolf = new.idgeolf;

		UPDATE m_amenagement.an_amt_lot_equ SET

							surf = new.surf,
							l_surf_l = 
							CASE WHEN length(cast (new.surf as character varying)) >= 1 and length(cast (new.surf as character varying)) <= 3 THEN new.surf || 'm²'
								   WHEN length(cast (new.surf as character varying)) = 4 THEN replace(to_char(new.surf,'FM9G999'),',',' ') || 'm²'
								   WHEN length(cast (new.surf as character varying)) = 5 THEN replace(to_char(new.surf,'FM99G999'),',',' ') || 'm²'
								   WHEN length(cast (new.surf as character varying)) = 6 THEN replace(to_char(new.surf,'FM999G999'),',',' ') || 'm²'
								   WHEN length(cast (new.surf as character varying)) = 7 THEN replace(to_char(new.surf,'FM9G999G999'),',',' ') || 'm²'
								   WHEN length(cast (new.surf as character varying)) = 8 THEN replace(to_char(new.surf,'FM99G999G999'),',',' ') || 'm²'
								   END,
							op_sai = new.op_sai,
							org_sai = new.org_sai,
							l_nom = new.l_nom,
							date_maj = now(),
							l_phase = new.l_phase
		WHERE an_amt_lot_equ.idgeolf=new.idgeolf;

     return new;
END
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
ALTER FUNCTION m_amenagement.ft_m_modif_lot_equ()
  OWNER TO sig_create;

COMMENT ON FUNCTION m_amenagement.ft_m_modif_lot_equ() IS 'Fonction gérant la mise à jour des données liées aux lots à vocation équipement lors de la mise à jour de l''objet';
				 
						 
-- Trigger: t_t3_modif_lot_equ on m_amenagement.geo_v_lot_equ

-- DROP TRIGGER t_t3_modif_lot_equ ON m_amenagement.geo_v_lot_equ;

CREATE TRIGGER t_t3_modif_lot_equ
  INSTEAD OF UPDATE
  ON m_amenagement.geo_v_lot_equ
  FOR EACH ROW
  EXECUTE PROCEDURE m_amenagement.ft_m_modif_lot_equ();

-- ########################################################### Vue de gestion des lots à vocation espace public #########################

-- View: m_amenagement.geo_v_lot_esppu

-- DROP VIEW m_amenagement.geo_v_lot_esppu;

CREATE OR REPLACE VIEW m_amenagement.geo_v_lot_esppu AS 
 SELECT o.idgeolf,
    s.stade_amng,
    s.l_amng2,
    s.stade_comm,
    s.l_comm2,
    s.l_comm2_12,
    s.etat_occup,
    o.src_geom AS ref_spa,
    o.op_sai,
    o.l_voca,
    o.l_nom AS l_nom_lot,
    o.geom
   FROM r_objet.geo_objet_fon_lot o,
    m_amenagement.an_amt_lot_stade s
  WHERE o.idgeolf = s.idgeolf AND o.l_voca::text = '50'::text;

ALTER TABLE m_amenagement.geo_v_lot_esppu
  OWNER TO sig_create;

COMMENT ON VIEW m_amenagement.geo_v_lot_esppu
  IS 'Vue éditable géographique des lots dont la vocation est un espace public';

										     
-- Function: m_amenagement.ft_m_delete_lot_esppu()

-- DROP FUNCTION m_amenagement.ft_m_delete_lot_esppu();

CREATE OR REPLACE FUNCTION m_amenagement.ft_m_delete_lot_esppu()
  RETURNS trigger AS
$BODY$


BEGIN

    DELETE FROM m_foncier.an_cession WHERE idces=(SELECT lf.idces FROM m_foncier.an_cession f, m_foncier.lk_cession_lot lf WHERE f.idces=lf.idces AND lf.idgeolf=old.idgeolf);
    DELETE FROM m_foncier.lk_cession_lot WHERE idgeolf=old.idgeolf;
    DELETE FROM m_amenagement.an_amt_lot_stade WHERE idgeolf=old.idgeolf;
    DELETE FROM r_objet.geo_objet_fon_lot WHERE idgeolf=old.idgeolf;
    return new ;

END;

$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
ALTER FUNCTION m_amenagement.ft_m_delete_lot_esppu()
  OWNER TO sig_create;

COMMENT ON FUNCTION m_amenagement.ft_m_delete_lot_esppu() IS 'Fonction gérant la suppression des données liées aux lots à vocation espace public lors de la suppression de l''objet';
					     
										     
-- Trigger: t_t1_delete_lot_esppu on m_amenagement.geo_v_lot_esppu

-- DROP TRIGGER t_t1_delete_lot_esppu ON m_amenagement.geo_v_lot_esppu;

CREATE TRIGGER t_t1_delete_lot_esppu
  INSTEAD OF DELETE
  ON m_amenagement.geo_v_lot_esppu
  FOR EACH ROW
  EXECUTE PROCEDURE m_amenagement.ft_m_delete_lot_esppu();

-- Function: m_amenagement.ft_insert_lot_esppu()

-- DROP FUNCTION m_amenagement.ft_insert_lot_esppu();

CREATE OR REPLACE FUNCTION m_amenagement.ft_m_insert_lot_esppu()
  RETURNS trigger AS
$BODY$

DECLARE v_idces integer;
DECLARE v_idgeolf integer;
DECLARE lot_surf integer;

BEGIN

     v_idgeolf := (SELECT nextval('idgeo_seq'::regclass));

     INSERT INTO r_objet.geo_objet_fon_lot SELECT v_idgeolf,new.op_sai,new.ref_spa,null,'50',new.geom,null,null,new.l_nom_lot;

     INSERT INTO m_amenagement.an_amt_lot_stade SELECT v_idgeolf,
						 (
							SELECT DISTINCT
								idsite 
							FROM 
								r_objet.geo_objet_ope
							WHERE
								st_intersects(geo_objet_ope.geom,ST_PointOnSurface(new.geom)) = true
								
						  ),
						  new.stade_amng,
						  new.l_amng2,
						  new.stade_comm,
						  new.l_comm2,
						  new.l_comm2_12,
						  new.etat_occup;

     
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
								st_intersects(geo_objet_ope.geom,st_pointonsurface(new.geom)) = true
								
							),
							null
						);

     return new ;

END;

$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
ALTER FUNCTION m_amenagement.ft_m_insert_lot_esppu()
  OWNER TO sig_create;

COMMENT ON FUNCTION m_amenagement.ft_m_insert_lot_esppu() IS 'Fonction gérant l''insertion des données liées aux lots à vocation espace public lors de l''insertion de l''objet';

										     
										     
-- Trigger: t_t2_insert_lot_esppu on m_amenagement.geo_v_lot_esppu

-- DROP TRIGGER t_t2_insert_lot_esppu ON m_amenagement.geo_v_lot_esppu;

CREATE TRIGGER t_t2_insert_lot_esppu
  INSTEAD OF INSERT
  ON m_amenagement.geo_v_lot_esppu
  FOR EACH ROW
  EXECUTE PROCEDURE m_amenagement.ft_m_insert_lot_esppu();

-- Function: m_amenagement.ft_modif_lot_esppu()

-- DROP FUNCTION m_amenagement.ft_modif_lot_esppu();

CREATE OR REPLACE FUNCTION m_amenagement.ft_m_modif_lot_esppu()
  RETURNS trigger AS
$BODY$

BEGIN

		UPDATE r_objet.geo_objet_fon_lot SET geom = new.geom, date_maj = now(), src_geom = new.ref_spa, op_sai=new.op_sai,l_nom=new.l_nom_lot WHERE idgeolf = new.idgeolf;

	        UPDATE m_amenagement.an_amt_lot_stade SET stade_amng = new.stade_amng, l_amng2 = new.l_amng2, stade_comm = new.stade_comm, l_comm2 = new.l_comm2, l_comm2_12 = new.l_comm2_12, etat_occup =  new.etat_occup WHERE idgeolf = new.idgeolf;

		

     return new;
END
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
ALTER FUNCTION m_amenagement.ft_m_modif_lot_esppu()
  OWNER TO sig_create;

COMMENT ON FUNCTION m_amenagement.ft_m_modif_lot_esppu() IS 'Fonction gérant la mise à jour des données liées aux lots à vocation espace public lors de la mise à jour de l''objet';
						 
						 
-- Trigger: t_t3_modif_lot_esppu on m_amenagement.geo_v_lot_esppu

-- DROP TRIGGER t_t3_modif_lot_esppu ON m_amenagement.geo_v_lot_esppu;

CREATE TRIGGER t_t3_modif_lot_esppu
  INSTEAD OF UPDATE
  ON m_amenagement.geo_v_lot_esppu
  FOR EACH ROW
  EXECUTE PROCEDURE m_amenagement.ft_m_modif_lot_esppu();

						 
-- ########################################################### Vue de gestion des lots à vocation habitat #########################
				 
-- View: m_amenagement.geo_v_lot_hab

-- DROP VIEW m_amenagement.geo_v_lot_hab;

CREATE OR REPLACE VIEW m_amenagement.geo_v_lot_hab AS 
 SELECT o.idgeolf,
    o.src_geom AS ref_spa,
    o.op_sai,
    o.l_voca,
    o.l_nom,
    f.idsite,
    s.stade_amng,
    s.l_amng2,
    s.stade_comm,
    s.l_comm2,
    s.l_comm2_12,
    s.etat_occup,
    f.surf,
    f.l_surf_l,
    f.date_sai AS date_sai_att,
    f.date_maj AS date_maj_att,
    f.op_sai AS op_sai_att,
    f.org_sai AS org_sai_att,
    f.l_pvente,
    f.l_pvente_l,
    f.l_pvente_lot,
    f.nb_log,
    f.nb_logind,
    f.nb_logindgr,
    f.nb_logcol,
    f.nb_logaide,
    f.nb_log_r,
    f.nb_logind_r,
    f.nb_logindgr_r,
    f.nb_logcol_r,
    f.nb_logaide_r,
    f.l_observ,
    f.l_phase,
    f.nb_logaide_loc_r,
    f.nb_logaide_acc_r,
    o.geom
   FROM m_amenagement.an_amt_lot_hab f,
    r_objet.geo_objet_fon_lot o,
    m_amenagement.an_amt_lot_stade s
  WHERE o.l_voca::text = '30'::text AND f.idgeolf = o.idgeolf AND f.idgeolf = s.idgeolf;

ALTER TABLE m_amenagement.geo_v_lot_hab
  OWNER TO sig_create;

COMMENT ON VIEW m_amenagement.geo_v_lot_hab
  IS 'Vue éditable des lots à vocation habitat';


-- Function: m_amenagement.ft_m_delete_lot_hab()

-- DROP FUNCTION m_amenagement.ft_m_delete_lot_hab();

CREATE OR REPLACE FUNCTION m_amenagement.ft_m_delete_lot_hab()
  RETURNS trigger AS
$BODY$


BEGIN

    DELETE FROM m_foncier.an_cession WHERE idces=(SELECT lf.idces FROM m_foncier.an_cession f, m_foncier.lk_cession_lot lf WHERE f.idces=lf.idces AND lf.idgeolf=old.idgeolf);
    DELETE FROM m_foncier.lk_cession_lot WHERE idgeolf=old.idgeolf;
    DELETE FROM m_amenagement.an_amt_lot_hab WHERE idgeolf=old.idgeolf;
    DELETE FROM m_amenagement.an_amt_lot_stade WHERE idgeolf=old.idgeolf;
    DELETE FROM r_objet.geo_objet_fon_lot WHERE idgeolf=old.idgeolf;
    return new ;

END;

$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
ALTER FUNCTION m_amenagement.ft_m_delete_lot_hab()
  OWNER TO sig_create;

COMMENT ON FUNCTION m_amenagement.ft_m_delete_lot_hab() IS 'Fonction gérant la suppression des données liées aux lots à vocation habitat lors de la suppression de l''objet';

						 
-- Trigger: t_t1_delete_lot_hab on m_amenagement.geo_v_lot_hab

-- DROP TRIGGER t_t1_delete_lot_hab ON m_amenagement.geo_v_lot_hab;

CREATE TRIGGER t_t1_delete_lot_hab
  INSTEAD OF DELETE
  ON m_amenagement.geo_v_lot_hab
  FOR EACH ROW
  EXECUTE PROCEDURE m_amenagement.ft_m_delete_lot_hab();

						 
-- Function: m_amenagement.ft_m_insert_lot_hab()

-- DROP FUNCTION m_amenagement.ft_m_insert_lot_hab();

CREATE OR REPLACE FUNCTION m_amenagement.ft_m_insert_lot_hab()
  RETURNS trigger AS
$BODY$

DECLARE v_idces integer;
DECLARE v_idgeolf integer;
DECLARE lot_surf integer;

BEGIN

     v_idgeolf := (SELECT nextval('idgeo_seq'::regclass));

     INSERT INTO r_objet.geo_objet_fon_lot SELECT v_idgeolf,new.op_sai,new.ref_spa,null,'30',new.geom,null,null,new.l_nom;

     INSERT INTO m_amenagement.an_amt_lot_stade SELECT v_idgeolf,
						 CASE WHEN new.idsite IS NULL or new.idsite = '' THEN
						 (
							SELECT DISTINCT
								idsite 
							FROM 
								r_objet.geo_objet_ope
							WHERE
								st_intersects(geo_objet_ope.geom,ST_PointOnSurface(new.geom)) = true AND destdomi='01'
								
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
    

						INSERT INTO m_amenagement.an_amt_lot_hab SELECT v_idgeolf,
					         CASE WHEN new.idsite IS NULL or new.idsite = '' THEN
						 (
							SELECT DISTINCT
								idsite 
							FROM 
								r_objet.geo_objet_ope
							WHERE
								st_intersects(geo_objet_ope.geom,ST_PointOnSurface(new.geom)) = true AND destdomi='01'
								
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
						  new.op_sai_att,
						  new.org_sai_att,
						  new.l_pvente,
						  new.l_pvente_l,
						  new.nb_log,
						  new.nb_logind,
						  new.nb_logindgr,
						  new.nb_logcol,
						  new.nb_logaide,
						  new.l_observ,
						  now(),
						  now(),
						  new.l_phase,
						  new.nb_log_r,
						  new.nb_logind_r,
						  new.nb_logindgr_r,
						  new.nb_logcol_r,
						  new.nb_logaide_r,
						  new.l_pvente_lot,
						  new.nb_logaide_loc_r,
						  new.nb_logaide_acc_r
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
					        CASE WHEN new.idsite IS NULL or new.idsite = '' THEN
						(SELECT DISTINCT
								idsite 
							FROM 
								r_objet.geo_objet_ope
							WHERE
								st_intersects(geo_objet_ope.geom,st_pointonsurface(new.geom)) = true AND destdomi='01'
								
							)
						  ELSE
						  new.idsite
						  END
							,
							null
						);

     return new ;

END;

$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
ALTER FUNCTION m_amenagement.ft_m_insert_lot_hab()
  OWNER TO sig_create;

COMMENT ON FUNCTION m_amenagement.ft_m_insert_lot_hab() IS 'Fonction gérant l''insertion des données liées aux lots à vocation habitat lors de la création de l''objet';

						 
-- Trigger: t_t2_insert_lot_hab on m_amenagement.geo_v_lot_hab

-- DROP TRIGGER t_t2_insert_lot_hab ON m_amenagement.geo_v_lot_hab;

CREATE TRIGGER t_t2_insert_lot_hab
  INSTEAD OF INSERT
  ON m_amenagement.geo_v_lot_hab
  FOR EACH ROW
  EXECUTE PROCEDURE m_amenagement.ft_m_insert_lot_hab();

-- Function: m_amenagement.ft_m_modif_lot_hab()

-- DROP FUNCTION m_amenagement.ft_m_modif_lot_hab();

CREATE OR REPLACE FUNCTION m_amenagement.ft_m_modif_lot_hab()
  RETURNS trigger AS
$BODY$

DECLARE DECLARE lot_surf integer;

BEGIN

--calcul de la surface de l'objet
lot_surf:=round(cast(st_area(new.geom) as numeric),0);

		UPDATE r_objet.geo_objet_fon_lot SET geom = new.geom, date_maj = now(), src_geom = new.ref_spa, op_sai=new.op_sai,l_nom=new.l_nom WHERE idgeolf = new.idgeolf;

		UPDATE m_amenagement.an_amt_lot_stade SET stade_amng = new.stade_amng, l_amng2 = new.l_amng2, stade_comm = new.stade_comm, l_comm2 = new.l_comm2, l_comm2_12 = new.l_comm2_12, etat_occup =  new.etat_occup WHERE idgeolf = new.idgeolf;

		UPDATE m_amenagement.an_amt_lot_hab SET

							surf = new.surf,
							l_surf_l = 
							CASE WHEN length(cast (new.surf as character varying)) >= 1 and length(cast (new.surf as character varying)) <= 3 THEN new.surf || 'm²'
								   WHEN length(cast (new.surf as character varying)) = 4 THEN replace(to_char(new.surf,'FM9G999'),',',' ') || 'm²'
								   WHEN length(cast (new.surf as character varying)) = 5 THEN replace(to_char(new.surf,'FM99G999'),',',' ') || 'm²'
								   WHEN length(cast (new.surf as character varying)) = 6 THEN replace(to_char(new.surf,'FM999G999'),',',' ') || 'm²'
								   WHEN length(cast (new.surf as character varying)) = 7 THEN replace(to_char(new.surf,'FM9G999G999'),',',' ') || 'm²'
								   WHEN length(cast (new.surf as character varying)) = 8 THEN replace(to_char(new.surf,'FM99G999G999'),',',' ') || 'm²'
								   END,
							date_maj = now(),
							op_sai = new.op_sai_att,
							org_sai = new.org_sai_att,
							l_pvente = new.l_pvente,
							l_pvente_l = new.l_pvente || '€/m²',
							l_pvente_lot = new.l_pvente_lot,
							nb_log=new.nb_log,
							nb_logind=new.nb_logind,
							nb_logindgr=new.nb_logindgr,
							nb_logcol=new.nb_logcol,
							nb_logaide=new.nb_logaide,
							nb_log_r=new.nb_log_r,
							nb_logind_r=new.nb_logind_r,
							nb_logindgr_r=new.nb_logindgr_r,
							nb_logcol_r=new.nb_logcol_r,
							nb_logaide_r=new.nb_logaide_r,
							l_observ = new.l_observ,
							l_phase = new.l_phase,
							nb_logaide_loc_r = new.nb_logaide_loc_r,
							nb_logaide_acc_r = new.nb_logaide_acc_r
		WHERE an_amt_lot_hab.idgeolf=new.idgeolf;

     return new;
END
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
ALTER FUNCTION m_amenagement.ft_m_modif_lot_hab()
  OWNER TO sig_create;

COMMENT ON FUNCTION m_amenagement.ft_m_modif_lot_hab() IS 'Fonction gérant la mise à jour des données liées aux lots à vocation habitat lors de la modification de l''objet';
					 
						 
-- Trigger: t_t3_modif_lot_hab on m_amenagement.geo_v_lot_hab

-- DROP TRIGGER t_t3_modif_lot_hab ON m_amenagement.geo_v_lot_hab;

CREATE TRIGGER t_t3_modif_lot_hab
  INSTEAD OF UPDATE
  ON m_amenagement.geo_v_lot_hab
  FOR EACH ROW
  EXECUTE PROCEDURE m_amenagement.ft_m_modif_lot_hab();


-- ########################################################### Vue de gestion des lots à vocation mixte #########################
	
-- View: m_amenagement.geo_v_lot_mixte

-- DROP VIEW m_amenagement.geo_v_lot_mixte;

CREATE OR REPLACE VIEW m_amenagement.geo_v_lot_mixte AS 
 SELECT o.idgeolf,
    f.l_lnom,
    o.src_geom AS ref_spa,
    o.op_sai,
    o.l_voca,
    o.l_nom,
    f.idsite,
    s.stade_amng,
    s.l_amng2,
    s.stade_comm,
    s.l_comm2,
    s.l_comm2_12,
    s.etat_occup,
    f.surf,
    f.l_surf_l,
    f.date_sai AS date_sai_att,
    f.date_maj AS date_maj_att,
    f.op_sai AS op_sai_att,
    f.org_sai AS org_sai_att,
    f.l_pvente,
    f.l_pvente_l,
    f.l_pvente_lot,
    f.nb_log,
    f.nb_logind,
    f.nb_logindgr,
    f.nb_logcol,
    f.nb_logaide,
    f.nb_log_r,
    f.nb_logind_r,
    f.nb_logindgr_r,
    f.nb_logcol_r,
    f.nb_logaide_r,
    f.l_observ,
    f.l_phase,
    f.l_tact,
    f.l_tact_99,
    f.l_nom_equ,
    f.nb_logaide_loc_r,
    f.nb_logaide_acc_r,
    o.geom
   FROM m_amenagement.an_amt_lot_mixte f,
    r_objet.geo_objet_fon_lot o,
    m_amenagement.an_amt_lot_stade s
  WHERE o.l_voca::text = '60'::text AND f.idgeolf = o.idgeolf AND o.idgeolf = s.idgeolf;

ALTER TABLE m_amenagement.geo_v_lot_mixte
  OWNER TO sig_create;

COMMENT ON VIEW m_amenagement.geo_v_lot_mixte
  IS 'Vue éditable des lots à vocation mixte';

										     
-- Function: m_amenagement.ft_m_delete_lot_mixte()

-- DROP FUNCTION m_amenagement.ft_m_delete_lot_mixte();

CREATE OR REPLACE FUNCTION m_amenagement.ft_m_delete_lot_mixte()
  RETURNS trigger AS
$BODY$


BEGIN

    DELETE FROM m_foncier.an_cession WHERE idces=(SELECT lf.idces FROM m_foncier.an_cession f, m_foncier.lk_cession_lot lf WHERE f.idces=lf.idces AND lf.idgeolf=old.idgeolf);
    DELETE FROM m_foncier.lk_cession_lot WHERE idgeolf=old.idgeolf;
    DELETE FROM m_amenagement.an_amt_lot_mixte WHERE idgeolf=old.idgeolf;
    DELETE FROM m_amenagement.an_amt_lot_stade WHERE idgeolf=old.idgeolf;
    DELETE FROM r_objet.geo_objet_fon_lot WHERE idgeolf=old.idgeolf;
    return new ;

END;

$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
ALTER FUNCTION m_amenagement.ft_m_delete_lot_mixte()
  OWNER TO sig_create;

COMMENT ON FUNCTION m_amenagement.ft_m_delete_lot_mixte() IS 'Fonction gérant la suppression des données liées aux lots à vocation mixte lors de la supression de l''objet';

										     
-- Trigger: t_t1_delete_lot_mixte on m_amenagement.geo_v_lot_mixte

-- DROP TRIGGER t_t1_delete_lot_mixte ON m_amenagement.geo_v_lot_mixte;

CREATE TRIGGER t_t1_delete_lot_mixte
  INSTEAD OF DELETE
  ON m_amenagement.geo_v_lot_mixte
  FOR EACH ROW
  EXECUTE PROCEDURE m_amenagement.ft_m_delete_lot_mixte();

										     
-- Function: m_amenagement.ft_m_insert_lot_mixte()

-- DROP FUNCTION m_amenagement.ft_m_insert_lot_mixte();

CREATE OR REPLACE FUNCTION m_amenagement.ft_m_insert_lot_mixte()
  RETURNS trigger AS
$BODY$

DECLARE v_idces integer;
DECLARE v_idgeolf integer;
DECLARE lot_surf integer;

BEGIN

     v_idgeolf := (SELECT nextval('idgeo_seq'::regclass));

     INSERT INTO r_objet.geo_objet_fon_lot SELECT v_idgeolf,new.op_sai,new.ref_spa,null,'60',new.geom,null,null,new.l_nom;

     INSERT INTO m_amenagement.an_amt_lot_stade SELECT v_idgeolf,
						 (
							SELECT DISTINCT
								idsite 
							FROM 
								r_objet.geo_objet_ope
							WHERE
								st_intersects(geo_objet_ope.geom,ST_PointOnSurface(new.geom)) = true
								
						  ),
						  new.stade_amng,
						  new.l_amng2,
						  new.stade_comm,
						  new.l_comm2,
						  new.l_comm2_12,
						  new.etat_occup;

     lot_surf:=round(cast(st_area(new.geom) as numeric),0);

    -- insertion des lots uniquements mixte 
    -- recherche si le lot dessiner est dans un site : si oui copie une ligne dans le métier site et foncier, si non copie uniquement dans le métier foncier
    

						INSERT INTO m_amenagement.an_amt_lot_mixte SELECT v_idgeolf,
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
						  new.op_sai_att,
						  new.org_sai_att,
						  new.l_pvente,
						  new.l_pvente_l,
						  new.nb_log,
						  new.nb_logind,
						  new.nb_logindgr,
						  new.nb_logcol,
						  new.nb_logaide,
						  new.l_observ,
						  now(),
						  now(),
						  new.l_phase,
						  new.nb_log_r,
						  new.nb_logind_r,
						  new.nb_logindgr_r,
						  new.nb_logcol_r,
						  new.nb_logaide_r,
						  new.l_pvente_lot,
						  new.l_tact,
						  new.l_tact_99,
						  new.l_nom_equ,
                                                  new.nb_logaide_loc_r,
                                                  new.nb_logaide_acc_r,
                                                  new.l_lnom						  
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
								st_intersects(geo_objet_ope.geom,st_pointonsurface(new.geom)) = true
								
							),
							null
						);

     return new ;

END;

$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
ALTER FUNCTION m_amenagement.ft_m_insert_lot_mixte()
  OWNER TO sig_create;

COMMENT ON FUNCTION m_amenagement.ft_m_insert_lot_mixte() IS 'Fonction gérant l''insertion des données liées aux lots à vocation mixte lors de l''insertion de l''objet';
										     
										     
-- Trigger: t_t2_insert_lot_mixte on m_amenagement.geo_v_lot_mixte

-- DROP TRIGGER t_t2_insert_lot_mixte ON m_amenagement.geo_v_lot_mixte;

CREATE TRIGGER t_t2_insert_lot_mixte
  INSTEAD OF INSERT
  ON m_amenagement.geo_v_lot_mixte
  FOR EACH ROW
  EXECUTE PROCEDURE m_amenagement.ft_m_insert_lot_mixte();

-- Function: m_amenagement.ft_m_modif_lot_mixte()

-- DROP FUNCTION m_amenagement.ft_m_modif_lot_mixte();

CREATE OR REPLACE FUNCTION m_amenagement.ft_m_modif_lot_mixte()
  RETURNS trigger AS
$BODY$

DECLARE DECLARE lot_surf integer;

BEGIN

--calcul de la surface de l'objet
lot_surf:=round(cast(st_area(new.geom) as numeric),0);

		UPDATE r_objet.geo_objet_fon_lot SET geom = new.geom, date_maj = now(), src_geom = new.ref_spa, op_sai=new.op_sai,l_nom=new.l_nom WHERE idgeolf = new.idgeolf;

	        UPDATE m_amenagement.an_amt_lot_stade SET stade_amng = new.stade_amng, l_amng2 = new.l_amng2, stade_comm = new.stade_comm, l_comm2 = new.l_comm2, l_comm2_12 = new.l_comm2_12, etat_occup =  new.etat_occup WHERE idgeolf = new.idgeolf;

		UPDATE m_amenagement.an_amt_lot_mixte SET

							surf = new.surf,
							l_surf_l = 
							CASE WHEN length(cast (new.surf as character varying)) >= 1 and length(cast (new.surf as character varying)) <= 3 THEN new.surf || 'm²'
								   WHEN length(cast (new.surf as character varying)) = 4 THEN replace(to_char(new.surf,'FM9G999'),',',' ') || 'm²'
								   WHEN length(cast (new.surf as character varying)) = 5 THEN replace(to_char(new.surf,'FM99G999'),',',' ') || 'm²'
								   WHEN length(cast (new.surf as character varying)) = 6 THEN replace(to_char(new.surf,'FM999G999'),',',' ') || 'm²'
								   WHEN length(cast (new.surf as character varying)) = 7 THEN replace(to_char(new.surf,'FM9G999G999'),',',' ') || 'm²'
								   WHEN length(cast (new.surf as character varying)) = 8 THEN replace(to_char(new.surf,'FM99G999G999'),',',' ') || 'm²'
								   END,
							date_maj = now(),
							op_sai = new.op_sai_att,
							org_sai = new.org_sai_att,
							l_pvente = new.l_pvente,
							l_pvente_l = new.l_pvente || '€/m²',
							l_pvente_lot = new.l_pvente_lot,
							nb_log=new.nb_log,
							nb_logind=new.nb_logind,
							nb_logindgr=new.nb_logindgr,
							nb_logcol=new.nb_logcol,
							nb_logaide=new.nb_logaide,
							nb_log_r=new.nb_log_r,
							nb_logind_r=new.nb_logind_r,
							nb_logindgr_r=new.nb_logindgr_r,
							nb_logcol_r=new.nb_logcol_r,
							nb_logaide_r=new.nb_logaide_r,
							l_observ = new.l_observ,
							l_phase = new.l_phase,
							l_tact = new.l_tact,
							l_tact_99 = new.l_tact_99,
							l_nom_equ = new.l_nom_equ,
							nb_logaide_loc_r = new.nb_logaide_loc_r,
							nb_logaide_acc_r = new.nb_logaide_acc_r,
							l_lnom = new.l_lnom
		WHERE an_amt_lot_mixte.idgeolf=new.idgeolf;

     return new;
END
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
ALTER FUNCTION m_amenagement.ft_m_modif_lot_mixte()
  OWNER TO sig_create;

COMMENT ON FUNCTION m_amenagement.ft_m_modif_lot_mixte() IS 'Fonction gérant la mise à jour des données liées aux lots à vocation mixte lors de la mise à jour de l''objet';
						 
						 
-- Trigger: t_t3_modif_lot_mixte on m_amenagement.geo_v_lot_mixte

-- DROP TRIGGER t_t3_modif_lot_mixte ON m_amenagement.geo_v_lot_mixte;

CREATE TRIGGER t_t3_modif_lot_mixte
  INSTEAD OF UPDATE
  ON m_amenagement.geo_v_lot_mixte
  FOR EACH ROW
  EXECUTE PROCEDURE m_amenagement.ft_m_modif_lot_mixte();

										     
-- ########################################################### Vue de gestion des sites à vocation équipement #########################

-- View: m_amenagement.geo_v_site_equipement

-- DROP VIEW m_amenagement.geo_v_site_equipement;

CREATE OR REPLACE VIEW m_amenagement.geo_v_site_equipement AS 
 SELECT o.gid,
    sa.idsite,
    sa.site_nom,
    sa.site_etat,
    sa.date_sai AS date_sai_att,
    sa.date_maj AS date_maj_att,
    sa.op_sai AS op_sai_att,
    sa.org_sai AS org_sai_att,
    sa.z_mai_ouvr,
    sa.z_compet,
    sa.z_amng,
    sa.z_gest,
    sa.z_anim,
    sa.z_comm,
    sa.contact,
    o.geom
   FROM m_amenagement.an_amt_site_equ sa,
    r_objet.geo_objet_site o
  WHERE sa.idsite::text = o.idsite::text;

ALTER TABLE m_amenagement.geo_v_site_equipement
  OWNER TO sig_create;

COMMENT ON VIEW m_amenagement.geo_v_site_equipement
  IS 'Vue éditable des sites à destination équipement gérés ou non par l''ARC. Ce filtre est possible par sélection de l''attribut en question';

-- Function: m_amenagement.ft_modif_site_equ()

-- DROP FUNCTION m_amenagement.ft_modif_site_equ();

CREATE OR REPLACE FUNCTION m_amenagement.ft_m_modif_site_equ()
  RETURNS trigger AS
$BODY$

BEGIN

UPDATE m_amenagement.an_amt_site_equ SET
  site_nom=new.site_nom,
  site_etat=new.site_etat,
  op_sai=new.op_sai,
  org_sai=new.org_sai,
  z_mai_ouvr=new.z_mai_ouv,
  z_compet=new.z_compet,
  z_amng=new.z_amng,
  z_gest=new.z_gest,
  z_anim=new.z_anim,
  z_comm=new.z_comm,
  contact=new.contact,
  date_maj=now()
  WHERE an_amt_site_equ.idsite = new.idsite;

     return new;
END
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
ALTER FUNCTION m_amenagement.ft_m_modif_site_equ()
  OWNER TO sig_create;

										     
										     
-- Trigger: t_t1_modif_site_equ on m_amenagement.geo_v_site_equipement

-- DROP TRIGGER t_t1_modif_site_equ ON m_amenagement.geo_v_site_equipement;

CREATE TRIGGER t_t1_modif_site_equ
  INSTEAD OF UPDATE
  ON m_amenagement.geo_v_site_equipement
  FOR EACH ROW
  EXECUTE PROCEDURE m_amenagement.ft_m_modif_site_equ();

-- ########################################################### Vue de gestion des sites à vocation habitat #########################

-- View: m_amenagement.geo_v_site_habitat

-- DROP VIEW m_amenagement.geo_v_site_habitat;

CREATE OR REPLACE VIEW m_amenagement.geo_v_site_habitat AS 
 SELECT o.gid,
    sa.idgeopo,
    sa.idsite,
    sa.site_nom,
    sa.site_etat,
    sa.date_sai AS date_sai_att,
    sa.date_maj AS date_maj_att,
    sa.op_sai AS op_sai_att,
    sa.org_sai AS org_sai_att,
    sa.nb_log,
    sa.z_mai_ouvr,
    sa.z_compet,
    sa.z_amng,
    sa.z_gest,
    sa.z_anim,
    sa.z_comm,
    sa.contact,
    o.geom
   FROM m_amenagement.an_amt_site_habitat sa,
    r_objet.geo_objet_site o
  WHERE sa.idsite::text = o.idsite::text;

ALTER TABLE m_amenagement.geo_v_site_habitat
  OWNER TO sig_create;

COMMENT ON VIEW m_amenagement.geo_v_site_habitat
  IS 'Vue éditable des sites à destination habitat gérés ou non par l''ARC. Ce filtre est possible par sélection de l''attribut en question';

-- Function: m_amenagement.ft_m_modif_site_hab()

-- DROP FUNCTION m_amenagement.ft_m_modif_site_hab();

CREATE OR REPLACE FUNCTION m_amenagement.ft_m_modif_site_hab()
  RETURNS trigger AS
$BODY$

BEGIN

UPDATE m_amenagement.an_amt_site_habitat SET
  idsite=new.idsite,
  site_nom=new.site_nom,
  site_etat=new.site_etat,
  op_sai=new.op_sai_att,
  org_sai=new.org_sai_att, 
  nb_log=new.nb_log,
  z_mai_ouvr=new.z_mai_ouvr,
  z_compet=new.z_compet,
  z_amng=new.z_amng,
  z_gest=new.z_gest,
  z_anim=new.z_anim,
  z_comm=new.z_comm,
  contact=new.contact,
  date_maj=now()
  WHERE an_amt_site_habitat.idsite = new.idsite;

     return new;
END
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
ALTER FUNCTION m_amenagement.ft_m_modif_site_hab()
  OWNER TO sig_create;
										     
										     
-- Trigger: t_t1_modif_site_hab on m_amenagement.geo_v_site_habitat

-- DROP TRIGGER t_t1_modif_site_hab ON m_amenagement.geo_v_site_habitat;

CREATE TRIGGER t_t1_modif_site_hab
  INSTEAD OF UPDATE
  ON m_amenagement.geo_v_site_habitat
  FOR EACH ROW
  EXECUTE PROCEDURE m_amenagement.ft_m_modif_site_hab();


-- ########################################################### Vue de gestion des sites à vocation mixte #########################
	
-- View: m_amenagement.geo_v_site_mixte

-- DROP VIEW m_amenagement.geo_v_site_mixte;

CREATE OR REPLACE VIEW m_amenagement.geo_v_site_mixte AS 
 SELECT o.gid,
    o.idsite,
    sa.idpole,
    sa.site_voca,
    sa.site_nom,
    sa.site_etat,
    sa.zae,
    sa.date_sai AS date_sai_att,
    sa.date_maj AS date_maj_att,
    sa.date_int,
    sa.op_sai AS op_sai_att,
    sa.org_sai AS org_sai_att,
    sa.typo,
    sa.dest,
    sa.p_implant,
    sa.z_mai_ouvr,
    sa.z_compet,
    sa.z_amng,
    sa.z_gest,
    sa.z_anim,
    sa.z_comm,
    sa.contact,
    sa.z_cession_eco,
    sa.z_cession_hab,
    sa.z_env,
    sa.z_paysage,
    sa.z_rehab,
    sa.z_epu,
    sa.z_dechet,
    sa.z_tr_slect,
    sa.res_ass,
    sa.res_pluvia,
    sa.res_eau,
    sa.res_gaz,
    sa.res_elect,
    sa.res_net,
    sa.res_db_net,
    sa.z_auto,
    sa.z_dst_auto,
    sa.z_tps_auto,
    sa.z_ar_f,
    sa.z_dst_ar_f,
    sa.z_ar_v,
    sa.z_dst_ar_v,
    sa.z_fr_f,
    sa.z_dst_fr_f,
    sa.z_fr_v,
    sa.z_dst_fr_v,
    sa.z_pmm,
    sa.z_dst_pmm,
    sa.serv_tc,
    sa.circ_douce,
    sa.serv_rest,
    sa.serv_crech,
    sa.serv_autre,
    sa.serv_collt,
    sa.z_aide_pb,
    sa.l_dated_aide_pb,
    sa.l_datef_aide_pb,
    sa.d_paris,
    sa.t_paris,
    sa.d_lille,
    sa.t_lille,
    sa.l_dauto,
    sa.l_dtgvhp,
    sa.l_ttgvhp,
    sa.l_dtgvcdg,
    sa.l_ttgvcdg,
    sa.l_tgcomp,
    sa.l_dtille,
    sa.l_ttille,
    sa.l_dcdg,
    sa.l_tcdg,
    sa.l_dlesquin,
    sa.l_tlesquin,
    sa.nb_log,
    o.geom
   FROM m_amenagement.an_amt_site_mixte sa,
    r_objet.geo_objet_site o
  WHERE sa.idsite::text = o.idsite::text;

ALTER TABLE m_amenagement.geo_v_site_mixte
  OWNER TO sig_create;

COMMENT ON VIEW m_amenagement.geo_v_site_mixte
  IS 'Vue éditable des sites à destination mixte (économie et habitat) gérés ou non par l''ARC. Ce filtre est possible par sélection de l''attribut en question';

-- Function: m_amenagement.ft_m_modif_site_mixte()

-- DROP FUNCTION m_amenagement.ft_m_modif_site_mixte();

CREATE OR REPLACE FUNCTION m_amenagement.ft_m_modif_site_mixte()
  RETURNS trigger AS
$BODY$

BEGIN

	UPDATE m_amenagement.an_amt_site_mixte SET
	idsite = new.idsite,
	site_voca = new.site_voca,
	site_nom = new.site_nom,
	site_etat = new.site_etat,
	date_maj = now(), -- modification de la date de mise à jour (différente ici de la date de saisie contrairement à la première saisie ou date_sai = date_maj)
	op_sai = new.op_sai_att, -- rempli par l'opérateur dans l'application
	org_sai = new.org_sai_att, -- rempli par l'opérateur dans l'application
	typo = new.typo, -- rempli par l'opérateur dans l'application
	dest = new.dest, -- rempli par l'opérateur dans l'application
	p_implant = new.p_implant, -- rempli par l'opérateur dans l'application
	z_mai_ouvr = new.z_mai_ouvr, -- rempli par l'opérateur dans l'application
	z_compet = new.z_compet, -- rempli par l'opérateur dans l'application
	z_amng = new.z_amng, -- rempli par l'opérateur dans l'application
	z_gest = new.z_gest, -- rempli par l'opérateur dans l'application
	z_anim = new.z_anim, -- rempli par l'opérateur dans l'application
	z_comm = new.z_comm, -- rempli par l'opérateur dans l'application
	contact = new.contact, -- rempli par l'opérateur dans l'application
	z_cession_eco = new.z_cession_eco, -- rempli par l'opérateur de saisie
	z_cession_hab = new.z_cession_hab, -- rempli par l'opérateur de saisie
	z_env = new.z_env, -- rempli par l'opérateur dans l'application
	z_paysage = new.z_paysage, -- rempli par l'opérateur dans l'application
	z_rehab = new.z_rehab, -- rempli par l'opérateur dans l'application
	z_epu = new.z_epu, -- rempli par l'opérateur dans l'application
	z_dechet = new.z_dechet, -- rempli par l'opérateur dans l'application
	z_tr_slect = new.z_tr_slect, -- rempli par l'opérateur dans l'application
	res_ass = new.res_ass, -- rempli par l'opérateur dans l'application
	res_pluvia = new.res_pluvia, -- rempli par l'opérateur dans l'application
	res_eau = new.res_eau, -- rempli par l'opérateur dans l'application
	res_gaz = new.res_gaz, -- rempli par l'opérateur dans l'application
	res_elect = new.res_elect, -- rempli par l'opérateur dans l'application
	res_net = new.res_net, -- rempli par l'opérateur dans l'application
	res_db_net = new.res_db_net, -- rempli par l'opérateur dans l'application
	z_auto = new.z_auto, -- rempli par l'opérateur dans l'application
	z_dst_auto = new.z_dst_auto, -- rempli par l'opérateur dans l'application
	z_tps_auto = new.z_tps_auto, -- rempli par l'opérateur dans l'application
	z_ar_f = new.z_ar_f, -- rempli par l'opérateur dans l'application
	z_dst_ar_f = new.z_dst_ar_f, -- rempli par l'opérateur dans l'application
	z_ar_v = new.z_ar_v, -- rempli par l'opérateur dans l'application
	z_dst_ar_v = new.z_dst_ar_v, -- rempli par l'opérateur dans l'application
	z_fr_f = new.z_fr_f, -- rempli par l'opérateur dans l'application
	z_dst_fr_f = new.z_dst_fr_f, -- rempli par l'opérateur dans l'application
	z_fr_v = new.z_fr_v, -- rempli par l'opérateur dans l'application
	z_dst_fr_v = new.z_dst_fr_v, -- rempli par l'opérateur dans l'application
	z_pmm = new.z_pmm, -- rempli par l'opérateur dans l'application
	z_dst_pmm = new.z_dst_pmm, -- rempli par l'opérateur dans l'application
	serv_tc = new.serv_tc, -- rempli par l'opérateur dans l'application
	circ_douce = new.circ_douce, -- rempli par l'opérateur dans l'application
	serv_rest = new.serv_rest, -- rempli par l'opérateur dans l'application
	serv_crech = new.serv_crech, -- rempli par l'opérateur dans l'application
	serv_autre = new.serv_autre, -- rempli par l'opérateur dans l'application
	serv_collt = new.serv_collt, -- rempli par l'opérateur dans l'application
	z_aide_pb = new.z_aide_pb, -- rempli par l'opérateur dans l'application
	l_dated_aide_pb = new.l_dated_aide_pb, -- rempli par l'opérateur dans l'application
	l_datef_aide_pb = new.l_datef_aide_pb, -- rempli par l'opérateur dans l'application
	d_paris=new.d_paris,
	t_paris=new.t_paris,
	d_lille=new.d_lille,
	t_lille=new.t_lille,
	l_dauto=new.l_dauto,
	l_dtgvhp=new.l_dtgvhp,
	l_ttgvhp=new.l_ttgvhp,
	l_dtgvcdg=new.l_dtgvcdg,
	l_ttgvcdg=new.l_ttgvcdg,
	l_tgcomp=new.l_tgcomp,
	l_dtille=new.l_dtille,
	l_ttille=new.l_ttille,
	l_dcdg=new.l_dcdg,
	l_tcdg=new.l_tcdg,
	l_dlesquin=new.l_dlesquin,
	l_tlesquin=new.l_tlesquin,
	nb_log=new.nb_log
	
	WHERE an_amt_site_mixte.idsite = new.idsite;

     return new;
END
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
ALTER FUNCTION m_amenagement.ft_m_modif_site_mixte()
  OWNER TO sig_create;
									     
										     
-- Trigger: t_t1_modif_site_mixte on m_amenagement.geo_v_site_mixte

-- DROP TRIGGER t_t1_modif_site_mixte ON m_amenagement.geo_v_site_mixte;

CREATE TRIGGER t_t1_modif_site_mixte
  INSTEAD OF UPDATE
  ON m_amenagement.geo_v_site_mixte
  FOR EACH ROW
  EXECUTE PROCEDURE m_amenagement.ft_m_modif_site_mixte();

										     
-- ########################################################### SCHEMA m_urbanisme_reg #########################

-- ########################################################### Vue de gestion des procédures #########################

-- View: m_urbanisme_reg.geo_v_proc

-- DROP VIEW m_urbanisme_reg.geo_v_proc;

CREATE OR REPLACE VIEW m_urbanisme_reg.geo_v_proc AS 
 SELECT so.idgeopo,
    so.idsite,
    so.l_ope_nom,
    so.l_ope_alias,
    so.dest,
    so.z_proced,
    so.date_sai,
    so.date_maj,
    so.op_sai,
    so.l_ope_phase,
    so.l_ope_moa,
    so.l_conso_type,
    so.l_pr_urb,
    so.date_crea,
    so.l_pr_fon,
    so.l_pr_fon_date,
    so.l_surf_ha,
    so.l_existe,
    so.l_pr_fon_type,
    so.l_ref_compta,
    so.l_observ,
    o.sup_m2,
    so.l_surf_cess_ha,
    so.l_date_clo,
    so.l_nb_log,
    so.l_nb_logind,
    so.l_nb_logindgr,
    so.l_nb_logcol,
    so.l_nb_logaide,
    so.l_nb_logaide_loc,
    so.l_nb_logaide_acc,
    so.l_nom_cp,
    o.src_geom,
    o.geom,
    st_multi(st_buffer(o.geom, (-0.5)::double precision))::geometry(MultiPolygon,2154) AS geom1
   FROM m_urbanisme_reg.an_proced so,
    r_objet.geo_objet_ope o
  WHERE so.idgeopo = o.idgeopo AND o.proced = true;

ALTER TABLE m_urbanisme_reg.geo_v_proc
  OWNER TO sig_create;

COMMENT ON VIEW m_urbanisme_reg.geo_v_proc
  IS 'Vue éditable des procédures d''aménagement (uniquement des données attributaires pas les géométries)';

		       
-- Function: m_urbanisme_reg.ft_m_modif_proc()

-- DROP FUNCTION m_urbanisme_reg.ft_m_modif_proc();

CREATE OR REPLACE FUNCTION m_urbanisme_reg.ft_m_modif_proc()
  RETURNS trigger AS
$BODY$

BEGIN

	UPDATE m_urbanisme_reg.an_proced SET
		
		l_ope_nom = new.l_ope_nom,
		l_ope_alias = new.l_ope_alias,
		z_proced = new.z_proced,
		date_maj = now(),
		op_sai = new.op_sai,
		l_ope_phase = new.l_ope_phase,
		l_ope_moa = new.l_ope_moa,
		l_conso_type = new.l_conso_type,
		l_pr_urb = new.l_pr_urb,
		date_crea = new.date_crea,
		l_pr_fon = new.l_pr_fon,
		l_pr_fon_date = new.l_pr_fon_date,
		l_existe = new.l_existe,
		l_pr_fon_type = new.l_pr_fon_type,
		l_ref_compta = new.l_ref_compta,
		l_observ = new.l_observ,
		l_surf_cess_ha=new.l_surf_cess_ha,
		l_date_clo=new.l_date_clo,
		l_nb_log=new.l_nb_log,
		l_nb_logind=new.l_nb_logind,
		l_nb_logindgr=new.l_nb_logindgr,
		l_nb_logcol=new.l_nb_logcol,
		l_nb_logaide=new.l_nb_logaide,
		l_nb_logaide_loc=new.l_nb_logaide_loc,
		l_nb_logaide_acc=new.l_nb_logaide_acc,
		l_nom_cp=new.l_nom_cp
		
	WHERE an_proced.idgeopo = new.idgeopo;
 
     return new;
END
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
ALTER FUNCTION m_urbanisme_reg.ft_m_modif_proc()
  OWNER TO sig_create;

		       
-- Trigger: t_t1_modif_proc on m_urbanisme_reg.geo_v_proc

-- DROP TRIGGER t_t1_modif_proc ON m_urbanisme_reg.geo_v_proc;

CREATE TRIGGER t_t1_modif_proc
  INSTEAD OF UPDATE
  ON m_urbanisme_reg.geo_v_proc
  FOR EACH ROW
  EXECUTE PROCEDURE m_urbanisme_reg.ft_m_modif_proc();

-- Function: m_urbanisme_reg.ft_m_refresh_proc()

-- DROP FUNCTION m_urbanisme_reg.ft_m_refresh_proc();

CREATE OR REPLACE FUNCTION m_urbanisme_reg.ft_m_refresh_proc()
  RETURNS trigger AS
$BODY$

BEGIN

REFRESH MATERIALIZED VIEW x_apps.xapps_geo_vmr_proc;

     return new;
END
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
ALTER FUNCTION m_urbanisme_reg.ft_m_refresh_proc()
  OWNER TO sig_create;

		       
		       
-- Trigger: t_t2_refresh_xapps_geo_vmr_proc on m_urbanisme_reg.geo_v_proc

-- DROP TRIGGER t_t2_refresh_xapps_geo_vmr_proc ON m_urbanisme_reg.geo_v_proc;

CREATE TRIGGER t_t2_refresh_xapps_geo_vmr_proc
  INSTEAD OF UPDATE
  ON m_urbanisme_reg.geo_v_proc
  FOR EACH ROW
  EXECUTE PROCEDURE m_urbanisme_reg.ft_m_refresh_proc();


