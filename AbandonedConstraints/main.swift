//  main.swift
//  AbandonedConstraints
//  Created by Peter Foti on 2/20/16.
//  Copyright © 2016 Peter Foti. All rights reserved.

import Foundation

let path = NSURL(fileURLWithPath: Process.arguments[1])
let parser = NSXMLParser(contentsOfURL: path)
let parserDelegate = XMLParserDelegate(fileName: path.absoluteString)
parser?.delegate = parserDelegate
parser?.parse()
