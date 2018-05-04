//
//  ExampleScene.swift
//  eggs
//
//  Created by Mac on 5/4/18.
//  Copyright © 2018 eggs. All rights reserved.
//

import SpriteKit

class ExampleScene: SKScene, SKPhysicsContactDelegate {
    let BodyCategory: UInt32 = 0x1 << 1
    let PlatformCategory: UInt32 = 0x1 << 2
    let WallCategory: UInt32 = 0x1 << 3
    let EdgeCategory: UInt32 = 0x1 << 4 // This will prevent a platforom from falling down
    let PlayerCategory: UInt32 = 0x1 << 5
    
    let platformSpeed: CGFloat = 40.0
    
    let body = SKShapeNode(circleOfRadius: 20.0)
    
    let player = SKShapeNode(circleOfRadius: 20.0)
    
    let platform = SKSpriteNode(color: SKColor.green, size: CGSize(width: 100, height: 20))
    
    let notDynamicPlatform = SKSpriteNode(color: SKColor.green, size: CGSize(width: 100, height: 20))
    
    override func didMove(to view: SKView) {
        //Setup contact delegate so we can use didBeginContact and didEndContact methods
        physicsWorld.contactDelegate = self
        
        //Setup borders
        self.physicsBody = SKPhysicsBody(edgeLoopFrom: self.frame)
        self.physicsBody?.categoryBitMask = WallCategory
        self.physicsBody?.collisionBitMask = BodyCategory | PlayerCategory
        
        //Setup some physics body object
        body.position = CGPoint(x: self.frame.midX, y: self.frame.midY)
        body.fillColor = SKColor.green
        body.physicsBody = SKPhysicsBody(circleOfRadius: 20)
        body.physicsBody?.categoryBitMask = BodyCategory
        body.physicsBody?.contactTestBitMask = PlatformCategory
        body.physicsBody?.collisionBitMask = PlatformCategory | WallCategory
        body.physicsBody?.allowsRotation = false
        
        body.physicsBody?.isDynamic = true
        self.addChild(body)
        
        //Setup player
        player.position = CGPoint(x: self.frame.midX, y: 30)
        player.fillColor = SKColor.green
        player.physicsBody = SKPhysicsBody(circleOfRadius: 20)
        player.physicsBody?.categoryBitMask = PlayerCategory
        player.physicsBody?.contactTestBitMask = PlatformCategory
        player.physicsBody?.collisionBitMask = PlatformCategory | WallCategory | BodyCategory
        player.physicsBody?.allowsRotation = false
        player.physicsBody?.friction = 1
        player.physicsBody?.isDynamic = true
        
        self.addChild(player)
        
        //Setup platform
        
        platform.position = CGPoint(x: self.frame.midX, y: self.frame.midY - 100)
        platform.physicsBody = SKPhysicsBody(rectangleOf: platform.size)
        platform.physicsBody?.categoryBitMask = PlatformCategory
        platform.physicsBody?.contactTestBitMask = BodyCategory
        platform.physicsBody?.collisionBitMask = BodyCategory | EdgeCategory | PlayerCategory
        platform.physicsBody?.allowsRotation = false
        platform.physicsBody?.affectedByGravity = false
        platform.physicsBody?.isDynamic = true
        platform.physicsBody?.friction = 1.0
        platform.physicsBody?.restitution = 0.0
        platform.physicsBody?.mass = 20
        
        //Setup edge
        
        let edge = SKNode()
        
        edge.physicsBody = SKPhysicsBody(edgeFrom: CGPoint(x: 0, y: -platform.size.height / 2), to: CGPoint(x: self.frame.size.width, y: -platform.size.height / 2))
        
        edge.position = CGPoint(x: 0, y: self.frame.midY - 100)
        edge.physicsBody?.categoryBitMask = EdgeCategory
        edge.physicsBody?.collisionBitMask = PlatformCategory
        
        self.addChild(edge)
        
        self.addChild(platform)
        
    }
    
    override func update(_ currentTime: TimeInterval) {
        
        if platform.position.x <= platform.size.width / 2.0 + 20.0 && (platform.physicsBody?.velocity.dx)! < CGFloat(0) {
            
            platform.physicsBody?.velocity = CGVector(dx: platformSpeed, dy: 0.0)
            
        } else if (platform.position.x >= self.frame.size.width - platform.size.width / 2.0 - 20.0) && (platform.physicsBody?.velocity.dx)! >= CGFloat(0) {
            
            platform.physicsBody?.velocity = CGVector(dx: -platformSpeed, dy: 0)
            
        } else if (platform.physicsBody?.velocity.dx)! > CGFloat(0) {
            platform.physicsBody?.velocity = CGVector(dx: platformSpeed, dy: 0.0)
            
        } else {
            platform.physicsBody?.velocity = CGVector(dx: -platformSpeed, dy: 0.0)
            
        }
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        //let touch: AnyObject? = touches.anyObject() as AnyObject
        //let touch = touches as! AnyObject
        let location = touches.first?.location(in: self)
        
        //let location = touch.location(in: self)
        
        if location!.x > CGFloat(187.5) {
            
            player.physicsBody?.applyImpulse(CGVector(dx: 3, dy: 50))
            
        } else {
            player.physicsBody?.applyImpulse(CGVector(dx: -3, dy: 50))
        }
    }
    
}
