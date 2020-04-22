![picto](img/Logo_web-GeoCompiegnois.png)

# Documentation d'administration de l'application #


* Statut
  - [ ] à rédiger
  - [x] en cours de rédaction
  - [ ] relecture
  - [ ] finaliser
  - [ ] révision

# Fonctionnel de gestion du patrimoine des biens de l'immobiler d'entreprises et leur mise en disponiblité sur le marché

Ici vous est présenté, temporairement, les premiers tests fonctionnels depuis l'application WebSIG permettant de gérer les données.

### Etape 1 - A la saisie d'un objet (terrain ou local), il faut choisir le bien saisi

![picto](../img/choix_1.png)

### Etape 2- En fonction du bien saisi, la fiche propose un ensemble d'attributs disponible à la saisie

### Etape 2.1 - Si je saisi un terrain, 4 onglets disponibles à saisir

#### Etape 2.1.1 - L'onglet description permet d'indiquer les éléments patrimoniaux du bien.

![picto](../img/choix_211.png)

Particularité(s) à noter :
* l'attribut "Occupant ou type d'occupation" permet de spécifier un usage si l'onglet "Occupants - Occupation" ne peut être complété. Exemple d'un parking d'entreprise, on pourra indiquer ici Parking de ....
* L'attribut "Identifiant de la base Adresse" permettra de lier le bien à une adresse de la BAL (fonctionnalité à développer). Dans le cas contraire, la saisie d'une adresese libre est possible.

#### Etape 2.1.2 - L'onglet propriété permet d'indiquer les éléments concernant le propriétaire du terrain

![picto](../img/choix_212.png)

#### Etape 2.1.3 - L'onglet "Occupants - Occupation" permet d'ajouter un ou des établissements occupants le bien

![picto](../img/choix_213.png)

Particularité(s) à noter :
* même si le bien est un terrain, un établissement peut l'occuper sans avoir de bâtiment
* le bouton "AJOUTER" permet de sélectionner un établissement par son SIRET, nom de l'établissement ou de son unité légale
* 0 ou n établissements peuvent être ajoutés
