
var arrayTest=artifacts.require('./arrayTest.sol');
contract('arrayTest', function(accounts) {
  it("should assert true", ()=> {
    var instance ;
    return  arrayTest.deployed().then((arrayTestV2)=>{
      instance=arrayTestV2; 
    }).then(()=>{
      return instance.getName.call();
    }).then((results)=>{
      //assert.equal(results.valueOf(),false); 
      console.log(results);   
    });
  });
});

