import SwiftUI

struct MainView: View {
    @StateObject var viewModel = MainViewModel()
    @State private var showTest = false
    @State var newHabit = ""
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading) {
                    Text("Привет! Сегодня вы молодец")
                        .font(.system(size: 30,weight: .bold))
                    
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
                    
                    HStack {
                        TextField("Добавить привычку", text: $newHabit, onEditingChanged: { _ in }, onCommit: {
                            createHabit()
                            newHabit = ""
                        })
                        Button {
                            createHabit()
                            
                        } label: {
                            Text("+")
                                .font(.system(size: 24, weight: .bold))
                                .foregroundColor(.black)
                        }
                    }
                    .padding(.horizontal)
                    .padding(.top)
                    
                    List(viewModel.habits) { habit in
                        HabitView(habit: habit)
                            .swipeActions(edge: .trailing) {
                                Button(action: {
                                    viewModel.deleteHabit(habitId: habit.id)
                                    print("Deleting")
                                }, label: {
                                    Image(systemName: "trash")
                                        .frame(width: 50, height: 50)
                                })
                                .tint(.red)
                            }
                    }
                    .frame(height: 300)
                }
                .listStyle(.plain)
                .background(Color.white)
                .padding(.horizontal)
            }
            .navigationTitle("")
            .onAppear {
                print("MAIN VIEW ON APPEAR")
                viewModel.getHabits()
            }
            
        }
        .tint(Color.customBlue)
    }
    
    var passTestButton: some View {
        NavigationLink(destination: TestConformationView()) {
            TestButton(text: "пройти тест")
        }
        
    }
    
    private func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
    
    private func createHabit() {
        if newHabit.trimmingCharacters(in: .whitespacesAndNewlines) != "" {
            viewModel.createHabit(habit: newHabit)
            newHabit = ""
            hideKeyboard()
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
