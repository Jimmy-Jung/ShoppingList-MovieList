//
//  ShoppingListTableViewCell.swift
//  ShoppingList+MovieList
//
//  Created by 정준영 on 2023/07/29.
//

import UIKit

/// 쇼핑리스트 테이블뷰 셀
final class ShoppingListTableViewCell: UITableViewCell {
    static let identifier = "ShoppingListTableViewCell"
    typealias UM = UserDefaultManager
    
    // MARK: - IBOutlet
    
    @IBOutlet weak var checkBoxButton: UIButton!
    @IBOutlet weak var importantButton: UIButton!
    @IBOutlet weak var todoLabel: UILabel!
    
    // MARK: - Private Properties
    
    /// 테이블뷰 열
    private var row: Int = 0
    /// 쇼핑리스트 받아서 UI 업데이트
    private var shoppingList: ShoppingList? {
        didSet {
            guard let shoppingList else {return}
            checkBoxButton.setImage(
                UIImage(systemName: shoppingList.isChecked ? "checkmark.square.fill" : "square"),
                for: .normal
            )
            importantButton.setImage(
                UIImage(systemName: shoppingList.isImportant ? "star.fill" : "star"),
                for: .normal
            )
            todoLabel.text = shoppingList.listName
        }
    }
    // MARK: - Public Properties
    
    /// ViewController에서 tableView.reloadData 받아오기
    public var reloadData: (() -> ())?
    /// shoppingList와 테이블뷰 열 받아오기
    /// - Parameters:
    ///   - shoppingList: ShoppingList
    ///   - row: TableView indexPath.row
    public func configure(shoppingList: ShoppingList, at row: Int) {
        self.shoppingList = shoppingList
        self.row = row
    }
    
    ///  체크 버튼 선택
    @IBAction func checkButtonTapped(_ sender: UIButton) {
        UM.shoppingList[row].isChecked.toggle()
        reloadData?()
        UIView.animate(withDuration: 0.3, animations: {
            self.checkBoxButton.transform = CGAffineTransform(scaleX: 1.1, y: 1.1)
        }) { _ in
            UIView.animate(withDuration: 0.3) {
                self.checkBoxButton.transform = .identity
            }
        }
    }
    
    /// 중요 버튼 선태
    @IBAction func importantButtonTapped(_ sender: UIButton) {
        UM.shoppingList[row].isImportant.toggle()
        reloadData?()
        UIView.animate(withDuration: 0.3, animations: {
            self.importantButton.transform = CGAffineTransform(scaleX: 1.1, y: 1.1)
        }) { _ in
            UIView.animate(withDuration: 0.3) {
                self.importantButton.transform = .identity
            }
        }
    }
    
}
