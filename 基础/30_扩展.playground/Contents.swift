import UIKit

// MARK:- 扩展就是向一个已有的类、结构体或枚举类型添加新功能。 但是不能重写已有的功能。
/*
 Swift 中的扩展可以：

 添加计算型属性和计算型静态属性
 定义实例方法和类型方法
 提供新的构造器
 定义下标
 定义和使用新的嵌套类型
 使一个已有类型符合某个协议
 */


// MARK:-给类添加扩展, extension
extension Int {
    var add : Int {return self + 100}

}

var temp = 1
temp.add


// MARK:-构造器
struct sum {
    var num1 = 100, num2 = 200
}

struct diff {
    var no1 = 200, no2 = 100
}

struct mult {
    var a = sum()
    var b = diff()
}


extension mult {
//    private struct AssociatedKey {
//        static var identifier: String = "identifier"
//    }
//
//    var str : String? {
//        get {
//            return objc_getAssociatedObject(self, &AssociatedKey.identifier) as? String ?? ""
//        }
//
//        set {
//            objc_setAssociatedObject(self, &AssociatedKey.identifier, newValue, .OBJC_ASSOCIATION_COPY_NONATOMIC)
//        }
//    }
    init(x: sum, y: diff) {
        _ = x.num1 + x.num2
        _ = y.no1 + y.no2
    }
}

let a = sum(num1: 100, num2: 200)
let b = diff(no1: 200, no2: 100)

var getMult = mult.init(x: a, y: b)
getMult.a.num1


// MARK:-添加方法
extension Int {
    func topics(summation: () -> ()) {
       for _ in 0..<self {
          summation()
       }
    }
    
    func test(summation: () -> ()) {
        for _ in 0..<self {
            summation()
        }
    }
}

3.topics {
    print("春天啊")
}

1.test {
    print("春天啊")
}


// MARK:-可变实例方法
extension Double {
   mutating func square() {
      let pi = 3.1415
      self = pi * self * self
   }
}

var flo = 3.14
flo.square()


// MARK:- 下标
extension Int {
    subscript(multtable: Int) -> Int {
        var no1 = 1
        var temp = multtable
        
        while temp > 0 {
            no1 *= 10
            temp -= 1
        }
        return (self / no1) % 10
    }
}
12[0]
13[0]
1232312[0]


// MARK:-嵌套类型
extension Int {
    enum calc
    {
        case add
        case sub
        case mult
        case div
        case anything
    }
    
    var printA: calc {
        switch self
        {
        case 0:
            return .add
        case 1:
            return .sub
        case 2:
            return .mult
        case 3:
            return .div
        default:
            return .anything
        }
    }
    
    func result(numb: [Int]) {
        for i in numb {
            switch i.printA {
            case .add:
                print(" 10 ")
            case .sub:
                print(" 20 ")
            case .mult:
                print(" 30 ")
            case .div:
                print(" 40 ")
            default:
                print(" 50 ")
                
            }
        }
    }
}

5.result(numb: [3])
