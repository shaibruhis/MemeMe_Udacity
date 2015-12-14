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

        // Register cell classes
//        self.collectionView!.registerClass(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

        // Do any additional setup after loading the view.
        let object = UIApplication.sharedApplication().delegate
        appDelegate = object as! AppDelegate
        
        let space: CGFloat = 3.0
        let dimension = (view.frame.size.width - (2*space)) / space
        flowLayout.minimumInteritemSpacing = space
        flowLayout.minimumLineSpacing = space
        flowLayout.itemSize = CGSizeMake(dimension, dimension)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
//    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
//        if (segue.identifier == "segueToMemeDetail") {
//            let indexPath = sender!.indexPathForSelectedRow!!
//            let meme = appDelegate.memes[indexPath.row]
//            
//            let memeDetailVC = segue.destinationViewController as! MemeDetailViewController
//            memeDetailVC.memeImageView.image = meme.memedImage!
//            
//            // Pass the selected object to the new view controller.
//            presentViewController(memeDetailVC, animated: true, completion: nil)
//        }
//    }

    override func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        let meme = appDelegate.memes[indexPath.row]
        
        let memeDetailVC = storyboard?.instantiateViewControllerWithIdentifier("MemeDetailViewController") as! MemeDetailViewController
        memeDetailVC.memedImage = meme.memedImage!
        
        // Pass the selected object to the new view controller.
        presentViewController(memeDetailVC, animated: true, completion: nil)
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
