import Foundation

struct Doctor: Codable, Identifiable {
    let id: String
    let image: String
    let name: String
    let title: String
    let price: String
    let info: String
    let number: String
    
    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case image
        case name
        case title
        case price
        case info
        case number
    }
}
