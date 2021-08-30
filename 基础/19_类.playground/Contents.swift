import UIKit

// MARK:-类, 在单一文件中定义一个类, 系统会自动生成其对外的接口
class studenta{
   var studname = "ac"
   var mark = 1
   var mark2 = 2
}

let stu = studenta()
stu.studname
stu.mark
stu.mark2

class student {
    var studentName: String
    var mark: Int
    var mark2: Int
    
    init(s: String, mark: Int, mark2: Int) {
        self.studentName = s
        self.mark = mark
        self.mark2 = mark2
    }
    
}
let studentInstance = student.init(s: "aaa", mark: 10, mark2: 20)


class MarksStruct {
    var mark: Int
    init(mark: Int) {
        self.mark = mark
    }
}

class studentMarks {
    var mark = 300
    var mark2 = 200
    var mark1 = 100
}
let marks = studentMarks()
marks.mark


// MARK:-作为引用类型访问属性
marks.mark1
marks.mark2
marks.mark


// MARK:-恒等运算符, ===, !==

class SampleClass: Equatable {
    static func == (lhs: SampleClass, rhs: SampleClass) -> Bool {
        return lhs.myProperty == rhs.myProperty
    }
    
    let myProperty:String
    init(_ s:String) {
        self.myProperty = s
    }
}

let cls1 = SampleClass.init("abc")
let cls2 = SampleClass.init("abc")

if cls1 == cls2 {
    print("类相同")
} else {
    print("类不相同")
}
