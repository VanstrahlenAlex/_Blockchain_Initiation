// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

// Importamos el estándar de seguridad de la industria
import "@openzeppelin/contracts/utils/ReentrancyGuard.sol";

contract SecureBank is ReentrancyGuard {
    mapping(address => uint256) public balances;

    // Custom Errors para ahorrar Gas (Optimización)
    error InsufficientBalance();
    error TransferFailed();

    function deposit() public payable {
        balances[msg.sender] += msg.value;
    }

    // Añadimos el modificador 'nonReentrant' como segunda capa de defensa
    function withdraw() public nonReentrant {
        // 1. Checks
        uint256 bal = balances[msg.sender];
        if (bal == 0) revert InsufficientBalance();

        // 2. Effects
        balances[msg.sender] = 0;

        // 3. Interactions
        (bool success, ) = msg.sender.call{value: bal}("");
        if (!success) revert TransferFailed();
    }
}