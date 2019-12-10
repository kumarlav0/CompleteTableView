//
//  XIBAsACellTableView.swift
//  TableViewDemo
//
//  Created by Kumar Lav on 12/10/19.
//  Copyright © 2019 Kumar Lav. All rights reserved.
//

import UIKit

class XIBAsACellTableView: UIViewController, UITableViewDelegate, UITableViewDataSource
{
   
    

    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let xib = UINib(nibName: "XIBCell", bundle: nil)
        tableView.register(xib, forCellReuseIdentifier: "XIBCell")
        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
           return 30
       }
       
       func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "XIBCell", for: indexPath) as! XIBCell
        
        return cell
       }
    

}
