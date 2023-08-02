import Foundation

struct Habit: Identifiable {
    var id: String
    var text: String
    var done: Bool
    var achievedDates = [String]()
    
    init(text: String, done: Bool = false) {
        self.text = text
        self.done = done
        self.id = UUID().uuidString
    }
    
    init(habit: HabitModel) {
        self.id = habit.id
        self.text = habit.description
        self.done = false
        self.achievedDates = habit.achievedDates
    }
}
