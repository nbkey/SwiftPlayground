import UIKit

// MARK:-类型转换 Swift 语言类型转换可以判断实例的类型。也可以用于检测实例类型是否属于其父类或者子类的实例。Swift 中类型转换使用 is 和 as 操作符实现，is 用于检测值的类型，as 用于转换类型。类型转换也可以用来检查一个类是否实现了某个协议。

class Subjects {
    var physics: String
    init(physics: String) {
        self.physics = physics
    }
}

class Chemistry: Subjects {
    var equations: String
    init(physics: String, equations: String) {
        self.equations = equations
        super.init(physics: physics)
    }
}

class Maths: Subjects {
    var formulae: String
    init(physics: String, formulae: String) {
        self.formulae = formulae
        super.init(physics: physics)
    }
}

let sa = [
    Chemistry(physics: "固体物理", equations: "赫兹"),
    Maths(physics: "流体动力学", formulae: "千兆赫"),
    Chemistry(physics: "热物理学", equations: "分贝"),
    Maths(physics: "天体物理学", formulae: "兆赫"),
    Maths(physics: "微分方程", formulae: "余弦级数")]


var chemCount = 0
var mathsCount = 0
for item in sa {
    // 如果是一个 Chemistry 类型的实例，返回 true，相反返回 false。
    if item is Chemistry {
        chemCount += 1
    } else if item is Maths {
        mathsCount += 1
    }
}
chemCount
mathsCount

/**
 * 判断实例是否属于类,   instance is Class
 */
// MARK:-向下转型
/*
 向下转型，用类型转换操作符(as? 或 as!)

 当你不确定向下转型可以成功时，用类型转换的条件形式(as?)。条件形式的类型转换总是返回一个可选值（optional value），并且若下转是不可能的，可选值将是 nil。

 只有你可以确定向下转型一定会成功时，才使用强制形式(as!)。当你试图向下转型为一个不正确的类型时，强制形式的类型转换会触发一个运行时错误。
 */

var chemAsCount = 0
var mathsAsCount = 0
for item in sa {
    // 类型转换的条件形式
    if let show = item as? Chemistry {
        chemAsCount += 1
        // 强制形式
    } else if let example = item as? Maths {
        mathsAsCount += 1
    }
}
chemAsCount
mathsAsCount


// MARK:-Any和AnyObject的类型转换
/*
 Swift为不确定类型提供了两种特殊类型别名：

 AnyObject可以代表任何class类型的实例。
 Any可以表示任何类型，包括方法类型（function types）。
 */
var exampleany = [Any]()
exampleany.append(12)
exampleany.append(3.1415926)
exampleany.append("Any 实例")
exampleany.append(Chemistry(physics: "固体物理", equations: "兆赫"))

exampleany[0]
exampleany[1]
exampleany[2]
exampleany[3]

for item2 in exampleany {
    switch item2 {
    case let someInt as Int:
        print("整型值为 \(someInt)")
    case let someDouble as Double where someDouble > 0:
        print("Pi 值为 \(someDouble)")
    case let someString as String:
        print("\(someString)")
    case let phy as Chemistry:
        print("主题 '\(phy.physics)', \(phy.equations)")
    default:
        print("None")
    }
}


// MARK:-AnyObject
let saprint: [AnyObject] = [
    Chemistry(physics: "固体物理", equations: "赫兹"),
    Maths(physics: "流体动力学", formulae: "千兆赫"),
    Chemistry(physics: "热物理学", equations: "分贝"),
    Maths(physics: "天体物理学", formulae: "兆赫"),
    Maths(physics: "微分方程", formulae: "余弦级数")]


var chemAnyObjectCount = 0
var mathsAnyObjectCount = 0

for item in saprint {
    // 类型转换的条件形式
    if let show = item as? Chemistry {
        chemAnyObjectCount += 1
    } else if let example = item as? Maths {
        mathsAnyObjectCount += 1
    }
}
chemAnyObjectCount
mathsAnyObjectCount

//在一个switch语句的case中使用强制形式的类型转换操作符（as, 而不是 as?）来检查和转换到一个明确的类型。
