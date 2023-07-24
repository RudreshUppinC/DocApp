//
//  AppoinmentStatusView.swift
//  docappGlobal
//
//  Created by DarkMoon on 28/02/23.
//


import Foundation
import UIKit
import FSCalendar

protocol AppointmentDataDeleate {
    func gobackMainScreen()
}

class AppoinmentStatusView: UIView {
     var datadelegate: AppointmentDataDeleate?

    
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
      let viewFromXib = Bundle.main.loadNibNamed("AppoinmentStatusView", owner: self, options: nil)![0] as! UIView
             viewFromXib.frame = self.bounds
      viewFromXib.autoresizingMask = [.flexibleWidth, .flexibleHeight]
             addSubview(viewFromXib)
    
    
  }
 
    @IBAction func finishedBtnAct(_ sender: UIButton) {
        datadelegate?.gobackMainScreen()
        self.removeFromSuperview()
    }

    
}
