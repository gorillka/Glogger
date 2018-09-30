//
//  Created by Artem Orynko on 9/30/18.
//  Copyright © 2018 Gorilka Team. All rights reserved.
//

import os.log

public enum LogLevel: Int {
    case verbose = 0
    case info = 1
    case debug = 2
    case warning = 3
    case error = 4
}

extension LogLevel {
    var osLogType: OSLogType {
        switch self {
        case .verbose: return .default
        case .info: return .info
        case .debug: return .debug
        case .warning: return .error
        case .error: return .fault
        }
    }
}

extension LogLevel: CustomStringConvertible {
    public var description: String { return "\(self)" }
}
