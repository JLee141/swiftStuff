import UIKit

var string = "This is a random string "
var anotherString = "and this is combined with another string"
var together = string+anotherString
string = "Strings are immutable"

var a = 20+5
var b = 20-5
var c = 20*5
var d = 20/5
var e = 20%2
var f = (a*b)+(c/d)

func sayHello(){
    print("Hello")
}

sayHello()

func sayHello(_ name:String,_ age:Int) -> String{
    return("Hello \(name)")
}

var stringHello = "This is a string perameter of hello!"
var name = "Jordan"
var myAge = 27
sayHello(name, myAge)

func addFourTo(x:Int)->Int{
    let sum = x+4
    return sum
}
func addFourTo(_ x:Int)->Int{
    let sum = x+4
    return sum
}

var result = addFourTo(x:10)

print(result)

var anotherResult = addFourTo(20)

print(anotherResult)

let myFirstName = "Jordan"
let myLastName = "Lee"

func addNamesTogether(_ firstName:String,_ lastName:String)->String{
    let fullName = firstName+" "+lastName
    return fullName
}

print("Your full name is "+addNamesTogether(myFirstName, myLastName)+"!")



