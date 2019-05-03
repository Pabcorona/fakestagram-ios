//
//  AccountClient.swift
//  fakestagram
//
//  Created by Pablo Corona Flores  on 4/25/19.
//  Copyright © 2019 3zcurdia. All rights reserved.
//

import Foundation

class AccountClient: RestClient<Account> {
    convenience init() {
        self.init(client: Client(), path: "/api/accounts")
    }
}
