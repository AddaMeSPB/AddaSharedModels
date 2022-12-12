#if os(iOS)

import MapKit

public struct LocalSearchResponse: Equatable {
  public var boundingRegion: MKCoordinateRegion
  public var mapItems: [MapItem]

  public init(
    response: MKLocalSearch.Response
  ) {
    self.boundingRegion = response.boundingRegion
    self.mapItems = response.mapItems.map(MapItem.init(rawValue:))
  }

  public init(
    boundingRegion: MKCoordinateRegion,
    mapItems: [MapItem]
  ) {
    self.boundingRegion = boundingRegion
    self.mapItems = mapItems
  }

  public static func == (lhs: Self, rhs: Self) -> Bool {
    lhs.boundingRegion.center.latitude == rhs.boundingRegion.center.latitude
      && lhs.boundingRegion.center.longitude == rhs.boundingRegion.center.longitude
      && lhs.boundingRegion.span.latitudeDelta == rhs.boundingRegion.span.latitudeDelta
      && lhs.boundingRegion.span.longitudeDelta == rhs.boundingRegion.span.longitudeDelta
      && lhs.mapItems == rhs.mapItems
  }
}

#endif
