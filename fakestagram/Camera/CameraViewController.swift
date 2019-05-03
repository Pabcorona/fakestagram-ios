//
//  CameraViewController.swift
//  fakestagram
//
//  Created by Pablo Corona Flores  on 4/27/19.
//  Copyright © 2019 3zcurdia. All rights reserved.
//

import UIKit

class CameraViewController: UIViewController {
    let client = createPostClient()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func onTapSnap(_ sender: UIButton) {
        print("post")
        guard let img = UIImage(named: "dogg"), let imgBase64 = img.encodedBase64() else { return }
        let payload = CreatePostBase64(title: "dogg - \(Date().currentTimestamp())", imageData: imgBase64)
        client.create(payload: payload) { post in
            print(post)
        }
        
    }
    
}
