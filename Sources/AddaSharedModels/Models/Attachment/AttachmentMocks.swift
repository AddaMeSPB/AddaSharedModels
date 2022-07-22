import Foundation
import BSON

extension AttachmentInOutPut {
    static public var image1: AttachmentInOutPut = .init(
      id: ObjectId("5fb6736c1432f950f8ea2d33"),
      type: .image,
      userId: UserOutput.withFirstName.id,
      imageUrlString:
        "https://adda.nyc3.digitaloceanspaces.com/uploads/images/5fabb05d2470c17919b3c0e2/5fabb05d2470c17919b3c0e2_1605792619988.jpeg",
      audioUrlString: nil,
      videoUrlString: nil,
      fileUrlString: nil,
      createdAt: nil,
      updatedAt: nil
    )
                      
    static public var image2: AttachmentInOutPut = .init(
      id: ObjectId("5fb681d6fb999dc956323a05"),
      type: .image,
      userId: UserOutput.withFirstName.id,
      imageUrlString:
        "https://adda.nyc3.digitaloceanspaces.com/uploads/images/5fabb1ebaa5f5774ccfe48c3/1605876343603.jpeg",
      audioUrlString: nil, videoUrlString: nil, fileUrlString: nil, createdAt: nil, updatedAt: nil)

    static public var image3: AttachmentInOutPut = .init(
      id: ObjectId("5fb6bba4d62847cc58a5218a"),
      type: .image,
      userId: UserOutput.withNumber.id,
      imageUrlString:
        "https://adda.nyc3.digitaloceanspaces.com/uploads/images/5fabb05d2470c17919b3c0e2/1605811106589.jpeg",
      createdAt: nil, updatedAt: nil
    )

    static public var image4: AttachmentInOutPut = .init(
      id: ObjectId("5fb6bc48d63734254b0eb777"),
      type: .image,
      userId: UserOutput.withNumber.id,
      imageUrlString:
        "https://adda.nyc3.digitaloceanspaces.com/uploads/images/5fabb05d2470c17919b3c0e2/1605811270871.jpeg",
      fileUrlString: nil,
      createdAt: nil, updatedAt: nil
    )
    
    
//    Attachment(
//      id: "5fb7b5e0d54eaebe3d264ace", type: .image, userId: "5fabb05d2470c17919b3c0e2",
//      imageUrlString:
//        "https://adda.nyc3.digitaloceanspaces.com/uploads/images/5fabb05d2470c17919b3c0e2/1605875164101.heic",
//      audioUrlString: nil, videoUrlString: nil, fileUrlString: nil, createdAt: nil, updatedAt: nil),
//    Attachment(
//      id: "5fce0931ed6264cb3536a7cb", type: .image, userId: "5fabb05d2470c17919b3c0e2",
//      imageUrlString:
//        "https://adda.nyc3.digitaloceanspaces.com/uploads/images/5fabb05d2470c17919b3c0e2/1607338279849.heic",
//      audioUrlString: nil, videoUrlString: nil, fileUrlString: nil, createdAt: nil, updatedAt: nil),
//    Attachment(
//      id: "5fce094221b4a84f64924bf3", type: .image, userId: "5fabb05d2470c17919b3c0e2",
//      imageUrlString:
//        "https://adda.nyc3.digitaloceanspaces.com/uploads/images/5fabb05d2470c17919b3c0e2/1607338304864.heic",
//      audioUrlString: nil, videoUrlString: nil, fileUrlString: nil, createdAt: nil, updatedAt: nil),
}
