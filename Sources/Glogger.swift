
import Foundation
import os.log

public struct Glogger<T: CategoryKey> {
    public typealias Key = T

    private let loggers: [Logger]
    private var disableSymbols: Set<String> = []

    public init(keyedBy type: Key.Type, loggers: [Logger] = []) {
        self.loggers = loggers
    }

    public mutating func ignore(classes: [AnyObject]) {
        classes.forEach { disableSymbols.insert("\(type(of: $0))") }
    }

    public mutating func ignore(categories: [Key]) {
        categories.forEach { disableSymbols.insert($0.stringValue) }
    }

    public func verbose(message: String, category: T, access: AccessLevel = .private, fileName: String = #file, functionName: String = #function, lineNumber: Int = #line) {
        log(level: .verbose, access: access, message: message, category: category, fileName: fileName, functionName: functionName, lineNumber: lineNumber)
    }

    public func info(message: String, category: T, access: AccessLevel = .private, fileName: String = #file, functionName: String = #function, lineNumber: Int = #line) {
        log(level: .info, access: access, message: message, category: category, fileName: fileName, functionName: functionName, lineNumber: lineNumber)
    }

    public func debug(message: String, category: T, access: AccessLevel = .private, fileName: String = #file, functionName: String = #function, lineNumber: Int = #line) {
        log(level: .debug, access: access, message: message, category: category, fileName: fileName, functionName: functionName, lineNumber: lineNumber)
    }

    public func warning(message: String, category: T, access: AccessLevel = .private, fileName: String = #file, functionName: String = #function, lineNumber: Int = #line) {
        log(level: .warning, access: access, message: message, category: category, fileName: fileName, functionName: functionName, lineNumber: lineNumber)
    }

    public func error(message: String, category: T, access: AccessLevel = .private, fileName: String = #file, functionName: String = #function, lineNumber: Int = #line) {
        log(level: .error, access: access, message: message, category: category, fileName: fileName, functionName: functionName, lineNumber: lineNumber)
    }
}

extension Glogger {

    private func log(level: LogLevel, access: AccessLevel, message: String, category: Key, fileName: String, functionName: String, lineNumber: Int) {

        let file = (fileName as NSString).lastPathComponent
        let className = (file as NSString).deletingPathExtension

        guard logAllowed(category, className: className) else { return }

        let osLog = self.osLog(category)
        let line = "\(lineNumber)"

        switch access {
        case .private:
            os_log("[%{private}@] [%{private}@:%{private}@ %{private}@] %{private}@ > %{private}@", log: osLog, type: level.osLogType, currentThread, file, line, functionName, level.description.uppercased(), message)
        case .public:
            os_log("[%{public}@] [%{public}@:%{public}@ %{public}@] %{public}@ > %{public}@", log: osLog, type: level.osLogType, currentThread, file, line, functionName, level.description.uppercased(), message)

            notifyLoggers(level: level, message: message, category: category.stringValue, fileName: fileName, functionName: functionName, lineNumber: lineNumber)
        }
    }
}

extension Glogger {

    private var currentThread: String {
        guard !Thread.isMainThread else { return "main" }
        if let threadName = Thread.current.name, !threadName.isEmpty {
            return threadName
        }
        if let queueName = String(validatingUTF8: __dispatch_queue_get_label(nil)), !queueName.isEmpty {
            return queueName
        }

        return "\(Thread.current)"
    }

    private func osLog(_ category: Key) -> OSLog {
        return OSLog(subsystem: Bundle.main.bundleIdentifier ?? "-", category: category.stringValue)
    }

    private func logAllowed(_ category: Key, className: String) -> Bool {
        return !disableSymbols.contains(category.stringValue) && !disableSymbols.contains(className)
    }
}

extension Glogger {

    private func notifyLoggers(level: LogLevel, message: String, category tag: String, fileName: String, functionName: String, lineNumber: Int) {
        loggers.forEach { $0.log(level: level, message: message, tag: tag, fileName: fileName, functionName: functionName, lineNumber: lineNumber)}
    }
}
