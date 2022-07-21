public enum GeoType: String {
    case Point
    case LineString
    case Polygon
    case MultiPoint
    case MultiLineString
    case MultiPolygon
    case GeometryCollection
}
extension GeoType: Codable {}
