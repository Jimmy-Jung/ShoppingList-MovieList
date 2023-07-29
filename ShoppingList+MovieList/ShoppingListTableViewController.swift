//
//  ShoppingListTableViewController.swift
//  ShoppingList+MovieList
//
//  Created by 정준영 on 2023/07/29.
//

import UIKit

/// 쇼핑리스트 테이블뷰컨트롤러
final class ShoppingListTableViewController: UITableViewController {
    // MARK: - IBOutlet
    
    /// 추가 텍스트필드
    @IBOutlet weak var addingTextField: UITextField!
    typealias UM = UserDefaultManager
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }
    
    // MARK: - Private Methods
    
    /// 테이블뷰 세팅
    private func setupTableView() {
        tableView.rowHeight = 63
        tableView.tableHeaderView?.frame.size.height = 63
    }
    
    // MARK: - IBAction
    
    /// 추가버튼 선태
    @IBAction func addingButtonTapped(_ sender: UIButton) {
        guard let text = addingTextField.text, !text.isEmpty else {return}
        UM.shoppingList.append(
            ShoppingList(listName: text, isChecked: false, isImportant: false)
        )
        addingTextField.text = ""
        // 테이블뷰 전체 reloadData()보다 효율적인 insert(at:with) 메서드
        tableView.insertRows(
            at: [IndexPath(row: UM.shoppingList.count - 1, section: 0)],
            with: .right
        )
    }
    
    // MARK: - Table view data source
    
    /// 셀 열 수
    override func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int
    ) -> Int {
        return UM.shoppingList.count
    }
    
    /// 셀 세팅
    override func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: ShoppingListTableViewCell.identifier
        ) as! ShoppingListTableViewCell
        
        cell.configure(
            shoppingList: UM.shoppingList[indexPath.row],
            at: indexPath.row
        )
        cell.reloadData = self.tableView.reloadData
        return cell
    }
    
    /// 섹션 헤더 타이트
    override func tableView(
        _ tableView: UITableView,
        titleForHeaderInSection section: Int
    ) -> String? {
        return "쇼핑 리스트"
    }
    
    /// 셀 지우기
    override func tableView(
        _ tableView: UITableView,
        commit editingStyle: UITableViewCell.EditingStyle,
        forRowAt indexPath: IndexPath
    ) {
        if editingStyle == .delete {
            UM.shoppingList.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .left)
        }
    }
    
}
