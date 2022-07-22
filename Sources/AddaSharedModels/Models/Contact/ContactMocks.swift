import BSON

extension ContactInPut {

    static public let contact1 = ContactInPut(
        userId: UserOutput.withNumber.id!,
        identifier: "BBBA81AD-2D3F-4786-AA1D-7D2E654126B1",
        phoneNumber: "+79218821217",
        fullName: "Alif7",
        avatar:
            "https://adda.nyc3.digitaloceanspaces.com/uploads/images/5fabb05d2470c17919b3c0e2/5fabb05d2470c17919b3c0e2_1605792619988.jpeg",
        isRegister: true
    )
    
    static public let contact2 = ContactInPut(
        userId: UserOutput.withFirstName.id!,
        identifier: "BBBA81AD-2D3F-4786-AA1D-7D2E654126B1",
        phoneNumber: "+79218821217",
        fullName: "Alif7",
        avatar:
            "https://adda.nyc3.digitaloceanspaces.com/uploads/images/5fabb05d2470c17919b3c0e2/5fabb05d2470c17919b3c0e2_1605792619988.jpeg",
        isRegister: true
    )
    
    static public let contact3 = ContactInPut(
        userId: UserOutput.withLastName.id!,
        identifier: "BBBA81AD-2D3F-4786-AA1D-7D2E654126B1",
        phoneNumber: "+79218821217",
        fullName: "Alif7",
        avatar:
            "https://adda.nyc3.digitaloceanspaces.com/uploads/images/5fabb05d2470c17919b3c0e2/5fabb05d2470c17919b3c0e2_1605792619988.jpeg",
        isRegister: true
    )
    
    static public let contactsMock: [ContactInPut] = [.contact1, .contact2, .contact3]
}

extension ContactOutPut {

    static public let contact1 = ContactOutPut(
        id: ObjectId("5faea05b717a5064845accb5")!,
        userId: UserOutput.withNumber.id!,
        identifier: "BBBA81AD-2D3F-4786-AA1D-7D2E654126B1",
        phoneNumber: "+79218821217",
        fullName: "Alif7",
        avatar:
            "https://adda.nyc3.digitaloceanspaces.com/uploads/images/5fabb05d2470c17919b3c0e2/5fabb05d2470c17919b3c0e2_1605792619988.jpeg",
        isRegister: true
    )
    
    static public let contact2 = ContactOutPut(
        id: ObjectId("5faea05b717a5064845accb5")!,
        userId: UserOutput.withFirstName.id!,
        identifier: "BBBA81AD-2D3F-4786-AA1D-7D2E654126B1",
        phoneNumber: "+79218821217",
        fullName: "Alif7",
        avatar:
            "https://adda.nyc3.digitaloceanspaces.com/uploads/images/5fabb05d2470c17919b3c0e2/5fabb05d2470c17919b3c0e2_1605792619988.jpeg",
        isRegister: true
    )
    
    static public let contact3 = ContactOutPut(
        id: ObjectId("5faea05b717a5064845accb5")!,
        userId: UserOutput.withLastName.id!,
        identifier: "BBBA81AD-2D3F-4786-AA1D-7D2E654126B1",
        phoneNumber: "+79218821217",
        fullName: "Alif7",
        avatar:
            "https://adda.nyc3.digitaloceanspaces.com/uploads/images/5fabb05d2470c17919b3c0e2/5fabb05d2470c17919b3c0e2_1605792619988.jpeg",
        isRegister: true
    )
    
    static public let contactsMock: [ContactOutPut] = [.contact1, .contact2, .contact3]
}

