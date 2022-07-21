import XCTest
@testable import AddaSharedModels

#if os(macOS)
import FluentMongoDriver
import Fluent

final class AddaSharedModelsTests: XCTestCase {
    func testExample() {
//        let user1 = User(phoneNumber: "+7921")
//        let user2 = User(phoneNumber: "+7922", firstName: "Alif")
//        let user3 = User(phoneNumber: "+7923", lastName: "Masum")
//        
//        let conversation = Conversation(id: ObjectId("62c8134c5f5baea558be6f12"), title: "", type: .oneToOne)
//        let uConversation1 = try! UserConversation(id: ObjectId("62c8134cbf9427e56b2c2f8f"), member: user2, admin: user2, conversation: conversation)
//        let uConversation2 = try! UserConversation(id: ObjectId("62c8134c7316a5629a7f2daf"), member: user1, admin: user1, conversation: conversation)
//        
//        
//        let uc = [uConversation1, uConversation2]
//            .filter { $0.member.id == user1.id }
//            .map {
//                let title = $0.title(user1, conversation: conversation)
//                print(title)
//            }
//        
        
//        XCTAssertEqual()
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
#endif

//{
//    "_id" : ObjectId("62c8134c5f5baea558be6f12"),
//    "title" : "Ulia Moscow Tonmmoy Frd",
//    "createdAt" : ISODate("2022-07-08T11:21:48.041Z"),
//    "updatedAt" : ISODate("2022-07-08T11:21:48.041Z"),
//    "type" : "oneToOne"
//}
//conversation

//{
//    "_id" : ObjectId("62c8134cbf9427e56b2c2f8f"),
//    "conversationId" : ObjectId("62c8134c5f5baea558be6f12"),
//    "memberId" : ObjectId("62c3d1fef463dc584e7e023e")
//}
//{
//    "_id" : ObjectId("62c8134c7316a5629a7f2daf"),
//    "conversationId" : ObjectId("62c8134c5f5baea558be6f12"),
//    "memberId" : ObjectId("62c333899570bb306623e9f0")
//}
// conversationUser
