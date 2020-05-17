[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)
# TextFieldValidator
This version of TextFieldValidator validates UITextFields to ensure that they contain text. If not, it presents a UIAlert with a nicely formatted custom message.

## Installation

1. [Carthage](README.md#carthage-installation)

### Carthage Installation <a id="carthage-installation" class="anchor" aria-hidden="true" href="#standard-pod-install"> </a>
Carthage is a decentralized dependency manager that builds your dependencies and provides you with binary frameworks. To integrate TextFieldValidator into your Xcode project using Carthage, specify it in your Cartfile:

`github "froggomad/TextFieldValidator"`
Then add the resulting Framework (normally found in the `Carthage/Build` folder) to your project as you normally would.

## Sample usage:

```
@IBOutlet private var nameField: UITextField!
@IBOutlet private var emailField: UITextField!

@IBAction func doneButtonTapped(_ sender: UIButton) {
  let validator = TextFieldValidator(viewController: self)
  //set messages for specific UITextFields via subscripting:
  validator[emailField] = "Your E-mail Address"
  //or use the TextFieldValidator.set method:
  validator.set(
            nameField,
            with: "Your Name"
  )
  //check all textFields that have been set on this validator and alert a message for each empty textField:
  validator.alertIfEmpty(title: "Please Enter Your:")

  //for more complex operations, there's a closure that returns Void
  /*
  validator.alertIfEmpty() {
      //The getText method returns the textField's text safely unwrapped or an empty String if it fails
      print(self.validator.getText(from: self.nameField))
  }
  */
}
```

![iPhone SE2 Screenshot](/Resources/SE_Screenshot.png?raw=true "Optional Title")

