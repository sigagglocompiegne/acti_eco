![picto](img/Logo_web-GeoCompiegnois.png)

# Documentation d'administration de l'application #

* Statut
  - [ ] à rédiger
  - [x] en cours de rédaction
  - [ ] relecture
  - [ ] finaliser
  - [ ] révision

# Fonctionnel de gestion du patrimoine des biens de l'immobiler d'entreprises et leur mise en disponiblité sur le marché

Une réunion intermédiaire avec le service du développement économique a eu lieu le 23 octobre 2020 pour présenter ce premier fonctionnel et les étapes à venir.
Cette solution convient au service mais un certain nombre de points fonctionnels ou de contenus attributaires restent encore à finaliser ou à stabiliser.

Les étapes ci-après présentent le fonctionnement applicatif et indique le rôle du service SIG et celui du service du développement économique pour la suite du projet.

Il a été convenu de conserver le principe fonctionnel présenté. Le service du développement économique doit encore valider l'ensemble des attributs de gestion, et tester le fonctionnel. Il doit également réfléchir aux fonctionnels applicatifs de recherches, de présentation cartographique, d'exports et de tableaux de bord.

L'applicatif sera mis en mode de pré-prodcution une fois tous les éléments validés par le service du développement économique et la finalisation du fonctionnel par le service SIG.

Durant cette phase de pré-production, consistant à intégrer le patrimoine des locaux immobiliers, l'application spécifique sur l'immobilier d'entreprises sera conservé. Cette phase permettra également au service de tester l'applicatif et éventuellement de réaliser des ajustements. Les différentes fonctionnalités seront ensuite ajoutées au fur et à mesure.

Une fois cette période réalisée, l'ensemble du dispostif sera intégré à l'applicatif "Activité économique" actuellement en production.

**Fonctionnalités génériques à développer par le service SIG**

* L'attribut "Identifiant de la base Adresse" permettra de lier le bien à une adresse de la BAL (fonctionnalité à développer). Dans le cas contraire, la saisie d'une adresese libre est possible.
* Sélection des occupants à partir de la liste des établissements géolocalisés à l'adresse.
* Revoir la gestion des attributs liés à la surface (entre SIG, surface du bâtiments, surface des locaux, ...). En fonction des cas, la surface par défaut est celle du SIG, l'utilisateur peut saisir une surface propre, mais si cette surface est supprimée doit revenir par défaut à la surface SIG.

**Fonctionnalités spécifiques à developper (liste non exhaustives en attente retour du service développement économique)**

* Gestion des bâtiments comprenant x locaux identifiés (prévoir une fonctionnalité permettant d'accéder à une fiche pour changer le nom du bâtiment qui apparaît dans la liste des bâtiments d'affectation pour un local identifié)
* Cartographie : afficher la présence d'une vente ou d'une location par un applat de couleur



### Etape 1 - A la saisie d'un objet (terrain ou local), il faut choisir le bien saisi

![picto](../img/choix_1.png)

### Etape 2- En fonction du bien saisi, la fiche propose un ensemble d'attributs disponible à la saisie

### Etape 2.1 - Si je saisi un terrain, 4 onglets disponibles à saisir

#### Etape 2.1.1 - L'onglet description permet d'indiquer les éléments patrimoniaux du bien.

![picto](../img/choix_211.png)

**Particularité(s) à noter :**

* l'attribut "Occupant ou type d'occupation" a été supprimé ici
* l'attribut "Lien vers un site présentant le terrain " a été renommé "Lien vers un site présentant le bien"
* l'attribut "Surface (en ha)" a été supprimé


**Fonctionnalité à développer par le service SIG**

* Cf Fonctionnalités génériques en début de page (adressage)


**Rôle du service du développement économique**

* valider les attributs

#### Etape 2.1.2 - L'onglet propriété permet d'indiquer les éléments concernant le propriétaire du terrain

![picto](../img/choix_212.png)

**Rôle du service du développement économique**

* valider les attributs

#### Etape 2.1.3 - L'onglet "Occupants - Occupation" permet d'ajouter un ou des établissements occupants le bien

![picto](../img/choix_213.png)

Particularité(s) à noter :
* même si le bien est un terrain, un établissement peut l'occuper sans avoir de bâtiment
* le bouton "AJOUTER" permet de sélectionner un établissement par son SIRET, nom de l'établissement ou de son unité légale
* 0 ou n établissements peuvent être ajoutés
* l'icône "fiche" à gauche permet d'accéder à la fiche de l'établissement
* l'icôbe "poubelle" permet de supprimer l'établissement de la liste

**Fonctionnalité à développer par le service SIG**

* * Cf Fonctionnalités génériques en début de page (sélection des occupants)

**Rôle du service du développement économique**

* valider les attributs


#### Etape 2.1.4 - L'onglet "Commercialisation" permet de rendre le bien disponible à la vente ou à la location

##### Etape 2.1.4.1 - Cas d'un bien non concerné par une disponibilité

![picto](../img/choix_2141.png)

Particularité(s) à noter :
* lorsqu'un bien n'est pas mis en disponiblité, seules ces informations financières d'occupation actuelles sont accessibles

##### Etape 2.1.4.2 - Cas d'un bien concerné par une disponibilité de vente (vacant ou occupé)

![picto](../img/choix_2142.png)

Particularité(s) à noter :
* l'onglet "Conditions financières d'occupation" est maintenant disponible mais dans un second temps pour la cas d'une mise en vente ou en location
* 2 nouveaux onglets : "Conditions financières de commercialisation" et "Contact" sont accessibles

![picto](../img/choix_21421.png)

![picto](../img/choix_21422.png)

**Rôle du service du développement économique**

* valider les attributs

### Etape 2.2 - Si je saisi un "local (Bâtiment non divisé)", il s'agit ici d'un bien (local d'activité) qui correspondant aux bâtiments

#### Etape 2.2.1 - L'onglet "Bâtiment" permet de renseigner les éléments du bâtiment contenant le bien (non présent pour un terrain)

##### Etape 2.2.1.1 - L'onglet "Bâtiment" description (du bâtiment) permet d'indiquer les éléments descriptifs du bâtiment contenant le patrimoine du bien.

![picto](../img/choix_221.png)

Particularité(s) à noter :
* Contraitement au terrain, un onglet supplémentaite est disponible permettant de décrire le bâtiment
* les éléments descriptifs du bâtiment seront modifiés pour se limiter aux éléments consitutant le bâtiment et non des éléments partoculier à des locaux.
* Plusieurs éléments descriptifs sont sélectionnables

**Fonctionnalité à développer par le service SIG**

* le nombre de locaux saisis correspond aux nombres de bien déclaré dans ce bâtiment. Dans ce cas présent, le nombre sera de 1. Ce calcul sera automatisé dans la base de données.


**Rôle du service du développement économique**

* Revoir la liste des descriptions. Ne garder ici que les éléments décrivant le bâtiment. Les autres éléments décrivant le local devront être disponible dans l'onglet Description du bien.
* valider les attributs


**Fonctionnalité à développer par le service SIG**

* Ici rendre le sous-onglet invisible, les données de propriété sont à renseigner dans l'onglet "Propriété du bien"

**Rôle du service du développement économique**

* valider les attributs

#### Etape 2.2.2 - L'onglet description permet d'indiquer les éléments patrimoniaux du bien.

![picto](../img/choix_222.png)

Particularité(s) à noter :
* 3 attributs supplémentaires par rapport à la saisi d'un terrain ont été ajoutés : `Type de bien`, `description` et `pas-de-porte`
* le type de bien permet de sélectionner dans une liste de valeur `Activité`, `Bureau` ou `Commerce`
* l'information "pas-de-porte" est intégrée ici avec une valeur `false` par défaut et permettra de développer ce suivi sur les commerces de centre-ville
* l'attribut "Lien vers un site présentant le terrain " a été renommé "Lien vers un site présentant le bien"

**Rôle du service du développement économique**

* Revoir la liste des descriptions. Ne garder ici que les éléments décrivant le bien (en lien avec la description du bâtiment)
* Revoir la liste des type de bien
* valider les attributs

#### Etape 2.2.3 - Les onglets "Propriété du bien", "Occupants-Occupations" et "Commercialisation" 

Ces onglets sont identiques à la saisie d'un terrain donc pas de rappel ici, cf Etape 2.1.

### Etape 2.3 - Si je saisi un "local indépendant divisé", il s'agit ici d'un local bien identifié dans un bâtiment comprenant d'autres locaux bien identifié

![picto](../img/choix_23v2.png)

Ici, je peux soit affecter un bâtiment déjà saisi (dans la liste déroulante), ou créer un bâtiment en ajoutant une valeur dans la liste. Il faut ensuite enregistrer la fiche puis la rendre de nouveau éditable pour compléter les éléments descriptif du bâtiment. Ces éléments seront ensuite disponible pour un autre bien identifié dans le même bâtiment. Dans ce dernier cas, il faudra simplement sélectionner le nom du bâtiment dans la liste.

Particularité(s) à noter :
* Plusieurs éléments descriptifs sont sélectionnables

**Fonctionnalité à développer par le service SIG**

* le nombre de locaux saisis correspond aux nombres de bien déclaré dans ce bâtiment. Dans ce cas présent, le nombre sera de 1. Ce calcul sera automatisé dans la base de données.
* Revoir ici le fonctionnel de la propriété du bâtiment qui ne fonctionne pas

**Rôle du service du développement économique**

* Revoir la liste des descriptions. Ne garder ici que les éléments décvrivant le bâtiment. Les autres éléments décrivant le local devront être disponible dans l'onglet Description du bien.

Tous les autres onglets sont identiques à la saisie d'un "local (Bâtiment non divisé)" donc pas de rappel ici, cf Etape 2.2.

### Etape 2.4 - Si je saisi un "local non identifié dans un bâtiment divisible", il s'agit ici d'un ensemble de locaux contenu dans un bâtiment sans pouvoir en saisir leurs géométries. Tous ces locaux seront donc rattachés à la géométrie du bâtiment.

![picto](../img/choix_24.png)

Particularité(s) à noter :
* tous les onglets sont identiques à la saise d'un autre type de local, sauf que la saisie peut-être multiple. La présentatation de certains onglets est donc sous forme de liste de valeurs possibles. Se reporter aux parties ci-après détaillant ce fonctionnement.

**Fonctionnalité à développer par le service SIG**

* le nombre de locaux saisis correspond aux nombres de bien déclaré dans ce bâtiment. Dans ce cas présent, le nombre sera de 1. Ce calcul sera automatisé dans la base de données.

**Rôle du service du développement économique**

* Revoir la liste des descriptions. Ne garder ici que les éléments décvrivant le bâtiment. Les autres éléments décrivant le local devront être disponible dans l'onglet Description du bien.

#### Etape 2.4.1 - Un préalable, je dois renseigner et enregistrer les données concernant le bâtiment (description et propriété) avant de pouvoir y affecter des locaux. Par défaut à l'enregistrement du bâtiment un local est créé. 

**ATTENTION : ce préalable n'est plus nécessaire, tout peut-être fait en une seule fois depuis la mise à jour fonctionnelle de l'outil**

![picto](../img/choix_241.png)

#### Etape 2.4.2 - Modifier les informations d'un local existant

En cliquant sur l'icône `Fiche` à gauche de la liste présentée, ouvrez la fiche du local et modifiez la.

![picto](../img/choix_242.png)

Particularité(s) à noter :
* A ce stade, toutes les informations à renseigner dans les onglets peuvent être effectués à partir de l'onglet "Description des biens (locaux)" à partir d'une fiche complémentaire. Ces informations seront répercuter par défaut dans le reste de la fiche du bien. Ce fonctionnel a été mis en place car il s'agit ici d'affecter plusieurs locaux (non géographique) à une même entité graphique représentant le bâtiment. Par conséquent tous les onglets (sauf "Bâtiment") présenteront leurs informations sous forme de liste avec la possibilité d'accéder à une fiche détaillant quant à elle le bien en question.

##### Etape 2.4.2.1 - Ouvrir la fiche du local et modifier ces informations

Cliquez sur l'icône `Fiche` à gauche de la liste présentée pour afficher la fiche du local ci-dessous. 

![picto](../img/choix_2421.png)

Particularité(s) à noter :
* Chaque onglet de cette fiche fonctionne comme les autres types de bien. Reportez-vous aux parties correspondantes pour le fonctionnement de chaque onglet.

##### Etape 2.4.2.2 - Accédez aux informations dans les différents onglets de la fiche du bien

Après l'enregistrement de cette fiche local (étape 2.4.2.1), toutes les informations sont répercutées dans chaque onglet de la fiche du bien comme ci-dessous. En cliquant sur l'icône `Fiche` à gauche de la liste présentée dans n'importe quel onglet, vous permet d'accéder à la fiche du local et de la modifier.

* Onglet "Description des biens (locaux)"

![picto](../img/choix_24211.png)

* Onglet "Propriété des biens (locaux)"

* Onglet "Occupants - Occupation"

![picto](../img/choix_24213.png)

* Onglet "Commercialisation"

![picto](../img/choix_24214.png)

Particularité(s) à noter :
* pour ce dernier onglet, a été intégré un sous-onglet sur les conditons financières d'occupation actuelle et sur les contacts


#### Etape 2.4.3 - Ajourer un local

Cliquez sur l'icône `AJOUTER` en bas à droite de la fiche du bien de l'onglet "Description des biens (locaux)".

![picto](../img/choix_243b.png)

##### Etape 2.4.3.1 - Saisir les informations du local

![picto](../img/choix_2431.png)

Renseignez les informations du local dans chaque onglet et sauvegardez.  

**Rôle du service du développement économique**

* Revoir la liste des descriptions. 
* Valider les attributs
* Précisez ici si un souhait d'avoir un onglet médiathèque pour gérer les documents spécifiques à un local.


### Etape 3 : Les métadonnées

![picto](../img/choix_0.png)

Pour tous biens saisis, un onglet "Métadonnée" est disponible au niveau supérieur de la fiche. La référentiel de saisie PCI Vecteur a été mis par défaut. La date du référentiel peut être indiqué.

### Etape 4: La médiathèque

* un troisième onglet au niveau des 2 onglets supérieurs de la fiche a été intégré pour gérer l'intégration de documents. Cet onglet sera nommé "Médiathèque"

**Rôle du service du développement économique**

* Précisez ici si un souhait d'avoir un onglet médiathèque pour gérer les documents spécifiques à un local dans le cas des locaux non identifiés dans un même bâtiment


