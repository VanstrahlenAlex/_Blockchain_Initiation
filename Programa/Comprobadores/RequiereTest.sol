//Licencia
//SPDX-License-Identifier: LGPL-3.0-only

//version
pragma solidity ^0.8.31;


//Custom errors - se deben hacer antes del contrato y entre la version y el contrato
error CustomErrorTest();

//contract
contract RequiereTest {
	
	address public admin;
	
	constructor(address admin_){
		admin = admin_;
	}

	//Function + if check: msg.sender sea igual a admin
	function checkAdmin() public view {
		if(msg.sender != admin) revert();
	}

	//Function + if check: msg.sender sea igual a admin
	function checkAdminRequire() public view {
		require(msg.sender == admin, "Msg.sender is not admin");
	}

	//Function + require check
	function checkAdminAssert() public view {
		assert(msg.sender == admin);
	}


	//Function + if + custom error
	function checkAdminCustomErrors() public view {
		if(msg.sender != admin) revert CustomErrorTest();
	}

	function getAdmin() public view returns(address){
		return admin;
	}
}