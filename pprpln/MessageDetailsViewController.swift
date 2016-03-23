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
    
    
    @IBAction func onTapForwardButton(sender: UIButton) {

        
        let toastLabel = UILabel(frame: CGRectMake(self.view.frame.size.width/2 - 150, self.view.frame.size.height-100, 300, 35))
        
        toastLabel.backgroundColor = UIColor.blackColor()
        toastLabel.textColor = UIColor.whiteColor()
        toastLabel.textAlignment = NSTextAlignment.Center;
        self.view.addSubview(toastLabel)
        toastLabel.text = "Message forwarded"
        toastLabel.alpha = 1.0
        toastLabel.layer.cornerRadius = 10;
        toastLabel.clipsToBounds  =  true

        
        UIView.animateWithDuration(1.5, delay: 0.1, options: UIViewAnimationOptions.CurveEaseOut, animations: { () -> Void in
            toastLabel.alpha = 0.0
            }, completion: { (Bool) -> Void in self.navigationController?.popViewControllerAnimated(true)})
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
