/*
 See LICENSE folder for this sample’s licensing information.

 Abstract:
 A view showing featured landmarks above a list of all of the landmarks.
 */

import SwiftUI

struct CategoryHome: View {
  @EnvironmentObject var getters: AppRootGetters
  @EnvironmentObject var landmarkState: LandmarkState
  @EnvironmentObject var hikeState: HikeState
  @EnvironmentObject var profileState: ProfileState

  var body: some View {
    NavigationView {
      List {
        FeaturedLandmarks(landmarks: getters.landmark.featuredLandmarks)
          .scaledToFill()
          .frame(height: 200)
          .clipped()
          .listRowInsets(EdgeInsets())

        ForEach(getters.landmark.landmarkCategories.keys.sorted().identified(by: \.self)) { key in
          CategoryRow(categoryName: key, items: self.getters.landmark.landmarkCategories[key]!)
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
            ProfileHost()
              .environmentObject(hikeState)
              .environmentObject(profileState)
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
