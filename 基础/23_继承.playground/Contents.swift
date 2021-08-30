import UIKit

/*
 继承我们可以理解为一个类获取了另外一个类的方法和属性。

 当一个类继承其它类时，继承类叫子类，被继承类叫超类（或父类)

 在 Swift 中，类可以调用和访问超类的方法，属性和下标脚本，并且可以重写它们。

 我们也可以为类中继承来的属性添加属性观察器。
 */


// MARK:-基类
class Person {
    var stname: String!
    var mark1: Int!
    var mark2: Int!
    var mark3: Int!
    init(stname: String, mark1: Int, mark2: Int, mark3: Int) {
        self.stname = stname
        self.mark1 = mark1
        self.mark2 = mark2
        self.mark3 = mark3
    }
}
let stname = "swift"
let mark1 = 98
let mark2 = 89
let mark3 = 76

let sds = Person(stname:stname, mark1:mark1, mark2:mark2, mark3:mark3);


// MARK:-子类
class Student : Person {

}

let stu = Student.init(stname: "a", mark1: 2, mark2: 3, mark3: 4)
stu.stname
stu.mark1


// MARK:-重写  父类使用super
/**
 方法    super.somemethod()
 属性    super.someProperty()
 下标脚本    super[someIndex]
 */

class SuperClass {
    var radius = 12.5
    var area: String {
        return "矩形半径 \(radius) "
    }
    
    func show() {
        print("这是超类 SuperClass")
    }
}

class SubClass: SuperClass  {
    var num = 7
    //重写属性
    override var area: String {
        return super.area + " ，但现在被重写为 \(num)"
    }
    
    //重写方法
    override func show() {
        print("这是子类 SubClass")
    }
    
    //重写观察器
    override var radius: Double {
        didSet {
            num = Int(radius/5.0)+1
        }
    }
}

let superClass = SuperClass()
superClass.show()
superClass.area

let subClass = SubClass()
subClass.show()
subClass.area

subClass.num
subClass.radius = 20
subClass.num

// MARK:-防止重写, 不可被继承, 不可被重写, 使用 final 关键字
final class Circle {
    final var radius = 12.5
    var area: String {
        return "矩形半径为 \(radius) "
    }
}
