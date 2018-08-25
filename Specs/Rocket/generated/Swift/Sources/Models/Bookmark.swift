//
// Generated by SwagGen
// https://github.com/yonaskolb/SwagGen
//

import Foundation

public class Bookmark: APIModel {

    /** The id of the item bookmarked. */
    public var itemId: String

    /** The date the bookmark was created. */
    public var creationDate: DateTime

    public init(itemId: String, creationDate: DateTime) {
        self.itemId = itemId
        self.creationDate = creationDate
    }

    private enum CodingKeys: String, CodingKey {
        case itemId
        case creationDate
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        itemId = try container.decode(.itemId)
        creationDate = try container.decode(.creationDate)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(itemId, forKey: .itemId)
        try container.encode(creationDate, forKey: .creationDate)
    }

    public func isEqual(to object: Any?) -> Bool {
      guard let object = object as? Bookmark else { return false }
      guard self.itemId == object.itemId else { return false }
      guard self.creationDate == object.creationDate else { return false }
      return true
    }

    public static func == (lhs: Bookmark, rhs: Bookmark) -> Bool {
        return lhs.isEqual(to: rhs)
    }
}
