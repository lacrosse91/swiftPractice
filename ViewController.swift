//
//  ViewController.swift
//  studySample
//
//  Created by 川内翔一朗 on 2017/07/19.
//  Copyright © 2017年 川内翔一朗. All rights reserved.
//


import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!

    private let viewModel = ViewModel()

    fileprivate var articles: [Article] {
        return viewModel.articles
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        initViewModel() //追加
        viewModel.fetchArticles()
        initTableView()
    }

    private func initViewModel() { //追加
        viewModel.reloadHandler = { [weak self] in
            self?.tableView.reloadData()
        }
    }

    private func initTableView() {
        tableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "TableViewCell")
        tableView.estimatedRowHeight = 150
        tableView.rowHeight = UITableViewAutomaticDimension
    }
}

extension ViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articles.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: TableViewCell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell") as! TableViewCell
        let article = articles[indexPath.row]
        cell.bindData(article: article)
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("section: \(indexPath.section) index: \(indexPath.row)")
        let storyboard = UIStoryboard(name: "DetailArticle", bundle: nil)
        if let next: DetailArticleViewController = storyboard.instantiateViewController(withIdentifier: "DetailArticle") as? DetailArticleViewController {
            next.article = articles[indexPath.row]
            navigationController?.pushViewController(next, animated: true)
        }

    }

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        return
    }
}

