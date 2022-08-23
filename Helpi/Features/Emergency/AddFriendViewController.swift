//
//  AddFriendViewController.swift
//  Helpi
//
//  Created by Abdhi P (Work) on 30/06/22.
//

import UIKit

class AddFriendViewController: UIViewController {
  
  @IBOutlet weak var txtSearch: UITextField!
  @IBOutlet weak var tblFriend: UITableView!
  
  private let cloudKitService = CloudKitService()
  private var accountFriends: [UserAccount] = []
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    navigationItem.title = "Tambahkan teman"
    let barButton = UIBarButtonItem(image: UIImage(systemName: "xmark")!, style: .plain, target: self, action: #selector(didTapCloseButton))
    barButton.tintColor = .black
    navigationItem.rightBarButtonItem = barButton
  }
  
  @objc func didTapCloseButton() {
    dismiss(animated: true)
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    tblFriend.register(UINib(nibName: "FriendTableViewCell", bundle: nil),
                       forCellReuseIdentifier: String(describing: FriendTableViewCell.self))
    tblFriend.delegate = self
    tblFriend.dataSource = self
    
    addTapGestureToHideKeyboard()
  }
  
  @IBAction func didTapSearchButton(_ sender: Any) {
    let name = txtSearch.text ?? ""
    cloudKitService.fetchAccount(by: name.lowercased()) { accounts in
      self.accountFriends.removeAll()
      self.accountFriends.append(contentsOf: accounts)
      self.tblFriend.reloadData()
    }
  }
}

extension AddFriendViewController: UITableViewDelegate, UITableViewDataSource {
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    accountFriends.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: FriendTableViewCell.self), for: indexPath) as? FriendTableViewCell else {
      return UITableViewCell()
    }
    
    let friend = accountFriends[indexPath.row]
    cell.lblTitle.text = friend.name
    cell.addHandler = {
      let alert = UIAlertController(title: "Add as Helpee?", message: "Adding the person in your helpee list makes you receive a notification whenever the person is tapping the alert button", preferredStyle: .alert)
      alert.addAction(UIAlertAction(title: "Cancel", style: .destructive))
      alert.addAction(UIAlertAction(title: "Add", style: .default, handler: { _ in
        self.cloudKitService.subscribeToDatabase(for: friend.appleId) { isSuccess in
          DispatchQueue.main.async {
            if isSuccess {
              self.showGeneralAlert(message: "Berhasil menambahkan helpee")
            } else {
              self.showGeneralAlert(message: "Gagal menambahkan helpee")
            }
          }
        }
      }))
      self.present(alert, animated: true)
    }
    return cell
  }
}
