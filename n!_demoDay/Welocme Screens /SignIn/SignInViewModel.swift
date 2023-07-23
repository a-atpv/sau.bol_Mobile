import Foundation

class SignInViewModel: ObservableObject {
    private let provider = API.provider
    
    func registerUser(mail: String, password: String, completion: @escaping ((Bool, String)) -> ()) {
        let endpoint = API.APIEndpoint.registerUser(mail: mail, password: password)
        
        provider.request(endpoint) { result in
            switch result {
            case let .success(response):
                do {
                    let decoder = JSONDecoder()
                    let registerUserResponse = try decoder.decode(RegisterUserResponse.self, from: response.data)
                    UserDefaults.standard.set("Bearer " + registerUserResponse.access_token, forKey: UserDefaultKeys.tokenKey)
                    print(registerUserResponse)
                    completion((true, "Bearer " + registerUserResponse.access_token))
                    
                } catch {
                    // Handle decoding error
                    completion((false, "Decoding Error"))
                    print("Decoding Error:", error)
                }
//                print(response)
            case let .failure(error):
                // Handle error
                completion((false, "Server Error"))
                print(error)
            }
        }
    }
}

struct RegisterUserResponse: Codable {
    var email: String
    let access_token: String
    let token_type: String
}
