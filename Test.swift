//import SwiftUI
//import Combine
//
//struct CharacterRow: View {
//    var character: Character
//
//    var body: some View {
//        HStack {
//            ImageView(withURL: character.image)
//                .frame(width: 70, height: 70)
//            Text(character.name)
//                .font(.headline)
//            Spacer()
//        }
//    }
//}
//
//struct ImageView: View {
//    @ObservedObject var imageLoader: ImageLoader
//
//    init(withURL url: String) {
//        imageLoader = ImageLoader(urlString: url)
//    }
//
//    var body: some View {
//        Image(uiImage: imageLoader.data.isEmpty ? UIImage(named: "placeholder")! : UIImage(data: imageLoader.data)!)
//            .resizable()
//            .aspectRatio(contentMode: .fit)
//    }
//}
//
//class ImageLoader: ObservableObject {
//    @Published var data = Data()
//
//    init(urlString:String) {
//        guard let url = URL(string: urlString) else { return }
//        let task = URLSession.shared.dataTask(with: url) { data, response, error in
//            guard let data = data else { return }
//            DispatchQueue.main.async {
//                self.data = data
//            }
//        }
//        task.resume()
//    }
//}
//
//struct Test: View {
//    @ObservedObject var charactersListVM = CharactersListViewModel()
//
//    var body: some View {
//        NavigationView {
//            List(charactersListVM.characters) { character in
//                CharacterRow(character: character)
//            }
//            .navigationBarTitle("Game of Thrones Characters")
//        }
//    }
//}
//
//class CharactersListViewModel: ObservableObject {
//    @Published var characters = [Character]()
//
//    init() {
//        fetchCharacters()
//    }
//
//    func fetchCharacters() {
//        // Use the API to fetch the characters data and update the characters property with the fetched data
//    }
//}
//
//struct Character: Decodable {
//    let name: String
//    let image: String
//}
