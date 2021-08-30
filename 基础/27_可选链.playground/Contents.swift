import UIKit

// MARK:-可选链
do {
    class Person {
        var residence: Residence?
    }

    class Residence {
        var numberOfRooms = 1
    }

    let john = Person()

    //将导致运行时错误
    //let roomCount = john.residence!.numberOfRooms


    // 链接可选residence?属性，如果residence存在则取回numberOfRooms的值
    if let roomCount = john.residence?.numberOfRooms {
        print("John 的房间号为 \(roomCount)。")
    } else {
        print("不能查看房间号")
    }
}

// MARK:-通过可选链定义模型

do {
    class Person {
        var residence: Residence?
//        init(_ residenceIns: Residence) {
//            self.residence = residenceIns
//        }
    }
    
    // 定义了一个变量 rooms，它被初始化为一个Room[]类型的空数组
    class Residence {
        var rooms = [Room]()
        var numberOfRooms: Int {
            return rooms.count
        }
        subscript(i: Int) -> Room {
            get{
                return rooms[i]
            }
            set {
                rooms[i] = newValue
            }
        }
        func printNumberOfRooms() {
            print("房间号为 \(numberOfRooms)")
        }
        var address: Address?
    }
    
    // Room 定义一个name属性和一个设定room名的初始化器
    class Room {
        let name: String
        init(name: String) { self.name = name }
    }
    
    // 模型中的最终类叫做Address
    class Address {
        var buildingName: String?
        var buildingNumber: String?
        var street: String?
        func buildingIdentifier() -> String? {
            if (buildingName != nil) {
                return buildingName
            } else if (buildingNumber != nil) {
                return buildingNumber
            } else {
                return nil
            }
        }
    }
    
    let john = Person()
    if ((john.residence?.printNumberOfRooms()) != nil) {
        print("输出房间号")
    } else {
        print("无法输出房间号")
    }
    
    // MARK:-使用可选链调用下标脚本
    if let firstRoomName = john.residence?[0].name {
        print("第一个房间名 \(firstRoomName).")
    } else {
        print("无法检索到房间")
    }
    
    
    // MARK:-实例2
    let johnsHouse = Residence()
    johnsHouse.rooms.append(Room(name: "客厅"))
    johnsHouse.rooms.append(Room(name: "厨房"))
    john.residence = johnsHouse
    
    let johnsAddress = Address()
    johnsAddress.buildingName = "The Larches"
    johnsAddress.street = "Laurel Street"
    john.residence!.address = johnsAddress
    
    if let johnsStreet = john.residence?.address?.street {
        johnsStreet
    } else {
        print("无法检索到地址。 ")
    }
    
    
    // MARK:-实例3
    if let firstRoomName = john.residence?[0].name {
        firstRoomName
    } else {
        print("无法检索到房间")
    }
    
    // MARK:-连接多层链接
    john.residence?[0] = Room(name: "浴室")
    if let firstRoomName = john.residence?[0].name {
        firstRoomName
    } else {
        print("无法检索房间")
    }
    
    
    // MARK:-对返回可选值的函数进行链接
    let johnA = Person()

    if johnA.residence?.printNumberOfRooms() != nil {
        print("指定了房间号)")
    }  else {
        print("未指定房间号")
    }
}

// MARK:-访问可选类型的下标

var testScoures = ["Dave": [86, 82, 84], "Bev": [79, 94, 81]]
testScoures["Dave"]?[0] = 90
testScoures["Bev"]?[0] += 1
testScoures["Bevve"]?[0] = 0




