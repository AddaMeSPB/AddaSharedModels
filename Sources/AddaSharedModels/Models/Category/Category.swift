//
//  Category.swift
//  
//
//  Created by Saroar Khandoker on 15.07.2022.
//

import Foundation
import BSON

public struct CreateCategory: Codable {
    public let name: String
    
    public init(name: String) {
        self.name = name
    }
}

extension CreateCategory: Equatable {}

public struct CategoryResponse: Codable {
    public var id: ObjectId
    public var name: String
    public var url: URL
    
    public init(id: ObjectId, name: String, url: URL) {
        self.id = id
        self.name = name
        self.url = url
    }
}

extension CategoryResponse: Equatable {}

public struct CategoriesResponse: Codable {

    public let categories: [CategoryResponse]
    
    public init(categories: [CategoryResponse]) {
        self.categories = categories
    }

}

extension CategoriesResponse: Equatable {
    public static func == (lhs: CategoriesResponse, rhs: CategoriesResponse) -> Bool {
        return lhs.categories == rhs.categories
    }
}
