import Moya
import Foundation

class API {
    static let provider = MoyaProvider<APIEndpoint>()

    enum APIEndpoint {
        case getShortTest
        case authorizeUser(mail: String, password: String)
        case getAcc
        case registerUser(mail: String, password: String)
        case getRecommendations(symptoms: [String])
        case getHabits
        case createHabit(habit: String)
        case deleteHabit(habit_id: String)
        case getDoctors
        case resetPassword(email: String, password: String, token: String)
        case sendTempPassword(email: String)
        case deleteUser
    }
}

extension API.APIEndpoint: TargetType {
    var baseURL: URL {
        return URL(string: "https://sau-bol.onrender.com")!
    }

    var path: String {
        switch self {
        case .getShortTest:
            return "/tests/short"
        case .authorizeUser:
            return "/auth/users/tokens"
        case .getAcc:
            return "/auth/users/me"
        case .registerUser:
            return "/auth/users"
        case .getRecommendations:
            return "tests/recommendations"
        case .getHabits:
            return "habits/me"
        case .createHabit:
            return "habits/create"
        case .deleteHabit:
            return "habits/delete"
        case .getDoctors:
            return "doctors/all"
        case .resetPassword:
            return "auth/reset-password"
        case .sendTempPassword:
            return "auth/password-reset-token"
        case .deleteUser:
            return "auth/user-delete"
        }
    }

    var method: Moya.Method {
        switch self {
        case .getShortTest:
            return .get
        case .authorizeUser:
            return .post
        case .getAcc:
            return .get
        case .registerUser:
            return .post
        case .getRecommendations:
            return .post
        case .getHabits:
            return .get
        case .createHabit:
            return .post
        case .deleteHabit:
            return .post
        case .getDoctors:
            return .get
        case .resetPassword:
            return .post
        case .sendTempPassword:
            return .post
        case .deleteUser:
            return .post
        }
    }

    var sampleData: Data {
        return Data()
    }

    var task: Task {
        switch self {
        case .getShortTest, .getAcc, .getHabits, .getDoctors, .deleteUser:
            return .requestPlain
            
        case let .authorizeUser(mail, password):
            let parameters: [String: Any] = ["mail": mail, "password": password]
            return .requestParameters(parameters: parameters, encoding: JSONEncoding.default)
            
        case let .getRecommendations(symptoms):
            let parameters: [String: Any] = ["symptoms": symptoms]
            return .requestParameters(parameters: parameters, encoding: JSONEncoding.default)
            
        case let .createHabit(habit: habit):
            let parameters: [String: Any] = ["habit": habit]
            return .requestParameters(parameters: parameters, encoding: JSONEncoding.default)
            
        case let .deleteHabit(habit_id:  habit_id):
            let parameters: [String: Any] = ["habit_id": habit_id]
            return .requestParameters(parameters: parameters, encoding: JSONEncoding.default)

        case let .registerUser(mail: mail, password: password):
            let parameters: [String: Any] = ["email": mail, "password": password]
            return .requestParameters(parameters: parameters, encoding: JSONEncoding.default)
            
        case let .resetPassword(email: email, password: password, token: token):
            let parameters: [String: Any] = ["email": email, "password": password, "token": token]
            return .requestParameters(parameters: parameters, encoding: JSONEncoding.default)
            
        case let .sendTempPassword(email: email):
            let parameters: [String: Any] = ["email": email]
            return .requestParameters(parameters: parameters, encoding: JSONEncoding.default)
        }
    }

    var headers: [String: String]? {
        switch self {
        case .authorizeUser, .registerUser, .resetPassword, .sendTempPassword:
            return nil
            
        case .getAcc, .getShortTest, .getRecommendations, .getHabits, .deleteHabit, .createHabit, .getDoctors, .deleteUser:
            return ["Content-Type": "application/json", "Authorization": UserDefaults.standard.string(forKey: UserDefaultKeys.tokenKey) ?? ""]
            
        }
    }
      
    
}
