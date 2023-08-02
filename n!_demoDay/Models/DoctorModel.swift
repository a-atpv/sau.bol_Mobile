struct Doctor: Codable, Identifiable {
    let id: String
    let image: String
    let name: String
    let title: String
    let price: String
    let about: String
    let number: String
    let facts: [String]
    let experience: String
    let patients: String
    let rating: String

    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case image
        case name
        case title
        case price
        case about
        case number
        case facts
        case experience 
        case patients 
        case rating 
    }
}


