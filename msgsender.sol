//LICENCIA
//SPDX-License-Identifier: LGPL-3.0-only

//VERSION SOLIDITY 
pragma solidity ^0.8.31;

//msg.sender
//msg.value

//Contract
contract Sender {

	address public owner;

	constructor(){
		owner = msg.sender;
	}

	function getOwner() public view returns(address){
		return owner;
	}
}
