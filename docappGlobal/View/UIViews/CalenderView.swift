//
//  CalenderView.swift
//  docappGlobal
//
//  Created by DarkMoon on 15/02/23.
//

import Foundation
import UIKit
import FSCalendar

protocol CalenderDataDelegate {
    func reloadCollectionView(_ reloadData: Bool)
    func updateDocData(_ dateData: Date)

}

class CalenderView: UIView,FSCalendarDataSource,FSCalendarDelegate {
    var datadelegate: CalenderDataDelegate?
    var fscalendar: FSCalendar!

    var viewModel = VisitingTimeAndDateViewModel()
    
    @IBOutlet weak var calenderRefView: UIView!
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit() {
        // load the nib file
        let viewFromXib = Bundle.main.loadNibNamed("CalenderView", owner: self, options: nil)![0] as! UIView
        viewFromXib.frame = self.bounds
        viewFromXib.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        addSubview(viewFromXib)
        self.fscalendar =  FSCalendar(frame: .zero)
        fscalendar.frame =  CGRect(x: 20, y: 0, width: calenderRefView.frame.width-20, height: self.calenderRefView.frame.height-60)
        fscalendar.dataSource = self
        fscalendar.delegate = self
        calenderRefView.addSubview(fscalendar)

    }
    
    @IBAction func cancelBtnAct(_ sender: UIButton) {
        self.removeFromSuperview()
        
    }
    
    // get the currenct date
    // get the next 4 dates
    // disply the collection data
    
    
    @IBAction func okayBtnAct(_ sender: UIButton) {
        datadelegate?.reloadCollectionView(false)
        self.removeFromSuperview()
    }
  
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        datadelegate?.updateDocData(date)
    }
    
}


var docDate: [String: [String]] = ["date": [],
                                   "weekDay": [],
                                   "monthLbl": []
]
