//
//  ShoppingList.swift
//  ShoppingList+MovieList
//
//  Created by 정준영 on 2023/07/29.
//

import Foundation


/// 쇼핑 리스트
struct ShoppingList: Codable {
    let listName: String
    var isChecked: Bool
    var isImportant: Bool
}
