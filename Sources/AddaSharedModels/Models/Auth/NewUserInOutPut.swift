
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
