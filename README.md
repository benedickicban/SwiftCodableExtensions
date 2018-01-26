# CodableExtensions

CodableExtension contains helper methods on a Decodable.

The Codable documention from Apple is already very good and the Codable library from the Standard Swift Library in my opinion is already exceptional.

Everything can always be made easier, therefore I have made these extensions which allow for me to write even less code than what we do already.

# Introduction

All of the examples below are based upon a `Person` `class`.

The `Person` `class` has one property and this is called `name` and it is of type `String?`.

Very simple huh!

```swift

public class Person: Codable {

    public var name: String?

    public init()  {}

    ... 

    /// decode and encode methods

    ...

}

```

As you can see my `Person` `class` implements the swift 4 Codable protocol.

# Aim

>### The aim of this library is to reduce following code:

```swift

do {

    
    let data = try JSONSerialization.data(withJSONObject: withDictionary)
    return try JSONDecoder().decode(self, from: data)

} catch {
    return nil
} 

```

>### To the following code:

```swift

guard let person = Person.load(withDictionary: dictionary ) else {
    return nil
}


```

# And here it is:

# Convert JSON String to Person Object

To me the most basic way for someone to want to do this is with taking a simple json string and saying hey give me an object from that in one line of code.

Well with a few methods it is possible.

```swift

/// Unit Test

func testDecodingWithJSONString() {

    let jsonString = """
    {
        "name" : "david"
    }
    """

    let person = Person.decode(withJsonString: jsonString)

    XCTAssertNotNil(person , "the person must not be nil")

}
```
```bash
Test Suite 'All tests' started at 2018-01-26 00:02:45.823
Test Suite 'debug.xctest' started at 2018-01-26 00:02:45.825
Test Suite 'CodableExtensionsTests' started at 2018-01-26 00:02:45.825
Test Case 'CodableExtensionsTests.Test Decoding Decodable using JSON String' started at 2018-01-26 00:02:45.825
Test Case 'CodableExtensionsTests.Test Decoding Decodable using JSON String' passed (0.003 seconds)
Test Suite 'CodableExtensionsTests' passed at 2018-01-26 00:02:45.828
	 Executed 1 test, with 0 failures (0 unexpected) in 0.003 (0.003) seconds
Test Suite 'debug.xctest' passed at 2018-01-26 00:02:45.828
	 Executed 1 test, with 0 failures (0 unexpected) in 0.003 (0.003) seconds
Test Suite 'All tests' passed at 2018-01-26 00:02:45.828
	 Executed 1 test, with 0 failures (0 unexpected) in 0.003 (0.003) seconds
```

# Decoding with a NSDictionary

```swift

/// Unit Test

func testDecodingNSDictionary() {

    let dict: NSDictionary = [
        "name" : "david"
    ]

    let person = Person.decode(withDictionary: dict)

    XCTAssertNotNil(person , "the person must not be nil")

}

```
```bash
Test Suite 'All tests' started at 2018-01-26 00:08:21.907
Test Suite 'debug.xctest' started at 2018-01-26 00:08:21.908
Test Suite 'CodableExtensionsTests' started at 2018-01-26 00:08:21.908
Test Case 'CodableExtensionsTests.Test Decoding Decodable using NSDictionary' started at 2018-01-26 00:08:21.909
Test Case 'CodableExtensionsTests.Test Decoding Decodable using NSDictionary' passed (0.003 seconds)
Test Suite 'CodableExtensionsTests' passed at 2018-01-26 00:08:21.912
	 Executed 1 test, with 0 failures (0 unexpected) in 0.003 (0.003) seconds
Test Suite 'debug.xctest' passed at 2018-01-26 00:08:21.912
	 Executed 1 test, with 0 failures (0 unexpected) in 0.003 (0.003) seconds
Test Suite 'All tests' passed at 2018-01-26 00:08:21.912
	 Executed 1 test, with 0 failures (0 unexpected) in 0.003 (0.003) seconds

```


# Decodable using JSON String

