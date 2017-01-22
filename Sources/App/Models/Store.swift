import Vapor
import Fluent
import Foundation

final class Store: Model {
    var id: Node?       // (1)
    var address: String
    var name: String
// used by fluent internally
    var exists: Bool = false

    init(name: String, address:String){
        self.id = nil
        self.name = name
        self.address = address
    }
    init(node: Node, in context: Context) throws {      //(2)
        id = try node.extract("id")
        name = try node.extract("name")
        address = try node.extract("address")
    }

    func makeNode(context: Context) throws -> Node {    //(3)
        return try Node(node: [
            "id": id,
            "name": name,
            "address": address
        ])
    }
}

extension Store: Preparation {                       // (4)
    static func prepare(_ database: Database) throws {
        // try database.create("stores") { stores in
        //     stores.id()
        //     stores.string("name")
        //     stores.string("address")
        // }
    }

    static func revert(_ database: Database) throws {   //(5)
        //try database.delete("stores")
    }
}
