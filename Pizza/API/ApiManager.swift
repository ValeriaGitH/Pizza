//
//  ApiManager.swift
//  DraftUIKit
//
//  Created by Valeria Keshishyan on 23.02.2023.
//

import Foundation

class MenuApiManager{
        
    let headers = [
     "X-RapidAPI-Key": "90ab760ffemsh0584ca4a89816fcp1d5fe9jsnd9cd22fed675",
     "X-RapidAPI-Host": "pizzaallapala.p.rapidapi.com"
    ]
    
    let urlPizza = URL(string: "https://pizzaallapala.p.rapidapi.com/productos")
    
    func obtainPizzaProducts(completion: @escaping ([Producto]) -> Void) {
        guard let url = urlPizza else {return}
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers
        
        let task = URLSession.shared.dataTask(with: request){ data, response, error in
            
            guard let data else {
                let dataLast  = UserDefaults.standard.object(forKey: "data") as? Data ?? Data()
                if let menuData = try? JSONDecoder().decode(MenuViewModel.self, from: dataLast){
                    completion(menuData.productos)
                }
                return
            }
            
            //парсинг
            if let menuData = try? JSONDecoder().decode(MenuViewModel.self, from: data){
                completion(menuData.productos)
                UserDefaults.standard.set(data, forKey: "data")
            }
            
        }
             
        task.resume()
    }
}
