import Vapor

/// Controls basic CRUD operations on `Todo`s.
final class TodoController {
    /// Returns a list of all `Todo`s.
    func index(_ req: Request) throws -> Future<[Todo]> {
        return Todo.query(on: req).all()
    }

    /// Saves a decoded `Todo` to the database.
    func create(_ req: Request) throws -> Future<Todo> {
        return try req.content.decode(Todo.self).flatMap { todo in
            return todo.save(on: req)
        }
    }
    
    func update(_ req: Request) throws -> Future<Todo> {
        return try req.parameters.next(Todo.self).flatMap { existing in
            return try req.content.decode(Todo.self).flatMap { incoming in
                existing.title = incoming.title
                existing.details = incoming.details
                existing.category = incoming.category
                existing.completed = incoming.completed
                existing.priority = incoming.priority
                return existing.save(on: req)
            }
        }
    }

    /// Deletes a parameterized `Todo`.
    func delete(_ req: Request) throws -> Future<HTTPStatus> {
        return try req.parameters.next(Todo.self).flatMap { todo in
            return todo.delete(on: req)
        }.transform(to: .ok)
    }

}
