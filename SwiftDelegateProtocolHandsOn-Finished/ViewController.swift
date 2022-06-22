//
//  ViewController.swift
//  SwiftDelegateProtocolHandsOn-Starter
//
//  Created by Gerson Janhuel on 22/06/22.
//

import UIKit

// 4# Delegate conforms to the delegator protocol
class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, AddNewViewControllerDelegate {
    
    @IBOutlet weak var tableView: UITableView!
        
    var todoItems: [String] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addNewTodo))
    }
    
    @objc func addNewTodo() {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "AddNewViewController") as! AddNewViewController
        
        // 5# Delegate sign the contract
        vc.delegate = self
        
        navigationController?.present(UINavigationController(rootViewController: vc), animated: true)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todoItems.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        cell.textLabel?.text = todoItems[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
    // 6# Delegate implements the protocols AddNewViewControllerDelegate
    func didAddNewItem(item: String) {
        // detail implementation that Delegator doesnt need to know
        todoItems.append(item)
        tableView.reloadData()
        
        print("new item successfully added to the table!")
    }

}
