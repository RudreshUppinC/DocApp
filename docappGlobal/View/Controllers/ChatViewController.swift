//
//  ChatViewController.swift
//  docappNew
//
//  Created by DarkMoon on 21/01/23.
//

import UIKit
class ChatViewController: UIViewController {
    
    // --------------MARK: - Public Variables --------------
    let viewModel = ChatMessageViewModel()
    
    // --------------MARK: - IB Outlets---------------------
    @IBOutlet weak var chatTableView: UITableView!
    var getdocName:String!
    var getdocImage:String!
    var getdocId:Int!

    @IBOutlet weak var docNameData: UILabel!
    @IBOutlet weak var docImageData: UIImageView!
    
    // --------------MARK: - ViewLife Cycle-----------------
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCells()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        docNameData.text = getdocName
        docImageData.image = UIImage(named: getdocImage)
        
        DispatchQueue.main.async {
            //self.chatTableView.reloadData()
        }
    }
    
    // --------------MARK: - Private Functions--------------
    
    private func registerCells() {
        
        //TableviewCells
        chatTableView.delegate = self
        chatTableView.dataSource = self
        chatTableView.register(UINib(nibName: ReplyTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: ReplyTableViewCell.identifier)
        
        chatTableView.register(UINib(nibName: SenderTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: SenderTableViewCell.identifier)
        // Populate the messages array with sample data
        viewModel.loadChatMessages(userIdData: getdocId)
        
    }
    
    // --------------MARK: - Public Functions---------------
    // --------------MARK: - IBActions Functions------------
    
    @IBAction func backViewController(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}

// --------------MARK: - Extension ChatViewController------------

extension ChatViewController: UITableViewDelegate,UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.messages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let message = viewModel.messages[indexPath.row]
        //        if message.userid == getdocId{
        if message.userid == getdocId{
            let cell = tableView.dequeueReusableCell(withIdentifier: ReplyTableViewCell.identifier, for: indexPath) as! ReplyTableViewCell
            cell.replyMsgLbl.text = message.text
            return cell
        } else{
            let cell = tableView.dequeueReusableCell(withIdentifier: SenderTableViewCell.identifier, for: indexPath) as! SenderTableViewCell
            cell.senderMsgLbl.text = message.text
            return cell
        }
        
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
}
