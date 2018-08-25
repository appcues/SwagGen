//
// Generated by SwagGen
// https://github.com/yonaskolb/SwagGen
//

import Foundation

public class DbGeography: APIModel {

    public var geography: DbGeographyWellKnownValue?

    public init(geography: DbGeographyWellKnownValue? = nil) {
        self.geography = geography
    }

    private enum CodingKeys: String, CodingKey {
        case geography
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        geography = try container.decodeIfPresent(.geography)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encodeIfPresent(geography, forKey: .geography)
    }

    public func isEqual(to object: Any?) -> Bool {
      guard let object = object as? DbGeography else { return false }
      guard self.geography == object.geography else { return false }
      return true
    }

    public static func == (lhs: DbGeography, rhs: DbGeography) -> Bool {
        return lhs.isEqual(to: rhs)
    }
}
