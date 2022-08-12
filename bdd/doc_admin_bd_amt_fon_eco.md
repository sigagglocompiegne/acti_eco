![picto](https://github.com/sigagglocompiegne/orga_gest_igeo/blob/master/doc/img/geocompiegnois_2020_reduit_v2.png)

# Documentation d'administration de la base de données urbanisées Aménagement/Foncier/Economie #

## Principes
  * **généralité** :

En 2015, lors de la mise en oeuvre de l'IDG locale GeoCompiegnois, une réflexion globale sur la base de données et les données métiers se sont engagées au sein du pôle aménagement, urbanisme et grand projet. Il s'est avéré dans  ce diagnostic que les données utilisées dans ce pôle et le service développement économique avaient des ramifications communes. En effet l'Agglomération de la Région de Compiègne maîtrise le foncier dans ces zones d'aménagements, les viabilise afin de procéder à la commercialisation de lots à vocation multiple (économique, habitat, équipement, ...). De la procédure d'aménagement en passant par l'acquisition puis la cession des terrains, cette chaîne de "production" nous a incité à développer le concept d'urbanisation des données sur cette thématique. Autour de ce concept gravite des données purement métiers (suivi de l'activité économique des entreprises, suivi de l'offre des locaux commerciaux ou des commerces de centre-ville, ...) qui ont été rattachées à cette base de données urbanisées. 

Le contexte d'urbanisation répond à cette double particularité :
   - les données sont partagées pour répondre aux besoins de gestions et d'analyses dont la particularité est de toujours intégrer les
problématiques de plusieurs métiers,
   - un même objet géographique "virtuel", la plupart du temps, participe à plusieurs métiers.

De ce fait un objet géographique est partagé par plusieurs services et les attributs métiers propres à chacun sont gérés dans une classe indépendante. Des vues métiers sont ainsi réalisées reprenant la géométrie de l'objet partagé. Cette organisation permet de modifier un seul objet pour tout le monde et évite ainsi les doublons d'informations.

En 2022, un nouveau cadre de mutualisation a réorienté les choix initiaux en terme d'urbanisation. Certaines données resteront dans le domaine de l'urbanisation et le partage entre services, mais des choix fonctionnels impactants certaines informations ont remis en cause de mode de gestion pour certaines d'entre elles (les sites et le procédures d'aménagement). 

 
 * **résumé fonctionnel** :

Pour rappel des grands principes :

* le service information géographique assure le maintient du référentiel aménagement (procédure, site, lot à commercialiser, ...) et économique (établissements),
* les services des collectivités assure la mise à jour des informations métiers liées aux procédures et à la programmation des secteurs d'aménagement,
* les services des collectivités peuvent créer, modifier ou supprimer les lots à vocation économique dans ces métiers de commercialisation de terrains pour les entreprises. Ils assurent la mise à jour de ces propres attributs de lots mais ils maintiennent également à jour les informations liées aux entreprises,
* le service foncier (uniquement de l'ARC) assure quant à lui la mise à jour des données d'acquisitions et de cessions de terrains. A cet effet il peut saisir les objets correspondant à ces activités.
* les services des collectivités gèrent les locaux d'activités et de leur patrimoine selon leurs besoins propres.

## Schéma fonctionnel

(en refonte)

## Modèle relationel simplifié

![schema_relationnel](m_rela_simplifie_1v.png)

## Dépendances

Cette base de donnnées est interdépendante du fait d'une partie urbanisée. Les données de l'activité éconique sont liées en partie à des données d'aménagements opérationnels, de foncier, ou de ressources externes comme les données de la base SIRENE de l'Insee.

## Classes d'objets urbanisé ou partagé

L'ensemble des classes d'objets de gestion sont stockés dans le schéma `r_objet` ,et celles applicatives dans les schémas x_apps (pour les applications pro) ou x_apps_public (pour les applications grands publiques).

`[schema].[table]` : table ...
   
|Nom attribut | Définition | Type | Valeurs par défaut |
|:---|:---|:---|:---|
|idgeolf|Identifiant unique de l'objet|integer| |
|op_sai|Opérateur de saisir d'objet à l'ARC|character varying(80)| |
|src_geom|Référentiel spatial de saisie|character varying(2)|'00'::character varying|
|sup_m2|Surface totale de l'objet en m²|double precision| |
|l_voca|Vocation du foncier|character varying(2)|'00'::character varying|
|geom|Champ contenant la géométrie|USER-DEFINED| |
|date_sai|Date de saisie de l'objet|timestamp without time zone| |
|date_maj|Date de mise à jour|timestamp without time zone| |
|l_nom|Nom de lot donné au moment du plan d'aménagement (ex : lot 1)|character varying(80)| |

Particularité(s) à noter :
* Une clé primaire existe sur le champ `idgeolf` l'attribution automatique de la référence unique s'effectue via les vues de gestion. 
* Une clé étrangère existe sur la table de valeur `src_geom` (lien vers la liste de valeurs des référentiels de saisie `lt_src_geom`)
* Une clé étrangère existe sur la table de valeur `l_voca` (lien vers la liste de valeurs de la vocation foncière du lot `lt_objet_vocafon`)

* 2 triggers :
  * `t_t1_foncier_insert_date_maj` : trigger permettant d'automatiser la date de mise à jour des données
  * `t_t2_foncier_insert_surf` : trigger permettant d'automatiser l'insertion de la surface 
  * `t_t3_foncier_l_nom` : trigger permettant de remplacer une valeur vide pour une valeur NULL (fonctionnel engendré par GEO)
  
---


### classes d'objets applicatives métiers sont classés dans le schéma x_apps :
 
Sans objet, les données de cette classe d'objets sont intégrées dans les classes d'objets métiers ci-après. Les vues applicatives y sont décrites.

### classes d'objets applicatives grands publics sont classés dans le schéma x_apps_public :

Sans objet

### classes d'objets opendata sont classés dans le schéma x_opendata :

Sans objet, les données de cette classe d'objets sont intégrées dans les classes d'objets métiers ci-après. Les vues OpenData y sont décrites.

## Classes d'objets de l'activité économique

L'ensemble des classes d'objets de gestion sont stockés dans le schéma `m_activite_eco` ,et celles applicatives dans les schémas x_apps (pour les applications pro) ou x_apps_public (pour les applications grands publiques).

 ### classes d'objets de gestion :
  
`[schema].[table]` : table ...
   
|Nom attribut | Définition | Type | Valeurs par défaut |
|:---|:---|:---|:---|


Particularité(s) à noter :

  
---

 

### classes d'objets applicatives métiers sont classés dans le schéma x_apps :
 


### classes d'objets applicatives grands publics sont classés dans le schéma x_apps_public :



### classes d'objets opendata sont classés dans le schéma x_opendata :



## Liste de valeurs

`[schema].[table]` : Liste des valeurs permettant de décrire ....

|Nom attribut | Définition | Type  | Valeurs par défaut |
|:---|:---|:---|:---|    


Particularité(s) à noter :
* Une clé primaire existe sur le champ code 

Valeurs possibles :

|Code|Valeur|
|:---|:---|


---

## Classes d'objets de l'aménagement opérationnel

## Classes d'objets de l'urbanisme réglementaire

## Classes d'objets du foncier

## Classes d'objets de la base SIRENE


## Projet QGIS pour la gestion


## Traitement automatisé mis en place (Workflow de l'ETL FME)


## Export Open Data




---
