import UIKit

// MARK:-语法
enum DaysofaWeek {
    case Sunday
    case Monday
    case TUESDAY
    case WEDNESDAY
    case THURSDAY
    case FRIDAY
    case Saturday
}

var weekDay = DaysofaWeek.Sunday
switch weekDay {
    case .Sunday:
        print("星期天")
    case .Monday:
        print("星期一")
    case .TUESDAY:
        print("星期二")
    case .WEDNESDAY:
        print("星期三")
    case .THURSDAY:
        print("星期四")
    case .FRIDAY:
        print("星期五")
    case .Saturday:
        print("星期六")
    default:
        print("未知天")
}

/*
 注意： 和 C 和 Objective-C 不同，Swift 的枚举成员在被创建时不会被赋予一个默认的整型值。在上面的DaysofaWeek例子中，Sunday，Monday，……和Saturday不会隐式地赋值为0，1，……和6。相反，这些枚举成员本身就有完备的值，这些值是已经明确定义好的DaysofaWeek类型。
 */

// MARK:-相关值
enum Student{
    case Name(String)
    case Mark(Int,Int,Int)
}
var studDetails = Student.Name("小明")
var studMarks = Student.Mark(10, 15, 20)

switch studMarks {
case .Name(let name):
    print("\(name)")
case .Mark(let a, let b, let c):
    print("\(a), \(b), \(c),")
}

// MARK:-原始值
/*
 原始值可以是字符串，字符，或者任何整型值或浮点型值。每个原始值在它的枚举声明中必须是唯一的。

 在原始值为整数的枚举时，不需要显式的为每一个成员赋值，Swift会自动为你赋值。

 例如，当使用整数作为原始值时，隐式赋值的值依次递增1。如果第一个值没有被赋初值，将会被自动置为0。
 */
enum Month: Int {
    case January = 1, February, March, April, May, June, July, August, September, October, November, December
}
let yearMonth = Month.May.rawValue
print("数字的月份为:\(yearMonth)")
