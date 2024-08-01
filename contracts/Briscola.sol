// SPDX-License-Indentifier: MIT
pragma solidity ^0.8.0;

contract Briscola {  
    address public player1;
    address public player2;
    uint public betAmount;
    bool public gameStarted;
    address public winner;

    

    constructor() {
        gameStarted = false;
    }

    function startGame() public payable {
        require(!gameStarted, "Game already started");
        if (player1 == address(0)) {
            player1 = msg.sender;
            betAmount = msg.value; 
        } else {
            player2 = msg.sender; 
            require(msg.value == betAmount, "Bet amount have to be the same");
            gameStarted = true;
        }
    }
}