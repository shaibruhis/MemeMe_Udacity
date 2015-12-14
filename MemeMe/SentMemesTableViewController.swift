//
//  SentMemesTableViewController.swift
//  MemeMe
//
//  Created by Shai Bruhis on 12/13/15.
//  Copyright © 2015 Shai Bruhis. All rights reserved.
//

import UIKit

class SentMemesTableViewController: UITableViewController {

    var appDelegate = AppDelegate()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let object = UIApplication.sharedApplication().delegate
        appDelegate = object as! AppDelegate
    }

    // MARK: - Table view data source
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return appDelegate.memes.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("SentMemesTableViewCell", forIndexPath: indexPath) as! SentMemesTableViewCell

        let meme = appDelegate.memes[indexPath.row]
        cell.title.text = "\(meme.topString!)...\(meme.botString!)"
        cell.thumbnail.image = meme.memedImage!

        return cell
    }
    

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        }
    }
    */

    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let meme = appDelegate.memes[indexPath.row]
        
        let memeDetailVC = storyboard?.instantiateViewControllerWithIdentifier("MemeDetailViewController") as! MemeDetailViewController
        memeDetailVC.memedImage = meme.memedImage!
        
        // Pass the selected object to the new view controller.
        presentViewController(memeDetailVC, animated: true, completion: nil)
    }
}
