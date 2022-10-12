//
//  ContentView.swift
//  APOD
//  Vlad Vitalaru
//

import SwiftUI

var url = URL(string: "https://api.nasa.gov/planetary/apod?api_key=PaV2EQfUIJDsVUtxecqMjwS0H2lc7RSEQc9gSApd")!

struct ContentView: View {
    @State var info = Info.blank
    @State var date: String = ""
    var body: some View {
        List { //Use a List to structure different elements
            AsyncImage(url: info.url, scale: 2.3) //pull image and scale it properly
                .listRowInsets(.init())
                .frame(height: 300)
            Text(info.title)
                .bold()
                .padding(.vertical)
                .font(.title)
                .foregroundColor(Color.white)
                .listRowBackground(Color.black)
            if let copyright = info.copyright { //if no copyright, dont include Label
                if copyright != " " {
                    Label(copyright, systemImage: "camera")
                        .foregroundColor(Color.white)
                        .listRowBackground(Color.black)
                }
            }
            if info.date != " " {
                Label(info.date, systemImage: "calendar")
                    .foregroundColor(Color.white)
                    .listRowBackground(Color.black)
            }
            Label(info.explanation, systemImage:
                "questionmark.circle")
                .foregroundColor(Color.white)
                .listRowBackground(Color.black)
                .padding([.bottom],20)
            Text("Fetch new date below! ex: 2021-11-29")
                .bold()
            TextField("", text: $date, onCommit: {url = URL(string: "https://api.nasa.gov/planetary/apod?api_key=PaV2EQfUIJDsVUtxecqMjwS0H2lc7RSEQc9gSApd&date=" + date.trimmingCharacters(in: .whitespaces) )!; Task {info = await Network().getInfo()!}})
            }.task {
            if let response = await Network().getInfo() { //Grab current date information from API
                info = response
                print(url)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

