//
//  ArticleViewModel.swift
//  MVVMDemo
//
//  Created by Satish Kumar on 19/07/19.
//  Copyright © 2019 Brillio Technologies. All rights reserved.
//

import Foundation


struct ArticleListViewModel {
    let articles: [Article]
    
}
extension ArticleListViewModel {
    var numberOfSections: Int {
        return 1
    }
    
    func numberOfRowsInSection(_ section: Int) -> Int {
        return self.articles.count
    }
    
    func articleAtIndex(_ index: Int) -> ArticleViewModel {
       let article = self.articles[index]
        return ArticleViewModel(article)
    }
}


struct ArticleViewModel {
    private let article :Article
}

extension ArticleViewModel{
    init(_ article: Article) {
        self.article  = article
    }
    
    var title : String{
        return self.article.title
    }
    
    var description: String{
        return self.article.description
    }
    
}


