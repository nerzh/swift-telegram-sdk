//
//  TGVaporClientPrtcl.swift
//  
//
//  Created by Yakov Shapovalov on 01.07.2024.
//

import TelegramBotKit
import Vapor

public protocol TGVaporClientPrtcl: TGClientPrtcl 
where TGBot == TGVaporBot, TGURI == URI, TGMediaType == HTTPMediaType {}
