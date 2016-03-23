//
//  MessageDetailsViewController.swift
//  pprpln
//
//  Created by Diana Nedkova on 3/13/16.
//  Copyright © 2016 Diana Nedkova. All rights reserved.
//

import UIKit

class MessageDetailsViewController: UIViewController {
    
    var inboxViewController: InboxViewController!
    var messageCell: MessageCell!

    @IBOutlet weak var imageView: UIImageView!
    var image: UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        imageView.image = image

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onTapBackButton(sender: AnyObject) {
        navigationController?.popViewControllerAnimated(true)
    }

    @IBAction func onTapFlagButton(sender: UIButton) {
        
        let alertController = UIAlertController(title: "Flag as spam or abusive", message: "Note: Once you have reported the message, it will be deleted from your Messages inbox.", preferredStyle: .ActionSheet)
        let logoutAction = UIAlertAction(title: "Flag message", style: .Destructive) { (action) in
            self.navigationController?.popViewControllerAnimated(true)
            
            
            self.inboxViewController.onTapFlagButton(sender)
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel, handler: nil)
        
        
        alertController.addAction(logoutAction)
        alertController.addAction(cancelAction)
        presentViewController(alertController, animated: true, completion: nil)

        
      
    }
    
    
//    @IBAction func onTapForwardButton(sender: UIButton) {
//        sender.selected = !sender.selected
//        inboxViewController.onTapForwardButton(sender)
//        
//    }
    
//    @IBAction func onTapFavButton(sender: UIButton) {
//        sender.selected = !sender.selected
//        
//        inboxViewController.onTapFavButton(self, button: sender)
//        
//    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
