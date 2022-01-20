import SwiftUI

struct DrinkMenu: View {
    @AppStorage("orangeMenu") private var orangeMenu = UserDefaults.standard.string(forKey: "orangeMenu") ?? ""
    @State var image: UIImage = UIImage()
    var drink: [FoodDrinkModel] = ApiLoader.load("drink-api.json")
    
    let layout = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: layout, spacing: 14) {
                    ForEach(drink) { drink in
                        NavigationLink(destination: DetailsView(item: drink)) {
                            ZStack {
                                Rectangle()
                                    .frame(width: 174,height: 220)
                                    .foregroundColor(.white)
                                    .cornerRadius(30)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 30)
                                            .stroke(.black, lineWidth: 1)
                                    )
                                VStack {
                                    AsyncImage(url: URL(string: drink.image)) { image in
                                        image.resizable()
                                    } placeholder: {
                                        Color.red
                                    }
                                    .frame(width: 150, height: 130)
                                    .clipShape(RoundedRectangle(cornerRadius: 25))
                                    Text("\(drink.title)")
                                        .font(.headline)
                                        .foregroundColor(.black)
                                    Text("Category: \(drink.subtitle)")
                                        .font(.subheadline)
                                        .foregroundColor(.black)
                                }
                            }
                            .padding(.horizontal, 12)
                        }
                    }
                }
            }
            .background(orangeMenu == "Off" ? Color.white : Color.orange)
            .navigationBarTitle("Drink Menu")
        }
    }
}

struct DrinkMenu_Previews: PreviewProvider {
    static var previews: some View {
        DrinkMenu()
    }
}
