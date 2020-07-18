import UIKit
//DataType Practice

var playerName = "Jordan" //this type is declared by the variable that it is put in place, so "Jordan" delcares the type of this varaible and since "Jordan" is a string, this becomes a string.

var bonusScore: Int //This type is a type that is specifically declared so that it can be used later with that type. Int is delcared but nothing is assigned to this variable. Not really necesary but you can do it.

var extraForNoReason: String = "Extra for no reason lol" //This works as well but no need to preform this since the declared vairable is enough to make this variable a string.

var aNameOfItem: String = "This is another name that didn't need to be delcared by the type. Because this was already delcared again."

let anotherPlayerName: String

func simpleFunction() -> String{
    //Make a new vairable
    let aString = "This is a string variable"
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

//function statements
var coffeeCup = true

func refillCoffee(){
    if coffeeCup == true{
        print("Coffee cup is already full!")
    }
    else{
        coffeeCup = true
        print("*Pours Coffee*")
    }
}

func drinkCoffee(){
    if coffeeCup == false{
        print("You need more coffee!")
    }
    else{
        coffeeCup = false
        print("*Sluuurrrrrp*")
    }
}

func coffeeStatus()->String {
    if coffeeCup == true{
        return "Coffee is full!"
    }
    else{
        return "Coffee is empty! Time to fill up :)"
    }
}
refillCoffee()
drinkCoffee()
print(coffeeStatus())

var fName: String = "Jordan"
var lName = "Lee"

print("My full name is \(fName) \(lName) and I love technology!")

//Defining a class

class Emoji {
    //properties
    var icon: String
    var name: String
    var description: String
    
    func getDescription() -> String {
        return "\(description)"
    }
    func getIcon() -> String {
        return "\(icon)"
    }
    init() {
        self.icon = ""
        self.name = ""
        self.description = ""
    }
}

var happyEmoji = Emoji()
happyEmoji.icon = "😀"
happyEmoji.description = "This emoji is happy!"
happyEmoji.getDescription()
happyEmoji.name = "Happy"
happyEmoji.getIcon()

struct Appliance {
    //properties
    var manufacture: String
    //I don't have to set an initilizer...
}

var microwave = Appliance(manufacture: "Dyson")

//value(Structs) vs. reference(Class)


//strings
let album = "Decks and drums and rock and roll"
let scriptio = "Neque porro quiquam est qui dolorem ipsum quia dolor sit amet"
let phrase = "Love is now here"

//You can create an extension of the class string which will allow you to add functions to that class like in this example removeSpaces
extension String {
    func removeSpaces() -> String {
        let filteredCharacters = self.filter { $0 != " "}
        return String(filteredCharacters)
    }
}
scriptio.removeSpaces()

//Adding computed Properties
class Player {
    var name: String
    var livesRemaining: Int
    var enemiesDestroyed: Int
    var penalty: Int
    var bonus: Int
    
    // computed property (Getters and setters!)
    var score: Int{
        get {
         return (enemiesDestroyed * 1000) + bonus + (livesRemaining * 5000) - penalty
        }
    }
    
    init(name: String){
        self.name = name
        self.livesRemaining = 3
        self.enemiesDestroyed = 0
        self.penalty = 0
        self.bonus = 0
    }
}
//Creating Player
let newPlayer = Player(name: "Jordan")

// as the game progresses, values change...
newPlayer.enemiesDestroyed = 326
newPlayer.penalty = 872
newPlayer.bonus = 25000

print("The final score is: \(newPlayer.score)")

class Intake {
    var amount: Int
    enum LiquidType{
        case water, coffee, soda
    }
    init(){
        amount = 0
    }
}

struct Liquid{
    
}
