//
//  DispatchQueueUnitTest.swift
//  ReadersWritersProblem
//
//  Created by Chase Wang on 2/23/17.
//  Copyright © 2017 Make School. All rights reserved.
//

import XCTest
@testable import ReadersWritersProblem

extension DispatchQueue {
    static func lock(resourse: Any){
        objc_sync_enter(resourse)
    }
    
    static func unlock(resourse: Any){
        objc_sync_exit(resourse)
    }
}

class DispatchQueueUnitTests: XCTestCase {
    
    let iterations = 200_000
    
    var user: DQUser!
    
    override func setUp() {
        super.setUp()
        user = DQUser.current
    }
    
    func testDispatchQueueReadersWritersProblem() {
        // solve with dispatch queues
//        let expectation = self.expectation(description: "com.makeschool.expectation")
        
        let dispatchGroup = DispatchGroup()
        
//        for _ in 0..<iterations {
//            print("read: \(user.age)")
//            dispatchGroup.enter()
//
//            DispatchQueue.global().async {
//                DispatchQueue.lock(resourse: self.user)
//                self.user.age += 1
//                DispatchQueue.unlock(resourse: self.user)
//                dispatchGroup.leave()
//            }
//
//        }
//
//        dispatchGroup.notify(queue: .main) {
////            expectation.fulfill()
//            XCTAssertEqual(self.iterations, self.user.age)
//        }
        
        for _ in 0..<iterations {
            DispatchQueue.global().async(group: dispatchGroup) {
//                print("read: \(self.user.age)")
                DispatchQueue.lock(resourse: self.user)
                self.user.age += 1
                DispatchQueue.unlock(resourse: self.user)
            }

        }

        dispatchGroup.wait()
//        expectation.fulfill()
        XCTAssertEqual(self.iterations, self.user.age)
        
//        waitForExpectations(timeout: 15, handler: nil)
    }
    
}
