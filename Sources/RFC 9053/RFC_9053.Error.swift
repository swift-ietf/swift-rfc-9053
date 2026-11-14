extension RFC_9053 {

    /// Why a COSE key is not a key of the kind asked for.
    public enum Error: Swift.Error, Sendable, Equatable {

        /// The key's `kty` is not the one asked for.
        case keyType(RFC_8949.Value)

        /// The key has no `crv`, or one that is not an integer.
        case curve

        /// A coordinate is missing, is not a byte string, or is not the curve's coordinate length (section 7.1.1).
        case coordinate(RFC_8949.Value)

        /// The key holds the private key `d`, where a public key was asked for.
        case privateKey
    }
}
