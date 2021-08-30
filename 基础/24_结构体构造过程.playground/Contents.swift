import UIKit
// MARK:-构造器 init
struct rectangle {
    var length: Double
    var breadth: Double
    init() {
        length = 6
        breadth = 12
    }
}
//如果没有init, 默认是如下构造
//let rec = rectangle(length: 1, breadth: 2)
//rec.length

//如果有init
let recinit = rectangle.init()
let recinita = rectangle()
recinit.length
recinita.length

// 默认属性值
struct rectciver {
    var length = 6
    var breadth = 10
}

var a = rectciver()
a.length


// MARK:-构造参数,  fromLeng(外部) leng(内部)
struct Rectangle {
    var length: Double
    var breadth: Double
    var area: Double
    
    init(fromLength length: Double, fromBreadth breadth: Double) {
        self.length = length
        self.breadth = breadth
        area = length * breadth
    }
    
    init(fromLeng leng: Double, fromBread bread: Double) {
        self.length = leng
        self.breadth = bread
        area = leng * bread
    }
}
let ar = Rectangle(fromLength: 6, fromBreadth: 12)
print("面积为: \(ar.area)")

let are = Rectangle(fromLeng: 36, fromBread: 12)
print("面积为: \(are.area)")


// MARK:-内部和外部参数名
struct Color {
    let red, green, blue: Double
    init(red: Double, green: Double, blue: Double) {
        self.red   = red
        self.green = green
        self.blue  = blue
    }
    init(white: Double) {
        red   = white
        green = white
        blue  = white
    }
    
    init(_ white: Double) {
        self.red   = white
        self.green = white
        self.blue  = white
    }
}
let rbg = Color.init(red: 1, green: 2, blue: 3)
rbg.red
let white = Color.init(white: 2)
white.red
let white1 = Color.init(6)
white1.red


// MARK:-可选属性类型
/*
 如果你定制的类型包含一个逻辑上允许取值为空的存储型属性，你都需要将它定义为可选类型optional type（可选属性类型）。

 当存储属性声明为可选时，将自动初始化为空 nil。
 */
struct RectangleOpt {
    var length: Double?
    
    init(frombreadth breadth: Double) {
        length = breadth * 10
    }
    
    init(frombre bre: Double) {
        length = bre * 30
    }
    
    init(_ area: Double) {
        length = area
    }
}

let rectarea = RectangleOpt.init(frombreadth: 180)
print("面积为：\(String(describing: rectarea.length))")

let rearea = RectangleOpt.init(frombre: 360)
print("面积为：\(String(describing: rearea.length))")

let recarea = RectangleOpt(110.0)
print("面积为：\(String(describing: recarea.length))")


// MARK:-构造过程中修改常量属性, 只能在默认构造器中修改
struct RectangleAmend {
    let length: Double?
    
    init(frombreadth breadth: Double) {
        length = breadth * 10
    }
    
    init(frombre bre: Double) {
        length = bre * 30
    }
    
    init(_ area: Double) {
        length = area
    }
}
let amend = RectangleAmend.init(10)
amend.length


// MARK:-默认构造器,  所有属性都有默认值，且它是没有父类的基类, 可以获得一个给所有属性设置默认值的一个默认构造器
class ShoppingListItem {
    var name: String?
    var quantity = 1
    var purchased = false
}
var item = ShoppingListItem()
item.name
item.quantity


// MARK:-结构体逐一成员的构造器
struct RectangletStu {
    var length = 100.0, breadth = 200.0
}
let stu = RectangletStu()
stu.length
stu.breadth

let stu1 = RectangletStu(length: 1, breadth: 2)
stu1.length
stu1.breadth
//如果都有默认值, 还会获得一个init
let stu2 = RectangletStu.init(length: 2, breadth: 4)
stu2.length
stu2.breadth


// MARK:-值类型的构造器代理 构造器可以通过调用其它构造器来完成实例的部分构造过程。这一过程称为构造器代理，它能减少多个构造器间的代码重复。

struct Size {
    var width = 0.0, height = 0.0
}
struct Point {
    var x = 0.0, y = 0.0
}

struct Rect {
    var origin = Point()
    var size = Size()
    init() {}
    init(origin: Point, size: Size) {
        self.origin = origin
        self.size = size
    }
    init(center: Point, size: Size) {
        let originX = center.x - (size.width / 2)
        let originY = center.y - (size.height / 2)
        self.init(origin: Point(x: originX, y: originY), size: size)
    }
}

let basicRect = Rect()
basicRect.size.width;
basicRect.size.height;
basicRect.origin.x;
basicRect.origin.y;


let originRect = Rect(origin: Point(x: 2.0, y: 2.0),
    size: Size(width: 5.0, height: 5.0))
originRect.size.width;
originRect.size.height;
originRect.origin.x;
originRect.origin.y;


let centerRect = Rect(center: Point(x: 4.0, y: 4.0),
    size: Size(width: 3.0, height: 3.0))
originRect.size.width;
originRect.size.height;
originRect.origin.x;
originRect.origin.y;
