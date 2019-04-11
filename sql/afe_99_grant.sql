/*Amt_Fon_Eco V1.0*/
/*Creation des droits sur l'ensemble des objets */
/* afe_99_grant.sql */
/*PostGIS*/

/* Propriétaire : GeoCompiegnois - http://geo.compiegnois.fr/ */
/* Auteur : Grégory Bodet */


-- ####################################################################################################################################################
-- ###                                                                                                                                              ###
-- ###                                                                        GRANT                                                                  ###
-- ###                                                                                                                                              ###
-- ####################################################################################################################################################


-- #################################################################### SCHEMA  ####################################################################

GRANT ALL ON SCHEMA r_objet TO create_sig;
GRANT USAGE ON SCHEMA r_objet TO read_sig;
GRANT USAGE ON SCHEMA r_objet TO edit_sig;
GRANT ALL ON SCHEMA r_objet TO sig_create;

ALTER DEFAULT PRIVILEGES IN SCHEMA r_objet
    GRANT INSERT, SELECT, UPDATE, DELETE, TRUNCATE, REFERENCES, TRIGGER ON TABLES
    TO create_sig;

ALTER DEFAULT PRIVILEGES IN SCHEMA r_objet
    GRANT INSERT, SELECT, UPDATE, DELETE ON TABLES
    TO edit_sig;

ALTER DEFAULT PRIVILEGES IN SCHEMA r_objet
    GRANT SELECT ON TABLES
    TO read_sig;
    
GRANT ALL ON SCHEMA m_urbanisme_reg TO sig_create;
GRANT USAGE ON SCHEMA m_urbanisme_reg TO slazarescu;
GRANT ALL ON SCHEMA m_urbanisme_reg TO create_sig;
GRANT USAGE ON SCHEMA m_urbanisme_reg TO read_sig;
GRANT USAGE ON SCHEMA m_urbanisme_reg TO edit_sig;

ALTER DEFAULT PRIVILEGES IN SCHEMA m_urbanisme_reg
    GRANT INSERT, SELECT, UPDATE, DELETE, TRUNCATE, REFERENCES, TRIGGER ON TABLES
    TO create_sig;

ALTER DEFAULT PRIVILEGES IN SCHEMA m_urbanisme_reg
    GRANT INSERT, SELECT, UPDATE, DELETE ON TABLES
    TO edit_sig;

ALTER DEFAULT PRIVILEGES IN SCHEMA m_urbanisme_reg
    GRANT SELECT ON TABLES
    TO read_sig;
    
 
GRANT ALL ON SCHEMA m_foncier TO sig_create;
GRANT ALL ON SCHEMA m_foncier TO create_sig;
GRANT USAGE ON SCHEMA m_foncier TO read_sig;
GRANT USAGE ON SCHEMA m_foncier TO edit_sig;

ALTER DEFAULT PRIVILEGES IN SCHEMA m_foncier
    GRANT INSERT, SELECT, UPDATE, DELETE, TRUNCATE, REFERENCES, TRIGGER ON TABLES
    TO create_sig;

ALTER DEFAULT PRIVILEGES IN SCHEMA m_foncier
    GRANT INSERT, SELECT, UPDATE, DELETE ON TABLES
    TO edit_sig;

ALTER DEFAULT PRIVILEGES IN SCHEMA m_foncier
    GRANT SELECT ON TABLES
    TO read_sig;
    
GRANT ALL ON SCHEMA m_economie TO sig_create;
GRANT ALL ON SCHEMA m_economie TO create_sig;
GRANT USAGE ON SCHEMA m_economie TO read_sig;
GRANT USAGE ON SCHEMA m_economie TO edit_sig;

ALTER DEFAULT PRIVILEGES IN SCHEMA m_economie
    GRANT INSERT, SELECT, UPDATE, DELETE, TRUNCATE, REFERENCES, TRIGGER ON TABLES
    TO create_sig;

ALTER DEFAULT PRIVILEGES IN SCHEMA m_economie
    GRANT INSERT, SELECT, UPDATE, DELETE ON TABLES
    TO edit_sig;

ALTER DEFAULT PRIVILEGES IN SCHEMA m_economie
    GRANT SELECT ON TABLES
    TO read_sig;
  
GRANT ALL ON SCHEMA m_amenagement TO sig_create;
GRANT USAGE ON SCHEMA m_amenagement TO read_sig;
GRANT ALL ON SCHEMA m_amenagement TO create_sig;
GRANT USAGE ON SCHEMA m_amenagement TO edit_sig;

ALTER DEFAULT PRIVILEGES IN SCHEMA m_amenagement
    GRANT INSERT, SELECT, UPDATE, DELETE, TRUNCATE, REFERENCES, TRIGGER ON TABLES
    TO create_sig;

ALTER DEFAULT PRIVILEGES IN SCHEMA m_amenagement
    GRANT INSERT, SELECT, UPDATE, DELETE ON TABLES
    TO edit_sig;

ALTER DEFAULT PRIVILEGES IN SCHEMA m_amenagement
    GRANT SELECT ON TABLES
    TO read_sig;  
  
  
GRANT ALL ON SCHEMA s_sirene TO sig_create;
GRANT ALL ON SCHEMA s_sirene TO create_sig;
GRANT USAGE ON SCHEMA s_sirene TO read_sig;
GRANT USAGE ON SCHEMA s_sirene TO edit_sig;

ALTER DEFAULT PRIVILEGES IN SCHEMA s_sirene
    GRANT INSERT, SELECT, UPDATE, DELETE, TRUNCATE, REFERENCES, TRIGGER ON TABLES
    TO create_sig;

ALTER DEFAULT PRIVILEGES IN SCHEMA s_sirene
    GRANT INSERT, SELECT, UPDATE, DELETE ON TABLES
    TO edit_sig;

ALTER DEFAULT PRIVILEGES IN SCHEMA s_sirene
    GRANT SELECT ON TABLES
    TO read_sig;
    
-- #################################################################### DOMAINE DE VALEUR  ####################################################################

GRANT ALL ON TABLE s_sirene.lt_cemployeur TO sig_create;
GRANT ALL ON TABLE s_sirene.lt_cemployeur TO create_sig;
GRANT SELECT ON TABLE s_sirene.lt_cemployeur TO read_sig;
GRANT SELECT, UPDATE, INSERT, DELETE ON TABLE s_sirene.lt_cemployeur TO edit_sig;

GRANT ALL ON TABLE s_sirene.lt_nafa TO sig_create;
GRANT ALL ON TABLE s_sirene.lt_nafa TO create_sig;
GRANT SELECT ON TABLE s_sirene.lt_nafa TO read_sig;
GRANT SELECT, UPDATE, INSERT, DELETE ON TABLE s_sirene.lt_nafa TO edit_sig;

GRANT ALL ON TABLE s_sirene.lt_trancheeff TO sig_create;
GRANT ALL ON TABLE s_sirene.lt_trancheeff TO create_sig;
GRANT SELECT ON TABLE s_sirene.lt_trancheeff TO read_sig;
GRANT SELECT, UPDATE, INSERT, DELETE ON TABLE s_sirene.lt_trancheeff TO edit_sig;

GRANT ALL ON TABLE s_sirene.lt_nap TO sig_create;
GRANT ALL ON TABLE s_sirene.lt_nap TO create_sig;
GRANT SELECT ON TABLE s_sirene.lt_nap TO read_sig;
GRANT SELECT, UPDATE, INSERT, DELETE ON TABLE s_sirene.lt_nap TO edit_sig;

GRANT ALL ON TABLE s_sirene.lt_nafrev2 TO sig_create;
GRANT ALL ON TABLE s_sirene.lt_nafrev2 TO create_sig;
GRANT SELECT ON TABLE s_sirene.lt_nafrev2 TO read_sig;
GRANT SELECT, UPDATE, INSERT, DELETE ON TABLE s_sirene.lt_nafrev2 TO edit_sig;

GRANT ALL ON TABLE s_sirene.lt_nafrev1 TO sig_create;
GRANT ALL ON TABLE s_sirene.lt_nafrev1 TO create_sig;
GRANT SELECT ON TABLE s_sirene.lt_nafrev1 TO read_sig;
GRANT SELECT, UPDATE, INSERT, DELETE ON TABLE s_sirene.lt_lt_nafrev1 TO edit_sig;

GRANT ALL ON TABLE s_sirene.lt_naf1993 TO sig_create;
GRANT ALL ON TABLE s_sirene.lt_naf1993 TO create_sig;
GRANT SELECT ON TABLE s_sirene.lt_naf1993 TO read_sig;
GRANT SELECT, UPDATE, INSERT, DELETE ON TABLE s_sirene.lt_naf1993 TO edit_sig;

GRANT ALL ON TABLE s_sirene.lt_etatadmin TO sig_create;
GRANT ALL ON TABLE s_sirene.lt_etatadmin TO create_sig;
GRANT SELECT ON TABLE s_sirene.lt_etatadmin TO read_sig;
GRANT SELECT, UPDATE, INSERT, DELETE ON TABLE s_sirene.lt_etatadmin TO edit_sig;

GRANT ALL ON TABLE s_sirene.lt_essul TO sig_create;
GRANT ALL ON TABLE s_sirene.lt_essul TO create_sig;
GRANT SELECT ON TABLE s_sirene.lt_essul TO read_sig;
GRANT SELECT, UPDATE, INSERT, DELETE ON TABLE s_sirene.lt_essul TO edit_sig;

GRANT ALL ON TABLE s_sirene.naf_n1 TO sig_create;
GRANT ALL ON TABLE s_sirene.naf_n1 TO create_sig;
GRANT SELECT ON TABLE s_sirene.naf_n1 TO read_sig;
GRANT SELECT, UPDATE, INSERT, DELETE ON TABLE s_sirene.naf_n1 TO edit_sig;

GRANT ALL ON TABLE s_sirene.naf_n2 TO sig_create;
GRANT ALL ON TABLE s_sirene.naf_n2 TO create_sig;
GRANT SELECT ON TABLE s_sirene.naf_n2 TO read_sig;
GRANT SELECT, UPDATE, INSERT, DELETE ON TABLE s_sirene.naf_n2 TO edit_sig;

GRANT ALL ON TABLE s_sirene.naf_n3 TO sig_create;
GRANT ALL ON TABLE s_sirene.naf_n3 TO create_sig;
GRANT SELECT ON TABLE s_sirene.naf_n3 TO read_sig;
GRANT SELECT, UPDATE, INSERT, DELETE ON TABLE s_sirene.naf_n3 TO edit_sig;

GRANT ALL ON TABLE s_sirene.naf_n4 TO sig_create;
GRANT ALL ON TABLE s_sirene.naf_n4 TO create_sig;
GRANT SELECT ON TABLE s_sirene.naf_n4 TO read_sig;
GRANT SELECT, UPDATE, INSERT, DELETE ON TABLE s_sirene.naf_n4 TO edit_sig;

GRANT ALL ON TABLE s_sirene.naf_n5 TO sig_create;
GRANT ALL ON TABLE s_sirene.naf_n5 TO create_sig;
GRANT SELECT ON TABLE s_sirene.naf_n5 TO read_sig;
GRANT SELECT, UPDATE, INSERT, DELETE ON TABLE s_sirene.naf_n5 TO edit_sig;

GRANT ALL ON TABLE r_objet.lt_objet_vocafon TO create_sig;
GRANT SELECT ON TABLE r_objet.lt_objet_vocafon TO read_sig;
GRANT SELECT, UPDATE, INSERT, DELETE ON TABLE r_objet.lt_objet_vocafon TO edit_sig;
GRANT ALL ON TABLE r_objet.lt_objet_vocafon TO sig_create;

GRANT ALL ON TABLE m_urbanisme_reg.lt_conso_type TO sig_create;
GRANT ALL ON TABLE m_urbanisme_reg.lt_conso_type TO create_sig;
GRANT SELECT ON TABLE m_urbanisme_reg.lt_conso_type TO read_sig;
GRANT SELECT, UPDATE, INSERT, DELETE ON TABLE m_urbanisme_reg.lt_conso_type TO edit_sig;

GRANT ALL ON TABLE m_urbanisme_reg.lt_ope_phase TO sig_create;
GRANT ALL ON TABLE m_urbanisme_reg.lt_ope_phase TO create_sig;
GRANT SELECT ON TABLE m_urbanisme_reg.lt_ope_phase TO read_sig;
GRANT SELECT, UPDATE, INSERT, DELETE ON TABLE m_urbanisme_reg.lt_ope_phase TO edit_sig;

GRANT ALL ON TABLE m_urbanisme_reg.lt_pr_fon_typ TO sig_create;
GRANT ALL ON TABLE m_urbanisme_reg.lt_pr_fon_typ TO create_sig;
GRANT SELECT ON TABLE m_urbanisme_reg.lt_pr_fon_typ TO read_sig;
GRANT SELECT, UPDATE, INSERT, DELETE ON TABLE m_urbanisme_reg.lt_pr_fon_typ TO edit_sig;

GRANT ALL ON TABLE m_urbanisme_reg.lt_proced TO sig_create;
GRANT ALL ON TABLE m_urbanisme_reg.lt_proced TO create_sig;
GRANT SELECT ON TABLE m_urbanisme_reg.lt_proced TO read_sig;
GRANT SELECT, UPDATE, INSERT, DELETE ON TABLE m_urbanisme_reg.lt_proced TO edit_sig;

GRANT ALL ON TABLE m_foncier.lt_ces_cond TO sig_create;
GRANT ALL ON TABLE m_foncier.lt_ces_cond TO create_sig;
GRANT SELECT ON TABLE m_foncier.lt_ces_cond TO read_sig;
GRANT SELECT, UPDATE, INSERT, DELETE ON TABLE m_foncier.lt_ces_cond TO edit_sig;

GRANT ALL ON TABLE m_foncier.lt_ces_doc TO sig_create;
GRANT ALL ON TABLE m_foncier.lt_ces_doc TO create_sig;
GRANT SELECT ON TABLE m_foncier.lt_ces_doc TO read_sig;
GRANT SELECT, UPDATE, INSERT, DELETE ON TABLE m_foncier.lt_ces_doc TO edit_sig;

GRANT ALL ON TABLE m_foncier.lt_ces_etat TO sig_create;
GRANT ALL ON TABLE m_foncier.lt_ces_etat TO create_sig;
GRANT SELECT ON TABLE m_foncier.lt_ces_etat TO read_sig;
GRANT SELECT, UPDATE, INSERT, DELETE ON TABLE m_foncier.lt_ces_etat TO edit_sig;

GRANT ALL ON TABLE m_foncier.lt_ces_nota TO sig_create;
GRANT ALL ON TABLE m_foncier.lt_ces_nota TO create_sig;
GRANT SELECT ON TABLE m_foncier.lt_ces_nota TO read_sig;
GRANT SELECT, UPDATE, INSERT, DELETE ON TABLE m_foncier.lt_ces_nota TO edit_sig;

GRANT ALL ON TABLE m_foncier.lt_ces_orga TO sig_create;
GRANT ALL ON TABLE m_foncier.lt_ces_orga TO create_sig;
GRANT SELECT ON TABLE m_foncier.lt_ces_orga TO read_sig;
GRANT SELECT, UPDATE, INSERT, DELETE ON TABLE m_foncier.lt_ces_orga TO edit_sig;

GRANT ALL ON TABLE m_foncier.lt_ces_tact TO sig_create;
GRANT ALL ON TABLE m_foncier.lt_ces_tact TO create_sig;
GRANT SELECT ON TABLE m_foncier.lt_ces_tact TO read_sig;
GRANT SELECT, UPDATE, INSERT, DELETE ON TABLE m_foncier.lt_ces_tact TO edit_sig;

GRANT ALL ON TABLE m_foncier.lt_ces_voca TO sig_create;
GRANT ALL ON TABLE m_foncier.lt_ces_voca TO create_sig;
GRANT SELECT ON TABLE m_foncier.lt_ces_voca TO read_sig;
GRANT SELECT, UPDATE, INSERT, DELETE ON TABLE m_foncier.lt_ces_voca TO edit_sig;

GRANT ALL ON TABLE m_foncier.lt_rel_lot TO sig_create;
GRANT ALL ON TABLE m_foncier.lt_rel_lot TO create_sig;
GRANT SELECT ON TABLE m_foncier.lt_rel_lot TO read_sig;
GRANT SELECT, UPDATE, INSERT, DELETE ON TABLE m_foncier.lt_rel_lot TO edit_sig;

GRANT ALL ON TABLE m_economie.lt_bal_ecomm TO sig_create;
GRANT ALL ON TABLE m_economie.lt_bal_ecomm TO create_sig;
GRANT SELECT ON TABLE m_economie.lt_bal_ecomm TO read_sig;
GRANT SELECT, UPDATE, INSERT, DELETE ON TABLE m_economie.lt_bal_ecomm TO edit_sig;

GRANT ALL ON TABLE m_economie.lt_bal_ncomm TO sig_create;
GRANT ALL ON TABLE m_economie.lt_bal_ncomm TO create_sig;
GRANT SELECT ON TABLE m_economie.lt_bal_ncomm TO read_sig;
GRANT SELECT, UPDATE, INSERT, DELETE ON TABLE m_economie.lt_bal_ncomm TO edit_sig;

GRANT ALL ON TABLE m_economie.lt_bal_source TO sig_create;
GRANT ALL ON TABLE m_economie.lt_bal_source TO create_sig;
GRANT SELECT ON TABLE m_economie.lt_bal_source TO read_sig;
GRANT SELECT, UPDATE, INSERT, DELETE ON TABLE m_economie.lt_bal_source TO edit_sig;

GRANT ALL ON TABLE m_economie.lt_bal_tlocal TO sig_create;
GRANT ALL ON TABLE m_economie.lt_bal_tlocal TO create_sig;
GRANT SELECT ON TABLE m_economie.lt_bal_tlocal TO read_sig;
GRANT SELECT, UPDATE, INSERT, DELETE ON TABLE m_economie.lt_bal_tlocal TO edit_sig;

GRANT ALL ON TABLE m_economie.lt_sa_aidepb TO sig_create;
GRANT ALL ON TABLE m_economie.lt_sa_aidepb TO create_sig;
GRANT SELECT ON TABLE m_economie.lt_sa_aidepb TO read_sig;
GRANT SELECT, UPDATE, INSERT, DELETE ON TABLE m_economie.lt_sa_aidepb TO edit_sig;

GRANT ALL ON TABLE m_economie.lt_sa_dest TO sig_create;
GRANT ALL ON TABLE m_economie.lt_sa_dest TO create_sig;
GRANT SELECT ON TABLE m_economie.lt_sa_dest TO read_sig;
GRANT SELECT, UPDATE, INSERT, DELETE ON TABLE m_economie.lt_sa_dest TO edit_sig;

GRANT ALL ON TABLE m_economie.lt_sa_etatoccup TO sig_create;
GRANT ALL ON TABLE m_economie.lt_sa_etatoccup TO create_sig;
GRANT SELECT ON TABLE m_economie.lt_sa_etatoccup TO read_sig;
GRANT SELECT, UPDATE, INSERT, DELETE ON TABLE m_economie.lt_sa_etatoccup TO edit_sig;

GRANT ALL ON TABLE m_economie.lt_sa_tact TO sig_create;
GRANT ALL ON TABLE m_economie.lt_sa_tact TO create_sig;
GRANT SELECT ON TABLE m_economie.lt_sa_tact TO read_sig;
GRANT SELECT, UPDATE, INSERT, DELETE ON TABLE m_economie.lt_sa_tact TO edit_sig;

GRANT ALL ON TABLE m_economie.lt_sa_typo TO sig_create;
GRANT ALL ON TABLE m_economie.lt_sa_typo TO create_sig;
GRANT SELECT ON TABLE m_economie.lt_sa_typo TO read_sig;
GRANT SELECT, UPDATE, INSERT, DELETE ON TABLE m_economie.lt_sa_typo TO edit_sig;

GRANT ALL ON TABLE m_economie.lt_sa_voca TO sig_create;
GRANT ALL ON TABLE m_economie.lt_sa_voca TO create_sig;
GRANT SELECT ON TABLE m_economie.lt_sa_voca TO read_sig;
GRANT SELECT, UPDATE, INSERT, DELETE ON TABLE m_economie.lt_sa_voca TO edit_sig;

GRANT ALL ON TABLE m_amenagement.lt_sa_etat TO sig_create;
GRANT ALL ON TABLE m_amenagement.lt_sa_etat TO create_sig;
GRANT SELECT, UPDATE, INSERT, DELETE ON TABLE m_amenagement.lt_sa_etat TO edit_sig;
GRANT SELECT ON TABLE m_amenagement.lt_sa_etat TO read_sig;

GRANT ALL ON TABLE m_amenagement.lt_sa_stadeamng TO sig_create;
GRANT ALL ON TABLE m_amenagement.lt_sa_stadeamng TO create_sig;
GRANT SELECT, UPDATE, INSERT, DELETE ON TABLE m_amenagement.lt_sa_stadeamng TO edit_sig;
GRANT SELECT ON TABLE m_amenagement.lt_sa_stadeamng TO read_sig;

GRANT ALL ON TABLE m_amenagement.lt_sa_stadeamng2 TO sig_create;
GRANT ALL ON TABLE m_amenagement.lt_sa_stadeamng2 TO create_sig;
GRANT SELECT, UPDATE, INSERT, DELETE ON TABLE m_amenagement.lt_sa_stadeamng2 TO edit_sig;
GRANT SELECT ON TABLE m_amenagement.lt_sa_stadeamng2 TO read_sig;

GRANT ALL ON TABLE m_amenagement.lt_sa_stadecomm TO sig_create;
GRANT ALL ON TABLE m_amenagement.lt_sa_stadecomm TO create_sig;
GRANT SELECT, UPDATE, INSERT, DELETE ON TABLE m_amenagement.lt_sa_stadecomm TO edit_sig;
GRANT SELECT ON TABLE m_amenagement.lt_sa_stadecomm TO read_sig;

GRANT ALL ON TABLE m_amenagement.lt_sa_stadecomm2 TO sig_create;
GRANT ALL ON TABLE m_amenagement.lt_sa_stadecomm2 TO create_sig;
GRANT SELECT, UPDATE, INSERT, DELETE ON TABLE m_amenagement.lt_sa_stadecomm2 TO edit_sig;
GRANT SELECT ON TABLE m_amenagement.lt_sa_stadecomm2 TO read_sig;


-- #################################################################### SEQUENCE  ####################################################################

GRANT ALL ON SEQUENCE s_sirene.an_etablissement_gid_seq TO sig_create;
GRANT ALL ON SEQUENCE s_sirene.an_etablissement_gid_seq TO public;
GRANT ALL ON SEQUENCE s_sirene.an_etablissement_gid_seq TO create_sig;

GRANT ALL ON SEQUENCE public.idgeo_seq TO postgres;
GRANT ALL ON SEQUENCE public.idgeo_seq TO public;
GRANT ALL ON SEQUENCE public.idgeo_seq TO create_sig;

GRANT ALL ON SEQUENCE m_foncier.an_fon_doc_media_gid_seq TO sig_create;
GRANT ALL ON SEQUENCE m_foncier.an_fon_doc_media_gid_seq TO public;
GRANT ALL ON SEQUENCE m_foncier.an_fon_doc_media_gid_seq TO create_sig;

GRANT ALL ON SEQUENCE m_foncier.ces_seq TO sig_create;
GRANT ALL ON SEQUENCE m_foncier.ces_seq TO postgres;
GRANT ALL ON SEQUENCE m_foncier.ces_seq TO create_sig;
GRANT ALL ON SEQUENCE m_foncier.ces_seq TO public;

GRANT ALL ON SEQUENCE m_economie.an_lot_doc_media_gid_seq TO sig_create;
GRANT ALL ON SEQUENCE m_economie.an_lot_doc_media_gid_seq TO public;
GRANT ALL ON SEQUENCE m_economie.an_lot_doc_media_gid_seq TO create_sig;

GRANT ALL ON SEQUENCE m_economie.an_sa_dia_gid_seq TO sig_create;
GRANT ALL ON SEQUENCE m_economie.an_sa_dia_gid_seq TO public;
GRANT ALL ON SEQUENCE m_economie.an_sa_dia_gid_seq TO create_sig;

GRANT ALL ON SEQUENCE m_economie.an_sa_etab_id_seq TO sig_create;
GRANT ALL ON SEQUENCE m_economie.an_sa_etab_id_seq TO public;
GRANT ALL ON SEQUENCE m_economie.an_sa_etab_id_seq TO create_sig;

GRANT ALL ON SEQUENCE m_economie.an_site_doc_media_gig_seq TO sig_create;
GRANT ALL ON SEQUENCE m_economie.an_site_doc_media_gig_seq TO public;
GRANT ALL ON SEQUENCE m_economie.an_site_doc_media_gig_seq TO create_sig;

GRANT ALL ON SEQUENCE m_economie.h_an_sa_etab_gid_seq TO sig_create;
GRANT ALL ON SEQUENCE m_economie.h_an_sa_etab_gid_seq TO public;
GRANT ALL ON SEQUENCE m_economie.h_an_sa_etab_gid_seq TO create_s

GRANT ALL ON SEQUENCE m_economie.h_an_sa_site_id_seq TO sig_create;
GRANT ALL ON SEQUENCE m_economie.h_an_sa_site_id_seq TO public;
GRANT ALL ON SEQUENCE m_economie.h_an_sa_site_id_seq TO create_sig;

GRANT ALL ON SEQUENCE m_amenagement.h_an_amt_site_mixte_gid_seq TO sig_create;
GRANT ALL ON SEQUENCE m_amenagement.h_an_amt_site_mixte_gid_seq TO public;


-- #################################################################### TABLE  ####################################################################

GRANT ALL ON TABLE s_sirene.an_etablissement_api TO sig_create;
GRANT ALL ON TABLE s_sirene.an_etablissement_api TO create_sig;
GRANT SELECT ON TABLE s_sirene.an_etablissement_api TO read_sig;
GRANT SELECT, UPDATE, INSERT, DELETE ON TABLE s_sirene.an_etablissement_api TO edit_sig;

GRANT ALL ON TABLE s_sirene.an_unitelegale_api TO sig_create;
GRANT ALL ON TABLE s_sirene.an_unitelegale_api TO create_sig;
GRANT SELECT ON TABLE s_sirene.an_unitelegale_api TO read_sig;
GRANT SELECT, UPDATE, INSERT, DELETE ON TABLE s_sirene.an_unitelegale_api TO edit_sig;

GRANT ALL ON TABLE r_objet.geo_objet_empesp_pu TO create_sig;
GRANT SELECT ON TABLE r_objet.geo_objet_empesp_pu TO read_sig;
GRANT SELECT, UPDATE, INSERT, DELETE ON TABLE r_objet.geo_objet_empesp_pu TO edit_sig;
GRANT ALL ON TABLE r_objet.geo_objet_empesp_pu TO sig_create;

GRANT ALL ON TABLE r_objet.geo_objet_etab TO create_sig;
GRANT SELECT ON TABLE r_objet.geo_objet_etab TO read_sig;
GRANT SELECT, UPDATE, INSERT, DELETE ON TABLE r_objet.geo_objet_etab TO edit_sig;
GRANT ALL ON TABLE r_objet.geo_objet_etab TO sig_create;

GRANT ALL ON TABLE r_objet.geo_objet_fon_lot TO create_sig;
GRANT SELECT ON TABLE r_objet.geo_objet_fon_lot TO read_sig;
GRANT SELECT, UPDATE, INSERT, DELETE ON TABLE r_objet.geo_objet_fon_lot TO edit_sig;
GRANT ALL ON TABLE r_objet.geo_objet_fon_lot TO sig_create;

GRANT ALL ON TABLE r_objet.geo_objet_ope TO create_sig;
GRANT SELECT ON TABLE r_objet.geo_objet_ope TO read_sig;
GRANT SELECT, UPDATE, INSERT, DELETE ON TABLE r_objet.geo_objet_ope TO edit_sig;
GRANT ALL ON TABLE r_objet.geo_objet_ope TO sig_create;

GRANT ALL ON TABLE r_objet.geo_objet_site TO create_sig;
GRANT SELECT ON TABLE r_objet.geo_objet_site TO read_sig;
GRANT SELECT, UPDATE, INSERT, DELETE ON TABLE r_objet.geo_objet_site TO edit_sig;
GRANT ALL ON TABLE r_objet.geo_objet_site TO sig_create;

GRANT ALL ON TABLE m_urbanisme_reg.an_proced TO sig_create;
GRANT ALL ON TABLE m_urbanisme_reg.an_proced TO create_sig;
GRANT SELECT ON TABLE m_urbanisme_reg.an_proced TO read_sig;
GRANT SELECT, UPDATE, INSERT, DELETE ON TABLE m_urbanisme_reg.an_proced TO edit_sig;

GRANT ALL ON TABLE m_foncier.an_cession TO sig_create;
GRANT ALL ON TABLE m_foncier.an_cession TO create_sig;
GRANT SELECT ON TABLE m_foncier.an_cession TO read_sig;
GRANT SELECT, UPDATE, INSERT, DELETE ON TABLE m_foncier.an_cession TO edit_sig;

GRANT ALL ON TABLE m_foncier.lk_cession_lot TO sig_create;
GRANT ALL ON TABLE m_foncier.lk_cession_lot TO create_sig;
GRANT SELECT ON TABLE m_foncier.lk_cession_lot TO read_sig;
GRANT SELECT, UPDATE, INSERT, DELETE ON TABLE m_foncier.lk_cession_lot TO edit_sig;

GRANT ALL ON TABLE m_economie.an_lot_doc_media TO sig_create;
GRANT ALL ON TABLE m_economie.an_lot_doc_media TO create_sig;
GRANT SELECT ON TABLE m_economie.an_lot_doc_media TO read_sig;
GRANT SELECT, UPDATE, INSERT, DELETE ON TABLE m_economie.an_lot_doc_media TO edit_sig;

GRANT ALL ON TABLE m_economie.an_sa_dia TO sig_create;
GRANT ALL ON TABLE m_economie.an_sa_dia TO create_sig;
GRANT SELECT ON TABLE m_economie.an_sa_dia TO read_sig;
GRANT SELECT, UPDATE, INSERT, DELETE ON TABLE m_economie.an_sa_dia TO edit_sig;

GRANT ALL ON TABLE m_economie.an_sa_etab TO sig_create;
GRANT ALL ON TABLE m_economie.an_sa_etab TO create_sig;
GRANT SELECT ON TABLE m_economie.an_sa_etab TO read_sig;
GRANT SELECT, UPDATE, INSERT, DELETE ON TABLE m_economie.an_sa_etab TO edit_sig;

GRANT ALL ON TABLE m_economie.an_sa_lot TO sig_create;
GRANT ALL ON TABLE m_economie.an_sa_lot TO create_sig;
GRANT SELECT ON TABLE m_economie.an_sa_lot TO read_sig;
GRANT SELECT, UPDATE, INSERT, DELETE ON TABLE m_economie.an_sa_lot TO edit_sig;

GRANT ALL ON TABLE m_economie.an_sa_site TO sig_create;
GRANT ALL ON TABLE m_economie.an_sa_site TO create_sig;
GRANT SELECT ON TABLE m_economie.an_sa_site TO read_sig;
GRANT SELECT, UPDATE, INSERT, DELETE ON TABLE m_economie.an_sa_site TO edit_sig;

GRANT ALL ON TABLE m_economie.an_site_doc_media TO sig_create;
GRANT ALL ON TABLE m_economie.an_site_doc_media TO create_sig;
GRANT SELECT ON TABLE m_economie.an_site_doc_media TO read_sig;
GRANT SELECT, UPDATE, INSERT, DELETE ON TABLE m_economie.an_site_doc_media TO edit_sig;

GRANT ALL ON TABLE m_economie.geo_sa_bal TO sig_create;
GRANT ALL ON TABLE m_economie.geo_sa_bal TO create_sig;
GRANT SELECT ON TABLE m_economie.geo_sa_bal TO read_sig;
GRANT SELECT, UPDATE, INSERT, DELETE ON TABLE m_economie.geo_sa_bal TO edit_sig;

GRANT ALL ON TABLE m_economie.geo_sa_etabp TO sig_create;
GRANT ALL ON TABLE m_economie.geo_sa_etabp TO create_sig;
GRANT SELECT ON TABLE m_economie.geo_sa_etabp TO read_sig;
GRANT SELECT, UPDATE, INSERT, DELETE ON TABLE m_economie.geo_sa_etabp TO edit_sig;

GRANT ALL ON TABLE m_economie.geo_sa_pole TO sig_create;
GRANT ALL ON TABLE m_economie.geo_sa_pole TO create_sig;
GRANT SELECT ON TABLE m_economie.geo_sa_pole TO read_sig;
GRANT SELECT, UPDATE, INSERT, DELETE ON TABLE m_economie.geo_sa_pole TO edit_sig;

GRANT ALL ON TABLE m_economie.geo_sa_site_zu TO sig_create;
GRANT ALL ON TABLE m_economie.geo_sa_site_zu TO create_sig;
GRANT SELECT ON TABLE m_economie.geo_sa_site_zu TO read_sig;
GRANT SELECT, UPDATE, INSERT, DELETE ON TABLE m_economie.geo_sa_site_zu TO edit_sig;

GRANT ALL ON TABLE m_economie.h_an_sa_etab TO sig_create;
GRANT ALL ON TABLE m_economie.h_an_sa_etab TO create_sig;
GRANT SELECT ON TABLE m_economie.h_an_sa_etab TO read_sig;
GRANT SELECT, UPDATE, INSERT, DELETE ON TABLE m_economie.h_an_sa_etab TO edit_sig;

GRANT ALL ON TABLE m_economie.h_an_sa_site TO sig_create;
GRANT ALL ON TABLE m_economie.h_an_sa_site TO create_sig;
GRANT SELECT ON TABLE m_economie.h_an_sa_site TO read_sig;
GRANT SELECT, UPDATE, INSERT, DELETE ON TABLE m_economie.h_an_sa_site TO edit_sig;

GRANT ALL ON TABLE m_economie.log_suivi_audit TO sig_create;
GRANT SELECT, UPDATE, INSERT, DELETE ON TABLE m_economie.log_suivi_audit TO edit_sig;
GRANT ALL ON TABLE m_economie.log_suivi_audit TO create_sig;
GRANT SELECT ON TABLE m_economie.log_suivi_audit TO read_sig;

GRANT ALL ON TABLE m_economie.geo_sa_local TO sig_create;
GRANT ALL ON TABLE m_economie.geo_sa_local TO create_sig;
GRANT SELECT ON TABLE m_economie.geo_sa_local TO read_sig;
GRANT SELECT, UPDATE, INSERT, DELETE ON TABLE m_economie.geo_sa_local TO edit_sig;

GRANT ALL ON TABLE m_economie.lk_adresseetablissement TO sig_create;
GRANT ALL ON TABLE m_economie.lk_adresseetablissement TO create_sig;
GRANT SELECT ON TABLE m_economie.lk_adresseetablissement TO read_sig;
GRANT SELECT, UPDATE, INSERT, DELETE ON TABLE m_economie.lk_adresseetablissement TO edit_sig;

GRANT ALL ON TABLE m_economie.lk_localsiret TO sig_create;
GRANT ALL ON TABLE m_economie.lk_localsiret TO create_sig;
GRANT SELECT ON TABLE m_economie.lk_localsiret TO read_sig;
GRANT SELECT, UPDATE, INSERT, DELETE ON TABLE m_economie.lk_localsiret TO edit_sig;

GRANT ALL ON TABLE m_amenagement.an_amt_esppu TO sig_create;
GRANT SELECT ON TABLE m_amenagement.an_amt_esppu TO read_sig;
GRANT SELECT, UPDATE, INSERT, DELETE ON TABLE m_amenagement.an_amt_esppu TO edit_sig;

GRANT ALL ON TABLE m_amenagement.an_amt_lot_divers TO sig_create;
GRANT ALL ON TABLE m_amenagement.an_amt_lot_divers TO create_sig;
GRANT SELECT, UPDATE, INSERT, DELETE ON TABLE m_amenagement.an_amt_lot_divers TO edit_sig;
GRANT SELECT ON TABLE m_amenagement.an_amt_lot_divers TO read_sig;

GRANT ALL ON TABLE m_amenagement.an_amt_lot_equ TO sig_create;
GRANT SELECT ON TABLE m_amenagement.an_amt_lot_equ TO read_sig;
GRANT SELECT, UPDATE, INSERT, DELETE ON TABLE m_amenagement.an_amt_lot_equ TO edit_sig;

GRANT ALL ON TABLE m_amenagement.an_amt_lot_hab TO sig_create;
GRANT SELECT ON TABLE m_amenagement.an_amt_lot_hab TO read_sig;
GRANT SELECT, UPDATE, INSERT, DELETE ON TABLE m_amenagement.an_amt_lot_hab TO edit_sig;

GRANT ALL ON TABLE m_amenagement.an_amt_lot_mixte TO sig_create;
GRANT SELECT ON TABLE m_amenagement.an_amt_lot_mixte TO read_sig;
GRANT SELECT, UPDATE, INSERT, DELETE ON TABLE m_amenagement.an_amt_lot_mixte TO edit_sig;

GRANT ALL ON TABLE m_amenagement.an_amt_lot_stade TO sig_create;
GRANT ALL ON TABLE m_amenagement.an_amt_lot_stade TO create_sig;
GRANT SELECT, UPDATE, INSERT, DELETE ON TABLE m_amenagement.an_amt_lot_stade TO edit_sig;
GRANT SELECT ON TABLE m_amenagement.an_amt_lot_stade TO read_sig;

GRANT ALL ON TABLE m_amenagement.an_amt_site_equ TO sig_create;
GRANT SELECT ON TABLE m_amenagement.an_amt_site_equ TO read_sig;
GRANT SELECT, UPDATE, INSERT, DELETE ON TABLE m_amenagement.an_amt_site_equ TO edit_si

GRANT ALL ON TABLE m_amenagement.an_amt_site_habitat TO sig_create;
GRANT SELECT ON TABLE m_amenagement.an_amt_site_habitat TO read_sig;
GRANT SELECT, UPDATE, INSERT, DELETE ON TABLE m_amenagement.an_amt_site_habitat TO edit_sig;

GRANT ALL ON TABLE m_amenagement.an_amt_site_mixte TO sig_create;
GRANT SELECT ON TABLE m_amenagement.an_amt_site_mixte TO read_sig;
GRANT SELECT, UPDATE, INSERT, DELETE ON TABLE m_amenagement.an_amt_site_mixte TO edit_sig;

GRANT ALL ON TABLE m_amenagement.geo_amt_zae_transfere TO sig_create;
GRANT SELECT ON TABLE m_amenagement.geo_amt_zae_transfere TO read_sig;
GRANT SELECT, UPDATE, INSERT, DELETE ON TABLE m_amenagement.geo_amt_zae_transfere TO edit_sig;


-- #################################################################### VUE DE GESTION  ####################################################################

GRANT ALL ON TABLE r_objet.geo_v_empesp_pu TO create_sig;
GRANT SELECT ON TABLE r_objet.geo_v_empesp_pu TO read_sig;
GRANT SELECT, UPDATE, INSERT, DELETE ON TABLE r_objet.geo_v_empesp_pu TO edit_sig;
GRANT ALL ON TABLE r_objet.geo_v_empesp_pu TO sig_create;

GRANT ALL ON TABLE r_objet.geo_v_lot TO sig_create;
GRANT ALL ON TABLE r_objet.geo_v_lot TO create_sig;
GRANT SELECT, UPDATE, INSERT, DELETE ON TABLE r_objet.geo_v_lot TO edit_sig;
GRANT SELECT ON TABLE r_objet.geo_v_lot TO read_sig;

GRANT ALL ON TABLE r_objet.geo_v_proc TO create_sig;
GRANT SELECT ON TABLE r_objet.geo_v_proc TO read_sig;
GRANT SELECT, UPDATE, INSERT, DELETE ON TABLE r_objet.geo_v_proc TO edit_sig;
GRANT ALL ON TABLE r_objet.geo_v_proc TO sig_create;

GRANT ALL ON TABLE m_urbanisme_reg.geo_v_proc TO sig_create WITH GRANT OPTION;
GRANT ALL ON TABLE m_urbanisme_reg.geo_v_proc TO create_sig;
GRANT SELECT, UPDATE, INSERT, DELETE ON TABLE m_urbanisme_reg.geo_v_proc TO edit_sig;
GRANT SELECT ON TABLE m_urbanisme_reg.geo_v_proc TO read_sig;

GRANT ALL ON TABLE m_economie.an_v_sa_etab_cree_majsirene TO sig_create;
GRANT SELECT, UPDATE, INSERT, DELETE ON TABLE m_economie.an_v_sa_etab_cree_majsirene TO edit_sig;
GRANT ALL ON TABLE m_economie.an_v_sa_etab_cree_majsirene TO create_sig;
GRANT SELECT ON TABLE m_economie.an_v_sa_etab_cree_majsirene TO read_sig;

GRANT ALL ON TABLE m_economie.an_v_sa_etab_sup_majsirene TO sig_create;
GRANT SELECT, UPDATE, INSERT, DELETE ON TABLE m_economie.an_v_sa_etab_sup_majsirene TO edit_sig;
GRANT ALL ON TABLE m_economie.an_v_sa_etab_sup_majsirene TO create_sig;
GRANT SELECT ON TABLE m_economie.an_v_sa_etab_sup_majsirene TO read_sig;

GRANT ALL ON TABLE m_economie.geo_v_lot_eco TO sig_create;
GRANT ALL ON TABLE m_economie.geo_v_lot_eco TO create_sig;
GRANT SELECT, UPDATE, INSERT, DELETE ON TABLE m_economie.geo_v_lot_eco TO edit_sig;
GRANT SELECT ON TABLE m_economie.geo_v_lot_eco TO read_sig;

GRANT ALL ON TABLE m_economie.geo_v_site_eco TO sig_create;
GRANT ALL ON TABLE m_economie.geo_v_site_eco TO create_sig;
GRANT SELECT ON TABLE m_economie.geo_v_site_eco TO read_sig;
GRANT SELECT, UPDATE, INSERT, DELETE ON TABLE m_economie.geo_v_site_eco TO edit_sig;

GRANT ALL ON TABLE m_amenagement.geo_v_empesp_pu TO sig_create;
GRANT SELECT ON TABLE m_amenagement.geo_v_empesp_pu TO read_sig;
GRANT SELECT, UPDATE, INSERT, DELETE ON TABLE m_amenagement.geo_v_empesp_pu TO edit_sig;

GRANT ALL ON TABLE m_amenagement.geo_v_lot_divers TO sig_create;
GRANT ALL ON TABLE m_amenagement.geo_v_lot_divers TO create_sig;
GRANT SELECT, UPDATE, INSERT, DELETE ON TABLE m_amenagement.geo_v_lot_divers TO edit_sig;
GRANT SELECT ON TABLE m_amenagement.geo_v_lot_divers TO read_sig;

GRANT ALL ON TABLE m_amenagement.geo_v_lot_equ TO sig_create;
GRANT ALL ON TABLE m_amenagement.geo_v_lot_equ TO create_sig;
GRANT SELECT, UPDATE, INSERT, DELETE ON TABLE m_amenagement.geo_v_lot_equ TO edit_sig;
GRANT SELECT ON TABLE m_amenagement.geo_v_lot_equ TO read_sig;

GRANT ALL ON TABLE m_amenagement.geo_v_lot_esppu TO sig_create;
GRANT ALL ON TABLE m_amenagement.geo_v_lot_esppu TO create_sig;
GRANT SELECT, UPDATE, INSERT, DELETE ON TABLE m_amenagement.geo_v_lot_esppu TO edit_sig;
GRANT SELECT ON TABLE m_amenagement.geo_v_lot_esppu TO read_sig;

GRANT ALL ON TABLE m_amenagement.geo_v_lot_hab TO sig_create;
GRANT ALL ON TABLE m_amenagement.geo_v_lot_hab TO create_sig;
GRANT SELECT, UPDATE, INSERT, DELETE ON TABLE m_amenagement.geo_v_lot_hab TO edit_sig;
GRANT SELECT ON TABLE m_amenagement.geo_v_lot_hab TO read_sig;

GRANT ALL ON TABLE m_amenagement.geo_v_lot_mixte TO sig_create;
GRANT ALL ON TABLE m_amenagement.geo_v_lot_mixte TO create_sig;
GRANT SELECT, UPDATE, INSERT, DELETE ON TABLE m_amenagement.geo_v_lot_mixte TO edit_sig;
GRANT SELECT ON TABLE m_amenagement.geo_v_lot_mixte TO read_sig;

GRANT ALL ON TABLE m_amenagement.geo_v_site_equipement TO sig_create;
GRANT SELECT ON TABLE m_amenagement.geo_v_site_equipement TO read_sig;
GRANT SELECT, UPDATE, INSERT, DELETE ON TABLE m_amenagement.geo_v_site_equipement TO edit_sig;

GRANT ALL ON TABLE m_amenagement.geo_v_site_habitat TO sig_create;
GRANT SELECT ON TABLE m_amenagement.geo_v_site_habitat TO read_sig;
GRANT SELECT, UPDATE, INSERT, DELETE ON TABLE m_amenagement.geo_v_site_habitat TO edit_sig;

GRANT ALL ON TABLE m_amenagement.geo_v_site_mixte TO sig_create;
GRANT SELECT ON TABLE m_amenagement.geo_v_site_mixte TO read_sig;
GRANT SELECT, UPDATE, INSERT, DELETE ON TABLE m_amenagement.geo_v_site_mixte TO edit_sig;



-- #################################################################### VUE APPLICATIVE  ####################################################################

GRANT ALL ON TABLE x_apps.xapps_an_v_synt_proc TO sig_create;
GRANT ALL ON TABLE x_apps.xapps_an_v_synt_proc TO create_sig;
GRANT SELECT, UPDATE, INSERT, DELETE ON TABLE x_apps.xapps_an_v_synt_proc TO edit_sig;
GRANT SELECT ON TABLE x_apps.xapps_an_v_synt_proc TO read_sig;

GRANT ALL ON TABLE x_apps.xapps_an_vmr_bilan_procedure TO sig_create;
GRANT ALL ON TABLE x_apps.xapps_an_vmr_bilan_procedure TO create_sig;
GRANT SELECT, UPDATE, INSERT, DELETE ON TABLE x_apps.xapps_an_vmr_bilan_procedure TO edit_sig;
GRANT SELECT ON TABLE x_apps.xapps_an_vmr_bilan_procedure TO read_sig;

GRANT ALL ON TABLE x_apps.xapps_an_vmr_synt_pole_api TO sig_create;
GRANT ALL ON TABLE x_apps.xapps_an_vmr_synt_pole_api TO create_sig;
GRANT SELECT, UPDATE, INSERT, DELETE ON TABLE x_apps.xapps_an_vmr_synt_pole_api TO edit_sig;
GRANT SELECT ON TABLE x_apps.xapps_an_vmr_synt_pole_api TO read_sig;

GRANT ALL ON TABLE x_apps.xapps_an_vmr_synt_site_act_api TO sig_create;
GRANT ALL ON TABLE x_apps.xapps_an_vmr_synt_site_act_api TO create_sig;
GRANT SELECT, UPDATE, INSERT, DELETE ON TABLE x_apps.xapps_an_vmr_synt_site_act_api TO edit_sig;
GRANT SELECT ON TABLE x_apps.xapps_an_vmr_synt_site_act_api TO read_sig;

GRANT ALL ON TABLE x_apps.xapps_an_vmr_synt_site_mixte_api TO sig_create;
GRANT ALL ON TABLE x_apps.xapps_an_vmr_synt_site_mixte_api TO create_sig;
GRANT SELECT, UPDATE, INSERT, DELETE ON TABLE x_apps.xapps_an_vmr_synt_site_mixte_api TO edit_sig;
GRANT SELECT ON TABLE x_apps.xapps_an_vmr_synt_site_mixte_api TO read_sig;

GRANT ALL ON TABLE x_apps.xapps_geo_v_lot_com TO sig_create;
GRANT ALL ON TABLE x_apps.xapps_geo_v_lot_com TO create_sig;
GRANT SELECT, UPDATE, INSERT, DELETE ON TABLE x_apps.xapps_geo_v_lot_com TO edit_sig;
GRANT SELECT ON TABLE x_apps.xapps_geo_v_lot_com TO read_sig;

GRANT ALL ON TABLE x_apps.xapps_geo_v_lot_nr TO sig_create;
GRANT SELECT, UPDATE, INSERT, DELETE ON TABLE x_apps.xapps_geo_v_lot_nr TO edit_sig;
GRANT SELECT ON TABLE x_apps.xapps_geo_v_lot_nr TO read_sig;

GRANT ALL ON TABLE x_apps.xapps_geo_v_lotmixte_etiq TO sig_create;
GRANT SELECT, UPDATE, INSERT, DELETE ON TABLE x_apps.xapps_geo_v_lotmixte_etiq TO edit_sig;
GRANT SELECT ON TABLE x_apps.xapps_geo_v_lotmixte_etiq TO read_sig;

GRANT ALL ON TABLE x_apps.xapps_geo_v_site_lot_hab TO sig_create;
GRANT SELECT, UPDATE, INSERT, DELETE ON TABLE x_apps.xapps_geo_v_site_lot_hab TO edit_sig;
GRANT ALL ON TABLE x_apps.xapps_geo_v_site_lot_hab TO create_sig;
GRANT SELECT ON TABLE x_apps.xapps_geo_v_site_lot_hab TO read_sig;

GRANT ALL ON TABLE x_apps.xapps_geo_v_zae TO sig_create;
GRANT SELECT, UPDATE, INSERT, DELETE ON TABLE x_apps.xapps_geo_v_zae TO edit_sig;
GRANT ALL ON TABLE x_apps.xapps_geo_v_zae TO create_sig;
GRANT SELECT ON TABLE x_apps.xapps_geo_v_zae TO read_sig;

GRANT ALL ON TABLE x_apps.xapps_geo_vmr_etab_api TO sig_create;
GRANT ALL ON TABLE x_apps.xapps_geo_vmr_etab_api TO create_sig;
GRANT SELECT, UPDATE, INSERT, DELETE ON TABLE x_apps.xapps_geo_vmr_etab_api TO edit_sig;
GRANT SELECT ON TABLE x_apps.xapps_geo_vmr_etab_api TO read_sig;

GRANT ALL ON TABLE x_apps.xapps_geo_vmr_etab_api TO sig_create;
GRANT ALL ON TABLE x_apps.xapps_geo_vmr_etab_api TO create_sig;
GRANT SELECT, UPDATE, INSERT, DELETE ON TABLE x_apps.xapps_geo_vmr_etab_api TO edit_sig;
GRANT SELECT ON TABLE x_apps.xapps_geo_vmr_etab_api TO read_sig;

GRANT ALL ON TABLE x_apps.xapps_geo_vmr_local TO sig_create WITH GRANT OPTION;
GRANT ALL ON TABLE x_apps.xapps_geo_vmr_local TO create_sig;
GRANT SELECT, UPDATE, INSERT, DELETE ON TABLE x_apps.xapps_geo_vmr_local TO edit_sig;
GRANT SELECT ON TABLE x_apps.xapps_geo_vmr_local TO read_sig;



-- #################################################################### VUE GRAND PUBLIC  ####################################################################

-- sans objet

-- #################################################################### VUE OPENDATA  ####################################################################

-- sans objet

-- #################################################################### FUNCTION TRIGGER  ####################################################################

GRANT EXECUTE ON FUNCTION r_objet.ft_geo_etab_objet_idsite() TO create_sig;
GRANT EXECUTE ON FUNCTION r_objet.ft_geo_etab_objet_idsite() TO sig_create;
GRANT EXECUTE ON FUNCTION r_objet.ft_geo_etab_objet_idsite() TO public;

GRANT EXECUTE ON FUNCTION r_objet.ft_m_delete_proc() TO create_sig;
GRANT EXECUTE ON FUNCTION r_objet.ft_m_delete_proc() TO sig_create;
GRANT EXECUTE ON FUNCTION r_objet.ft_m_delete_proc() TO public;

GRANT EXECUTE ON FUNCTION r_objet.ft_m_geo_vmr_proc() TO public;
GRANT EXECUTE ON FUNCTION r_objet.ft_m_geo_vmr_proc() TO sig_create;
GRANT EXECUTE ON FUNCTION r_objet.ft_m_geo_vmr_proc() TO create_sig;	

GRANT EXECUTE ON FUNCTION r_objet.ft_m_empesp_pu_update() TO create_sig;
GRANT EXECUTE ON FUNCTION r_objet.ft_m_empesp_pu_update() TO sig_create;
GRANT EXECUTE ON FUNCTION r_objet.ft_m_empesp_pu_update() TO public;

GRANT EXECUTE ON FUNCTION r_objet.ft_m_empesppu_delete() TO create_sig;
GRANT EXECUTE ON FUNCTION r_objet.ft_m_empesppu_delete() TO sig_create;
GRANT EXECUTE ON FUNCTION r_objet.ft_m_empesppu_delete() TO public;

GRANT EXECUTE ON FUNCTION r_objet.ft_m_empesppu_insert() TO create_sig;
GRANT EXECUTE ON FUNCTION r_objet.ft_m_empesppu_insert() TO sig_create;
GRANT EXECUTE ON FUNCTION r_objet.ft_m_empesppu_insert() TO public;

GRANT EXECUTE ON FUNCTION r_objet.ft_m_etab_insert() TO create_sig;
GRANT EXECUTE ON FUNCTION r_objet.ft_m_etab_insert() TO sig_create;
GRANT EXECUTE ON FUNCTION r_objetft_.m_etab_insert() TO public;

GRANT EXECUTE ON FUNCTION r_objet.ft_m_foncier_delete() TO create_sig;
GRANT EXECUTE ON FUNCTION r_objet.ft_m_foncier_delete() TO sig_create;
GRANT EXECUTE ON FUNCTION r_objet.ft_m_foncier_delete() TO public;
GRANT EXECUTE ON FUNCTION r_objet.ft_m_foncier_delete() TO edit_sig;


GRANT EXECUTE ON FUNCTION r_objet.ft_m_foncier_insert() TO create_sig;
GRANT EXECUTE ON FUNCTION r_objet.ft_m_foncier_insert() TO sig_create;
GRANT EXECUTE ON FUNCTION r_objet.ft_m_foncier_insert() TO public;
GRANT EXECUTE ON FUNCTION r_objet.ft_m_foncier_insert() TO edit_sig;

GRANT EXECUTE ON FUNCTION r_objet.ft_m_foncier_update() TO create_sig;
GRANT EXECUTE ON FUNCTION r_objet.ft_m_foncier_update() TO sig_create;
GRANT EXECUTE ON FUNCTION r_objet.ft_m_foncier_update() TO public;
GRANT EXECUTE ON FUNCTION r_objet.ft_m_foncier_update() TO edit_sig;

GRANT EXECUTE ON FUNCTION r_objet.ft_m_insert_proc() TO create_sig;
GRANT EXECUTE ON FUNCTION r_objet.ft_m_insert_proc() TO sig_create;
GRANT EXECUTE ON FUNCTION r_objet.ft_m_insert_proc() TO public;

GRANT EXECUTE ON FUNCTION r_objet.ft_m_update_proc() TO create_sig;
GRANT EXECUTE ON FUNCTION r_objet.ft_m_update_proc() TO sig_create;
GRANT EXECUTE ON FUNCTION r_objet.ft_m_update_proc() TO public

GRANT EXECUTE ON FUNCTION r_objet.ft_m_etiquette_local() TO create_sig;
GRANT EXECUTE ON FUNCTION r_objet.ft_m_etiquette_local() TO sig_create;
GRANT EXECUTE ON FUNCTION r_objet.ft_m_etiquette_local() TO public

GRANT EXECUTE ON FUNCTION r_objet.ft_m_vm_site() TO create_sig;
GRANT EXECUTE ON FUNCTION r_objet.ft_m_vm_site() TO sig_create;
GRANT EXECUTE ON FUNCTION r_objet.ft_m_vm_site() TO public;

GRANT EXECUTE ON FUNCTION r_objet.ft_m_foncier_l_nom() TO public;
GRANT EXECUTE ON FUNCTION r_objet.ft_m_foncier_l_nom() TO sig_create;
GRANT EXECUTE ON FUNCTION r_objet.ft_m_foncier_l_nom() TO create_sig;

GRANT EXECUTE ON FUNCTION m_urbanisme_reg.ft_m_modif_proc() TO public;
GRANT EXECUTE ON FUNCTION m_urbanisme_reg.ft_m_modif_proc() TO sig_create;
GRANT EXECUTE ON FUNCTION m_urbanisme_reg.ft_m_modif_proc() TO create_sig;


GRANT EXECUTE ON FUNCTION m_foncier.ft_m_ces_acq_idgeoaf() TO public;
GRANT EXECUTE ON FUNCTION m_foncier.ft_m_ces_acq_idgeoaf() TO sig_create;
GRANT EXECUTE ON FUNCTION m_foncier.ft_m_ces_acq_idgeoaf() TO create_sig;

GRANT EXECUTE ON FUNCTION m_foncier.ft_m_ces_acq_idsite() TO public;
GRANT EXECUTE ON FUNCTION m_foncier.ft_m_ces_acq_idsite() TO sig_create;
GRANT EXECUTE ON FUNCTION m_foncier.ft_m_ces_acq_idsite() TO create_sig;

GRANT EXECUTE ON FUNCTION m_foncier.ft_r_acqui_ndoc() TO public;
GRANT EXECUTE ON FUNCTION m_foncier.ft_r_acqui_ndoc() TO sig_create;
GRANT EXECUTE ON FUNCTION m_foncier.ft_r_acqui_ndoc() TO create_sig;

GRANT EXECUTE ON FUNCTION m_foncier.ft_m_cess_nlot_delete() TO public;
GRANT EXECUTE ON FUNCTION m_foncier.ft_m_cess_nlot_delete() TO sig_create;
GRANT EXECUTE ON FUNCTION m_foncier.ft_m_cess_nlot_delete() TO create_sig;
GRANT EXECUTE ON FUNCTION m_foncier.ft_m_cess_nlot_delete() TO edit_sig;

GRANT EXECUTE ON FUNCTION m_foncier.ft_m_cess_nlot_insert() TO public;
GRANT EXECUTE ON FUNCTION m_foncier.ft_m_cess_nlot_insert() TO sig_create;
GRANT EXECUTE ON FUNCTION m_foncier.ft_m_cess_nlot_insert() TO create_sig;
GRANT EXECUTE ON FUNCTION m_foncier.ft_m_cess_nlot_insert() TO edit_sig;

GRANT EXECUTE ON FUNCTION m_foncier.ft_m_cess_nlot_update() TO public;
GRANT EXECUTE ON FUNCTION m_foncier.ft_m_cess_nlot_update() TO sig_create;
GRANT EXECUTE ON FUNCTION m_foncier.ft_m_cess_nlot_update() TO create_sig;
GRANT EXECUTE ON FUNCTION m_foncier.ft_m_cess_nlot_update() TO edit_sig;

GRANT EXECUTE ON FUNCTION m_economie.ft_m_an_sa_etab_date_null() TO public;
GRANT EXECUTE ON FUNCTION m_economie.ft_m_an_sa_etab_date_null() TO sig_create;
GRANT EXECUTE ON FUNCTION m_economie.ft_m_an_sa_etab_date_null() TO create_sig;

GRANT EXECUTE ON FUNCTION m_economie.ft_m_etiquette_local() TO public;
GRANT EXECUTE ON FUNCTION m_economie.ft_m_etiquette_local() TO sig_create;
GRANT EXECUTE ON FUNCTION m_economie.ft_m_etiquette_local() TO create_sig;

GRANT EXECUTE ON FUNCTION m_economie.ft_m_bal_insert() TO public;
GRANT EXECUTE ON FUNCTION m_economie.ft_m_bal_insert() TO sig_create;
GRANT EXECUTE ON FUNCTION m_economie.ft_m_bal_insert() TO create_sig;

GRANT EXECUTE ON FUNCTION m_economie.ft_m_bal_update() TO public;
GRANT EXECUTE ON FUNCTION m_economie.ft_m_bal_update() TO sig_create;
GRANT EXECUTE ON FUNCTION m_economie.ft_m_bal_update() TO create_sig;

GRANT EXECUTE ON FUNCTION m_economie.ft_m_delete_lot_eco() TO public;
GRANT EXECUTE ON FUNCTION m_economie.ft_m_delete_lot_eco() TO sig_create;
GRANT EXECUTE ON FUNCTION m_economie.ft_m_delete_lot_eco() TO create_sig;
GRANT EXECUTE ON FUNCTION m_economie.ft_m_delete_lot_eco() TO edit_sig;

GRANT EXECUTE ON FUNCTION m_economie.ft_m_etabp_insert() TO public;
GRANT EXECUTE ON FUNCTION m_economie.ft_m_etabp_insert() TO sig_create;
GRANT EXECUTE ON FUNCTION m_economie.ft_m_etabp_insert() TO create_sig;

GRANT EXECUTE ON FUNCTION m_economie.ft_m_etabp_null() TO public;
GRANT EXECUTE ON FUNCTION m_economie.ft_m_etabp_null() TO sig_create;
GRANT EXECUTE ON FUNCTION m_economie.ft_m_etabp_null() TO create_sig;

GRANT EXECUTE ON FUNCTION m_economie.ft_m_etabp_update() TO public;
GRANT EXECUTE ON FUNCTION m_economie.ft_m_etabp_update() TO sig_create;
GRANT EXECUTE ON FUNCTION m_economie.ft_m_etabp_update() TO create_sig

GRANT EXECUTE ON FUNCTION m_economie.ft_m_insert_lot_eco() TO public;
GRANT EXECUTE ON FUNCTION m_economie.ft_m_insert_lot_eco() TO sig_create;
GRANT EXECUTE ON FUNCTION m_economie.ft_m_insert_lot_eco() TO create_sig;
GRANT EXECUTE ON FUNCTION m_economie.ft_m_insert_lot_eco() TO edit_sig;

GRANT EXECUTE ON FUNCTION m_economie.ft_m_modif_lot_eco() TO public;
GRANT EXECUTE ON FUNCTION m_economie.ft_m_modif_lot_eco() TO sig_create;
GRANT EXECUTE ON FUNCTION m_economie.ft_m_modif_lot_eco() TO create_sig;
GRANT EXECUTE ON FUNCTION m_economie.ft_m_modif_lot_eco() TO edit_sig

GRANT EXECUTE ON FUNCTION m_economie.ft_m_modif_site_eco() TO public;
GRANT EXECUTE ON FUNCTION m_economie.ft_m_modif_site_eco() TO sig_create;
GRANT EXECUTE ON FUNCTION m_economie.ft_m_modif_site_eco() TO create_sig;

GRANT EXECUTE ON FUNCTION m_economie.ft_m_source_eff_etab() TO sig_create;
GRANT EXECUTE ON FUNCTION m_economie.ft_m_source_eff_etab() TO public;
GRANT EXECUTE ON FUNCTION m_economie.ft_m_source_eff_etab() TO create_sig;

GRANT EXECUTE ON FUNCTION m_economie.ft_r_suivi_audit() TO public;
GRANT EXECUTE ON FUNCTION m_economie.ft_r_suivi_audit() TO sig_create;
GRANT EXECUTE ON FUNCTION m_economie.ft_r_suivi_audit() TO create_sig;

GRANT EXECUTE ON FUNCTION m_economie.ft_m_local_insert_update() TO public;
GRANT EXECUTE ON FUNCTION m_economie.ft_m_local_insert_update() TO sig_create;
GRANT EXECUTE ON FUNCTION m_economie.ft_m_local_insert_update() TO create_sig;

GRANT EXECUTE ON FUNCTION m_economie.ft_m_local_delete_etab() TO public;
GRANT EXECUTE ON FUNCTION m_economie.ft_m_local_delete_etab() TO sig_create;
GRANT EXECUTE ON FUNCTION m_economie.ft_m_local_delete_etab() TO create_sig;

GRANT EXECUTE ON FUNCTION m_economie.ft_m_lk_adresseetablissement_siret_update() TO public;
GRANT EXECUTE ON FUNCTION m_economie.ft_m_lk_adresseetablissement_siret_update() TO sig_create;
GRANT EXECUTE ON FUNCTION m_economie.ft_m_lk_adresseetablissement_siret_update() TO create_sig;

GRANT EXECUTE ON FUNCTION m_economie.ft_m_lk_adresseetablissement_idsite() TO public;
GRANT EXECUTE ON FUNCTION m_economie.ft_m_lk_adresseetablissement_idsite() TO sig_create;
GRANT EXECUTE ON FUNCTION m_economie.ft_m_lk_adresseetablissement_idsite() TO create_sig;

GRANT EXECUTE ON FUNCTION m_economie.ft_m_lk_adresseetablissement_idsite_delete() TO public;
GRANT EXECUTE ON FUNCTION m_economie.ft_m_lk_adresseetablissement_idsite_delete() TO sig_create;
GRANT EXECUTE ON FUNCTION m_economie.ft_m_lk_adresseetablissement_idsite_delete() TO create_sig;

GRANT EXECUTE ON FUNCTION m_economie.ft_m_lk_adresseetablissement() TO public;
GRANT EXECUTE ON FUNCTION m_economie.ft_m_lk_adresseetablissement() TO sig_create;
GRANT EXECUTE ON FUNCTION m_economie.ft_m_lk_adresseetablissement() TO create_sig;



GRANT EXECUTE ON FUNCTION m_amenagement.ft_m_delete_lot_equ() TO public;
GRANT EXECUTE ON FUNCTION m_amenagement.ft_m_delete_lot_equ() TO sig_create;
GRANT EXECUTE ON FUNCTION m_amenagement.ft_m_delete_lot_equ() TO create_sig;
GRANT EXECUTE ON FUNCTION m_amenagement.ft_m_delete_lot_equ() TO edit_sig;

GRANT EXECUTE ON FUNCTION m_amenagement.ft_m_delete_lot_esppu() TO public;
GRANT EXECUTE ON FUNCTION m_amenagement.ft_m_delete_lot_esppu() TO sig_create;
GRANT EXECUTE ON FUNCTION m_amenagement.ft_m_delete_lot_esppu() TO create_sig;
GRANT EXECUTE ON FUNCTION m_amenagement.ft_m_delete_lot_esppu() TO edit_sig;

GRANT EXECUTE ON FUNCTION m_amenagement.ft_m_delete_lot_hab() TO public;
GRANT EXECUTE ON FUNCTION m_amenagement.ft_m_delete_lot_hab() TO sig_create;
GRANT EXECUTE ON FUNCTION m_amenagement.ft_m_delete_lot_hab() TO create_sig;
GRANT EXECUTE ON FUNCTION m_amenagement.ft_m_delete_lot_hab() TO edit_sig;

GRANT EXECUTE ON FUNCTION m_amenagement.ft_m_delete_lot_mixte() TO public;
GRANT EXECUTE ON FUNCTION m_amenagement.ft_m_delete_lot_mixte() TO sig_create;
GRANT EXECUTE ON FUNCTION m_amenagement.ft_m_delete_lot_mixte() TO create_sig;
GRANT EXECUTE ON FUNCTION m_amenagement.ft_m_delete_lot_mixte() TO edit_sig;

GRANT EXECUTE ON FUNCTION m_amenagement.ft_m_insert_lot_equ() TO public;
GRANT EXECUTE ON FUNCTION m_amenagement.ft_m_insert_lot_equ() TO sig_create;
GRANT EXECUTE ON FUNCTION m_amenagement.ft_m_insert_lot_equ() TO create_sig;
GRANT EXECUTE ON FUNCTION m_amenagement.ft_m_insert_lot_equ() TO edit_sig;

GRANT EXECUTE ON FUNCTION m_amenagement.ft_m_insert_lot_esppu() TO public;
GRANT EXECUTE ON FUNCTION m_amenagement.ft_m_insert_lot_esppu() TO sig_create;
GRANT EXECUTE ON FUNCTION m_amenagement.ft_m_insert_lot_esppu() TO create_sig;
GRANT EXECUTE ON FUNCTION m_amenagement.ft_m_insert_lot_esppu() TO edit_sig;

GRANT EXECUTE ON FUNCTION m_amenagement.ft_m_insert_lot_hab() TO public;
GRANT EXECUTE ON FUNCTION m_amenagement.ft_m_insert_lot_hab() TO sig_create;
GRANT EXECUTE ON FUNCTION m_amenagement.ft_m_insert_lot_hab() TO create_sig;
GRANT EXECUTE ON FUNCTION m_amenagement.ft_m_insert_lot_hab() TO edit_sig;

GRANT EXECUTE ON FUNCTION m_amenagement.ft_m_insert_lot_mixte() TO public;
GRANT EXECUTE ON FUNCTION m_amenagement.ft_m_insert_lot_mixte() TO sig_create;
GRANT EXECUTE ON FUNCTION m_amenagement.ft_m_insert_lot_mixte() TO create_sig;
GRANT EXECUTE ON FUNCTION m_amenagement.ft_m_insert_lot_mixte() TO edit_sig;

GRANT EXECUTE ON FUNCTION m_amenagement.ft_m_modif_lot_equ() TO public;
GRANT EXECUTE ON FUNCTION m_amenagement.ft_m_modif_lot_equ() TO sig_create;
GRANT EXECUTE ON FUNCTION m_amenagement.ft_m_modif_lot_equ() TO create_sig;
GRANT EXECUTE ON FUNCTION m_amenagement.ft_m_modif_lot_equ() TO edit_sig;

GRANT EXECUTE ON FUNCTION m_amenagement.ft_m_modif_lot_esppu() TO public;
GRANT EXECUTE ON FUNCTION m_amenagement.ft_m_modif_lot_esppu() TO sig_create;
GRANT EXECUTE ON FUNCTION m_amenagement.ft_m_modif_lot_esppu() TO create_sig;
GRANT EXECUTE ON FUNCTION m_amenagement.ft_m_modif_lot_esppu() TO edit_sig;

GRANT EXECUTE ON FUNCTION m_amenagement.ft_m_modif_lot_hab() TO public;
GRANT EXECUTE ON FUNCTION m_amenagement.ft_m_modif_lot_hab() TO sig_create;
GRANT EXECUTE ON FUNCTION m_amenagement.ft_m_modif_lot_hab() TO create_sig;
GRANT EXECUTE ON FUNCTION m_amenagement.ft_m_modif_lot_hab() TO edit_sig;

GRANT EXECUTE ON FUNCTION m_amenagement.ft_m_modif_lot_mixte() TO public;
GRANT EXECUTE ON FUNCTION m_amenagement.ft_m_modif_lot_mixte() TO sig_create;
GRANT EXECUTE ON FUNCTION m_amenagement.ft_m_modif_lot_mixte() TO create_sig;
GRANT EXECUTE ON FUNCTION m_amenagement.ft_m_modif_lot_mixte() TO edit_sig

GRANT EXECUTE ON FUNCTION m_amenagement.ft_m_modif_site_equ() TO public;
GRANT EXECUTE ON FUNCTION m_amenagement.ft_m_modif_site_equ() TO sig_create;
GRANT EXECUTE ON FUNCTION m_amenagement.ft_m_modif_site_equ() TO create_sig;

GRANT EXECUTE ON FUNCTION m_amenagement.ft_m_modif_site_hab() TO public;
GRANT EXECUTE ON FUNCTION m_amenagement.ft_m_modif_site_hab() TO sig_create;
GRANT EXECUTE ON FUNCTION m_amenagement.ft_m_modif_site_hab() TO create_sig

GRANT EXECUTE ON FUNCTION m_amenagement.ft_m_modif_site_mixte() TO public;
GRANT EXECUTE ON FUNCTION m_amenagement.ft_m_modif_site_mixte() TO sig_create;
GRANT EXECUTE ON FUNCTION m_amenagement.ft_m_modif_site_mixte() TO create_sig;

GRANT EXECUTE ON FUNCTION m_amenagement.ft_m_delete_lot_divers() TO public;
GRANT EXECUTE ON FUNCTION m_amenagement.ft_m_delete_lot_divers() TO sig_create;
GRANT EXECUTE ON FUNCTION m_amenagement.ft_m_delete_lot_divers() TO create_sig;
GRANT EXECUTE ON FUNCTION m_amenagement.ft_m_delete_lot_divers() TO edit_sig;

GRANT EXECUTE ON FUNCTION m_amenagement.ft_m_foncier_modif_geopic() TO public;
GRANT EXECUTE ON FUNCTION m_amenagement.ft_m_foncier_modif_geopic() TO sig_create;
GRANT EXECUTE ON FUNCTION m_amenagement.ft_m_foncier_modif_geopic() TO create_sig;
GRANT EXECUTE ON FUNCTION m_amenagement.ft_m_foncier_modif_geopic() TO edit_sig;
GRANT EXECUTE ON FUNCTION m_amenagement.ft_m_foncier_modif_geopic() TO read_sig;

GRANT EXECUTE ON FUNCTION m_amenagement.ft_m_insert_lot_divers() TO public;
GRANT EXECUTE ON FUNCTION m_amenagement.ft_m_insert_lot_divers() TO sig_create;
GRANT EXECUTE ON FUNCTION m_amenagement.ft_m_insert_lot_divers() TO create_sig;
GRANT EXECUTE ON FUNCTION m_amenagement.ft_m_insert_lot_divers() TO edit_sig;

GRANT EXECUTE ON FUNCTION m_amenagement.ft_m_modif_lot_divers() TO public;
GRANT EXECUTE ON FUNCTION m_amenagement.ft_m_modif_lot_divers() TO sig_create;
GRANT EXECUTE ON FUNCTION m_amenagement.ft_m_modif_lot_divers() TO create_sig;
GRANT EXECUTE ON FUNCTION m_amenagement.ft_m_modif_lot_divers() TO edit_sig;

GRANT EXECUTE ON FUNCTION m_economie.ft_m_an_sa_etab_l_nom_null() TO public;
GRANT EXECUTE ON FUNCTION m_economie.ft_m_an_sa_etab_l_nom_null() TO sig_create;
GRANT EXECUTE ON FUNCTION m_economie.ft_m_an_sa_etab_l_nom_null() TO create_sig;

GRANT EXECUTE ON FUNCTION r_objet.ft_m_geo_objet_etab_enseigne() TO public;
GRANT EXECUTE ON FUNCTION r_objet.ft_m_geo_objet_etab_enseigne() TO sig_create;
GRANT EXECUTE ON FUNCTION r_objet.ft_m_geo_objet_etab_enseigne() TO create_sig;



























