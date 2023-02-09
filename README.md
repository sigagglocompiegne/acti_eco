![picto](https://github.com/sigagglocompiegne/orga_gest_igeo/blob/master/doc/img/geocompiegnois_2020_reduit_v2.png)

# Prescriptions spécifiques (locales) pour le suivi et la gestion de l'activité économique infra-communale et plus particulièrement dans les sites d'activités

[ ] à rédiger [x] en cours de rédaction [ ] finaliser

Ensemble des éléments constituant la mise en oeuvre de la base de données sur l'activité économique infra-communale, le suivi de la commercialisation des lots à destination économique, la connaissance des bâtiments d'activité ainsi que leurs disponibilités (vente, location) et la localisation des établissements :

- [Lire la documentation du standard](gabarit/livrables.md)
- Script d'initialisation de la base de données
  * [Suivi des modifications](bdd/afe_00_trace.sql)
  * [Création de la structure des données](bdd/afe_10_squelette.sql)
  * [Création des vues de gestion](bdd/afe_20_vues_gestion.sql)
  * [Création des vues applicatives](bdd/afe_21_vues_xapps.sql)
  * [Création des privilèges](bdd/afe_99_grant.sql)  
- [Documentation d'administration de la base de données](bdd/doc_admin_bd_amt_fon_eco.md)
- [Documentation des utilisateurs de l'application (authentification nécessaire)](https://geo.compiegnois.fr/portail/index.php/2019/06/01/activite-economique/)



## Contexte

L’ARC est engagée dans un plan de modernisation numérique pour l’exercice de ses missions de services publics. L’objectif poursuivi vise à permettre à la collectivité de se doter d’outil d’aide à la décision et d’optimiser l’organisation de ses services. Ces objectifs se déclinent avec la mise en place d’outils informatiques adaptés au quotidien des services et le nécessaire retour auprès de la collectivité, des informations (données) produites et gérées par ses prestataires. 

L’ARC privilégie donc une organisation dans laquelle l’Interface Homme Machine (IHM) du métier assure l’alimentation d’un entrepôt de données territoriales. Cette stratégie « agile » permet de répondre au plus près des besoins des services dans une trajectoire soutenable assurant à la fois une bonne maitrise des flux d’information et un temps d’acculturation au sein de l’organisation.

De plus cette thématique est partagée dans le cadre de la mutualisation avec les EPCI du Grand Compiégnois.

## Voir aussi

- [Standard régional d'échange des données sur l'activité économique (V2 2015)](https://geo.compiegnois.fr/documents/metiers/eco/modele_groupe_activite_economique_version2_2015.pdf)


## Jeu de données consolidé

Vous pouvez retrouver plusieurs jeux de données à l'échelle de l'Agglomération de la Région de Compiègne :
  * [Les sites d'activités](https://geo.compiegnois.fr/geonetwork/srv/fre/catalog.search#/metadata/5c437f50-f898-4734-8a78-bcbcd74ba6c1)
  * [Les ZAE de l'Agglomération de la Région de Compiègne](https://geo.compiegnois.fr/geonetwork/srv/fre/catalog.search#/metadata/23207f39-0ca6-4f39-a526-51ec09418bc8)
  * [Les établissements](https://geo.compiegnois.fr/geonetwork/srv/fre/catalog.search#/metadata/22f0c413-dd60-4d2a-b6dc-b91d21d0d01a)
