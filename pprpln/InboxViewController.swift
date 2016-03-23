//
//  InboxViewController.swift
//  pprpln
//
//  Created by Diana Nedkova on 3/12/16.
//  Copyright © 2016 Diana Nedkova. All rights reserved.
//

import UIKit

class InboxViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    @IBOutlet weak var favFilterButton: UIBarButtonItem!
    @IBOutlet weak var tableView: UITableView!
    
//    var selectedMessageCell: UITableViewCell!
    
    var fadeTransition: FadeTransition!
    
//    var selectedMessage: UIImageView!
    
    var messages = [Message]()
    
    var allMessages = [Message]()
    
    var filtered: Bool!

    override func viewDidLoad() {
        super.viewDidLoad()
        loadMessages()
//        for i in 0..<messages.count {
//            
//            
//            if messages[i].deleted == false {
//                allMessages += [messages[i]]
//            }
//            
//        }
        allMessages = messages
        

        tableView.delegate = self
        tableView.dataSource = self
        
        filtered = false
        
        tableView.tableFooterView = UIView()
        self.title = "Messages"
        
        self.navigationItem.rightBarButtonItem?.image = UIImage(named:"Heart.png")!.imageWithRenderingMode(.AlwaysOriginal)
    
        

    }
    
    func loadMessages() {
        let photo1 = UIImage(named: "Avatar")!
        
        let inspiration1 = UIImage(named: "Inspiration1")!

        
        let message1 = Message(username: "zack", photo: photo1, content: "Start by doing what's necessary; then do what's possible; and suddenly you are doing the impossible.", messageImage: inspiration1, liked: false, forwarded: false, deleted: false)
        
        let photo2 = UIImage(named: "Avatar2")!
        let inspiration2 = UIImage(named: "Inspiration1")

        let message2 = Message(username: "Mark T.", photo: photo2, content: "Either you run the day or the day runs you.", messageImage: inspiration2, liked: false, forwarded: false, deleted: false)
        
        let photo3 = UIImage(named: "face3")!
        let inspiration3 = UIImage(named: "face1")
        
        let message3 = Message(username: "User3", photo: photo3, content: "Accept the challenges so that you can feel the exhilaration of victory.", messageImage: inspiration3, liked: true, forwarded: false, deleted: false)
        messages += [message1, message2, message3]
        
        
    }
    
    
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        // return the number of rows
        return messages.count
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cellIdentifier = "MessageCell"
        
        
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! MessageCell
        
        let message = messages[indexPath.row]
        
        cell.usernameLabel.text = message.username
        cell.photoImageView.image = message.photo
        cell.contentLabel.text = message.content
        cell.contentImageView.image = message.messageImage
        cell.contentImageView.hidden = true
        cell.likedButton.selected = message.liked
        
        cell.inboxViewController = self
        
        return cell
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        // Access the ViewController that you will be transitioning too, a.k.a, the destinationViewController.
        let destinationViewController = segue.destinationViewController as! MessageDetailsViewController
        
        let indexPath = tableView.indexPathForCell(sender as! UITableViewCell)
        let selectedMessage = messages[indexPath!.row]
        
        destinationViewController.inboxViewController = self
        
        destinationViewController.view.layoutIfNeeded()
        destinationViewController.imageView.image = selectedMessage.messageImage
        
        destinationViewController.modalPresentationStyle = UIModalPresentationStyle.Custom
        
        // Create a new instance of your fadeTransition.
        fadeTransition = FadeTransition()
        
        destinationViewController.transitioningDelegate = fadeTransition
        
        fadeTransition.duration = 1
        
        let backItem = UIBarButtonItem()
        let backArrow = UIImage(named: "Back Arrow")
        backItem.title = ""
        backItem.setBackButtonBackgroundImage(backArrow, forState: UIControlState.Normal, barMetrics: UIBarMetrics.Default)
        navigationItem.backBarButtonItem = backItem
        
        destinationViewController.title = selectedMessage.username
//        navigationController?.navigationBar.backgroundColor = UIColor(white: 1.0, alpha: 0.1)
        
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.navigationBar.backgroundColor = UIColor(white: 1.0, alpha: 1.0)
        navigationController?.navigationBar.setBackgroundImage(nil, forBarMetrics: UIBarMetrics.Default)
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onFavoriteButton(sender: UIBarButtonItem) {
        
        filtered = !filtered
        
        filterFavMessages(filtered)
        
    }
  
    
    func filterFavMessages(s: Bool) {
        var favMessages = [Message]()
        
        if s == true {
            
            for i in 0..<messages.count {
                
                
                if messages[i].liked == true {
                    favMessages += [messages[i]]
                }
                
            }
            messages = favMessages
            self.title = "Loved"
        } else {
            messages = allMessages
            self.title = "Messages"
        }
 
        
        
        let range = NSMakeRange(0, self.tableView.numberOfSections)
        let sections = NSIndexSet(indexesInRange: range)
        self.tableView.reloadSections(sections, withRowAnimation: .Fade)
        
    }
    
    func onTapFavButton(cell: UITableViewCell, button: UIButton) {
        let indexPath = tableView.indexPathForCell(cell)!
        
        messages[indexPath.row].liked = button.selected
        if filtered == true {
            filterFavMessages(true)
        }
    }
    
    func onTapFowardButton(cell: UITableViewCell, button: UIButton) {
        let indexPath = tableView.indexPathForCell(cell)!
        
        messages[indexPath.row].forwarded = button.selected
    }
    func onTapFlagButton(button: UIButton) {
        
        let selectedIndexPath = tableView.indexPathForSelectedRow
        messages.removeAtIndex(selectedIndexPath!.row)
        allMessages = messages
            
        tableView.deleteRowsAtIndexPaths([selectedIndexPath!], withRowAnimation: .Fade)
                    
                    
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
