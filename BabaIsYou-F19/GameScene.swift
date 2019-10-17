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
    let BABA_SPEED:CGFloat = 20
    
    var wall:SKSpriteNode!
    var winblock:SKSpriteNode!
    var stopblock:SKSpriteNode!
    var wallblock:SKSpriteNode!
    var flagblock:SKSpriteNode!
    var isblock:SKSpriteNode!
    var flag:SKSpriteNode!
    

    override func didMove(to view: SKView) {
        self.physicsWorld.contactDelegate = self
        
        self.baba = self.childNode(withName: "baba") as? SKSpriteNode
        
        self.winblock = self.childNode(withName: "winblock") as? SKSpriteNode
        
        self.stopblock = self.childNode(withName: "stopblock") as? SKSpriteNode
        
        self.wall = self.childNode(withName: "wall") as? SKSpriteNode
        self.wallblock = self.childNode(withName: "wallblock") as? SKSpriteNode
        
        self.flag = self.childNode(withName: "flag") as? SKSpriteNode
        self.flagblock = self.childNode(withName: "flagblock") as? SKSpriteNode
        
        self.isblock = self.childNode(withName: "isblock") as? SKSpriteNode
        
    }
   
    func didBegin(_ contact: SKPhysicsContact) {
        print("Something collided!")
        let nodeA = contact.bodyA.node
        let nodeB = contact.bodyB.node
        
               
        if (nodeA!.name == "wallblock" && nodeB!.name == "isblock") {
        
            print("WALLS WILL STOP THE BABA")
            
        }
        
             
    }
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
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
