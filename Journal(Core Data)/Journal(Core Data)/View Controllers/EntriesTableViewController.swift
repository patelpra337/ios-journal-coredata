//
//  EntriesTableViewController.swift
//  Journal(Core Data)
//
//  Created by patelpra on 4/22/20.
//  Copyright © 2020 Crus Technologies. All rights reserved.
//

import UIKit
import CoreData

class EntriesTableViewController: UITableViewController {
    
    var entryController = EntryController()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tableView.reloadData()
    }
    

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.entryController.entries.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "EntryCell", for: indexPath) as? EntryTableViewCell else { return  UITableViewCell() }
        
        let entry = self.entryController.entries[indexPath.row]
        cell.entry = entry

        return cell
    }

    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let entry = self.entryController.entries[indexPath.row]
            self.entryController.deleteEntry(entry: entry)
            self.tableView.reloadData()
        }
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "AddNewSegue" {
            guard let detailVC = segue.destination as? CreateEntryViewController else { return }
            detailVC.entryController = self.entryController
        } else if segue.identifier == "DetailViewSegue" {
            guard let detailVC = segue.destination as? CreateEntryViewController,
                let indexPath = self.tableView.indexPathForSelectedRow else { return }
            
            let entry = self.entryController.entries[indexPath.row]
            detailVC.entryController = self.entryController
            detailVC.entry = entry
        }
    }
}
