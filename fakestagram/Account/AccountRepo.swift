//
//  AccountRepo.swift
//  fakestagram
//
//  Created by LuisE on 3/17/19.
//  Copyright © 2019 3zcurdia. All rights reserved.
//

import Foundation

class AccountRepo {
    static let shared = AccountRepo()
    //let restClient = RestClient<Account>(client: Client(), path: "/api/accounts")
    private let client = AccountClient()
    private let storage = CodableStorage<Account>(filename: "account.json")
    typealias accountResponse = (Account) -> Void
    func loadOrCreate(success: accountResponse?) {
        if let account = load() {
            success?(account)
            return
        }
        let newAccount = Account.initialize()
       //create(newAccount) { account in
         create(newAccount) { [weak self] account in
            success?(account)
//            AccountStorage.shared.item = account
//            AccountStorage.shared.save()
            _ = self?.storage.save(data: account)
        }
    }

    func load() -> Account? {
    //  return AccountStorage.shared.item
        return storage.load()
    }
    
    func create(_ account: Account, success: @escaping (Account) -> Void) {
        //restClient.create(codable: account, success: success)
        client.create(codable: account, success: success)
    }
}
