![picto](https://github.com/sigagglocompiegne/orga_gest_igeo/blob/master/doc/img/geocompiegnois_2020_reduit_v2.png)

# Prescriptions spécifiques (locales) pour le suivi du marché de l'immobilier d'entreprises

# Documentation du standard

# Changelog

- 19/01/2021 : description initiale de production des bâtiments d'activités et des locaux les composant.

# Livrables

L'objectif principal est bien de recenser l'ensemble des objets participant à la structuration des locaux d'activité ou biens d'activités. En les typant par une nomenclature simple et compréhensible, cet inventaire peut-être produit par un nom spécialiste.
Néanmoins pour les besoins d'un service gérant les locaux d'activité, les données d'inventaire ont été pensées pour deux autres usages : l'un permettant
de détailler ces objets d'un point de vue métier et un autre dans une optique de connaissance du marché immobilier. A ces locaux est adjoint la gestion des terrains privés à usage économique pouvant être remis sur le marché.

Un bâtiment d'activité est ainsi recensé, soit car il contient n locaux d'activités non identifiables, soit par des locaux identifiables qui le recompose.

Même si l'exhaustivité de cette donnée ne sera jamais atteinte sur le territoire de l'Agglomération de la Région de Compiègne, elle doit permettre d'entamer une démarche de connaissances qui sera amenée à s'étendre. Cet inventaire initié dans un premier temps sur les Zones d'Aménagement Economique (ZAE) pourra être étendu aux autres sites d'activités et en centre-ville.

## Gabarits

- Aucun gabarit n'est pas proposé. La saisie de l'inventaire s'effectue directement dans l'application Web métier.

## Principe fonctionnel

La saisie des objets du patrimoine repose sur le principe simple de la connaissance d'implantation des locaux dans un bâtiment d'actvités. Si les locaux sont identifiables, ils sont alors saisis comme un local, et leur affectation a un bâtiment d'activités connu permet de reconstruire virtuellement sa géométrie. En revanche, des locaux non identifiables dans un bâtiment d'activités, c'est le bâtiment qui est saisi comme tel, et on lui affecte des locaux (sans géométrie).

Un terrain privé peut-être quant à lui, non occupé, occupé (sans bâtiment d'activités) ou une partie d'un terrain occupé.

Le schéma ci-dessous présente ces principes simples avec des exemples.

![picto](principe_saisi_terrain_v1.png)

Schéma 1 : représentation des objets terrains de l'inventaire cartographique

![picto](principe_saisi_local.png)

Schéma 2 : représentation des objets locaux et bâtiments d'activités de l'inventaire cartographique 


L'affichage des libellés des occupants des locaux s'organise autour du principe précédent.
Pour les locaux identifiés et à grande échelle, c'est le libellé correspondant à l'occupant qui est affiché et à défaut le libellé du local. A des échelles moyennes, ce libellé est remplacé par l'affichage du nom au niveau de la géométrie du bâtiment correspondant. Si ce bâtiment comporte 3 établissements ou moins, ils sont affichés de préférence.
Pour les locaux non identifiés, et à grande échelle, si l'adresse d'appartenance du bâtiment n'est pas renseignée, le libellé des occupants des locaux saisis est affiché au maximum de 3 ou à défaut le libellé du bien. Si l'adresse est renseignée, on affiche alors la liste des établissements occupants au maxmimum de 3 ou à défaut le nom du bâtiment (adresse ou nom spéfifique).

Pour respecter cet affichage, il est important de définir des règles de saisis des libellés des différents objets :
 -  pour un bâtiment : le nom de celui-ci est par défaut son adresse. S'il dispose d'un nom propre, celui-ci est privilégié. Ces occupants sont automatiquement appareillés depuis la géolocalisation des établissements de la base SIRENE sur la base locale des adresses.
 -  pour un local : le nom de celui-ci est par défaut son type (ex : local commercial de x m², atelier avec bureaux de x m², ...), et il est possible de spécifier le nom de l'occumant dans un attribut texte. A ce niveau, il n'y pas de fonctionnalités pour affecter un établissment de la base SIRENE.

Le schéma ci-dessous présente le principe d'affichage des étiquettes des occupants en fonction des bâtiments ou locaux d'activités avec des exemples.

![picto](principe_libelle.png)

Schéma 3 : principe d'affichage des libellés des occupants

## Règle de modélisation

### Règles générales

Les objets constituant l'inventaire cartographique initial sont organisés autour d'une seule primitive graphique de type polygone. 
**La saisie des objets de type multi est autorisée.**

La saisie de ces objets doit permettre une restitution de l'ordre du 1 000ème.

Les objets produits dans le cadre de cet inventaire devront être en cohérence topologique avec la précision des bâtiments (dur) du PCI Vecteur pour les bâtiments ou locaux identifiés. Dans le cas d'un bâtiment non présent dans ce référentiel, il est possible d'intégrer sa géométrie par une saisie sur un support cartographique tierce (plan masse par ex). Les bâtiments doivent être inclus dans une emprise foncière unique ou cohérente.

Pour les terrains, ils doivent être en cohérence topologique avec la précision des parcelles du PCI Vecteur si cela est possible.


### La modélisation

Les règles de modélisation consistent à présenter la façon dont les objets doivent être saisis et restitués dans le modèle de données.

Ici ils sont simples, un polygone représente un bâtiment, à un bâtiment par regroupement ou un local identifié. Un bâtiment reconstruit à partir de ces locaux le composant sera également représenté par un polygone. Il n'y a pas de limites de surfaces pour la représentation d'un objet. Ils doivent simplement représenter une activité économique.

Les locaux identifiés permettant la reconstruction virtuel du bâtiment d'activités devront être obligatoirement adjacents.

Les objets saisis peuvent être de type multiple. Cette permission découle de la situation des bâtiments à l'intérieur d'une emprise foncière. En effet si plusieurs bâtimnents sont identifiés comment les saisir ?

![picto](principe_saisi_bati_foncier.png)

Schéma 4 : principe de saisie selon la situation du ou des bâtiments dans une emprise foncières


### Topologie

La cohérence topologique impose le partage de géométrie et donc l’utilisation des outils « d’accroches ».

- les objets peuvent être à cheval sur plusieurs communes,
- les objets peuvent appartenir à un site d'activités.

- Tous les objets de type "surface" sont des polygones fermés, et si ils sont adjacents, ils devront être topologique (absence de chevauchements et de micro-trous). 

![picto](https://github.com/sigagglocompiegne/espace_vert/blob/master/gabarit/topo_poly_1.png) ![picto](https://github.com/sigagglocompiegne/espace_vert/blob/master/gabarit/topo_poly_3.png)

- Un polygone contenant un autre polygone devra être découpé avec celui-ci.

![picto](https://github.com/sigagglocompiegne/espace_vert/blob/master/gabarit/topo_poly_2.png)

### Système de coordonnées

Les coordonnées seront exprimées en mètre avec trois chiffres après la virgule dans le système national en vigueur.
Sur le territoire métropolitain s'applique le système géodésique français légal RGF93 associé au système altimétrique IGN69. La projection associée Lambert 93 France (epsg:2154) sera à utiliser pour la livraison des données.

## Format des fichiers

Les fichiers peuvent être fournit au format SIG ESRI Shape (.SHP).
L'encodage des caractères sera en UTF8.

## Description des classes d'objets

La description des classes d'objets est contenue la documentation complète de la base de données en cliquant [ici](https://github.com/sigagglocompiegne/marcheimmoent/blob/master/doc/doc_admin_bd_immo.md).

## Implémentation informatique

L'implémentation informatique est décrite dans la documentation complète de la base de données en cliquant [ici](https://github.com/sigagglocompiegne/marcheimmoent/blob/master/doc/doc_admin_bd_immo.md).

### Liste de valeurs

Le contenu des listes de valeurs est disponible dans la documentation complète de la base de données en cliquant [ici](https://github.com/sigagglocompiegne/marcheimmoent/blob/master/doc/doc_admin_bd_immo.md) dans la rubrique `Liste de valeurs`.

### Les identifiants

Les identifiants des objets des espaces verts sont des identifiants non signifiants (un simple numéro incrémenté de 1 à chaque insertion précédé d'une lettre indiquant le type d'objets).



