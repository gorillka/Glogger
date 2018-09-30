//
//  Created by Artem Orynko on 9/30/18.
//  Copyright © 2018 Gorilka Team. All rights reserved.
//

public protocol Loggerable {
    func log(level: LogLevel, message: String, tag: String, fileName: String, functionName: String, lineNumber: Int)
}
