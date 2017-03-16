//
//  ViewController.swift
//  QuotePro
//
//  Created by Hyung Jip Moon on 2017-03-15.
//  Copyright © 2017 leomoon. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var quoteAuthorLabel: UILabel!
    @IBOutlet weak var quoteTextLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        NetworkManager.getQuotes { (quote) in
            
            self.quoteAuthorLabel.text = quote.quoteAuthor
            
        }
        
        
        
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    

}

