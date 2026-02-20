// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

contract VulnerableBank {
    mapping(address => uint256) public balances;

    function deposit() public payable {
        balances[msg.sender] += msg.value;
    }

    // --- FUNCIÓN VULNERABLE ---
    function withdraw() public {
        // 1. Checks (Verificaciones)
        uint256 bal = balances[msg.sender];
        require(bal > 0, "Insufficient balance");

        // 2. Effects (Efectos - Actualizar estado antes de interactuar)
        balances[msg.sender] = 0;

        // 3. Interactions (Interacciones externas)
        (bool success, ) = msg.sender.call{value: bal}("");
        require(success, "Transfer failed");
    }
}