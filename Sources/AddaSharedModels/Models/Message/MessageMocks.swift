//
//  File.swift
//  
//
//  Created by Saroar Khandoker on 07.08.2022.
//

import Foundation
import BSON

extension MessageItem {
    static public let messageItem1 = MessageItem(
        id: ObjectId("5f96c378d6b5590459f0cd68")!,
        conversationId: ObjectId("5f929515ba01cea941e2b2eb")!,
        messageBody: "Awesome 👏🏻", messageType: .text,
        isRead: true,
        isDelivered: true,
        sender: .withFirstName,
        recipient: nil,
        createdAt: Date(),
        updatedAt: Date(),
        deletedAt: nil
    )

    static public let messageItem2 = MessageItem(
        id: ObjectId("5f96c381396c401b86d6db68")!,
        conversationId: ObjectId("5f929515ba01cea941e2b2eb")!,
        messageBody: "Awesome 👏🏻", messageType: .text,
        isRead: true,
        isDelivered: true,
        sender: .withFirstName,
        recipient: nil,
        createdAt: Date(),
        updatedAt: Date(),
        deletedAt: nil
    )

    static public let messageItem3 = MessageItem(
        id: ObjectId("5f96c4141f59a5ec9a9f9f05")!,
        conversationId: ObjectId("5f929515ba01cea941e2b2eb")!,
        messageBody: "Awesome 👏🏻", messageType: .text,
        isRead: true,
        isDelivered: true,
        sender: .withLastName,
        recipient: nil,
        createdAt: Date(),
        updatedAt: Date(),
        deletedAt: nil
    )

    static public let messageItem4 = MessageItem(
        id: ObjectId("5f9712990430e512e7dbfe6b")!,
        conversationId: ObjectId("5f929515ba01cea941e2b2eb")!,
        messageBody: "Awesome 👏🏻", messageType: .text,
        isRead: true,
        isDelivered: true,
        sender: .withLastName,
        recipient: nil,
        createdAt: Date(),
        updatedAt: Date(),
        deletedAt: nil
    )

    static public let messageItem5 = MessageItem(
        id: ObjectId("5f9713d8c4b1856382b7bd86")!,
        conversationId: ObjectId("5f929515ba01cea941e2b2eb")!,
        messageBody: "Awesome 👏🏻", messageType: .text,
        isRead: true,
        isDelivered: true,
        sender: .withLastName,
        recipient: nil,
        createdAt: Date(),
        updatedAt: Date(),
        deletedAt: nil
    )

    static public let messageItem6 = MessageItem(
        id: ObjectId("5f9713d8c4b1856382b7bd86")!,
        conversationId: ObjectId("5f929515ba01cea941e2b2eb")!,
        messageBody: "Awesome 👏🏻", messageType: .text,
        isRead: true,
        isDelivered: true,
        sender: .withNumber,
        recipient: nil,
        createdAt: Date(),
        updatedAt: Date(),
        deletedAt: nil
    )
}

extension MessagePage {
    static public let draff: MessagePage = .init(
        items: [
            MessageItem.messageItem1, MessageItem.messageItem2,
            MessageItem.messageItem3, MessageItem.messageItem4,
            MessageItem.messageItem5, MessageItem.messageItem6,
        ],
      metadata: Metadata(per: 10, total: 6, page: 1)
    )
}
