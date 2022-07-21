
#if os(macOS) || os(Linux)
@testable import AddaSharedModels
import Fluent

extension AddaSharedModels.Category {
    public static func create(
        name: String,
        database: Database
    ) throws -> Category {
        let category = Category(name: name)
        try category.save(on: database).wait()
        return category
    }
}

#endif
