![picto](/doc/img/Logo_web-GeoCompiegnois.png)

# Urbanisation des données aménagements / foncières (cessions/acquisitions) / activités économiques

Ensemble des éléments constituant la mise en oeuvre de la base de données urbanisées sur les thématiques d'aménagement, de foncier et d'activités économiques ainsi que l'exploitation de ces données dans les différentes applications :

- Script d'initialisation de la base de données
  * [Suivi des modifications](sql/pei_00_trace.sql)
  * [Création  de la structure initiale](sql/afe_10_squelette.sql)
  * [Création des vues de gestion](sql/afe_20_vues_gestion.sql)
  * [Création des vues applicatives](sql/afe_21_vues_xapps.sql)
  * [Création des vues applicatives gd public](afe/pei_22_vues_xapps_public.sql)
  * [Création des vues open data](afe/pei_23_vues_xopendata.sql)
  * [Création des privilèges](afe/pei_99_grant.sql)

- [Documentation d'administration de la base](doc/doc_admin_bd_amt_fon_eco.md)
- [Documentation d'administration de l'application FONCIER](doc/doc_admin_app_fon.md)
- [Documentation d'administration de l'application ACTIVITE ECONOMIQUE](doc/doc_admin_app_eco.md)
- [Documentation d'administration de l'application AMENAGEMENT](doc/doc_admin_app_amt.md)
