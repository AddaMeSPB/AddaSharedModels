//
//  RefreshTokenInput
//  
//
//  Created by Alif on 7/6/20.
//

#if os(macOS)
import Vapor

struct RefreshTokenInput: Content {
    var refreshToken: String
}

#endif
