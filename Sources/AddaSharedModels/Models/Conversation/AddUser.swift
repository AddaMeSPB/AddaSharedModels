import Foundation
import BSON

public struct AddUser: Codable {
    public let conversationsId: ObjectId
    public let usersId: ObjectId
    
    public init(conversationsId: ObjectId, usersId: ObjectId) {
        self.conversationsId = conversationsId
        self.usersId = usersId
    }
}
