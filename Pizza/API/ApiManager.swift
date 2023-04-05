//
//  ApiManager.swift
//  DraftUIKit
//
//  Created by Valeria Keshishyan on 23.02.2023.
//

import Foundation

class ApiManager{
    
    static let shared = ApiManager()
    
    let headers = [
     "X-RapidAPI-Key": "90ab760ffemsh0584ca4a89816fcp1d5fe9jsnd9cd22fed675",
     "X-RapidAPI-Host": "pizzaallapala.p.rapidapi.com"
    ]
    
    let urlPizza = URL(string: "https://pizzaallapala.p.rapidapi.com/productos")
    
    func GetPizza(completion: @escaping ([Producto]) -> Void) {
        guard let url = urlPizza else {return}
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers
        
        let task = URLSession.shared.dataTask(with: request){ data, response, error in
            
            guard let data else {
                let d = UserDefaults.standard.object(forKey: "data") as! Data
                if let welcomeData = try? JSONDecoder().decode(Welcome.self, from: d){
                    completion(welcomeData.productos)
                }
                return
            }
            
            //парсинг
            if let welcomeData = try? JSONDecoder().decode(Welcome.self, from: data){
                completion(welcomeData.productos)
                UserDefaults.standard.set(data, forKey: "data")
            }
            
        }
             
        task.resume()
    }
}
