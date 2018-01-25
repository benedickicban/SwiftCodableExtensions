import Foundation



extension Decodable {

    //public static func load(from: NSDictionary ) -> Decodable.Type? {
    //    return nil
    //}

    public static func load(any fromAny: Any ) -> Self? {

        switch fromAny {
            
            
            case is NSDictionary:
                guard let dataObject: Data = self.load(data: fromAny as! NSDictionary) else { return nil }
                return self.load(any: dataObject)
            
            case is [AnyHashable:Any]:
                return self.load(any: NSDictionary(dictionary: fromAny as! [AnyHashable:Any]))

            case is Data:
                do {
                    return try JSONDecoder().decode(self, from: fromAny as! Data)
                } catch {  


                    do {
                        let jsonObject = try JSONSerialization.jsonObject(with: fromAny as! Data)
                        return self.load(any: jsonObject)
                    } catch { return nil }
                }


            case is String:
                guard let data = (fromAny as! String).data(using: .utf8) else { return nil }
                return self.load(any: data)
            
            default:
                guard let dictionary = self.load(dict: fromAny) else { return nil }
                return self.load(any: dictionary)
        }

        
    }

    // See if the any object can be converted to ns dictionary
    public static func load(dict fromAny: Any ) -> NSDictionary? {
        
        guard let dict = fromAny as? NSDictionary else { return nil }
        return dict
        
    }

    // convert the ns dictionary to data
    public static func load(data fromDict: NSDictionary ) -> Data? {
        
        do {
            return try JSONSerialization.data(withJSONObject: fromDict )
        } catch { return nil }

    }
    

}

