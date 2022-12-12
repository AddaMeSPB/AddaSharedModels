
public struct EventPage {
    /// The page's items. Usually models.
    public let items: [EventResponse]

    /// Metadata containing information about current page, items per page, and total items.
    public let metadata: PageMetadataResponse

    /// Creates a new `Page`.
    public init(items: [EventResponse], metadata: PageMetadataResponse) {
        self.items = items
        self.metadata = metadata
    }
}

/// Metadata for a given `Page`.
public struct PageMetadataResponse: Codable {
    /// Current page number. Starts at `1`.
    public let page: Int

    /// Max items per page.
    public let per: Int

    /// Total number of items available.
    public let total: Int

    /// Computed total number of pages with `1` being the minimum.
    public var pageCount: Int {
        let count = Int((Double(self.total)/Double(self.per)).rounded(.up))
        return count < 1 ? 1 : count
    }

    /// Creates a new `PageMetadata` instance.
    ///
    /// - Parameters:
    ///.  - page: Current page number.
    ///.  - per: Max items per page.
    ///.  - total: Total number of items available.
    public init(page: Int, per: Int, total: Int) {
        self.page = page
        self.per = per
        self.total = total
    }
}
