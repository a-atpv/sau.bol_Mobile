import Foundation

class TestViewModel: ObservableObject {
    private let provider = API.provider
    @Published var tests = [Test]()
    @Published var meanings = [String:String]()
    @Published var recommendation: Recommendation?
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
                    let recommendation = try response.map(RecommendationResponse.self).recommendations
                    
                    if let data = recommendation.data(using: .utf8) {
                        do {
                            let recommendationData = try JSONDecoder().decode(Recommendation.self, from: data)
                            self.recommendation = recommendationData
                        } catch {
                            print("Error decoding JSON: \(error)")
                        }
                    } else {
                        print("Invalid JSON string")
                    }
                    
                } catch {
                    print(error)
                }
            case let .failure(error):
                print(error)
            }
        }
    }
    
    func createHabit(habit: String) {
        let endpoint = API.APIEndpoint.createHabit(habit: habit)
        
        provider.request(endpoint) { result in
            switch result {
            case let .success(response):
                print(response)
            case let .failure(error):
                print(error)
            }
        }
    }
}


