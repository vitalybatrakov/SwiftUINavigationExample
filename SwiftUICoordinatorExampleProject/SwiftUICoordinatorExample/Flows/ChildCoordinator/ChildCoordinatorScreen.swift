import SwiftUI

struct ChildCoordinatorScreen: View {
    
    @EnvironmentObject var coordinator: ChildCoordinator
    
    var body: some View {
        CoordinatedView(
            pushedDepth: coordinator.navigationControllers.last?.navigationPath.count ?? 0,
            presentedDepth: coordinator.navigationControllers.count - 1,
            coordinatorTypeName: String(describing: ChildCoordinator.self),
            onPushNext: { coordinator.pushNextScreen() },
            onPopLast: { coordinator.popLast() },
            onPopToRoot: { coordinator.popToRoot() },
            onPresentNext: { coordinator.presentNextScreen() },
            onDismissTop: { coordinator.dismissTop() },
            onDismissToRoot: { coordinator.dismissToRoot() },
            onPresentChild: { coordinator.presentChild() },
            onDismissAll: { coordinator.finish() }
        )
    }
}
