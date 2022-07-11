//
//  MyStatusAPI.swift
//  SwiftApp
//
//  Created by jaeki lee on 2022/07/12.
//

import Foundation
import Moya
import RxSwift

public class MyStatusAPI {
    let bag = DisposeBag()
    
    lazy var provider: MoyaProvider<MyStatusTarget> = {
        return .init()
    }()
    
    public init() { }
    
    public func version(completion: @escaping (Result<MyStatusModel.Response, Error>) -> Void) {
//        provider.rx
//            .request(.version)
//            .filterSuccessfulStatusCodes()
//            .map(MyStatusModel.Response.self)
//            .subscribe { result in
//                switch result {
//                case .success(let response):
//                    completion(.success(response))
//                case .failure(let error):
//                    completion(.failure(error))
//                }
//            }.disposed(by: bag)
        provider.request(.version) { result in
            self.process(type: AppVersionResponse.self, result: result, completion: completion)
        }

            
    }
}

//MyStatusAPI의 다른 provider에서도, request를 json -> struct로 바꿀 때 재사용 가능하므로 제네릭으로 선언하는게 유리
extension MyStatusAPI {
    func process<T: Codable, E>(
        type: T.Type,
        result: Result<Response, MoyaError>,
        completion: @escaping (Result<E, Error>) -> Void
    ) {
        switch result {
        case .success(let response):
            if let data = try? JSONDecoder().decode(type, from: response.data){
                completion(.success(data as! E))
            }
        case .failure(let error):
            completion(.failure(error))
        }
        
    }
}
