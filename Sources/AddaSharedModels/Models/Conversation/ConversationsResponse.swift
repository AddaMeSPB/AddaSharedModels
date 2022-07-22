
public struct ConversationsResponse: Codable, Equatable {
    public let items: [ConversationOutPut]
    public let metadata: Metadata
    
    public init(items: [ConversationOutPut], metadata: Metadata) {
        self.items = items
        self.metadata = metadata
    }
}
