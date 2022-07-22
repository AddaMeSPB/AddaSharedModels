import Foundation

extension URL {
    static public var home: URL {
        return .init(string: "http://0.0.0.0:8080")!
    }
    
    static public var empty: URL = .init(string: "")!
}

