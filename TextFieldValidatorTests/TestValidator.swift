//
//  TestValidator.swift
//  TextFieldValidatorTests
//
//  Created by Kenny on 5/18/20.
//  Copyright © 2020 Hazy Studios. All rights reserved.
//

import XCTest
@testable import TextFieldValidator

class TestValidator: XCTestCase {
    //MARK: - Properties -
    var validator: TextFieldValidator?

    override func setUpWithError() throws {
        validator = TextFieldValidator(viewController: UIViewController())
    }

    override func tearDownWithError() throws {
        validator = nil
    }

    func testNilTextField() throws {
        let nilField: UITextField?
        nilField = nil
        validator?.set(nilField, with: "This is nil")
        XCTAssertNil(validator?[nilField])
        validator?[nilField] = "This is nil"
        XCTAssertNil(validator?[nilField])
    }

    func testSetMethod() throws {
        let textField = UITextField()
        validator?.set(textField, with: "There's no text")
        XCTAssertEqual(validator?[textField], "There's no text")
    }

    func testSubscriptSet() throws {
        let textField = UITextField()
        validator?[textField] = "There's no text"
        XCTAssertEqual(validator?[textField], "There's no text")
    }

    func testRemoveMethod() throws {
        let textField = UITextField()
        validator?[textField] = "There's no text"
        validator?.removeTextField(textField)
        XCTAssertNil(validator?[textField])
    }

}
