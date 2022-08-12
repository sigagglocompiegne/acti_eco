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

---

`[m_activite_eco].[an_eco_contact]` : table alphanumérique contenant l'ensemble des contacts
   
|Nom attribut | Définition | Type | Valeurs par défaut |
|:---|:---|:---|:---|
|idcontact|Identifiant unique non signifiant du contact|integer|nextval('m_activite_eco.an_eco_contact_seq'::regclass)|
|nom|Libellé du contact (nom, prénom ou nom de l'entreprise)|character varying(100)| |
|typcontact|Type de contact|character varying(2)| |
|tel|Téléphone du contact|character varying(14)| |
|telp|Téléphone portable dui contact|character varying(14)| |
|email|Email du contact|character varying(100)| |
|date_sai|Date de saisie des données attributaires|timestamp without time zone| |
|date_maj|Date de mise à jour des données attributaires|timestamp without time zone| |
|op_sai|Libellé de la personne ayant saisie l'objet initialisament|character varying(80)| |
|epci|Autorité compétente|character varying(10)| |
|observ|Observations diverses|character varying(1000)| |


Particularité(s) à noter :
* Une clé primaire existe sur le champ `idcontact` l'attribution automatique de la référence unique s'effectue via une séquence. 
* Une clé étrangère existe sur la table de valeur `typcontact` (lien vers la liste de valeurs du type de contact `lt_eco_typcontact`)
 
---

`[m_activite_eco].[an_eco_dia]` : table alphanumérique contenant l'ensemble des informations des DIA liés à un lot économique
   
|Nom attribut | Définition | Type | Valeurs par défaut |
|:---|:---|:---|:---|
|gid|Identifiant unique interne|integer|nextval('m_activite_eco.an_eco_dia_seq'::regclass)|
|idgeolf|Identifiant unique de l'entité géographique lot|integer| |
|num_dia|Numéro de la DIA|character varying(25)| |
|date_dia|Date de la dernière DIA|timestamp without time zone| |
|prix_v|Prix de vente en euros|double precision| |
|nom_v|Nom du vendeur|character varying(80)| |
|nom_a|Nom de l'acquéreur (seconde main)|character varying(80)| |

---

`[m_activite_eco].[an_eco_etab]` : table alphanumérique contenant l'ensemble des informations métiers des établissements
   
|Nom attribut | Définition | Type | Valeurs par défaut |
|:---|:---|:---|:---|
|id|Identifiant unique interne|integer|nextval('m_activite_eco.an_eco_etab_seq'::regclass)|
|idgeoet|Identifiant unique géographique|integer| |
|idsiren|Numéro SIRENE de l'établissement|character varying(9)| |
|idsiret|Numéro SIRET de l'établissement|character varying(14)| |
|l_nom|Libellé du nom de l'établissement spécifique si différent du nom SIRENE (nom usuel du service économie)|character varying(255)| |
|n_adres|Libellé de la nouvelle adresse si l'établissement a déménagé|character varying(255)| |
|eff_ent|Effectif total du groupe|integer| |
|eff_etab|Effectif total de l'établissement|integer| |
|eff_ent_etp|Effectif total du groupe en etp|double precision| |
|eff_etab_etp|Effectif de l'établissement en etp|double precision| |
|eff_etab_d|Précision (en détail) du nombre de CDD, CDI, intérim, ....|character varying(200)| |
|source_eff|Source de l'effectif de l'établissement|character varying(50)| |
|annee_eff|Année de l'effectif (issu de SIRENE)|integer| |
|l_date_eff|Date de l'effectif saisie par l'ARC|date| |
|l_compte|Prise en compte de l'établissement pour le calcul des statistiques (nombre d'établissements et effectifs) dans les informations de synthèse.
Par défaut TRUE et laisse le choix à l'administrateur de la donnée de modifier cette valeur.|boolean|true|
|apet700|Code d'activité de l'établissement (issu de SIRENE et mis à jour lors de la mise à jour de SIRENE)|character varying(255)| |
|libapet|Libellé de l'activité de l'établissement (issu de SIRENE et mis à jour lors de la mise à jour de SIRENE)|character varying(255)| |
|l_url|Lien du site internet de l'entreprise|character varying(500)| |
|l_url_bil|Lien vers le bilan en ligne de l'entreprise|character varying(500)| |
|dentree|Date d'entrée dans le fichier SIRENE|timestamp without time zone| |
|dsortie|Date de sortie du fichier SIRENE|timestamp without time zone| |
|etatadministratifetablissement|Etat administratif de l'établissement dans le fichier SIEREN (attribut déjà présent dans SIRENE mais dupliqué ici pour le filtrage dans GEO, améliore les performances sans passer par une vue)|character varying(1)| |
|old_siret|Attribut de gestion servant uniquement temporairement à la récupération des contacts d'un ancien établissement qui aurait disparu pour les remettre dans le nouveau. Cet attribut est vidé parès mise à jour|character varying(14)| |
|old_id|Attribut de gestion servant uniquement temporairement à la récupération des contacts d'un établissement spécifique non présent dans SIRENE mais apparu par la suite. Cet attribut est vidé parès mise à jour|integer| |
|date_int|Date renseignée par GéoPicardie lors de l'intégration du fichier dans la base (correspond aux dernières données reçues)|date| |
|observ|Commentaires|character varying(255)| |
|op_sai|Libellé de l'opérateur de Saisie|character varying(80)| |
|date_sai|Date de saisie des données attributaires|timestamp without time zone| |
|date_maj|Date de mise à jour des données attributaires|timestamp without time zone| |


Particularité(s) à noter :
* Une clé primaire existe sur le champ `id` l'attribution automatique de la référence unique s'effectue via une séquence. 
* Cette classe d'objet est alimenté automatiquement à l'insertion d'un nouvel établissement SIRENE via un process FME

* 2 triggers :
  * `t_t1_an_sa_etab_date_maj` : trigger permettant d'automatiser la date de mise à jour des données
  * `t_t1_l_nom_null` : trigger permettant de gérer les attributs à NULL et non vide issu de GEO
  * `t_t4_an_sa_etab_oldsiret` : trigger permettant l'appariemment des données de la table des établissements spécifiques ou la récupération d'un ancien disparu
  * `t_t5_an_sa_etab_lcompte_local` : trigger permettant de rafraichir des vues matérialisés
 
---

`[m_activite_eco].[an_eco_etab_rad]` : table alphanumérique contenant l'ensemble des établissements radiés
   
|Nom attribut | Définition | Type | Valeurs par défaut |
|:---|:---|:---|:---|
|gid|Identifiant unique interne|integer|nextval('m_activite_eco.an_eco_etab_rad_seq'::regclass)|
|siren|Identifiant SIRNE de l'unité légale|character varying(9)| |
|date_rad|Date de la radiation|timestamp without time zone| |


Particularité(s) à noter :
* Une clé primaire existe sur le champ `gid` l'attribution automatique de la référence unique s'effectue via une séquence. 
* Cette classe d'objet est alimenté automatiquement à la mise à jour des établissements SIRENE via un process FME insérant les données des radiations téléchargés sur l'OpenData

---

`[m_activite_eco].[an_eco_evenmt]` : table alphanumérique contenant l'ensemble des évènements suivis
   
|Nom attribut | Définition | Type | Valeurs par défaut |
|:---|:---|:---|:---|
|idevenmt|Identifiant unique non signifiant du contact|integer|nextval('m_activite_eco.an_eco_evenmt_seq'::regclass)|
|libelle|Libellé de l'éveènement|character varying(254)| |
|typevenmt|Type d'évènement|character varying(2)| |
|date_evenmt|Date de l'évènement|timestamp without time zone| |
|nom_contact|Nom du contact|character varying(100)| |
|date_sai|Date de saisie des données attributaires|timestamp without time zone| |
|date_maj|Date de mise à jour des données attributaires|timestamp without time zone| |
|op_sai|Libellé de la personne ayant saisie l'objet initialisament|character varying(80)| |
|epci|Autorité compétente|character varying(10)| |
|observ|Observations diverses|character varying(1000)| |


Particularité(s) à noter :
* Une clé primaire existe sur le champ `idevenmt` l'attribution automatique de la référence unique s'effectue via une séquence. 
* Une clé étrangère existe sur la table de valeur `typevenmt` (lien vers la liste de valeurs du type d'évènement `lt_eco_typevenmt`)

`[m_activite_eco].[an_eco_evenmt_media]` : table alphanumérique contenant l'ensemble des médias rattachés aux évènements
   
|Nom attribut | Définition | Type | Valeurs par défaut |
|:---|:---|:---|:---|
|gid|Compteur (identifiant interne)|integer|nextval('m_activite_eco.an_eco_evenmt_media_seq'::regclass)|
|id|Identifiant interne non signifiant de l'objet saisi|text| |
|media|Champ Média de GEO|text| |
|miniature|Champ miniature de GEO|bytea| |
|n_fichier|Nom du fichier|text| |
|t_fichier|Type de média dans GEO|text| |
|op_sai|Opérateur de saisie (par défaut login de connexion à GEO)|character varying(20)| |
|date_sai|Date de la saisie du document|timestamp without time zone| |
|l_doc|Titre du document ou légère description|character varying(100)| |
|t_doc|Type de documents|character varying(2)| |

Particularité(s) à noter :
* Une clé primaire existe sur le champ `gid` l'attribution automatique de la référence unique s'effectue via une séquence. 
* Une clé étrangère existe sur la table de valeur `t_doc` (lien vers la liste de valeurs du type de médias `lt_eco_tdocmedia`)

---

`[m_activite_eco].[an_eco_lot]` : table alphanumérique contenant l'ensemble des informations métiers des lots commercialisés
   
|Nom attribut | Définition | Type | Valeurs par défaut |
|:---|:---|:---|:---|
|idgeolf|Identifiant unique de l'entité géographique lot|integer| |
|surf|Surface parcellaire occupée du lot|integer| |
|surf_l|Surface littérale parcellaire occupée du lot|character varying(15)| |
|date_int|Date renseignée par GéoPicardie lors de l'intégration (correspond aux dernières données reçues)|date| |
|op_sai|Libellé de l'opérateur de saisie|character varying(80)| |
|org_sai|Libellé de l'organisme de saisie|character varying(80)| |
|tact|Type d'activité présent sur le lot|character varying(2)|'00'::character varying|
|tact_99|Précision de l'activité du lot (si Autre sélectionné dans l_tact)|character varying(80)| |
|cnom|Nom de code de l'acquéreur|character varying(20)| |
|lnom|Nom de l'acquéreur|character varying(80)| |
|pvente_l|Prix littéral de vente du lot en HT (ex:50€/m²)|character varying(15)| |
|pcess_l|Prix littéral de cession du lot en HT (ex:30€/m²)|character varying(15)| |
|eff_dep|Effectif de départ prévu par l'implantation de l'établissement lors de l'octroi de la convention de subvention|integer| |
|eff_n5|Effectif prévu de l'établissement à n+5 par la convention d'octroi de subvention|integer| |
|conv|Accord ou non d'une convention d'octroi de subvention|boolean| |
|datefin_conv|Date de fin de la convention d'octroi de subvention, liée à l'effectif n+5|date| |
|observ|Observations diverses|character varying(255)| |
|date_sai|Date de saisie des données attributaires|timestamp without time zone| |
|date_maj|Date de mise à jour des données attributaires|timestamp without time zone| |
|bati|Surface de bâtiments projetée en m²|integer| |
|pc_depot|Date de dépôt du permis de construire|timestamp without time zone| |
|pc_accord|Date d'obtention du permis de construire|timestamp without time zone| |
|pc_tra|Date de commencement des travaux du permis de construire|timestamp without time zone| |
|pc_fin|Date de fin des travaux du permis de construire|timestamp without time zone| |
|pvente_e|Prix de vente (ou cession) envisagé du lot en HT (€/m²) par le service économique|numeric| |
|pcess_e|Prix de cession du lot en HT(€/m²) - plus utilisé (cf prix de cession du foncier)|numeric| |
|pc_num|N° du permis de construire|character varying(50)| |
|pc_mo|Nom du mapitre d'oeuvre (architecte) du PC|character varying(100)| |
|pers_v|Année de la perspective de vente ou de cession|character varying(10)| |
|oripro|Information sur l'origine du projet. 3 valeurs possibles ENDOGENE ou EXOGENE ou non renseignée (pas de listes de valeurs créées, cette liste est paramétrée dans GEO)|character varying(15)| |
|occupant|Libellé de l'occupant du terrain après cession|character varying(100)| |
|descrip|Descriptif du bâtiment construit sur le lot|character varying(1000)| |
|insee|Code Insee du ou des communes|character varying(30)| |
|commune|Libellé de la ou des communes contenant le lot|character varying(250)| |


Particularité(s) à noter :
* Une clé primaire existe sur le champ `idgeolf` l'attribution automatique de la référence unique s'effectue via la vue de gestion. 
* Une clé étrangère existe sur la table de valeur `tact` (lien vers la liste de valeurs du type d'activité `lt_eco_tact`)

---

`[m_activite_eco].[an_eco_media]` : table alphanumérique contenant l'ensemble des médias des objets exclusivement économique
   
|Nom attribut | Définition | Type | Valeurs par défaut |
|:---|:---|:---|:---|
|gid|Compteur (identifiant interne)|integer|nextval('m_activite_eco.an_eco_media_seq'::regclass)|
|id|Identifiant interne non signifiant de l'objet saisi|text| |
|media|Champ Média de GEO|text| |
|miniature|Champ miniature de GEO|bytea| |
|n_fichier|Nom du fichier|text| |
|t_fichier|Type de média dans GEO|text| |
|op_sai|Opérateur de saisie (par défaut login de connexion à GEO)|character varying(20)| |
|date_sai|Date de la saisie du document|timestamp without time zone| |
|l_doc|Titre du document ou légère description|character varying(100)| |
|t_doc|Titre du document ou légère description|character varying(100)| |
|d_photo|Date de la prise de vue|timestamp without time zone| |
|alaune|Média poussé à la une de l'annonce immobilière|boolean|false|


Particularité(s) à noter :
* Une clé primaire existe sur le champ `gid` l'attribution automatique de la référence unique s'effectue via uine séquence. 
* Une clé étrangère existe sur la table de valeur `t_doc` (lien vers la liste de valeurs du type de médias `lt_eco_tdocmedia`)

---

`[m_activite_eco].[an_eco_patri_media]` : table alphanumérique contenant l'ensemble des médias des objets exclusivement lié aux patrimoines
   
|Nom attribut | Définition | Type | Valeurs par défaut |
|:---|:---|:---|:---|
|gid|Compteur (identifiant interne)|integer|nextval('m_activite_eco.an_eco_patri_media_seq'::regclass)|
|id|Identifiant interne non signifiant de l'objet saisi|text| |
|media|Champ Média de GEO|text| |
|miniature|Champ miniature de GEO|bytea| |
|n_fichier|Nom du fichier|text| |
|t_fichier|Type de média dans GEO|text| |
|op_sai|Opérateur de saisie (par défaut login de connexion à GEO)|character varying(20)| |
|date_sai|Date de la saisie du document|timestamp without time zone| |
|l_doc|Titre du document ou légère description|character varying(100)| |
|t_doc|Type de document|character varying(2)|'00'::character varying|


Particularité(s) à noter :
* Une clé primaire existe sur le champ `gid` l'attribution automatique de la référence unique s'effectue via une séquence. 
* Une clé étrangère existe sur la table de valeur `t_doc` (lien vers la liste de valeurs du type de médias `lt_eco_tdocmedia`)

---

`[m_activite_eco].[geo_eco_bati_act]` : table géographique contenant l'ensemble des objets des bâtiments d'activité
   
|Nom attribut | Définition | Type | Valeurs par défaut |
|:---|:---|:---|:---|
|idbati|Identifiant unique de l'objet|character varying(10)|('B'::text || nextval('m_activite_eco.geo_eco_bati_act_seq'::regclass))|
|libelle|Nom usuel du bâtiment|character varying(100)| |
|surf_p|Surface de plancher|integer| |
|op_sai|Opérateur de saisir d'objet à l'ARC|character varying(80)| |
|src_geom|Référentiel spatial de saisie|character varying(2)|'00'::character varying|
|sup_m2|Surface totale de l'objet en m²|double precision| |
|date_sai|Date de saisie de l'objet|timestamp without time zone| |
|date_maj|Date de mise à jour|timestamp without time zone| |
|epci|Autorité compétente|character varying(10)| |
|geom|Champ contenant la géométrie|MultiPolygon,2154| |


Particularité(s) à noter :
* Une clé primaire existe sur le champ `idbati` l'attribution automatique de la référence unique s'effectue via une séquence. 
* Une clé étrangère existe sur la table de valeur `src_geom` (lien vers la liste de valeurs des référentiels de saisies `lt_src_geom`)
 
---

`[m_activite_eco].[geo_eco_etabp]` : table géographique contenant l'ensemble des établissements spécifiques saisis (hors SIRENE)
   
|Nom attribut | Définition | Type | Valeurs par défaut |
|:---|:---|:---|:---|
|idgeoet|Identifiant géographique unique|integer| |
|idsiren|Numéro SIRENE de l'établissement (si connu)|character varying(9)| |
|idsiret|Numéro SIRET de l'établissement (si connu)|character varying(14)| |
|idsite|Identifiant du site d'activité d'appartenance|character varying(10)| |
|date_sai|Date de saisie par le producteur|timestamp without time zone|now()|
|op_sai|Libellé de l'opérateur de Saisie|character varying(80)| |
|org_sai|Libellé de l'organisme dont dépend l'opérateur de saisie|character varying(80)| |
|l_nom|Libellé du nom de l'établissement spécifique|character varying(255)| |
|eff_etab|Effectif total de l'établissement|integer| |
|source_eff|Source de l'effectif de l'établissement|character varying(50)| |
|date_eff|Date de l'effectif|date| |
|l_ape|Code APE de l'établissement|character varying(5)| |
|l_observ|Commentaires|character varying(255)| |
|geom|Champ contenant la géométrie des objets|Point,2154| |
|date_maj|Date de mise à jour|timestamp without time zone| |
|l_compte|Prise en compte de l'établissement pour le calcul des statistiques (nombre d'établissements et effectifs) dans les informations de synthèse.
Par défaut TRUE et laisse le choix à l'administrateur de la donnée de modifier cette valeur.|boolean|true|
|src_geom|Référentiel spatial utilisé pour la saisie|character varying(2)|'20'::character varying|
|eff_etab_d|Précision (en détail) du nombre de CDD, CDI, intérim, ....|character varying(200)| |


Particularité(s) à noter :
* Une clé primaire existe sur le champ `idgeoet` l'attribution automatique de la référence unique s'effectue via un trigger. 
* Une clé étrangère existe sur la table de valeur `src_geom` (lien vers la liste de valeurs des référentiels de saisies `lt_src_geom`)

* 4 triggers :
  * `t_t1_etabp_insert` : trigger permettant d'automatiser l'insertion de la séquence + date de saisie + les informations d'appartenance à un site
  * `t_t5_etabp_update` : trigger permettant d'automatiser la date de mise à jour + les informations d'appartenance à un site
  * `t_t7_geo_sa_etabp_insee` : trigger permettant de récupérer la code INSEE d'assise
  * `t_t91_etabp_null` : trigger permettant de mettre à NULL et non vide les attributs saisis depuis GEO
 
---

`[m_activite_eco].[geo_eco_loc_act]` : table géographique contenant l'ensemble des locaux d'acticité
   
|Nom attribut | Définition | Type | Valeurs par défaut |
|:---|:---|:---|:---|
|idloc|Identifiant unique de l'objet|character varying(10)|('L'::text || nextval('m_activite_eco.geo_eco_loc_act_seq'::regclass))|
|libelle|Nom usuel du local|character varying(100)| |
|typ|Type de local|character varying(2)| |
|adresse_b|Adresse commune entre bâtiment et local|boolean|false|
|adresse_a|Adresse libre si inexistante dans la BAL (adresse non conforme, lieux-dit, ...)|character varying(100)| |
|surf_p|Surface de plancher|integer| |
|descript|Elément descriptif du local|character varying(5000)| |
|occup|Type d'occupation du local|character varying(2)|'00'::character varying|
|pvente|Prix de vente en € du local|integer| |
|pventem2|Prix de vente au m² en € du local|double precision| |
|loyer|Loyer mensuel en € du local|integer| |
|loyerm2|Loyer mensuel au m² en € du local|double precision| |
|occupant|Libellé de l'occupant si établissement non lié|character varying(80)| |
|l_url|Lien URL vers une référen ce externe|character varying(254)| |
|sourceloc|Source des informations du local|character varying(254)| |
|op_sai|Opérateur de saisir d'objet à l'ARC|character varying(80)| |
|src_geom|Référentiel spatial de saisie|character varying(2)|'00'::character varying|
|sup_m2|Surface totale de l'objet en m²|double precision| |
|date_sai|Date de saisie de l'objet|timestamp without time zone| |
|date_maj|Date de mise à jour|timestamp without time zone| |
|epci|Autorité compétente|character varying(10)| |
|geom|Champ contenant la géométrie|MultiPolygon,2154| |


Particularité(s) à noter :
* Une clé primaire existe sur le champ `idloc` l'attribution automatique de la référence unique s'effectue via une séquence. 
* Une clé étrangère existe sur la table de valeur `src_geom` (lien vers la liste de valeurs des référentiels de saisies `lt_src_geom`)
* Une clé étrangère existe sur la table de valeur `typ` (lien vers la liste de valeurs du type de local `lt_eco_typloc`)
* Une clé étrangère existe sur la table de valeur `occup` (lien vers la liste de valeurs du type d'occupation `lt_eco_occuploc`)

---

`[m_activite_eco].[geo_eco_loc_patri]` : table géographique contenant l'ensemble des locaux du patrimoine public
   
|Nom attribut | Définition | Type | Valeurs par défaut |
|:---|:---|:---|:---|
|idpatri|Identifiant unique de l'objet|character varying(10)|('P'::text || nextval('m_activite_eco.geo_eco_loc_patri_seq'::regclass))|
|libelle|Nom usuel du local|character varying(100)| |
|a_const|Année de construction|integer| |
|loyer|Loyer mensuel|double precision| |
|descript|Elément descriptif du local|character varying(5000)| |
|l_url|Lien URL vers une référen ce externe|character varying(254)| |
|op_sai|Opérateur de saisir d'objet à l'ARC|character varying(80)| |
|src_geom|Référentiel spatial de saisie|character varying(2)|'00'::character varying|
|sup_m2|Surface totale de l'objet en m²|double precision| |
|date_sai|Date de saisie de l'objet|timestamp without time zone| |
|date_maj|Date de mise à jour|timestamp without time zone| |
|epci|Autorité compétente|character varying(10)| |
|geom|Champ contenant la géométrie|MultiPolygon,2154| |


Particularité(s) à noter :
* Une clé primaire existe sur le champ `idpatri` l'attribution automatique de la référence unique s'effectue via une séquence. 
 
---

`[m_activite_eco].[h_an_eco_etab]` : table géographique contenant l'historique (ou état) des établissements par an

Particularité(s) à noter :
* cette classe d'objet est alimenté 1 fois par an par un traitement FME 
 
---

`[m_activite_eco].[h_an_eco_site]` : table géographique contenant l'historique (ou état) des sites par an

Particularité(s) à noter :
* cette classe d'objet est alimenté 1 fois par an par un traitement FME 

---

`[m_activite_eco].[lk_adresseetablissement]` : table alphanumérique de relation entre les adresses et les établissements
   
|Nom attribut | Définition | Type | Valeurs par défaut |
|:---|:---|:---|:---|
|idadresse|Identifiant unique de l'adresse|bigint| |
|siret|N° SIRET de l'établissement|character varying(14)| |
|id|Identifiant unique non siggnifiant|integer|nextval('m_activite_eco.lk_adresseetablissement_seq'::regclass)|


Particularité(s) à noter :
* Une clé primaire existe sur le champ `id` l'attribution automatique de la référence unique s'effectue via une séquence. 

* 4 triggers :
  * `t_t1_lk_adresseetablissement_siret_update` : trigger permettant de modifier l'appariemment des adresses à la mise jour de celle-ci à l'établissement
  * `t_t2_lk_adresseetablissement_idsite` : trigger à revoir
  * `t_t3_lk_adresseetablissement_idsite_delete` : trigger permettant de supprimer un appariemment
  * `t_t4_lk_etablissementlocal` : trigger permettant de rafraichir une vue matérialisée d'exploitation
 
---

`[m_activite_eco].[lk_eco_bati_loc]` : table alphanumérique de relation entre les bâtiments et les adresses
   
|Nom attribut | Définition | Type | Valeurs par défaut |
|:---|:---|:---|:---|
|id|Identifiant unique non signifiant de la relation|integer|nextval('m_activite_eco.lk_eco_bati_loc_seq'::regclass)|
|idbati|Identifiant unique non signifiant de l'objet bâti d'activité|character varying(5)| |
|idloc|Identifiant unique non signifiant de l'objet local d'activité|character varying(5)| |


Particularité(s) à noter :
* Une clé primaire existe sur le champ `id` l'attribution automatique de la référence unique s'effectue via une séquence. 

* x triggers : à venir
 
 
---

`[m_activite_eco].[lk_eco_bati_site]` : table alphanumérique de relation entre les bâtiments et les sites
   
|Nom attribut | Définition | Type | Valeurs par défaut |
|:---|:---|:---|:---|
|id|Identifiant unique non signifiant de la relation|integer|nextval('m_activite_eco.lk_eco_bati_site_seq'::regclass)|
|idbati|Identifiant unique non signifiant de l'objet bâti|character varying(5)| |
|idsite|Identifiant unique non signifiant de l'objet site|character varying(5)| |


Particularité(s) à noter :
* Une clé primaire existe sur le champ `id` l'attribution automatique de la référence unique s'effectue via une séquence. 

* x triggers : à venir
 
 
---

`[m_activite_eco].[lk_eco_contact]` : table alphanumérique de relation entre les objets éconimoques et les contacts
   
|Nom attribut | Définition | Type | Valeurs par défaut |
|:---|:---|:---|:---|
|id|Identifiant unique non signifiant|integer|nextval('m_activite_eco.lk_eco_contact_seq'::regclass)|
|idcontact|Identifiant unique non signifiant du contact|integer| |
|idobjet|Identifiant unique non signifiant de l'objet en référence|integer| |


Particularité(s) à noter :
* Une clé primaire existe sur le champ `id` l'attribution automatique de la référence unique s'effectue via une séquence. 

* x triggers : à venir
 
 
---

`[m_activite_eco].[lk_eco_loc_site]` : table alphanumérique de relation entre les locaux d'activité et les sites
   
|Nom attribut | Définition | Type | Valeurs par défaut |
|:---|:---|:---|:---|
|id|Identifiant unique non signifiant de la relation|integer|nextval('m_activite_eco.lk_eco_loc_site_seq'::regclass)|
|idloc|Identifiant unique non signifiant de l'objet local d'activité|character varying(5)| |
|idsite|Identifiant unique non signifiant de l'objet site|character varying(5)| |


Particularité(s) à noter :
* Une clé primaire existe sur le champ `id` l'attribution automatique de la référence unique s'effectue via une séquence. 

* x triggers : à venir
 
 
---


`[m_activite_eco].[lk_eco_loc_etab]` : table alphanumérique de relation entre les locaux d'activité et les établissements
   
|Nom attribut | Définition | Type | Valeurs par défaut |
|:---|:---|:---|:---|
|id|Identifiant unique non signifiant de la relation|integer|nextval('m_activite_eco.lk_eco_loc_etab_seq'::regclass)|
|idloc|Identifiant unique non signifiant de l'objet local|character varying(5)| |
|siren|Identifiant unique non signifiant de l'établissement|character varying(5)| |


Particularité(s) à noter :
* Une clé primaire existe sur le champ `id` l'attribution automatique de la référence unique s'effectue via une séquence. 

* x triggers : à venir
 
 
---

`[m_activite_eco].[lk_eco_proc]` : table alphanumérique de relation entre les sites et les procédures d'aménagement
   
|Nom attribut | Définition | Type | Valeurs par défaut |
|:---|:---|:---|:---|
|id|Identifiant unique non signifiant|integer|nextval('m_activite_eco.lk_eco_proc_seq'::regclass)|
|idproc|Identifiant unique non signifiant de l'objet procédure|character varying(5)| |
|idsite|Identifiant unique non signifiant de l'objet site|character varying(5)| |


Particularité(s) à noter :
* Une clé primaire existe sur le champ `id` l'attribution automatique de la référence unique s'effectue via une séquence. 

* x triggers : à venir
 
 
---

`[m_activite_eco].[lk_eco_bati_adr]` : table alphanumérique de relation entre les bâtiments et les adresses   
|Nom attribut | Définition | Type | Valeurs par défaut |
|:---|:---|:---|:---|
|id|Identifiant unique non signifiant de la relation|integer|nextval('m_activite_eco.lk_eco_bati_adr_seq'::regclass)|
|idbati|Identifiant unique non signifiant de l'objet bâtiment|character varying(5)| |
|idadresse|Identifiant unique de l'adresse|bigint| |


Particularité(s) à noter :
* Une clé primaire existe sur le champ `id` l'attribution automatique de la référence unique s'effectue via une séquence. 

* x triggers : à venir
 
 
---

---

`[m_activite_eco].[lk_eco_loc_adr]` : table alphanumérique de relation entre les locaux d'activités et les adresses   
|Nom attribut | Définition | Type | Valeurs par défaut |
|:---|:---|:---|:---|
|id|Identifiant unique non signifiant de la relation|integer|nextval('m_activite_eco.lk_eco_loc_adr_seq'::regclass)|
|idloc|Identifiant unique non signifiant de l'objet local|character varying(5)| |
|idadresse|Identifiant unique de l'adresse|bigint| |


Particularité(s) à noter :
* Une clé primaire existe sur le champ `id` l'attribution automatique de la référence unique s'effectue via une séquence. 

* x triggers : à venir
 
 
---

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
