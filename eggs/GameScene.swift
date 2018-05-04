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
    
    var cam: SKCameraNode?
    
    let egg: Egg = Egg()
    
    let edge = SKNode()
    var nest1: Nest!
    var nest2: Nest!
    
    var nestVelocity: CGFloat = 2
    
    override func didMove(to view: SKView) {
        
        cam = SKCameraNode()
        self.camera = cam
        self.addChild(cam!)
        
        nest1 = Nest(CGPoint(x: view.frame.width / 2, y: 100))
        self.addChild(nest1)
        
        nest2 = Nest(CGPoint(x: 70, y: 400))
        self.addChild(nest2)
        
        egg.position = CGPoint(x: view.frame.width / 2, y: 300 + 12)
        self.addChild(egg)
        
        camera?.position = egg.position
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        egg.physicsBody?.applyImpulse(CGVector(dx: 0, dy: 100))
    }
    
    override func update(_ currentTime: TimeInterval) {
        
        if let camera = cam {
            camera.position.y = egg.position.y
            camera.position.y += 150
        }
        
        nest2.position.x += nestVelocity
        
        if nest2.position.x > (view?.frame.width)! || nest2.position.x < 0 {
            nestVelocity *= -1
        }
    }
}
