//  main.swift
//  AbandonedConstraints
//  Created by Peter Foti on 2/20/16.
//  Copyright © 2016 Peter Foti. All rights reserved.

import Foundation


func findAbandonedConstraints() {
    
    let userPath = Process.arguments[1]
    
    if NSFileManager.defaultManager().fileExistsAtPath(userPath) {
        let path = NSURL(fileURLWithPath: userPath)
        guard let parser = NSXMLParser(contentsOfURL: path) else { return }
        let parserDelegate = XMLParserDelegate(fileName: path.absoluteString)
        parser.delegate = parserDelegate
        parser.parse()
    } else {
        fputs("\(userPath) is invalid \n", __stderrp)
    }
}


findAbandonedConstraints()