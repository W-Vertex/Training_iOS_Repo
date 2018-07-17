//
//  Connector.swift
//  TrainingiOS
//
//  Created by 이병찬 on 2018. 7. 3..
//  Copyright © 2018년 Woolim. All rights reserved.
//

import Foundation
import RxSwift
import RxAlamofire

public class Connector{
    
    static let instance = Connector()
    
    private init(){}
    
    func request(subPath: String, method: String) -> URLRequest{
        var request = URLRequest(url: URL(string: "https://s3-us-west-2.amazonaws.com" + subPath)!)
        request.httpMethod = method
        return request
    }
    
}

extension URLRequest{
    
    @discardableResult func decodeData<T>(decodeType: T.Type) -> Observable<(Int, T?)> where T: Codable{
        return requestData(self)
            .single()
            .map{ response, data in (response.statusCode, data) }
            .map{
                let decodeData = try! JSONDecoder().decode(decodeType, from: $0.1)
                return ($0.0, decodeData)
            }
    }
    
}
