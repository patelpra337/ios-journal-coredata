//
//  CreateEntryViewController.swift
//  Journal(Core Data)
//
//  Created by patelpra on 4/22/20.
//  Copyright © 2020 Crus Technologies. All rights reserved.
//

import UIKit

class CreateEntryViewController: UIViewController {

    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var bodyTextView: UITextView!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    var entry: Entry? {
        didSet {
            updateViews()
        }
    }
    
    var entryController: EntryController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
        self.toggleSaveButton()
        self.titleTextField.addTarget(self, action: #selector(toggleSaveButton), for: .editingChanged)
    }
  
    @IBAction func saveButtonTapped(_ sender: Any) {
        guard let title = titleTextField.text, !title.isEmpty, let body = bodyTextView.text,
            !body.isEmpty else { return }
        
        _ = self.bodyTextView.text
        
        if let entry = self.entry {
            self.entryController?.updateEntry(entry: entry, title: title, bodyText: body)
        } else {
            self.entryController?.createEntry(title: title, bodyText: body)
        }
        
        self.navigationController?.popViewController(animated: true)
    }
    
    func updateViews() {
        guard isViewLoaded else { return }
        
        title = entry?.title ?? "Create Entry"
        titleTextField.text = entry?.title
        bodyTextView.text = entry?.bodyText
    }
    
    @objc private func toggleSaveButton() {
        self.saveButton.isEnabled = !self.titleTextField.text!.isEmpty
    }
}

