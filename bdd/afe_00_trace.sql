/*Amt_fon_eco (afe) V1.0*/
/*Creation du fichier trace qui permet de suivre l'évolution du code*/
/* afe_10_trace.sql */
/*PostGIS*/

/* Propriétaire : GeoCompiegnois - http://geo.compiegnois.fr/ */
/* Auteur : Grégory Bodet */

/*  
  dépendances : voir script d'initialisation des dépendances init_bd_pei_dependencies.sql
  
  Liste des dépendances :
  schéma          | table                 | description                                                   | usage
 
*/

/*
#################################################################### SUIVI CODE SQL ####################################################################
-- Le développement originel a débuté en 2015. Le développement a évolué et a été optimisé depuis sans qu'il n'y est de documentation.
-- 2019-01-21 : GB / initialisation du code
-- 2019-04-10 : GB / modification du code suite au changement de diffusion des données SIRENE de l'Insee via une API. Cette transformation
--              a été suivi d'un changement de structure des données.
--              La localisation des établissements a également été modifiée, elle est désormais au point d'adresse depuis notre
--              base adresse locale.
--              La gestion a l'échelle d'un local d'activité a également été initié seulement. Celle-ci devrait se poursuivre dans
--              un second temps.
-- 2019-06-18 : GB / modification sur le fonctionnement (trigger) des mises à jour liées aux adresses et aux locaux
-- 2021-05-20 : GB / ajout des coordonnées x et y du centre de la commune pour les établissements non géolocalisés dans les fonctionnalités d'export
-- 2021-06-24 : GB / Adaptation fonction trigger sur saisie procédure foncière suite à un bug
-- 2021-06-25 : GB / modification gestion des cessions et acquisitions foncières (ajout op_sai et date_sai)
*/
