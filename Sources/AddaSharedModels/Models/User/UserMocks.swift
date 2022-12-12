import Foundation
import BSON

extension UserOutput {
    static public let withFirstName = UserOutput(
        id: ObjectId("5fabb1ebaa5f5774ccfe48c3")!,
      fullName: "Demo",
      role: .basic,
      language: .russian,
      url: .home,
      createdAt: Date(),
      updatedAt: Date()
    )
    
    static public let withLastName = UserOutput(
        id: ObjectId("5fabb05d2470c17919b3c0e2")!,
      fullName: "Masum",
      role: .basic,
      language: .russian,
      url: .home,
      createdAt: Date(),
      updatedAt: Date()
    )
    
    static public let withNumber = UserOutput(
        id: ObjectId("5fabb247ed7445b70914d0c9")!,
      fullName: "+79210000003",
      role: .basic,
      language: .russian,
      url: .home,
      createdAt: Date(),
      updatedAt: Date()
    )
    
    static public var withAttachments = UserOutput(
        id: ObjectId("5fabb05d2470c17919b3c0e2")!,
      fullName: "+79210000004",
      role: .basic,
      language: .russian,
      attachments: [
        .image1, .image2, .image3, .image4
      ],
      url: .home,
      createdAt: Date(), updatedAt: Date()
    )
    
    static public var usersMock: [UserOutput] = [.withFirstName, .withLastName, .withNumber, .withAttachments]

}
