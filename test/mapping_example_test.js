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
});
