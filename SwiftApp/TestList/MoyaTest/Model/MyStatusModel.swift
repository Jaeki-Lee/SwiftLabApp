//
//  MyStatusModel.swift
//  SwiftApp
//
//  Created by jaeki lee on 2022/07/11.
//

import Foundation

public struct MyStatusModel: Codable {
    public struct Request{
    }
    
    public struct Response: Codable {
        public let requireVersion: String
        public let latestVerstion: String
    }
}
