//
//  ViewController.swift
//  docappNew
//
//  Created by DarkMoon on 07/01/23.
//

import UIKit

// --------------MARK: - Public Variables --------------
// --------------MARK: - IB Outlets---------------------
// --------------MARK: - ViewLife Cycle-----------------
// --------------MARK: - Private Functions--------------
// --------------MARK: - Private Functions--------------
// --------------MARK: - Public Functions---------------

class MainViewController: UIViewController {
    
    // --------------MARK: - Public Variables --------------
    var viewModel = DocSpecialityViewModel()
    
    // --------------MARK: - IB Outlets---------------------
    
    @IBOutlet weak var arrowView: UIView!
    @IBOutlet weak var docSpecialityCollectionView: UICollectionView!
    
    
    // --------------MARK: - ViewLife Cycle-----------------
    
    override func viewDidLoad() {
        super.viewDidLoad()
        docSpecialityCollectionView.dataSource = self
        docSpecialityCollectionView.delegate = self
        registorCells()
        
    }
    
    // --------------MARK: - Private Functions--------------
    
    private func registorCells() {
        docSpecialityCollectionView.register(UINib(nibName: DocSpecialityCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: DocSpecialityCollectionViewCell.identifier)
        DispatchQueue.main.async {
            self.docSpecialityCollectionView.reloadData()
        }
        viewModel.loadEmployeeData()
        
    }
    
    @IBAction func nextBtnClickAct(_ sender: Any) {
        arrowView.showAnimation{ finish in
            if finish{
                let memberDetailsVC: DocListViewController = UIStoryboard.instantiateViewController(withIdentifier: DOCAppConstants.VC.docListVC)
                self.navigationController?.pushViewController(memberDetailsVC, animated:true)
                
            }
            
        }
        
    }
    
}


// --------------MARK: - Extensions--------------

extension MainViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.doSpecialityData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier:
                                                                DocSpecialityCollectionViewCell.identifier,for: indexPath) as? DocSpecialityCollectionViewCell
        else { return UICollectionViewCell() }
        cell.setUpCollectionCell(doc: viewModel.doSpecialityData[indexPath.item])
        return cell
        
    }
    
}

