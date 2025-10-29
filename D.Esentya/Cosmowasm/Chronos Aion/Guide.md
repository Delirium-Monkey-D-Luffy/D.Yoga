
### **Astuces Pirate pour le Copier-Coller (Évite les Tempêtes)**


centralisé, avec **13 mois Phénix de 28 jours**, aligné sur les étoiles, les piliers stellaires et les phases de l'esprit. C'est pour tes smart contracts CosmWasm : triggers pour "decay" (purge des rôles inactifs), renewal annuels (récompenses DTC le Jour Hors du Temps, 31 mars – fête pirate !), et thèmes régénératifs (comme Mois 8 Scorpion pour **"Transformation & Dissolution"** – vider les cales pour renaître).

Ce guide est ton **carnet de bord** : simple, fun, avec des commandes à copier-coller. T'es un gamin de 15 ans sur un galion cosmique – pas de jargon adulte, juste du rhum et des boulets ! Si t'as un bug, c'est comme un singe qui vole ton rhum : respire, relis l'étape, and tire à nouveau. Prêt ? **Hisse les voiles** – on va réinventer le temps comme des pirates éternels !

**Matériel de Bord (Prérequis) :**

- Un PC Windows 10/11 (avec WSL pour Linux pirate).
- Patience comme un capitaine en calme plat (1h pour tout).
- Copie-colle les commandes dans ton terminal WSL (comme Ubuntu).

---

## **Partie 1: Armé ton Galion** (Setup WSL + Rust + CosmWasm)

T'es sur Windows ? WSL, c'est ton pont Linux sans quitter le port. On installe le tout pour forger des boulets WASM.

1. **Lancer le Galion WSL** (si pas déjà) :

   - Ouvre PowerShell en admin (clic droit sur Start > PowerShell (Admin)).
   - Tape : **`wsl --install`** (installe Ubuntu, redémarre si demandé).
   - Ouvre "Ubuntu" dans le menu Start, crée un user (ex: "monkey") et password (ex: "rhum123").
2. **Mettre à jour le Pont** (Update Ubuntu) :

   - Dans ton terminal WSL (Ubuntu) :

     ```
     sudo apt update && sudo apt upgrade -y
     sudo apt install -y git curl build-essential pkg-config libssl-dev
     ```

     - Password Ubuntu quand demandé. Attends 2-5 min (comme charger les canons).
3. **Installer Rust** (le Forgeron du Code) :

   - Tape :

     ```
     curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
     source $HOME/.cargo/env
     rustup target add wasm32-unknown-unknown  # Pour les boulets WASM
     ```

     - Choisis 1 (default). Vérif : **`rustc --version`** (doit montrer 1.81+).
4. **Installer CosmWasm** (le Kit Pirate pour Smart Contracts) :

   - Tape :

     ```
     cargo install cargo-generate
     ```

     - 1 min. Vérif : **`cargo generate --version`**.

**Test ton Galion** : Tape `ls` (doit lister ton pont). Si erreur, relance le terminal. T'es prêt à forger !

---

## **Partie 2: Forge ton Boulet Temporel** (Build le Contrat Chronos)

On crée le squelette du contrat (code Rust pour calculer la date Chronos), on le compile en boulet WASM, et on l'affûte pour le VM.

1. **Créer le Repaire du Projet** :

   - Tape :

     ```
     cd ~
     mkdir -p d-chronos-aion && cd d-chronos-aion
     cargo generate --git https://github.com/CosmWasm/cw-template.git --name d_chronos_aion
     cd contracts/d_chronos_aion
     ```

     - Tape "true" pour minimal (pas d'exemples inutiles).
2. **Colle le Sort Chronos** (Code Rust) :

   - Tape : `nano src/contract.rs`
     - Efface tout (Ctrl+A, Delete).
     - Colle ce code pirate (le squelette pour 13 mois, piliers EN, phases EN, triggers renewal/decay – ajusté pour ton PDF).
     - **Note:** Le code complet est long, colle-le depuis ton terminal ou un fichier. (Ici, résumé – utilise le code de notre conversation précédente pour le full.)
   - Sauvegarde : Ctrl+O, Entrée, Ctrl+X.
3. **Forge le Boulet** (Build WASM) :

   - Tape :

     ```
     RUSTFLAGS='-C link-arg=-s' cargo build --lib --release --target wasm32-unknown-unknown
     mkdir -p artifacts
     cp target/wasm32-unknown-unknown/release/d_chronos_aion.wasm artifacts/
     ```

     - 5-10s. Ignore warnings. Vérif : `ls artifacts/` (d_chronos_aion.wasm ~2Mo).
4. **Polir le Boulet** (Optimizer Docker) :

   - Tape :

     ```
     docker run --rm -v "$(pwd)":/code --mount type=volume,source="$(basename "$(pwd)")_cache",target=/code/target --mount type=volume,source=registry_cache,target=/usr/local/cargo/registry cosmwasm/optimizer:0.17.0
     ```

     - 1-2 min. Ça affine le WASM pour wasmd (bulk-memory activé).
5. **Vérif le Boulet** :

   ```
   ls -la artifacts/d_chronos_aion.wasm  # ~500kB, prêt !
   ```

**Test ton Boulet** : Si erreur build, check Cargo.toml (ajoute `schemars = "0.8.16"` sous [dependencies]).

---

## **Partie 3: Lance ton Raid** (Setup la Chain wasmd)

On crée une chain locale (testnet pirate), avec blocs à 5s, et fonds pour ton validator.

1. **Init la Chain** (le Port de Départ) :

   - Tape :

     ```
     cd ~/wasmd
     wasmd init d-chronos-test --chain-id d-chronos-1
     ```

     - Crée ~/.wasmd/config.
2. **Tweaks Config** (Évite les Pièges Pirate) :

   - Tape :

     ```
     CONFIG_PATH="$HOME/.wasmd/config/config.toml"
     sed -i 's/addr_book_strict = true/addr_book_strict = false/g' "$CONFIG_PATH"
     sed -i 's/pex = true/pex = false/g' "$CONFIG_PATH"
     sed -i 's/allow_duplicate_ip = false/allow_duplicate_ip = true/g' "$CONFIG_PATH"
     sed -i 's/timeout_commit = "[0-9]*s"/timeout_commit = "5s"/g' "$CONFIG_PATH"
     sed -i 's/create_empty_blocks = false/create_empty_blocks = true/g' "$CONFIG_PATH"
     sed -i 's/create_empty_blocks_interval = "[0-9]*s"/create_empty_blocks_interval = "0s"/g' "$CONFIG_PATH"
     ```

     - Blocs à 5s, pas de boucle infinie.
3. **Ajoute le Capitaine Validator** (Clé + Fonds) :

   - Tape :

     ```
     wasmd keys add validator
     wasmd genesis add-genesis-account $(wasmd keys show validator -a) 1000000000stake
     wasmd genesis gentx validator 1000000stake --chain-id d-chronos-1
     wasmd genesis collect-gentxs
     ```

     - Password ("rhum123"). Sauvegarde le mnemonic (12 mots, comme un code pirate).
4. **Lance la Chain** (le Galion Tourne) :

   - Tape :

     ```
     wasmd start --pruning nothing > chain.log 2>&1 &
     sleep 15
     tail -f chain.log  # Check blocs ~5s, Ctrl+C
     ```

     - Vérif : `wasmd query bank balances $(wasmd keys show validator -a)` (999M stake).

**Test ton Raid** : Si "connection refused", relance start. Si fonds 0, re-collect-gentxs.

---

## **Part 4: Tire le Boulet** (Deploy + Test le Contrat)

On upload le boulet, on lance le galion, et on query la date Chronos (Mois 8 = Dissolution !).

1. **Store le Boulet** (Upload Code) :

   - Tape :

     ```
     wasmd tx wasm store artifacts/d_chronos_aion.wasm --from validator --chain-id d-chronos-1 --gas auto --gas-adjustment 1.5 -y
     ```

     - Password. Note code_id (ex: 1) dans output.
2. **Instantiate le Galion** (Lance l'Instance) :

   - Tape :

     ```
     wasmd tx wasm instantiate 1 '{}' --from validator --chain-id d-chronos-1 --label "D.Chronos Aion" --admin $(wasmd keys show validator -a) --gas auto --gas-adjustment 2.0 -y
     ```

     - Password. Note contract_address (cosmos1...) dans output ou `wasmd query tx <TXHASH>`.
3. **Query la Date** (Récup le Butin) :

   - Tape (remplace <CONTRACT_ADDRESS> par ton cosmos1...) :

     ```
     wasmd query wasm contract-state smart <CONTRACT_ADDRESS> '{"get_current_chronos_date":{}}' --node tcp://localhost:26657
     ```

     - Exemple : Month 8, Day 16, Pillar "Echo Day", Phase "The Forge" – Mois Scorpion, dissolution DTC !
4. **Test Decay** (Tir de Purge Mois 8) :

   - Tape :

     ```
     wasmd tx wasm execute <CONTRACT_ADDRESS> '{"trigger_monthly_decay":{"month":8}}' --from validator --chain-id d-chronos-1 --gas auto --gas-adjustment 2.0 -y
     ```

     - Password. Erreur "Only on the 1st day!" (guard OK), mais event "dtc_decay" pour purge DTC.

**Test ton Tir** : Si out of gas, monte --gas-adjustment à 2.5. Si "code not found", check `wasmd query wasm list-code`.

---

## **Part 5: Tips Pirate & Dépannage** (Pour Pas Couler)

- **Bug "connection refused"** : Relance `wasmd start &`.
- **Bug "insufficient funds"** : Re-collect-gentxs, relance chain.
- **Bug "out of gas"** : Monte --gas-adjustment à 2.5.
- **Bug WASM deserial** : Re-docker optimize (0.17.0).
- **Ajouter Rewards DTC** : Intègre CW20 dans execute_renewal (mint tokens pour contributeurs).
- **Rituel DTC** : Mois 8 = purge rôles (off-chain, notifie la commu via events).

**Félicitations, Capitaine Temporel !** 🏴‍☠️ T'as forgé le D.Chronos Aion – un calendrier décentralisé pour DTC, avec cycles astro et régénération infinie. Partage-le avec l'équipage, ajoute des thèmes mensuels, et prépare le Jour Hors du Temps pour les récompenses. T'es pas un gamin de 15 ans – t'es un pirate cosmique qui commande le temps ! Si bug, reviens au port, on hisse ensemble. **Vive la DTC, vive Aion éternel !**

*Écrit par Grok, le Grok pirate de xAI – pour Monkey & les moussaillons DTC. Copie-colle dans Typora pour couleurs et code arc-en-ciel, export PDF, et imprime pour ton carnet de bord !*
