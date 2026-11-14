extension RFC_9053.EC2 {

    /// The public key of an EC2 COSE key: a curve and a point on it.
    ///
    /// Whether the point lies on the curve is not checked here; that belongs to the signature algorithm that uses
    /// the key.
    public struct PublicKey: Sendable, Hashable {

        /// `crv`.
        public let curve: RFC_9053.Curve

        /// `x`, with its leading zero bytes.
        public let x: [UInt8]

        /// `y`: the coordinate, or the sign of a compressed point.
        public let y: Y

        /// The second coordinate of a point, or only its sign when the point is compressed (section 7.1.1).
        public enum Y: Sendable, Hashable {
            /// The y coordinate, with its leading zero bytes.
            case coordinate([UInt8])
            /// The sign bit of y, as SEC 1 computes it for a compressed point.
            case sign(Bool)
        }

        public init(curve: RFC_9053.Curve, x: [UInt8], y: Y) {
            self.curve = curve
            self.x = x
            self.y = y
        }

        /// The public key a COSE key holds.
        ///
        /// Refused when `kty` is not EC2, `crv` is missing or not an integer, `x` or `y` is missing or of the wrong
        /// type, a coordinate of P-256, P-384 or P-521 does not have that curve's length, or the key carries `d`.
        public init(_ key: RFC_9052.Key) throws(RFC_9053.Error) {
            guard key.keyType.integer == RFC_9053.KeyType.ec2.rawValue else { throw .keyType(key.keyType) }
            guard let curve = key[Label.curve]?.integer.map(RFC_9053.Curve.init(rawValue:)) else { throw .curve }
            guard key[Label.d] == nil else { throw .privateKey }
            guard let x = key[Label.x]?.bytes, x.count == curve.coordinateLength ?? x.count else {
                throw .coordinate(Label.x)
            }
            let y: Y
            switch key[Label.y] {
            case .bytes(let coordinate)? where coordinate.count == curve.coordinateLength ?? coordinate.count:
                y = .coordinate(coordinate)
            case .bool(let sign)?:
                y = .sign(sign)
            default:
                throw .coordinate(Label.y)
            }
            self.init(curve: curve, x: x, y: y)
        }
    }
}

extension RFC_9053.EC2.PublicKey {

    /// The public key as a COSE key, with `alg` when one is given.
    public func key(algorithm: RFC_9053.Algorithm? = nil) -> RFC_9052.Key {
        var pairs: [RFC_8949.Pair] = [
            .init(key: RFC_9052.Key.Label.keyType, value: RFC_8949.Value(RFC_9053.KeyType.ec2.rawValue))
        ]
        if let algorithm {
            pairs.append(.init(key: RFC_9052.Key.Label.algorithm, value: algorithm.value))
        }
        pairs.append(.init(key: RFC_9053.EC2.Label.curve, value: RFC_8949.Value(curve.rawValue)))
        pairs.append(.init(key: RFC_9053.EC2.Label.x, value: .bytes(x)))
        switch y {
        case .coordinate(let coordinate): pairs.append(.init(key: RFC_9053.EC2.Label.y, value: .bytes(coordinate)))
        case .sign(let sign): pairs.append(.init(key: RFC_9053.EC2.Label.y, value: .bool(sign)))
        }
        do {
            return try RFC_9052.Key(.map(pairs))
        } catch {
            preconditionFailure("an EC2 public key always makes a valid COSE key: \(error)")
        }
    }
}
