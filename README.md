# swift-rfc-9053

Use this package for the identifiers and key types of COSE's initial algorithms (RFC 9053): which algorithm an `alg` names, which curve a `crv` names, and the public key an EC2 COSE key holds. WebAuthn hands over a credential's public key this way. Start from `IETF.RFC.`9053`.EC2.PublicKey(_:)` with an `IETF.RFC.`9052`.Key`.

## Laws

- The EC2 keys of RFC 9052 Appendix C.7.1, on P-256 and P-521, are read with their curves and coordinates.
- An EC2 public key needs `kty` 2, an integer `crv`, a byte string `x`, and `y` as a byte string or, for a compressed point, a boolean. For P-256, P-384 and P-521 each coordinate must have the curve's full length, leading zero bytes kept. A key that carries the private key `d` is refused.
- Whether the point lies on its curve is checked by the signature algorithm that uses it, not here.
- `key(algorithm:)` writes a public key back as a COSE key that reads back to the same public key.
- Algorithms, key types and curves are open sets of integers with the registry's values as constants, so an unknown value is kept, not refused. A text `alg` is private use and has no `IETF.RFC.`9053`.Algorithm`.
- The signing, MAC and encryption operations themselves are not here. ECDSA verification over P-256 is in swift-fips-186-5.
