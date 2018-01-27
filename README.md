# CodableExtensions

CodableExtension contains helper methods for Decodable objects.

The Codable documention from Apple is already very good and the Codable library from the Standard Swift Library in my opinion is exceptional.

Everything can always be made easier, therefore I have made these extensions which allow for me to write even less code than what we do already.

# Contents

* [Introduction](#introduction)
* [Aim](#aim)
  * [From](#aim.from)
  * [To](#aim.to)
* [Requirements](#requirements)
* [Installation](#installation)
  * [CocoaPods](#cocoapods)
  * [Carthage](#carthage)
  * [Swift Package Manager](#swift-pm)
* [Usage](#usage)
  * [Decode using Foundation Data object](#usage-1)
  * [Decode using a `Foundation` `NSDictionary`](#usage-2)
  * [Decode using a `[AnyHashable:Any]` Dictionary](#usage-3)
  * [Decode using a JSON String](#usage-4)

<a name="introduction"></a>

# Introduction

The examples below are based upon a `Person` `object`.

The `Person` `object` has one member property and this is labelled `name` with a type of `String?`.

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

As you can see my `Person` `object` implements the swift 4 `Codable` `protocol`.

<a name="aim"></a>

# Aim: to reduce the boiler plate code written


<a name="aim.from"></a>

## From:
```swift
do {

    let data = try JSONSerialization.data(withJSONObject: withDictionary)
    return try JSONDecoder().decode(self, from: data)

} catch {
    return nil
}
```

<a name="aim.to"></a>

>## To
```swift
guard let person = Person.load(withDictionary: dictionary ) else {
    return nil
}
```

<a name="requirements"></a>

# Requirements

* Xcode 9.2
* Minimum iOS Deploment Target 9.0
* Swift 4.0

<a name="installation"></a>

# Installation

`CodableExtensions` doesn't contain any external dependencies.

These are currently the supported options:

<a name="cocoapods"></a>

# [CocoaPods](https://guides.cocoapods.org/using/using-cocoapods.html)

Not yet supported but coming very soon

<a name="carthage"></a>

# [Carthage](https://github.com/Carthage/Carthage)

Not yet supported but coming very soon

<a name="swift-pm"/>

# [Swift Package Manager](https://github.com/apple/swift-package-manager) 

**Tested with `swift build --version`: `Swift 4.0.0-dev (swiftpm-13126)`**

Create a `Package.swift` file.

```swift

// swift-tools-version:4.0

import PackageDescription

let package = Package(
    name: "PACKAGE_NAME",
    dependencies: [
        .package(url: "https://github.com/davidthorn/SwiftCodableExtensions.git", from: "0.1.0")
    ],
    targets: [
        .target(name: "PACKAGE_NAME", dependencies: [
        "CodableExtensions"
        ])
    ]
    )

```

```bash

$ swift build

```

<a name="usage"></a>

# Usage

To me the most basic way for someone to want to do this is with taking a simple `JSON String`, `NSDictionary`, `HashableDictionary` or `Data` object and saying hey give me a decoded object from that in one line of code.

Well with a few methods it is possible.

<a name="usage-1"></a>

# Decode using Foundation Data object

```swift
let jsonData: Data =  .... // Load the json Data from a server/api etc

guard let person: Person = Person.decode(withJSONData: jsonData) else {
    return nil
}
```

<a name="usage-2"></a>

# Decode using a Foundation NSDictionary

```swift

let dictionary: NSDictionary = [
    "name"  : "david"
]

guard let person: Person = Person.decode(withDictionary: dictionary ) else {
    return nil
}

```

<a name="usage-3"></a>

# Decode using a `[AnyHashable:Any]` Dictionary

```swift

let dictionary: [AnyHashable:Any] = [
    "name"  : "david"
]

guard let person: Person = Person.decode(withHashableDictionary: dictionary ) else {
    return nil
}

```

<a name="usage-4"></a>

# Decode using a JSON String

```swift
let jsonString = """
{
    "name" : "david"
}
        """

guard let person = Person.decode(withJsonString: jsonString) else {
    return nil
}

```