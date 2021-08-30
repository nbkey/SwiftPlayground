import UIKit

// MARK:-创建字符串
var strA = "hello world"
var strB = String("hello world")

// MARK:-空字符串
var StringA = ""
if StringA.isEmpty {
    print("空的")
} else {
    print("不空")
}

let StringB = String()
if StringB.isEmpty {
    print("StringB 空的")
} else {
    print("StringB 不空")
}
// MARK:-字符串常量, let修饰的不可更改
var string_constA = "菜鸟教程"
string_constA += "http://www.runoob.com"
print(string_constA)

// MARK:-字符串中插入值
var varA = 20
let constA = 100
var varC:Float = 20.0
var string_A = "\(varA) 乘于 \(constA) 等于 \(varC * 100)"
print(string_A)


// MARK:-字符串连接
let const_ConA = "李白"
let const_ConB = "你好"
var stringConntection = const_ConA + const_ConB
print(stringConntection)

// MARK:-字符串长度
stringConntection.count

// MARK:-字符串比较
var varAStr = "hello"
var varB = "hello"
if varAStr == varB {
   print( "\(varAStr) 与 \(varB) 是相等的" )
} else {
   print( "\(varAStr) 与 \(varB) 是不相等的" )
}


// MARK:-Unicode字符串
var UnicodeString = "菜鸟教程"
for code in UnicodeString.utf8 {
    print("\(code)")
}

for code in UnicodeString.utf16 {
   print("\(code)")
}


// MARK:-字符串函数以及运算符
var funcString = "菜鸟教程"
funcString.isEmpty //是否为空
funcString.hasPrefix("菜") //检查字符串是否有特定前缀
funcString.hasSuffix("程") //检查字符串是否有特定后缀
let myString: String = "256"
let myInt: Int? = Int(myString) //转化为整形
funcString.count //Swift 3 版本使用的是 String.characters.count
funcString.utf8
funcString.utf16
funcString.unicodeScalars //您可以通过遍历String值的unicodeScalars属性来访问它的 Unicode 标量编码.
funcString + "abc"
funcString += "abc"
funcString == "abc"
"abc" < "abcd" //比较两个字符串，对两个字符串的字母逐一比较。
funcString != "abc" //比较两个字符串是否不相等。
