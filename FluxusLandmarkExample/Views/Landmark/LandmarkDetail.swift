import SwiftUI
import Fluxus

struct LandmarkDetail: View {
  @EnvironmentObject var store: FluxStore
  @EnvironmentObject var getters: AppRootGetters
  @EnvironmentObject var landmarkState: LandmarkState

  var landmarkId: Int

  var body: some View {
    let landmark = getters.landmark.landmark(withId: self.landmarkId)

    return VStack {
      MapView(coordinate: landmark.locationCoordinate)
        .edgesIgnoringSafeArea(.top)
        .frame(height: 300)

      CircleImage(image: landmark.image(forSize: 250))
        .offset(y: -130)
        .padding(.bottom, -130)

      VStack(alignment: .leading) {
        HStack {
          Text(landmark.name).font(.title)

          Button(action: {
            self.store.commit(LandmarkMutation.ToggleFavorite(self.landmarkId))
          }) {
            Text(landmark.isFavorite ? "★" : "☆")
              .font(.title)
              .padding(EdgeInsets(top: 3, leading: 0, bottom: 0, trailing: 0))
          }
        }

        HStack(alignment: .top) {
          Text(landmark.park).font(.subheadline)
          Spacer()
          Text(landmark.state).font(.subheadline)
        }

        if landmark.parkDescription != nil {
          Text(landmark.parkDescription!)
            .font(.caption)
            .lineLimit(nil)
            .padding(EdgeInsets(top: 10, leading: 0, bottom: 0, trailing: 0))
          }
      }.padding()

      Spacer()
    }
    .navigationBarTitle(Text(landmark.name), displayMode: .inline)
    .onAppear() {
      self.store.dispatch(LandmarkAction.FetchParkDescription(landmark))
    }
  }
}
