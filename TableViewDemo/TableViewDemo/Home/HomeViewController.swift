//
//  HomeViewController.swift
//  TableViewDemo
//
//  Created by Kumar Lav on 12/10/19.
//  Copyright © 2019 Kumar Lav. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func defaultCellAction(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(identifier: "DefaultCellTableView") as! DefaultCellTableView
        vc.title = "DefaultCellTableView"
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func customCellAction(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(identifier: "CustomCellTableView") as! CustomCellTableView
         vc.title = "CustomCellTableView"
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func xibCellAction(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(identifier: "XIBAsACellTableView") as! XIBAsACellTableView
         vc.title = "XIBAsACellTableView"
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func tableViewAction(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(identifier: "TableViewAsAClass") as! TableViewAsAClass
         vc.title = "TableViewAsAClass"
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
    
}
