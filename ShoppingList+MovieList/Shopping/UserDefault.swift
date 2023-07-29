//
//  UserDefault.swift
//  ShoppingList+MovieList
//
//  Created by 정준영 on 2023/07/29.
//

import Foundation


@propertyWrapper
/// 유저 디퐅트 커스텀 타입
struct UserDefaultCustomType<T: Codable> {
    private let key: String
    private let defaultValue: T
    
    init(key: String, defaultValue: T) {
        self.key = key
        self.defaultValue = defaultValue
    }
    
    var wrappedValue: T {
        get {
            if let savedData = UserDefaults
                .standard
                .object(forKey: key) as? Data {
                if let loadedObject = try? PropertyListDecoder()
                    .decode(T.self, from: savedData) {
                    return loadedObject
                }
            }
            return defaultValue
        }
        set {
            if let encoded = try? PropertyListEncoder()
                .encode(newValue) {
                UserDefaults.standard.setValue(encoded, forKey: key)
            }
        }
    }
}

/// 유저 디폴드 관리
struct UserDefaultManager {
    @UserDefaultCustomType(
        key: KeyEnum.shoppingList.rawValue,
        // 초기 값
        defaultValue: [
            ShoppingList(
                listName: "그립톡 구매하기",
                isChecked: true,
                isImportant: true
            ),
            ShoppingList(
                listName: "사이다 구매",
                isChecked: false,
                isImportant: false
            ),
            ShoppingList(
                listName: "아이패드 케이스 최저가 알아보기",
                isChecked: false,
                isImportant: true
            ),
            ShoppingList(
                listName: "양말",
                isChecked: false,
                isImportant: true
            )
        ]
    )
    static var shoppingList: [ShoppingList]
    
    enum KeyEnum: String {
        case shoppingList
    }
}
