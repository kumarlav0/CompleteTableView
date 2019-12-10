//
//  CustomCellTableView.swift
//  TableViewDemo
//
//  Created by Kumar Lav on 12/10/19.
//  Copyright © 2019 Kumar Lav. All rights reserved.
//

import UIKit

class CustomCell: UITableViewCell {
    
}


class CustomCellTableView: UIViewController, UITableViewDelegate, UITableViewDataSource {
   
    
    @IBOutlet weak var tableView: UITableView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
           return 30
       }
       
       func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCell", for: indexPath) as! CustomCell
        
        
        return cell
       }

}
