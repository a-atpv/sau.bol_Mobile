import SwiftUI

struct TestConformationView: View {
    var body: some View {
        VStack {
            HStack {
                Image("doctor_explaining")
                    .resizable()
                    .frame(width: 150, height: 150)
                    .scaledToFill()
                    .clipShape(Circle())
                Text("Выберите тест для прохождения")
                    .font(.system(size: 20,weight: .bold))
            }
            Text("короткий тест займет 1 минуту, подробные тесты 3 минуты ")
            shortTestButton
            fullTestButton
        }
    }
    
    var shortTestButton: some View {
        NavigationLink(destination: TestView(type: .short)) {
            TestButton(text: "короткий тест")
        }
    }
    
    var fullTestButton: some View {
        NavigationLink(destination: TestView(type: .full)) {
            TestButton(text: "полный тест")
        }
    }
}

struct TestConformationView_Previews: PreviewProvider {
    static var previews: some View {
        TestConformationView()
    }
}
