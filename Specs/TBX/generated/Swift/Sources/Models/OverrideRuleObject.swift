//
// Generated by SwagGen
// https://github.com/yonaskolb/SwagGen
//

import Foundation

public class OverrideRuleObject: Codable, Equatable {

    /** List of URNs to override */
    public var urn: [String]

    public var response: Bool

    public var priority: Double

    /** List of actions to override */
    public var action: [String]?

    /** List of countries to override */
    public var country: [String]?

    public var dateFrom: Date?

    public var dateUntil: Date?

    /** List of IDPs to override */
    public var idp: [String]?

    public init(urn: [String], response: Bool, priority: Double, action: [String]? = nil, country: [String]? = nil, dateFrom: Date? = nil, dateUntil: Date? = nil, idp: [String]? = nil) {
        self.urn = urn
        self.response = response
        self.priority = priority
        self.action = action
        self.country = country
        self.dateFrom = dateFrom
        self.dateUntil = dateUntil
        self.idp = idp
    }

    private enum CodingKeys: String, CodingKey {
        case urn
        case response
        case priority
        case action
        case country
        case dateFrom
        case dateUntil
        case idp
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        urn = try container.decode(.urn)
        response = try container.decode(.response)
        priority = try container.decode(.priority)
        action = try container.decodeIfPresent(.action)
        country = try container.decodeIfPresent(.country)
        dateFrom = try container.decodeIfPresent(.dateFrom)
        dateUntil = try container.decodeIfPresent(.dateUntil)
        idp = try container.decodeIfPresent(.idp)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(urn, forKey: .urn)
        try container.encode(response, forKey: .response)
        try container.encode(priority, forKey: .priority)
        try container.encode(action, forKey: .action)
        try container.encode(country, forKey: .country)
        try container.encode(dateFrom, forKey: .dateFrom)
        try container.encode(dateUntil, forKey: .dateUntil)
        try container.encode(idp, forKey: .idp)
    }

    public func isEqual(to object: Any?) -> Bool {
      guard let object = object as? OverrideRuleObject else { return false }
      guard self.urn == object.urn else { return false }
      guard self.response == object.response else { return false }
      guard self.priority == object.priority else { return false }
      guard self.action == object.action else { return false }
      guard self.country == object.country else { return false }
      guard self.dateFrom == object.dateFrom else { return false }
      guard self.dateUntil == object.dateUntil else { return false }
      guard self.idp == object.idp else { return false }
      return true
    }

    public static func == (lhs: OverrideRuleObject, rhs: OverrideRuleObject) -> Bool {
        return lhs.isEqual(to: rhs)
    }
}