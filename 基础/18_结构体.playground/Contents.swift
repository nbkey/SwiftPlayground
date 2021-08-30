import UIKit

// MARK:-语法
/*
 我们可以为结构体定义属性（常量、变量）和添加方法，从而扩展结构体的功能。

 与 C 和 Objective C 不同的是：

 结构体不需要包含实现文件和接口。

 结构体允许我们创建一个单一文件，且系统会自动生成面向其它代码的外部接口。

 结构体总是通过被复制的方式在代码中传递，因此它的值是不可修改的。
 */
struct MarkStruct {
    var mark1: Int
    var mark2: Int
    var mark3: Int
    var mark4: String
    
    init(mark1: Int, mark2: Int, mark3: Int, mark4: String){
        self.mark1 = mark1
        self.mark2 = mark2
        self.mark3 = mark3
        self.mark4 = mark4
    }
    
    init(mark1: Int, mark2: Int, mark3: Int){
        self.mark1 = mark1
        self.mark2 = mark2
        self.mark3 = mark3
        self.mark4 = "无所谓"
    }
}

let markInstace = MarkStruct.init(mark1: 1, mark2: 2, mark3: 3)
markInstace.mark1
markInstace.mark2
markInstace.mark3


struct studentStruct {
    var mark1 = 88
    var mark2 = 99
    var mark3 = 100
}
let studentInstace = studentStruct()
studentInstace.mark1
studentInstace.mark2
studentInstace.mark3



struct MarksStruct {
    var mark1: Int
    
    init(mark: Int) {
        self.mark1 = mark
    }
}

var aStruct = MarksStruct.init(mark: 88)
var bStruct = aStruct
bStruct.mark1 = 97

aStruct.mark1
bStruct.mark1

// MARK:-结构体应用
var marks = MarkStruct.init(mark1: 10, mark2: 20, mark3: 30, mark4: "春天来了")
marks.mark1
marks.mark2
marks.mark3
marks.mark4
