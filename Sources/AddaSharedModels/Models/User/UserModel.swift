
#if os(macOS) || os(Linux)
import Vapor
import Fluent
import FluentMongoDriver

public final class User: Model, Hashable {
  
  public static var schema = "users"
  
  public init() {}
  
    public init(
            id: ObjectId? = nil,
            phoneNumber: String,
            firstName: String? = nil,
            lastName: String? = nil,
            avatar: String? = "",
            email: String? = nil,
            contacts: [Contact] = [],
            devices: [Device] = [],
            events: [Event] = [],
            senders: [Message] = [],
            recipients: [Message] = [],
            attachments: [Attachment] = []
        ) {
            self.id = id
            self.phoneNumber = phoneNumber
            self.firstName = firstName
            self.lastName = lastName
            self.email = email
            self.$contacts.value = contacts
            self.$devices.value = devices
            self.$events.value = events
            self.$senders.value = senders
            self.$recipients.value = recipients
            self.$attachments.value = attachments
        }
  
  @ID(custom: "id") public var id: ObjectId?
  @Field(key: "phoneNumber") public var phoneNumber: String
  
  @OptionalField(key: "firstName") public var firstName: String?
  @OptionalField(key: "lastName") public var lastName: String?
  @OptionalField(key: "email") public var email: String?
  
  @Children(for: \.$user) public var contacts: [Contact]
  @Children(for: \.$user) public var devices: [Device]
  @Children(for: \.$owner) public var events: [Event]
  @Children(for: \.$sender) public var senders: [Message]
  @Children(for: \.$recipient) public var recipients: [Message]
  @Children(for: \.$user) public var attachments: [Attachment]
  
  @Siblings(through: UserConversation.self, from: \.$member, to: \.$conversation)
  public var memberConversaions: [Conversation]
  
  @Siblings(through: UserConversation.self, from: \.$admin, to: \.$conversation)
  public var adminConversations: [Conversation]
  
  @Timestamp(key: "createdAt", on: .create) public var createdAt: Date?
  @Timestamp(key: "updatedAt", on: .update) public var updatedAt: Date?
  @Timestamp(key: "deletedAt", on: .delete) public var deletedAt: Date?
  
}

extension User {
    public func hash(into hasher: inout Hasher) {
      hasher.combine(id)
    }
    
    public static func == (lhs: User, rhs: User) -> Bool {
      lhs.id == rhs.id
    }
}

extension User {
  public var amConversations: [Conversation] {
    return self.adminConversations + self.memberConversaions
  }
  
  public var response: UserOutput { .init(self) }
}

extension User {
    func oneToOneConversastionTitle() -> String {
        let fName = self.firstName ?? ""
        let lName = self.lastName ?? ""
        
       return self.firstName == nil && self.lastName == nil
        ? self.phoneNumber
        : fName + " " + lName
    }
}

extension UserOutput: Content {}

extension UserOutput {
    public init(_ user: User) {
        self.id = user.id
        self.firstName = user.firstName
        self.lastName = user.lastName
        self.email = user.email
        self.phoneNumber = user.phoneNumber
        self.attachments = user.attachments.map { $0.response }
        self.createdAt = user.createdAt
        self.updatedAt = user.updatedAt
        self.deletedAt = user.deletedAt
        self.url = .home
    }
}

#endif
