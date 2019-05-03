//
//  ItemStorage.swift
//  fakestagram
//
//  Created by Pablo Corona Flores  on 5/3/19.
//  Copyright © 2019 3zcurdia. All rights reserved.
//

import Foundation

class ItemStorage<T> where T: Codable {
    public var item: T?
 // private let store: CodableStore<T>
    private let archive: CodableStorage<T>
    
    init(filename: String) {
//        StorageType.permanent.ensureExists()
//        store = CodableStore<T>(filename: filename)
//        item = store.load()
        archive = CodableStorage<T>(filename: filename)
        item = archive.load()
    }
    
    func save() {
        guard let payload = item else { return }
    //  store.save(data: payload)
        _ = archive.save(data: payload)
    }
}
