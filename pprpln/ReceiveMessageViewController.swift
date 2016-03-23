//
//  ReceiveMessageViewController.swift
//  pprpln
//
//  Created by Diana Nedkova on 3/20/16.
//  Copyright © 2016 Diana Nedkova. All rights reserved.
//

import UIKit

class ReceiveMessageViewController: UIViewController {
    
    var bar: UINavigationBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        bar = self.navigationController?.navigationBar
//
//        bar.setBackgroundImage(UIImage(), forBarMetrics: UIBarMetrics.Default)
//        bar.backgroundColor = UIColor(white: 1.0, alpha: 0.0)
//        bar.shadowImage = UIImage()
        

    }
    override func viewWillAppear(animated: Bool) {
        
        
        bar = self.navigationController?.navigationBar
        
        bar.setBackgroundImage(UIImage(), forBarMetrics: UIBarMetrics.Default)
        bar.shadowImage = UIImage()
        
        bar.backgroundColor = UIColor(white: 1.0, alpha: 0.0)
        self.navigationItem.rightBarButtonItem?.image = UIImage(named:"Inbox.png")!.imageWithRenderingMode(.AlwaysOriginal)
    
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        let backItem = UIBarButtonItem()
        let backArrow = UIImage(named: "Back Arrow")
        backItem.title = ""
        backItem.setBackButtonBackgroundImage(backArrow, forState: UIControlState.Normal, barMetrics: UIBarMetrics.Default)
        navigationItem.backBarButtonItem = backItem
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
