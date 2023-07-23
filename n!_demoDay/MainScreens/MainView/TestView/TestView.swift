import SwiftUI

struct TestView: View {
    let type: TestType
    @StateObject var viewModel = TestViewModel()
    @State var isTestPassed = false
    @State var isDataArrived = false
    
    var body: some View {
        NavigationStack{
            VStack {
                Text("Отметьте симптомы с которыми вы сталкиваетесь")
                    .font(.system(size: 24, weight: .semibold))
                    .padding(.bottom, 10)
                    List {
                        ForEach(viewModel.tests, id: \.self) { test in
                            TestRow(test: test, meanings: $viewModel.meanings)
                        }
                        Button(action: {
                            sendData()
                        }) {
                            Text("Готово")
                                .foregroundColor(.white)
                                .padding()
                                .background(Color.customBlue)
                                .cornerRadius(10)
                        }
                    }

                Spacer()
            }
            .onAppear {
                viewModel.getTests(testType: type)
            }
            .sheet(isPresented: $isDataArrived) {
                RecommendationView(viewModel: viewModel)
            }
            .listStyle(.plain)
            .background(Color.white)
        }
    }
    
    func sendData() {
        print(viewModel.meanings.values)
        let symptoms = Array(viewModel.meanings.values)
        viewModel.getRecommendations(symptoms: symptoms)
        isDataArrived = true
    }
}

struct TestRow: View {
    var test: Test
    @Binding var meanings: [String: String]
    @State var isSelected = false
    
    var body: some View {
        HStack {
            Text(test.question)
                .frame(width: 280, alignment: .leading)
            
            Spacer()
            
            ZStack {
                Circle()
                    .stroke(Color.black, lineWidth: 2)
                    .frame(width: 20, height: 20)
                
                if isSelected {
                    Circle()
                        .fill(Color.black)
                        .frame(width: 15, height: 15)
                        .onTapGesture {
                            withAnimation {
                                self.isSelected.toggle()
                            }
                            meanings.removeValue(forKey: test.question)
                        }
                }
            }
            .contentShape(Circle())
            .onTapGesture {
                withAnimation {
                    self.isSelected.toggle()
                }
                meanings[test.question] = test.meaning
            }
        }
        .frame(height: 50)
    }
}

enum TestType {
    case short
    case full
}
