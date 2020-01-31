//
//  AnimationStorage.swift
//  App
//
//  Created by Daniel Hjärtström on 2020-01-31.
//

import Vapor

final class AnimationsStorage: Service {
    
    func animation(byId id: String) -> AnimationModel? {
           if let jsonData = self.loadContent(of: id) {
               return AnimationModel(id: id, jsonData: jsonData)
           } else {
               return nil
           }
       }

       private let availableAnimations: [String] = [
           "animation1",
           "animation2"
       ]

       private func loadContent(of filename: String) -> String? {
           guard self.availableAnimations.contains(filename) else { return nil }

           let bundle = Bundle(for: AnimationsStorage.self)
           guard let filepath = bundle.path(forResource: filename, ofType: "json") else { return nil }

           do {
               return try String(contentsOfFile: filepath)
           } catch {
               return nil
           }
       }
    
}
