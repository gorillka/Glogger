//
//  Created by Artem Orynko on 9/30/18.
//  Copyright © 2018 Mantu. All rights reserved.
//

extension Glogger {
    public func verbose(message: String,
                        category: T,
                        access: AccessLevel = .private,
                        fileName: String = #file,
                        functionName: String = #function,
                        lineNumber: Int = #line) {
        log(level: .verbose,
            access: access,
            message: message,
            category: category,
            fileName: fileName,
            functionName: functionName,
            lineNumber: lineNumber)
    }

    public func info(message: String,
                     category: T,
                     access: AccessLevel = .private,
                     fileName: String = #file,
                     functionName: String = #function,
                     lineNumber: Int = #line) {
        log(level: .info,
            access: access,
            message: message,
            category: category,
            fileName: fileName,
            functionName: functionName,
            lineNumber: lineNumber)
    }

    public func debug(message: String,
                      category: T,
                      access: AccessLevel = .private,
                      fileName: String = #file,
                      functionName: String = #function,
                      lineNumber: Int = #line) {
        log(level: .debug,
            access: access,
            message: message,
            category: category,
            fileName: fileName,
            functionName: functionName,
            lineNumber: lineNumber)
    }

    public func warning(message: String,
                        category: T,
                        access: AccessLevel = .private,
                        fileName: String = #file,
                        functionName: String = #function,
                        lineNumber: Int = #line) {
        log(level: .warning,
            access: access,
            message: message,
            category: category,
            fileName: fileName,
            functionName: functionName,
            lineNumber: lineNumber)
    }

    public func error(message: String,
                      category: T,
                      access: AccessLevel = .private,
                      fileName: String = #file,
                      functionName: String = #function,
                      lineNumber: Int = #line) {
        log(level: .error,
            access: access,
            message: message,
            category: category,
            fileName: fileName,
            functionName: functionName,
            lineNumber: lineNumber)
    }
}
