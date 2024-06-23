//
//  Untitled.swift
//  
//
//  Created by Yakov Shapovalov on 01.07.2024.
//

import TelegramBotKit
import Vapor

public protocol TGVaporLongPollingConnectionPrtcl: TGLongPollingConnectionPrtcl
where TGBot: TGVaporBot, TGBot == TGVaporBot, TGDispatcher == TGVaporDispatcher {}

public protocol TGVaporWebHookConnectionPrtcl: TGWebHookConnectionPrtcl
where TGBot: TGVaporBot, TGBot == TGVaporBot, TGDispatcher == TGVaporDispatcher, TGURI == URI {}
