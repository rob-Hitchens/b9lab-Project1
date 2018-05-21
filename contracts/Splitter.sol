pragma solidity ^0.4.4;

import './Destroyable.sol';

contract Splitter is Destroyable {


    address private ownerAddress;
    address private secondAddress;
    address private thirdAddress;
    uint private amount;
constructor(address address1,address address2, address address3)  {
require(address1 != 0);
require(address2 != 0);
require(address3 != 0);

ownerAddress = address1;
secondAddress = address2;
thirdAddress = address3;
}

function  getContractBalance () public view returns (uint) {
return this.balance;
}

function getPersonBalance(address someAddr)public view returns (uint) {
return someAddr.balance;
}

function getFirstAddrBal()public returns (uint){
return ownerAddress.balance;
}
function getSecondAddrBal()public returns (uint){
return secondAddress.balance;
}
function getThirdAddrBal()public returns (uint){
return thirdAddress.balance;
}


function getFirstAddr()public returns (address){
return ownerAddress;
}
function getSecondAddr()public returns (address){
return secondAddress;
}
function getThirdAddr()public returns (address){
return thirdAddress;
}
event SendMoneyToFirstAcc(uint);
function sendMoneyToFirstAcc(uint money)private returns (bool){
ownerAddress.send(money);
SendMoneyToFirstAcc(money);
return true;
}
event SendMoneyToSecondAcc(uint);
function sendMoneyToSecAcc(uint money)private returns (bool){
secondAddress.send(money);
SendMoneyToSecondAcc(money);
return true;
}
event SendMoneyToThirdAcc(uint);
function sendMoneyToThirdAcc(uint money)private returns (bool){
thirdAddress.send(money);
SendMoneyToThirdAcc(money);
return true;
}



function payMoney () public payable returns (bool) {
require(msg.value > 0); //avoid 0 value transfers
require(msg.sender.balance >= msg.value); //avoid overspending
return true;
}
event Sum(uint);
function divideMoney(uint tempSum) public payable returns (uint) {
Sum(tempSum);
amount = tempSum / 2 ;
return amount;
}
event LogCurrentAmount(uint amount);

function split () public   returns (bool) {
divideMoney(this.balance);
LogCurrentAmount(amount);
if (msg.sender == ownerAddress){
sendMoneyToSecAcc(amount);
sendMoneyToThirdAcc(amount);
}else if (msg.sender == secondAddress){
sendMoneyToFirstAcc(amount);
sendMoneyToThirdAcc(amount);
}else {
sendMoneyToFirstAcc(amount);
sendMoneyToSecAcc(amount);
}
return true;
}
}