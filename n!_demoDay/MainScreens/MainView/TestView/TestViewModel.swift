import Foundation

class TestViewModel: ObservableObject {
    private let provider = API.provider
    @Published var tests = [Test]()
    @Published var meanings = [String:String]()
    @Published var recommendation : String = ""
    @Published var isDataLoaded = false
    
    func getTests(testType: TestType) {
        var endpoint: API.APIEndpoint {
            switch testType {
            case .short: return API.APIEndpoint.getShortTest
            case .man: return API.APIEndpoint.getShortTest
            case .woman: return API.APIEndpoint.getShortTest
            case .child: return API.APIEndpoint.getShortTest
            }
        }
        provider.request(endpoint) { result in
            switch result {
            case let .success(response):
                do {
                    let decoder = JSONDecoder()
                    decoder.keyDecodingStrategy = .convertFromSnakeCase
                    let testResponse = try response.map(TestResponse.self)
                    self.tests = testResponse.questions
                    self.isDataLoaded = true
                } catch {
                    // Handle decoding error
                    print(error)
                }
            case let .failure(error):
                print(error)
            }
        }
    }
    
    
    func getRecommendations(symptoms: [String]) {
        provider.request(.getRecommendations(symptoms: symptoms)) { result in
            switch result {
            case let .success(response):
                print(response)
                do {
                    let decoder = JSONDecoder()
                    decoder.keyDecodingStrategy = .convertFromSnakeCase
                    let recommendation = try response.map(RecommendationResponse.self)
                    self.recommendation = recommendation.recommendations
                    print(recommendation)
//                    completion()
                } catch {
                    // Handle decoding error
                    print(error)
                }
            case let .failure(error):
                print(error)
            }
        }
    }
}


