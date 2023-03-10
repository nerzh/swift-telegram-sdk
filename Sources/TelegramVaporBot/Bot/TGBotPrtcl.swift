// Telegram-vapor-bot - Telegram Bot Swift SDK.

import Vapor

public protocol TGBotPrtcl {

    var app: Vapor.Application { get }
    var botId: String { get }
    var tgURI: URI { get }
    var tgClient: TGClientPrtcl { get }

    static var log: Logger { get }

    @discardableResult
    func getUpdates(params: TGGetUpdatesParams?) throws -> EventLoopFuture<[TGUpdate]>

    @discardableResult
    func getUpdates(params: TGGetUpdatesParams?) async throws -> [TGUpdate]

    @discardableResult
    func setWebhook(params: TGSetWebhookParams) throws -> EventLoopFuture<Bool>

    @discardableResult
    func setWebhook(params: TGSetWebhookParams) async throws -> Bool

    @discardableResult
    func deleteWebhook(params: TGDeleteWebhookParams?) throws -> EventLoopFuture<Bool>

    @discardableResult
    func deleteWebhook(params: TGDeleteWebhookParams?) async throws -> Bool

    @discardableResult
    func getWebhookInfo() throws -> EventLoopFuture<TGWebhookInfo>

    @discardableResult
    func getWebhookInfo() async throws -> TGWebhookInfo

    @discardableResult
    func getMe() throws -> EventLoopFuture<TGUser>

    @discardableResult
    func getMe() async throws -> TGUser

    @discardableResult
    func logOut() throws -> EventLoopFuture<Bool>

    @discardableResult
    func logOut() async throws -> Bool

    @discardableResult
    func close() throws -> EventLoopFuture<Bool>

    @discardableResult
    func close() async throws -> Bool

    @discardableResult
    func sendMessage(params: TGSendMessageParams) throws -> EventLoopFuture<TGMessage>

    @discardableResult
    func sendMessage(params: TGSendMessageParams) async throws -> TGMessage

    @discardableResult
    func forwardMessage(params: TGForwardMessageParams) throws -> EventLoopFuture<TGMessage>

    @discardableResult
    func forwardMessage(params: TGForwardMessageParams) async throws -> TGMessage

    @discardableResult
    func copyMessage(params: TGCopyMessageParams) throws -> EventLoopFuture<TGMessageId>

    @discardableResult
    func copyMessage(params: TGCopyMessageParams) async throws -> TGMessageId

    @discardableResult
    func sendPhoto(params: TGSendPhotoParams) throws -> EventLoopFuture<TGMessage>

    @discardableResult
    func sendPhoto(params: TGSendPhotoParams) async throws -> TGMessage

    @discardableResult
    func sendAudio(params: TGSendAudioParams) throws -> EventLoopFuture<TGMessage>

    @discardableResult
    func sendAudio(params: TGSendAudioParams) async throws -> TGMessage

    @discardableResult
    func sendDocument(params: TGSendDocumentParams) throws -> EventLoopFuture<TGMessage>

    @discardableResult
    func sendDocument(params: TGSendDocumentParams) async throws -> TGMessage

    @discardableResult
    func sendVideo(params: TGSendVideoParams) throws -> EventLoopFuture<TGMessage>

    @discardableResult
    func sendVideo(params: TGSendVideoParams) async throws -> TGMessage

    @discardableResult
    func sendAnimation(params: TGSendAnimationParams) throws -> EventLoopFuture<TGMessage>

    @discardableResult
    func sendAnimation(params: TGSendAnimationParams) async throws -> TGMessage

    @discardableResult
    func sendVoice(params: TGSendVoiceParams) throws -> EventLoopFuture<TGMessage>

    @discardableResult
    func sendVoice(params: TGSendVoiceParams) async throws -> TGMessage

    @discardableResult
    func sendVideoNote(params: TGSendVideoNoteParams) throws -> EventLoopFuture<TGMessage>

    @discardableResult
    func sendVideoNote(params: TGSendVideoNoteParams) async throws -> TGMessage

    @discardableResult
    func sendMediaGroup(params: TGSendMediaGroupParams) throws -> EventLoopFuture<[TGMessage]>

    @discardableResult
    func sendMediaGroup(params: TGSendMediaGroupParams) async throws -> [TGMessage]

    @discardableResult
    func sendLocation(params: TGSendLocationParams) throws -> EventLoopFuture<TGMessage>

    @discardableResult
    func sendLocation(params: TGSendLocationParams) async throws -> TGMessage

    @discardableResult
    func sendVenue(params: TGSendVenueParams) throws -> EventLoopFuture<TGMessage>

    @discardableResult
    func sendVenue(params: TGSendVenueParams) async throws -> TGMessage

    @discardableResult
    func sendContact(params: TGSendContactParams) throws -> EventLoopFuture<TGMessage>

    @discardableResult
    func sendContact(params: TGSendContactParams) async throws -> TGMessage

    @discardableResult
    func sendPoll(params: TGSendPollParams) throws -> EventLoopFuture<TGMessage>

    @discardableResult
    func sendPoll(params: TGSendPollParams) async throws -> TGMessage

    @discardableResult
    func sendDice(params: TGSendDiceParams) throws -> EventLoopFuture<TGMessage>

    @discardableResult
    func sendDice(params: TGSendDiceParams) async throws -> TGMessage

    @discardableResult
    func sendChatAction(params: TGSendChatActionParams) throws -> EventLoopFuture<Bool>

    @discardableResult
    func sendChatAction(params: TGSendChatActionParams) async throws -> Bool

    @discardableResult
    func getUserProfilePhotos(params: TGGetUserProfilePhotosParams) throws -> EventLoopFuture<TGUserProfilePhotos>

    @discardableResult
    func getUserProfilePhotos(params: TGGetUserProfilePhotosParams) async throws -> TGUserProfilePhotos

    @discardableResult
    func getFile(params: TGGetFileParams) throws -> EventLoopFuture<TGFile>

    @discardableResult
    func getFile(params: TGGetFileParams) async throws -> TGFile

    @discardableResult
    func banChatMember(params: TGBanChatMemberParams) throws -> EventLoopFuture<Bool>

    @discardableResult
    func banChatMember(params: TGBanChatMemberParams) async throws -> Bool

    @discardableResult
    func unbanChatMember(params: TGUnbanChatMemberParams) throws -> EventLoopFuture<Bool>

    @discardableResult
    func unbanChatMember(params: TGUnbanChatMemberParams) async throws -> Bool

    @discardableResult
    func restrictChatMember(params: TGRestrictChatMemberParams) throws -> EventLoopFuture<Bool>

    @discardableResult
    func restrictChatMember(params: TGRestrictChatMemberParams) async throws -> Bool

    @discardableResult
    func promoteChatMember(params: TGPromoteChatMemberParams) throws -> EventLoopFuture<Bool>

    @discardableResult
    func promoteChatMember(params: TGPromoteChatMemberParams) async throws -> Bool

    @discardableResult
    func setChatAdministratorCustomTitle(params: TGSetChatAdministratorCustomTitleParams) throws -> EventLoopFuture<Bool>

    @discardableResult
    func setChatAdministratorCustomTitle(params: TGSetChatAdministratorCustomTitleParams) async throws -> Bool

    @discardableResult
    func banChatSenderChat(params: TGBanChatSenderChatParams) throws -> EventLoopFuture<Bool>

    @discardableResult
    func banChatSenderChat(params: TGBanChatSenderChatParams) async throws -> Bool

    @discardableResult
    func unbanChatSenderChat(params: TGUnbanChatSenderChatParams) throws -> EventLoopFuture<Bool>

    @discardableResult
    func unbanChatSenderChat(params: TGUnbanChatSenderChatParams) async throws -> Bool

    @discardableResult
    func setChatPermissions(params: TGSetChatPermissionsParams) throws -> EventLoopFuture<Bool>

    @discardableResult
    func setChatPermissions(params: TGSetChatPermissionsParams) async throws -> Bool

    @discardableResult
    func exportChatInviteLink(params: TGExportChatInviteLinkParams) throws -> EventLoopFuture<String>

    @discardableResult
    func exportChatInviteLink(params: TGExportChatInviteLinkParams) async throws -> String

    @discardableResult
    func createChatInviteLink(params: TGCreateChatInviteLinkParams) throws -> EventLoopFuture<Bool>

    @discardableResult
    func createChatInviteLink(params: TGCreateChatInviteLinkParams) async throws -> Bool

    @discardableResult
    func editChatInviteLink(params: TGEditChatInviteLinkParams) throws -> EventLoopFuture<Bool>

    @discardableResult
    func editChatInviteLink(params: TGEditChatInviteLinkParams) async throws -> Bool

    @discardableResult
    func revokeChatInviteLink(params: TGRevokeChatInviteLinkParams) throws -> EventLoopFuture<Bool>

    @discardableResult
    func revokeChatInviteLink(params: TGRevokeChatInviteLinkParams) async throws -> Bool

    @discardableResult
    func approveChatJoinRequest(params: TGApproveChatJoinRequestParams) throws -> EventLoopFuture<Bool>

    @discardableResult
    func approveChatJoinRequest(params: TGApproveChatJoinRequestParams) async throws -> Bool

    @discardableResult
    func declineChatJoinRequest(params: TGDeclineChatJoinRequestParams) throws -> EventLoopFuture<Bool>

    @discardableResult
    func declineChatJoinRequest(params: TGDeclineChatJoinRequestParams) async throws -> Bool

    @discardableResult
    func setChatPhoto(params: TGSetChatPhotoParams) throws -> EventLoopFuture<Bool>

    @discardableResult
    func setChatPhoto(params: TGSetChatPhotoParams) async throws -> Bool

    @discardableResult
    func deleteChatPhoto(params: TGDeleteChatPhotoParams) throws -> EventLoopFuture<Bool>

    @discardableResult
    func deleteChatPhoto(params: TGDeleteChatPhotoParams) async throws -> Bool

    @discardableResult
    func setChatTitle(params: TGSetChatTitleParams) throws -> EventLoopFuture<Bool>

    @discardableResult
    func setChatTitle(params: TGSetChatTitleParams) async throws -> Bool

    @discardableResult
    func setChatDescription(params: TGSetChatDescriptionParams) throws -> EventLoopFuture<Bool>

    @discardableResult
    func setChatDescription(params: TGSetChatDescriptionParams) async throws -> Bool

    @discardableResult
    func pinChatMessage(params: TGPinChatMessageParams) throws -> EventLoopFuture<Bool>

    @discardableResult
    func pinChatMessage(params: TGPinChatMessageParams) async throws -> Bool

    @discardableResult
    func unpinChatMessage(params: TGUnpinChatMessageParams) throws -> EventLoopFuture<Bool>

    @discardableResult
    func unpinChatMessage(params: TGUnpinChatMessageParams) async throws -> Bool

    @discardableResult
    func unpinAllChatMessages(params: TGUnpinAllChatMessagesParams) throws -> EventLoopFuture<Bool>

    @discardableResult
    func unpinAllChatMessages(params: TGUnpinAllChatMessagesParams) async throws -> Bool

    @discardableResult
    func leaveChat(params: TGLeaveChatParams) throws -> EventLoopFuture<Bool>

    @discardableResult
    func leaveChat(params: TGLeaveChatParams) async throws -> Bool

    @discardableResult
    func getChat(params: TGGetChatParams) throws -> EventLoopFuture<TGChat>

    @discardableResult
    func getChat(params: TGGetChatParams) async throws -> TGChat

    @discardableResult
    func getChatAdministrators(params: TGGetChatAdministratorsParams) throws -> EventLoopFuture<[TGChatMember]>

    @discardableResult
    func getChatAdministrators(params: TGGetChatAdministratorsParams) async throws -> [TGChatMember]

    @discardableResult
    func getChatMemberCount(params: TGGetChatMemberCountParams) throws -> EventLoopFuture<Int>

    @discardableResult
    func getChatMemberCount(params: TGGetChatMemberCountParams) async throws -> Int

    @discardableResult
    func getChatMember(params: TGGetChatMemberParams) throws -> EventLoopFuture<TGChatMember>

    @discardableResult
    func getChatMember(params: TGGetChatMemberParams) async throws -> TGChatMember

    @discardableResult
    func setChatStickerSet(params: TGSetChatStickerSetParams) throws -> EventLoopFuture<Bool>

    @discardableResult
    func setChatStickerSet(params: TGSetChatStickerSetParams) async throws -> Bool

    @discardableResult
    func deleteChatStickerSet(params: TGDeleteChatStickerSetParams) throws -> EventLoopFuture<Bool>

    @discardableResult
    func deleteChatStickerSet(params: TGDeleteChatStickerSetParams) async throws -> Bool

    @discardableResult
    func getForumTopicIconStickers() throws -> EventLoopFuture<[TGSticker]>

    @discardableResult
    func getForumTopicIconStickers() async throws -> [TGSticker]

    @discardableResult
    func createForumTopic(params: TGCreateForumTopicParams) throws -> EventLoopFuture<Bool>

    @discardableResult
    func createForumTopic(params: TGCreateForumTopicParams) async throws -> Bool

    @discardableResult
    func editForumTopic(params: TGEditForumTopicParams) throws -> EventLoopFuture<Bool>

    @discardableResult
    func editForumTopic(params: TGEditForumTopicParams) async throws -> Bool

    @discardableResult
    func closeForumTopic(params: TGCloseForumTopicParams) throws -> EventLoopFuture<Bool>

    @discardableResult
    func closeForumTopic(params: TGCloseForumTopicParams) async throws -> Bool

    @discardableResult
    func reopenForumTopic(params: TGReopenForumTopicParams) throws -> EventLoopFuture<Bool>

    @discardableResult
    func reopenForumTopic(params: TGReopenForumTopicParams) async throws -> Bool

    @discardableResult
    func deleteForumTopic(params: TGDeleteForumTopicParams) throws -> EventLoopFuture<Bool>

    @discardableResult
    func deleteForumTopic(params: TGDeleteForumTopicParams) async throws -> Bool

    @discardableResult
    func unpinAllForumTopicMessages(params: TGUnpinAllForumTopicMessagesParams) throws -> EventLoopFuture<Bool>

    @discardableResult
    func unpinAllForumTopicMessages(params: TGUnpinAllForumTopicMessagesParams) async throws -> Bool

    @discardableResult
    func editGeneralForumTopic(params: TGEditGeneralForumTopicParams) throws -> EventLoopFuture<Bool>

    @discardableResult
    func editGeneralForumTopic(params: TGEditGeneralForumTopicParams) async throws -> Bool

    @discardableResult
    func closeGeneralForumTopic(params: TGCloseGeneralForumTopicParams) throws -> EventLoopFuture<Bool>

    @discardableResult
    func closeGeneralForumTopic(params: TGCloseGeneralForumTopicParams) async throws -> Bool

    @discardableResult
    func reopenGeneralForumTopic(params: TGReopenGeneralForumTopicParams) throws -> EventLoopFuture<Bool>

    @discardableResult
    func reopenGeneralForumTopic(params: TGReopenGeneralForumTopicParams) async throws -> Bool

    @discardableResult
    func hideGeneralForumTopic(params: TGHideGeneralForumTopicParams) throws -> EventLoopFuture<Bool>

    @discardableResult
    func hideGeneralForumTopic(params: TGHideGeneralForumTopicParams) async throws -> Bool

    @discardableResult
    func unhideGeneralForumTopic(params: TGUnhideGeneralForumTopicParams) throws -> EventLoopFuture<Bool>

    @discardableResult
    func unhideGeneralForumTopic(params: TGUnhideGeneralForumTopicParams) async throws -> Bool

    @discardableResult
    func answerCallbackQuery(params: TGAnswerCallbackQueryParams) throws -> EventLoopFuture<Bool>

    @discardableResult
    func answerCallbackQuery(params: TGAnswerCallbackQueryParams) async throws -> Bool

    @discardableResult
    func setMyCommands(params: TGSetMyCommandsParams) throws -> EventLoopFuture<Bool>

    @discardableResult
    func setMyCommands(params: TGSetMyCommandsParams) async throws -> Bool

    @discardableResult
    func deleteMyCommands(params: TGDeleteMyCommandsParams?) throws -> EventLoopFuture<Bool>

    @discardableResult
    func deleteMyCommands(params: TGDeleteMyCommandsParams?) async throws -> Bool

    @discardableResult
    func getMyCommands(params: TGGetMyCommandsParams?) throws -> EventLoopFuture<[TGBotCommand]>

    @discardableResult
    func getMyCommands(params: TGGetMyCommandsParams?) async throws -> [TGBotCommand]

    @discardableResult
    func setMyDescription(params: TGSetMyDescriptionParams?) throws -> EventLoopFuture<Bool>

    @discardableResult
    func setMyDescription(params: TGSetMyDescriptionParams?) async throws -> Bool

    @discardableResult
    func getMyDescription(params: TGGetMyDescriptionParams?) throws -> EventLoopFuture<TGBotDescription>

    @discardableResult
    func getMyDescription(params: TGGetMyDescriptionParams?) async throws -> TGBotDescription

    @discardableResult
    func setMyShortDescription(params: TGSetMyShortDescriptionParams?) throws -> EventLoopFuture<Bool>

    @discardableResult
    func setMyShortDescription(params: TGSetMyShortDescriptionParams?) async throws -> Bool

    @discardableResult
    func getMyShortDescription(params: TGGetMyShortDescriptionParams?) throws -> EventLoopFuture<TGBotShortDescription>

    @discardableResult
    func getMyShortDescription(params: TGGetMyShortDescriptionParams?) async throws -> TGBotShortDescription

    @discardableResult
    func setChatMenuButton(params: TGSetChatMenuButtonParams?) throws -> EventLoopFuture<Bool>

    @discardableResult
    func setChatMenuButton(params: TGSetChatMenuButtonParams?) async throws -> Bool

    @discardableResult
    func getChatMenuButton(params: TGGetChatMenuButtonParams?) throws -> EventLoopFuture<TGMenuButton>

    @discardableResult
    func getChatMenuButton(params: TGGetChatMenuButtonParams?) async throws -> TGMenuButton

    @discardableResult
    func setMyDefaultAdministratorRights(params: TGSetMyDefaultAdministratorRightsParams?) throws -> EventLoopFuture<Bool>

    @discardableResult
    func setMyDefaultAdministratorRights(params: TGSetMyDefaultAdministratorRightsParams?) async throws -> Bool

    @discardableResult
    func getMyDefaultAdministratorRights(params: TGGetMyDefaultAdministratorRightsParams?) throws -> EventLoopFuture<TGChatAdministratorRights>

    @discardableResult
    func getMyDefaultAdministratorRights(params: TGGetMyDefaultAdministratorRightsParams?) async throws -> TGChatAdministratorRights

    @discardableResult
    func editMessageText(params: TGEditMessageTextParams) throws -> EventLoopFuture<TGMessageOrBool>

    @discardableResult
    func editMessageText(params: TGEditMessageTextParams) async throws -> TGMessageOrBool

    @discardableResult
    func editMessageCaption(params: TGEditMessageCaptionParams?) throws -> EventLoopFuture<TGMessageOrBool>

    @discardableResult
    func editMessageCaption(params: TGEditMessageCaptionParams?) async throws -> TGMessageOrBool

    @discardableResult
    func editMessageMedia(params: TGEditMessageMediaParams) throws -> EventLoopFuture<TGMessageOrBool>

    @discardableResult
    func editMessageMedia(params: TGEditMessageMediaParams) async throws -> TGMessageOrBool

    @discardableResult
    func editMessageLiveLocation(params: TGEditMessageLiveLocationParams) throws -> EventLoopFuture<TGMessageOrBool>

    @discardableResult
    func editMessageLiveLocation(params: TGEditMessageLiveLocationParams) async throws -> TGMessageOrBool

    @discardableResult
    func stopMessageLiveLocation(params: TGStopMessageLiveLocationParams?) throws -> EventLoopFuture<TGMessageOrBool>

    @discardableResult
    func stopMessageLiveLocation(params: TGStopMessageLiveLocationParams?) async throws -> TGMessageOrBool

    @discardableResult
    func editMessageReplyMarkup(params: TGEditMessageReplyMarkupParams?) throws -> EventLoopFuture<TGMessageOrBool>

    @discardableResult
    func editMessageReplyMarkup(params: TGEditMessageReplyMarkupParams?) async throws -> TGMessageOrBool

    @discardableResult
    func stopPoll(params: TGStopPollParams) throws -> EventLoopFuture<TGPoll>

    @discardableResult
    func stopPoll(params: TGStopPollParams) async throws -> TGPoll

    @discardableResult
    func deleteMessage(params: TGDeleteMessageParams) throws -> EventLoopFuture<Bool>

    @discardableResult
    func deleteMessage(params: TGDeleteMessageParams) async throws -> Bool

    @discardableResult
    func sendSticker(params: TGSendStickerParams) throws -> EventLoopFuture<TGMessage>

    @discardableResult
    func sendSticker(params: TGSendStickerParams) async throws -> TGMessage

    @discardableResult
    func getStickerSet(params: TGGetStickerSetParams) throws -> EventLoopFuture<TGStickerSet>

    @discardableResult
    func getStickerSet(params: TGGetStickerSetParams) async throws -> TGStickerSet

    @discardableResult
    func getCustomEmojiStickers(params: TGGetCustomEmojiStickersParams) throws -> EventLoopFuture<[TGSticker]>

    @discardableResult
    func getCustomEmojiStickers(params: TGGetCustomEmojiStickersParams) async throws -> [TGSticker]

    @discardableResult
    func uploadStickerFile(params: TGUploadStickerFileParams) throws -> EventLoopFuture<TGFile>

    @discardableResult
    func uploadStickerFile(params: TGUploadStickerFileParams) async throws -> TGFile

    @discardableResult
    func createNewStickerSet(params: TGCreateNewStickerSetParams) throws -> EventLoopFuture<Bool>

    @discardableResult
    func createNewStickerSet(params: TGCreateNewStickerSetParams) async throws -> Bool

    @discardableResult
    func addStickerToSet(params: TGAddStickerToSetParams) throws -> EventLoopFuture<Bool>

    @discardableResult
    func addStickerToSet(params: TGAddStickerToSetParams) async throws -> Bool

    @discardableResult
    func setStickerPositionInSet(params: TGSetStickerPositionInSetParams) throws -> EventLoopFuture<Bool>

    @discardableResult
    func setStickerPositionInSet(params: TGSetStickerPositionInSetParams) async throws -> Bool

    @discardableResult
    func deleteStickerFromSet(params: TGDeleteStickerFromSetParams) throws -> EventLoopFuture<Bool>

    @discardableResult
    func deleteStickerFromSet(params: TGDeleteStickerFromSetParams) async throws -> Bool

    @discardableResult
    func setStickerEmojiList(params: TGSetStickerEmojiListParams) throws -> EventLoopFuture<Bool>

    @discardableResult
    func setStickerEmojiList(params: TGSetStickerEmojiListParams) async throws -> Bool

    @discardableResult
    func setStickerKeywords(params: TGSetStickerKeywordsParams) throws -> EventLoopFuture<Bool>

    @discardableResult
    func setStickerKeywords(params: TGSetStickerKeywordsParams) async throws -> Bool

    @discardableResult
    func setStickerMaskPosition(params: TGSetStickerMaskPositionParams) throws -> EventLoopFuture<Bool>

    @discardableResult
    func setStickerMaskPosition(params: TGSetStickerMaskPositionParams) async throws -> Bool

    @discardableResult
    func setStickerSetTitle(params: TGSetStickerSetTitleParams) throws -> EventLoopFuture<Bool>

    @discardableResult
    func setStickerSetTitle(params: TGSetStickerSetTitleParams) async throws -> Bool

    @discardableResult
    func setStickerSetThumbnail(params: TGSetStickerSetThumbnailParams) throws -> EventLoopFuture<Bool>

    @discardableResult
    func setStickerSetThumbnail(params: TGSetStickerSetThumbnailParams) async throws -> Bool

    @discardableResult
    func setCustomEmojiStickerSetThumbnail(params: TGSetCustomEmojiStickerSetThumbnailParams) throws -> EventLoopFuture<Bool>

    @discardableResult
    func setCustomEmojiStickerSetThumbnail(params: TGSetCustomEmojiStickerSetThumbnailParams) async throws -> Bool

    @discardableResult
    func deleteStickerSet(params: TGDeleteStickerSetParams) throws -> EventLoopFuture<Bool>

    @discardableResult
    func deleteStickerSet(params: TGDeleteStickerSetParams) async throws -> Bool

    @discardableResult
    func answerInlineQuery(params: TGAnswerInlineQueryParams) throws -> EventLoopFuture<Bool>

    @discardableResult
    func answerInlineQuery(params: TGAnswerInlineQueryParams) async throws -> Bool

    @discardableResult
    func answerWebAppQuery(params: TGAnswerWebAppQueryParams) throws -> EventLoopFuture<TGSentWebAppMessage>

    @discardableResult
    func answerWebAppQuery(params: TGAnswerWebAppQueryParams) async throws -> TGSentWebAppMessage

    @discardableResult
    func sendInvoice(params: TGSendInvoiceParams) throws -> EventLoopFuture<TGMessage>

    @discardableResult
    func sendInvoice(params: TGSendInvoiceParams) async throws -> TGMessage

    @discardableResult
    func createInvoiceLink(params: TGCreateInvoiceLinkParams) throws -> EventLoopFuture<String>

    @discardableResult
    func createInvoiceLink(params: TGCreateInvoiceLinkParams) async throws -> String

    @discardableResult
    func answerShippingQuery(params: TGAnswerShippingQueryParams) throws -> EventLoopFuture<Bool>

    @discardableResult
    func answerShippingQuery(params: TGAnswerShippingQueryParams) async throws -> Bool

    @discardableResult
    func answerPreCheckoutQuery(params: TGAnswerPreCheckoutQueryParams) throws -> EventLoopFuture<Bool>

    @discardableResult
    func answerPreCheckoutQuery(params: TGAnswerPreCheckoutQueryParams) async throws -> Bool

    @discardableResult
    func setPassportDataErrors(params: TGSetPassportDataErrorsParams) throws -> EventLoopFuture<Bool>

    @discardableResult
    func setPassportDataErrors(params: TGSetPassportDataErrorsParams) async throws -> Bool

    @discardableResult
    func sendGame(params: TGSendGameParams) throws -> EventLoopFuture<TGMessage>

    @discardableResult
    func sendGame(params: TGSendGameParams) async throws -> TGMessage

    @discardableResult
    func setGameScore(params: TGSetGameScoreParams) throws -> EventLoopFuture<TGMessageOrBool>

    @discardableResult
    func setGameScore(params: TGSetGameScoreParams) async throws -> TGMessageOrBool

    @discardableResult
    func getGameHighScores(params: TGGetGameHighScoresParams) throws -> EventLoopFuture<[TGGameHighScore]>

    @discardableResult
    func getGameHighScores(params: TGGetGameHighScoresParams) async throws -> [TGGameHighScore]

}

