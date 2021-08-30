import UIKit

// MARK:-Swift 的字符是一个单一的字符字符串字面量，数据类型为 Character。


let char1:Character = "A"
let char2:Character = "B"
print("\(char1)")
print("\(char2)")

var strings = "running"

for c in strings {
    print(c)
}

// MARK:-字符串连接字符
var varA:String = "Hello"
let varB:Character = "W"
varA.append(varB)
varA
