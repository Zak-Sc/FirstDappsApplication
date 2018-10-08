var Calculator=artifacts.require('./Calculator.sol');


contract('CalculatorTest', function(accounts) {
  it("should return the intial state of the contract =100", ()=> {
    var calculator_instance;
    return Calculator.deployed().then((instance)=>{
      calculator_instance=instance;
      return calculator_instance.getNumber.call();
    }).then((results)=>{
       assert.equal(results.valueOf(),100,"Contract initialized with value 100!!!");
    });
  });
    // Test case#2 Checks if  = 105
    it("should return 105 when call to add/subtract for ((Initial_Value + 10) - 5)", ()=> {
      var calculator_instance;
      return Calculator.deployed().then((instance)=>{
        calculator_instance=instance;
        return calculator_instance.AddToStateNumber(10);
      }).then(()=>{
        return calculator_instance.getNumber.call();
      }).then((results)=>{
        assert.equal(results.valueOf(),110,"Congratulations");
       
      });
         
      });
    });

