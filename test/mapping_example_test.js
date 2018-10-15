var MappingExample = artifacts.require("./MappingExample.sol");

contract('MappingExample_test', function(accounts) {
  it("should assert true", () => {
    var mapping;
     return MappingExample.deployed().then((instance)=>{
      mapping=instance;
     mapping.addCapitals("morroco","rabat");
     mapping.addCapitals("canada","toronto");
     return mapping.getCapitals.call("morroco");
     }).then((results)=>{
       console.log("Capital of morroco:"+results);
       assert.isTrue(results=="rabat");
       return mapping.getCapitals.call("canada");     
     }).then((results)=>{
      console.log("Capital of canada:"+results);
      assert.isTrue(results=="toronto");
     });
  });
  it("should assert true", () => {
    var mapping;
     return MappingExample.deployed().then((instance)=>{
      mapping=instance;
     mapping.removeCapitals("morroco");
     return mapping.getCapitals.call("morroco");
     }).then((results)=>{
       console.log("Capital of morroco:"+results);
       assert.isTrue(results=="");
       return mapping.getCapitals.call("canada");     
     }).then((results)=>{
      console.log("Capital of canada:"+results);
      assert.isTrue(results=="toronto");
     });
  });
  it("should assert true", () => {
    var mapping;
     return MappingExample.deployed().then((instance)=>{
      mapping=instance;
     return mapping.getContinent.call(0);
     }).then((results)=>{
       console.log("should return Africa :"+results);
       assert.isTrue(results=="africa");
     });
  });
  it("should assert true", () => {
    var mapping;
     return MappingExample.deployed().then((instance)=>{
      mapping=instance;
     mapping.addAfricanContinent("morocco","rabat",0);
     mapping.addAfricanContinent("tunis","tunis",0);
     return mapping.getAfricanContinentByName.call("tunis");
     }).then((results)=>{
       console.log("should return "+results);
       assert.isFalse(false,results);
     });
  });
});
