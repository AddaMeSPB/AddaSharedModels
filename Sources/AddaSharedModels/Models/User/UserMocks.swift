import Foundation
import BSON

extension UserOutput {
    static public let withFirstName = UserOutput(
      id: ObjectId("5fabb1ebaa5f5774ccfe48c3"),
      firstName: "Alif",
      phoneNumber: "+79210000001",
      url: .home,
      createdAt: Date(),
      updatedAt: Date()
    )
    
    static public let withLastName = UserOutput(
      id: ObjectId("5fabb05d2470c17919b3c0e2"),
      lastName: "Masum",
      phoneNumber: "+79210000002",
      url: .home,
      createdAt: Date(),
      updatedAt: Date()
    )
    
    static public let withNumber = UserOutput(
      id: ObjectId("5fabb247ed7445b70914d0c9"),
      phoneNumber: "+79210000003",
      url: .home,
      createdAt: Date(),
      updatedAt: Date()
    )
    
    static public var withAttachments = UserOutput(
      id: ObjectId("5fabb05d2470c17919b3c0e2"),
      phoneNumber: "+79210000004",
      attachments: [
        .image1, .image2, .image3, .image4
      ],
      url: .home,
      createdAt: Date(), updatedAt: Date()
    )
    
    static public var usersMock: [UserOutput] = [.withFirstName, .withLastName, .withNumber, .withAttachments]

}
