//
//  ViewController.swift
//  News RxSwift
//
//  Created by Артур Дохно on 08.06.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
    }


}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: "ArticleTableViewCell",
            for: indexPath) as? ArticleTableViewCell
        else {
            return UITableViewCell()
        }
        
        
        
        return cell
    }
}
