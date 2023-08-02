import Foundation

class ForgotPasswordViewModel: ObservableObject {
    private let provider = API.provider
    
    func sendNewPassword(mail: String) {
        let endpoint = API.APIEndpoint.sendTempPassword(email: mail)
        
        provider.request(endpoint) { result in
            switch result {
                
            case .success:
                ()
                
            case let .failure(error):
                print(error)
            }
        }
    }
    
    func setNewPassword(mail: String, newPassword: String, token: String) {
        let endpoint = API.APIEndpoint.resetPassword(email: mail, password: newPassword, token: token)
        
        provider.request(endpoint) { result in
            switch result {
                
            case .success:
                ()
                
            case let .failure(error):
                print(error)
            }
        }
    }
}
