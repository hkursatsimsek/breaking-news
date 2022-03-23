//
//  SplashViewController.swift
//  breaking-news
//
//  Created by Kürşat Şimşek on 23.03.2022.
//

import UIKit

class SplashViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        if let dest = UIStoryboard(name: "SearchArticleScreen", bundle: nil)
            .instantiateViewController(withIdentifier: "searchArticleStoryboardID") as? SearchArticleViewController {
            self.navigationController?.pushViewController(dest, animated: false)
        }
    }

}
