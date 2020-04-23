//
//  EntryTableViewCell.swift
//  Journal(Core Data)
//
//  Created by patelpra on 4/22/20.
//  Copyright © 2020 Crus Technologies. All rights reserved.
//

import UIKit

class EntryTableViewCell: UITableViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var journalLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    
    var entry: Entry? {
        didSet {
            updateViews()
        }
    }
    
    func updateViews() {
        guard let entry = entry else { return }
        
        let formatter = DateFormatter()
        formatter.dateFormat = "MM/dd/yy h:mm a"
        
        titleLabel.text = entry.title
        journalLabel.text = entry.bodyText
        timeLabel.text = formatter.string(from: entry.timestamp!)
    }    
}
