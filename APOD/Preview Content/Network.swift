//
//  Network.swift
//  APOD
//
//
import Foundation

class Network {
    //Function that grabs the JSON information from a url and decodes it for us to pull data from.
    func getInfo() async -> Info? {
        do {
            let request = URLRequest(url: url)
            let (data, _) = try await URLSession.shared.data(for:request)
            return try JSONDecoder().decode(Info.self, from:data)
            }
        catch { //if an error occurs, return the error screen data
            return Info.error
        }
    }
}

