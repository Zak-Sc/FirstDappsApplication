pragma solidity ^0.4.22;


contract MappingExample {
  mapping (string => string) capitals;
  address owner;
  modifier onlyOwner {
    require(msg.sender== owner);_;
  }
  constructor()  {
    owner=msg.sender;
  }
  function addCapitals  (string country,string capital) public onlyOwner
  {
    capitals[country]=capital;
  }
  function removeCapitals (string country) public onlyOwner{
    delete (capitals[country]);
  }
  function getCapitals(string country) public onlyOwner returns(string capital){
    capital= capitals[country];
  }
}
