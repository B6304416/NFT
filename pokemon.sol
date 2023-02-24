// SPDX-License-Identifier: MIT
pragma solidity ^0.8.1;

contract ProofOfSlime {
    event Add(address owner, string character);

    event BuyError(address from, string text, string reason);

    function buy_character(string memory character) public payable {
        if (msg.value <= 0.0001 ether) {
            emit BuyError(
                msg.sender,
                character,
                "Incorrect amount of Ether. Must be more than 0.0001 ether to buy a character."
            );
            payable(msg.sender).transfer(msg.value);
            return;
        }
        emit Add(
            msg.sender,
            character
        );
    }
}