
import os.log

public enum LogLevel: Int {
    case verbose = 0, info, debug, warning, error

    internal var osLogType: OSLogType {
        switch self {
        case .verbose: return .default
        case .info: return .info
        case .debug: return .debug
        case .warning: return .error
        case .error: return .fault
        }
    }

    internal var description: String {
        return "\(self)"
    }
}
