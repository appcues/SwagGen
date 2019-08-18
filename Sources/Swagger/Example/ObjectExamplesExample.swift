import JSONUtilities

public struct ObjectExamplesExample {
    public let value: JSONDictionary
}

extension ObjectExamplesExample: JSONObjectConvertible {
    public init(jsonDictionary: JSONDictionary) throws {
        if jsonDictionary.keys.contains("value") {
            if let valueJSON = jsonDictionary["value"] as? JSONDictionary {
                self.value = valueJSON
            } else {
                self.value = [:]
            }
        } else {
            self.value = jsonDictionary
        }
    }
}
