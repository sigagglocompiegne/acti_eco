/*Amt_fon_Eco V1.0*/
/*Creation des vues de gestion stockées dans le schéma contenant les tables */
/* afe_20_vues_gestion.sql */
/*PostGIS*/

/* Propriétaire : GeoCompiegnois - http://geo.compiegnois.fr/ */
/* Auteur : Grégory Bodet */



-- ####################################################################################################################################################
-- ###                                                                                                                                              ###
-- ###                                                              VUES DE GESTION                                                                 ###
-- ###                                                                                                                                              ###
-- ####################################################################################################################################################

-- ########################################################### SCHEMA m_amenagement #########################

-- ########################################################### geo_v_lot #########################

-- View: m_amenagement.geo_v_lot

-- DROP VIEW m_amenagement.geo_v_lot;

CREATE OR REPLACE VIEW m_amenagement.geo_v_lot
 AS
 SELECT o.idgeolf,
    o.l_nom,
    o.op_sai,
    o.src_geom AS ref_spa,
    o.sup_m2,
    o.l_voca,
    o.date_sai,
    o.date_maj,
    o.op_maj,
    o.epci,
    o.insee,
    o.commune,
    o.surf,
    o.surf_l,
    s.stade_amng,
    s.l_amng2,
    s.stade_comm,
    s.l_comm2,
    s.l_comm2_12,
    s.etat_occup,
    o.geom
   FROM r_objet.geo_objet_fon_lot o,
    m_amenagement.an_amt_lot_stade s
  WHERE o.idgeolf = s.idgeolf;


COMMENT ON VIEW m_amenagement.geo_v_lot
    IS 'Vue éditable des lots fonciers (toutes vocations) uniquement pour l''administration SIG.
ATTENTION : fonctionnel en cours de refonte suite désurbanisation des sites d''activité et de la refont de l''application à l''échelle du Grand Compiégnois';

CREATE TRIGGER t_t1_insert_lot
    INSTEAD OF INSERT
    ON m_amenagement.geo_v_lot
    FOR EACH ROW
    EXECUTE PROCEDURE m_amenagement.ft_m_lot_insert();

-- ########################################################### ft_m_lot_insert #########################

-- FUNCTION: m_amenagement.ft_m_lot_insert()

-- DROP FUNCTION m_amenagement.ft_m_lot_insert();

CREATE FUNCTION m_amenagement.ft_m_lot_insert()
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

-- ########################################################### SCHEMA m_foncier #########################

-- ########################################################### geo_v_cession #########################

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
    o.insee AS insee_geo,
    o.commune,
    o.surf,
    o.surf_l,
    o.epci,
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
    o.op_maj AS op_maj_geo,
    o.geom
   FROM m_foncier.an_cession c,
    m_foncier.lk_cession_lot lc,
    r_objet.geo_objet_fon_lot o
  WHERE c.idces::text = lc.idces::text AND lc.idgeolf = o.idgeolf;

COMMENT ON VIEW m_foncier.geo_v_cession
    IS 'Vue éditable des cessions de lots et possibilité d''ajout d''un lot par le service foncier';

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

-- ########################################################### ft_m_cess_nlot_delete #########################

-- FUNCTION: m_foncier.ft_m_cess_nlot_delete()

-- DROP FUNCTION m_foncier.ft_m_cess_nlot_delete();

CREATE FUNCTION m_foncier.ft_m_cess_nlot_delete()
    RETURNS trigger
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE NOT LEAKPROOF
AS $BODY$

BEGIN

-- pré-test pour vérifier si le lot n'est pas dans une zone d'aménagement, si non renvoie une exception et ne fait rien (dans GEO il faut créer un message pour l'utilisateur)

IF (SELECT count(*) FROM r_objet.geo_objet_fon_lot o WHERE o.op_sai <> 'Service foncier' AND idgeolf = old.idgeolf) >= 1 THEN

RAISE EXCEPTION 'La cession à supprimer est dans une opération d''aménagements. Vous pouvez seulement supprimer un lot hors de ces zones. Merci de vous rapprochez du service Information Géographique pour la suppression de votre cession.';

ELSE

    DELETE FROM m_foncier.an_cession WHERE idces=(SELECT lf.idces FROM m_foncier.an_cession f, m_foncier.lk_cession_lot lf WHERE f.idces=lf.idces AND lf.idgeolf=old.idgeolf);
    DELETE FROM m_foncier.lk_cession_lot WHERE idgeolf=old.idgeolf;
    DELETE FROM m_amenagement.an_amt_lot_stade WHERE idgeolf=old.idgeolf;
    DELETE FROM m_amenagement.an_amt_lot_habitat WHERE idgeolf=old.idgeolf;
    DELETE FROM m_amenagement.an_amt_lot_equip WHERE idgeolf=old.idgeolf;
    DELETE FROM m_amenagement.an_amt_lot_mixt WHERE idgeolf=old.idgeolf;
    DELETE FROM m_amenagement.an_amt_lot_divers WHERE idgeolf=old.idgeolf;
    DELETE FROM m_economie.an_eco_lot WHERE idgeolf=old.idgeolf;
    DELETE FROM r_objet.geo_objet_fon_lot WHERE idgeolf=old.idgeolf;

END IF;

	
     return new ;

END;

$BODY$;

COMMENT ON FUNCTION m_foncier.ft_m_cess_nlot_delete()
    IS 'Fonction gérant la suppression des cessions (lots) uniquement dans le tissu (hors zone d''aménagement)';


-- ########################################################### ft_m_cess_nlot_insert #########################

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
v_idgeolf := (SELECT nextval('r_objet.idgeo_seq'::regclass));

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

-- pas de saisie en dehors de l'ARC

IF st_intersects(st_pointonsurface(new.geom),(SELECT c.geom FROM r_osm.geo_vm_osm_contour_arc c)) IS FALSE THEN

RAISE EXCEPTION 'Vous ne pouvez pas saisir une cession en dehors de l''ARC.';
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
		INSERT INTO r_objet.geo_objet_fon_lot SELECT v_idgeolf,'Service foncier','11',null,'10',new.geom,null,null,new.l_nom,new.op_maj_geo,null,null,null,null,null;
                -- insertion dans la table des stades d'aménagement et de commercialisation
	        INSERT INTO m_amenagement.an_amt_lot_stade SELECT v_idgeolf, null,v_stade_amng, v_l_amng2, null, v_l_comm2, null,'00','Service Foncier';
                -- insertion dans la table des lots thématiques
                INSERT INTO m_amenagement.an_amt_lot_equip SELECT v_idgeolf,
							new.lot_l_nom,
							null,
							'Service Foncier'
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
						new.l_mfrais_g_ttc,
						new.l_mfrais_n_ttc,
						new.l_mfrais_a_ttc,
						null,
						null,
						new.d_delib_4,
			null,
			null,
			null
						);
	END IF;

IF new.voca_ces = '20' THEN

RAISE EXCEPTION 'Vous ne pouvez pas saisir une cession diffuse à destination d''activité. Contacter le service SIG.';

END IF;

	-- si la vocation est économique, insertion dans geo_objet_fon_lot, an_amt_lot_stade,an_sa_lot (m_economie), lk_cession_lot  et an_cession
	/*
	IF new.voca_ces = '20' THEN
                -- insertion dans la table objet
		INSERT INTO r_objet.geo_objet_fon_lot SELECT v_idgeolf,'Service foncier','11',null,'20',new.geom,null,null,new.l_nom,new.op_maj_geo,null,null,null,null,null;
                -- insertion dans la table des stades d'aménagement et de commercialisation
	        INSERT INTO m_amenagement.an_amt_lot_stade SELECT v_idgeolf, 
		null, v_stade_amng, v_l_amng2, null, v_l_comm2, null,'00','Service Foncier';
		-- insertion dans la table des lots thématiques
		INSERT INTO m_economie.an_eco_lot SELECT v_idgeolf,

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
*/
	-- si la vocation est habitat, insertion dans geo_objet_fon_lot, an_amt_lot_stade,an_amt_lot_hab, lk_cession_lot  et an_cession
	IF new.voca_ces = '30' THEN
		-- insertion dans la table objet
		INSERT INTO r_objet.geo_objet_fon_lot SELECT v_idgeolf,'Service foncier','11',null,'30',new.geom,null,null,new.l_nom,new.op_maj_geo,null,null,null,null,null;
                -- insertion dans la table des stades d'aménagement et de commercialisation
	        INSERT INTO m_amenagement.an_amt_lot_stade SELECT v_idgeolf,null, v_stade_amng, v_l_amng2, null, v_l_comm2, null,'00','Service foncier';
		-- insertion dans la table des lots thématiques
		INSERT INTO m_amenagement.an_amt_lot_habitat (idgeolf,nb_log,nb_logind,nb_logindgr,nb_logcol,nb_logaide,nb_log_r,nb_logind_r,nb_logindgr_r,nb_logcol_r,
													 nb_logaide_r,nb_logaide_loc_r,nb_logaide_acc_r,op_maj) SELECT v_idgeolf,
						 new.lhab_nb_log,new.lhab_nb_logind,new.lhab_nb_logindgr,new.lhab_nb_logcol,new.lhab_nb_logaide,new.lhab_nb_log_r,new.lhab_nb_logind_r,new.lhab_nb_logindgr_r,
						 new.lhab_nb_logcol_r,new.lhab_nb_logaide_r,new.lhab_nb_logaide_loc_r,new.lhab_nb_logaide_acc_r,'Service foncier';
						  
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
						new.l_mfrais_g_ttc,
						new.l_mfrais_n_ttc,
						new.l_mfrais_a_ttc,
						null,
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
		INSERT INTO r_objet.geo_objet_fon_lot SELECT v_idgeolf,'Service foncier','11',null,'40',new.geom,null,null,new.l_nom,new.op_maj_geo,null,null,null,null,null;
                -- insertion dans la table des stades d'aménagement et de commercialisation
	        INSERT INTO m_amenagement.an_amt_lot_stade SELECT v_idgeolf, null, v_stade_amng, v_l_amng2, null, v_l_comm2, null,'00','Service foncier';
		-- insertion dans la table des lots thématiques
		INSERT INTO m_amenagement.an_amt_lot_divers (idgeolf,nom,op_maj) SELECT v_idgeolf, new.lot_l_nom,'Service foncier';
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
						new.l_mfrais_g_ttc,
						new.l_mfrais_n_ttc,
						new.l_mfrais_a_ttc,
						null,
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
		INSERT INTO r_objet.geo_objet_fon_lot SELECT v_idgeolf,'Service foncier','11',null,'50',new.geom,null,null,new.l_nom,new.op_maj_geo,null,null,null,null,null;
                -- insertion dans la table des stades d'aménagement et de commercialisation
	        INSERT INTO m_amenagement.an_amt_lot_stade SELECT v_idgeolf, 
		null, v_stade_amng, v_l_amng2, null, v_l_comm2, null,'00','Service foncier';
		
		-- insertion dans table lot des espaces publics
		INSERT INTO m_amenagement.an_amt_lot_esppublic (idgeolf,observ,op_maj) SELECT v_idgeolf,new.llot_observ,'Service foncier';
		
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
						new.l_mfrais_g_ttc,
						new.l_mfrais_n_ttc,
						new.l_mfrais_a_ttc,
						null,
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
		INSERT INTO r_objet.geo_objet_fon_lot SELECT v_idgeolf,'Service foncier','11',null,'60',new.geom,null,null,new.l_nom,new.op_maj_geo,null,null,null,null,null;
                -- insertion dans la table des stades d'aménagement et de commercialisation
	        INSERT INTO m_amenagement.an_amt_lot_stade SELECT v_idgeolf, null, v_stade_amng, v_l_amng2, null, v_l_comm2, null,'00';

		-- insertion dans la table des lots thématiques
		INSERT INTO m_amenagement.an_amt_lot_mixt (idgeolf,nb_log,nb_logind,nb_logindgr,nb_logcol,nb_logaide,observ,nb_log_r,nb_logind_r,nb_logindgr_r,nb_logcol_r,
													 nb_logaide_r,tact,nom_equ,nb_logaide_loc_r,nb_logaide_acc_r,op_maj) SELECT v_idgeolf,
						 new.lhab_nb_log,new.lhab_nb_logind,new.lhab_nb_logindgr,new.lhab_nb_logcol,new.lhab_nb_logaide,new.llot_observ,new.lhab_nb_log_r,new.lhab_nb_logind_r,new.lhab_nb_logindgr_r,
						 new.lhab_nb_logcol_r,new.lhab_nb_logaide_r,new.llot_tact,new.lot_l_nom,new.lhab_nb_logaide_loc_r,new.lhab_nb_logaide_acc_r,'Service foncier';
										  
						  
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
						new.l_mfrais_g_ttc,
						new.l_mfrais_n_ttc,
						new.l_mfrais_a_ttc,
						null,
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

COMMENT ON FUNCTION m_foncier.ft_m_cess_nlot_insert()
    IS 'Fonction gérant l''insertion des cessions (lots) dans le tissu (hors zone d''aménagement)';


-- ########################################################### ft_m_cess_nlot_update #########################


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

	UPDATE r_objet.geo_objet_fon_lot SET 
	l_nom = new.l_nom,
	geom = new.geom 
	WHERE idgeolf = new.idgeolf;

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
	op_sai = new.op_sai,
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

    -- mise à jour des lots par vocation
	-- la mise à jour des informations aux lots s'effectue directement dans l'appli GEO à travers la fiche des lots accessible depuis la fiche de cession
	

    return new ;

END;

$BODY$;

COMMENT ON FUNCTION m_foncier.ft_m_cess_nlot_update()
    IS 'Fonction gérant la mise à jour des données des cessions foncières et la gestion des stades d''aménagement et de commercilaisation des lots en cas de cession vendu';
