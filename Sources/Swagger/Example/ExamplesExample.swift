import JSONUtilities

public struct ExamplesExample {
    public let name: String
    public let exampleObject: PossibleReference<ObjectExamplesExample>

    init(name: String, example: PossibleReference<ObjectExamplesExample>) {
        self.name = name
        self.exampleObject = example
    }
}

extension ExamplesExample: JSONObjectConvertible {
    public init(jsonDictionary: JSONDictionary) throws {
        if let exampleName = jsonDictionary.keys.first {
            self.name = exampleName
        } else {
            self.name = ""
        }

        if let exampleContent = jsonDictionary.values.first as? JSONDictionary {
            self.exampleObject = try PossibleReference(jsonDictionary: exampleContent)
        } else {
            self.exampleObject = .value(try ObjectExamplesExample(jsonDictionary: JSONDictionary()))
        }
    }
}
