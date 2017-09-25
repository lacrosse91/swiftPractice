//
//  DetailArticleViewController.swift
//  studySample
//
//  Created by 川内翔一朗 on 2017/09/25.
//  Copyright © 2017年 川内翔一朗. All rights reserved.
//

import UIKit

class DetailArticleViewController: UIViewController {

    @IBOutlet weak var detailText: UITextView!
    var article: Article?
    override func viewDidLoad() {
        super.viewDidLoad()
        if let article = article {
            detailText.text = article.body
            detailText.isEditable = false
        }

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
