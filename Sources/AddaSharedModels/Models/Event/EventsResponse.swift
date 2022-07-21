// MARK: - EventResponse

public struct EventsResponse: Codable {
  
  public let items: [EventResponse]
  public var metadata: Metadata = .init(per: 10, total: 10, page: 1)

  public init(
    items: [EventResponse],
    metadata: Metadata = .init(per: 10, total: 10, page: 1)
  ) {
    self.items = items
    self.metadata = metadata
  }
    
}

extension EventsResponse: Equatable {
    public static func == (lhs: EventsResponse, rhs: EventsResponse) -> Bool {
      return lhs.items == rhs.items && lhs.metadata == rhs.metadata
    }
}
