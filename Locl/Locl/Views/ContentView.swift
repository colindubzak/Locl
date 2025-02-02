import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            MapView().frame(height: 300)
            VStack(alignment: .leading) {
                Text("Welcome to Locl!")
                    .font(.title)
                    .foregroundColor(.black)
                HStack {
                    Text("Glad you're here")
                    Text("Josh and Ali")
                }.font(.subheadline).foregroundStyle(.secondary)
                Divider()
                Text("Yo what's good my brothas")
            }
            .padding()
            Spacer()
        }
    }
}

#Preview {
    ContentView()
}
