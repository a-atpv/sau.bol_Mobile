import Foundation

struct TestResponse: Codable {
    var questions: [Test]
}

struct Test: Codable, Hashable {
    var _id: String
    var question: String
    var meaning: String
}
