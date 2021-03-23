//
//  HomeViewController.swift
//  Atchyuth
//
//  Created by Smscountry on 17/03/21.
//

import UIKit

class HomeViewController: UIViewController {
    @IBOutlet weak var booksTableView: UITableView!
    
    var tableViewData = [BookStore]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

      //  booksTableView.register(UITableViewCell.self, forCellReuseIdentifier: "BookTableViewCell")
        self.booksTableView.allowsMultipleSelection = true
        self.booksTableView.allowsMultipleSelectionDuringEditing = true
        self.configureTable()
        
//        var string = "ABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZ"
//        let stringCount = string.components(separatedBy: "A")
//        print(stringCount.count)
        
        
        
    }
    
    func configureTable()  {
        HomeViewModel.sharedInstance.callApi(url_string: "https://api.itbook.store/1.0/search/mongodb") { (booksData) in
            
            print("inside the clouser")
          
            
            DispatchQueue.main.async {
                if let coredataBooksArray = CoreDataModel.sharedInstance.fetchingData() as? [BookStore] {
                              if (coredataBooksArray.count > 0) {
                                  self.tableViewData = coredataBooksArray
                              } else {
                                  for record in booksData {
                                      CoreDataModel.sharedInstance.saveData(image_string: record.image, price: record.price, title: record.title)
                                  }
                              }
                          } else {
                              for record in booksData {
                                  CoreDataModel.sharedInstance.saveData(image_string: record.image, price: record.price, title: record.title)
                              }
                          }
                self.booksTableView.reloadData()
            }
        }
    }
    
  //mark:- Button Actions
    

    @IBAction func clickonSubmit(_ sender: UIButton) {
        
        
        guard let indexPaths = self.booksTableView.indexPathsForSelectedRows else { // if no selected cells just return
            return
        }
        var booksArray = [BookStore]()
        for indexPath in indexPaths {
            //  print("\(productName[indexPath.row])") //Here you get the text of cell
            booksArray.append(self.tableViewData[indexPath.row])
        }
        
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        var  selectedVC = SelectedListViewController()
        if #available(iOS 13.0, *) {
            selectedVC = storyBoard.instantiateViewController(identifier: "SelectedListViewController") as! SelectedListViewController
        } else {
            selectedVC = storyBoard.instantiateViewController(withIdentifier: "SelectedListViewController") as! SelectedListViewController
        }
        selectedVC.tableViewData = booksArray
        self.navigationController?.pushViewController(selectedVC, animated: true)
        
        
        
        
    }
}

//MARK:- UITableViewDataSource, UITableViewDelegate
extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.tableViewData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "BookTableViewCell") as?  BookTableViewCell {
            print(cell)
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

