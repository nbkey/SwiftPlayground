//import引入
import UIKit

var str = "Hello, playground"
/*
 /*
 多行注释
 */
 单行注释
 */
print(str)


var myStr = "hello world";
print(myStr)

//如果使用class类似的系统标识符做引用, 那么如下操作
let `class` = "天那"
print(`class`)

/*
系统的语句有关的关键字
 class    deinit    enum    extension
 func    import    init    internal
 let    operator    private    protocol
 public    static    struct    subscript
 typealias    var
 
 
与语句有关的关键字
 break    case    continue    default
 do    else    fallthrough    for
 if    in    return    switch
 where    while
 
 
与表达和类型有关的关键字
 as    dynamicType    false    is
 nil    self    Self    super
 true    _COLUMN_    _FILE_    _FUNCTION_
 _LINE_
 
在特定上下文中使用的关键字
 associativity    convenience    dynamic    didSet
 final    get    infix    inout
 lazy    left    mutating    none
 nonmutating    optional    override    postfix
 precedence    prefix    Protocol    required
 right    set    Type    unowned
 weak    willSet
*/

//Swift对于空格有要求, let a= 1 + 2, let a = 1+ 2这样的不能编译成功
let a = 1 + 2 + 8


// MARK:-打印输出
for x in 0...10 {
    //如果想输出不换行 就这样做, , terminator: ""
    print("\(x), \(a)", terminator: "")
}
//如果你需要接收用户的输入可以使用 readLine():
readLine()
print()
