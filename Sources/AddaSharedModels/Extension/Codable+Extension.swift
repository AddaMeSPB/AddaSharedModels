import Foundation

extension Encodable {
    public var jsonData: Data? {
        let encoder = JSONEncoder()
        encoder.dateEncodingStrategy = .iso8601
        do {
            return try encoder.encode(self)
        } catch {
            debugPrint("\(error)")
            return nil
        }
    }
    
    public var jsonString: String? {
        guard let data = self.jsonData else { return nil }
        return String(data: data, encoding: .utf8)
    }
}



extension Decodable {
    
    static public func from(json: String, using encoding: String.Encoding = .utf8) -> Self? {
        guard let data = json.data(using: encoding) else { return nil }
        return Self.from(data: data)
    }
    
    static public func from(data: Data) -> Self? {
        
        do {
            return try JSONDecoder().decode(Self.self, from: data)
        } catch {
            debugPrint("\(error)")
            return nil
        }
    }
    
    static public func decode(json: String, using usingForWebRtcingEncoding: String.Encoding = .utf8) -> Self? {
        guard let data = json.data(using: usingForWebRtcingEncoding) else { return nil }
        return Self.decode(data: data)
    }
    
    static public func decode(data usingForWebRtcingData: Data) -> Self? {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        
        do {
            return try decoder.decode(Self.self, from: usingForWebRtcingData)
        } catch {
            debugPrint("\(error)")
            return nil
        }
    }
}


