//
//  NetworManager.swift
//  SwiftApp
//
//  Created by jaeki lee on 2022/07/11.
//

import Foundation
import Moya

//URL
enum APIEnviroment: String {
    case qa = "https://qa.com"
    case staging = "https://staging.com"
    case production = "https://production.com"
}


struct NetworkManger {
//    fileprivate let provider = MoyaProvider<>
    static let enviorment: APIEnviroment = .qa
}
