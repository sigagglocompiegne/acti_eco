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

GRANT ALL ON TABLE s_sirene.lt_vetab TO sig_create;
GRANT ALL ON TABLE s_sirene.lt_vetab TO create_sig;
GRANT SELECT ON TABLE s_sirene.lt_vetab TO read_sig;
GRANT SELECT, UPDATE, INSERT, DELETE ON TABLE s_sirene.lt_vetab TO edit_sig;

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

GRANT ALL ON TABLE m_economie.lt_sa_decalage TO sig_create;
GRANT ALL ON TABLE m_economie.lt_sa_decalage TO create_sig;
GRANT SELECT ON TABLE m_economie.lt_sa_decalage TO read_sig;
GRANT SELECT, UPDATE, INSERT, DELETE ON TABLE m_economie.lt_sa_decalage TO edit_sig;

GRANT ALL ON TABLE m_economie.lt_sa_dest TO sig_create;
GRANT ALL ON TABLE m_economie.lt_sa_dest TO create_sig;
GRANT SELECT ON TABLE m_economie.lt_sa_dest TO read_sig;
GRANT SELECT, UPDATE, INSERT, DELETE ON TABLE m_economie.lt_sa_dest TO edit_sig;

GRANT ALL ON TABLE m_economie.lt_sa_etatoccup TO sig_create;
GRANT ALL ON TABLE m_economie.lt_sa_etatoccup TO create_sig;
GRANT SELECT ON TABLE m_economie.lt_sa_etatoccup TO read_sig;
GRANT SELECT, UPDATE, INSERT, DELETE ON TABLE m_economie.lt_sa_etatoccup TO edit_sig;

GRANT ALL ON TABLE m_economie.lt_sa_filiale TO sig_create;
GRANT ALL ON TABLE m_economie.lt_sa_filiale TO create_sig;
GRANT SELECT ON TABLE m_economie.lt_sa_filiale TO read_sig;
GRANT SELECT, UPDATE, INSERT, DELETE ON TABLE m_economie.lt_sa_filiale TO edit_sig;

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



-- #################################################################### TABLE  ####################################################################



-- #################################################################### VUE DE GESTION  ####################################################################



-- #################################################################### FUNCTION TRIGGER  ####################################################################



-- #################################################################### VUE APPLICATIVE  ####################################################################




-- #################################################################### VUE GRAND PUBLIC  ####################################################################

-- sans objet

-- #################################################################### VUE OPENDATA  ####################################################################

-- sans objet
