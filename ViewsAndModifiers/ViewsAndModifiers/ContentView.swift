import SwiftUI

// custom modifiers

struct BigBlue: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
    }
}

struct BigRed: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.title2)
            .padding(/*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
            .background(Color.white)
            .foregroundColor(.red)
    }
}


struct BigTitle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .background(LinearGradient(gradient: Gradient(colors: [Color.black, Color.white]), startPoint: .top, endPoint: .bottom))
    }
}

extension View {
    func bigTitlestyle() -> some View {
        self.modifier(BigTitle())
    }
    
    func bigRed() -> some View {
        self.modifier(BigRed())
    }
    
    func bigBlue() -> some View {
        self.modifier(BigBlue())
    }
}

// custom views
struct CapsuleButton: View {
    var text: String = ""
    @State private var showMe: Bool = false
    var body: some View {
        Button(text) {
            self.showMe.toggle()
        }
            .foregroundColor(.white)
            .padding()
            .background(Color.black)
            .clipShape(Capsule())
        .alert(isPresented: $showMe) {
            Alert(title: Text("Message"), message: Text("Message is: \(self.text)"), dismissButton: .default(Text("OK"))
            )
        }
    }
}

struct ContentView: View {
    @State private var toggleButtonColor = false
    // views as properties
    let motto1 = Text("Goodbye World!")
    
    var body: some View {
        VStack(spacing: 10) {
            CapsuleButton(text: "Goodbye")
                .bigTitlestyle()
            CapsuleButton(text: "Call Me")
            Text("Hello, world!")
            Button("Hello Button") {
                print("Hello")
            }
            .frame(width: 150, height: 60)
            .background(Color.blue)
            .foregroundColor(.white)
            
            Button("Switch Me") {
                self.toggleButtonColor.toggle()
            }
            .bigTitlestyle()
            
            Text("This is big blue")
                .bigBlue()
            
            Text("This is big red")
                .bigRed()
            
            motto1
                .foregroundColor(.white)
                .font(.title3)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.red)
        .edgesIgnoringSafeArea(.all)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
