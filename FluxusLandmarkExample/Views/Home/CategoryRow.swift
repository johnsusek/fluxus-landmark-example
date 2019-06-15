import SwiftUI

struct CategoryRow: View {
  var categoryName: String
  var items: [Landmark]

  var body: some View {
    VStack(alignment: .leading) {
      Text(self.categoryName)
        .font(.headline)
        .padding(.leading, 15)
        .padding(.top, 5)

      ScrollView(showsHorizontalIndicator: false) {
        HStack(alignment: .top, spacing: 0) {
          ForEach(self.items.identified(by: \.name)) { landmark in
            NavigationButton(
              destination: LandmarkDetail(
                landmarkId: landmark.id
              )
            ) {
              CategoryItem(landmark: landmark)
            }
          }
        }
      }
      .frame(height: 185)
    }
  }
}

struct CategoryItem: View {
  var landmark: Landmark
  var body: some View {
    VStack(alignment: .leading) {
      landmark
        .image(forSize: 155)
        .renderingMode(.original)
        .cornerRadius(5)
      Text(landmark.name)
        .color(.primary)
        .font(.caption)
      }
      .padding(.leading, 15)
  }
}
