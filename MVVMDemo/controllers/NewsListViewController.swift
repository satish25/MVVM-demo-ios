//
//  NewsListViewController.swift
//  MVVMDemo
//
//  Created by Satish Kumar on 12/07/19.
//  Copyright © 2019 Brillio Technologies. All rights reserved.
//

import UIKit

enum LoginError: Error{
    case incompleteForm
    case invalidUserName
    case invalidPasswordLength
}
class NewsListViewController: UITableViewController {

    private var articleListVM : ArticleListViewModel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setUp()
        
        let email = "sat@gmmail.com"
        let isValid = !email.isValidEmail
        print(isValid)
        do{
            try login()
        } catch LoginError.incompleteForm {
            Alert.showBasic(title: "Incomplete Form", message: "incompleteForm", vc: self)
            
        } catch LoginError.invalidPasswordLength {
            Alert.showBasic(title: "Password", message: "invalidPasswordLength", vc: self)
        } catch LoginError.invalidUserName{
            Alert.showBasic(title: "User Name", message: "invalidUserName", vc: self)
        } catch {
             Alert.showBasic(title: "Unable to Login", message: "There was an error", vc: self)
        }
        
    }
    
    private func setUp() {
        self.title = "News List"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        
        let webUrl = URL(string: "https://newsapi.org/v2/top-headlines?sources=bbc-news&apiKey=eb01dadb15994764998cb275f6112b6c")!
        WebServices().getArticel(url: webUrl) { (dataArray) in
            if let articles = dataArray {
                self.articleListVM = ArticleListViewModel(articles: articles)
                DispatchQueue.main.sync {
                    self.tableView.reloadData()
                }
            }
        }
        
        

    }
    
    func login() throws {
        let email = "satish@gmail.com"
        let password = "Satish"
        
        if email.isEmpty || password.isEmpty {
            throw LoginError.incompleteForm
        }
        
        if !email.isValidEmail {
            throw LoginError.invalidUserName
        }
        
        if password.count < 8 {
            throw LoginError.invalidPasswordLength
        }
        
        
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return self.articleListVM == nil ? 0 : self.articleListVM.numberOfSections
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.articleListVM.numberOfRowsInSection(section)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "articleCell", for: indexPath) as? ArticelTableViewCell else { fatalError("Cell not found")  }
        let article = self.articleListVM.articleAtIndex(indexPath.row)
        cell.titleLable.text = article.title
        cell.descriptionLabel.text = article.description
        
        return cell
    }
}
