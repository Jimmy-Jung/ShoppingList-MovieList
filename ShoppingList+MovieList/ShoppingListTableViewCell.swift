//
//  ShoppingListTableViewCell.swift
//  ShoppingList+MovieList
//
//  Created by 정준영 on 2023/07/29.
//

import UIKit

final class ShoppingListTableViewCell: UITableViewCell {
    static let identifier = "ShoppingListTableViewCell"
    typealias UM = UserDefaultManager
    @IBOutlet weak var checkBoxButton: UIButton!
    @IBOutlet weak var importantButton: UIButton!
    @IBOutlet weak var todoLabel: UILabel!
    private var row: Int = 0
    public var reloadData: (() -> ())?
    
    private var shoppingList: ShoppingList? {
        didSet {
            guard let shoppingList else {return}
            checkBoxButton.setImage(
                UIImage(systemName: shoppingList.isChecked ? "checkmark.square" : "square"),
                for: .normal
            )
            importantButton.setImage(
                UIImage(systemName: shoppingList.isImportant ? "star.fill" : "star"),
                for: .normal
            )
            todoLabel.text = shoppingList.listName
        }
    }
    
   public func configure(shoppingList: ShoppingList, at row: Int) {
        self.shoppingList = shoppingList
        self.row = row
    }
    
    @IBAction func checkButtonTapped(_ sender: UIButton) {
        UM.shoppingList[row].isChecked.toggle()
        reloadData?()
    }
    
    @IBAction func importantButtonTapped(_ sender: UIButton) {
        UM.shoppingList[row].isImportant.toggle()
        reloadData?()
    }
    
}
