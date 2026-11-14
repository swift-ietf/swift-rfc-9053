extension RFC_9053 {

    /// A COSE algorithm identifier, the value of an `alg` parameter, from the "COSE Algorithms" registry.
    public struct Algorithm: RawRepresentable, Sendable, Hashable {

        public let rawValue: Int64

        public init(rawValue: Int64) {
            self.rawValue = rawValue
        }
    }
}

extension RFC_9053.Algorithm {

    /// ECDSA with SHA-256 (section 2.1).
    public static let es256 = Self(rawValue: -7)

    /// ECDSA with SHA-384 (section 2.1).
    public static let es384 = Self(rawValue: -35)

    /// ECDSA with SHA-512 (section 2.1).
    public static let es512 = Self(rawValue: -36)

    /// EdDSA (section 2.2).
    public static let edDSA = Self(rawValue: -8)

    /// HMAC with SHA-256, truncated to 64 bits (section 3.1).
    public static let hmac256Truncated64 = Self(rawValue: 4)

    /// HMAC with SHA-256 (section 3.1).
    public static let hmac256 = Self(rawValue: 5)

    /// HMAC with SHA-384 (section 3.1).
    public static let hmac384 = Self(rawValue: 6)

    /// HMAC with SHA-512 (section 3.1).
    public static let hmac512 = Self(rawValue: 7)

    /// AES-GCM with a 128-bit key (section 4.1).
    public static let a128GCM = Self(rawValue: 1)

    /// AES-GCM with a 192-bit key (section 4.1).
    public static let a192GCM = Self(rawValue: 2)

    /// AES-GCM with a 256-bit key (section 4.1).
    public static let a256GCM = Self(rawValue: 3)

    /// ChaCha20/Poly1305 (section 4.3).
    public static let chaCha20Poly1305 = Self(rawValue: 24)

    /// Direct use of the content encryption key (section 6.1.1).
    public static let direct = Self(rawValue: -6)

    /// The algorithm a CBOR integer names, or `nil` for anything else (a text name is a private-use algorithm).
    public init?(_ value: RFC_8949.Value) {
        guard let integer = value.integer else { return nil }
        self.init(rawValue: integer)
    }

    /// The algorithm as a CBOR integer.
    public var value: RFC_8949.Value { RFC_8949.Value(rawValue) }
}
