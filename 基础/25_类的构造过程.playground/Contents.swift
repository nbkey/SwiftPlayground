import UIKit



// MARK:-类的继承和构造过程,  指定构造器(必须)    便利构造器(辅助)


// MARK:-指定构造器
class mainClass {
    var no1 : Int // 局部存储变量
    init(no1 : Int) {
        self.no1 = no1 // 初始化
    }
}
class subClass : mainClass {
    var no2 : Int // 新的子类存储变量
    init(no1 : Int, no2 : Int) {
        self.no2 = no2 // 初始化
        super.init(no1:no1) // 初始化超类
    }
}
let res = mainClass(no1: 10)
let res2 = subClass(no1: 10, no2: 20)



// MARK:-便利构造器,  convenience
class mainClassBl {
    var no1 : Int // 局部存储变量
    init(no1 : Int) {
        self.no1 = no1 // 初始化
    }
}

class subClassBl : mainClassBl {
    var no2 : Int
    init(no1 : Int, no2 : Int) {
        self.no2 = no2
        super.init(no1:no1)
    }
    // 便利方法只需要一个参数
    override convenience init(no1: Int)  {
        self.init(no1:no1, no2:0)
    }
}

let resbl = mainClassBl(no1: 20)
let resbl2 = subClassBl(no1: 30, no2: 50)
let resbl3 = subClassBl.init(no1: 1)


// MARK:-构造器的继承和重载, Swift中的子类不会默认继承父类的构造器。父类的构造器仅在确定和安全的情况下被继承。
class SuperClassA {
    var corners = 4
    var description: String {
        return "\(corners) 边"
    }
}
let rectangleA = SuperClassA()
print("矩形: \(rectangleA.description)")

class SubClassA: SuperClassA {
    override init() {  //重载构造器
        super.init()
        corners = 5
    }
}

let subClassA = SubClassA()
print("五角型: \(subClassA.description)")


// MARK:-指定构造器和便利构造器实例
class ConstructorClass {
    var name: String
    
    init(name: String) {
        self.name = name
    }
    
    convenience init() {
        self.init(name: "[匿名]")
    }
}
let cls = ConstructorClass(name: "Runoob")
cls.name

//遍历构造器
let cls1 = ConstructorClass()
cls1.name


class SubConstructorClass: ConstructorClass {
    var count: Int
    init(name: String, count: Int) {
        self.count = count
        super.init(name: name)
    }
    
    override convenience init(name: String) {
        self.init(name: name, count: 1)
    }
}

let sub = SubConstructorClass(name: "Runoob")
print("MainClass 名字为: \(sub.name)")

let sub2 = SubConstructorClass(name: "Runoob", count: 3)
print("count 变量: \(sub2.count)")


// MARK:-类的可失败构造器
struct Animal {
    let species: String
    init?(species: String) {
        if species.isEmpty { return nil }
        self.species = species
    }
}
let someCreature = Animal(species: "长颈鹿")
someCreature?.species
let someCreature1 = Animal(species: "")
someCreature1?.species


// MARK:-枚举类型的可失败构造器
enum TemperatureUnit {
    // 开尔文，摄氏，华氏
    case Kelvin, Celsius, Fahrenheit
    init?(symbol: Character) {
        switch symbol {
        case "K":
            self = .Kelvin
        case "C":
            self = .Celsius
        case "F":
            self = .Fahrenheit
        default:
            return nil
        }
    }
}

let temperatureUnit = TemperatureUnit.init(symbol: "K")
if temperatureUnit != nil {
    temperatureUnit
}

let temperatureUnit1 = TemperatureUnit.init(symbol: "A")
if temperatureUnit1 != nil {
    temperatureUnit1
}


// MARK:-类的可失败构造器
/*
 值类型（如结构体或枚举类型）的可失败构造器，对何时何地触发构造失败这个行为没有任何的限制。

 但是，类的可失败构造器只能在所有的类属性被初始化后和所有类之间的构造器之间的代理调用发生完后触发失败行为。
 */
class StudRecord {
    let studname: String!
    let count: Int?
    init?(studname: String) {
        if studname.isEmpty { return nil }
        self.studname = studname
        self.count = nil
    }
}
if let stname = StudRecord(studname: "失败构造器") {
    stname.studname
}


// MARK:-覆盖一个可失败构造器
/*
 非可失败的构造器可以覆盖 可失败的构造器
 子类的非可失败构造器覆盖一个基类的可失败构造器
 
 但是非可失败的构造器永远也不能代理调用一个可失败构造器。 非可失败不可调用可失败构造器
 */

class Planet {
    var name: String
    
    init(name: String) {
        self.name = name
    }
    convenience init?() {
        self.init(name: "[No Planets]")
    }
}

class planets: Planet {
    var count: Int
    
    init(name: String, count: Int) {
        self.count = count
        super.init(name: name)
    }
    
    override convenience init(name: String) {
        self.init(name: name, count: 1)
    }
}

let planets1 = planets()
print("没有这个名字的行星: \(String(describing: planets1?.name))")


// MARK:-可失败构造器 init!
struct StudRecordNil {
    let stname: String
    
    init!(stname: String) {
        if stname.isEmpty {return nil }
        self.stname = stname
    }
}

let stmark = StudRecordNil(stname: "Runoob")
if let name = stmark {
    print("指定了学生名\(name.stname)")
}

let blankname = StudRecordNil(stname: "")
if blankname == nil {
    print("学生名为空")
}
