import Swinject
import SwinjectAutoregistration
import Core

final class MainFlowAssembly: Assembly {

    func assemble(container: Container) {
        
        container
            .register(BrowseViewController.self) { (_, parent: EventNode) in
                let controller = StoryboardScene.Browse.browseViewController.instantiate()
                let model = BrowseModel(parent: parent)
                controller.viewModel = BrowseViewModel(model: model)
                return controller
            }.inObjectScope(.container)
    }
    
}
