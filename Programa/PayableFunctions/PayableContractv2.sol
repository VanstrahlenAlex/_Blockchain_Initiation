//Licencia
//SPDX-License-Identifier: GPL-3.0

//version
pragma solidity ^0.8.31;

//contract
contract PayableContractv2 {
	
	//Palabra(function) + nombre + argumentos + visibilidad + payable? + modificadores + valor de retorno
	function sendEther() public payable {
		
	}
	

	function withdrawEther(uint256 amount) public {
		//recipient + call + valor ether + data 
		(bool success, ) = msg.sender.call{value: amount}("");
		//Comprobar que la transferencia fue exitosa
		require(success, "Transfer failed");
	}

	// function withdrawEther(uint256 amount) public {
	// 	//Comprobar que el contrato tiene suficiente saldo
	// 	require(address(this).balance >= amount, "Contract has not enough balance");
	// 	//Comprobar que el usuario es el dueño del contrato
	// 	require(msg.sender == owner, "Msg.sender is not owner");
	// 	//Enviar el ether al usuario
	// 	(bool success, ) = payable(msg.sender).call{value: amount}("");
	// 	require(success, "Transfer failed");
	// }
}
