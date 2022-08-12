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

`[r_objet].[geo_objet_fon_lot]` : table géographique partagé des lots commercialisés
   
|Nom attribut | Définition | Type | Valeurs par défaut |
|:---|:---|:---|:---|
|idgeolf|Identifiant unique de l'objet|integer| |
|op_sai|Opérateur de saisir d'objet à l'ARC|character varying(80)| |
|src_geom|Référentiel spatial de saisie|character varying(2)|'00'::character varying|
|sup_m2|Surface totale de l'objet en m²|double precision| |
|l_voca|Vocation du foncier|character varying(2)|'00'::character varying|
|geom|Champ contenant la géométrie|MultiPolygon,2154| |
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

`[r_objet].[geo_objet_empesp_pu]` : table géographique des objets surfaciques composant de l'espace public
   
|Nom attribut | Définition | Type | Valeurs par défaut |
|:---|:---|:---|:---|
|idgeopu|Identifiant unique de l'objet|integer| |
|op_sai|Opérateur de saisir d'objet à l'ARC|character varying(80)| |
|src_geom|Référentiel spatial de saisie|character varying(2)|'00'::character varying|
|sup_m2|Surface totale de l'objet en m²|double precision| |
|geom|Champ contenant la géométrie|USER-DEFINED| |
|date_sai|Date de saisie de l'objet|timestamp without time zone| |
|date_maj|Date de mise à jour de l'objet|timestamp without time zone| |

Particularité(s) à noter :
* Une clé primaire existe sur le champ `idgeopu` l'attribution automatique de la référence unique s'effectue via les vues de gestion. 
* Une clé étrangère existe sur la table de valeur `src_geom` (lien vers la liste de valeurs des référentiels de saisie `lt_src_geom`)

Cette classe d'objets est peu utilisée, non mise à jour, et testé dans le cadre d'un besoin ponctuel non renouvelé.

### Liste de valeurs

`[r_objet].[lt_src_geom]` : Liste des valeurs permettant de décrire les référentiels utilisés pour la saisie des objets

|Nom attribut | Définition | Type  | Valeurs par défaut |
|:---|:---|:---|:---|    
|code|Code de la valeur du référentiel|character varying(2)| |
|valeur|Libellé du référentiel|character varying(254)| |

Particularité(s) à noter :
* Une clé primaire existe sur le champ code 

Valeurs possibles :

|Code|Valeur|
|:---|:---|
|10|Cadastre|
|11|PCI vecteur|
|12|BD Parcellaire|
|13|RPCU|
|20|Ortho-images|
|21|Orthophotoplan IGN|
|22|Orthophotoplan partenaire|
|23|Orthophotoplan local|
|30|Filaire voirie|
|31|Route BDTopo|
|32|Route OSM|
|40|Cartes|
|41|Scan25|
|50|Lever|
|51|Plan topographique|
|52|PCRS|
|53|Trace GPS|
|60|Geocodage|
|71|Plan masse vectoriel|
|72|Plan masse redessiné|
|80|Thématique|
|81|Document d'urbanisme|
|82|Occupation du Sol|
|83|Thèmes BDTopo|
|99|Autre|
|00|Non renseigné|
|70|Plan masse|
|61|Base Adresse Locale|
|54|Coordonnées X,Y|

---
`[r_objet].[lt_objet_vocafon]` : Liste des valeurs permettant de décrire les vocations foncières des lots

|Nom attribut | Définition | Type  | Valeurs par défaut |
|:---|:---|:---|:---|    
|code|Code de la vocation|character varying(2)| |
|valeur|Libellé de la vocation|character varying(25)| |

Particularité(s) à noter :
* Une clé primaire existe sur le champ code 

Valeurs possibles :

|Code|Valeur|
|:---|:---|
|00|Non renseigné|
|10|Equipement public|
|20|Lot Economique|
|30|Lot Habitat|
|40|Lot divers|
|50|Lot espace public|
|60|Lot Mixte|

## Classes d'objets de l'activité économique

L'ensemble des classes d'objets de gestion sont stockés dans le schéma `m_activite_eco` ,et celles applicatives dans les schémas x_apps (pour les applications pro) ou x_apps_public (pour les applications grands publiques).

### Classes d'objets de gestion :
  
`[m_activite_eco].[geo_eco_site]` : table géographique contenant la délimitation des sites d'activités
   
|Nom attribut | Définition | Type | Valeurs par défaut |
|:---|:---|:---|:---|
|idsite|Identifiant interne non signifiant des site d'activités|character varying(5)|('S'::text || nextval('m_activite_eco.geo_eco_site_seq'::regclass))|
|idsitereg|Identifiant régional des site d'activités|character varying(7)| |
|idpole|Identifiant interne non signifiant du pôle d'appartenance|integer| |
|site_nom|Libellé du site|character varying(80)| |
|site_voca|Code de la vocation simplifiée de la zone (ZI, ZA, Zone commerciale, ...)|character varying(2)|'00'::character varying|
|site_etat|Code de l'état du site (existant, création, déclassé, ...)|character varying(2)|'00'::character varying|
|typsite|Code des différents type de sites (ZAE, autre site d'activités hors ZAE, autre site, ...)|character varying(2)|'00'::character varying|
|typo|Code de la typologie du site (site mononfonctionnel, ...)|character varying(2)|'00'::character varying|
|dest|Code de la destination initiale du site (défini dans les documents d'urbanisme)|character varying(2)|'00'::character varying|
|dest_autre|Autres distantions ou précisions sur la destination|character varying(254)| |
|date_crea|Année de création du site|integer| |
|p_implant|Première implantation des entreprises sur le site (année ou date)|character varying(10)| |
|commune|Libellé des communes d'assises du site d'activités|character varying(255)| |
|z_proced|Le site est-il issu d'une procédure d'aménagement|boolean|false|
|surf_brt|Surface totale du site|double precision| |
|surf_occ|Surface totale du foncier occupé par des opérateurs économiques|double precision| |
|surf_equ|Surface totale du site allouée aux espaces et équipements publics et voiries|double precision| |
|surf_net|Surface totale du foncier disponible sur le site à vocation économique|double precision| |
|surf_res|Surface totale du foncier réservé sur le site à vocation économique|double precision| |
|nbetab|Nombre d'établissements présent sur le site|integer| |
|nbemploi|Nombre d'emplois présent sur le site|integer| |
|z_mai_ouvr|Nom du maître d'ouvrage|character varying(80)| |
|z_compet|Nom de la collectivité ayant dans ses compétences le développement de la zone|character varying(80)| |
|z_amng|Nom de l'aménageur de la zone|character varying(80)| |
|z_gest|Nom du gestionnaire de la zone|character varying(80)| |
|z_anim|Nom de l'animateur de la zone|character varying(80)| |
|z_comm|Structure de contact pour la commercialisation|character varying(80)| |
|z_cession|Conditions de cession en HT (euro/m²)|double precision| |
|z_env|Démarche environnementale engagée sur le site|boolean|false|
|z_paysage|Démarche paysagère engagée sur le site|boolean|false|
|z_rehab|Procédure de réhabilitaion du site en cours ou à venir ou réalisé|boolean|false|
|z_epu|Présence d'un traitement de l'eau d'épuration|boolean|false|
|z_dechet|Libellé du gestionnaire des déchets si différents de la collectivité|character varying(80)| |
|z_tr_slect|Présence d'un tri sélectif sur le site|boolean|false|
|res_ass|Présence d'un réseau d'assainissement|boolean|false|
|res_pluvia|Présence d'un réseau d'eau pluviale|boolean|false|
|res_eau|Présence d'un réseau d'eau potable|boolean|false|
|res_gaz|Présence d'un réseau de gaz|boolean|false|
|res_elect|Présence d'un réseau électrique|boolean|false|
|res_fibre|Présence de la fibre optique|boolean|false|
|res_autre|Autres services liés au réseau|character varying(1000)| |
|z_auto|Libellé de l'autoroute la plus proche|character varying(10)| |
|d_auto|Libellé du diffuseur autoroutier le plus proche|character varying(100)| |
|z_dst_auto|Distance en km du diffuseur autoroutier par la route|integer| |
|z_tps_auto|Temps d'accès en minutes du diffuseur autoroutier par la route|integer| |
|z_ar_f|Nom de l'aéroport fret le plus proche|character varying(80)| |
|z_dst_ar_f|Distance en km de l'aéroport de fret par la route|integer| |
|z_ar_v|Nom de l'aéroport de voyageurs le plus proche|character varying(80)| |
|z_dst_ar_v|Distance en km de l'aéroport de voyageurs par la route|integer| |
|z_fr_f|Gare de fret la plus proche|character varying(80)| |
|z_dst_fr_f|Distance en km de la gare de fret la plus proche par la route|integer| |
|z_fr_v|Gare de voyageurs la plus proche|character varying(80)| |
|z_dst_fr_v|Distance en km de la gare de voyageurs la plus proche par la route|integer| |
|z_pmm|Présence d'une plate-forme multimodale|boolean|false|
|z_dst_pmm|Distance en km de la plate-forme multimodale la plus proche par la route|integer| |
|serv_tc|Présence de transport en commun desservant le site|boolean|false|
|serv_tc_g|Gratuité des transports en commun|boolean|false|
|circ_douce|Présence de circulation douce accédant au site (pistes cyclables)|boolean|false|
|serv_rest|Présence de restaurants ou à proximité immédiate|integer| |
|serv_crech|Présence de crèches ou à proximité immédiate|integer| |
|serv_autre|Libellé des autres services disponibles sur le site|character varying(1000)| |
|z_aide_pb|Aides publiques bénéficiaires au site|boolean|false|
|src_geom|Code du référentiel de saisie des objets sites|character varying(2)|'00'::character varying|
|src_date|Date du référentiel de saisie des objets sites|character varying(4)|'0000'::bpchar|
|date_sai|Date de saisie des données attributaires|timestamp without time zone| |
|date_maj|Date de mise à jour des données attributaires|timestamp without time zone| |
|op_sai|Libellé de la personne ayant saisie l'objet initialisament|character varying(80)| |
|org_sai|Organisme de saisie dont dépend l'opérateur de saisie initial|character varying(80)| |
|epci|Autorité compétente|character varying(10)| |
|observ|Observations diverses|character varying(1000)| |
|geom|Géométrie des objets sites|MultiPolygon,2154| |


Particularité(s) à noter :
* Une clé primaire existe sur le champ `idsite` l'attribution automatique de la référence unique s'effectue via une séquence. 
* Une clé non primaire sur le champ `idsitereg` contient la référence du site pour les exports OpenData au standard Régional
* Une clé étrangère existe sur la table de valeur `site_etat` (lien vers la liste de valeurs de l'état du site `lt_eco_etat`)
* Une clé étrangère existe sur la table de valeur `dest` (lien vers la liste de valeurs de la destination du site `lt_eco_dest`)
* Une clé étrangère existe sur la table de valeur `typo` (lien vers la liste de valeurs de la typologie du site `lt_eco_typo`)
* Une clé étrangère existe sur la table de valeur `typsite` (lien vers la liste de valeurs du type de site `lt_eco_typsite`)
* Une clé étrangère existe sur la table de valeur `site_voca` (lien vers la liste de valeurs de la vocation du site `lt_eco_voca`)
* Une clé étrangère existe sur la table de valeur `src_geom` (lien vers la liste de valeurs des référentiels de saisie `lt_src_geom`)
  
---

`[m_activite_eco].[an_eco_pole]` : table alphanumérique contenant la dénomination des pôles d'activités (unité géographique régionale)
   
|Nom attribut | Définition | Type | Valeurs par défaut |
|:---|:---|:---|:---|
|idpole|Identifiant unique non signifiant du pôle d'activité|character varying(4)|('P'::text || nextval('m_activite_eco.an_eco_pole_seq'::regclass))|
|idpolereg|Identifiant unique régional du pôle d'activité|character varying(7)| |
|nom_pole|Libellé du pôle d'activités|character varying(100)| |
|dest|Destination du pôle (issue de la destination des sites)|character varying(2)|'00'::character varying|
|op_sai|Opérateur de saisie initial|character varying(80)| |
|org_sai|Organisme de saisie initial|character varying(100)| |
|epci|Autorité compétente|character varying(10)| |
|date_sai|Date de saisie|timestamp without time zone|now()|
|date_maj|Date de mise à jour|timestamp without time zone| |


Particularité(s) à noter :
* Une clé primaire existe sur le champ `idpole` l'attribution automatique de la référence unique s'effectue via une séquence. 
* Une clé non primaire sur le champ `idpolereg` contient la référence du site pour les exports OpenData au standard Régional
* Une clé étrangère existe sur la table de valeur `dest` (lien vers la liste de valeurs de la destination du pôle `lt_eco_dest`)
* Une vue de gestion a été réalisée `geo_v_eco_pole` dans ce schéma pour reconstruire les pôles à partir de la table `geo_eco_site`
* Une vue matérialisée a été réalisée `geo_vmr_eco_pole` dans ce schéma pour reconstruire les pôles à partir de la table `geo_eco_site` pour des usages cartographiques et d'export OpenData


### classes d'objets applicatives métiers sont classés dans le schéma x_apps :

### classes d'objets applicatives grands publics sont classés dans le schéma x_apps_public :

### classes d'objets opendata sont classés dans le schéma x_opendata :

### Liste de valeurs

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
