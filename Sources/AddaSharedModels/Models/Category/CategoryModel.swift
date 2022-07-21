#if os(macOS) || os(Linux)
import Vapor
import Fluent
import FluentMongoDriver

public final class Category: Model {

    public static var schema = "categories"
    public init() {}
    
    public init(
        id: ObjectId? = nil,
        name: String
    ) {
        self.id = id
        self.name = name
    }
    
    @ID(custom: "id") public var id: ObjectId?
    @Field(key: "name") public var name: String
    @Children(for: \.$category) public var events: [Event]
    
    @Timestamp(key: "createdAt", on: .create) public var createdAt: Date?
    @Timestamp(key: "updatedAt", on: .update) public var updatedAt: Date?
    @Timestamp(key: "deletedAt", on: .delete) public var deletedAt: Date?
}

extension Category {
    public var response: CategoryResponse { .init(self) }
}

extension Category: Equatable {
    public static func == (lhs: Category, rhs: Category) -> Bool {
        return lhs.id == rhs.id && lhs.name == rhs.name
    }
}

extension CategoryResponse: Content {}

extension CategoryResponse {
    public init(_ category: Category) {
        self.id = category.id
        self.name = category.name
        self.url = .init(string: "https://0.0.0.0:8080/categories/\(category.id!.hexString)") ?? .empty
    }
}

extension CategoriesResponse: Content {}

#endif
