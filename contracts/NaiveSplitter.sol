pragma solidity ^0.4.4;

contract NaiveSplitter {

  function splitFunds(address recipient1, address recipient2) public payable returns (bool success) {
    recipient1.transfer(msg.value / 2);
    recipient2.transfer(msg.value / 2);
    return true;
  }
}