//
//  TypeAliases.swift
//  SwimPal
//
//  Created by Bruno Benčević on 30.05.2022..
//

import Foundation

typealias EmptyCallback = () -> Void
typealias ArgCallback<T> = (T) -> Void
typealias ErrorCallback = (Error) -> Void
typealias DismissWithCallback = (EmptyCallback?) -> Void
