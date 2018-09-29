
public protocol CategoryKey {
    var stringValue: String { get }
    init?(_ stringValue: String)
}

extension CategoryKey where Self: RawRepresentable, Self.RawValue == String {

    public var stringValue: String { return rawValue }

    public init?(_ stringValue: String) {
        guard let value = Self(rawValue: stringValue) else { return nil }
        self = value
    }
}
