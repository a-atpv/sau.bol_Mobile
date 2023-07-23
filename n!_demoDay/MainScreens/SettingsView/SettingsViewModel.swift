import Foundation

class SettingsViewModel: ObservableObject {
    func logout() {
        UserDefaults.standard.removeObject(forKey: UserDefaultKeys.tokenKey)
    }
}
