
public struct ConversationCreate: Codable, Equatable {
    public let title: String
    public let type: ConversationType
    public let opponentPhoneNumber: String
    
    public init(
        title: String,
        type: ConversationType,
        opponentPhoneNumber: String
    ) {
        self.title = title
        self.type = type
        self.opponentPhoneNumber = opponentPhoneNumber
    }
}
