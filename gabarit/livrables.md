![picto](https://github.com/sigagglocompiegne/orga_gest_igeo/blob/master/doc/img/geocompiegnois_2020_reduit_v2.png)

# Dcumentation sur les prescriptions locales pour les données "Activité économique"

## Changelog

- 26/01/2023 : mise en production de la version 2.0
- 09/08/2022 : réorganisation de la base de données sur l'activité économique (rédaction de la documentation en cours et nouveau standard à venir)
- 18/02/2021 : intégration du module marché immobilier à la thématique économique
- 01/12/2015 : description initiale de production de la base de données urbanisée

## Désignation

#### Les sites d'activité

Le terme de "sites d'activité" est ici employé au sens large. Il regroupe à la fois des périmètres de gestion, d'aménagement, de projets, ou d'une importante emprise d'activité. L'ensemble de ces délimitations ont été regroupé en 3 catégories :
- les ZAE : zone d'aménagement économique, issue de la loi Notre, pour lesquelles les EPCI ont délibérés leur périmètre et interviennent en terme de gestion des espaces publics
- les sites d'activités (hors ZAE) : tout espace concentrant plusieurs ou une activité économique en périphérie des centres-urbains (petite zone d'activité, site industriel, ...)
- les autres secteurs : autres sites (notamment en centre-ville) permettant de délmiter un secteur mixte ou de projets, pour en extraire des statistiques ou permettre une observation

#### Les procédures d'aménagement

Elles sont délimitées à partir des documents approuvés par la collectivité et relèvant d'une opération d'aménagement (ZAC, lotissement, ...). Les procédures et certains sites d'activité peuvent partager le même périmètre.

#### Les lots à commercialiser

Les lots à commercialiser sont issus des plans d'aménagements constitués à l'approbation des procédures (pour les sites concernés). Ceux-ci sont ensuite gérer par le service concerné.

#### Les établissements

Ils sont issus de la base de données Sirene de l'Insee. Cette base de données est mise à jour tous les trimestres par le service IG de l'Agglomération de la Région de Compiègne à partir de l'API développée par l'Insee. 
Ils sont géolocalisés sur la Base Adresse Locale. Certains sont localisés manuellement en cas de non correspondance.

Des attributs complémentaires ont été intégrés pour les besoins des services, notamment la saisie des effectifs, ...

Les données présentées dans l'application correspondent :
- aux établissements actifs au sens de l'Insee (non fermés administrativement)
- aux établissements employeurs ou non employeurs

Néanmoins certains établissements ne sont pas intégrés à certaines recherches, exports ou statistiques. On les considère comme non pris en compte, il s'agit :
- des établissements que les EPCI considèrent ne pas être comptabilisés,
- les établissements avec un code NAF (68.20A et 68.20B, Location d'appartements et de maisons, de terrains, ...),
- les établissements radiés au tribunal de commerce.

La cartographie de l'application montre cette différenciation (cf ci-dessous).

![picto](../app/loca_etab_prise_en_compte.png)

#### Les bâtiments d'activité ou assimilés

Le demande de connaissance des bâtiments d'activités ou de toutes activités, est issu d'une première réflexion sur la disponibilité des locaux d'activité afin de constituer une bourse aux locaux. Cette évolution nous a contraint à mettre en oeuvre une modélisation considérant qu'un bâtiment d'activité peut contenir ou non des locaux différenciers. Il a fallu également considéré qu'un terrain pouvait accueillir une activité non bâtie.

4 types de compositions ont été recensés :
- Bâtiment composé de cellules d'activités
- Bâtiment composé de cellules commerciales
- Bâtiment composé de plateaux tertiaires
- Pas de local (terrain, ...)

Le choix a été fait de représentés par des objets ponctuels et inventories un état de connaissances des bâtiments d'activité par les services métiers et non de localiser chaque local identifié. Les locaux sont donc associés aux bâtiments.

A ce stade, les données des entreprises issues de Sirene (localisées à l'adresse) ne sont pas croisées avec les bâtiments d'activité car cet inventaire n'existe pas ou est non exhaustif. De plus, la localisation des établissements aux bâtiments d'activité ou au local, relève d'une complexité supérieure à une localisation à l'adresse.


## Règles de modélisation

#### Règles générales

La saisie des objets doit permettre une restitution des objets à l'échelle d'un site d'activité, autour du 2 000ème.

Le caractère spécifique de chaque donnée oblige à respecter des supports géographiques donnés :
- site d'activités, procédure, lot : plan approuvée à saisir sur un référentiel cadastral ou orthophographique
- établissement : Base Adresse Locale
- bâtiment d'activité : support orthophographique ou cadastral

Des rôles ont été établis entre le service IG de l'Agglomération de la Région de Compiègne et les services métiers du développement économique en ce qui concerne la saisie des informations. Le tableau ci-dessous indique le rôle de chacun pour chaque objet.

||Site|Procédure|Lot|Etablissement|Bâtiment|
|:---|:---|:---|:---|:---|:---|
|Service IG|initialisation|initialisation|initialisation|intégration et mise à jour||
|ARC|||intégration et mise à jour|mise à jour|initialisation et mise à jour|
|CCLO|intégration et mise à jour|intégration et mise à jour|intégration et mise à jour|mise à jour|initialisation et mise à jour|
|CCPE|intégration et mise à jour|intégration et mise à jour|intégration et mise à jour|mise à jour|initialisation et mise à jour|
|CC2V|intégration et mise à jour|intégration et mise à jour|intégration et mise à jour|mise à jour|initialisation et mise à jour|

#### La modélisation géométrique

Les règles de modélisation consistent à présenter la façon dont les objets doivent être saisis et restitués.

Les objets constituant la base de données sont organisés autour des 2 primitives géographiques de base : polygones et points. **La saisie des objets de type multi est autorisée.**

|Classe d'objets|Point|Polygone|
|:---|:---|:---|
|Site d'activité||x|
|Procédure d'aménagement||x|
|Lot||x|
|Etablissement|x (hérité de la BAL)||
|Bâtiment|x||

#### Topologie

Il n'est pas demandé un strict respect de la topologie. Mais si celle-ci s'impose (notamment pour la délimitation des sites, procédures ou lots), la cohérence topologique impose le partage de géométrie et donc l’utilisation des outils « d’accroches ». Par conséquent les objets peuvent partager la géométrie du référentiel cadastral lorsque cela est rendu nécessaire.

Pour le suivi de la commercialisation, les lots, en revanche, doivent être tompologique entre eux. Il n'est pas permis de chevauchement.






