//
//  Client.swift
//  fakestagram
//
//  Created by LuisE on 3/17/19.
//  Copyright © 2019 3zcurdia. All rights reserved.
//

import Foundation

typealias completionHandler = (HTTPResponse, Data?) -> Void
typealias errorHandler = (Error?) -> Void

struct Client {
    let baseURLComponents: URLComponents
    public var accept = "application/json"
    public var contentType = "application/json"
    
    init() {
        self.baseURLComponents = URLComponents(string: Secrets.host.value!)!
    }

    func request(_ method: String, path: String, body: Data?, completionHandler: completionHandler?, errorHandler: errorHandler?) {
        var requestURLComponents = baseURLComponents
        requestURLComponents.path = path
        guard let url = requestURLComponents.url else {
            print("[ERROR] Invalid path: \(path)")
            return
        }
        var request = URLRequest(url: url)
        request.setValue(accept, forHTTPHeaderField: "Accept")
        request.setValue(contentType, forHTTPHeaderField: "Content-Type")
        request.httpMethod = method
        request.httpBody = body
        //if let token = Secrets.uuid.value {
        if let token = Secrets.token.value {
                request.addValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
            }
            
        // }
        
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            if error != nil {
                errorHandler?(error)
                return
            }
            let response = HTTPResponse(reponse: response as! HTTPURLResponse)
               //completionHandler?(response, data)
            DispatchQueue.main.async {
                completionHandler?(response, data)
            }
            
        }
        task.resume()
    }
}
