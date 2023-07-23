import SwiftUI

struct MainView: View {
    @StateObject var viewModel = MainViewModel()
    @State private var showTest = false
    @State var newHabit = ""
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading){
                Text("Привет! Сегодня вы молодец")
                    .font(.system(size: 30,weight: .bold))
//                Text("Давай сегодня станем здоровее чем вчера")
//                    .font(.system(size: 14,weight: .light))
                HStack {
                    Image("doctor_avatar")
                        .resizable()
                        .frame(width: 120, height: 120)
                        .scaledToFill()
                        .clipShape(Circle())
                    VStack {
                        Text("Проверим твое самочувствие?")
                        passTestButton
                    }
                }
                
                HStack{
                    Button {
                        viewModel.createHabit(habit: newHabit)
                        newHabit = ""
                    } label: {
                        Text("+")
                            .font(.system(size: 24, weight: .bold))
                            .foregroundColor(.black)
                    }
                    TextField(text: $newHabit, prompt: Text("Добавить привычку")) {
                        Text("Добавить привычку")
                    }
                }
                .padding(.horizontal)
                .padding(.top)
                
                List(viewModel.habits){ habit in
                    HabitView(habit: habit)
                        .swipeActions(edge: .trailing, allowsFullSwipe: true) {
                            HStack{
                                Button(action: {
                                    viewModel.deleteHabit(habitId: habit.id)
                                }, label: {
                                    Label("Delete", systemImage: "trash")
                                })
                                .tint(.red)
                            }
                        }
                }
                .frame(height: 300)
//                Spacer()
                
                
                
            }
            .listStyle(.plain)
            .background(Color.white)
        }
        
        .onAppear{
            print(UserDefaults.standard.string(forKey: UserDefaultKeys.tokenKey) ?? "")
            viewModel.getHabits()
        }
        .padding(.horizontal)
    }
    var passTestButton: some View {
        NavigationLink(destination: TestConformationView()) {
            TestButton(text: "пройти тест")
        }
    }

}



struct HabitView: View {
    @State var habit: Habit
    
    var body: some View {
        HStack {
            Text(habit.text)
                .frame(width: 280,alignment: .leading)
            
            Spacer()
            
            ZStack {
                Circle()
                    .stroke(Color.black, lineWidth: 2)
                    .frame(width: 20, height: 20)
                
                if habit.done {
                    Circle()
                        .fill(Color.black)
                        .frame(width: 15, height: 15)
                        .onTapGesture {
                            withAnimation {
                                habit.done.toggle()
                            }
                        }
                }
            }
            .contentShape(Circle())
            .onTapGesture {
                withAnimation {
                    habit.done.toggle()
                }
            }
        }
        .frame(height: 50)
    }
}

struct TestButton: View{
    var text: String
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 12)
                .frame(width: 180, height: 40)
                .foregroundColor(.black)
            Text(text)
                .foregroundColor(.white)
                .bold()
                .font(.system(size: 16))
        }
    }
}

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

