pragma solidity ^0.6.12;

contract Presence {
    
    //cria a estrutura de empregado
    struct Employee {
        bool onWorkSchedule;
        uint presences;
    }
    
    address public manager;
    mapping(address => Employee) public office;
    
    //atribui o criador do contrato
    constructor() public {
        manager = msg.sender;
    }
    
    //função para registrar um funcionário
    function recordEmployee(address employee) public {
        if(msg.sender != manager) return;
        office[employee].onWorkSchedule = true;
        office[employee].presences = 0;
    }
    
    //função para registrar a presença do funcionário
    function recordPresence() public {
        if (msg.sender == manager || office[msg.sender].onWorkSchedule == false) return;
        office[msg.sender].presences += 1;
    }
}

Linguagem de preferência: Ruby
Biblioteca pra trabalhar com Smart Contracts: ethereum.rb
Github: https://github.com/EthWorks/ethereum.rb
