//
//  VisitingTimeAndDateViewModel.swift
//  docappNew
//
//  Created by DarkMoon on 26/01/23.
//

import Foundation
import UIKit

struct VisitingTimeAndDateViewModel{
    
    var docTime:[String] = ["09:00 AM","09:30 AM","10:00 AM","10:30 AM","11:00 AM","11:30 AM",
                            "12:00 PM","12:30 PM","01:00 PM","01:30 PM","02:00 PM","02:30 PM",
                            "03:00 PM","03:30 PM","04:00 PM","04:30 PM","05:00 PM","05:30 PM"
    ]
    
    var patientAge:[String] = ["0-5","5-25", "25-50","50-75","75-100"]
    var selectedTimeIndex: Int = 0
    var resultinDay = [String]()
    var resultinNum = [String]()
    
    mutating func didChanegColorCell(index: Int, cell: TimeCollectionViewCell, collectionView: UICollectionView) {
        selectedTimeIndex = index
        if  selectedTimeIndex == index {
            cell.baseView.backgroundColor = .blue
            cell.appointmentTime.textColor  = .white
        } else  {
            cell.baseView.backgroundColor = .white
            cell.appointmentTime.textColor  = .black
        }
        DispatchQueue.main.async {
            collectionView.reloadData()
        }
    }
    
    
    
}
