//
//  SemaphoreUnitTests.swift
//  ReadersWritersProblem
//
//  Created by Chase Wang on 2/23/17.
//  Copyright © 2017 Make School. All rights reserved.
//

import XCTest
@testable import ReadersWritersProblem

class SemaphoreUnitTests: XCTestCase {
    
    let iterations = 200_000
    
    var user: SUser!
    
    override func setUp() {
        super.setUp()
        user = SUser.current
    }
    
    func testSemaphoreReadersWritersProblem() {
        // solve with semaphores
        let semaphore = DispatchSemaphore(value: 1)
        
        DispatchQueue.global().async {
            for _ in 0..<self.iterations {
                self.user.age += 1
                semaphore.wait()
//                DispatchQueue.main.async {
//                    semaphore.signal()
//                }
                
            }
        }
        
        semaphore.signal()
        XCTAssertEqual(self.iterations, self.user.age)
    }
    
}
