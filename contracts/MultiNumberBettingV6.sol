pragma solidity ^0.4.22;
 import "./MultiNumberBettingAbstractV2.sol";

contract MultiNumberBettingV6 is MultiNumberBettingAbstractV2   {
  address owner;
  uint8[] array;
  uint loserCount;
  uint winnerCount;
  address winner;
  struct Winner {
    address winnerAddress;
    uint8 num;
    string guess;
    uint guessedAt;
    uint receivedEther;
    }
    modifier OwnerOnly {require(msg.sender == owner); _;}
  mapping(address => Winner) ListWinner;
  constructor(uint8 number1,uint8 number2,uint8 number3) public {
    array=[number1,number2,number3];
    owner = msg.sender;
  }
  function guess(uint8 num,string nameguess )public payable returns (bool)
  {
    require(address(this).balance > 3*MAX_BET);

    if(msg.value< MIN_BET || msg.value> MAX_BET ) revert();
    for(uint8 i;i<array.length;i++)
    {
      if(array[i]==num)
      {
        winner=msg.sender;
        ListWinner[msg.sender]= Winner(msg.sender,num,nameguess,now,uint(msg.value));
        msg.sender.transfer(2*msg.value);
        winnerCount++;
        return true;

      }
     
    }
      loserCount++;
      return false;
  }
  function totalGuesses() public view  returns(uint){
    return loserCount+winnerCount;
  }
  function getLastWinnerInfo() public  returns (address adr ,uint8 nm ,string gs,uint at,uint re) {
   // Winner memory wn=ListWinner[winner];
    //return (wn.winnerAddress,wn.num,wn.guess,wn.guessedAt);   
    return (ListWinner[winner].winnerAddress,ListWinner[winner].num,ListWinner[winner].guess,ListWinner[winner].guessedAt,ListWinner[winner].receivedEther);
  }
  function checkWinning(address adr) public returns(bool)
  {
    if (ListWinner[adr].winnerAddress == 0x0 )
    {
      return false;
    }
    else
    return true;
  }
   function ownerWithdraw(uint amt) public OwnerOnly{
    require(amt <  3*MAX_BET);
    msg.sender.transfer(amt);
   }
   function() public payable{}
}
