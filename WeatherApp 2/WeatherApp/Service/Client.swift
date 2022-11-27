//
//  Client.swift
//  WeatherApp
//
//  Created by Ömer Faruk Öztürk on 27.11.2022.
//

import Foundation

class Client {
    enum EndPoints {
        //base api
        static let base = "http://api.weatherstack.com/current?access_key=d3bea008aedcbeb905a57d40e1a9283a"
        
        //MARK: Endpoints
        case city(String)
        
        
        var stringValue: String {
            switch self {
            case .city(let city):
                return EndPoints.base + "&query=\(city)"
                
            }
        }
        
        var url: URL {
            return URL(string: stringValue)!
        }
    }
    
    // General Get Request
    @discardableResult
    class func tasksForGETRequest<ResponseType: Codable>(url: URL, responseType: ResponseType.Type, completion: @escaping(ResponseType?, Error?) -> Void) -> URLSessionDataTask {
        
        let task = URLSession.shared.dataTask(with: url) {
            data, response, error in
            guard let data = data else {
                DispatchQueue.main.async {
                    completion(nil, error)
                }
                return
            }
            let decoder = JSONDecoder()
            do {
                let responseObject = try decoder.decode(ResponseType.self, from: data)
                DispatchQueue.main.async {
                    completion(responseObject, nil)
                }
            } catch {
                do {
                    let errorResponse = try decoder.decode(BaseResponse.self, from: data) as Error
                    DispatchQueue.main.async {
                        completion(nil, errorResponse)
                    }
                } catch {
                    DispatchQueue.main.async {
                        completion(nil, error)
                    }
                }
            }
        }
        task.resume()
        return task
    }
    
    //MARK: getQuoteByAuthor
    class func getWeatherByCity(city: String, completion: @escaping(WeatherModel?, Error?) -> Void) {
        tasksForGETRequest(url: EndPoints.city(city).url,  responseType: WeatherModel.self) { response, error in
            if let response = response {
                completion(response, nil)
            } else {
                completion(nil, error)
            }
        }
    }
}
