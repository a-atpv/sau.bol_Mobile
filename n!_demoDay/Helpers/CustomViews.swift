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
                    .frame(width: 300, height: 50)
                    .foregroundColor(.black)
                Text(text)
                    .foregroundColor(.white)
                    .bold()
                    .font(.system(size: 16))
            }
        }
        
    }
}


struct CustomViews_Previews: PreviewProvider {
    static var previews: some View {
        CustomViews()
    }
}
