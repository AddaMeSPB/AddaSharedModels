//
//  File.swift
//  
//
//  Created by Saroar Khandoker on 18.07.2022.
//

#if os(macOS) || os(Linux)
import Vapor

extension NewUserInOutPut: Content {}

#endif

import BSON

public struct NewUserInOutPut: Codable {
    public init(id: ObjectId?, firstName: String?, lastName: String?, phoneNumber: String) {
        self.id = id
        self.firstName = firstName
        self.lastName = lastName
        self.phoneNumber = phoneNumber
    }
    
    public let id: ObjectId?
    public let firstName, lastName: String?
    public let phoneNumber: String
}
