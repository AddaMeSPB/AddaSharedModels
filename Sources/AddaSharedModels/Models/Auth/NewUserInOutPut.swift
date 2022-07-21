//
//  File.swift
//  
//
//  Created by Saroar Khandoker on 18.07.2022.
//

#if os(macOS)
import Vapor

extension NewUserInOutPut: Content {}

#endif

import MongoKitten

struct NewUserInOutPut: Codable {
    let id: ObjectId?
    let firstName, lastName: String?
    let phoneNumber: String
}
