//
//  ViewController.swift
//  Docapp
//
//  Created by DarkMoon on 18/12/22.
//

import UIKit

class DocListViewController: UIViewController {
    
    // --------------MARK: - Public Variables --------------
    var viewModel = DoctorViewModel()

    // --------------MARK: - IB Outlets---------------------
    
    @IBOutlet weak var docCollectionView: UICollectionView!
    
    // --------------MARK: - ViewLife Cycle---------------
    
    override func viewDidLoad() {
        super.viewDidLoad()
        docCollectionView.dataSource = self
        docCollectionView.delegate = self
        registorCells()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationItem.setHidesBackButton(true, animated: true)
        
    }
    
    // --------------MARK: - Private Functions--------------
    
    private func registorCells() {
       //1  rregister cells
        docCollectionView.register(UINib(nibName: DocTypeCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: DocTypeCollectionViewCell.identifier)
       // 2 load modal
        viewModel.loadEmployeeData()
        DispatchQueue.main.async {
            self.docCollectionView.reloadData()
        }
        
    }
    
    // --------------MARK: - Public Functions---------------
    @IBAction func backBtnAct(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    
}


// --------------MARK: - Extensions--------------

extension DocListViewController: UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.doctorData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier:
                                                                DocTypeCollectionViewCell.identifier,for: indexPath) as? DocTypeCollectionViewCell
        else { return UICollectionViewCell() }
        cell.setUpCollectionCell(doc: viewModel.doctorData[indexPath.item])
        
        return cell
        
    }
    
    
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let memberDetailsVC: DocDetailsListViewController = UIStoryboard.instantiateViewController(withIdentifier: DOCAppConstants.VC.docDetailListVC)
        let sendDocData = viewModel.doctorData[indexPath.item]
        memberDetailsVC.getdocName = sendDocData.docName
        memberDetailsVC.getdocType = sendDocData.docType
        memberDetailsVC.getdocImage = sendDocData.docImage
        memberDetailsVC.getDocID = sendDocData.docUserId

        collectionView.cellForItem(at: indexPath)?.showAnimationCell{
            (finish) in
            if finish {
                self.navigationController?.pushViewController(memberDetailsVC, animated:true)
            }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return  CGSize(width: 170, height: 180)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
}

extension UICollectionViewCell {
    func showAnimationCell(_ completion: @escaping ((Bool) -> Void)) {
        isUserInteractionEnabled = false
        UIView.animate(withDuration: 0.05,
                       delay: 0,
                       options: .curveLinear,
                       animations: { [weak self] in
            self?.transform = CGAffineTransform.init(scaleX: 0.85, y: 0.85)
        }) {  (done) in
            UIView.animate(withDuration: 0.1,
                           delay: 0,
                           options: .curveLinear,
                           animations: { [weak self] in
                self?.transform = CGAffineTransform.init(scaleX: 1, y: 1)
            },completion: { (finish: Bool) in
                // do stuff once animation is complete
                self.isUserInteractionEnabled = true
                completion(finish)
                
            })
        }
    }
    
}
