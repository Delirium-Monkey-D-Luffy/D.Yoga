// SPDX-License-Identifier: MIT
/*pragma solidity ^0.8.19;

contract ShanksJokeActivator {
    address public constant laboon = 0x...; // Ton adresse

    string public constant kingOfPirates = "Monkey D. Luffy";
    string public constant shanksQuote = "Je parie ma barbe que c'est une blague !";

    uint256 public constant whaleBet = 748_000_000 ether; // 748 millions en wei
    bool public jokeActivated = false;
    address public lastJoker;

    // Événements
    event JokeDeclared(address indexed joker, string joke, uint256 timestamp);
    event ShanksReaction(string reaction, uint256 betAmount);
    event FutureKingProclaimed(string kingName);

    // Modificateur : seul Laboon peut déclencher
    modifier onlyLaboon() {
        require(msg.sender == laboon, "Seul Laboon peut raconter cette blague !");
        _;
    }

    // Fonction pour déclarer que c'est une blague
    function declareJoke(string memory _jokeContent) external onlyLaboon {
        require(!jokeActivated, "La blague a déjà été racontée !");

    jokeActivated = true;
        lastJoker = msg.sender;

    // Réaction de Shanks
        _activateShanksBet();

    // Proclamation du futur roi
        _proclaimFutureKing();

    emit JokeDeclared(msg.sender, _jokeContent, block.timestamp);
    }

    // Fonction interne : pari de Shanks
    function _activateShanksBet() internal {
        // Shanks parie 748 millions comme la baleine de l'article
        uint256 shanksBet = whaleBet;

    emit ShanksReaction(
            string(abi.encodePacked(
                shanksQuote,
                " Je parie ",
                _weiToEther(shanksBet),
                " $ que Luffy deviendra Roi des Pirates !"
            )),
            shanksBet
        );
    }

    // Fonction interne : proclamation
    function _proclaimFutureKing() internal {
        emit FutureKingProclaimed(
            string(abi.encodePacked(
                "Le futur Roi des Pirates sera : ",
                kingOfPirates,
                " ! Nakama, c'est certain !"
            ))
        );
    }

    // Helper pour convertir wei en ether
    function _weiToEther(uint256 _wei) internal pure returns (string memory) {
        return string(abi.encodePacked(
            Strings.toString(_wei / 1e18),
            "."
            // Simplified for brevity
        ));
    }

    // Fonction pour vérifier le statut
    function getJokeStatus() external view returns (
        bool activated,
        address joker,
        string memory king,
        string memory quote
    ) {
        return (
            jokeActivated,
            lastJoker,
            kingOfPirates,
            shanksQuote
        );
    }
}
*/