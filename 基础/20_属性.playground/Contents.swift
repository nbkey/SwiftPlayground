import UIKit

// MARK:-存储属性
struct Number {
    var digits: Int
    let pi = 3.1415
}

var n = Number(digits: 6)
n.digits
n.pi


// MARK:-延迟存储属性, 延迟存储属性是指当第一次被调用的时候才会计算其初始值的属性。
//                  在属性声明前使用 lazy 来标示一个延迟存储属性。

class sample {
    lazy var no = Number.init(digits: 1)
}

class number {
    var name = "Runoob Swift 教程"
}

var firstSample = sample()
firstSample.no.digits

// MARK:-实例化变量
/*
 Swift 编程语言中把这些理论统一用属性来实现。
 Swift中的属性没有对应的实例变量，属性的后端存储也无法直接访问。这就避免了不同场景下访问方式的困扰，同时也将属性的定义简化成一个语句。

 一个类型中属性的全部信息——包括命名、类型和内存管理特征——都在唯一一个地方（类型定义中）定义。
 */


// MARK:-计算属性
class computerCls {
    var no1 = 0.0, no2 = 0.0
    var length = 300.0, breadth = 150.0
    
    var middle: (Double, Double) {
        get{
            return (length / 2, breadth / 2)
        }
        set(newValue){
            no1 = newValue.0 - (length / 2)
            no2 = newValue.1 - (breadth / 2)
        }
    }
}

var result = computerCls()
result.middle
result.middle = (0, 10.0)

result.no1
result.no2


// MARK:-只读计算属性, 只有get, 没有set就是只读计算属性
/*
 注意：
 必须使用var关键字定义计算属性，包括只读计算属性，因为它们的值不是固定的。let关键字只用来声明常量属性，表示初始化后再也无法修改的值。
 */
class film {
    var head = ""
    var duration = 0.0
    var metaInfo: [String:String] {
        return [
            "head": self.head,
            "duration":"\(self.duration)"
        ]
    }
}

var filmCls = film()
filmCls.metaInfo
filmCls.head = "头啊"
filmCls.duration = 13.3333

filmCls.metaInfo["head"]
filmCls.metaInfo["duration"]



// MARK:-属性观察器,
class Samplepgm {
    var counter: Int = 0{
        willSet(newTotal){
            print("计数器: \(newTotal)")
        }
        didSet{
            if counter > oldValue {
                print("新增数 \(counter - oldValue)")
            }
        }
    }
}

let samplepgm = Samplepgm()
samplepgm.counter = 10
//samplepgm.counter = 20


// MARK:-全局变量和局部变量
// MARK:-类型属性
// 例子中的计算型类型属性是只读的，但也可以定义可读可写的计算型类型属性，跟实例计算属性的语法类似。
struct Structname {
   static var storedTypeProperty = " "
   static var computedTypeProperty: Int {
      // 这里返回一个 Int 值
        return 0
   }
}

enum Enumname {
    static var storedTypeProperty = " "
    static var computedTypeProperty: Int {
        // 这里返回一个 Int 值
        return 1
    }
}

class Classname {
    var computedTypeProperty: Int {
        // 这里返回一个 Int 值
        return 2
    }
}

var cls = Classname()
var clsInstance = Classname.init()
cls.computedTypeProperty
clsInstance.computedTypeProperty

// MARK:-获取和设置类型属性的值
struct StudMarks {
   static let markCount = 97
   static var totalCount = 0
   var InternalMarks: Int = 0 {
      didSet {
         if InternalMarks > StudMarks.markCount {
            InternalMarks = StudMarks.markCount
         }
         if InternalMarks > StudMarks.totalCount {
            StudMarks.totalCount = InternalMarks
         }
      }
   }
    func test(_ s:String) -> String {
        return s + "加油"
    }
}

var mark1 = StudMarks()
var mark2 = StudMarks()

mark1.InternalMarks = 98
mark2.InternalMarks = 97

mark1.test("春天啊")
