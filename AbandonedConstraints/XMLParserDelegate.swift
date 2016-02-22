//  ParserDelegate.swift
//  AbandonedConstraints
//  Created by Peter Foti on 2/21/16.
//  Copyright © 2016 Peter Foti. All rights reserved.

import Foundation

enum XMLElementName: String {
    case Constraint = "constraint"
    case Exclude = "exclude"
    case Outlet = "outlet"
}

final class XMLParserDelegate: NSObject, NSXMLParserDelegate {
    
    var constraints: Set<String> = []
    var excludedReferences: Set<String> = []
    var outlets: Set<String> = []
    var fileName: String = ""
    
    init(fileName: String) {
        self.fileName = fileName
    }
    
    func parser(parser: NSXMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String]) {
        
        if let xmlElement = XMLElementName(rawValue: elementName) {
            switch xmlElement {
            case .Constraint:
                constraints.insert(attributeDict["id"]!)
            case .Exclude:
                excludedReferences.insert(attributeDict["reference"]!)
            case .Outlet:
                outlets.insert(attributeDict["destination"]!)
            }
        }
    }
    
    func parserDidEndDocument(parser: NSXMLParser) {
        
        let excludedConstraintsLessOutlets = constraints.intersect(excludedReferences).subtract(outlets)
        
        if excludedConstraintsLessOutlets.count > 0 {
            print(excludedConstraintsLessOutlets.joinWithSeparator(","))
        }
    }
}
