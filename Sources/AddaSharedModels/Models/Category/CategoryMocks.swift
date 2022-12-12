

import BSON

extension CreateCategory {
    static public var exploreAreaDraff: CreateCategory = .init(name: "explore area")
    static public var runningDraff: CreateCategory = .init(name: "running")
    static public var walkAroundDraff: CreateCategory = .init(name: "walk around")
    static public var lookingForAcompanyDraff: CreateCategory = .init(name: "looking for acompany")
}

extension CategoryResponse {
    static public var walkAroundDraff: CategoryResponse = .init(
        id: ObjectId(),
        name: CreateCategory.walkAroundDraff.name, url: .home
    )
    
    static public var runningDraff: CategoryResponse = .init(
        id: ObjectId(),
        name: CreateCategory.runningDraff.name, url: .home
    )
    
    static public var exploreAreaDraff: CategoryResponse = .init(
        id: ObjectId(),
        name: CreateCategory.exploreAreaDraff.name, url: .home
    )
    
    static public var lookingForAcompanyDraff: CategoryResponse = .init(
        id: ObjectId(),
        name: CreateCategory.lookingForAcompanyDraff.name, url: .home
    )
}

extension CategoriesResponse {
    static public var draff: CategoriesResponse = .init(
        categories: [.walkAroundDraff, .runningDraff, .exploreAreaDraff, .lookingForAcompanyDraff]
    )
}
