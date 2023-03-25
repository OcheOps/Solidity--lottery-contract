pragma solidity ^0.8.0;

contract Lottery {
    // manager is in charge of the contract 
    address public manager;
    // new player in the contract using array[] to unlimit number 
    address[] public players;
    // set minimum amount of ether to participate
    uint public minimumAmount = 0.01 ether;

    constructor() {
        manager = msg.sender;
    }

    // to call the enter function we add them to players
    function enter() public payable {
        // each player is compelled to add a certain ETH to join
        require(msg.value >= minimumAmount, "Not enough ether sent.");
        players.push(msg.sender);
    }

    // creates a random number that will be used to select a winner
    function random() private view returns (uint) {
        return uint(keccak256(abi.encode(block.timestamp, players)));
    }

    // only the manager can pick the winner
    function pickWinner() public restricted {
        // creates an index that is gotten from func random % play.len
        uint index = random() % players.length;
        // pays the winner picked randomly
        payable(players[index]).transfer(address(this).balance);
        // empties the old lottery and starts a new one
        players = new address[](0);
    }

    modifier restricted() {
        require(msg.sender == manager, "Only the manager can perform this action.");
        _;
    }
    
    function getPlayers() public view returns (address[] memory) {
        return players;
    }
    
    function setMinimumAmount(uint _minimumAmount) public restricted {
        minimumAmount = _minimumAmount;
    }
    
    function getBalance() public view returns (uint) {
        return address(this).balance;
    }
}
