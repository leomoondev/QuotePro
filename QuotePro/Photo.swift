//
//  Photo.swift
//  QuotePro
//
//  Created by Hyung Jip Moon on 2017-03-15.
//  Copyright © 2017 leomoon. All rights reserved.
//

import UIKit

class Photo: NSObject {

    static func getPhoto(_ completionHandler: (UIImage) -> Void) {
        var request = ImageRequest(URL: URL(string: "http://lorempixel.com/200/300)")!)
        request.memoryCacheStorageAllowed = false
        Nuke.taskWith(request) { response in
            let image = response.image
            completionHandler(image!)
            }.resume()
    }
}


