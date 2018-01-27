import XCTest
import Foundation
@testable import CodableExtensions

class DictionaryExtensionsTests: XCTestCase {
    
    /// Tests that a NSDictionary can be Decoded into a Decodable
    /// by using the decode extension method
    func testToDecoable() {

        let dictionary: NSDictionary = [
            "name" : "david",
            "age" : 39
        ]

        guard let person = dictionary.to(David.self) else {
            XCTFail("the test must not fail")
            return
        }

        XCTAssertNotNil(person , "the person cannot be nil")

    }

    /// Tests that a Dictionary<String:Any> can be Decoded into a Decodable
    /// by using the decode extension method
    func testToDecoableFromDictionaryKeyStringValueAny() {

        let dictionary: [String:Any] = [
            "name" : "david",
            "age" : 39
        ]

        guard let person = dictionary.to(David.self) else {
            XCTFail("the test must not fail")
            return
        }

        XCTAssertNotNil(person , "the person cannot be nil")
    
    }

    /// Tests that a Dictionary<AnyHashable:Any> can be Decoded into a Decodable
    /// by using the decode extension method
    func testToDecoableFromDictionaryKeyAnyHashableValueAny() {

        let dictionary: [AnyHashable:Any] = [
            "name" : "david",
            "age" : 39
        ]

        guard let person = dictionary.fromAnyHashableTo(David.self) else {
            XCTFail("the test must not fail")
            return
        }

        XCTAssertNotNil(person , "the person cannot be nil")
        
    }

    static var allTests = [
        ("Test Decodable can be decoded from a NSDictionary extension method" , testToDecoable),
        ("Test Decodable can be decoded from a Dictionary<String,Any> extension method" , testToDecoableFromDictionaryKeyStringValueAny),
        ("Test Decodable can be decoded from a Dictionary<AnyHashable,Any> extension method" , testToDecoableFromDictionaryKeyAnyHashableValueAny)
    ]
}
