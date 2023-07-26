import SwiftUI

struct TestConformationView: View {
    var body: some View {
        VStack {
            HStack(alignment: .top) {
                Image("doctor_explaining")
                    .resizable()
                    .frame(width: 100, height: 100)
                    .scaledToFill()
                    .clipShape(Circle())
                
                Text("**Пройдите** тест чтобы получить рекомендации по возможным проблемам с вашим здоровьем")
            }
//            Spacer()
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
          
            Spacer()
            Text("Короткий тест займет 1 минуту, подробные тесты 3 минуты ")
        }
    }
    
    var shortTestButton: some View {
        NavigationLink(destination: TestView(type: .short)) {
            TestButtonView(type: .short)
                .navigationTitle("")
                .tint(Color.customBlue)
        }
    }
    
    var manTestButton: some View {
        NavigationLink(destination: TestView(type: .man)) {
            TestButtonView(type: .man)
                .navigationTitle("")
                .tint(Color.customBlue)
        }
    }
    var womanTestButton: some View {
        NavigationLink(destination: TestView(type: .woman)) {
            TestButtonView(type: .woman)
                .navigationTitle("")
                .tint(Color.customBlue)
        }
    }
    var childTestButton: some View {
        NavigationLink(destination: TestView(type: .child)) {
            TestButtonView(type: .child)
                .navigationTitle("")
                .tint(Color.customBlue)
        }
    }
}
