pragma solidity ^0.4.22;


contract ArrayTest {

  byte[3] staticArrayStorage=[byte(1),2,255];
  byte[] dynamic_Array=new byte[](4);
  bytes aray;
  int32[] dynamicArray;
  bool[] boolArray;
  string data=string(aray);
  string name;
  constructor(string names) public{
     name=names;
  }
  function getValue() public view returns(byte[3] value){
     value= staticArrayStorage;
    
  }
  function getName() public view returns(string) {
    string storage message=name;
    return message;
  }
  function getLastWinner() returns(string){
    bytes  ArrayName;
    bytes memory nameBytes=bytes(name);
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
