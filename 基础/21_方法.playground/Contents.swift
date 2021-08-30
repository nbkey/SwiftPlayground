import UIKit

// MARK:-实例方法, _可以取消外部名称

class Counter {
    var count = 0
    func increment() {
        count += 1
    }
    
    func incrementBy(num:Int) {
        count += num
    }
    
    func incrementByTwo(_ num1:Int, _ num2:Int) {
        count += num1
        count += num2
    }
    
    
    func reset() {
        count = 0
    }
}
let counterInstance = Counter()
counterInstance.increment()
counterInstance.count
counterInstance.incrementBy(num: 6)
counterInstance.count
counterInstance.reset()
counterInstance.incrementByTwo(1, 1)
counterInstance.count


// MARK:-self属性
class calculations {
    let a: Int
    let b: Int
    let res: Int
    
    init(a: Int, b: Int) {
        self.a = a
        self.b = b
        res = a + b
        print("Self 内: \(res)")
    }
    
    func tot(c: Int) -> Int {
        return res - c
    }
}

let pri = calculations.init(a: 1, b: 2)
pri.res
let sum = calculations.init(a: 3, b: 4)
sum.res
sum.tot(c: 2)

// MARK:-在实例方法中修改值类型, 需要在某个方法中修改内部成员的值, 则要使用 mutating
struct area {
    var length = 1
    var depth = 1
    
    func area() -> Int {
        return length - depth
    }
    
    mutating func scaleBy(_ res:Int) {
        length += res
        self.depth += res
    }
}

var stu = area(length: 3, depth: 3)
stu.area()
stu.scaleBy(6)
stu.length
stu.depth


// MARK:-在可变方法中给 self 赋值, 可变方法能够赋给隐含属性 self 一个全新的实例。

// MARK:-类型方法, 类可能会用关键字class来允许子类重写父类的实现方法, static修饰也可以类调用
class Math {
    class func abs(number: Int) -> Int {
        if number < 0 { return (-number) }
        else { return number}
    }
    
    static func test() {
        print("类调用啊")
    }
}

struct MathStruct {
    static func test() {
        print("结构体调用啊")
    }
}

Math.abs(number: 5)
Math.test()
MathStruct.test()
