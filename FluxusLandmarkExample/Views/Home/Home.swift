/*
 See LICENSE folder for this sample’s licensing information.

 Abstract:
 A view showing featured landmarks above a list of all of the landmarks.
 */

import SwiftUI

struct CategoryHome: View {
  @EnvironmentObject var store: RootStore

  var body: some View {
    NavigationView {
      List {
        FeaturedLandmarks(landmarks: store.state.landmark.featuredLandmarks)
          .scaledToFill()
          .frame(height: 200)
          .clipped()
          .listRowInsets(EdgeInsets())

        ForEach(store.state.landmark.landmarkCategories.keys.sorted().identified(by: \.self)) { key in
          CategoryRow(categoryName: key, items: self.store.state.landmark.landmarkCategories[key]!)
        }.listRowInsets(EdgeInsets())

        NavigationButton(destination: LandmarkList()) {
          Text("See All")
        }
      }
      .navigationBarTitle(Text("Featured"))
      .navigationBarItems(trailing:
        PresentationButton(
          Image(systemName: "person.crop.circle")
            .imageScale(.large)
            .accessibility(label: Text("User Profile"))
            .padding(),
          destination:
            ProfileHost().environmentObject(store)
        )
      )
    }
  }
}

struct FeaturedLandmarks: View {
  var landmarks: [Landmark]
  var body: some View {
    landmarks[0].image(forSize: 250).resizable()
  }
}
