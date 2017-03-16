//
//  NetworkManager.swift
//  QuotePro
//
//  Created by Hyung Jip Moon on 2017-03-15.
//  Copyright © 2017 leomoon. All rights reserved.
//

import UIKit
/*
class NetworkManager: NSObject {
    
    
    
    static func getQuotes(completion: @escaping (_ quote:Quote) -> Void) {
        
        //declare parameter as a dictionary which contains string as key and value combination. considering inputs are valid
    
//        let parameters = ["quoteAuthor": quoteAuthorLabel.text!, "quoteText": quoteTextLabel.text!] as Dictionary<String, String>
        
        //create the url with URL
        let url = URL(string: "http://api.forismatic.com/api/1.0/?method=getQuote&lang=en&format=json")! //change the url
        
        //create the session object
        let session = URLSession.shared
        
        //now create the URLRequest object using the url object
        var request = URLRequest(url: url)
        request.httpMethod = "POST" //set http method as POST
        
//        do {
//            request.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: .prettyPrinted) // pass dictionary to nsdata object and set it as request body
//            
//        } catch let error {
//            print(error.localizedDescription)
//        }
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        
        //create dataTask using the session object to send data to the server
        let task = session.dataTask(with: request as URLRequest, completionHandler: { data, response, error in
            
            guard error == nil else {
                return
            }
            
            guard let data = data else {
                return
            }
            
            do {
                //create json object from data
                if let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String: Any] {

                    // store json to quote object
                    
                    
                    if let number = json as? NSDictionary {
                        print(number)  // prints 42
                    }
                    print(json)
                    
                    if (json["error"] != nil)  {
                        
                        let myQuote = Quote(quoteAuthor: "", quoteImage: UIImage(), quoteText: "")
                        completion(myQuote!)
                    }

                }
            } catch let error {
                
                print(error.localizedDescription)
            }
        })
        
        task.resume()
        
    }
}
*/

class NetworkManager: NSObject {
    
    static func getQuotes(_ completionHandler: @escaping (String, String) -> Void) {
        let url = URL(string: "http://api.forismatic.com/api/1.0/?method=getQuote&lang=en&format=json")
        let session = URLSession.shared
        session.dataTask(with: url!, completionHandler: { (data: Data?, response: URLResponse?, error: NSError?) -> Void in
            
            do {
                let jsonData: NSDictionary = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as! NSDictionary
                let quoteText = jsonData["quoteText"] as! String
                let quoteAuthor = jsonData["quoteAuthor"] as! String
                
                completionHandler(quoteText, quoteAuthor)
                
            } catch {
                print(error)
            }
            } as! (Data?, URLResponse?, Error?) -> Void).resume()
    }
    
}

