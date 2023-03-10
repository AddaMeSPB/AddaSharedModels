import Foundation
import BSON

extension DeviceInOutPut {
    static public let empty: DeviceInOutPut = .init(name: "", pushToken: "", voipToken: "")
    
    static public let draff: DeviceInOutPut = .init(
        id: ObjectId("5fc4e85f7557200b8c8f0dfb"),
        ownerId: ObjectId("5fabb1ebaa5f5774ccfe48c3"),
        name: "iPhone",
        model: "iPhone",
        osVersion: "14.2",
        pushToken: "58ca32667055d845b8db0b2a5b7a7684af6960d6af8f7ac89a558ec1dd72c4a0",
        voipToken: "c8117f3f9d0902850e7c7b84ab0082aa995c2fd1e8873a698cc0dd3e2661912c",
        createdAt: Date(), updatedAt: Date()
    )
}
