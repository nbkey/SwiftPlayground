import UIKit

// MARK:-字面量
let number = 3
let aString = "hello"
let aBool = true


// MARK:-整体字面量
let binaryInter = 0b10001 //二进制
let octalInteger = 0o21 //8进制
let decimalInterger = 17 //10进制
let hexadecimalInteger = 0x11 //16进制


// MARK:-浮点型字面量
let decimalDouble = 12.1875       //十进制浮点型字面量
let exponentDouble = 1.21875e1    //十进制浮点型字面量, e1代表1.21875 * 10 ^ 1
let hexadecimalDouble = 0xC.3p0   //十六进制浮点型字面量, p0代表15 * 2 ^ 0


// MARK:-字符串字面量
"characters"
let stringL = "Hello\tWorld \n \n 菜鸟教程官网：\'http://www.runoob.com\'"
print(stringL)


// MARK:-布尔字面量
true //表示真。

false //表示假。

//nil表示没有值。

/*
 \0    空字符
 \\    反斜线 \
 \b    退格(BS) ，将当前位置移到前一列
 \f    换页(FF)，将当前位置移到下页开头
 \n    换行符
 \r    回车符
 \t    水平制表符
 \v    垂直制表符
 \'    单引号
 \"    双引号
 \000    1到3位八进制数所代表的任意字符
 \xhh...    1到2位十六进制所代表的任意字符
 */
