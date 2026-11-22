extension IETF.RFC.`9053` {

    /// A COSE elliptic curve, the value of a `crv` parameter (section 7.1, Table 18).
    public struct Curve: RawRepresentable, Sendable, Hashable {

        public let rawValue: Int64

        public init(rawValue: Int64) {
            self.rawValue = rawValue
        }
    }
}

extension IETF.RFC.`9053`.Curve {

    /// NIST P-256, also known as secp256r1, for EC2 keys.
    public static let p256 = Self(rawValue: 1)

    /// NIST P-384, also known as secp384r1, for EC2 keys.
    public static let p384 = Self(rawValue: 2)

    /// NIST P-521, also known as secp521r1, for EC2 keys.
    public static let p521 = Self(rawValue: 3)

    /// X25519, for OKP keys used with ECDH only.
    public static let x25519 = Self(rawValue: 4)

    /// X448, for OKP keys used with ECDH only.
    public static let x448 = Self(rawValue: 5)

    /// Ed25519, for OKP keys used with EdDSA only.
    public static let ed25519 = Self(rawValue: 6)

    /// Ed448, for OKP keys used with EdDSA only.
    public static let ed448 = Self(rawValue: 7)

    /// The byte length of one coordinate of an EC2 point on this curve, or `nil` when it is not one of the EC2
    /// curves this RFC defines.
    public var coordinateLength: Int? {
        switch self {
        case .p256: 32
        case .p384: 48
        case .p521: 66
        default: nil
        }
    }
}
