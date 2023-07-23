import Foundation

class AppState: ObservableObject {
    @Published var isLoggedIn: Bool = UserDefaults.standard.object(forKey: UserDefaultKeys.tokenKey) != nil

    func login() {
//        UserDefaults.standard.set(token, forKey: UserDefaultKeys.tokenKey)
        isLoggedIn = true
    }

    func logout() {
//        UserDefaults.standard.removeObject(forKey: UserDefaultKeys.tokenKey)
        isLoggedIn = false
    }
}

