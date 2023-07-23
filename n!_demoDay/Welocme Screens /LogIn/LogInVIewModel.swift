import Foundation

class LogInViewModel {
    private let provider = API.provider
    
    func authorizeUser(mail: String, password: String, completion: @escaping ((Bool, String)) -> ()) {
        let endpoint = API.APIEndpoint.authorizeUser(mail: mail, password: password)
        
        provider.request(endpoint) { result in
            switch result {
            case let .success(response):
                do {
                    let decoder = JSONDecoder()
                    let authorizeUserResponse = try decoder.decode(AuthorizeUserResponse.self, from: response.data)
                    print(authorizeUserResponse)
                    UserDefaults.standard.set("Bearer " + authorizeUserResponse.access_token, forKey: UserDefaultKeys.tokenKey)

                    completion((true, "Bearer" + authorizeUserResponse.access_token))

                } catch {

                    completion((false, "Decoding Error"))
                    print("Decoding Error:", error)
                }

            case let .failure(error):
                // Handle error
                completion((false, "Server Error"))
                print(error)
            }
        }
    }
}


struct AuthorizeUserResponse: Codable {
    let access_token: String
    let token_type: String
}
