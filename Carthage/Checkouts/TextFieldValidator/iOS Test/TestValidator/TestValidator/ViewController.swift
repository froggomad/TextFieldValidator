//
//  ViewController.swift
//  TestAlerter
//
//  Created by Kenny on 5/15/20.
//  Copyright © 2020 Hazy Studios. All rights reserved.
//

import UIKit
import TextFieldValidator

class ViewController: UIViewController {

    //MARK: - IBOutlets -
    @IBOutlet private var nameField: UITextField!
    @IBOutlet private var emailField: UITextField!

    //MARK: - Properties -
    /*
     This must be lazy in order to avoid an ambiguous error about ViewController not being UIViewController
     "Cannot convert value of type '(ViewController) -> () -> ViewController' to expected argument type 'UIViewController'"
     */
    lazy var alerter = TextFieldValidator(viewController: self)

    //MARK: - View Lifecycle -
    override func viewDidLoad() {
        super.viewDidLoad()
        //subscripting is supported
        alerter[nameField] = "Your Name"
        //set is identical to subscripting
        alerter.set(
            emailField,
            with: "Your E-mail Address"
        )
    }

    @IBAction func doneButton(_ sender: UIButton) {
        alerter.alertIfEmpty()
        //unwrap your text as usual
        guard let someText = nameField.text else { return }
        print(someText)

        //for more complex operations, there's a closure that returns Void
        /*
        alerter.alertIfEmpty() {
            //The getText method returns the textField's text safely unwrapped or an empty String if it fails
            print(self.alerter.getText(from: self.nameField))
        }
        */
    }

}

