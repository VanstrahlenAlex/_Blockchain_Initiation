// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

contract VulnerableBank {
    mapping(address => uint256) public balances;

    function deposit() public payable {
        balances[msg.sender] += msg.value;
    }

    // --- FUNCIÓN VULNERABLE ---
    function withdraw() public {
        uint256 bal = balances[msg.sender];
        require(bal > 0, "Insufficient balance");

        // 1. Interacción externa (Envío de dinero)
        (bool success, ) = msg.sender.call{value: bal}("");
        require(success, "Transfer failed");

        // 2. Efecto (Actualización de balance) - ¡DEMASIADO TARDE!
        balances[msg.sender] = 0;
    }
}