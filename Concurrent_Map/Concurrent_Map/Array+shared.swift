//
//  Array+shared.swift
//  Concurrent_Map
//
//  Created by Kaichi Momose on 2018/05/09.
//  Copyright © 2018 Kaichi Momose. All rights reserved.
//

import Foundation

extension Array {
    func concurrentMap<T>(_ transform: (Element) throws -> T) rethrows -> [T] {
        var resultArray = Array<T?>.init(repeating: nil, count: self.count)
        let serialQueue = DispatchQueue(label: "Serial")
        DispatchQueue.concurrentPerform(iterations: self.count) { (index) in
            serialQueue.sync {
                resultArray[index] = transform(self[index])
            }
        }
        
        return resultArray as! [T]
    }
}
