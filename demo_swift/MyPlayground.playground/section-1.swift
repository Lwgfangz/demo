// Playground - noun: a place where people can play

import UIKit

// Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

class AnimalClass:NSObject
{
    func cry()->NSString
    {
        println("Animal cry")
        return "ffff"
    }
    
}
class peopleClass:AnimalClass
{
    override func cry()->NSString
    {
        return "1111"
    }
}



class BBB:NSObject
{
    var a1:NSString?
}

var a = AnimalClass()
var b=4
a.cry()
var b1 = peopleClass()
b1.cry()
a=b1
a.cry()
var bb = BBB()
bb.a1="asdf"


