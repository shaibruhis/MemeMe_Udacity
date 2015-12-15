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
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        tableReload()
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
    func tableReload() {
        tableView.reloadData()
    }

    // MARK: - Table view data source
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let num = appDelegate.memes.count
        if (num == 0) {
                navigationItem.leftBarButtonItem = nil
        }
        else {
            navigationItem.leftBarButtonItem = editButtonItem()
        }
        return num
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("SentMemesTableViewCell", forIndexPath: indexPath) as! SentMemesTableViewCell

        let meme = appDelegate.memes[indexPath.row]
        cell.title.text = "\(meme.topString!)...\(meme.botString!)"
        cell.thumbnail.image = meme.memedImage!

        return cell
    }
    

    
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            appDelegate.memes.removeAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        }
    }
    
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }

    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "segueToMemeDetailView") {
            let meme = appDelegate.memes[tableView.indexPathForCell(sender as! UITableViewCell)!.row]
            
            let memeDetailVC = segue.destinationViewController as! MemeDetailViewController
            memeDetailVC.meme = meme
            
            memeDetailVC.hidesBottomBarWhenPushed = true;
        }
    }
}
