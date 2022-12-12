
#if os(iOS)
import CoreLocation
import MapKit

// MARK: - CLLocationCoordinate
extension CLLocationCoordinate2D: Equatable, Comparable {
  public static func < (lhs: CLLocationCoordinate2D, rhs: CLLocationCoordinate2D) -> Bool {
    return lhs.latitude < rhs.latitude && lhs.longitude < rhs.longitude
  }

  public static func == (lhs: Self, rhs: Self) -> Bool {
    return lhs.latitude == rhs.latitude && lhs.longitude == rhs.longitude
  }
}

extension CLLocation {
  var double: [Double] {
    return [coordinate.latitude, coordinate.longitude]
  }
}
#endif
