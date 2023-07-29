//
//  ShoppingListTableViewController.swift
//  ShoppingList+MovieList
//
//  Created by 정준영 on 2023/07/29.
//

import UIKit

final class ShoppingListTableViewController: UITableViewController {

    @IBOutlet weak var addingTextField: UITextField!
    typealias UM = UserDefaultManager
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        print(UM.shoppingList)
    }
    
    private func setupTableView() {
        tableView.rowHeight = 63
        tableView.tableHeaderView?.frame.size.height = 63
    }

    @IBAction func addingButtonTapped(_ sender: UIButton) {
        guard let text = addingTextField.text, !text.isEmpty else {return}
        UM.shoppingList.append(
            ShoppingList(listName: text, isChecked: false, isImportant: false)
        )
        addingTextField.text = ""
        tableView.insertRows(at: [IndexPath(row: UM.shoppingList.count - 1, section: 0)], with: .right)
    }
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return UM.shoppingList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ShoppingListTableViewCell.identifier) as! ShoppingListTableViewCell
        cell.configure(
            shoppingList: UM.shoppingList[indexPath.row],
            at: indexPath.row
        )
        cell.reloadData = self.tableView.reloadData
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "쇼핑 리스트"
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            UM.shoppingList.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .left)
        }
    }
    
}
