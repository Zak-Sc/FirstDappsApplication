pragma solidity ^0.4.22;


contract MappingExample {
   enum continent {Africa,Europe,Asia,America}
  mapping (string => string) capitals;
  struct countries {
    bytes32 name;
    string capital;
    continent cont;
  }
  address owner;
  modifier onlyOwner {
    require(msg.sender== owner);_;
  }
  countries[] AffricanCountries;
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
  function getContinent(uint8 arg) public onlyOwner returns(string){
    if(arg==uint8(continent.Africa)) return "africa";
    else if(arg==uint8(continent.Europe)) return "Europe";
    else if(arg==uint8(continent.Asia)) return "Asia";
    else if(arg==uint8(continent.America)) return "America";
    else return "does not exist";


  }
  function addAfricanContinent(bytes32 nm,string cpt,uint8 ct) public onlyOwner returns (bool){
    if (ct !=uint8(continent.Africa)) return false;
    AffricanCountries.push(countries(nm,cpt,continent(ct))); return true;

  }
  function getAfricanContinentByName(bytes32 name) public onlyOwner returns(bytes32,string,uint8){
    for(uint8 i=0;i<AffricanCountries.length;i++)
    {
      if(AffricanCountries[i].name==name) {
      return(AffricanCountries[i].name,AffricanCountries[i].capital,uint8(AffricanCountries[i].cont));
      }
    }
  }
}
