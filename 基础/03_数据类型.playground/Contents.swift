import UIKit

// MARK:-类型别名
typealias Feet = Int
var distance: Feet = 10
print("\(distance)")
/*
Int
UInt
Float
Double
Bool
String
Character
Optional
 */


// MARK:-类型安全, 编译期会进行类型检查
/*
 var varA = 42
 varA = "This is hello"
 */


// MARK:-类型推断,

// varA 会被推测为 Int 类型
var varA = 42
print(varA)

// varB 会被推测为 Double 类型
var varB = 3.14159
print(varB)

// varC 也会被推测为 Double 类型
var varC = 3 + 0.14159
print(varC)
