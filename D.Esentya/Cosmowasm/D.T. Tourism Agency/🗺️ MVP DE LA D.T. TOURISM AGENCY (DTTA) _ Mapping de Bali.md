# 🗺️ MVP DE LA D.T. TOURISM AGENCY (DTTA) : Mapping de Bali
## Spécifications Techniques et Fonctionnelles du Lancement Pilote

**Par :** Manus AI (pour Monkey et Gorilla)
**Objectif :** Définir les étapes concrètes pour le lancement du MVP de la DTTA, centré sur la région de Bali (Trillion Sunny Island).

---

## 1. Objectif du MVP : Preuve de Concept du PoE Touristique

Le MVP vise à prouver la faisabilité du **Proof-of-Esentya (PoE)** appliqué au tourisme équitable.

*   **Zone Pilote :** Bali (autour du Trillion Sunny Island).
*   **Durée Estimée :** 30 jours (après le lancement du MVP Essentios).
*   **Critère de Succès :** Validation de 100 transactions de service (touriste-guide) via le `PoE_Beacon_Manager` sur le testnet DTC.

---

## 2. Composants Clés du MVP

| Composant | Description | Rôle dans le MVP |
| :--- | :--- | :--- |
| **Mapping Virtuel** | Création d'une carte virtuelle de Bali (Frontend) superposée à la carte réelle. Les points d'intérêt (temples, restaurants, centres de yoga) sont des **Points de Quête**. | Interface visuelle du jeu **D.Quest** pour les Explorateurs. |
| **Points de Quête (RWA NFTs)** | Tokenisation de 20 à 30 services locaux (guide de temple, cours de cuisine, plongée) en **RWA NFTs de Quête**. | Les services réels deviennent des objets de jeu. |
| **Pod Local (Bali)** | Création du premier **Pod Local** (mini-DAO) pour la DTTA. | Gère l'onboarding des 10 premiers **Gardiens du Lieu** (guides locaux). |
| **PoE Beacon Manager** | Le Smart Contract CosmWasm qui gère la validation de la présence physique. | Le cœur technique du MVP. Valide la transaction touriste-guide. |

---

## 3. Scénario Fonctionnel (Le Voyageur Sadhaka)

Le MVP se concentre sur le scénario de validation de l'expérience.

### Étape 1 : Acquisition du Service (Quête)

1.  Le **Voyageur Sadhaka** consulte la carte virtuelle de Bali et sélectionne un service (ex: "Trek au Mont Batur avec le Gardien Wayan").
2.  Il paie le service en **$D.Flow** via l'application. Le `Equitable_Travel_Pod` bloque les fonds.

### Étape 2 : Validation de l'Expérience (PoE)

1.  Le Voyageur et le Gardien Wayan se rencontrent au point de départ.
2.  Le Gardien Wayan active la fonction `Start_Service()` sur son application.
3.  À la fin du service, le Voyageur active la fonction `Validate_Experience()`.
4.  Le `PoE_Beacon_Manager` vérifie :
    *   La **Proximité** des deux appareils (via BLE/GPS).
    *   La **Durée** du service (alignée sur le temps estimé).
    *   La **Signature** des deux parties sur la blockchain.

### Étape 3 : Rémunération et Karma

1.  Si la validation est réussie, le `Equitable_Travel_Pod` libère les fonds ($D.Flow) au Gardien Wayan.
2.  Le Voyageur laisse un commentaire et une note. Cette action est un **Event** qui alimente le `DharmaPulse` et augmente le **Karma** du Gardien.

---

## 4. Spécifications Techniques du PoE MVP

| Spécification | Détail Technique | Implication |
| :--- | :--- | :--- |
| **Smart Contract** | `PoE_Beacon_Manager` (CosmWasm) | Gère les clés publiques des Gardiens et les coordonnées des Points de Quête. |
| **Validation** | Triple Vérification : GPS + BLE + Timestamp | Minimise la fraude de géolocalisation. |
| **Données Stockées** | Hash de la transaction, ID du Gardien, ID du Voyageur, Note/Commentaire (Hash de l'Holocron). | Aucune donnée personnelle n'est stockée, seulement la preuve de l'interaction. |
| **Lien D.Quest** | Le succès de la validation débloque un **Soulbound NFT** "Bali Explorer" pour le Voyageur. | Le jeu et la réalité sont fusionnés. |

