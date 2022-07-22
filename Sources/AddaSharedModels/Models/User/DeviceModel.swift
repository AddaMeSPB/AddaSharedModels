//
//  File.swift
//  
//
//  Created by Saroar Khandoker on 29.11.2020.
//

#if os(macOS) || os(Linux)
import Vapor
import Fluent
import FluentMongoDriver

// `type` ENUM('APPLE') NOT NULL
public final class Device: Model {
    
    public static var schema = "devices"
    
    public init() {}
    
    public init(
        id: ObjectId? = nil,
        identifierForVendor: String? = nil,
        name: String,
        model: String? = nil,
        osVersion: String? = nil,
        token: String,
        voipToken: String,
        userId: User.IDValue? = nil
    ) {
        self.id = id
        self.identifierForVendor = identifierForVendor
        self.name = name
        self.model = model
        self.osVersion = osVersion
        self.token = token
        self.voipToken = voipToken
        self.$user.id = userId
    }
    
    @ID(custom: "id") public var id: ObjectId?
    
    @Field(key: "identifierForVendor") public var identifierForVendor: String?
    @Field(key: "name") public var name: String
    @OptionalField(key: "model") public var model: String?
    @OptionalField(key: "osVersion") public var osVersion: String?
    @Field(key: "token") public var token: String
    @Field(key: "voipToken") public var voipToken: String
    
    @OptionalParent(key: "ownerId") public var user: User?
    
    @Timestamp(key: "createdAt", on: .create) public var createdAt: Date?
    @Timestamp(key: "updatedAt", on: .update) public var updatedAt: Date?
    @Timestamp(key: "deletedAt", on: .delete) public var deletedAt: Date?
    
}

extension Device: Content {}

extension Device {
    
    public var res: DeviceInOutPut { .init(self) }

    public func update(_ input: DeviceInOutPut) async throws {
        self.$user.id = input.ownerId
        self.identifierForVendor = input.identifierForVendor
        self.name = input.name
        self.model = input.model
        self.osVersion = input.osVersion
        self.token = input.token
        self.voipToken = input.voipToken
    }

}

extension DeviceInOutPut: Content {
    public init(_ device: Device) {
        self.id = device.id
        self.ownerId = device.$user.id
        self.identifierForVendor = device.identifierForVendor
        self.name = device.name
        self.model = device.model
        self.osVersion = device.osVersion
        self.token = device.token
        self.voipToken = device.voipToken
        self.createdAt = device.createdAt
        self.updatedAt = device.updatedAt
        self.deletedAt = device.deletedAt
    }
}

#endif
