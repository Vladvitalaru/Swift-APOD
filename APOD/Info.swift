//
//  Info.swift
//  APOD

import Foundation

struct Info: Codable { //These are the JSON values returned from the API
    let copyright: String?
    let date: String
    let explanation: String
    let hdurl: URL
    let media_type: String
    let service_version: String
    let title: String
    let url: URL
    
    static let `blank` = Info( //Default starting page before pulling API data
        copyright:"",
        date:"",
        explanation:"",
        hdurl: URL(string:"https://apod.nasa.gov/apod/image/2204/DevilsWay_Kiczenski_1402.jpg")!,
        media_type:"image",
        service_version:"v1",
        title:"",
        url: URL(string:"https://apod.nasa.gov/apod/image/2204/DevilsWay_Kiczenski_960.jpg")!
        )
    static let `error` = Info( //Error page shown when incorrect date URL is fetched
        copyright:" ",
        date:" ",
        explanation:"Please use format '2021-11-29' for date! \nThe image from '2022-04-13' is shown instead",
        hdurl: URL(string:"https://apod.nasa.gov/apod/image/2204/DevilsWay_Kiczenski_1402.jpg")!,
        media_type:"image",
        service_version:"v1",
        title:"Incorrect date!",
        url: URL(string:"https://apod.nasa.gov/apod/image/2204/DevilsWay_Kiczenski_960.jpg")!
        )
}

