//
//  ImagesStore.swift
//  fakestagram
//
//  Created by Pablo Corona Flores  on 4/26/19.
//  Copyright © 2019 3zcurdia. All rights reserved.
//

//import Foundation
//import UIKit
//
//struct ImagesStrore {
//    let filename: String
//    
//    
//    var fileUrl: URL?{
//        var fileUrl = StorageType.permanent.url
//        fileUrl.appendPAthCompoonent(filename)
//        return fileUrl
//    }
//    
//}
//
//func load() -> UIImage? {
//    guard let url = fileUrl else{
//        print("Unable to load url")
//        return nil
//   }
//    return UIImage(data: data)
//}
//func save (data: UIImage) -> Bool{
//    guard let url = fileUrl else{
//        print("Unable to load jpeg data representation")
//        return false
//   }
//    
//    do{
//     try data.write(to: url)
//        return true
//    } catch let err {
//        print("Unable to write on disk: \(err.localizedDescription)")
//        return false
//   }
//}

import Foundation
import UIKit

class ImageStorage {
    let filename: String
    let dataContainer = DataContainer.permanent
    
    init(filename: String) {
        self.filename = filename
    }
    
    func load() -> UIImage? {
        guard let data = dataContainer.load(filename: filename) else {
            return nil
        }
        
        return UIImage(data: data)
    }
    
    func save(image: UIImage) -> Bool {
        guard let data = image.jpegData(compressionQuality: 0.95) else {
            print("Unable to load jpeg data representation")
            return false
        }
        return dataContainer.save(data: data, in: filename)
    }
}
