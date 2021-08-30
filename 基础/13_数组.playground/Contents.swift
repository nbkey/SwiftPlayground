import UIKit

// MARK:-数组的创建
var someArr = [Int]()

var someCountArr = [Int](repeating: 10, count: 10)
someCountArr.count

var someInts = [Int](repeating: 0, count: 3)

var someInts_a:[Int] = [10, 20, 30]


// MARK:-访问数组
someInts_a[0]
someInts_a[1]


// MARK:-修改数组

someInts_a.append(40)
someInts_a.append(50)
someInts_a += [60]

someInts_a[0] = 11


// MARK:-遍历数组
var someStrs = [String]()
someStrs.append("name")
someStrs.append("age")
someStrs.append("height")
someStrs += ["GG"]

for str in someStrs {
    print(str)
}

for (index, item) in someStrs.enumerated() {
    print("\(index), \(item)")
}

// MARK:-合并数组

var intsC = someInts + someInts_a
for item in intsC {
    print(item)
}

// MARK:-属性
intsC.count
intsC.isEmpty

