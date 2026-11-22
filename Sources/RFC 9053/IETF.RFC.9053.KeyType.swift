extension IETF.RFC.`9053` {

    /// A COSE key type, the value of a `kty` parameter (section 7, Table 17).
    public struct KeyType: RawRepresentable, Sendable, Hashable {

        public let rawValue: Int64

        public init(rawValue: Int64) {
            self.rawValue = rawValue
        }
    }
}

extension IETF.RFC.`9053`.KeyType {

    /// Octet key pair (section 7.2).
    public static let okp = Self(rawValue: 1)

    /// Elliptic curve key with x and y coordinates (section 7.1.1).
    public static let ec2 = Self(rawValue: 2)

    /// Symmetric key (section 7.3).
    public static let symmetric = Self(rawValue: 4)
}
