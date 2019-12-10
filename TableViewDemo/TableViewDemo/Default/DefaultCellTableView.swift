//
//  DefaultCellTableView.swift
//  TableViewDemo
//
//  Created by Kumar Lav on 12/10/19.
//  Copyright © 2019 Kumar Lav. All rights reserved.
//

import UIKit

class DefaultCellTableView: UIViewController, UITableViewDelegate, UITableViewDataSource
{
    
  // No need to create Outlet of TableView
    //var title = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 30
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: nil)
        cell.textLabel?.text = "Title \(indexPath.row+1)"
        cell.detailTextLabel?.text = "Text messages are used for personal, family, business and social purposes. Governmental and non-governmental organizations use text messaging for communication between colleagues. In the 2010s, the sending of short informal messages has become an accepted part of many cultures, as happened earlier with emailing"
        cell.detailTextLabel?.numberOfLines = 0
        return cell
    }

    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("didSelect........DefaultCellTableView")
    }
    
    
}
