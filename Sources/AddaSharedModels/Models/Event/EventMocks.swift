extension EventsResponse {
    public static let emptry = Self(
      items: [],
      metadata: .init(per: 0, total: 0, page: 0)
    )
}
