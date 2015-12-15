//
//  SentMemesCollectionViewController.swift
//  MemeMe
//
//  Created by Shai Bruhis on 12/13/15.
//  Copyright © 2015 Shai Bruhis. All rights reserved.
//

import UIKit

private let reuseIdentifier = "SentMemesCollectionViewCell"

class SentMemesCollectionViewController: UICollectionViewController {

    @IBOutlet weak var flowLayout: UICollectionViewFlowLayout!
    
    var appDelegate = AppDelegate()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let object = UIApplication.sharedApplication().delegate
        appDelegate = object as! AppDelegate
        
        let space: CGFloat = 3.0
        let dimension = (view.frame.size.width - (2*space)) / space
        flowLayout.minimumInteritemSpacing = space
        flowLayout.minimumLineSpacing = space
        flowLayout.itemSize = CGSizeMake(dimension, dimension)
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillDisappear(animated)
        collectionView?.reloadData()
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "segueToMemeDetailView") {
            let meme = appDelegate.memes[(collectionView!.indexPathForCell(sender as! UICollectionViewCell)!.row)]
            
            let memeDetailVC = segue.destinationViewController as! MemeDetailViewController
            memeDetailVC.meme = meme
            
            memeDetailVC.hidesBottomBarWhenPushed = true;
        }
    }
    
    // MARK: UICollectionViewDataSource
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return appDelegate.memes.count
    }

    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath) as! SentMemesCollectionViewCell
    
        let meme = appDelegate.memes[indexPath.row]
        cell.memeImageView.image = meme.memedImage!
        
        return cell
    }
}
