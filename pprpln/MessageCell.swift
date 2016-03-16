//
//  MessageCell.swift
//  pprpln
//
//  Created by Diana Nedkova on 3/13/16.
//  Copyright © 2016 Diana Nedkova. All rights reserved.
//

import UIKit

class MessageCell: UITableViewCell {

    var inboxViewController: InboxViewController!
    
    @IBOutlet weak var usernameLabel: UILabel!
    
    @IBOutlet weak var photoImageView: UIImageView!
    
    @IBOutlet weak var contentLabel: UILabel!
    
    @IBOutlet weak var contentImageView: UIImageView!
    
    @IBOutlet weak var likedButton: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    @IBAction func onTapFavButton(sender: UIButton) {
        sender.selected = !sender.selected
        
        inboxViewController.onTapFavButton(self, button: sender)
        
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
