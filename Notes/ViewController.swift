//
//  ViewController.swift
//  Notes
//
//  Created by Kafilah on 8/18/16.
//  Copyright © 2016 Kafilah. All rights reserved.
//

import UIKit

class NoteTableViewController: UITableViewController {
    
    var notes: [Note] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .Add, target:self, action: #selector(addNote))
    }
    
    
    func addNote() {
        
        let note = Note(title: nil, message: nil)
        
        let editViewController = NoteEditViewController(note: note)
        
        let navController = UINavigationController(rootViewController:
        editViewController)
        
        self.presentViewController(navController, animated: true) {
            self.notes.append(note)
            self.tableView.reloadData()
            return
        }
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notes.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let tableViewCell = UITableViewCell(style: .Subtitle, reuseIdentifier: nil)
        
        let note = notes[indexPath.row]
        
        tableViewCell.textLabel?.text = note.title
        tableViewCell.detailTextLabel?.text = note.message
        
        return tableViewCell;
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath
        indexPath: NSIndexPath) {
        let note = notes[indexPath.row]
        
        let noteEditViewController = NoteEditViewController(note:note)
        let navController = UINavigationController ( rootViewController: noteEditViewController)
        
        
        self.presentViewController(navController, animated: true) {
            self.tableView.reloadData()
        }
    }
    
    override func tableView(tableView: UITableView,
        canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }

    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            notes.removeAtIndex(indexPath.row)
            tableView.reloadData()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

