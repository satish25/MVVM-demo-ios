//
//  Article.swift
//  MVVMDemo
//
//  Created by Satish Kumar on 12/07/19.
//  Copyright © 2019 Brillio Technologies. All rights reserved.
//

import Foundation


struct Articles: Decodable {
    let articles: [Article]
}

struct Article: Decodable {
    let title: String
    let description: String
}
