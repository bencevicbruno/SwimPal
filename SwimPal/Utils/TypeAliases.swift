//
//  TypeAliases.swift
//  SwimPal
//
//  Created by Bruno Benčević on 30.05.2022..
//

import Foundation
import CoreLocation

typealias EmptyCallback = () -> Void
typealias ArgCallback<T> = (T) -> Void
typealias UUIDCallback = (UUID) -> Void

typealias ErrorCallback = (Error) -> Void
typealias DismissWithCallback = (EmptyCallback?) -> Void

typealias LocationCallback = (CLLocationCoordinate2D) -> Void
