import Vapor

/// Register your application's routes here.
public func routes(_ router: Router) throws {
    // Basic "It works" example
    router.get { req in
        return "Use /animation/<id> to request a specific animation"
    }

    // Example of configuring a controller
    let animationsController = AnimationsController()
    router.get("animation", use: animationsController.animation)
    
    let dataController = DataController()
    router.get("all", use: dataController.all)
    
    router.get("one") { request -> User in
        return try dataController.returnOne(request)
    }
}
