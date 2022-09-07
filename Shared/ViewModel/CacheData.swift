//
//  CacheData.swift
//  PokeTeam_1.8
//
//  Created by Delvin Cockroft on 8/2/22.
//

import Foundation
import SwiftUI

class CacheManager {
    static let instance = CacheManager()
    private init() { }
    
    var imageCache: NSCache<NSString, UIImage> = {
        let cache = NSCache<NSString, UIImage>()
        cache.countLimit = 100
        cache.totalCostLimit = 1024 * 1024 * 100 // 100mb
        return cache
    }()
    
    func add(image: UIImage, name: String){
        imageCache.setObject(image, forKey: name as NSString)
        print("\(name) added to image cache")
    }
    func remove(name: String){
        imageCache.removeObject(forKey: name as NSString)
        print("\(name) removed from image cache")
    }
    func get(name: String) -> UIImage?{
        return imageCache.object(forKey: name as NSString)
    }
}

class CacheViewModel: ObservableObject{
    @Published var cachedImage: UIImage? = nil
    let manager = CacheManager.instance
    let response = false
    func saveToCache(image: UIImage, name: String){
        manager.add(image: image, name: name)
    }
    func removeFromCache(name: String){
        manager.remove(name: name)
    }
    func getFromCache(name: String?) -> UIImage?{
        return manager.get(name: name!)
    }
}
