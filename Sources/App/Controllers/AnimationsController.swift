import Vapor

final class AnimationsController {
    
    func animation(_ req: Request) throws -> AnimationModel {
        let animationid = try req.parameters.next(String.self)
        let animationStorage = try req.make(AnimationsStorage.self)
        
        if let animation = animationStorage.animation(byId: animationid) {
            return animation
        } else {
            throw Abort(.notFound)
        }
    }
    
}
