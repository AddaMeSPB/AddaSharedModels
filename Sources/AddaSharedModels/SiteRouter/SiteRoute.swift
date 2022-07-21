//
//  SiteRputer.swift
//  
//
//  Created by Saroar Khandoker on 17.07.2022.
//

import Foundation
import URLRouting
import Vapor

public enum SiteRoute: Equatable {
    case aboutUs
    case contactUs
    case home
    case eventEngine(EventEngineRoute)
}

public let router = OneOf {
    Route(.case(SiteRoute.eventEngine)) {
        Path { "v1" }
        eventEngineRouter
    }
}
