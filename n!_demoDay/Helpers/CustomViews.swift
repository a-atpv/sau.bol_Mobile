import SwiftUI

struct CustomViews: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct CustomButton: View {
    var text: String
    var action: () -> ()
    var body: some View {
        Button {
            action()
        } label: {
            ZStack {
                RoundedRectangle(cornerRadius: 12)
                    .frame(height: 50)
                    .foregroundColor(.black)
                Text(text)
                    .foregroundColor(.white)
                    .bold()
                    .font(.system(size: 16))
            }
            .padding(.horizontal)
        }
        
    }
}


struct CustomImageButton: View{
    var text: String
    var body: some View{
        ZStack {
            RoundedRectangle(cornerRadius: 12)
                .frame(height: 50)
                .foregroundColor(.black)
            Text(text)
                .foregroundColor(.white)
                .bold()
                .font(.system(size: 16))
        }
        .padding(.horizontal)
    }
}

struct BackButton: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        Button(action: {
            self.presentationMode.wrappedValue.dismiss()
        }) {
            ZStack {
                Circle()
                    .foregroundColor(.white)
                    .opacity(0.4)
                    .frame(width: 30, height: 30)
                
                Image("backButton")
                    .resizable()
                    .frame(width: 20, height: 20)
            }
        }
    }
}

struct BackToView<Destination: View>: View {
    var destination: Destination
    
    var body: some View {
        NavigationLink(destination: destination) {
            ZStack {
                Circle()
                    .foregroundColor(.white)
                    .opacity(0.4)
                    .frame(width: 30, height: 30)
                
                Image("backButton")
                    .resizable()
                    .frame(width: 20, height: 20)
            }
        }
    }
}


struct CustomViews_Previews: PreviewProvider {
    static var previews: some View {
        CustomViews()
    }
}
