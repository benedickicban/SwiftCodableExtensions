import XCTest
@testable import CodableExtensionsTests

XCTMain([
    testCase(CodableExtensionsTests.allTests),
    testCase(DictionaryExtensionsTests.allTests)
])
