//
//  GameScene.swift
//  BabaIsYou-F19
//
//  Created by Parrot on 2019-10-17.
//  Copyright © 2019 Parrot. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene, SKPhysicsContactDelegate {
    
    var baba:SKSpriteNode!
    let BABA_SPEED:CGFloat = 30
    
    var wall1:SKSpriteNode!
    var wall2:SKSpriteNode!
    var wall3:SKSpriteNode!
    var wall4:SKSpriteNode!
    
    var winblock:SKSpriteNode!
    var stopblock:SKSpriteNode!
    var wallblock:SKSpriteNode!
    var flagblock:SKSpriteNode!
    var isblock:SKSpriteNode!
    var flag:SKSpriteNode!
    

    override func didMove(to view: SKView) {
        self.physicsWorld.contactDelegate = self
        
        //BABA - PLAYER
        self.baba = self.childNode(withName: "baba") as? SKSpriteNode
        self.baba.physicsBody?.categoryBitMask = 1
        self.baba.physicsBody?.isDynamic = true
        
        //WALLS
        self.wall1 = self.childNode(withName: "wall1") as? SKSpriteNode
        self.wall2 = self.childNode(withName: "wall2") as? SKSpriteNode
        self.wall3 = self.childNode(withName: "wall3") as? SKSpriteNode
        self.wall4 = self.childNode(withName: "wall4") as? SKSpriteNode
        
        //self.wall.physicsBody?.isResting = true
//        self.wall1.physicsBody?.categoryBitMask = 2
//        self.wall2.physicsBody?.categoryBitMask = 2
//        self.wall3.physicsBody?.categoryBitMask = 2
//        self.wall4.physicsBody?.categoryBitMask = 2
        
        
        //ISBLOCK
        self.isblock = self.childNode(withName: "isblock") as? SKSpriteNode
        self.isblock.physicsBody?.categoryBitMask = 4
        
        //WIN BLOCK
        self.wallblock = self.childNode(withName: "wallblock") as? SKSpriteNode
        self.wallblock.physicsBody?.categoryBitMask = 8
        self.wallblock.physicsBody?.isDynamic = true
        
        //FLAG BLOCK
        self.flagblock = self.childNode(withName: "flagblock") as? SKSpriteNode
        self.flagblock.physicsBody?.categoryBitMask = 16
        self.flagblock.physicsBody?.isDynamic = true
        
        //STOP BLOCK
        self.stopblock = self.childNode(withName: "stopblock") as? SKSpriteNode
        self.stopblock.physicsBody?.categoryBitMask = 32
        self.stopblock.physicsBody?.isDynamic = true
        
        //WIN BLOCK
        self.winblock = self.childNode(withName: "winblock") as? SKSpriteNode
        self.winblock.physicsBody?.categoryBitMask = 64
        self.winblock.physicsBody?.isDynamic = true
        
        //FLAG
        self.flag = self.childNode(withName: "flag") as? SKSpriteNode
        self.flag.physicsBody?.categoryBitMask = 128
        
    }
   
    func didBegin(_ contact: SKPhysicsContact) {
        //print("Something collided!")
/*
        let nodeA = contact.bodyA.node
        let nodeB = contact.bodyB.node
        
        //WALL IS STOP
        if ((nodeA!.name == "wallblock" || nodeB!.name == "isblock") && (nodeA!.name == "isblock" || nodeB!.name == "stopblock")) {
            
            print("WALLS WILL STOP THE BABA")
            self.wall.physicsBody = SKPhysicsBody(rectangleOf: wall.size)
            self.wall.physicsBody?.affectedByGravity = false
            self.wall.physicsBody?.allowsRotation = false
            self.wall.physicsBody?.isDynamic = false
        }
        else{
            print("BABA WILL MOVE THROUGH WALLS")
        }
 */
             
    }
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered

        // Detect when WALL, IS and  STOP collide
        if ((self.wallblock.frame.intersects(self.isblock.frame)) && (self.isblock.frame.intersects(self.stopblock.frame))==true)
        {
            print("WALLS WILL STOP THE BABA")
            self.wall1.physicsBody = SKPhysicsBody(rectangleOf: wall1.size)
            self.wall2.physicsBody = SKPhysicsBody(rectangleOf: wall2.size)
            self.wall3.physicsBody = SKPhysicsBody(rectangleOf: wall3.size)
            self.wall4.physicsBody = SKPhysicsBody(rectangleOf: wall4.size)
            
            self.wall1.physicsBody?.affectedByGravity = false
            self.wall2.physicsBody?.affectedByGravity = false
            self.wall3.physicsBody?.affectedByGravity = false
            self.wall4.physicsBody?.affectedByGravity = false

            self.wall1.physicsBody?.allowsRotation = false
            self.wall2.physicsBody?.allowsRotation = false
            self.wall3.physicsBody?.allowsRotation = false
            self.wall4.physicsBody?.allowsRotation = false

            self.wall1.physicsBody?.isDynamic = false
            self.wall2.physicsBody?.isDynamic = false
            self.wall3.physicsBody?.isDynamic = false
            self.wall4.physicsBody?.isDynamic = false
        }
        else{
            print("BABA WILL GOTHROUGH THE WALLS")
           
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        // GET THE POSITION WHERE THE MOUSE WAS CLICKED
        // ---------------------------------------------
        let mouseTouch = touches.first
        if (mouseTouch == nil) {
                return
            }
        let location = mouseTouch!.location(in: self)

        // WHAT NODE DID THE PLAYER TOUCH
        // ----------------------------------------------
        let nodeTouched = atPoint(location).name
        //print("Player touched: \(nodeTouched)")
               
               
        // GAME LOGIC: Move player based on touch
        if (nodeTouched == "upButton") {
            // move up
            self.baba.position.y = self.baba.position.y + BABA_SPEED
        }
        else if (nodeTouched == "downButton") {
            // move down
            self.baba.position.y = self.baba.position.y - BABA_SPEED
        }
        else if (nodeTouched == "leftButton") {
            // move left
            self.baba.position.x = self.baba.position.x - BABA_SPEED
        }
        else if (nodeTouched == "rightButton") {
            // move right
            self.baba.position.x = self.baba.position.x + BABA_SPEED
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
    }
}
