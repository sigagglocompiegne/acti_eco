![picto](https://github.com/sigagglocompiegne/orga_gest_igeo/blob/master/doc/img/geocompiegnois_2020_reduit_v2.png)

# Urbanisation des données aménagements / foncières (cessions/acquisitions) / activités économiques

Ensemble des éléments constituant la mise en oeuvre de la base de données urbanisées sur les thématiques d'aménagement, de foncier et d'activités économiques ainsi que l'exploitation de ces données dans les différentes applications :

* Statut
  - [ ] à rédiger
  - [x] en cours de rédaction
  - [ ] relecture
  - [ ] finaliser
  - [ ] révision

- Script d'initialisation de la base de données (hors [Suivi du marché de l'immobilier d'entreprises](https://github.com/sigagglocompiegne/marcheimmo))
  * [Suivi des modifications](bdd/afe_00_trace.sql)
  * [Création  de la structure initiale](bdd/afe_10_squelette.sql)
  * [Création des vues de gestion](bdd/afe_20_vues_gestion.sql)
  * [Création des vues applicatives](bdd/afe_21_vues_xapps.sql)
  * [Création des vues applicatives gd public](bdd/afe_22_vues_xapps_public.sql)
  * [Création des vues open data](bdd/afe_23_vues_xopendata.sql)
  * [Création des privilèges](bdd/afe_99_grant.sql)
  
- [Documentation d'administration de la base](app/doc_admin_bd_amt_fon_eco.md) (hors [Suivi du marché de l'immobilier d'entreprises](https://github.com/sigagglocompiegne/marcheimmoent/blob/master/doc/doc_admin_bd_immo.md))
- [Documentation d'administration de l'application FONCIER](app/doc_admin_app_fon.md)
- [Documentation d'administration de l'application ACTIVITE ECONOMIQUE](app/doc_admin_app_eco.md)
- [Documentation d'administration de l'application AMENAGEMENT](app/doc_admin_app_amt.md)
