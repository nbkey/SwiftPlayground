import UIKit

// MARK:-创建字典
var someDict = [String: String]()

var someDict_a:[Int: String] = [1:"111", 2:"222"]

// MARK:-访问字典
var num = someDict_a[1]


// MARK:-修改字典
var oldValue = someDict_a.updateValue("112", forKey: 1)
var someValue = someDict_a[1]

someDict_a[1] = "113"

someDict["a"] = "abc"
print(someDict)


// MARK:-移除键值对

//var removeKeyValue = someDict_a.removeValue(forKey: 1)
//
//someDict_a[2] = nil
//
//someDict
//someDict.removeValue(forKey: "a")
//someDict
//someDict_a


// MARK:-遍历字典
for (key, value) in someDict_a.enumerated() {
    print("key=\(key) value=\(value)")
}


// MARK:-字典转数组
let dictKeys = [Int](someDict_a.keys)
let dictValues = [String](someDict_a.values)

for item in dictKeys {
    print(item)
}

for item in dictValues {
    print("\(item)")
}


// MARK:属性
someDict_a.count
someDict_a.isEmpty
