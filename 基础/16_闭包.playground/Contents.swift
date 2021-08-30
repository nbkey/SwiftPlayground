import UIKit

// MARK:-实例
let studyname = {() 
    print("Swift 闭包实例")
}
studyname()

let divide = {(var1: Int, var2: Int) -> Bool in
    return var1 == var2
}
divide(10,10)


// MARK:-闭包表达式
let nums = [1, 2, 3, 4, 5]
func backwards(n1: Int, n2: Int) -> Bool {
    return n1 > n2
}
var reversed = nums.sorted(by: backwards)
print(reversed)


// MARK:-参数名称缩写
var reverseda = nums.sorted( by: { $0 > $1 } )
print(reverseda)


// MARK:-运算符函数
var reversedb = nums.sorted( by: > )
print(reversedb)


// MARK:-未遂闭包
func someFunctionThatTakesAClosure(closure: () -> Void) {
    // 函数体部分
}

someFunctionThatTakesAClosure() {
    print("hello")
}

someFunctionThatTakesAClosure {
    print("hello 1")
}

print("123")
var reversedc = nums.sorted() { $0 > $1}
reversedc


// MARK:-捕获值, 会捕获到内部的值, 而进行存储

func makeIncrementor(forIncrement amount: Int) -> () -> Int {
    var runningTotal = 0
    func incrementor() -> Int {
        runningTotal += amount
        return runningTotal
    }
    return incrementor
}

let incrementByTen = makeIncrementor(forIncrement: 10)
incrementByTen()
// 返回的值为10
print(incrementByTen())

// 返回的值为20
print(incrementByTen())

// 返回的值为30
print(incrementByTen())

// MARK:-闭包是引用类型
let alsoIncrementByTen = incrementByTen
print(alsoIncrementByTen())
