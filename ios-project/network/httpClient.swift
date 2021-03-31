//
//  httpClient.swift
//  ios-project
//
//  Created by Kaining Xin on 29/03/2021.
//

import Foundation
import PromiseKit



enum AirTableError: Error{
    case noDataError
    case jsonDataFormatError
}

class HttpClient {
    private static let session = URLSession.shared
    
//    static func get<T>(url: String,isList:Bool) -> Promise<[Record<T>]> {
//        
//        let url1 = URL(string: url)
//        guard let urlRequest = url1  else {
//            fatalError()
//        }
//        
//        var request = URLRequest(url: urlRequest)
//        request.httpMethod = "GET"
//        request.setValue("Bearer \(Constants.key)", forHTTPHeaderField: "Authorization")
//        
//        return firstly{
//            session.dataTask(.promise, with: request)
//        }.compactMap{
//            var response: [Record<T>] = []
//            if (isList){
//                response = try JSONDecoder().decode(Response<T>.self, from:$0.data).records
//            }else{
//                response[0] = try JSONDecoder().decode(Record<T>.self, from:$0.data)
//            }
//            print(response)
//            return response
//        }
//    }
    
    static func get<T>(url: String,isList:Bool) ->Promise<[Record<T>]>{
        return Promise { seal in
            let url1 = URL(string: url)
            guard let urlRequest = url1  else {
                fatalError()
            }
            var request = URLRequest(url: urlRequest)
            request.httpMethod = "GET"
            request.setValue("Bearer \(Constants.key)", forHTTPHeaderField: "Authorization")
            
            URLSession.shared.dataTask(with: request){data,response,error in
                
                if let error = error {
                    print("Error took place \(error)")
                    return
                }
                
                // Read HTTP Response Status code
                if let response = response as? HTTPURLResponse {
                    print("Response HTTP Status code: \(response.statusCode)")
                }
                
                
                do{
                    var response: [Record<T>] = []
                    if (isList){
                        response = try JSONDecoder().decode(Response<T>.self, from:data!).records
                    }else{
                        response.append(try JSONDecoder().decode(Record<T>.self, from:data!))
                    }
                    seal.fulfill(response)
                }catch{
                    print(error)
                }
                
               
            }.resume()
            
        }
    }
    
    
}


