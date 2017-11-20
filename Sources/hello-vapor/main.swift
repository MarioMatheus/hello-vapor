import Vapor

let drop = try Droplet()

drop.get("hello-vapor") { req in
  return "Hello Vapor"
}

drop.get("html") { req in
    return try drop.view.make("index.html")
}

try drop.run()