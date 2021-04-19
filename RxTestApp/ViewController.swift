//
//  ViewController.swift
//  RxTestApp
//
//  Created by anduser on 13.04.2021.
//

import UIKit

import RxSwift
import RxCocoa

class ViewController: UIViewController {

    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmButton: UIButton!
    
    var loginFlag: Bool = false {
        didSet { // если перенести логику проверки из метода внутрь этого скоупа - то надо менять на  willSet чтобы избежать задержки
            changeConfirmationButtonEnabled()
        }
    }
    
    var passwordFlag: Bool = false {
        didSet {
            changeConfirmationButtonEnabled()
        }
    }
    
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loginTextField
            .rx.text
            .orEmpty
            .subscribe(onNext: { [ unowned self] chars in
                if (chars.count >= 3) {
                    self.loginFlag = true
                } else {
                    self.loginFlag = false
                }
             }, onError: nil, onCompleted: nil, onDisposed: nil)
            .disposed(by: disposeBag)
        
        passwordTextField
            .rx.text
            .orEmpty
            .subscribe(onNext: { [ unowned self] chars in
                if (chars.count >= 3) {
                    self.passwordFlag = true
                } else {
                    self.passwordFlag = false
                }
            }, onError: nil, onCompleted: nil, onDisposed: nil)
            .disposed(by: disposeBag)
    
    }
    
    func changeConfirmationButtonEnabled() {
        if (loginFlag && passwordFlag == true) {
            self.confirmButton.isEnabled = true
        } else {
            self.confirmButton.isEnabled = false
        }
        //passwordFlag && newValue  ? self.confirmButton.isEnabled = true : self.confirmButton.isEnabled = false
    }
    
    @IBAction func confirmButton(_ sender: UIButton) {
        var alertController: UIAlertController
        if (passwordTextField.text == "password" && loginTextField.text == "login") {
            alertController = UIAlertController(title: "Success", message: nil, preferredStyle: .alert)
            let action = UIAlertAction(title: "Ok", style: .default) { (alert) in
                let secondVC = InfoCityViewController()
                //let navController = UINavigationController(rootViewController: self)//UINavigationController(navigationBarClass: <#T##AnyClass?#>, toolbarClass: <#T##AnyClass?#>)
                self.navigationController?.pushViewController(secondVC, animated: true)
            }
            alertController.addAction(action)
        } else {
            alertController = UIAlertController(title: "Error", message: "Wrong login or password, try again", preferredStyle: .alert)
            let action = UIAlertAction(title: "Ok", style: .cancel) { (action) in
                
            }
            alertController.addAction(action)
        }
        self.present(alertController, animated: true, completion: nil)
    }
}
