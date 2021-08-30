import UIKit

/**
 协议规定了用来实现某一特定功能所必需的方法和属性。

 任意能够满足协议要求的类型被称为遵循(conform)这个协议。

 类，结构体或枚举类型都可以遵循协议，并提供具体实现来完成协议定义的方法和功能。
 */

// MARK:-语法格式

protocol SomeProtocol {
    // 协议内容
}

protocol FirstProtocol {
    // 协议内容
}

protocol AnotherProtocol {
    // 协议内容
}

//遵循多个协议之间使用逗号 隔开
struct SomeStructure: FirstProtocol, AnotherProtocol {
    // 结构体内容
}

//类有父类, 需要些在前面, 也使用逗号隔开
class SomeClass: NSObject, FirstProtocol, AnotherProtocol {
    // 类的内容
}

// MARK:-对属性的规定
/*
 协议用于指定特定的实例属性或类属性，而不用指定是存储型属性或计算型属性。此外还必须指明是只读的还是可读可写的。

 协议中的通常用var来声明变量属性，在类型声明后加上{ set get }来表示属性是可读可写的，只读属性则用{ get }来表示。

 */
protocol classProperty {
    
    var marks: Int { get set } //可读可写
    var result: Bool { get }   //可读
    
    func attendance() -> String
    func markssecured() -> String
}

protocol classPropertySub: classProperty {
    
    var present: Bool { get set }
    var subject: String { get set }
    var stname: String { get set }
    
}

class classProtocol: classPropertySub {
    var marks = 96
    let result = true
    var present = false
    var subject = "Swift 协议"
    var stname = "Protocols"
    
    func attendance() -> String {
        return "The \(stname) has secured 99% attendance"
    }
    
    func markssecured() -> String {
        return "\(stname) has scored \(marks)"
    }
}

let studdet = classProtocol()
studdet.stname = "Swift"
studdet.marks = 98
studdet.markssecured()


// MARK:- 对mutating方法的规定
protocol daysofaweek {
    mutating func show()
}

enum days: daysofaweek {
    case sun, mon
    
    mutating func show() {
        switch self {
        case .sun:
            self = .sun
        case .mon:
            self = .mon
        default:
            print("NO Such Day")
        }
    }
}

var ins = days.sun
ins.show()
ins = days.mon
ins.show()


// MARK:-对构造器的规定, 如下书写,  convenience 对类增加init方法
protocol InitProtocol {
    init(someParameter: Int)
}

class IntClass: InitProtocol {
    required init(someParameter: Int) {
        // 构造器实现
    }
    
}

class SubIntClass: IntClass {
    var num = 0;
    
    required init(someParameter: Int) {
        self.num = someParameter
        super.init(someParameter: someParameter)
    }
}

var subInt = SubIntClass.init(someParameter: 5)
subInt.num


//另外一种
protocol tcpprotocol {
    init(no1: Int)
}

class mainClass {
    var no1: Int // 局部变量
    init(no1: Int) {
        self.no1 = no1 // 初始化
    }
}
class subClass: mainClass, tcpprotocol {
    var no2: Int
    init(no1: Int, no2 : Int) {
        self.no2 = no2
        super.init(no1:no1)
    }
    // 因为遵循协议，需要加上"required"; 因为继承自父类，需要加上"override"
    required override convenience init(no1: Int)  {
        self.init(no1:no1, no2:0)
    }
}
let res = mainClass(no1: 20)
let show = subClass(no1: 30, no2: 50)
let show1 = subClass.init(no1: 20)
show1.no1
show1.no2


// MARK:-协议类型
/**
 尽管协议本身并不实现任何功能，但是协议可以被当做类型来使用。

 协议可以像其他普通类型一样使用，使用场景:

 作为函数、方法或构造器中的参数类型或返回值类型
 作为常量、变量或属性的类型
 作为数组、字典或其他容器中的元素类型
 
 
 associatedtype
 1、关联类型作为协议实现泛型的一种方式，可以在协议中预先定义一个占位符，实现协议的时候再确定这个占位符具体的类型。
 */
//protocol Generator {
//    associatedtype members
//    func next() -> members?
//}

var items = ["1",20,"3"].makeIterator()
while let x = items.next() {
    print(x)
}
//
//for lists in [1,2,3].map( {i in i*5}) {
//    print(lists)
//}
//
//print([100,200,300])
//print([1,2,3].map({i in i*10}))


// MARK:-在扩展中添加协议成员
protocol AgeClasificationProtocol {
   var age: Int { get }
   func agetype() -> String
}

class Person {
    let firstname: String
    let lastname: String
    var age: Int
    init(firstname: String, lastname: String) {
        self.firstname = firstname
        self.lastname = lastname
        self.age = 10
    }
}

extension Person : AgeClasificationProtocol {
    func fullname() -> String {
        var c: String
        c = firstname + " " + lastname
        return c
    }
    
    func agetype() -> String {
        switch age {
        case 0...2:
            return "Baby"
        case 2...12:
            return "Child"
        case 13...19:
            return "Teenager"
        case let x where x > 65:
            return "Elderly"
        default:
            return "Normal"
        }
    }
}

var cls = Person.init(firstname: "lll", lastname: "rrr")
cls.age = 66
cls.agetype()


// MARK:-协议的继承
protocol InheritingProtocol: SomeProtocol, AnotherProtocol {
    // 协议定义
}

protocol ClassaProtocol {
    var no1: Int {set get}
    func calc(sum: Int)
}

protocol ResultProtocol {
    func print(target: ClassaProtocol)
}

class Student2: ResultProtocol {
    func print(target: ClassaProtocol) {
        target.calc(sum: 1)
    }
}

class Classb: ResultProtocol {
    func print(target: ClassaProtocol) {
        target.calc(sum: 5)
    }
}


class Student: ClassaProtocol {
    var no1 = 0
    func calc(sum: Int) {
        self.no1 -= sum
    }
}

class Player {
    var stmark: ResultProtocol!
    init(stmark: ResultProtocol) {
        self.stmark = stmark
    }
    
    func print(_ target: ClassaProtocol) {
        stmark.print(target: target)
    }
}

var stu = Student2.init()

var marks = Player.init(stmark: stu)
var marksec = Student.init()

marks.print(marksec)
marksec.no1
marks.print(marksec)
marksec.no1
marks.print(marksec)
marksec.no1
marks.stmark = Classb.init()
marks.print(marksec)
marksec.no1
marks.print(marksec)
marksec.no1
marks.print(marksec)
marksec.no1


// MARK:-类专属协议
/**
 你可以在协议的继承列表中,通过添加class关键字,限制协议只能适配到类（class）类型。

 该class关键字必须是第一个出现在协议的继承列表中，其后，才是其他继承协议。格式如下：
 */
protocol SomeClassOnlyProtocol: class {
    // 协议定义
}


// MARK:-协议合成, 支持合成多个协议
protocol Stname {
    var name: String { get }
}

protocol Stage {
    var age: Int { get }
}

struct PersonStru: Stname, Stage {
    var name: String
    var age: Int
}

struct abc {
   
}

func show(celebrator: Stname & Stage) {
    print("\(celebrator.name) is \(celebrator.age) years old")
}

let stuName = PersonStru.init(name: "李白", age: 18)
show(celebrator: stuName)


// MARK:-检验协议的一致性
/**
 你可以使用is和as操作符来检查是否遵循某一协议或强制转化为某一类型。

 is操作符用来检查实例是否遵循了某个协议。
 as?返回一个可选值，当实例遵循协议时，返回该协议类型;否则返回nil。
 as用以强制向下转型，如果强转失败，会引起运行时错误。
 */

protocol HasArea {
    var area: Double { get }
}

// 定义了Circle类，都遵循了HasArea协议
class Circle: HasArea {
    let pi = 3.1415927
    var radius: Double
    var area: Double { return pi * radius * radius }
    init(radius: Double) { self.radius = radius }
}

// 定义了Country类，都遵循了HasArea协议
class Country: HasArea {
    var area: Double
    init(area: Double) { self.area = area }
}

// Animal是一个没有实现HasArea协议的类
class Animal {
    var legs: Int
    init(legs: Int) { self.legs = legs }
}

let objects: [AnyObject] = [
    Circle(radius: 2.0),
    Country(area: 243_610),
    Animal(legs: 4)
]

for item in objects {
    if let obj = item as? HasArea {
        print("\(obj.area)")
    } else {
        print("没有面积")
    }
}
