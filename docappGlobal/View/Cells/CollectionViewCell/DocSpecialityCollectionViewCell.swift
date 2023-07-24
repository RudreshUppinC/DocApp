//
//  docSpecialityCollectionViewCell.swift
//  docappNew
//
//  Created by DarkMoon on 20/01/23.
//

import UIKit

class DocSpecialityCollectionViewCell: UICollectionViewCell {
    
    static let identifier = String(describing: DocSpecialityCollectionViewCell.self)
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var docSpecialityType: UILabel!
    @IBOutlet weak var docSpecialityImage: UIImageView!
    @IBOutlet weak var docSpecialityNum: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    // MARK: - Public Func

    func setUpCollectionCell(doc: DocSpeciality) {

        docSpecialityType.text = doc.docSpeciality
        docSpecialityNum.text = "\(doc.docSpecialityNum) Doctors"
        docSpecialityImage.image = UIImage(named: doc.specialityImg)

     }
    

    
}
