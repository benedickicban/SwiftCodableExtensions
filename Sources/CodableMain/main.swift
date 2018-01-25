import Foundation
import CodableExtensions

let key = "name"

let jsonObject = """
{
    "\(key)" : "david"
}
"""

let dataObject = """
{
    "rita" : "david"
}
""".data(using: .utf8)!


let jsonDict: NSDictionary = [
    "name" : "james"
]

let stringDict: [AnyHashable:Any] = [
    "name" : "john"
]

//let hash = stringDict as! [AnyHashable:Any]

//let fData = try! JSONSerialization.jsonObject(with: jsonObject , options: .allowFragments)

//let person = try! JSONDecoder().decode(Person.self, from: jsonObject)

//let dict = fData as! [String:Any]

//print(dict)

//print(person.name!)
 
guard let david = Person.load(any: jsonObject )  else { exit(2) }

print(david.name!)

guard let davidDict = Person.load(any: stringDict )  else { exit(2) }

print(davidDict.name!)

guard let johnDict = Person.load(any: jsonDict )   else { exit(2) }

print(johnDict.name!)

guard let ritaDict = Person.load(any: dataObject )   else { exit(2) }

print(ritaDict.name!)

