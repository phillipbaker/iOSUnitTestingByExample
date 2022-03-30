//
//  TestError.swift
//  NetworkResponseTests
//
//  Created by Phillip Baker on 3/30/22.
//

import Foundation

struct TestError: LocalizedError {
    let message: String
    
    var errorDescription: String? { message }
}
