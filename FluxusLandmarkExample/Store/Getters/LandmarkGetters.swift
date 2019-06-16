import Fluxus

class LandmarkGetters: Getters<LandmarkState, AppRootGetters, AppRootState> {
  func landmark(withId id: Int) -> Landmark {
    return state.landmarks.first(where: { $0.id == id })!
  }

  func landmarkIndex(withId id: Int) -> Int {
    return state.landmarks.firstIndex(where: { $0.id == id })!
  }

  var landmarkCategories: [String: [Landmark]] {
    .init(
      grouping: state.landmarks,
      by: { $0.category.rawValue }
    )
  }

  var featuredLandmarks: [Landmark] {
    state.landmarks.filter { $0.isFeatured }
  }
}
