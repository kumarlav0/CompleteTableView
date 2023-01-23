//
//  CustomCellTableView.swift
//  TableViewDemo
//
//  Created by Kumar Lav on 12/10/19.
//  Copyright © 2019 Kumar Lav. All rights reserved.
//

import UIKit

struct User {
    var name: String = ""
    var objId: String = ""
}

typealias cellCloser = ((_ userObj: User, _ indexPath: IndexPath) -> Void)

protocol CustomCellDelegate: AnyObject {
    func didSelectCallButton(_ indexPath: IndexPath, obj: User)
}

class CustomCell: UITableViewCell {
    @IBOutlet weak var messageBtn: UIButton!
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var callBtn: UIButton!

    weak var delegate: CustomCellDelegate?
    var cellData: User?
    var indexPath: IndexPath?
    var messageCloser: cellCloser?

    func setupData(data: User, indexPath: IndexPath, completion: @escaping cellCloser) {
        cellData = data
        nameLbl.text = data.name
        self.indexPath = indexPath
        messageCloser = completion
    }

    @IBAction func messageAction(_ sender: UIButton) {
        guard let cellData = cellData, let indexPath = indexPath else { return }
        messageCloser?(cellData, indexPath)
    }

    @IBAction func callAction(_ sender: UIButton) {
        guard let cellData = cellData, let indexPath = indexPath else { return }
        delegate?.didSelectCallButton(indexPath, obj: cellData)
    }


}


class CustomCellTableView: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    var users = [User]()
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func viewWillAppear(_ animated: Bool) {
        loadAPIData()
    }

    private func loadAPIData() {
        users = getDummydata()
        reloadTable()
    }

    private func reloadTable() {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            self.tableView.reloadData()
        }
    }

    private func getDummydata() -> [User] {
        let ur1 = User(name: "Ram", objId: UUID().uuidString)
        let ur2 = User(name: "Shyam", objId: UUID().uuidString)
        let ur3 = User(name: "Raju", objId: UUID().uuidString)
        let ur4 = User(name: "Ravi", objId: UUID().uuidString)
        let ur5 = User(name: "Rohit", objId: UUID().uuidString)
        let ur6 = User(name: "Rahul", objId: UUID().uuidString)
        return [ur1,ur2,ur3,ur4,ur5,ur6]
    }
}

extension CustomCellTableView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        users.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard indexPath.row < users.count else {
            print("Index Out of ragne.....error")
            return UITableViewCell()
        }

        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCell", for: indexPath) as? CustomCell else {
            print("CustomCell not found ....error")
            return UITableViewCell()
        }

        let usr = users[indexPath.row]
        cell.delegate = self
        cell.setupData(data: usr, indexPath: indexPath) { [weak self] userObj, indexPath in
            guard let self = self else { return }
            self.didMessageClicked(user: userObj, indexPath: indexPath)
        }
        return cell
    }
}

extension CustomCellTableView {
    private func didMessageClicked(user: User, indexPath: IndexPath) {
        print(user.name, user.objId, indexPath)
    }
}

extension CustomCellTableView: CustomCellDelegate {
    func didSelectCallButton(_ indexPath: IndexPath, obj: User) {
        print(obj.name, obj.objId, indexPath)
    }

}

