//
//  DetailViewController.swift
//  QuotePro
//
//  Created by Hyung Jip Moon on 2017-03-21.
//  Copyright © 2017 leomoon. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    // MARK: Outlets
    @IBOutlet weak var xibView: UIView!
    
    // MARK: Properties
    var combineObject = CombineObject()
    
    // MARK: ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let objects = Bundle.main.loadNibNamed("QuoteView", owner: nil, options: [:]),
            let view = objects.first as? QuoteView {
            
            view.photoImageView.image = combineObject.photo.image
            view.quoteLabel.text = combineObject.quote.quote
            view.authorLabel.text = combineObject.quote.author
            
            xibView.addSubview(view)
            xibView.clipsToBounds = true
        }
    }
    
    // MARK: Actions
    @IBAction func shareButtonPressed(_ sender: AnyObject) {
        // Do publishing
        UIGraphicsBeginImageContextWithOptions(xibView.bounds.size, true, 0)
        xibView.drawHierarchy(in: xibView.bounds, afterScreenUpdates: true)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        let objectsToShare = [image]
        let activityVC = UIActivityViewController(activityItems: objectsToShare, applicationActivities: nil)
        self.present(activityVC, animated: true, completion: nil)
    }
}
