
public enum DurationButtons: String, CaseIterable, Equatable, Hashable {

  case Four_Hours = "4hr"
  case One_Hour = "1hr"
  case Two_Hours = "2hr"
  case Three_Hours = "3hr"

  public var value: Int {
    switch self {
    case .Four_Hours:
      return 240 * 60
    case .One_Hour:
      return 60 * 60
    case .Two_Hours:
      return 120 * 60
    case .Three_Hours:
      return 180 * 60
    }
  }

  static func getPositionBy(_ minutes: Int) -> String {
    switch minutes {
    case 240 * 60:
      return DurationButtons.allCases[0].rawValue
    case 30 * 60:
      return DurationButtons.allCases[1].rawValue
    case 60 * 60:
      return DurationButtons.allCases[2].rawValue
    case 120 * 60:
      return DurationButtons.allCases[3].rawValue
    case 180 * 60:
      return DurationButtons.allCases[4].rawValue
    default:
      return "Missing minutes"
    }
  }
}
