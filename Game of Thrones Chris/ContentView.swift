import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack{
            Color.black.ignoresSafeArea()
            
            VStack {
                Image("Background")
                    .resizable()
                    .frame(width: 390, height: 500)
                    .scaledToFit()
                    .foregroundColor(.gray)
                    .padding(.top, -250.0)
            }
            
            VStack {
                Image("Background 2")
                    .resizable()
                    .frame(width: 200, height: 200)
                    .scaledToFit()
                    .foregroundColor(.gray)
                    .padding(.top, -1.0)
            }
            ContentView2()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        
    }
}

struct CharacterView: View {
    @Binding var selectedCharacter : Character?
    @Binding var shouldShowDetail : Bool
    let characters: [Character]
    
    
    var body: some View {
        VStack {
            ForEach(characters, id: \.firstName) { character in
                ImageCardView(character: character)
                    .onTapGesture {
                        selectedCharacter = character
                        shouldShowDetail = true
                    }
            }
        }
    }
}

struct ContentView2: View {
    @State private var characters = [Character]()
    @StateObject var netManager = GOTNetworkManager()
    @State var shouldShowDetail = false
    var character : Character?
    
    var body: some View {
        VStack{
            Spacer()
            if shouldShowDetail {
                CardView(character: netManager.selectedCharcter)
                InfoView(character: netManager.selectedCharcter)
            }
            
            ScrollView(.horizontal) {
                HStack {
                    ForEach(characters, id: \.firstName) { character in
                        ZStack {
                            CharacterView(selectedCharacter: $netManager.selectedCharcter, shouldShowDetail: $shouldShowDetail, characters: [character])
                        }
                    }
                }
            }
            .onAppear {
                loadData()
            }
        }
    }
    
    func loadData() {
        guard let url = URL(string: "https://thronesapi.com/api/v2/Characters") else {
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else {
                return
            }
            
            do {
                let decodedData = try JSONDecoder().decode(CharacterData.self, from: data)
                DispatchQueue.main.async {
                    self.characters = decodedData
                }
            } catch let error {
                print(error)
            }
        }.resume()
    }
}

struct CardView: View {
    var character : Character?
    var body: some View {
        ZStack{
            Rectangle()
                .frame(width: 300, height: 300)
                .foregroundColor(.white.opacity(0))
                .clipShape(RoundedRectangle(cornerRadius: 25))
                .padding(.bottom, 30)
            VStack{
                if let character = character{
                    ImageCardView(character: character)
                        .frame(width: 300, height: 300)
                }
            }
        }
    }
}

struct InfoView: View {
    var character : Character?
    var body: some View {
        ZStack{
            Rectangle()
                .scaledToFit()
                .frame(width: 300, height: 200)
                .foregroundColor(.white.opacity(0))
                .clipShape(RoundedRectangle(cornerRadius: 25))
            VStack{
                if let character = character{
                    InfoCardView(character: character)
                        
                }
            }
        }
    }
}
