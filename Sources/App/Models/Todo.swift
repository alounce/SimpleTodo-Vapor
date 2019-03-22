import FluentSQLite
import Vapor

/// A single entry of a Todo list.
final class Todo: SQLiteModel {
    var id: Int?

    var title: String
    var details: String
    var category: String
    var priority: Int
    var completed: Bool

    init(
        id: Int? = nil,
        title: String,
        details: String,
        category: String,
        priority: Int,
        completed: Bool) {
        
        self.id = id
        self.title = title
        self.details = details
        self.category = category
        self.priority = priority
        self.completed = completed
    }
}

/// Allows `Todo` to be used as a dynamic migration.
extension Todo: Migration { }

/// Allows `Todo` to be encoded to and decoded from HTTP messages.
extension Todo: Content { }

/// Allows `Todo` to be used as a dynamic parameter in route definitions.
extension Todo: Parameter { }
