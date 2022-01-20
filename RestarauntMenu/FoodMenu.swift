import SwiftUI

struct FoodMenu: View {
    var food: [FoodDrinkModel] = ApiLoader.load("food-api.json")
    @AppStorage("orangeMenu") private var orangeMenu = UserDefaults.standard.string(forKey: "orangeMenu") ?? ""
    @State var image: UIImage = UIImage()
    let layout = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: layout, spacing: 14) {
                    ForEach(food) { food in
                        NavigationLink(destination: DetailsView(item: food)) {
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
                                    AsyncImage(url: URL(string: food.image)) { image in
                                        image.resizable()
                                    } placeholder: {
                                        Color.red
                                    }
                                    .frame(width: 150, height: 130)
                                    .clipShape(RoundedRectangle(cornerRadius: 25))
                                    Text("\(food.title)")
                                        .font(.headline)
                                        .foregroundColor(.black)
                                    Text("Category: \(food.subtitle)")
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
            .navigationBarTitle("Food Menu")
        }
    }
}


struct FoodMenu_Previews: PreviewProvider {
    static var previews: some View {
        FoodMenu()
    }
}
