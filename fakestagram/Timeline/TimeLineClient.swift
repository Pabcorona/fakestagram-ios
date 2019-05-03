//
//  TimeLineClient.swift
//  fakestagram
//
//  Created by Pablo Corona Flores  on 4/27/19.
//  Copyright © 2019 3zcurdia. All rights reserved.
//

import Foundation

class TimelineClient: RestClient<[Post]> {
    convenience init() {
        self.init(client: Client(), path: "/api/posts")
    }
}
