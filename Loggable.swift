//
//  Loggable.swift
//
//  Created by Prashan Samarathunge on 2023-03-01.
//

import Foundation

protocol Loggable{
    static var LOGS_ENABLED:Bool {get}
    static var LOG_CLASS_NAME:String {get}
    static func LOG(_ items: Any..., separator: String, terminator: String)
}

extension Loggable {
    static var LOGS_ENABLED:Bool { return false }
    static var LOG_CLASS_NAME:String { return String(describing: self) + ": " }
    
    
    /// Used for Logging
    /// - Parameters:
    ///   - items: Items
    ///   - separator: Seperator Between Items
    ///   - terminator: Line Break
    static func LOG(_ items: Any..., separator: String = " ", terminator: String = "\n"){
        guard Self.LOGS_ENABLED else {return}
#if DEBUG
        Swift.print(Self.LOG_CLASS_NAME, separator: "", terminator: "")
        for (i, v) in items.enumerated(){
            Swift.print(v, separator: "", terminator: "")
            if i < items.count - 1{
                Swift.print(separator, separator: "", terminator: "")
            }
        }
        Swift.print(terminator, separator: "", terminator: "")
#endif
    }
}



