//
//  DoctorDetailsListViewController.swift
//  Docapp
//
//  Created by DarkMoon on 04/01/23.
//

import UIKit

class DocDetailsListViewController: UIViewController {
    
    // --------------MARK: - Public Variables --------------
    
    var getdocName: String?
    var getdocImage: String!
    var getdocType: String?
    var getdocRateId: Double?
    var getdocReviewsNum : Int?
    var getDocID: Int?

    // --------------MARK: - IB Outlets---------------------
    
    @IBOutlet weak var chatView: UIView!
    @IBOutlet weak var baseView: UIView!
    
    @IBOutlet weak var docName: UILabel!
    @IBOutlet weak var docImage: UIImageView!
    
    @IBOutlet weak var docType: UILabel!
    @IBOutlet weak var patientView: UIView!
    @IBOutlet weak var docYearView: UIView!
    @IBOutlet weak var docRatingView: UIView!
    
    @IBOutlet weak var submitBtnAc: UIButton! {
        didSet{
            submitBtnAc.layer.cornerRadius = 18
        }
    }
    
    @IBAction func exitBtnAct(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
        
    }
    
    @IBAction func BookAppointmentAct(_ sender: UIButton) {
        let vc1: NewAppointmentViewController = UIStoryboard.instantiateViewController(withIdentifier: DOCAppConstants.VC.docNewAppointmentVC)
        self.navigationController?.pushViewController(vc1, animated:true)
        
    }
    
    @IBAction func messageScreenAct(_ sender: UIButton) {
        chatView.showAnimation{ [weak self] finish in
            if finish{
                let vc2: ChatViewController = UIStoryboard.instantiateViewController(withIdentifier: DOCAppConstants.VC.docChatVC)
                vc2.getdocName = self?.getdocName
                vc2.getdocImage =  self?.getdocImage
                vc2.getdocId =  self?.getDocID

                self?.navigationController?.pushViewController(vc2, animated:true)
                
            }
            
        }
        
        
        
    }
    
    // --------------MARK: - ViewLife Cycle-----------------
    
    override func viewDidLoad() {
        super.viewDidLoad()
        docName.text = getdocName
        docImage.image = UIImage(named: getdocImage)
        docType.text = getdocType

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        baseView.roundCorners(radius: 40, corners: [.bottomLeft,.bottomRight])
        self.navigationItem.setHidesBackButton(true, animated: true)
        
        patientView.roundCorners(radius: 10, corners: [.bottomLeft,.bottomRight])
        docYearView.roundCorners(radius: 10, corners: [.bottomLeft,.bottomRight])
        docRatingView.roundCorners(radius: 10, corners: [.bottomLeft,.bottomRight])
    }
    
    // --------------MARK: - Private Functions--------------
    
    // --------------MARK: - Public Functions---------------
    
    
}


