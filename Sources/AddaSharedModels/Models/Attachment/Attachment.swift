//
//  Attachment.swift
//  
//
//  Created by Saroar Khandoker on 19.11.2020.
//

import Foundation
import MongoKitten

public enum AttachmentType: String, Codable {
    case file, image, audio, video
}

public struct AttachmentInOutPut: Codable, Equatable {
    
    public var id: ObjectId?
    public var type: AttachmentType
    public var userId: ObjectId?
    public var imageUrlString: String?
    public var audioUrlString: String?
    public var videoUrlString: String?
    public var fileUrlString: String?
    public var createdAt: Date?
    public var updatedAt: Date?
    public var deletedAt: Date?
    
    public init(
        id: ObjectId? = nil,
        type: AttachmentType,
        userId: ObjectId? = nil,
        imageUrlString: String? = nil,
        audioUrlString: String? = nil,
        videoUrlString: String? = nil,
        fileUrlString: String? = nil,
        createdAt: Date? = nil,
        updatedAt: Date? = nil,
        deletedAt: Date? = nil
    ) {
        self.id = id
        self.type = type
        self.userId = userId
        self.imageUrlString = imageUrlString
        self.audioUrlString = audioUrlString
        self.videoUrlString = videoUrlString
        self.fileUrlString = fileUrlString
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.deletedAt = deletedAt
    }
    
    public static func < (lhs: AttachmentInOutPut, rhs: AttachmentInOutPut) -> Bool {
        guard let lhsDate = lhs.updatedAt, let rhsDate = rhs.createdAt else { return false }
        return lhsDate > rhsDate
    }
}

extension AttachmentInOutPut: Hashable {}
