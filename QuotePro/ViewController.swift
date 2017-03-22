//
//  ViewController.swift
//  QuotePro
//
//  Created by Hyung Jip Moon on 2017-03-15.
//  Copyright © 2017 leomoon. All rights reserved.
//

import UIKit

protocol ViewControllerDelegate: class {
    func newComp(_ comp: CombineObject)
}

class ViewController: UIViewController {
    
    // MARK: Outlets
    
    
    @IBOutlet weak var xibView: UIView!
    // MARK: Properties
    
    var combineObject = CombineObject()
    var quoteView: QuoteView!

    weak var delegate: ViewControllerDelegate?
    
    // MARK: ViewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let objects = Bundle.main.loadNibNamed("QuoteView", owner: nil, options: [:]),
            let view = objects.first as? QuoteView {
            view.authorLabel.alpha = 0
            view.quoteLabel.alpha = 0
            view.photoImageView.alpha = 0
            xibView.addSubview(view)
            xibView.clipsToBounds = true
        }
        
    }
        
    // MARK: Actions
    
    @IBAction func getQuoteButtonPressed(_ sender: AnyObject) {
        
        getQuote()
    }
    
    @IBAction func getPhotoButtonPressed(_ sender: AnyObject) {

        getPhoto()
    }
    
    @IBAction func saveButtonPressed(_ sender: AnyObject) {
        self.navigationController!.popViewController(animated: true)
        self.delegate!.newComp(combineObject)
    }
    
    func getQuote() {
        let session = URLSession.shared
        let url = URL(string: "http://api.forismatic.com/api/1.0/?method=getQuote&lang=en&format=json")
        let task = session.dataTask(with: url!, completionHandler: { (data, response, error) in
            if let data = data, let quoteDictionary = try? JSONSerialization.jsonObject(with: data, options: []) as! [String: String] {
                
                self.combineObject.quote.author = quoteDictionary["quoteAuthor"] as String!
                self.combineObject.quote.quote = quoteDictionary["quoteText"] as String!
                
                DispatchQueue.main.async(execute: {
                    
                    if let view = self.xibView.subviews.first as? QuoteView! {
                        view.authorLabel.text = self.combineObject.quote.author
                        view.quoteLabel.text = self.combineObject.quote.quote
                        view.authorLabel.alpha = 1
                        view.quoteLabel.alpha = 1
                    }
                })
            }
        })
        task.resume()
    }
    
    func getPhoto() {
        
        let session = URLSession.shared
        let url = URL(string: "http://lorempixel.com/200/300")
        let imageTask = session.dataTask(with: url!, completionHandler: { (data, response, error) in
                        
            if let tempImage = UIImage(data: data!) {
                DispatchQueue.main.async(execute: {
                                
                    self.combineObject.photo.image = tempImage
                                
                    if let view = self.xibView.subviews.first as? QuoteView! {
                                    
                        view.photoImageView.image = self.combineObject.photo.image
                        view.photoImageView.alpha = 0.5
                    }
                })
            }
        })
        imageTask.resume()
    }
}
