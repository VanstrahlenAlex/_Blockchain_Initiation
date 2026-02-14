// Licencia 
// SPDX-License-Identifier: LGPL-3.0-only

//Version 
pragma solidity ^0.8.33;

//Contrato
contract ContratoTest {
     
//Numeros 
uint num1 = 1; // [0 ... 2^256 - 1]
int num2 = -1; // [-2^255 ... 2^255 - 1]
uint8 num3 = 255; // [0 ... 2^8 - 1]
uint16 num4 = 65535; // [0 ... 2^16 - 1]
uint256 num5 = 115792089237316195423570985008687907853269984665640564039457584007913129639935; // [0 ... 2^256 - 1]

int8 num6 = -128; // [-2^7 ... 2^7 - 1]
int16 num7 = -32768; // [-2^15 ... 2^15 - 1]
// int256 num8 = -115792089237316195423570985008687907853269984665640564039457584007913129639936; // [-2^255 ... 2^255 - 1]

//Booleanos
bool bool1 = true;
bool bool2 = false;

//String
string string1 = "Hola";
string string2 = "Mundo";

//Address
address address1 = 0x0000000000000000000000000000000000000000;

//Array
uint[] array1 = new uint[](5);
uint256[5] array2 = [1, 2, 3, 4, 5];

//Mapping
mapping(address => uint) mapping1;
mapping(address => uint256) mapping2;



//Struct
struct Persona {
    string nombre;
    uint edad;
    address direccion;
}

Persona persona1 = Persona("Juan", 25, 0x0000000000000000000000000000000000000000);

//Enums
enum Estado {
    Pendiente,
    Enviado,
    Recibido,
    Entregado
}

Estado estado1 = Estado.Pendiente;

enum Test {
	Test1,
	Test2,
	Test3
}

//Events
event Evento(string nombre, uint edad);

//Functions
function suma(uint a, uint b) public pure returns (uint) {
    return a + b;
}

//Modifiers
address owner = msg.sender;
address owner2 = msg.sender;
modifier onlyOwner() {
    require(msg.sender == owner || msg.sender == owner2);
    _;
}

//Ejemplo de estructura 
//Modificadores
modifier modificador1 {
	if(5 + 2 != 10) {
		revert();
	}
	_;
}


//Eventos
event Multiplicacion(uint256 result);

//Funciones


//Funciones palabra (function) + nombre + argumentos + visibilidad + Modificadores + valor de retorno o devuelto (returns)

//Visibilidad : 
//public : visible para todos
//private : visible solo para el contrato
//internal : visible solo para el contrato y los contratos que heredan
//external : visible solo para los contratos externos

function multiplier(uint256 num1a, uint256 num2b) public modificador1 returns (uint256 result) {
    result = num1a * num2b;
    emit Multiplicacion(result);
    return result;
}


}