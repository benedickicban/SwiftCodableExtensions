import XCTest
import Foundation
@testable import CodableExtensions


class CodableExtensionsTests: XCTestCase {
    

    func testDecodingNSDictionary() {

        let dict: NSDictionary = [
            "name" : "david"
        ]

        let person = Person.decode(withDictionary: dict)

        XCTAssertNotNil(person , "the person must not be nil")

    }


    func testAnyHashableConvertedToDecodable() {

        let AnyHashableDictionary: [AnyHashable:Any] = [
            "name" : "john"
        ]

        let person = Person.decode(withHashableDictionary: AnyHashableDictionary)

        XCTAssertNotNil(person , "the person cannot be nil")

    }


    func testDecodingWithJSONString() {

       let jsonString = """
        {
            "name" : "david"
        }
        """

        let person = Person.decode(withJsonString: jsonString)

        XCTAssertNotNil(person , "the person must not be nil")

    }

    

    func testdecodeWithJsonData() {

        let jsonData = """
        {
            "name" : "david"
        }
        """.data(using: .utf8)!

        let person = Person.decode(withJsonData: jsonData)

        XCTAssertNotNil(person , "the person must not be nil")

    }


    static var allTests = [
      //  ("Test Decoding Decodable using JSON String" , testDecodingWithJSONString),
        ("Test Decoding Decodable using NSDictionary" , testDecodingNSDictionary),
      //  ("Test Decoding Decodable using AnyHashable Dictionary" , testAnyHashableConvertedToDecodable),
      //  ("Test Decoding using JSON Data" , testdecodeWithJsonData)
    ]
}
