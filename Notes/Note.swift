//
//  Note.swift
//  Notes
//
//  Created by Kafilah on 8/18/16.
//  Copyright © 2016 Kafilah. All rights reserved.
//

import UIKit

class Note: AnyObject {
    var title: String?
    var message: String?
    
    init (title:String?, message: String?) {
        self.title = title
        self.message = message
    }
}
