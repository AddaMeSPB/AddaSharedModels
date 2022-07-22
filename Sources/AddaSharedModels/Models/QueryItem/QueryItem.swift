//
//  QueryItem.swift
//
//
//  Created by Saroar Khandoker on 23.02.2021.
//

import Foundation

public struct QueryItem: Codable {
  public init(
    page: Int = 1,
    per: Int = 10
  ) {
    self.page = page
    self.per = per
  }

  public var page: Int = 1
  public var per: Int = 10

  public var parameters: [String: Any] {
    let mirror = Mirror(reflecting: self)
    let dict = Dictionary(
      uniqueKeysWithValues: mirror.children.lazy.map {
        (label: String?, value: Any) -> (String, Any)? in
        guard let label = label else { return nil }
        return (label, value)
      }.compactMap { $0 })
    return dict
  }

  public var queryItem: [URLQueryItem] {
    let mirror = Mirror(reflecting: self)
    return mirror.children.compactMap { name, value -> URLQueryItem? in
      guard let name = name else { return nil }
      return URLQueryItem(name: name, value: "\(value)")
    }
  }
}

extension QueryItem: Equatable {}
