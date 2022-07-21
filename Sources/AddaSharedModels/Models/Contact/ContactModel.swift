#if os(macOS) || os(Linux)
import Vapor
import Fluent
import FluentMongoDriver

public final class Contact: Model {
  
  public static var schema = "contacts"
  
  public init() {}
  
  public init(id: ObjectId? = nil, phoneNumber: String, identifier: String, fullName: String? = nil, avatar: String? = nil, isRegister: Bool? = false, userId: User.IDValue) {
    self.id = id
    self.phoneNumber = phoneNumber
    self.identifier = identifier
    self.avatar = avatar
    self.fullName = fullName
    self.isRegister = isRegister
    self.$user.id = userId
  }
  
  @ID(custom: "id") public var id: ObjectId?
  @Field(key: "phoneNumber") public var phoneNumber: String
  @Field(key: "identifier") public var identifier: String
  @Field(key: "fullName") public var fullName: String?
  @Field(key: "avatar") public var avatar: String?
  @Field(key: "isRegister") public var isRegister: Bool?
  @Parent(key: "userId") public var user: User
  
  @Timestamp(key: "createdAt", on: .create) public var createdAt: Date?
  @Timestamp(key: "updatedAt", on: .update) public var updatedAt: Date?
  @Timestamp(key: "deletedAt", on: .delete) public var deletedAt: Date?
  
}

extension ContactInOutPut: Content {}

extension ContactInOutPut {
    public init(_ contact: Contact) {
      self.id = contact.id
      self.identifier = contact.identifier
      self.phoneNumber = contact.phoneNumber
      self.fullName = contact.fullName
      self.avatar = contact.avatar
      self.isRegister = contact.isRegister
      self.userId = contact.$user.id
    }
}

extension Contact: Hashable {
  public func hash(into hasher: inout Hasher) {
    hasher.combine(phoneNumber)
    hasher.combine(isRegister)
  }
  
  public static func ==(lhs: Contact, rhs: Contact) -> Bool {
    return lhs.phoneNumber == rhs.phoneNumber && lhs.isRegister == rhs.isRegister
  }
}

extension Contact {
    public var response: ContactInOutPut { .init(self) }
}

#endif
