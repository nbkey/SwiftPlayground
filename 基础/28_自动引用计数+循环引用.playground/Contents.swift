import UIKit

/**
 Swift 使用自动引用计数（ARC）这一机制来跟踪和管理应用程序的内存

 通常情况下我们不需要去手动释放内存，因为 ARC 会在类的实例不再被使用时，自动释放其占用的内存。

 但在有些时候我们还是需要在代码中实现内存管理。

 ARC 功能
 当每次使用 init() 方法创建一个类的新的实例的时候，ARC 会分配一大块内存用来储存实例的信息。

 内存中会包含实例的类型信息，以及这个实例所有相关属性的值。

 当实例不再被使用时，ARC 释放实例所占用的内存，并让释放的内存能挪作他用。

 为了确保使用中的实例不会被销毁，ARC 会跟踪和计算每一个实例正在被多少属性，常量和变量所引用。

 实例赋值给属性、常量或变量，它们都会创建此实例的强引用，只要强引用还在，实例是不允许被销毁的。
 */

class Person {
    let name: String
    
    init(name: String) {
        self.name = name
    }
    
    deinit {
        print("被析构了")
    }
}

var reference1: Person?
var reference2: Person?
var reference3: Person?


reference1 = Person(name: "Runoob")
reference2 = reference1
reference3 = reference1


reference1?.name
reference2?.name
reference3?.name
reference1 = nil
reference1?.name
reference2?.name
reference3?.name
reference2 = nil
reference3 = nil

// MARK:-类实例之间的循环强引用
do {
    class Person {
        let name: String
        init(name: String) { self.name = name }
        var apartment: Apartment?
        deinit { print("\(name) 被析构") }
    }
    
    class Apartment {
        let number: Int
        init(number: Int) { self.number = number }
        var tenant: Person?
        deinit { print("Apartment #\(number) 被析构") }
    }
    
    // 两个变量都被初始化为nil
    var runoob: Person?
    var number73: Apartment?
    
    // 赋值
    runoob = Person(name: "Runoob")
    number73 = Apartment(number: 73)
    
    // 意感叹号是用来展开和访问可选变量 runoob 和 number73 中的实例
    // 循环强引用被创建
    runoob!.apartment = number73
    number73!.tenant = runoob
    
    // 断开 runoob 和 number73 变量所持有的强引用时，引用计数并不会降为 0，实例也不会被 ARC 销毁
    // 注意，当你把这两个变量设为nil时，没有任何一个析构函数被调用。
    // 强引用循环阻止了Person和Apartment类实例的销毁，并在你的应用程序中造成了内存泄漏
    
    runoob = nil
    number73 = nil
}


// MARK:-解决实例之间的循环引用,   弱引用,  无主引用


// MARK:-弱引用,  对于生命周期中会变为nil的实例使用弱引用,  weak
class Module {
    let name: String
    init(name: String) { self.name = name }
    var sub: SubModule?
    deinit { print("\(name) 主模块") }
}

class SubModule {
    let number: Int
    init(number: Int) { self.number = number }
    weak var topic: Module?
    deinit { print("子模块 topic 数为 \(number)") }
}

var toc: Module?
var list: SubModule?
toc = Module.init(name: "ABC")
list = SubModule.init(number: 3)
toc!.sub = list
list!.topic = toc

list = nil
toc = nil


// MARK:-无主引用,  对于初始化赋值后再也不会被赋值为nil的实例，使用无主引用。 unowned
class Student {
    let name: String
    var section: Marks?
    
    init(name: String) {
        self.name = name
    }
    
    deinit { print("\(name)") }
}
class Marks {
    let marks: Int
    unowned let stname: Student
    
    init(marks: Int, stname: Student) {
        self.marks = marks
        self.stname = stname
    }
    
    deinit { print("学生的分数为 \(marks)") }
}
var module: Student?
module = Student(name: "ARC")
module!.section = Marks(marks: 98, stname: module!)
module = nil


// MARK:-闭包引起的循环引用
class HTMLElement {
    let name: String
    let text: String?
    
    init(name: String, text: String? = nil) {
        self.name = name
        self.text = text
    }
    
    deinit {
        print("\(name) is being deinitialized")
    }
    
    //内部调用self, 进行了循环引用
    lazy var asHTML: () -> String = {
        if let text = self.text {
            return "<\(self.name)>\(text)</\(self.name)>"
        } else {
            return "<\(self.name) />"
        }
    }
    
    /*
     当闭包和捕获的实例总是互相引用时并且总是同时销毁时，将闭包内的捕获定义为无主引用。

     相反的，当捕获引用有时可能会是nil时，将闭包内的捕获定义为弱引用。

     如果捕获的引用绝对不会置为nil，应该用无主引用，而不是弱引用。
     */
    lazy var testCycle: () -> String = {
        [unowned self] in
        if let text = self.text {
            return "<\(self.name)>\(text)</\(self.name)>"
        } else {
            return "<\(self.name) />"
        }
        
    }
    
}
var paragraph: HTMLElement? = HTMLElement(name: "p", text: "hello, world")

//paragraph?.asHTML()  //调用这行代码将无法释放
let temp = paragraph?.testCycle()
temp
paragraph = nil
