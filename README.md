[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)
# TextFieldValidator
Validates if TextFields are empty and presents a UIAlert with a nicely formatted message

sample usage:

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
  alerter.alertIfEmpty()

  //for more complex operations, there's a closure that returns Void
  /*
  alerter.alertIfEmpty() {
      //The getText method returns the textField's text safely unwrapped or an empty String if it fails
      print(self.alerter.getText(from: self.nameField))
  }
  */
}
```
