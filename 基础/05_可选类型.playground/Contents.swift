import UIKit

// MARK:-可选类型, 以下两种表示的意思是一样
var optionInterger: Int?
var optionInterger_: Optional<Int>


var myString:String? = nil
if myString != nil {
    print(myString)
} else {
    print("myString 为 nil")
}

// MARK:-强制解析 !
myString = "hello, swift"
if myString != nil {
   print(myString!)
}else{
   print("myString 值为 nil")
}

// MARK:-自动解析
var myString_a:String!
myString_a = "自动解析"
if myString_a != nil {
   print(myString_a!)
}else{
   print("myString 值为 nil")
}

// MARK:-可选绑定
var myString_b:String?
myString_b = "可选绑定"
if let youStr = myString_b {
    print(youStr)
} else {
    print("字符串没有值")
}

