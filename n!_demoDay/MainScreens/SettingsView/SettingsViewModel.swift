import Foundation

class SettingsViewModel: ObservableObject {
    
    private let provider = API.provider
    
    func deleteUser() {
        let endpoint = API.APIEndpoint.deleteUser
        
        provider.request(endpoint) { result in
            switch result {
            case .success:
                ()
            case let .failure(error):
                print(error)
            }
        }
    }

    func logout() {
        UserDefaults.standard.removeObject(forKey: UserDefaultKeys.tokenKey)
    }
    
}
