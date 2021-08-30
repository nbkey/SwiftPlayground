import UIKit


// MARK:-算数运算符, +-*/%, Swift3中取消了++/--
var A = 10
var B = 20
print("A+B=\(A+B)")
print("A-B=\(A-B)")
print("A*B=\(A*B)")
print("A/B=\(A/B)")
//A += 1
//B -= 1


// MARK:-比较运算符, ==, !=, >, <, >=, <=


// MARK:-逻辑运算符, &&, ||, !
var A_bool = true
var B_bool = false
A_bool && B_bool
A_bool || B_bool
!A_bool
!B_bool
print("\(A_bool && B_bool)")


// MARK:-位运算符
var A_binary = 60   // 二进制为 0011 1100
var B_binary = 13   // 二进制为 0000 1101
var C_binary = 1 << 2
print("\(A_binary&B_binary)")
print("\(A_binary|B_binary)")
print("\(A_binary^B_binary)")
print("\(~A_binary)")
print("\(C_binary)")


// MARK:-赋值运算符, =, +=, -=, *=, /=, %=, <<=, >>=, &=, ^=, |=
var C = 100
var D = 2

C %= A
print("C 结果为：\(C)")

D <<= 1
print("C 结果为：\(D)")

D >>= 1
print("C 结果为：\(D)")

C &= A
print("C 结果为：\(C)")

C ^= A
print("C 结果为：\(C)")

C |= A
print("C 结果为：\(C)")

// MARK:-区间运算符, 闭区间运算, 半开区间运算

print("闭区间运算符:")
for index in 1...5 {
    print("\(index) * 5 = \(index * 5)")
}

print("半开区间运算符: 不包含5")
for index in 1..<5 {
    print("\(index) * 5 = \(index * 5)")
}


// MARK:-其他运算符
var A_other = 1
var B_other = 2
var C_other = true
var D_other = false
print("\(C_other ? A_other : B_other)")


// MARK:-运算符优先级
    //.先算术运算，后移位运算(<<,>>,)，最后位运算(&,|,~,^)
    //逻辑运算最后计算  && ||
