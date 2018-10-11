
var MultiNumberBettingV1=artifacts.require('./MultiNumberBettingV1.sol');
contract('Calculator_V2_test', function(accounts) {
  it("should assert true", ()=> {
    var instance ;
    return  MultiNumberBettingV1.deployed().then((CalculatorV2)=>{
      instance=CalculatorV2; 
     // alert(instance);  
    }).then(()=>{
      //console.log("cc");
      //instance.guess(3);
      return instance.guess.call(3);
    }).then((results)=>{
      //console.log("cc");
      assert.equal(results.valueOf(),false);    
    });
  });
});


//assert.isTrue(true);done();