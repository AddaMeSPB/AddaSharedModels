#if os(iOS)

import MapKit

public struct CoordinateRegion: Equatable {
  public var center: CLLocationCoordinate2D
  public var span: MKCoordinateSpan

  public init(
    center: CLLocationCoordinate2D,
    span: MKCoordinateSpan
  ) {
    self.center = center
    self.span = span
  }

  public init(coordinateRegion: MKCoordinateRegion) {
    self.center = coordinateRegion.center
    self.span = coordinateRegion.span
  }

  public var asMKCoordinateRegion: MKCoordinateRegion {
    .init(center: self.center, span: self.span)
  }

  public static func == (lhs: Self, rhs: Self) -> Bool {
    lhs.center.latitude == rhs.center.latitude
      && lhs.center.longitude == rhs.center.longitude
      && lhs.span.latitudeDelta == rhs.span.latitudeDelta
      && lhs.span.longitudeDelta == rhs.span.longitudeDelta
  }
}


extension CoordinateRegion: Hashable {
    /// hashable not complete here do it!
    public func hash(into hasher: inout Hasher) {
        hasher.combine(center)
    }
}

extension CLLocationCoordinate2D: Hashable {
    public func hash(into hasher: inout Hasher) {
        hasher.combine(longitude)
        hasher.combine(latitude)
    }
}
#endif
