//
//  ShoppingList.swift
//  ShoppingList+MovieList
//
//  Created by 정준영 on 2023/07/29.
//

import Foundation


struct ShoppingList: Codable {
    let listName: String
    var isChecked: Bool
    var isImportant: Bool
}
