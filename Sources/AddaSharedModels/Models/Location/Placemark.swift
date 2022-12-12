#if os(iOS)
import MapKit

public struct Placemark: Equatable {
  public var administrativeArea: String?
  public var areasOfInterest: [String]?
  public var coordinate: CLLocationCoordinate2D
  public var country: String?
  public var countryCode: String?
  public var inlandWater: String?
  public var isoCountryCode: String?
  public var locality: String?
  public var name: String?
  public var ocean: String?
  public var postalCode: String?
  public var region: CLRegion?
  public var subAdministrativeArea: String?
  public var subLocality: String?
  public var subThoroughfare: String?
  public var subtitle: String?
  public var thoroughfare: String?
  public var title: String?

  public init(rawValue: MKPlacemark) {
    self.administrativeArea = rawValue.administrativeArea
    self.areasOfInterest = rawValue.areasOfInterest
    self.coordinate = rawValue.coordinate
    self.country = rawValue.country
    self.countryCode = rawValue.countryCode
    self.inlandWater = rawValue.inlandWater
    self.isoCountryCode = rawValue.isoCountryCode
    self.locality = rawValue.locality
    self.name = rawValue.name
    self.ocean = rawValue.ocean
    self.postalCode = rawValue.postalCode
    self.region = rawValue.region
    self.subAdministrativeArea = rawValue.subAdministrativeArea
    self.subLocality = rawValue.subLocality
    self.subThoroughfare = rawValue.subThoroughfare
    self.subtitle =
      rawValue.responds(to: #selector(getter:MKPlacemark.subtitle)) ? rawValue.subtitle : nil
    self.thoroughfare = rawValue.thoroughfare
    self.title = rawValue.responds(to: #selector(getter:MKPlacemark.title)) ? rawValue.title : nil
  }

  public init(
    administrativeArea: String? = nil,
    areasOfInterest: [String]? = nil,
    coordinate: CLLocationCoordinate2D = .init(),
    country: String? = nil,
    countryCode: String? = nil,
    inlandWater: String? = nil,
    isoCountryCode: String? = nil,
    locality: String? = nil,
    name: String? = nil,
    ocean: String? = nil,
    postalCode: String? = nil,
    region: CLRegion? = nil,
    subAdministrativeArea: String? = nil,
    subLocality: String? = nil,
    subThoroughfare: String? = nil,
    subtitle: String? = nil,
    thoroughfare: String? = nil,
    title: String? = nil
  ) {
    self.administrativeArea = administrativeArea
    self.areasOfInterest = areasOfInterest
    self.coordinate = coordinate
    self.country = country
    self.countryCode = countryCode
    self.inlandWater = inlandWater
    self.isoCountryCode = isoCountryCode
    self.locality = locality
    self.name = name
    self.ocean = ocean
    self.postalCode = postalCode
    self.region = region
    self.subAdministrativeArea = subAdministrativeArea
    self.subLocality = subLocality
    self.subThoroughfare = subThoroughfare
    self.subtitle = subtitle
    self.thoroughfare = thoroughfare
    self.title = title
  }

  public static func == (lhs: Self, rhs: Self) -> Bool {
    lhs.administrativeArea == rhs.administrativeArea
      && lhs.areasOfInterest == rhs.areasOfInterest
      && lhs.coordinate.latitude == rhs.coordinate.latitude
      && lhs.coordinate.longitude == rhs.coordinate.longitude
      && lhs.country == rhs.country
      && lhs.countryCode == rhs.countryCode
      && lhs.inlandWater == rhs.inlandWater
      && lhs.isoCountryCode == rhs.isoCountryCode
      && lhs.locality == rhs.locality
      && lhs.name == rhs.name
      && lhs.ocean == rhs.ocean
      && lhs.postalCode == rhs.postalCode
      && lhs.region == rhs.region
      && lhs.subAdministrativeArea == rhs.subAdministrativeArea
      && lhs.subLocality == rhs.subLocality
      && lhs.subThoroughfare == rhs.subThoroughfare
      && lhs.subtitle == rhs.subtitle
      && lhs.thoroughfare == rhs.thoroughfare
      && lhs.title == rhs.title
  }
}

extension Placemark: Hashable {
    public func hash(into hasher: inout Hasher) {
        hasher.combine(administrativeArea)
        hasher.combine(areasOfInterest)
//        hasher.combine(coordinate)
        hasher.combine(country)
        hasher.combine(countryCode)
        hasher.combine(inlandWater)
        hasher.combine(isoCountryCode)
        hasher.combine(locality)
        hasher.combine(name)
        hasher.combine(ocean)
        hasher.combine(postalCode)
        hasher.combine(region)
        hasher.combine(subAdministrativeArea)
        hasher.combine(subLocality)
        hasher.combine(subThoroughfare)
        hasher.combine(subtitle)
        hasher.combine(thoroughfare)
        hasher.combine(title)
    }
}

#endif
