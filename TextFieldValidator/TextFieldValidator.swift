//
//  TextFieldAlert.swift
//  EmptyTextfieldAlerter
//
//  Created by Kenny on 5/15/20.
//  Copyright © 2020 Hazy Studios. All rights reserved.
//

import UIKit

public class TextFieldValidator {
    //MARK: - init -
    public init(viewController: UIViewController) {
        self.viewController = viewController
    }

    //MARK: - Properties -
    private var textFieldModels: [TextFieldModel] = []
    private var viewController: UIViewController

    //MARK: - Subscript/Create/Read/Update -
    public subscript(textField: UITextField?) -> String? {
        get {
            if let textField = textField {
                //filter the messages array checking to see if the textfields match. If they do, get the first result and return the message
                let filteredTextFieldModels = textFieldModels.filter {
                    $0.textField == textField
                }
                if filteredTextFieldModels.count >= 1 {
                    return textFieldModels.filter {
                        $0.textField == textField
                    }[0].message
                }
            }
            return nil
        }

        set {
            if let textField = textField,
                let newValue = newValue {
                set(textField, with: newValue)
            }
        }
    }
    
    // MARK: Create/Update
    public func set(_ textField: UITextField?, with message: String) {
        //find the first match in textFieldModels where the textField is the same
        if let textfieldMessage = textFieldModels.first(where: {
            $0.textField == textField
        }) {
            textfieldMessage.message = message
        } else {
            //if not found, create a new one and append
            guard let textField = textField else { return }
            let textfieldMessage = TextFieldModel(
                textfield: textField,
                message: message
            )
            textFieldModels.append(textfieldMessage)
        }
    }

    //MARK: - Read -
    public func getText(from textField: UITextField) -> String {
        return self[textField] ?? ""
    }

    //MARK: - Delete -
    public func removeTextField(_ textfield: UITextField) {
        guard let textfieldMessage = textFieldModels.first(where: {
            $0.textField == textfield
        }),
            let index = textFieldModels.firstIndex(of: textfieldMessage)
            else { return }
        textFieldModels.remove(at: index)
    }

    //MARK: - Methods -
    /**
        Checks all of the textFields that have been added, and presents an alert on the active ViewController
     - parameter title: The title of the alert
     - parameter separator: The separator to use between messages
     - parameter completion: completes when the alert is dismissed
     */
    public func alertIfEmpty(
        title: String = "Please Enter: ",
        separator: String = ",\n",
        completion: @escaping () -> Void = { }
    ) {
        //check all textField's text property and append their message to the messages array if they're empty
        var messages = [String]()
        for textfieldMessage in textFieldModels {
            if textfieldMessage.text.isEmpty {
                messages.append(textfieldMessage.message)
            }
        }
        //use the separator to create a string from the array
        let message = messages.joined(separator: separator)
        //present the alert if the message isn't an empty String
        if !message.isEmpty {
            let alert = UIAlertController(
                title: title,
                message: message,
                preferredStyle: .alert
            )
            let okAction = UIAlertAction(
                title: "Ok",
                style: .default)
            { _ in
                DispatchQueue.main.async {
                    completion()
                }
            }
            alert.addAction(okAction)
            viewController.present(alert, animated: true)
        }
    }
}
