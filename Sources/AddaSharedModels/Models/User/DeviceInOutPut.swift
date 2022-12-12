import Foundation
import BSON

public struct DeviceInOutPut: Codable, Equatable, Hashable, Identifiable {
    public var id: ObjectId?
    public var ownerId: ObjectId?
    public var identifierForVendor: String?
    public var name: String
    public var model: String?
    public var osVersion: String?
    public var token: String
    public var voipToken: String
    public var createdAt, updatedAt, deletedAt: Date?
    
    public init(
        id: ObjectId? = nil,
        ownerId: ObjectId? = nil,
        identifierForVendor: String? = nil,
        name: String,
        model: String? = nil,
        osVersion: String? = nil,
        token: String,
        voipToken: String,
        createdAt: Date? = nil,
        updatedAt: Date? = nil,
        deletedAt: Date? = nil
    ) {
        self.id = id
        self.ownerId = ownerId
        self.identifierForVendor = identifierForVendor
        self.name = name
        self.model = model
        self.osVersion = osVersion
        self.token = token
        self.voipToken = voipToken
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.deletedAt = deletedAt
    }
}
