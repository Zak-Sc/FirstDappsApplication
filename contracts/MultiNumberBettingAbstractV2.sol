pragma solidity ^0.4.22;


contract MultiNumberBettingAbstractV2 {
  uint public constant MAX_BET=1 ether;
  uint public constant MIN_BET=5 ether;
  function guess(uint8 num,string nameguess )public payable  returns (bool);
  function totalGuesses() public view  returns(uint);
 function getLastWinnerInfo() public  returns (address adr ,uint8 nm ,string gs,uint at,uint re);
  function checkWinning(address adr) public returns(bool);
  function ownerWithdraw(uint amt) public;

}
