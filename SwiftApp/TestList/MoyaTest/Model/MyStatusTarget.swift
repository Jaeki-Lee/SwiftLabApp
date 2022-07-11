//
//  MyStatusTarget.swift
//  SwiftApp
//
//  Created by jaeki lee on 2022/07/11.
//

import Foundation
import Moya

public enum MyStatusTarget {
    case version
}

extension MyStatusTarget: TargetType {
    //NetworManager 로 부터 받아오는 baseURL
    public var baseURL: URL {
        guard let url = URL(string: NetworkManger.enviorment.rawValue) else { fatalError("fatal error - invalid url")
        }
        return url
    }
    
    //url 뒤의 path
    public var path: String {
        switch self {
        case .version:
            return "version"
        }
    }
    
    //path GET POST DELETE UPDATE
    public var method: Moya.Method {
        switch self {
        case .version:
            return .get
        }
    }
    
    public var sampleData: Data {
        switch self {
        case .version:
            return "{\"latestVersion\":\"1.1.0\",\"minimumVersion\":\"1.0.0\"}".data(using: .utf8)!
        }
    }
    
    public var task: Task {
        switch self {
        case .version:
            return .requestPlain
        }
    }
    
    public var headers: [String : String]? {
        return ["Content-Type": "application/json"]
    }
    
    public var validationType: ValidationType {
        return .successCodes
    }
}
