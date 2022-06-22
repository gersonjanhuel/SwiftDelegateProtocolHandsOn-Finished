//
//  AddNewViewController.swift
//  ExploreProtocolAndDelegate
//
//  Created by Gerson Janhuel on 20/06/22.
//

import UIKit

// 1. create protocols
protocol AddNewViewControllerDelegate: AnyObject {
    func didAddNewItem(item: String)
}

class AddNewViewController: UIViewController {
    
    @IBOutlet weak var textField: UITextField!
    
    // 2# Delegator creates delegate reference
    weak var delegate: AddNewViewControllerDelegate?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        
        navigationItem.title = "Add New Todo"
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(dismissView))
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(saveNewData))
        
    }
    
    @objc func dismissView() {
        dismiss(animated: true)
    }
    
    @objc func saveNewData() {
        if let newTodo = textField.text {
            // 3. define delegate actions
            delegate?.didAddNewItem(item: newTodo)
        }
        
        dismissView()
    }
    
}
