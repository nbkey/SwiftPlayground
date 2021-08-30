import UIKit

// MARK:-泛型

//下面是一个非泛型的交换函数
//inout 是Swift 中的关键字，可以放置于参数类型前，冒号之后。 使用 inout 之后，函数体内部可以直接更改参数值，而且改变会保留。 小结：值类型变量作为参数传入函数，外界和函数参数的内存地址一致，函数内对参数的更改得到了保留。
func swapTwoNums(_ a: inout Int, _ b: inout Int) {
    let temp = a
    a = b
    b = temp
}

var num1 = 1
var num2 = 2

swap(&num1, &num2)
num1
num2

// MARK:-占位类型, 泛型使用了占位类型名（在这里用字母 T 来表示）来代替实际类型名（例如 Int、String 或 Double）。


func swapTwoValues<T>(_ a: inout T, _ b: inout T) {
    let temp = a
    a = b
    b = temp
}

var a = "a"
var b = "b"
swapTwoValues(&a, &b)
a
b

// MARK:-泛型类型,  Swift 允许你定义你自己的泛型类型。
// 创建一个泛型的栈

// 首先是正常的Int类型的栈
struct IntStack {
    var items = [Int]()
    mutating func push(_ item: Int) {
        items.append(item)
    }
    mutating func pop() -> Int {
        return items.removeLast()
    }
}

var intStack = IntStack.init()
intStack.push(1)
intStack.pop()


// 泛型的栈
struct Stack<Element> {
    var items = [Element]()
    mutating func push(_ item:Element) {
        items.append(item)
    }
    
    mutating func pop() -> Element{
        return items.removeLast()
    }
}
var stack = Stack<String>()
stack.push("abc")
stack.items
stack.pop()
stack.items

var stackFlo = Stack<Float>()
stackFlo.push(1.1)
stackFlo.items


// MARK:-扩展泛型类型
// 扩展一个栈顶类型元素
extension Stack {
    var topItem: Element? {
       return items.isEmpty ? nil : items[items.count - 1]
    }
}

stackFlo.topItem

//扩展一个存在的类型来指定关联类型。
//extension Array: Container {
//
//}


// MARK:-类型约束
// 类型约束指定了一个必须继承自指定类的类型参数，或者遵循一个特定的协议或协议构成。
class SomeClass {
    
}
protocol SomeProtocol {
    
}

func someFunction<T: SomeClass, U: SomeProtocol>(someT: T, someU: U) {
    // 这里是泛型函数的函数体部分
}


// 非泛型函数，查找指定字符串在数组中的索引
func findIndex(ofString valueToFind: String, in array: [String]) -> Int? {
    for (index, value) in array.enumerated() {
        if value == valueToFind {
            // 找到返回索引值
            return index
        }
    }
    return nil
}

let strings = ["google", "weibo", "taobao", "runoob", "facebook"]
if let temp = findIndex(ofString: "weibo", in: strings) {
    print("\(temp)找到了")
}


// MARK:-关联类
/**
 Swift 中使用 associatedtype 关键字来设置关联类型实例。

 下面例子定义了一个 Container 协议，该协议定义了一个关联类型 ItemType。

 Container 协议只指定了三个任何遵从 Container 协议的类型必须提供的功能。遵从协议的类型在满足这三个条件的情况下也可以提供其他额外的功能。
 */
// Container 协议
protocol Container {
    associatedtype ItemType
    
    // 获取容器中元素的数
    var count: Int { get }
    // 通过索引值类型为 Int 的下标检索到容器中的每一个元素
    subscript(i: Int) -> ItemType { get }
    
    // 添加一个新元素到容器里
    mutating func append(_ item: ItemType)
}

class ContanierStack<Element>: Container {
    var items = [Element]()
    func push(_ item: Element) {
        items.append(item)
    }
    func pop() -> Element {
        return items.removeLast()
    }
    
    // Container 协议的实现部分
    func append(_ item: Element) {
        self.push(item)
    }
    var count: Int {
        return items.count
    }
    subscript(i: Int) -> Element {
        return items[i]
    }
}

var tos = ContanierStack<String>()
tos.push("google")
tos.push("runoob")
tos.push("taobao")
tos.items

tos[0]


// MARK:-where语句
/*
 类型约束能够确保类型符合泛型函数或类的定义约束。

 你可以在参数列表中通过where语句定义参数的约束。

 你可以写一个where语句，紧跟在在类型参数列表后面，where语句后跟一个或者多个针对关联类型的约束，以及（或）一个或多个类型和关联类型间的等价(equality)关系。
 */

//下面的例子定义了一个名为allItemsMatch的泛型函数，用来检查两个Container实例是否包含相同顺序的相同元素。如果所有的元素能够匹配，那么返回 true，反之则返回 false。

// 扩展，将 Array 当作 Container 来使用
protocol ContainerNew {
    associatedtype ItemType
    // 添加一个新元素到容器里
    mutating func append(_ item: ItemType)
    // 获取容器中元素的数
    var count: Int { get }
    // 通过索引值类型为 Int 的下标检索到容器中的每一个元素
    subscript(i: Int) -> ItemType { get }
}

// Stack 结构体遵从 Container 协议
// // 遵循Container协议的泛型TOS类型
struct StackNew<Element>: ContainerNew {
    // Stack<Element> 的原始实现部分
    var items = [Element]()
    mutating func push(_ item: Element) {
        items.append(item)
    }
    mutating func pop() -> Element {
        return items.removeLast()
    }
    // Container 协议的实现部分
    mutating func append(_ item: Element) {
        self.push(item)
    }
    var count: Int {
        return items.count
    }
    subscript(i: Int) -> Element {
        return items[i]
    }
}

extension Array: ContainerNew {}
func allItemsMatch<C1: ContainerNew, C2: ContainerNew>(_ someContainer: C1, _ anotherContainer: C2) -> Bool
    where C1.ItemType == C2.ItemType, C1.ItemType: Equatable {
    
    
    // 检查两个容器含有相同数量的元素
    if someContainer.count != anotherContainer.count {
        return false
    }
    
    // 检查每一对元素是否相等
    for i in 0..<someContainer.count {
        if someContainer[i] != anotherContainer[i] {
            return false
        }
    }
        
    return true
}

var tosNew = StackNew<String>()
tosNew.push("google")
tosNew.push("runoob")
tosNew.push("taobao")

var aos = ["google", "runoob", "taobao"]
var temp = allItemsMatch(tosNew, aos)

if temp {
    print("相等")
} else {
    print("不相等")
}
