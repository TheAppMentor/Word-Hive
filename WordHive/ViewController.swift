//
//  ViewController.swift
//  WordHive
//
//  Created by Moorthy, Prashanth on 5/1/17.
//  Copyright © 2017 Moorthy, Prashanth. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var gridContainer: UIView!
    
    var wordArray: [String]?
    var trie = Trie()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        print("View will appear")
        buildGrid()
        let startTime = NSDate()
        createWordArray()
        print("Time to make word array = \(-startTime.timeIntervalSinceNow)")
        let startTime1 = NSDate()
        insertWordsIntoTrie()
        print("Time to Build Tree = \(-startTime1.timeIntervalSinceNow)")
        
        let startTime2 = NSDate()
        let wordList = trie.findWordsWithPrefix(prefix: "Hell")
        print("Word List is  : \(wordList) ")
        print("Time to Look up prefix = \(-startTime2.timeIntervalSinceNow)")
    }

    
    func buildGrid() {
        let hexGrid = HexCellGrid(frame: CGRect(x: 0, y: 0, width: gridContainer.frame.width, height: gridContainer.frame.height))
        gridContainer.addSubview(hexGrid)
    }
    
    
    /// Reads words from the dictionary file and inserts them into an array.  If
    /// the word array already has words, do nothing.  This allows running all
    /// tests without repeatedly filling the array with the same values.
    func createWordArray() {
        guard wordArray == nil else {
            return
        }
        let resourcePath = Bundle.main.resourcePath! as NSString
        let fileName = "dictionary.txt"
        let filePath = resourcePath.appendingPathComponent(fileName)
        
        var data: String?
        do {
            data = try String(contentsOfFile: filePath, encoding: String.Encoding.utf8)
        } catch let error as NSError {
            assertionFailure("We have an error loading the dictionary : \(error)")
        }

        wordArray = data!.components(separatedBy: "\n")
    }
    
    /// Inserts words into a trie.  If the trie is non-empty, don't do anything.
    func insertWordsIntoTrie() {
        guard let wordArray = wordArray, trie.count == 0 else { return }
        for word in wordArray {
            trie.insert(word: word)
        }
    }


}

