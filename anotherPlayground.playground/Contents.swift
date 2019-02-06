import UIKit

let label = "The Width of this is "
let width = 14
let aString = "This is a random string"

let labelWidth = label + String(width)
print(labelWidth)

var myFavoriteCompanies = ["Apple","Under Armor","Disney","Adidas","Microsoft",]
var someOtherCompanies = [""]
myFavoriteCompanies[0]
var emptyArray = [String]()
var emptyDictionary = [String:Int]()
let testScores = [65,75,22,100,90]
var averageScore:Int = 0
var totalScore:Int = 0



/*
for scores in testScores {
    print(scores)
    totalScore = totalScore+scores
    //averageScore = averageScore/testScores.capacity
}
averageScore = totalScore/testScores.capacity
print(testScores.capacity)
print(averageScore)
*/

for scores in testScores{
    totalScore = totalScore+scores
    averageScore = totalScore/testScores.capacity
}

let foodItems=["Tomatoes","Buns","Burgers",]
var nickName: String? = nil
let fullName: String = "Jordan Lee"
nickName = "JLee"
var informalGreeting = "Hi"
var optionalString: String? = "Random name"

var optionalName: String? = "John Appleseed"
var greeting = "Hello!"
if let name = optionalName{
    greeting = "Hello, \(name)"
}
//An optional String is used to trigger a literal optional case. For example in this case, if this person has a Nickname use the Nickname but if they don't continue. This declares a variable as a bool and opens up many use cases to use these types of variables in certain statements. I do prefer the shorter version of this which is putting it in the declaration.
var aString: String? = "Hello"
print(optionalString == nil)

//This is for the example that I was declaring above
let myGreeting = "Hello \(nickName ?? fullName)" //In this case this can happen because i'm basically saying that, Hello (if you have a nick name use it, but if not use fullname but in the declaration.

let food = "Burger"

switch food {
case "Chicken sandwich":
    print("We still need to get some toppings")
case "Salad":
    print("We won't get any meat, just fixings")
case "bowl":
    print("We can keep the meat we just won't get any buns")
case "sushi":
    print("We would have to completely flip the script")
    //We can do multiple cases in the same case.
case "burger","Burger":
    print("We would have to get some beef")
default:
    print("We don't have to get anything to eat")
}

//While loops, and the interations can be added through an if statement
var num = 3
while num<100{
    num*=2
    if(num<100){
        print(num)
    }
}

//This function returns a type string
func helloGreet(name:String, day:String) -> String{
    return ("Hello \(name), I hope you enjoy your \(day)")
}
helloGreet(name: "Jordan", day: "Thursday")

func doublePlz(yourNumber: Int)-> Int{
    var totalNumber = yourNumber
    while totalNumber < 100{
        totalNumber*=2
    }
    return totalNumber
}
doublePlz(yourNumber: 10)

print("HelloWorld!")










