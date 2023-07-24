import SwiftUI

struct TestConformationView: View {
    var body: some View {
        VStack {
            Text("Тесты помогут определить ваше общее состояние, ваши возможные проблемы со здововьем. На основе ответов будут даны рекомендации по анализам, которые стоит сдать и привычками для внедрения в повседневную жизнь")
            HStack {
//                Image("doctor_explaining")
//                    .resizable()
//                    .frame(width: 100, height: 100)
//                    .scaledToFill()
//                    .clipShape(Circle())
                Text("Выберите тест для прохождения")
                    .font(.system(size: 20, weight: .bold))
            }
//            Spacer()
            
            
            VStack {
                HStack {
                    manTestButton
                    childTestButton
                }
                HStack {
                    shortTestButton
                    womanTestButton
                }
            }
            Text("Короткий тест займет 1 минуту, подробные тесты 3 минуты ")
        }
    }
    
    var shortTestButton: some View {
        NavigationLink(destination: TestView(type: .short)) {
            TestButtonView(type: .short)
        }
    }
    
    var manTestButton: some View {
        NavigationLink(destination: TestView(type: .man)) {
            TestButtonView(type: .man)
        }
    }
    var womanTestButton: some View {
        NavigationLink(destination: TestView(type: .woman)) {
            TestButtonView(type: .woman)
        }
    }
    var childTestButton: some View {
        NavigationLink(destination: TestView(type: .child)) {
            TestButtonView(type: .child)
        }
    }
}
