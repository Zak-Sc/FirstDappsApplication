
var MultiNumberBettingV2=artifacts.require('./MultiNumberBettingV2.sol');
contract('Calculator_V2_test', function(accounts) {
  it("should assert true", ()=> {
    var instance ;
    return  MultiNumberBettingV2.deployed().then((CalculatorV2)=>{
      instance=CalculatorV2; 
    }).then(()=>{
      instance.guess(10,"test");
      return instance.getLastWinner.call();
    }).then((results)=>{
      assert.equal(results.valueOf(),"tes");
    });
  });
});

