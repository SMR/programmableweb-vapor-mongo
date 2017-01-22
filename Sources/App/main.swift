import Vapor
import Fluent
import VaporMongo


let drop = Droplet(
    providers: [VaporMongo.Provider.self]
)

drop.get { req in
    return try drop.view.make("welcome", [
    	"message": drop.localization[req.lang, "welcome", "title"]
    ])
}
drop.preparations.append(Store.self)
drop.resource("stores", StoreController())

drop.run()
