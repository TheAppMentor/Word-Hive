//
//  ViewController.swift
//  WordHive
//
//  Created by Moorthy, Prashanth on 5/1/17.
//  Copyright © 2017 Moorthy, Prashanth. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit

class ViewController: UIViewController {

    @IBOutlet weak var gridContainer: UIView!
    
    var wordArray: [String]?
    var trie = Trie()
    
        override func viewDidLoad() {
            super.viewDidLoad()
            
            if let view = self.view as! SKView? {
                // Load the SKScene from 'GameScene.sks'
                if let scene = SKScene(fileNamed: "GameScene") {
                    // Set the scale mode to scale to fit the window
                    scene.scaleMode = .aspectFill
                    
                    // Present the scene
                    view.presentScene(scene)
                }
                
                view.ignoresSiblingOrder = true
                
                view.showsFPS = true
                view.showsNodeCount = true
            }
        }
        
        override var shouldAutorotate: Bool {
            return true
        }
        
        override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
            if UIDevice.current.userInterfaceIdiom == .phone {
                return .allButUpsideDown
            } else {
                return .all
            }
        }
        
        override var prefersStatusBarHidden: Bool {
            return true
        }
    
    
    override func viewWillAppear(_ animated: Bool) {
        print("View will appear")
        buildGrid()
        let wordList = DictionaryManager.shared.findWordsWithPrefix(prefix: "Hell")
        print("Word List is  : \(wordList) ")
        
//        let startTime = NSDate()
//        createWordArray()
//        print("Time to make word array = \(-startTime.timeIntervalSinceNow)")
//        let startTime1 = NSDate()
//        insertWordsIntoTrie()
//        print("Time to Build Tree = \(-startTime1.timeIntervalSinceNow)")
//
//        let startTime2 = NSDate()
//        let wordList = trie.findWordsWithPrefix(prefix: "Hell")
//        print("Word List is  : \(wordList) ")
//        print("Time to Look up prefix = \(-startTime2.timeIntervalSinceNow)")
    }

    
    func buildGrid() {
        let hexGrid = HexCellGrid(frame: CGRect(x: 0, y: 0, width: gridContainer.frame.width, height: gridContainer.frame.height))
        //gridContainer.addSubview(hexGrid.node!)
    }
    
    
//    /// Reads words from the dictionary file and inserts them into an array.  If
//    /// the word array already has words, do nothing.  This allows running all
//    /// tests without repeatedly filling the array with the same values.
//    func createWordArray() {
//        guard wordArray == nil else {
//            return
//        }
//        let resourcePath = Bundle.main.resourcePath! as NSString
//        let fileName = "dictionary.txt"
//        let filePath = resourcePath.appendingPathComponent(fileName)
//        
//        var data: String?
//        do {
//            data = try String(contentsOfFile: filePath, encoding: String.Encoding.utf8)
//        } catch let error as NSError {
//            assertionFailure("We have an error loading the dictionary : \(error)")
//        }
//
//        wordArray = data!.components(separatedBy: "\n")
//    }
//    
//    /// Inserts words into a trie.  If the trie is non-empty, don't do anything.
//    func insertWordsIntoTrie() {
//        guard let wordArray = wordArray, trie.count == 0 else { return }
//        for word in wordArray {
//            trie.insert(word: word)
//        }
//    }


}

