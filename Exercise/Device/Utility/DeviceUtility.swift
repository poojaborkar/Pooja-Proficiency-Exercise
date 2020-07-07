//
//  DeviceUtility.swift
//  Exercise

import Foundation
import UIKit

class DeviceUtility {
    static var STATUS_BAR_SIZE: CGRect = UIApplication.shared.keyWindow?.windowScene?.statusBarManager?.statusBarFrame ?? CGRect.zero
    static var SCREEN_SIZE: CGRect = UIScreen.main.bounds
}
