//
//  Attachment.swift
//  
//
//  Created by Saroar Khandoker on 19.11.2020.
//

import Foundation
import Vapor
import Fluent
import FluentMongoDriver

public enum AttachmentType: String, Codable {
  case file, image, audio, video
}

public final class Attachment: Model, Content {
  
  public static var schema = "attachments"

  public init() {}
  
  public init(id: ObjectId? = nil, type: AttachmentType = .image, userId: User.IDValue?, imageUrlString: String? = nil, audioUrlString: String? = nil, videoUrlString: String? = nil, fileUrlString: String? = nil)  {
    self.id = id
    self.type = type
    self.$user.id = userId
    self.imageUrlString = imageUrlString
    self.audioUrlString = audioUrlString
    self.videoUrlString = videoUrlString
    self.fileUrlString = fileUrlString
  }
  
  @ID(custom: "id") public var id: ObjectId?
  @Field(key: "type") public var type: AttachmentType
  
  @OptionalParent(key: "userId") public var user: User?
  
  @OptionalField(key: "imageUrlString") public var imageUrlString: String?
  @OptionalField(key: "audioUrlString") public var audioUrlString: String?
  @OptionalField(key: "videoUrlString") public var videoUrlString: String?
  @OptionalField(key: "fileUrlString") public var fileUrlString: String?
  
  @Timestamp(key: "createdAt", on: .create) public var createdAt: Date?
  @Timestamp(key: "updatedAt", on: .update) public var updatedAt: Date?
  @Timestamp(key: "deletedAt", on: .delete) public var deletedAt: Date?
  
}

extension Attachment {
  public var response: ReqRes {
    .init(self)
  }
  
  public struct ReqRes: Content {
    public init(_ attachment: Attachment) {
      self.id = attachment.id
      self.type = attachment.type
      self.userId = attachment.$user.id
      self.imageUrlString = attachment.imageUrlString
      self.audioUrlString = attachment.audioUrlString
      self.videoUrlString = attachment.videoUrlString
      self.fileUrlString = attachment.fileUrlString
    }
    
    public var id: ObjectId?
    public var type: AttachmentType
    public var userId: ObjectId?
    public var imageUrlString: String?
    public var audioUrlString: String?
    public var videoUrlString: String?
    public var fileUrlString: String?
  }
  
}

