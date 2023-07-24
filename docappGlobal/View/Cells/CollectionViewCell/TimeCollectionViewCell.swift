//
//  TimeDateCollectionViewCell.swift
//  docappNew
//
//  Created by DarkMoon on 26/01/23.
//

import UIKit

class TimeCollectionViewCell: UICollectionViewCell {
    
    // MARK: - IBOutlets
    @IBOutlet weak var appointmentTime: UILabel!

    @IBOutlet weak var baseView: UIView!
    static let identifier = String(describing: TimeCollectionViewCell.self)
  
    var selectedTimeIndex = 0

    let viewModel = VisitingTimeAndDateViewModel()
    // MARK: - Xib

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    // MARK: - Public Func
    func setUpTimeCollectioViewColorCell(selectIndex: Int,index: Int ){
        if selectIndex == index {
            baseView.backgroundColor = MyColor.DocAcppblue.value
            let dateTime = viewModel.docTime[index]
            appointmentTime.text = dateTime
            appointmentTime.textColor  = .white
        } else  {
            baseView.backgroundColor = .white
            let dateTime = viewModel.docTime[index]
            appointmentTime.text = dateTime
            appointmentTime.textColor  = .black
        }
        
    }
   // MARK: - Private Func
  
}

    
  
    
  
