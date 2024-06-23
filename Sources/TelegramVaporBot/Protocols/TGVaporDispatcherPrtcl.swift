//
//  TGVaporDispatcherPrtcl.swift
//  
//
//  Created by Yakov Shapovalov on 01.07.2024.
//

import TelegramBotKit

public protocol TGVaporDispatcherPrtcl: TGDispatcherPrtcl
where TGBot: TGVaporBotPrtcl, TGBot == TGVaporBot {}
