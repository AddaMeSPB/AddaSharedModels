//
//  CategoriesRouter.swift
//  
//
//  Created by Saroar Khandoker on 17.07.2022.
//

import Foundation
import URLRouting

public enum CategoriesRoute: Equatable {
    case create(CreateCategory)
    case list
    case update(Category)
    case delete(id: String)
}

public let categoriesRouter = OneOf {
    
    Route(.case(CategoriesRoute.create)) {
        Method.post
        Body(.json(CreateCategory.self))
    }
    
    Route(.case(CategoriesRoute.list))
    
    Route(.case(CategoriesRoute.update)) {
        Body(.json(Category.self))
    }
    
    Route(.case(CategoriesRoute.delete)) {
        Path { Parse(.string) }
    }
}
