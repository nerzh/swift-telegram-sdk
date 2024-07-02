// Telegram-vapor-bot - Telegram Bot Swift SDK.
import Logging

public protocol TGBotPrtcl {

    var connectionType: TGConnectionType { get }
    var dispatcher: TGDispatcherPrtcl { get }
    var botId: String { get }
    var tgURI: URI { get }
    var tgClient: TGClientPrtcl { get }
    static var log: Logger { get }

    @discardableResult
    func start() async throws -> Bool

    @discardableResult
    func getUpdates(params: TGGetUpdatesParams?) async throws -> [TGUpdate]



    @discardableResult
    func setWebhook(params: TGSetWebhookParams) async throws -> Bool



    @discardableResult
    func deleteWebhook(params: TGDeleteWebhookParams?) async throws -> Bool



    @discardableResult
    func getWebhookInfo() async throws -> TGWebhookInfo



    @discardableResult
    func getMe() async throws -> TGUser



    @discardableResult
    func logOut() async throws -> Bool



    @discardableResult
    func close() async throws -> Bool



    @discardableResult
    func sendMessage(params: TGSendMessageParams) async throws -> TGMessage



    @discardableResult
    func forwardMessage(params: TGForwardMessageParams) async throws -> TGMessage



    @discardableResult
    func forwardMessages(params: TGForwardMessagesParams) async throws -> [TGMessageId]



    @discardableResult
    func copyMessage(params: TGCopyMessageParams) async throws -> TGMessageId



    @discardableResult
    func copyMessages(params: TGCopyMessagesParams) async throws -> [TGMessageId]



    @discardableResult
    func sendPhoto(params: TGSendPhotoParams) async throws -> TGMessage



    @discardableResult
    func sendAudio(params: TGSendAudioParams) async throws -> TGMessage



    @discardableResult
    func sendDocument(params: TGSendDocumentParams) async throws -> TGMessage



    @discardableResult
    func sendVideo(params: TGSendVideoParams) async throws -> TGMessage



    @discardableResult
    func sendAnimation(params: TGSendAnimationParams) async throws -> TGMessage



    @discardableResult
    func sendVoice(params: TGSendVoiceParams) async throws -> TGMessage



    @discardableResult
    func sendVideoNote(params: TGSendVideoNoteParams) async throws -> TGMessage



    @discardableResult
    func sendPaidMedia(params: TGSendPaidMediaParams) async throws -> TGMessage



    @discardableResult
    func sendMediaGroup(params: TGSendMediaGroupParams) async throws -> [TGMessage]



    @discardableResult
    func sendLocation(params: TGSendLocationParams) async throws -> TGMessage



    @discardableResult
    func sendVenue(params: TGSendVenueParams) async throws -> TGMessage



    @discardableResult
    func sendContact(params: TGSendContactParams) async throws -> TGMessage



    @discardableResult
    func sendPoll(params: TGSendPollParams) async throws -> TGMessage



    @discardableResult
    func sendDice(params: TGSendDiceParams) async throws -> TGMessage



    @discardableResult
    func sendChatAction(params: TGSendChatActionParams) async throws -> Bool



    @discardableResult
    func setMessageReaction(params: TGSetMessageReactionParams) async throws -> Bool



    @discardableResult
    func getUserProfilePhotos(params: TGGetUserProfilePhotosParams) async throws -> TGUserProfilePhotos



    @discardableResult
    func getFile(params: TGGetFileParams) async throws -> TGFile



    @discardableResult
    func banChatMember(params: TGBanChatMemberParams) async throws -> Bool



    @discardableResult
    func unbanChatMember(params: TGUnbanChatMemberParams) async throws -> Bool



    @discardableResult
    func restrictChatMember(params: TGRestrictChatMemberParams) async throws -> Bool



    @discardableResult
    func promoteChatMember(params: TGPromoteChatMemberParams) async throws -> Bool



    @discardableResult
    func setChatAdministratorCustomTitle(params: TGSetChatAdministratorCustomTitleParams) async throws -> Bool



    @discardableResult
    func banChatSenderChat(params: TGBanChatSenderChatParams) async throws -> Bool



    @discardableResult
    func unbanChatSenderChat(params: TGUnbanChatSenderChatParams) async throws -> Bool



    @discardableResult
    func setChatPermissions(params: TGSetChatPermissionsParams) async throws -> Bool



    @discardableResult
    func exportChatInviteLink(params: TGExportChatInviteLinkParams) async throws -> String



    @discardableResult
    func createChatInviteLink(params: TGCreateChatInviteLinkParams) async throws -> Bool



    @discardableResult
    func editChatInviteLink(params: TGEditChatInviteLinkParams) async throws -> Bool



    @discardableResult
    func revokeChatInviteLink(params: TGRevokeChatInviteLinkParams) async throws -> Bool



    @discardableResult
    func approveChatJoinRequest(params: TGApproveChatJoinRequestParams) async throws -> Bool



    @discardableResult
    func declineChatJoinRequest(params: TGDeclineChatJoinRequestParams) async throws -> Bool



    @discardableResult
    func setChatPhoto(params: TGSetChatPhotoParams) async throws -> Bool



    @discardableResult
    func deleteChatPhoto(params: TGDeleteChatPhotoParams) async throws -> Bool



    @discardableResult
    func setChatTitle(params: TGSetChatTitleParams) async throws -> Bool



    @discardableResult
    func setChatDescription(params: TGSetChatDescriptionParams) async throws -> Bool



    @discardableResult
    func pinChatMessage(params: TGPinChatMessageParams) async throws -> Bool



    @discardableResult
    func unpinChatMessage(params: TGUnpinChatMessageParams) async throws -> Bool



    @discardableResult
    func unpinAllChatMessages(params: TGUnpinAllChatMessagesParams) async throws -> Bool



    @discardableResult
    func leaveChat(params: TGLeaveChatParams) async throws -> Bool



    @discardableResult
    func getChat(params: TGGetChatParams) async throws -> TGChatFullInfo



    @discardableResult
    func getChatAdministrators(params: TGGetChatAdministratorsParams) async throws -> [TGChatMember]



    @discardableResult
    func getChatMemberCount(params: TGGetChatMemberCountParams) async throws -> Int



    @discardableResult
    func getChatMember(params: TGGetChatMemberParams) async throws -> TGChatMember



    @discardableResult
    func setChatStickerSet(params: TGSetChatStickerSetParams) async throws -> Bool



    @discardableResult
    func deleteChatStickerSet(params: TGDeleteChatStickerSetParams) async throws -> Bool



    @discardableResult
    func getForumTopicIconStickers() async throws -> [TGSticker]



    @discardableResult
    func createForumTopic(params: TGCreateForumTopicParams) async throws -> Bool



    @discardableResult
    func editForumTopic(params: TGEditForumTopicParams) async throws -> Bool



    @discardableResult
    func closeForumTopic(params: TGCloseForumTopicParams) async throws -> Bool



    @discardableResult
    func reopenForumTopic(params: TGReopenForumTopicParams) async throws -> Bool



    @discardableResult
    func deleteForumTopic(params: TGDeleteForumTopicParams) async throws -> Bool



    @discardableResult
    func unpinAllForumTopicMessages(params: TGUnpinAllForumTopicMessagesParams) async throws -> Bool



    @discardableResult
    func editGeneralForumTopic(params: TGEditGeneralForumTopicParams) async throws -> Bool



    @discardableResult
    func closeGeneralForumTopic(params: TGCloseGeneralForumTopicParams) async throws -> Bool



    @discardableResult
    func reopenGeneralForumTopic(params: TGReopenGeneralForumTopicParams) async throws -> Bool



    @discardableResult
    func hideGeneralForumTopic(params: TGHideGeneralForumTopicParams) async throws -> Bool



    @discardableResult
    func unhideGeneralForumTopic(params: TGUnhideGeneralForumTopicParams) async throws -> Bool



    @discardableResult
    func unpinAllGeneralForumTopicMessages(params: TGUnpinAllGeneralForumTopicMessagesParams) async throws -> Bool



    @discardableResult
    func answerCallbackQuery(params: TGAnswerCallbackQueryParams) async throws -> Bool



    @discardableResult
    func getUserChatBoosts(params: TGGetUserChatBoostsParams) async throws -> TGUserChatBoosts



    @discardableResult
    func getBusinessConnection(params: TGGetBusinessConnectionParams) async throws -> TGBusinessConnection



    @discardableResult
    func setMyCommands(params: TGSetMyCommandsParams) async throws -> Bool



    @discardableResult
    func deleteMyCommands(params: TGDeleteMyCommandsParams?) async throws -> Bool



    @discardableResult
    func getMyCommands(params: TGGetMyCommandsParams?) async throws -> [TGBotCommand]



    @discardableResult
    func setMyName(params: TGSetMyNameParams?) async throws -> Bool



    @discardableResult
    func getMyName(params: TGGetMyNameParams?) async throws -> TGBotName



    @discardableResult
    func setMyDescription(params: TGSetMyDescriptionParams?) async throws -> Bool



    @discardableResult
    func getMyDescription(params: TGGetMyDescriptionParams?) async throws -> TGBotDescription



    @discardableResult
    func setMyShortDescription(params: TGSetMyShortDescriptionParams?) async throws -> Bool



    @discardableResult
    func getMyShortDescription(params: TGGetMyShortDescriptionParams?) async throws -> TGBotShortDescription



    @discardableResult
    func setChatMenuButton(params: TGSetChatMenuButtonParams?) async throws -> Bool



    @discardableResult
    func getChatMenuButton(params: TGGetChatMenuButtonParams?) async throws -> TGMenuButton



    @discardableResult
    func setMyDefaultAdministratorRights(params: TGSetMyDefaultAdministratorRightsParams?) async throws -> Bool



    @discardableResult
    func getMyDefaultAdministratorRights(params: TGGetMyDefaultAdministratorRightsParams?) async throws -> TGChatAdministratorRights



    @discardableResult
    func editMessageText(params: TGEditMessageTextParams) async throws -> TGMessageOrBool



    @discardableResult
    func editMessageCaption(params: TGEditMessageCaptionParams?) async throws -> TGMessageOrBool



    @discardableResult
    func editMessageMedia(params: TGEditMessageMediaParams) async throws -> TGMessageOrBool



    @discardableResult
    func editMessageLiveLocation(params: TGEditMessageLiveLocationParams) async throws -> TGMessageOrBool



    @discardableResult
    func stopMessageLiveLocation(params: TGStopMessageLiveLocationParams?) async throws -> TGMessageOrBool



    @discardableResult
    func editMessageReplyMarkup(params: TGEditMessageReplyMarkupParams?) async throws -> TGMessageOrBool



    @discardableResult
    func stopPoll(params: TGStopPollParams) async throws -> TGPoll



    @discardableResult
    func deleteMessage(params: TGDeleteMessageParams) async throws -> Bool



    @discardableResult
    func deleteMessages(params: TGDeleteMessagesParams) async throws -> Bool



    @discardableResult
    func sendSticker(params: TGSendStickerParams) async throws -> TGMessage



    @discardableResult
    func getStickerSet(params: TGGetStickerSetParams) async throws -> TGStickerSet



    @discardableResult
    func getCustomEmojiStickers(params: TGGetCustomEmojiStickersParams) async throws -> [TGSticker]



    @discardableResult
    func uploadStickerFile(params: TGUploadStickerFileParams) async throws -> TGFile



    @discardableResult
    func createNewStickerSet(params: TGCreateNewStickerSetParams) async throws -> Bool



    @discardableResult
    func addStickerToSet(params: TGAddStickerToSetParams) async throws -> Bool



    @discardableResult
    func setStickerPositionInSet(params: TGSetStickerPositionInSetParams) async throws -> Bool



    @discardableResult
    func deleteStickerFromSet(params: TGDeleteStickerFromSetParams) async throws -> Bool



    @discardableResult
    func replaceStickerInSet(params: TGReplaceStickerInSetParams) async throws -> Bool



    @discardableResult
    func setStickerEmojiList(params: TGSetStickerEmojiListParams) async throws -> Bool



    @discardableResult
    func setStickerKeywords(params: TGSetStickerKeywordsParams) async throws -> Bool



    @discardableResult
    func setStickerMaskPosition(params: TGSetStickerMaskPositionParams) async throws -> Bool



    @discardableResult
    func setStickerSetTitle(params: TGSetStickerSetTitleParams) async throws -> Bool



    @discardableResult
    func setStickerSetThumbnail(params: TGSetStickerSetThumbnailParams) async throws -> Bool



    @discardableResult
    func setCustomEmojiStickerSetThumbnail(params: TGSetCustomEmojiStickerSetThumbnailParams) async throws -> Bool



    @discardableResult
    func deleteStickerSet(params: TGDeleteStickerSetParams) async throws -> Bool



    @discardableResult
    func answerInlineQuery(params: TGAnswerInlineQueryParams) async throws -> Bool



    @discardableResult
    func answerWebAppQuery(params: TGAnswerWebAppQueryParams) async throws -> TGSentWebAppMessage



    @discardableResult
    func sendInvoice(params: TGSendInvoiceParams) async throws -> TGMessage



    @discardableResult
    func createInvoiceLink(params: TGCreateInvoiceLinkParams) async throws -> String



    @discardableResult
    func answerShippingQuery(params: TGAnswerShippingQueryParams) async throws -> Bool



    @discardableResult
    func answerPreCheckoutQuery(params: TGAnswerPreCheckoutQueryParams) async throws -> Bool



    @discardableResult
    func getStarTransactions(params: TGGetStarTransactionsParams?) async throws -> TGStarTransactions



    @discardableResult
    func refundStarPayment(params: TGRefundStarPaymentParams) async throws -> Bool



    @discardableResult
    func setPassportDataErrors(params: TGSetPassportDataErrorsParams) async throws -> Bool



    @discardableResult
    func sendGame(params: TGSendGameParams) async throws -> TGMessage



    @discardableResult
    func setGameScore(params: TGSetGameScoreParams) async throws -> TGMessageOrBool



    @discardableResult
    func getGameHighScores(params: TGGetGameHighScoresParams) async throws -> [TGGameHighScore]

}
