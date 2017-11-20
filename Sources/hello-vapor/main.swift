import Vapor
import JSON

let drop = try Droplet()

drop.get("hello-vapor") { req in
  return "Hello Vapor"
}

drop.get("gethtml") { req in
    return try drop.view.make("index.html")
}

drop.get("lversion") { req in
    var json = JSON()
    try json.set("version", 1.0)
    try json.set("lv-learn", 1.1)
    return json
}

drop.post("sendjson") { req in
    guard let nome = req.json?["nome"]?.string else {
        throw Abort(.badRequest)
    }
    guard let pai = req.json?["pai"]?.string else {
        throw Abort(.badRequest)
    }

    return "Olá, \(nome), filho de \(pai)!"
}

try drop.run()