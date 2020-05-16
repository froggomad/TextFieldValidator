//
//  TextfieldAlerterMessage.swift
//  EmptyTextfieldAlerter
//
//  Created by Kenny on 5/15/20.
//  Copyright © 2020 Hazy Studios. All rights reserved.
//

import UIKit

internal class TextFieldModel: Equatable {
    //MARK: - Properties -
    let textField: UITextField
    ///message used for alert
    var message: String
    ///used to hold the textField's text property (or an empty string if nil)
    var text: String {
        self.textField.text ?? ""
    }

    //MARK: - Init -
    init(textfield: UITextField, message: String) {
        self.textField = textfield
        self.message = message
    }

    //MARK: - Equatable Conformance -
    static func == (lhs: TextFieldModel, rhs: TextFieldModel) -> Bool {
        lhs.textField == rhs.textField
    }
}
