extension RFC_9053 {

    /// Keys of key type EC2: an elliptic curve point with its x coordinate and either its y coordinate or the sign
    /// of y (section 7.1.1).
    public enum EC2 {}
}

extension RFC_9053.EC2 {

    /// The labels of the EC2 key parameters (Table 19).
    public enum Label {
        /// `crv`.
        public static let curve: RFC_8949.Value = -1
        /// `x`.
        public static let x: RFC_8949.Value = -2
        /// `y`, or the sign bit of y.
        public static let y: RFC_8949.Value = -3
        /// `d`: the private key.
        public static let d: RFC_8949.Value = -4
    }
}
