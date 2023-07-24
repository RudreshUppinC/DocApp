//
//  DocTypeCollectionViewCell.swift
//  Docapp
//
//  Created by DarkMoon on 19/12/22.
//

import UIKit

class DocTypeCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var docNamelbln: UILabel!
    
    // MARK: - IBOutlets
    @IBOutlet weak var docCattypelbl: UILabel!
    @IBOutlet weak var docReviewsNumlbl: UILabel!
    @IBOutlet weak var docImage: UIImageView!

    static let identifier = String(describing: DocTypeCollectionViewCell.self)

    
    // MARK: - Xib

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    // MARK: - Public Func
    
    func setUpCollectionCell(doc: Doctor) {
        let (fname,_) = parseName(doc.docName)
        docNamelbln.text = fname
        docCattypelbl.text = doc.docType
        docImage.image = UIImage(named: doc.docImage)
    

     }
    
    // MARK: - Private Func
  
    private func parseName(_ fullName: String) -> (String, String) {
        let parsed = fullName.replacingOccurrences(of: "Dr.", with: "")

        let components = parsed.split(separator: " ", maxSplits: 3).map(String.init)
        return (components.first ?? "", components.count > 1 ? components.last! :  "")
    }
}

    
  
    
  
