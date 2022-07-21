//
//  EventEngineRoute.swift
//  
//
//  Created by Saroar Khandoker on 20.07.2022.
//

import Foundation
import URLRouting
import Vapor

public enum EventEngineRoute: Equatable {
    case events(EventsRoute)
    case categories(CategoriesRoute)
}

public let eventEngineRouter = OneOf {
    Route(.case(EventEngineRoute.events)) {
        Path { "events" }
        eventsRouter
    }
    
    Route(.case(EventEngineRoute.categories)) {
        Path { "categories" }
        categoriesRouter
    }
}
