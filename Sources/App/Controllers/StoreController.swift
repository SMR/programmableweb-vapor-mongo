import Vapor
import HTTP

final class StoreController: ResourceRepresentable {
    typealias Item = Store

    func index(request: Request) throws -> ResponseRepresentable {
        return try Store.all().makeNode().converted(to: JSON.self)
    }

    func show(request: Request, item store: Store) throws -> ResponseRepresentable {
          return try Store.all().makeNode().converted(to: JSON.self)

    }

    func makeResource() -> Resource<Store > {
        return Resource(
            index: index,            
            show: show
        )
    }


}

extension Request {
    func store() throws -> Store {
        guard let json = json else { throw Abort.badRequest }
        return try Store(node: json)
    }
}

