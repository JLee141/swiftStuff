//: Playground - noun: a place where people can play

import UIKit
import Darwin

var number: Int = 1
var anotherNumber = 2

number = 3
print(number)
number = number + anotherNumber
print(number)
var name: String = "Jordan"
name.count

if name == "Jordan"{
    print("this is a true statement")
}

let label = "This is equal "
let width = 100

let widthLabel = label + String(width)

var myDictionary = [Int:String]()


let testScores = [60,70,89,90,45]

let amountOfScores = testScores.count

/*
for amountOfScores in testScores{
    if testScores < 60 {
        print("Testscore" + String[testScores])
    }
}
*/
let thisIsMyString = "This is a string of text that I am putting into my function"

var num: Int = 2

if num < 3{
    print("This is not true")
}else {
    print("This is true")
}

print("implementation of dark mode had to be added in xCode build 10")

var age: Int = 4

if (age < 5) {
    print("Go to preschool")
} else if age == 5{
    print("Go to kindergarden")
} else if(age > 5) && (age <= 18){
    let grade: Int = age - 5
    print("Go to grade \(grade)")
} else{
    print("Go to college")
}

switch age {
case 5:
    print("The age is 5")
default:
    print("The age is not 5")
}

print("This is another println statement")
print("I'm learning to create functions in swift")
