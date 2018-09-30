//
//  Created by Artem Orynko on 9/30/18.
//  Copyright © 2018 Gorilka Team. All rights reserved.
//

public protocol CategoryKey: RawRepresentable {
    var stringValue: String { get }
}

extension CategoryKey where Self.RawValue == String {
    public var stringValue: String { return rawValue }
}

extension CategoryKey where Self.RawValue == String {
    init?(_ stringValue: String) {
        guard let value = Self(rawValue: stringValue) else { return nil }
        self = value
    }
}
