//
//  Egg.swift
//  eggs
//
//  Created by Mac on 4/26/18.
//  Copyright © 2018 eggs. All rights reserved.
//

import SpriteKit

class Egg: SKSpriteNode, GameSprite {
    
    var imageTexture: SKTexture = SKTexture(image: #imageLiteral(resourceName: "egg"))
    
    init(_ position: CGPoint = .zero) {
        super.init(texture: imageTexture, color: .clear, size: imageTexture.size())
        self.zPosition = ZIndex.egg
        self.position = position
        
        self.physicsBody = SKPhysicsBody(texture: imageTexture, size: imageTexture.size())
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
