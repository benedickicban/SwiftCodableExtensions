///
/// DecodableExtensions.swift
/// CodableExtensions
///
/// Created by David Thorn 26.01.2018
/// Copyright @ 2018 All rights reserved
///
/// Email: david.thorn221278@googlemail.com
///

import Foundation


extension Decodable {


    public static func decode(withJsonData: Data) -> Decodable? {

        do {

            return try JSONDecoder().decode(self, from: withJsonData)

        } catch {
            return nil
        } 

    }

    public static func decode(withDictionary: NSDictionary ) -> Decodable? {

        do {

            let data = try JSONSerialization.data(withJSONObject: withDictionary)
            return try JSONDecoder().decode(self, from: data)

        } catch {
            return nil
        } 
    }

    public static func decode(withHashableDictionary: [AnyHashable:Any] ) -> Decodable? {

        let dictionary = NSDictionary(dictionary: withHashableDictionary)

        return self.decode(withDictionary: dictionary)

    }

    public static func decode(withJsonString: String ) -> Decodable? {

        guard let data = withJsonString.data(using: .utf8) else { return nil } 

       
        do {

            return try JSONDecoder().decode(self, from: data)

        } catch {
            return nil
        } 
    }

}