//
//  NewAppointmentViewController.swift
//  docappNew
//
//  Created by DarkMoon on 21/01/23.
//

import UIKit

class NewAppointmentViewController: UIViewController,CalenderDataDelegate, AppointmentDataDeleate {
    
    // --------------MARK: - Variables --------------
    
    @IBOutlet weak var monthLblButton: UIButton!
    var viewModel = VisitingTimeAndDateViewModel()
    private var selectedTimeIndex = 0
    private var selectedDateIndex = 0
    private var dateValue: String = ""
    var isCurrentDateSelected: Bool = true
    var docDate: [String: [String]] = ["date": [],
                                       "weekDay": [],
                                       "monthLbl": []
    ]
    var calenderView: CalenderView!
    var appointmentView: AppoinmentStatusView!
    
    @IBOutlet var baseView: UIView!
    @IBOutlet weak var dropDownView: UIView!
    
    @IBOutlet weak var ageTablecellHeightconstraint: NSLayoutConstraint!
    @IBOutlet weak var genderViewHeightconstraint: NSLayoutConstraint!
    @IBOutlet weak var baseViewHeightConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var dropDownTabelView: UITableView!
    @IBOutlet weak var timeCollectionView: UICollectionView!
    @IBOutlet weak var dateColletionView: UICollectionView!
    @IBOutlet weak var patientNameTextView: UITextField!
    @IBOutlet weak var patientAgeLbl: UILabel!
    
    @IBOutlet weak var maleBtn: UIButton!
    @IBOutlet weak var femalBtn: UIButton!
    
    @IBOutlet weak var setAppontmentBtn: UIButton! {
        didSet{
            setAppontmentBtn.layer.cornerRadius = 18
        }
    }
    
    // --------------MARK: - ViewLife Cycle Methods --------------
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registorAllCells()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationItem.setHidesBackButton(true, animated: true)
        
        ageTablecellHeightconstraint.constant = 0
        genderViewHeightconstraint.constant = 20
        baseViewHeightConstraint.constant = 1000
    }
    
    // --------------MARK: - Public Functions--------------
    func reloadCollectionView(_ dateSelected: Bool) {
        isCurrentDateSelected = dateSelected
        let filtered = docDate.filter { $0.key == "monthLbl" }
        let titleLbl = filtered.first?.value.first
        monthLblButton.setTitle(titleLbl, for: .normal)
        DispatchQueue.main.async {
            self.dateColletionView.reloadData()
        }
        
    }
    
    func updateDocData(_ date:Date) {
        let dateFormater = DateFormatter()
        dateFormater.dateFormat = "EEE/dd/MMMM,yyyy"
        let formateDate = dateFormater.string(from: date)
        let arr3 = formateDate.split(whereSeparator: {$0 == "/"})
        docDate.updateValue([String(arr3[0])], forKey: "weekDay")
        docDate.updateValue([String(arr3[1])], forKey: "date")
        docDate.updateValue([String(arr3[2])], forKey: "monthLbl")
    }
    
    func gobackMainScreen() {
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    
    // --------------MARK: - Private Functions--------------
    
    private func registorAllCells() {
        //Collectionviewcells
        dateColletionView.delegate = self
        dateColletionView.dataSource = self
        timeCollectionView.delegate = self
        timeCollectionView.dataSource = self
        timeCollectionView.register(UINib(nibName: TimeCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: TimeCollectionViewCell.identifier)
        dateColletionView.register(UINib(nibName: DateCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: DateCollectionViewCell.identifier)
        
        //TableviewCells
        dropDownTabelView.delegate = self
        dropDownTabelView.dataSource = self
        dropDownTabelView.register(UINib(nibName: DropDownTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: DropDownTableViewCell.identifier)
        
        DispatchQueue.main.async {
            self.timeCollectionView.reloadData()
            self.dateColletionView.reloadData()
            self.dropDownTabelView.reloadData()
            
        }
    }
    
    private func setUpColorTimeCell(index: Int, cell: TimeCollectionViewCell) {
        selectedTimeIndex = index
        if  selectedTimeIndex == index {
            cell.baseView.backgroundColor = .blue
            cell.appointmentTime.textColor  = .white
        } else  {
            cell.baseView.backgroundColor = .white
            cell.appointmentTime.textColor  = .black
        }
        
    }
    
    private func openCalenderView() {
        docDate = [:]
        self.calenderView =  CalenderView(frame: .zero)
        //        calenderView.frame =  CGRect(x: 30, y: 0, width: self.view.bounds.width-30, height: 360)
        calenderView.frame =  CGRect(x: 0, y: 0, width: self.view.bounds.width, height: self.view.bounds.height)
        
        calenderView.backgroundColor = .lightGray
        calenderView.center = view.center
        calenderView.datadelegate = self
        baseView.addSubview(calenderView)
        
        //        self.fscalendar =  FSCalendar(frame: .zero)
        //        fscalendar.frame =  CGRect(x: 20, y: 0, width: calenderView.frame.width-20, height: self.calenderView.frame.height-60)
        //        fscalendar.dataSource = self
        //        fscalendar.delegate = self
        //        calenderView.addSubview(fscalendar)
        
        //  self.calenderView.alpha = 0.3;
        
        UIView.animate(withDuration: 0.55) {
            //  self.calenderView.alpha = 1
        }
    }
    
    private func openAppointmentScreen(){
        self.appointmentView =  AppoinmentStatusView(frame: .zero)
        appointmentView.frame =  CGRect(x: 30, y: 0, width: self.view.bounds.width-30, height: UIScreen.main.bounds.height)
        appointmentView.backgroundColor = .lightGray
        
        appointmentView.datadelegate = self
        appointmentView.center = view.center
        baseView.addSubview(appointmentView)
        
        self.appointmentView.alpha = 0.3;
        UIView.animate(withDuration: 0.55) {
            self.appointmentView.alpha = 1
        }
    }
    
    // --------------MARK: - IBActions --------------
    
    @IBAction func maleBtnAct(_ sender: UIButton) {
        maleBtn.backgroundColor = MyColor.DocAcppblue.value
        maleBtn.setTitleColor(.white, for: .normal)
        femalBtn.backgroundColor = .white
        femalBtn.setTitleColor(.black, for: .normal)
        
    }
    
    @IBAction func femaleBtnAct(_ sender: UIButton) {
        maleBtn.backgroundColor = .white
        maleBtn.setTitleColor(.black, for: .normal)
        femalBtn.backgroundColor = MyColor.DocAcppblue.value
        femalBtn.setTitleColor(.white, for: .normal)
        
    }
    
    @IBAction func openAgeDropDownMenu(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
        switch sender.isSelected {
        case true:
            self.baseViewHeightConstraint.constant = 1200
            self.ageTablecellHeightconstraint.constant = 200
            dropDownView.addDropDownAnimate(viewHeightConstraint: genderViewHeightconstraint , constant: 220)
        default:
            break;
        }
        
    }
    
    
    @IBAction func backButtonAct(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func downArrowAct(_ sender: UIButton) {
        openCalenderView()
    }
    
    @IBAction func appointmentActBtn(_ sender: UIButton) {
        openAppointmentScreen()
    }
}
// --------------MARK: - Tableview Extensions Methods --------------

extension NewAppointmentViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.patientAge.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: DropDownTableViewCell.identifier, for: indexPath) as? DropDownTableViewCell else { return UITableViewCell() }
        
        cell.lable.text = viewModel.patientAge[indexPath.item]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        patientAgeLbl.text = viewModel.patientAge[indexPath.item]
        ageTablecellHeightconstraint.constant = 0
        baseViewHeightConstraint.constant = 1000
        dropDownView.addDropDownAnimate(viewHeightConstraint: genderViewHeightconstraint , constant: 20)
    }
    
    
}


// --------------MARK: - CollectionView Extensions Methods --------------

extension NewAppointmentViewController: UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView ==  dateColletionView {
            return 4
        } else  {
            return viewModel.docTime.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView ==  dateColletionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DateCollectionViewCell.identifier,for: indexPath) as! DateCollectionViewCell
            cell.setUpDateCollectioViewColorCell(selectedDateIndex, indexPath.item, isCurrentDateSelected, docDate)
            return cell
            
        } else  {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TimeCollectionViewCell.identifier,for: indexPath) as! TimeCollectionViewCell
            cell.setUpTimeCollectioViewColorCell(selectIndex: selectedTimeIndex, index: indexPath.item)
            return cell
            
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView ==  dateColletionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DateCollectionViewCell.identifier,for: indexPath) as! DateCollectionViewCell
        } else  {
            let timeCell = collectionView.dequeueReusableCell(withReuseIdentifier: TimeCollectionViewCell.identifier,for: indexPath) as! TimeCollectionViewCell
            setUpColorTimeCell(index: indexPath.item, cell: timeCell)
        }
        collectionView.reloadData()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView ==  dateColletionView {
            let cellSize = CGSize(width: (collectionView.bounds.width-30)/4, height: 80)
            return cellSize
        }
        return  CGSize(width: (collectionView.bounds.width )/2, height: 40)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
}

