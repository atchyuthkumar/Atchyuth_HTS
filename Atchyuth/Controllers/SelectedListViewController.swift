//
//  SelectedListViewController.swift
//  Atchyuth
//
//  Created by Smscountry on 17/03/21.
//

import UIKit

class SelectedListViewController: UIViewController {

    @IBOutlet weak var tableview: UITableView!
    var tableViewData = [BookStore]()
   
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
   
    override func viewDidAppear(_ animated: Bool) {
        self.tableReload()
    }
    
    func tableReload()  {
        print(tableViewData.count)
        DispatchQueue.main.async {
            self.tableview.reloadData()
        }
    }
}

//MARK:- UITableViewDataSource, UITableViewDelegate
extension SelectedListViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.tableViewData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "BookTableViewCell") as?  BookTableViewCell {
            cell.selectionStyle = .none
            cell.updateUI(object: self.tableViewData[indexPath.row])
            return cell
        }
        return UITableViewCell()
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    
}

