import Foundation

class Validator {
    func validation1(mail: String, password: String) -> String {
        
        if  mail.trimmingCharacters(in: .whitespacesAndNewlines) == "" || password.trimmingCharacters(in: .whitespacesAndNewlines) == "" {
            return "Fill all forms!"
            
        }
        return ""
    }
    
    
    func validation(mail: String, password: String, repeatPassword: String) -> String {
        
        if mail.trimmingCharacters(in: .whitespacesAndNewlines) == "" || password.trimmingCharacters(in: .whitespacesAndNewlines) == "" || repeatPassword.trimmingCharacters(in: .whitespacesAndNewlines) == "" {
            return "Fill all forms!"
        }
        if !isValidEmail(mail){
            return "Enter valid mail adress!"
        }
        if !isPasswordValid(password) {
            return "Your password is not strong enough!"
        }
        if password != repeatPassword {
            return "Passwords do not math!"
        }
        return ""
    }
    
    func isPasswordValid(_ password : String) -> Bool {
        let passwordTest = NSPredicate(format: "SELF MATCHES %@", "^(?=.*[a-z])(?=.*[$@$#!%*?&])[A-Za-z\\d$@$#!%*?&]{8,}")
        return passwordTest.evaluate(with: password)
    }
    
    func isValidEmail(_ mail :String) -> Bool {
        let mailTest = NSPredicate(format: "SELF MATCHES %@", "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}")
        return mailTest.evaluate(with: mail)

    }
}
