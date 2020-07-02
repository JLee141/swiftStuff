import UIKit
//DataType Practice

var playerName = "Jordan" //this type is declared by the variable that it is put in place, so "Jordan" delcares the type of this varaible and since "Jordan" is a string, this becomes a string.

var bonusScore: Int //This type is a type that is specifically declared so that it can be used later with that type. Int is delcared but nothing is assigned to this variable. Not really necesary but you can do it.

var extraForNoReason: String = "Extra for no reason lol" //This works as well but no need to preform this since the declared vairable is enough to make this variable a string.

var aNameOfItem: String = "This is another name that didn't need to be delcared by the type. Because this was already delcared again."

let anotherPlayerName: String

func simpleFunction() -> String{
    //Make a new vairable
    var aString = "This is a string variable"
    return aString
}

func askForName() -> String {
    print("What is your name?")
    let firstName = "Jordan"
    return firstName
}

let a = 5.0
let b = 2.0

let myResult = a / b
type(of: myResult)
//Going to convert these doubles to int's

let c = Int(a)
print(c)
var myKey = true

func printIfTrue(_ aSwitch:Bool){
    if(aSwitch){
        print("This is true!")
    }
    else
    {
        print("Not so true :/")
    }
}

printIfTrue(myKey)
myKey = false
printIfTrue(myKey)
