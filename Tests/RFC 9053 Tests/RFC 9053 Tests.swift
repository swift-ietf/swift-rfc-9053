import RFC_9053
import Testing

@Suite
struct `RFC 9053 Tests` {

    @Test
    func `the Appendix C.7.1 EC2 public keys are read with their curves`() throws {
        let keys = try IETF.RFC.`9052`.KeySet(Appendix.publicKeys).keys.map(IETF.RFC.`9053`.EC2.PublicKey.init)
        #expect(keys.map(\.curve) == [.p256, .p256, .p521, .p256])
        #expect(keys[0].x == hex("65eda5a12577c2bae829437fe338701a10aaa375e1bb5b5de108de439c08551d"))
        #expect(keys[0].y == .coordinate(hex("1e52ed75701163f7f9e40ddf9f341b3dc9ba860af7e0ca7ca7e9eecd0084d19c")))
        #expect(keys[2].x.count == 66)
        #expect(keys[2].x.first == 0x00)
    }

    @Test
    func `the Appendix C.7.2 private keys are not public keys`() throws {
        let keys = try IETF.RFC.`9052`.KeySet(Appendix.privateKeys).keys
        #expect(throws: IETF.RFC.`9053`.Error.privateKey) { try IETF.RFC.`9053`.EC2.PublicKey(keys[0]) }
        #expect(throws: IETF.RFC.`9053`.Error.keyType(4)) { try IETF.RFC.`9053`.EC2.PublicKey(keys[3]) }
    }

    @Test
    func `a public key writes back to the COSE key it was read from`() throws {
        let key = try IETF.RFC.`9052`.KeySet(Appendix.publicKeys).keys[1]
        let publicKey = try IETF.RFC.`9053`.EC2.PublicKey(key)
        #expect(try IETF.RFC.`9053`.EC2.PublicKey(publicKey.key()) == publicKey)
        let withAlgorithm = publicKey.key(algorithm: .es256)
        #expect(withAlgorithm.algorithm == -7)
        var expected: [UInt8] = [0xa5, 0x01, 0x02, 0x03, 0x26, 0x20, 0x01, 0x21, 0x58, 0x20]
        expected += publicKey.x
        expected += [0x22, 0x58, 0x20]
        expected += hex("20138bf82dc1b6d562be0fa54ab7804a3a64b6d72ccfed6b6fb6ed28bbfc117e")
        #expect(IETF.RFC.`8949`.encode(withAlgorithm.value) == expected)
    }

    @Test
    func `a compressed point keeps the sign of y`() throws {
        let x = [UInt8](repeating: 7, count: 32)
        let key = try IETF.RFC.`9053`.EC2.PublicKey(IETF.RFC.`9052`.Key([1: 2, -1: 1, -2: .bytes(x), -3: true]))
        #expect(key.y == .sign(true))
    }

    @Test
    func `EC2 keys with a missing or malformed curve or coordinate are refused`() {
        let x = IETF.RFC.`8949`.Value.bytes([UInt8](repeating: 1, count: 32))
        let y = IETF.RFC.`8949`.Value.bytes([UInt8](repeating: 2, count: 32))
        #expect(throws: IETF.RFC.`9053`.Error.keyType(1)) { try IETF.RFC.`9053`.EC2.PublicKey(IETF.RFC.`9052`.Key([1: 1, -1: 6, -2: x])) }
        #expect(throws: IETF.RFC.`9053`.Error.curve) { try IETF.RFC.`9053`.EC2.PublicKey(IETF.RFC.`9052`.Key([1: 2, -2: x, -3: y])) }
        #expect(throws: IETF.RFC.`9053`.Error.curve) {
            try IETF.RFC.`9053`.EC2.PublicKey(IETF.RFC.`9052`.Key([1: 2, -1: "P-256", -2: x, -3: y]))
        }
        #expect(throws: IETF.RFC.`9053`.Error.coordinate(-2)) {
            try IETF.RFC.`9053`.EC2.PublicKey(IETF.RFC.`9052`.Key([1: 2, -1: 1, -2: .bytes([1]), -3: y]))
        }
        #expect(throws: IETF.RFC.`9053`.Error.coordinate(-3)) {
            try IETF.RFC.`9053`.EC2.PublicKey(IETF.RFC.`9052`.Key([1: 2, -1: 1, -2: x]))
        }
        #expect(throws: IETF.RFC.`9053`.Error.coordinate(-3)) {
            try IETF.RFC.`9053`.EC2.PublicKey(IETF.RFC.`9052`.Key([1: 2, -1: 2, -2: .bytes([UInt8](repeating: 1, count: 48)), -3: y]))
        }
    }

    @Test
    func `a curve this RFC does not define takes coordinates of any length`() throws {
        let key = try IETF.RFC.`9053`.EC2.PublicKey(IETF.RFC.`9052`.Key([1: 2, -1: 256, -2: .bytes([1, 2]), -3: .bytes([3])]))
        #expect(key.curve.coordinateLength == nil)
    }

    @Test
    func `algorithm identifiers are those of the registry`() {
        #expect(IETF.RFC.`9053`.Algorithm.es256.rawValue == -7)
        #expect(IETF.RFC.`9053`.Algorithm.es384.rawValue == -35)
        #expect(IETF.RFC.`9053`.Algorithm.es512.rawValue == -36)
        #expect(IETF.RFC.`9053`.Algorithm.edDSA.rawValue == -8)
        #expect(IETF.RFC.`9053`.Algorithm(IETF.RFC.`8949`.Value(-7)) == .es256)
        #expect(IETF.RFC.`9053`.Algorithm("ES256") == nil)
    }
}
