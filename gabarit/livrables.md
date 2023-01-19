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

#### Les procédures d'amnénagement

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

La cartographie de l'application montre cette différenciation :





#### Les bâtiments d'activité

![picto](.png)

## Règles de modélisation

#### Règles générales

#### La modélisation géométrique

#### Topologie
