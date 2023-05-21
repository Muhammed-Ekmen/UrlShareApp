//
//  HomeViewController.swift
//  UrlShareApp
//
//  Created by kingSemih on 21.05.2023.
//

import UIKit

class HomeViewController: UIViewController,UITextFieldDelegate {
    
    @IBOutlet weak var themeSwitchButton: UISwitch!
    @IBOutlet weak var exaLoremLabel: UILabel!
    @IBOutlet weak var copyButton: UIButton!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var nameTextFieldProgressBar: UIProgressView!
    @IBOutlet weak var loadingIndicator: UIActivityIndicatorView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameTextField.delegate = self
    }

    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let lenght = Float(textField.text?.count ?? 1)/10
        if lenght < 1 {
            nameTextFieldProgressBar.setProgress(lenght, animated: true)
        }else{
            nameTextFieldProgressBar.setProgress(1.0, animated: true)
        }
        return true
    }
    
    @IBAction func ChangeThemeAction(_ sender: UIButton) {
        themeSwitchButton.setOn(!themeSwitchButton.isOn, animated: true)
        themeSwitchOnChanged(themeSwitchButton)
    }
    
    
    @IBAction func themeSwitchOnChanged(_ sender: UISwitch) {
        self.view.backgroundColor =  self.view.backgroundColor == .white ? .lightGray : .white
    }
    
    
    @IBAction func copyButtonAction(_ sender: UIButton) {
        let shareCtrl:UIActivityViewController = UIActivityViewController(activityItems: [exaLoremLabel.text], applicationActivities: nil)
        present(shareCtrl, animated: true)
        loadingIndicator.isHidden = false
        loadingIndicator.startAnimating()
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now()+2){
            self.loadingIndicator.isHidden = true
            self.loadingIndicator.stopAnimating()
            self.copyButton.setTitle("Copied", for: UIControl.State.application)
        }
    }
}
