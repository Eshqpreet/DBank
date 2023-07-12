import Debug "mo:base/Debug";
import Time "mo:base/Time";
import Float "mo:base/Float";

actor DBank {
  stable var currentValue : Float = 300;//Adding stable infront of var we get persistance 
  // currentValue := 300;

 stable var startTime = Time.now();
//  startTime := Time.now();
  Debug.print(debug_show(startTime));

  let id = 454545;

  // Debug.print(debug_show(id));
  // Debug.print(debug_show(currentValue));

  public func topUp(amount : Float) {
    currentValue += amount;
    Debug.print(debug_show (currentValue));
  };

  public func withDraw(amount : Float) {
    let tempValue : Float  =currentValue - amount;
    if (tempValue >= 0) {
      currentValue -= amount;
      Debug.print(debug_show (currentValue));
    }
    else{
      Debug.print("Current Amount is less then the Amount WithDrawling!!");
    }
  };

  public query func checkBalance():async Float{
    return currentValue;
  };

  public func compound(){
    let currentTime = Time.now();
    let timeElapsedNS = currentTime - startTime;
    let timeElapsedS = timeElapsedNS/(10**9);
    currentValue := currentValue * (1.01 ** Float.fromInt(timeElapsedS));
    startTime := currentTime;
  };
  // topUp();
};
