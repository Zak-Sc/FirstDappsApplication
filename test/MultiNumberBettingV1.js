
var MultiNumberBettingV1=artifacts.require('./MultiNumberBettingV1.sol');
contract('Calculator_V2_test', function(accounts) {
  it("should assert true", ()=> {
    var instance ;
    return  MultiNumberBettingV1.deployed().then((CalculatorV2)=>{
      instance=CalculatorV2; 
    }).then(()=>{
      return instance.guess.call(3);
    }).then((results)=>{
      assert.equal(results.valueOf(),false);    
    });
  });
});

