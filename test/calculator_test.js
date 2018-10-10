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
    it(" ((Initial_Value + 10) - 5)", ()=> {
      var calculator_instance;
      return Calculator.deployed().then((instance)=>{
        calculator_instance=instance;
        return calculator_instance.AddToStateNumber(10);
      }).then(()=>{
        return calculator_instance.getNumber.call();
      }).then((results)=>{
        assert.equal(results.valueOf(),110,"Congratulations");
        return calculator_instance.substractFromStateNumber(5);   
      }).then(()=>{
        return calculator_instance.getNumber.call();
      }).then((resultas)=>{
        assert.equal(resultas.valueOf(),105,"Congratulations");
      });
    });
      it(" ((Initial_Value * 100) / 2)", ()=> {
        var calculator_instance;
        return Calculator.deployed().then((instance)=>{
          calculator_instance=instance;
          return calculator_instance.multiplyWithNumber(100);   
        }).then(()=>{
          return calculator_instance.getNumber.call();
        }).then((resultas)=>{
          assert.equal(resultas.valueOf(),10500,"Congratulations");
          return calculator_instance.divideNumberBy(2); 
        }).then(()=>{
          return calculator_instance.getNumber.call();
        }).then((resultas)=>{
          assert.equal(resultas.valueOf(),5250,"Congratulations");
        });
    });
  });
