import RFC_9053

/// The COSE key sets of RFC 9052 Appendix C.7, transcribed from their diagnostic notation.
enum Appendix {

    /// Appendix C.7.1.
    static let publicKeys: RFC_8949.Value = .array([
        .map([
            .init(key: .negative(0), value: .unsigned(1)),
            .init(key: .negative(1), value: .bytes(hex("65eda5a12577c2bae829437fe338701a10aaa375e1bb5b5de108de439c08551d"))),
            .init(key: .negative(2), value: .bytes(hex("1e52ed75701163f7f9e40ddf9f341b3dc9ba860af7e0ca7ca7e9eecd0084d19c"))),
            .init(key: .unsigned(1), value: .unsigned(2)),
            .init(key: .unsigned(2), value: .bytes(hex("6d65726961646f632e6272616e64796275636b406275636b6c616e642e6578616d706c65"))),
        ]),
        .map([
            .init(key: .negative(0), value: .unsigned(1)),
            .init(key: .negative(1), value: .bytes(hex("bac5b11cad8f99f9c72b05cf4b9e26d244dc189f745228255a219a86d6a09eff"))),
            .init(key: .negative(2), value: .bytes(hex("20138bf82dc1b6d562be0fa54ab7804a3a64b6d72ccfed6b6fb6ed28bbfc117e"))),
            .init(key: .unsigned(1), value: .unsigned(2)),
            .init(key: .unsigned(2), value: .bytes(hex("3131"))),
        ]),
        .map([
            .init(key: .negative(0), value: .unsigned(3)),
            .init(key: .negative(1), value: .bytes(hex("0072992cb3ac08ecf3e5c63dedec0d51a8c1f79ef2f82f94f3c737bf5de7986671eac625fe8257bbd0394644caaa3aaf8f27a4585fbbcad0f2457620085e5c8f42ad"))),
            .init(key: .negative(2), value: .bytes(hex("01dca6947bce88bc5790485ac97427342bc35f887d86d65a089377e247e60baa55e4e8501e2ada5724ac51d6909008033ebc10ac999b9d7f5cc2519f3fe1ea1d9475"))),
            .init(key: .unsigned(1), value: .unsigned(2)),
            .init(key: .unsigned(2), value: .bytes(hex("62696c626f2e62616767696e7340686f626269746f6e2e6578616d706c65"))),
        ]),
        .map([
            .init(key: .negative(0), value: .unsigned(1)),
            .init(key: .negative(1), value: .bytes(hex("98f50a4ff6c05861c8860d13a638ea56c3f5ad7590bbfbf054e1c7b4d91d6280"))),
            .init(key: .negative(2), value: .bytes(hex("f01400b089867804b8e9fc96c3932161f1934f4223069170d924b7e03bf822bb"))),
            .init(key: .unsigned(1), value: .unsigned(2)),
            .init(key: .unsigned(2), value: .bytes(hex("706572656772696e2e746f6f6b407475636b626f726f7567682e6578616d706c65"))),
        ]),
    ])

    /// Appendix C.7.2.
    static let privateKeys: RFC_8949.Value = .array([
        .map([
            .init(key: .unsigned(1), value: .unsigned(2)),
            .init(key: .unsigned(2), value: .bytes(hex("6d65726961646f632e6272616e64796275636b406275636b6c616e642e6578616d706c65"))),
            .init(key: .negative(0), value: .unsigned(1)),
            .init(key: .negative(1), value: .bytes(hex("65eda5a12577c2bae829437fe338701a10aaa375e1bb5b5de108de439c08551d"))),
            .init(key: .negative(2), value: .bytes(hex("1e52ed75701163f7f9e40ddf9f341b3dc9ba860af7e0ca7ca7e9eecd0084d19c"))),
            .init(key: .negative(3), value: .bytes(hex("aff907c99f9ad3aae6c4cdf21122bce2bd68b5283e6907154ad911840fa208cf"))),
        ]),
        .map([
            .init(key: .unsigned(1), value: .unsigned(2)),
            .init(key: .unsigned(2), value: .bytes(hex("3131"))),
            .init(key: .negative(0), value: .unsigned(1)),
            .init(key: .negative(1), value: .bytes(hex("bac5b11cad8f99f9c72b05cf4b9e26d244dc189f745228255a219a86d6a09eff"))),
            .init(key: .negative(2), value: .bytes(hex("20138bf82dc1b6d562be0fa54ab7804a3a64b6d72ccfed6b6fb6ed28bbfc117e"))),
            .init(key: .negative(3), value: .bytes(hex("57c92077664146e876760c9520d054aa93c3afb04e306705db6090308507b4d3"))),
        ]),
        .map([
            .init(key: .unsigned(1), value: .unsigned(2)),
            .init(key: .unsigned(2), value: .bytes(hex("62696c626f2e62616767696e7340686f626269746f6e2e6578616d706c65"))),
            .init(key: .negative(0), value: .unsigned(3)),
            .init(key: .negative(1), value: .bytes(hex("0072992cb3ac08ecf3e5c63dedec0d51a8c1f79ef2f82f94f3c737bf5de7986671eac625fe8257bbd0394644caaa3aaf8f27a4585fbbcad0f2457620085e5c8f42ad"))),
            .init(key: .negative(2), value: .bytes(hex("01dca6947bce88bc5790485ac97427342bc35f887d86d65a089377e247e60baa55e4e8501e2ada5724ac51d6909008033ebc10ac999b9d7f5cc2519f3fe1ea1d9475"))),
            .init(key: .negative(3), value: .bytes(hex("00085138ddabf5ca975f5860f91a08e91d6d5f9a76ad4018766a476680b55cd339e8ab6c72b5facdb2a2a50ac25bd086647dd3e2e6e99e84ca2c3609fdf177feb26d"))),
        ]),
        .map([
            .init(key: .unsigned(1), value: .unsigned(4)),
            .init(key: .unsigned(2), value: .bytes(hex("6f75722d736563726574"))),
            .init(key: .negative(0), value: .bytes(hex("849b57219dae48de646d07dbb533566e976686457c1491be3a76dcea6c427188"))),
        ]),
        .map([
            .init(key: .unsigned(1), value: .unsigned(2)),
            .init(key: .negative(0), value: .unsigned(1)),
            .init(key: .unsigned(2), value: .bytes(hex("706572656772696e2e746f6f6b407475636b626f726f7567682e6578616d706c65"))),
            .init(key: .negative(1), value: .bytes(hex("98f50a4ff6c05861c8860d13a638ea56c3f5ad7590bbfbf054e1c7b4d91d6280"))),
            .init(key: .negative(2), value: .bytes(hex("f01400b089867804b8e9fc96c3932161f1934f4223069170d924b7e03bf822bb"))),
            .init(key: .negative(3), value: .bytes(hex("02d1f7e6f26c43d4868d87ceb2353161740aacf1f7163647984b522a848df1c3"))),
        ]),
        .map([
            .init(key: .unsigned(1), value: .unsigned(4)),
            .init(key: .unsigned(2), value: .bytes(hex("6f75722d73656372657432"))),
            .init(key: .negative(0), value: .bytes(hex("849b5786457c1491be3a76dcea6c4271"))),
        ]),
        .map([
            .init(key: .unsigned(1), value: .unsigned(4)),
            .init(key: .unsigned(2), value: .bytes(hex("30313863306165352d346439622d343731622d626664362d656566333134626337303337"))),
            .init(key: .negative(0), value: .bytes(hex("849b57219dae48de646d07dbb533566e976686457c1491be3a76dcea6c427188"))),
        ]),
    ])

}
