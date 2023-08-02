import Foundation

struct RecommendationResponse: Codable {
    var recommendations: String
}

struct Recommendation: Codable{
    let intro: String
    let analysis: [String]
    let explanation: String
    let habits: [String]
    let conclusion: String
}
