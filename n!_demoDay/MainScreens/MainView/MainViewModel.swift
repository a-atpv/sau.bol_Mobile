import Foundation

class MainViewModel: ObservableObject {
    private let provider = API.provider
    @Published var habits = [Habit]()
    
    func getHabits() {
        let endpoint = API.APIEndpoint.getHabits
        
        provider.request(endpoint) { result in
            switch result {
            case let .success(response):
                do {
                    let decoder = JSONDecoder()
                    let habitModels = try decoder.decode(GetHabitResponse.self, from: response.data).habits
                    self.habits = habitModels.map { Habit(habit: $0) }
                    
                } catch {

                    print("Decoding Error:", error)
                }
            case let .failure(error):

                print(error)
            }
        }
    }
    
    func deleteHabit(habitId: String) {
        let endpoint = API.APIEndpoint.deleteHabit(habit_id: habitId)
        
        provider.request(endpoint) { result in
            switch result {
            case let .success(response):
                self.habits.removeAll { $0.id == habitId }
                print(response)
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
                var newHabit = Habit(text: habit)
                self.habits.append(newHabit)
            case let .failure(error):
                print(error)
            }
        }
    }
    
}
struct GetHabitResponse: Codable {
    var habits: [HabitModel]
}

struct HabitModel: Codable, Identifiable {
    let id: String
    let description: String
    let achievedDates: [String]
    let userId: String

    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case description
        case achievedDates = "achieved_dates"
        case userId = "user_id"
    }
}
