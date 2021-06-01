//
//
//
//  Created by Oleh Hudeichuk on 02.06.2021.
//

import Foundation

/// Filters messages to only allow those which are from users with a certain language code.
///
/// Note: According to telegrams documentation, every single user does not have the language_code attribute.
public class LanguageFilter: TGFilter {

    var lang: String

    public init(lang: String) {
        self.lang = lang
        super.init()
    }

    public var name: String = "language"

    override
    public func filter(message: TGMessage) -> Bool {
        guard let languageCode = message.from?.languageCode else { return true }
        return languageCode.starts(with: lang)
    }
}

public extension TGFilter {
    static func language(_ lang: String) -> TGFilter {
        return LanguageFilter(lang: lang)
    }
}
