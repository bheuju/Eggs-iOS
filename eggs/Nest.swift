//
//  Nest.swift
//  eggs
//
//  Created by Mac on 4/26/18.
//  Copyright © 2018 eggs. All rights reserved.
//

import SpriteKit

class Nest: SKNode {
    
    let nestTex = SKTexture(image: #imageLiteral(resourceName: "nest"))
    let nestFrontTex = SKTexture(image: #imageLiteral(resourceName: "nest_front"))
    
    init(_ position: CGPoint = .zero) {
        super.init()
        
        let nest = SKSpriteNode(texture: nestTex, color: .clear, size: nestTex.size())
        nest.zPosition = ZIndex.nest
        nest.position = .zero
        
        let nestFront = SKSpriteNode(texture: nestFrontTex, color: .clear, size: nestFrontTex.size())
        nestFront.zPosition = ZIndex.nestFront
        nestFront.position = .zero
        
        self.addChild(nest)
        self.addChild(nestFront)
        
        self.position = position
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
