//
//  CreatePostClient.swift
//  fakestagram
//
//  Created by Pablo Corona Flores  on 4/27/19.
//  Copyright © 2019 3zcurdia. All rights reserved.
//

import Foundation

struct CreatePostBase64: Codable {
    let title: String
    let imageData: String
}

class createPostClient{
    private let client = Client()
    private let path = "/api/posts"
    let encoder: JSONEncoder = {
        let encoder = JSONEncoder()
        encoder.keyEncodingStrategy = .convertToSnakeCase
        return encoder
    }()
    
    let decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }()
    
    init() {
    }
    
    func create(payload: CreatePostBase64, success:@escaping (Post)-> Void) {
        guard let data = try? encoder.encode(payload) else {return}
        client.request("Post", path: path, body: data, completionHandler: { (response, data) in
            if response.successful(){
                guard let data = data else {
                    print("Empty response")
                    return
                }
                 do {
                    let json = try self.decoder.decode(Post.self, from: data)
                    success(json)
                } catch let err{
                    print("Error on serialitation: \(err.localizedDescription)")
                }
                
            } else {
            print("Error on Reponse:\(response.rawResponse) - \(response.status): \nBody: \(String(describing: data))")
            }
            
        }, errorHandler: onError(error:))
    }

 
    private func onError(error: Error? ) -> Void {
        guard let err = error else { return }
        print("Error on post Request: \(err.localizedDescription)")
    }
    
}
