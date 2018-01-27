import Foundation

public class David: Codable {

    public var name: String?

    public var age: Int?

    public init()  {

    }

    public required init(from decoder: Decoder) throws {

        let values = try decoder.container(keyedBy: PersonKeys.self)
        name = try values.decode(String.self, forKey: .name)
        age = try values.decode(Int.self, forKey: .age)

    }

    public func encode(to encoder: Encoder) throws {

        var container = encoder.container(keyedBy: PersonKeys.self)
        try container.encode(name , forKey: .name)
        try container.encode(age , forKey: .age)

    }

}
