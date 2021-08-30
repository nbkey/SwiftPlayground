import UIKit

// MARK:-函数定义
func study(str:String) -> String {
    return str
}

study(str: "www.hello.world")


// MARK:-函数调用
func runoob(site: String) -> String {
    return (site)
}
runoob(site: "hello 啊")


// MARK:-函数参数
func runooba(site: String, sitea: String) -> String {
    return site + sitea
}

runooba(site: "abc", sitea: "efg")

// MARK:-无参函数
func noPara() -> String {
    return "菜鸟教程"
}

noPara()


// MARK:-元祖作为函数返回值
/**
 函数返回值类型可以是字符串，整型，浮点型等。

 元组与数组类似，不同的是，元组中的元素可以是任意类型，使用的是圆括号。

 你可以用元组（tuple）类型让多个值作为一个复合值从函数中返回。
 */
func minMax(array: [Int]) -> (min: Int, max: Int) {
    var currentMin = array[0]
    var currentMax = array[0]
    for value in array[1..<array.count] {
        if value < currentMin {
            currentMin = value
        } else if value > currentMax {
            currentMax = value
        }
    }
    return (currentMin, currentMax)
}

let bounds = minMax(array: [10, 20, 30, 40,60])
print(bounds)
bounds.min
bounds.max


// MARK:-没有返回值的函数
func nothing() {
    print("什么都没有的函数")
}
nothing()

// MARK:-外部参数名
func powa(firstArg a: Int, secondArg b: Int) -> Int {
   var res = a
   for _ in 1..<b {
      res = res * a
   }
   print(res)
   return res
}
powa(firstArg:5, secondArg:3)


// MARK:-可变参数
func vari<N>(members: N...) {
    for item in members {
        print(item)
    }
}

vari(members: 3,4,5)
vari(members: "a", "b")
vari(members: 3.1, 6.6)


// MARK:-常量，变量及 I/O 参数
// 一般在传入的参数中都是常量参数, 只能查询不能修改,如果想定义变量参数, 需要加inout
func swapTwpInt(_ a: inout Int,_ b: inout Int) {
    let temp = a
    a = b
    b = temp
}

var x = 5
var y = 6
swap(&x, &y)
x
y


// MARK:-函数类型及使用
func inputs(nm1: Int, nm2: Int) -> Int {
    return nm1/nm2
}

inputs(nm1: 2, nm2: 1)
inputs(nm1: 6, nm2: 2)



// MARK:-使用函数类型
func sum(a: Int, b: Int) -> Int {
    return a + b
}

var addtion: (Int, Int) -> Int = sum
//var addtion = sum , 这样也可以
print("\(addtion(10, 20))")


// MARK:-函数类型作为参数类型、函数类型作为返回类型
func another(addtion: (Int, Int) -> Int, a: Int, b: Int) {
    addtion(a, b)
}
another(addtion: sum, a: 11, b: 23)


func anotherRtn(a: Int, b: Int) -> ((Int, Int) -> Int) {
    return sum
}

var abc = anotherRtn(a: 10, b: 10)
abc(10,11)


// MARK:-函数嵌套
func calcDecrement(forDecrement total:Int) -> (() -> Int) {
    var overallDecrement = 0
    func decrementer() -> Int {
        overallDecrement -= total
        return overallDecrement
    }
    return decrementer
}

let decrem = calcDecrement(forDecrement: 10)
decrem()

