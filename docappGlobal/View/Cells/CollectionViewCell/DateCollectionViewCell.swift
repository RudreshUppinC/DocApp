//
//  DateCollectionViewCell.swift
//  docappNew
//
//  Created by DarkMoon on 28/01/23.
//

import UIKit

class DateCollectionViewCell: UICollectionViewCell {
    
    static let identifier = String(describing: DateCollectionViewCell.self)
    var viewModel = VisitingTimeAndDateViewModel()
   
    @IBOutlet weak var baseView: UIView!
    @IBOutlet weak var weekLbl: UILabel!
    @IBOutlet weak var dateLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    // get the current date
    // get the 4 dayes and store in array
    // MARK: - Public Func
    func setUpDateCollectioViewColorCell(_ selectIndex: Int, _ index: Int, _ isCurrentDateSelected:Bool, _ dateData: [String: [String]]) {
        if selectIndex == index {
            baseView.backgroundColor = MyColor.DocAcppblue.value
            weekLbl.textColor  = .white
            dateLbl.textColor = .white
        } else  {
            baseView.backgroundColor = .white
            weekLbl.textColor  = .black
            dateLbl.textColor = .black
        }
        
        if isCurrentDateSelected{
            // current Date
            viewModel.resultinNum  = getTotalWeekDays(currentDate: getCurrentDate("dd"),formatData: "dd")
            viewModel.resultinDay  = getTotalWeekDays(currentDate: getCurrentDate("EEE"), formatData: "EEE")
            
        } else  {
            // selected Date
            if dateData  == [:] {
                viewModel.resultinNum  = getTotalWeekDays(currentDate: getCurrentDate("dd"),formatData: "dd")
                viewModel.resultinDay  = getTotalWeekDays(currentDate: getCurrentDate("EEE"), formatData: "EEE")
            } else {
                for (key, value) in dateData {
                    if key == "date" {
                        let arr3 = value[0].split(whereSeparator: {$0 == "/"})
                        viewModel.resultinNum = getTotalWeekDays(currentDate: String(arr3[0]),formatData: "dd")
                    }
                    if key == "weekDay" {
                        viewModel.resultinDay = getTotalWeekDays(currentDate: value[0],formatData: "EEE")
                    }
                }
            }
        }
        weekLbl.text =  viewModel.resultinDay[index]
        dateLbl.text =  viewModel.resultinNum[index]
    }
    
    
    // MARK: - Private Func
    // return current Date Data
    private func getCurrentDate(_ formatData:String) -> String {
        let date = Date()
        let currentDate: String
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = formatData
        currentDate = dateFormatter.string(from: date).capitalized
        return currentDate
    }
    
    
    //get the WeekDays in number
    private func getTotalWeekDays(currentDate: String, formatData: String) -> [String] {
        let formatter    = DateFormatter()
        formatter.dateFormat = formatData
        var tempArrTwo = [String]()
        
        if let currDate = formatter.date(from:  currentDate) {
            for i in 0...4 {
                let newDate = Date().calendar.date(byAdding: .day, value: i, to: currDate)
                tempArrTwo.append(formatter.string(from: newDate!))
            }
        }
        return tempArrTwo
    }
}
