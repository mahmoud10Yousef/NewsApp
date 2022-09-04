//
//  NetworkManager.swift
//  NewsApp
//
//  Created by mahmoud yousef on 03/08/2022.
//

import Foundation
import Alamofire

class NetworkManager {
    
    static let shared = NetworkManager()
    
    private init(){
        
    }
    
    func fetchData<T:Codable>(url:String?,decodable:T.Type,completion: @escaping (Result<T,ErrorMessage>)->Void) {
        
        guard let url = URL(string: url!) else {
            completion(.failure(.invalidURL))
            return
        }
        
        AF.request(url, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil).response { response in
            
            switch response.result {
            case .success:
                
                guard let data = response.data else {
                    completion(.failure(.invalidData))
                    return
                }
                
                print(data.count)
                do{
                    let decoder = JSONDecoder()
                    
                    let response = try decoder.decode(T.self, from: data)
                    
                    completion(.success(response))
                }catch{
                    completion(.failure(.invalidResponse))
                }
                
            case .failure:
                completion(.failure(.invalidData))
            }
            
        }
        
    }
}
