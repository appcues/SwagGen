//
// Generated by SwagGen
// https://github.com/yonaskolb/SwagGen
//

import Foundation

public class Casualty: APIModel {

    public var age: Int?

    public var ageBand: String?

    public var `class`: String?

    public var mode: String?

    public var severity: String?

    public init(age: Int? = nil, ageBand: String? = nil, `class`: String? = nil, mode: String? = nil, severity: String? = nil) {
        self.age = age
        self.ageBand = ageBand
        self.`class` = `class`
        self.mode = mode
        self.severity = severity
    }

    private enum CodingKeys: String, CodingKey {
        case age
        case ageBand
        case `class` = "class"
        case mode
        case severity
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        age = try container.decodeIfPresent(.age)
        ageBand = try container.decodeIfPresent(.ageBand)
        `class` = try container.decodeIfPresent(.`class`)
        mode = try container.decodeIfPresent(.mode)
        severity = try container.decodeIfPresent(.severity)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encodeIfPresent(age, forKey: .age)
        try container.encodeIfPresent(ageBand, forKey: .ageBand)
        try container.encodeIfPresent(`class`, forKey: .`class`)
        try container.encodeIfPresent(mode, forKey: .mode)
        try container.encodeIfPresent(severity, forKey: .severity)
    }

    public func isEqual(to object: Any?) -> Bool {
      guard let object = object as? Casualty else { return false }
      guard self.age == object.age else { return false }
      guard self.ageBand == object.ageBand else { return false }
      guard self.`class` == object.`class` else { return false }
      guard self.mode == object.mode else { return false }
      guard self.severity == object.severity else { return false }
      return true
    }

    public static func == (lhs: Casualty, rhs: Casualty) -> Bool {
        return lhs.isEqual(to: rhs)
    }
}
