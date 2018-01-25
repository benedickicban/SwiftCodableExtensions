public class Person: Codable {

    public var name: String?

    public init()  {

    }

    public required init(from decoder: Decoder) throws {

        let values = try decoder.container(keyedBy: PersonKeys.self)
        name = try values.decode(String.self, forKey: .name)

    }

    public func encode(to encoder: Encoder) throws {

        var container = encoder.container(keyedBy: PersonKeys.self)
        try container.encode(name , forKey: .name)

    }

}

public enum PersonKeys: String , CodingKey {
    case name
}