import Fluxus

class AppRootGetter: RootGetter<AppRootState> {
  func landmark(withId id: Int) -> Landmark {
    return state.landmarkState.landmarks.first(where: { $0.id == id })!
  }

  func landmarkIndex(withId id: Int) -> Int {
    return state.landmarkState.landmarks.firstIndex(where: { $0.id == id })!
  }

  var landmarkCategories: [String: [Landmark]] {
    .init(
      grouping: state.landmarkState.landmarks,
      by: { $0.category.rawValue }
    )
  }

  var featuredLandmarks: [Landmark] {
    state.landmarkState.landmarks.filter { $0.isFeatured }
  }
}
