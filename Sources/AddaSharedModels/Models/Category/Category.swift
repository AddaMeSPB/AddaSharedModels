//
//  Category.swift
//  
//
//  Created by Saroar Khandoker on 15.07.2022.
//

import Foundation
import MongoKitten

public struct CreateCategory: Codable {
    public let name: String
    
    public init(name: String) {
        self.name = name
    }
}

extension CreateCategory: Equatable {}


public struct CategoryResponse: Codable {
    public let id: ObjectId?
    public let name: String
    public let url: URL
    
    public init(id: ObjectId? = nil, name: String, url: URL) {
        self.id = id
        self.name = name
        self.url = url
    }
}

extension CategoryResponse: Equatable {}

public struct CategoriesResponse: Codable {

    public let categories: [CategoryResponse]
    public let url: URL
    
    public init(categories: [CategoryResponse], url: URL) {
        self.categories = categories
        self.url = url
    }

}

extension CategoriesResponse: Equatable {
    public static func == (lhs: CategoriesResponse, rhs: CategoriesResponse) -> Bool {
        return lhs.categories == rhs.categories
        && lhs.url == rhs.url
    }
}
//
//func usersHandler(
//  request: Request,
//  route: UsersRoute
//) async throws -> AsyncResponseEncodable {
//  switch route {
//  case .create(_):
//    return [String: String]()
//  case let .user(userId, route):
//    return try await userHandler(request: request, userId: userId, route: route)
//  }
//}
//
//func userHandler(
//  request: Request,
//  userId: Int,
//  route: UserRoute
//) async throws -> AsyncResponseEncodable {
//  switch route {
//  case let .books(route):
//    return try await booksHandler(request: request, userId: userId, route: route)
//  case .fetch:
//    return UserResponse(
//      id: userId,
//      name: "Blob \(userId)",
//      booksURL: request.application.router
//        .url(for: .users(.user(userId, .books())))
//    )
//  }
//}
