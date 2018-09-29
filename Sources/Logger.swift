
public protocol Logger {
    func log(level: LogLevel, message: String, tag: String, fileName: String, functionName: String, lineNumber: Int)
}
