pragma solidity ^0.4.22;


contract MultiNumberBettingV4 {
  uint8[] array;
  uint loserCount;
  uint winnerCount;
  address winner;
  struct Winner {
    address winnerAddress;
    uint8 num;
    string guess;
    uint guessedAt;}
  mapping(address => Winner) ListWinner;
  constructor(uint8 number1,uint8 number2,uint8 number3) public {
    array=[number1,number2,number3];
  }
  function guess(uint8 num,string nameguess )public  returns (bool)
  {
    require(num<10);
    for(uint8 i;i<array.length;i++)
    {
      if(array[i]==num)
      {
        winner=msg.sender;
        ListWinner[msg.sender]= Winner(msg.sender,num,nameguess,now);
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
  function getLastWinnerInfo() public  returns (address winnerAddress, uint8 numeroGuessed, string nameguess, uint guessedAt) {
    Winner memory wn=ListWinner[winner];
    return (wn.winnerAddress,wn.num,wn.guess,wn.guessedAt);   
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

}
