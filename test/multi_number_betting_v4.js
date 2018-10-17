
var MultiNumberBettingV4=artifacts.require('./MultiNumberBettingV4.sol');
contract('Calculator_V3_test', function(accounts) {
  it("should assert true", ()=> {
    var instance ;
    return  MultiNumberBettingV4.deployed().then((CalculatorV4)=>{
      instance=CalculatorV4; 
    }).then(()=>{
      instance.guess(15,"z3bil");
      return instance.getLastWinnerInfo.call();
    }).then((results)=>{
      //console.log("addres "+results[0]+"numero"+results[1]+"name:"+results[2]+"time"+results[3]);
      assert.equal(results[2].valueOf(),"z3bil");
    });
  });
});

