//
//  Quote.swift
//  QuotePro
//
//  Created by Hyung Jip Moon on 2017-03-15.
//  Copyright © 2017 leomoon. All rights reserved.
//

import UIKit

class Quote: NSObject {
    
    //MARK: Properties
    
    var quoteAuthor: String
    var quoteText: String
    //var quoteImage: UIImage?
    
    //MARK: Types
    
    struct PropertyKey {
        static let quoteAuthor = "quoteAuthor"
       // static let quoteImage = "quoteImage"
        static let quoteText = "quoteText"
    }
    
    // MARK: Initialization
    //init?(quoteAuthor: String, quoteImage: UIImage?, quoteText: String) {
     init?(quoteAuthor: String, quoteText: String) {
        //Initialize stored properties.
        self.quoteAuthor = quoteAuthor
        self.quoteText = quoteText
        //self.quoteImage = quoteImage
    }
//    //MARK: NSCoding
//    func encode(with aCoder: NSCoder) {
//        aCoder.encode(quoteAuthor, forKey: PropertyKey.quoteAuthor)
//        aCoder.encode(quoteImage, forKey: PropertyKey.quoteImage)
//        aCoder.encode(quoteText, forKey: PropertyKey.quoteText)
//        
//    
//    }
    
    
}
