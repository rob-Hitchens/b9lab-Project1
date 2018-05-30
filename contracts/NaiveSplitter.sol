pragma solidity ^0.4.21; 

contract NaiveSplitter {
    
    mapping(address=>uint) public balances; // this will hold the amount of wei owed to any/all addresses
    
    function splitFunds(address recipient1, address recipient2) public payable returns(bool success) {
        uint half = msg.value / 2;
        balances[recipient1] += half;
        balances[recipient2] += half;
        return true;
    }
    
    function withdrawFunds() public returns(bool success) {
        require(balances[msg.sender] > 0);
        // now withdraw the funds and do the accounting so they can't do it twice
        return true;
    }
}
