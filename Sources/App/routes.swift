import Vapor
import FluentSQLite

/// Register your application's routes here.
public func routes(_ router: Router) throws {
    print(router)
    // Basic "It works" example
    router.get { req in
        return "It works!"
    }
    
    // Basic "Hello, world!" example
    router.get("hello") { req in
        return "Hello, world!"
    }

    // Example of configuring a controller
    let todoController = TodoController()
    router.get("api/todos", use: todoController.index)
    router.post("api/todos", use: todoController.create)
    router.put("api/todos", Todo.parameter, use: todoController.update)
    router.delete("api/todos", Todo.parameter, use: todoController.delete)
}