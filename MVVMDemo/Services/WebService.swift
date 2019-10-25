//
//  WebService.swift
//  MVVMDemo
//
//  Created by Satish Kumar on 12/07/19.
//  Copyright © 2019 Brillio Technologies. All rights reserved.
//

import Foundation

class WebServices {
    
    func getArticel(url: URL, completion: @escaping ([Article]?) -> ()) {
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print(error.localizedDescription)
                completion(nil)
            }else if let data = data{
               let articels = try? JSONDecoder().decode(Articles.self, from: data).articles
                if let articlesList = articels {
                    completion(articlesList)
                }
     
            }
        }.resume()
    }
    
}
