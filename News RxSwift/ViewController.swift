//
//  ViewController.swift
//  News RxSwift
//
//  Created by Артур Дохно on 08.06.2022.
//

import UIKit
import RxCocoa
import RxSwift

class ViewController: UIViewController {
    
    private var disposeBag = DisposeBag()
    private var articles = [Article]()

    @IBOutlet var tableView: UITableView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        
        populateNews()
    }
    
    private func populateNews() {
        URLRequest.load(resource: ArticleList.all)
            .subscribe(onNext: { [weak self] result in
                if let result = result {
                    self?.articles = result.articles
                    DispatchQueue.main.async {
                        self?.tableView.reloadData()
                    }
                }
                
            }).disposed(by: disposeBag)
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = articles[indexPath.row].title
        cell.detailTextLabel?.text = articles[indexPath.row].description
        
        return cell
    }
}
