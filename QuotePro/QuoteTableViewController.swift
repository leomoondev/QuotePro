//
//  QuoteTableViewController.swift
//  QuotePro
//
//  Created by Hyung Jip Moon on 2017-03-21.
//  Copyright © 2017 leomoon. All rights reserved.
//

import UIKit

class QuoteTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, ViewControllerDelegate {
    // MARK: Outlets
    
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: Properties
    
    var combineObject = [CombineObject]()
    
    // MARK: ViewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 80
        
    }
    

    
    // MARK: UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return combineObject.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "quoteCell", for: indexPath) as! QuoteTableViewCell
        
        let composition = combineObject[indexPath.row]
        cell.photoImageView.image = composition.photo.image
        cell.authorLabel.text = composition.quote.author + ":"
        cell.quoteLabel.text = composition.quote.quote
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            combineObject.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            //
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showDetail", sender: indexPath)
    }
    
    // MARK: Segue
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            if let indexPath = sender as! IndexPath! {
                let tempObject = combineObject[indexPath.row]
                let controller = segue.destination as! DetailViewController
                controller.combineObject = tempObject
            }
        } else if segue.identifier == "addComposition" {
            let controller = segue.destination as! ViewController
            controller.delegate = self

        }
    }
    
    // MARK: BuilderProtocol
    
    func newComp(_ comp: CombineObject) {
        combineObject.append(comp)
        
        tableView.reloadData()
    }

    
}
