import Fluxus

class AppRootGetters: RootGetters<AppRootState> {
  func landmark(withId id: Int) -> Landmark {
    return rootState.landmarkState.landmarks.first(where: { $0.id == id })!
  }

  func landmarkIndex(withId id: Int) -> Int {
    return rootState.landmarkState.landmarks.firstIndex(where: { $0.id == id })!
  }

  var landmarkCategories: [String: [Landmark]] {
    .init(
      grouping: rootState.landmarkState.landmarks,
      by: { $0.category.rawValue }
    )
  }

  var featuredLandmarks: [Landmark] {
    rootState.landmarkState.landmarks.filter { $0.isFeatured }
  }
}
