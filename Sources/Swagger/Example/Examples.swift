import JSONUtilities

public struct Examples {
    public let allExamples: [ExamplesExample]

    init(allExamples: [ExamplesExample], successfulExamples: [ExamplesExample]) {
        self.allExamples = allExamples
    }
}

extension Examples: JSONObjectConvertible {
    public init(jsonDictionary: JSONDictionary) throws {
        self.allExamples = jsonDictionary.compactMap { (key: String, value: Any) -> ExamplesExample? in
            if let value = value as? JSONDictionary {
                return try? ExamplesExample(name: key,
                                            example: PossibleReference<ObjectExamplesExample>(jsonDictionary: value))
            }
            else {
                return nil
            }
        }
    }
}
