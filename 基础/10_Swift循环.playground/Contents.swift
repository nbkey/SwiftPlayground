import UIKit

// MARK:-for循环
for index in 1...5 {
    print("\(index) 乘于 5 为：\(index * 5)")
}

for index in 1..<5 {
    print("\(index) 乘于 5 为：\(index * 5)")
}


var someInts:[Int] = [10, 20, 30]
for index in someInts {
   print( "index 的值为 \(index)")
}


// MARK:-while循环
var index = 19
while index < 20 {
   print( "index 的值为 \(index)")
   index = index + 1
}


repeat {
    print( "repeat index 的值为 \(index)")
    index = index + 1
} while (index < 22)

// MARK:循环控制语句, continue, break, fallthrough
// continue 跳过循环内的本次循环, 继续下一次
// break 中断当前循环
// fallthrough switch 继续下面的条件
