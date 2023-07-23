import Foundation

class User: Codable {
    var userId: String
    var name: String
    var age: Int
    var height: Double
    var weight: Double
    var BMI: Double? {
        let a = weight / (height * height)
        return ((a > 0 && a < 100) ? a : nil)
    }
    
    init(userId: String, name: String, age: Int, height: Double, weight: Double) {
        self.userId = userId
        self.name = name
        self.age = age
        self.height = height
        self.weight = weight
    }

}
