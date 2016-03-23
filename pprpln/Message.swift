//
//  Message.swift
//  pprpln
//
//  Created by Diana Nedkova on 3/4/16.
//  Copyright © 2016 Diana Nedkova. All rights reserved.
//

import UIKit


class Message {
    
    var username: String
    var photo: UIImage?
    var content: String
    var messageImage: UIImage?
    var liked: Bool
    var forwarded: Bool
    var deleted: Bool
    
    init(username: String, photo: UIImage?, content: String, messageImage: UIImage?, liked: Bool, forwarded: Bool, deleted: Bool) {
        
        self.username = username
        self.photo = photo
        self.content = content
        self.messageImage = messageImage
        self.liked = liked
        self.forwarded = forwarded
        self.deleted = deleted
    
    }
}
