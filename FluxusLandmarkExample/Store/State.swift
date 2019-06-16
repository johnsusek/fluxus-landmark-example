import Fluxus
import SwiftUI
import Combine

struct RootState {
  var landmark = LandmarkState()
  var profile = ProfileState()
  var hike = HikeState()
  var preferences = PreferencesState()
}

struct LandmarkState: FluxState {
  var landmarks: [Landmark] = LoadJSON("landmarkData.json")

  func landmark(withId id: Int) -> Landmark {
    return landmarks.first(where: { $0.id == id })!
  }

  func landmarkIndex(withId id: Int) -> Int {
    return landmarks.firstIndex(where: { $0.id == id })!
  }

  var landmarkCategories: [String: [Landmark]] {
    .init(
      grouping: landmarks,
      by: { $0.category.rawValue }
    )
  }

  var featuredLandmarks: [Landmark] {
    landmarks.filter { $0.isFeatured }
  }
}

struct ProfileState: FluxState {
  private static let defaultProfile = Profile(username: "John Appleseed!")

  var profile = defaultProfile
  var draftProfile = defaultProfile
}

struct HikeState: FluxState {
  var hikes: [Hike] = LoadJSON("hikeData.json")
}

struct PreferencesState: FluxState {
  var showFavoritesOnly = false
}
