//
//  CategoriesRouter.swift
//  
//
//  Created by Saroar Khandoker on 17.07.2022.
//

import Foundation
import URLRouting

public enum CategoryRoute: Equatable {
    case find
}

public let categoryRouter = OneOf {
    Route(.case(CategoryRoute.find))
}

public enum CategoriesRoute: Equatable {
    case create(inupt: CreateCategory)
    case list
    case update(inupt: CategoryResponse)
    case category(id: String, CategoryRoute = .find)
    case delete(id: String)
}

public let categoriesRouter = OneOf {
    
    Route(.case(CategoriesRoute.create)) {
        Method.post
        Body(.json(CreateCategory.self))
    }
    
    Route(.case(CategoriesRoute.category)) {
        Path { Parse(.string) }
        categoryRouter
    }
    
    Route(.case(CategoriesRoute.list))
    
    Route(.case(CategoriesRoute.update)) {
        Method.put
        Body(.json(CategoryResponse.self))
    }
    
    Route(.case(CategoriesRoute.delete)) {
        Method.delete
        Path { Parse(.string) }
    }
}
