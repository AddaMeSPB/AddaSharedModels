//
//  ChatOutGoingEvent.swift
//  
//
//  Created by Saroar Khandoker on 26.09.2020.
//

import Foundation

public enum ChatOutGoingEvent: Encodable, Decodable {
  
  case connect
  case disconnect
  case conversation(MessageItem)
  case message(MessageItem)
  case notice(String)
  case error(String)
  
  private enum CodingKeys: String, CodingKey {
    case type, user, message, conversation
  }
  
  enum CodingError: Error {
    case unknownValue
  }
  
  public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    let type = try container.decode(String.self, forKey: .type)
    
    switch type {
    case "connect":
      self = .connect
    case "disconnect":
      self = .disconnect
    case "message":
      let message = try container.decode(MessageItem.self, forKey: .message)
      self = .message(message)
    case "conversation":
      let conversation = try container.decode(MessageItem.self, forKey: .conversation)
      self = .conversation(conversation)
    case "notice":
      let notice = try container.decode(String.self, forKey: .message)
      self = .notice(notice)
    case "error":
      let error = try container.decode(String.self, forKey: .message)
      self = .error(error)
    default:
      throw CodingError.unknownValue
    }
  }
  
  public func encode(to encoder: Encoder) throws {
    var kvc = encoder.container(keyedBy: String.self)
    
    switch self {
    case .connect:
      try kvc.encode("connect", forKey: "type")
    case .disconnect:
      try kvc.encode("disconnect", forKey: "type")
    case .message(let message):
      try kvc.encode("message", forKey: "type")
      try kvc.encode(message, forKey: "message")
    case .conversation(let conversation):
      try kvc.encode("conversation", forKey: "type")
      try kvc.encode(conversation, forKey: "conversation")
    case .notice(let message):
      try kvc.encode("notice", forKey: "type")
      try kvc.encode(message, forKey: "message")
    case .error(let error):
      try kvc.encode("error", forKey: "type")
      try kvc.encode(error, forKey: "message")
    }
  }
  
}
