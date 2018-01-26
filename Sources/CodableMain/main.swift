import Foundation
import CodableExtensions

/*
let key = "name"

let aStringWithIsConvertedToData = """
{
    "\(key)" : "david"
}
"""

let dataObject = """
{
    "name" : "rita"
}
""".data(using: .utf8)!

let _dict = try! JSONSerialization.jsonObject(with: dataObject, options: .allowFragments)

print(_dict)


let jsonDict: NSDictionary = [
    "name" : "james"
]

let AnyHashableDictionary: [AnyHashable:Any] = [
    "name" : "john"
]

//let hash = stringDict as! [AnyHashable:Any]

//let fData = try! JSONSerialization.jsonObject(with: jsonObject , options: .allowFragments)

//let person = try! JSONDecoder().decode(Person.self, from: jsonObject)

//let dict = fData as! [String:Any]

//print(dict)

//print(person.name!)
 
guard let david = Person.load(any: aStringWithIsConvertedToData )  else { exit(2) }

print(david.name!)

guard let davidDict = Person.load(any: stringDict )  else { exit(2) }

print(davidDict.name!)

guard let johnDict = Person.load(any: jsonDict )   else { exit(2) }

print(johnDict.name!)

guard let ritaDict = Person.load(any: dataObject )   else { exit(2) }

print(ritaDict.name!)

*/