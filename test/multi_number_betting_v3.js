
var MultiNumberBettingV3=artifacts.require('./MultiNumberBettingV3.sol');
contract('Calculator_V3_test', function(accounts) {
  it("should assert true", ()=> {
    var instance ;
    return  MultiNumberBettingV3.deployed().then((CalculatorV2)=>{
      instance=CalculatorV2; 
    }).then(()=>{
      return instance.guess.call(15,"test");
     // return instance.Ethdays.call();
    }).then((results)=>{
      console.log(results);
      assert.isTrue(results,"true");
    });
  });
});

