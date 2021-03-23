//
//  BookTableViewCell.swift
//  Atchyuth
//
//  Created by Smscountry on 17/03/21.
//

import UIKit
class BookTableViewCell: UITableViewCell {
    @IBOutlet weak var book_image: UIImageView!
    @IBOutlet weak var book_titleLabel: UILabel!
    @IBOutlet weak var book_priceLabel: UILabel!
   
//    var object: BookStore {
//       didSet {
//
//       }
//   }
//
//
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }
    
    
    
    
    
    func updateUI(object: BookStore)  {
        book_titleLabel.text = object.title
        book_priceLabel.text = object.price
        book_image.image = self.downloadimage(image_str: object.image_name!)
    }
    
    func downloadimage(image_str: String)  -> UIImage {
        let url = URL(string: image_str)!
            if let data = try? Data(contentsOf: url) {
                return UIImage(data: data)!
            } else {
                return UIImage(named: "")!
            }
    }
   

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        super.setSelected(selected, animated: animated)
                  self.accessoryType = selected ? .checkmark : .none
        
    }
  

}
