//
//  MemeDetailViewController.swift
//  MemeMe
//
//  Created by Shai Bruhis on 12/13/15.
//  Copyright © 2015 Shai Bruhis. All rights reserved.
//

import UIKit

class MemeDetailViewController: UIViewController {

    var meme = Meme()
    
    @IBOutlet weak var memeImageView: UIImageView!
    @IBOutlet weak var editButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        memeImageView.image = meme.memedImage
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "segueToEditMeme") {
            let editMemeVC = segue.destinationViewController as! MemeEditorViewController
            editMemeVC.meme = meme
        }
    }
}
