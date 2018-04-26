//
//  GameScene.swift
//  eggs
//
//  Created by Mac on 3/9/18.
//  Copyright © 2018 eggs. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    override func didMove(to view: SKView) {
        
        let nest1 = Nest(CGPoint(x: view.frame.width / 2, y: 100))
        self.addChild(nest1)
        
        let nest2 = Nest(CGPoint(x: view.frame.width / 2, y: 400))
        self.addChild(nest2)
        
        let egg = Egg(CGPoint(x: view.frame.width / 2, y: 100))
        egg.position.y += 10
        self.addChild(egg)
    }
}
