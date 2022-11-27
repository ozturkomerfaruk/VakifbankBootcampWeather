//
//  BaseResponse.swift
//  WeatherApp
//
//  Created by Ömer Faruk Öztürk on 27.11.2022.
//

import Foundation

//MARK: Base Response Model
struct BaseResponse: Codable {
    let status: Int
    let error: String
}

extension BaseResponse: LocalizedError {
    var errorDescription: String? {
        return error
    }
}
