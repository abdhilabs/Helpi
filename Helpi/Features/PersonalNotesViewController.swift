//
//  PersonalNotesViewController.swift
//  Helpi
//
//  Created by PUTRI RAHMADEWI on 29/06/22.
//

import UIKit

class PersonalNotesViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var textNotes: UILabel!
    @IBOutlet weak var notes: UITextView!
    @IBOutlet weak var btnSave: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        btnSave.backgroundColor = #colorLiteral(red: 0.2392156863, green: 0.2352941176, blue: 0.5137254902, alpha: 1)
        btnSave.layer.cornerRadius = 20
        
        //Set Font Family
        titleLabel.font = .rounded(ofSize: 24, weight: .semibold)
        textNotes.font = .rounded(ofSize: 17, weight: .regular)
        notes.font = .rounded(ofSize: 15, weight: .regular)
        
        
    }
    
    @IBAction func btnSave(_ sender: Any) {
        if notes.text?.isEmpty == true {
            showAlert()
        }
        
        let nextFirstAid = ActivationViewController()
        self.navigationController?.pushViewController(nextFirstAid, animated: true)
    }
    
    func showAlert(){
        let alert = UIAlertController(title: "Empty Notes", message: "Are you sure you want to leave the notes empty? you can edit it later", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { [self] action in
        }))
        
        alert.addAction(UIAlertAction(title: "Confirm", style: .destructive , handler: {  action in
            let nextFirstAid = ActivationViewController()
            self.navigationController?.pushViewController(nextFirstAid, animated: true)
        }))
        
        present(alert, animated: true)
    }
    
    @IBAction func skipBtn(_ sender: Any) {
        let nextFirstAid = ActivationViewController()
        self.navigationController?.pushViewController(nextFirstAid, animated: true)
    }
    
}
