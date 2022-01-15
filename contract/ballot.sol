pragma solidity >=0.7.0 <0.9.0;


contract Lottery{

    address public manager;
    address [] public players;

    constructor() public{
        manager=msg.sender;
    }

    function enter() public payable{
        require(msg.value>.01 ether);

        players.push(msg.sender);
    }
}