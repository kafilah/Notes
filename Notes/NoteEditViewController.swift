//
//  NoteEditViewController.swift
//  Notes
//
//  Created by Kafilah on 8/18/16.
//  Copyright © 2016 Kafilah. All rights reserved.
//

import UIKit

class NoteEditViewController: UIViewController {
    
    var note: Note
    
    @IBOutlet weak var titleTextField: UITextField!
    init(note: Note) {
        self.note = note
        
        super.init(nibName: nil, bundle:nil)
    }
    
    @IBOutlet weak var messageTextView: UITextView!
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .Done, target: self, action: #selector(dismiss) )
        
        titleTextField.text = note.title
        messageTextView.text = note.message
    }
    
    func dismiss () {
        
        note.title = titleTextField.text
        note.message = messageTextView.text
        self.dismissViewControllerAnimated(true, completion: nil)
        
        //self.presentViewController(<#T##viewControllerToPresent: UIViewController##UIViewController#>, animated: <#T##Bool#>, completion: <#T##(() -> Void)?##(() -> Void)?##() -> Void#>)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
