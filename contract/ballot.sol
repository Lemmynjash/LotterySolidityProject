pragma solidity >=0.7.0 <0.9.0;


contract Lottery{

    address public manager;
    address [] public players;

    constructor() public{
        manager=msg.sender;
    }

    function enter() public payable{
        require(msg.value>.01 ether);
        //sort of append
        players.push(msg.sender);

    }

    //returns uint
    function random() private view returns(uint){
        //sha3();
       return uint(keccak256(abi.encodePacked(block.difficulty,block.timestamp,players)));

    }

    function pickWinner() public{
        uint theRandomPlayerWhoJustWonLotteryindex= random()%players.length;

        payable(players[theRandomPlayerWhoJustWonLotteryindex]).transfer(address(this).balance);

    }
}