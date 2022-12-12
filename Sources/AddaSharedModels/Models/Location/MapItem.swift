#if os(iOS)

import MapKit

public struct MapItem: Equatable {
  public var isCurrentLocation: Bool
  public var name: String?
  public var phoneNumber: String?
  public var placemark: Placemark
  public var pointOfInterestCategory: MKPointOfInterestCategory?
  public var timeZone: TimeZone?
  public var url: URL?

  public init(rawValue: MKMapItem) {
    self.isCurrentLocation = rawValue.isCurrentLocation
    self.name = rawValue.name
    self.placemark = Placemark(rawValue: rawValue.placemark)
    self.phoneNumber = rawValue.phoneNumber
    self.pointOfInterestCategory = rawValue.pointOfInterestCategory
    self.timeZone = rawValue.timeZone
    self.url = rawValue.url
  }

  public init(
    isCurrentLocation: Bool = false,
    name: String? = nil,
    phoneNumber: String? = nil,
    placemark: Placemark,
    pointOfInterestCategory: MKPointOfInterestCategory? = nil,
    timeZone: TimeZone? = nil,
    url: URL? = nil
  ) {
    self.isCurrentLocation = isCurrentLocation
    self.name = name
    self.phoneNumber = phoneNumber
    self.placemark = placemark
    self.pointOfInterestCategory = pointOfInterestCategory
    self.timeZone = timeZone
    self.url = url
  }

  public static func == (lhs: Self, rhs: Self) -> Bool {
    lhs.isCurrentLocation == rhs.isCurrentLocation
      && lhs.name == rhs.name
      && lhs.phoneNumber == rhs.phoneNumber
      && lhs.placemark.coordinate.latitude == rhs.placemark.coordinate.latitude
      && lhs.placemark.coordinate.longitude
        == rhs.placemark.coordinate.longitude
      && lhs.placemark.countryCode == rhs.placemark.countryCode
      && lhs.placemark.region == rhs.placemark.region
      && lhs.placemark.subtitle == rhs.placemark.subtitle
      && lhs.placemark.title == rhs.placemark.title
      && lhs.placemark.name == rhs.placemark.name
      && lhs.placemark.thoroughfare == rhs.placemark.thoroughfare
      && lhs.placemark.subThoroughfare == rhs.placemark.subThoroughfare
      && lhs.placemark.locality == rhs.placemark.locality
      && lhs.placemark.subLocality == rhs.placemark.subLocality
      && lhs.placemark.administrativeArea == rhs.placemark.administrativeArea
      && lhs.placemark.subAdministrativeArea
        == rhs.placemark.subAdministrativeArea
      && lhs.placemark.postalCode == rhs.placemark.postalCode
      && lhs.placemark.isoCountryCode == rhs.placemark.isoCountryCode
      && lhs.placemark.country == rhs.placemark.country
      && lhs.placemark.inlandWater == rhs.placemark.inlandWater
      && lhs.placemark.ocean == rhs.placemark.ocean
      && lhs.placemark.areasOfInterest == rhs.placemark.areasOfInterest
      && lhs.pointOfInterestCategory == rhs.pointOfInterestCategory
      && lhs.timeZone == rhs.timeZone
      && lhs.url == rhs.url
  }
}

#endif
