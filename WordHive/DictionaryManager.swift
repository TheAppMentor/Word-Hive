//
//  DictionaryManager.swift
//  WordHive
//
//  Created by Moorthy, Prashanth on 09/12/18.
//  Copyright © 2018 Moorthy, Prashanth. All rights reserved.
//

import Foundation
import Dispatch

class DictionaryManager {

    var isReady = false
    static let shared = DictionaryManager()

    private var wordArray: [String]?
    private var trie = Trie()
    
    private init() {
    }
    
    func loadDictionary(){
        self.wordArray = self.createWordArray()
        self.insertWordsIntoTrie()
        self.isReady = true

//        DispatchQueue.global(qos: .userInitiated).async {
//            self.wordArray = self.createWordArray()
//            self.insertWordsIntoTrie()
//            self.isReady = true
//        }
    
    }
        
    func findWordsWithPrefix(prefix: String) -> [String]{
        guard isReady else {assertionFailure();return []}
        return trie.findWordsWithPrefix(prefix: prefix)
    }
    
    func contains(word : String) -> Bool{
        return trie.contains(word: word)
    }

    /// Reads words from the dictionary file and inserts them into an array.  If
    /// the word array already has words, do nothing.  This allows running all
    /// tests without repeatedly filling the array with the same values.
    private func createWordArray() -> [String]?  {
        guard wordArray == nil else {
            return nil
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
        
        return data!.components(separatedBy: "\n")
    }
    
    /// Inserts words into a trie.  If the trie is non-empty, don't do anything.
    private func insertWordsIntoTrie() {
        guard let wordArray = wordArray, trie.count == 0 else { return }
        for word in wordArray {
            trie.insert(word: word)
        }
    }

    
}
