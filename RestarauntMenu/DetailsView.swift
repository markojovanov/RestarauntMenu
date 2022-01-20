//
//  DetailsView.swift
//  RestarauntMenu
//
//  Created by Marko Jovanov on 20.1.22.
//

import SwiftUI

struct DetailsView: View {
    var item: FoodDrinkModel
    @State var comment: String = ""
    @State var comments: [String] = []
    @State private var showImagePicker: Bool = false
    @State private var image: Image? = nil
    
    func submitTextField() {
        comments.append(comment)
        comment = ""
    }
    
    var body: some View {
        VStack {
            if image != nil {
                image?.resizable()
                    .scaledToFit()
                    .frame(maxWidth: 200, maxHeight: 200)
                    .clipShape(RoundedRectangle(cornerRadius: 25))
            } else {
                AsyncImage(url: URL(string: item.image)) { image in
                    image.resizable()
                        .scaledToFit()
                        .frame(maxWidth: 200, maxHeight: 200)
                } placeholder: {
                    Color.red
                }
                .clipShape(RoundedRectangle(cornerRadius: 25))
            }
            Text("\(item.title)")
                .font(.headline)
            Text("Category: \(item.subtitle)")
                .font(.subheadline)
            Button {
                showImagePicker.toggle()
            } label: {
                HStack{
                    Text("Open Camera")
                }
                .padding()
                .background(Color.yellow)
                .foregroundColor(.black)
                .cornerRadius(20)
            }
            .sheet(isPresented: $showImagePicker) {
                ImagePicker(isShown: $showImagePicker, image: $image)
            }
            
            HStack {
                TextField("Add comment:", text: $comment)
                    .foregroundColor(Color(uiColor: UIColor.lightGray))
                    .padding()
                Button {
                    submitTextField()
                } label: {
                    Text("Submit")
                        .padding()
                }
            }
        }
        VStack(alignment: .leading) {
            Text("Comments:")
                .font(.title)
            ForEach(comments, id: \.self) { comment in
                Text(comment)
                    .padding()
            }
        }
    }
}

struct DetailsView_Previews: PreviewProvider {
    static var previews: some View {
        DetailsView(item: FoodDrinkModel(id: 1, title: "dssd", subtitle: "dsa", image: "dsads"), comments: ["dsa","dsdss"])
    }
}
