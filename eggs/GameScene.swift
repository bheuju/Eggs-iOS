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
    
    let egg: Egg = Egg()
    
    override func didMove(to view: SKView) {
        
        let nest1 = Nest(CGPoint(x: view.frame.width / 2, y: 100))
        self.addChild(nest1)
        
        let nest2 = Nest(CGPoint(x: 30, y: 400))
        self.addChild(nest2)
        
        egg.position = CGPoint(x: view.frame.width / 2, y: 300 + 12)
        self.addChild(egg)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        egg.physicsBody?.applyImpulse(CGVector(dx: 0, dy: 100))
    }
}
