// MARK: - Metadata

public struct Metadata: Codable, Equatable {
  public let per, total, page: Int

  public init(per: Int, total: Int, page: Int) {
    self.per = per
    self.total = total
    self.page = page
  }
}
