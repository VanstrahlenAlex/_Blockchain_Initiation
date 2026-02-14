// 1. License Identifier
// SPDX-License-Identifier: MIT

// 2. Pragma (Versión estable a inicios de 2026)
pragma solidity ^0.8.24;

// 3. Imports (Usando OpenZeppelin para seguridad)
import "@openzeppelin/contracts/access/Ownable.sol";

/**
 * @title SimpleVault
 * @dev Ejemplo de arquitectura Web 3.0 para aprendizaje
 */
contract SimpleVault is Ownable {
    
    // 4. State Variables (Storage)
    mapping(address => uint256) private balances;
    uint256 public totalVaultBalance;

    // 5. Custom Errors (Más barato que strings en 'require')
    error InsufficientBalance(uint256 requested, uint256 available);
    error ZeroAmount();

    // 6. Events
    event Deposited(address indexed user, uint256 amount);
    event Withdrawn(address indexed user, uint256 amount);

    // 7. Constructor
    constructor() Ownable(msg.sender) {}

    // 8. Functions
    
    /// @notice Permite a los usuarios depositar Ether
    function deposit() external payable {
        if (msg.value == 0) revert ZeroAmount();
        
        balances[msg.sender] += msg.value;
        totalVaultBalance += msg.value;
        
        emit Deposited(msg.sender, msg.value);
    }

    /// @notice Permite retirar fondos
    /// @param _amount Cantidad a retirar
    function withdraw(uint256 _amount) external {
        if (_amount > balances[msg.sender]) {
            revert InsufficientBalance(_amount, balances[msg.sender]);
        }
        
        balances[msg.sender] -= _amount;
        totalVaultBalance -= _amount;
        
        (bool success, ) = payable(msg.sender).call{value: _amount}("");
        require(success, "Transfer failed");

        emit Withdrawn(msg.sender, _amount);
    }

    /// @dev Función de solo lectura para el balance
    function getMyBalance() external view returns (uint256) {
        return balances[msg.sender];
    }
}