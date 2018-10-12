pragma solidity ^0.4.22;


contract MultiNumberBettingV2 {
  uint8[] array;
  uint loserCount;
  uint winnerCount;
  string lastWinnerName;
  constructor(uint8 number1,uint8 number2,uint8 number3) public {
    array=[number1,number2,number3];
  }
  function guess(uint8 num,string nameguess )public  returns (bool)
  {
    for(uint8 i;i<array.length;i++)
    {
      if(array[i]==num)
      {
        winnerCount++;
        lastWinnerName=nameguess;
        return true;

      }
     
    }
      loserCount++;
      return false;
  }
  function totalGuesses() public view  returns(uint){
    return loserCount+winnerCount;
  }
  function getLastWinner() public view returns(string){
    bytes  memory nameBytes=bytes(lastWinnerName);
    if(nameBytes.length ==0){
    return "***";
    }
    else{
    string memory s=new string(3);
    bytes memory bytess=bytes(s);

    for(uint i=0;(i<3) && (i<nameBytes.length);i++)
    {
         bytess[i]=nameBytes[i];
    }
    return string(bytess);
    }
    
  }
}
