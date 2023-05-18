//
//  ChartView.swift
//  DesingAndAnimationsScreens
//
//  Created by Matteo Buompastore on 17/05/23.
//

import SwiftUI
import Charts

struct ChartView: View {
    var body: some View {
        Chart {
            ForEach(data) {item in
                /*BarMark(x: .value("Day", item.day), y: .value("Value", item.value))
                    .cornerRadius(10)*/
                LineMark(x: .value("Day", item.day),
                         y: .value("Value", item.value),
                         series: .value("Year", "2023"))
                    .cornerRadius(10)
                    .foregroundStyle(by: .value("Year", "2023"))
                    .interpolationMethod(.catmullRom)
                    .symbol(by: .value("Year", "2023"))
            }
            
            ForEach(data2) {item in
                /*BarMark(x: .value("Day", item.day), y: .value("Value", item.value))
                    .cornerRadius(10)*/
                LineMark(x: .value("Day", item.day),
                         y: .value("Value", item.value),
                         series: .value("Year", "2022"))
                    .cornerRadius(10)
                    .foregroundStyle(by: .value("Year", "2022"))
                    .interpolationMethod(.catmullRom)
                    .symbol(by: .value("Year", "2022"))
            }
        }
        //.foregroundStyle(.linearGradient(colors: [.blue, .purple], startPoint: .top, endPoint: .bottom))
        .frame(height: 300)
        .padding(20)
    }
}

struct ChartView_Previews: PreviewProvider {
    static var previews: some View {
        ChartView()
    }
}

struct Value : Identifiable {
    var id = UUID()
    var day : String
    var value : Double
}

let data : [Value] = [
    .init(day: "Jun 1", value: -100),
    .init(day: "Jun 2", value: 200),
    .init(day: "Jun 3", value: 400),
    .init(day: "Jun 4", value: 350),
    .init(day: "Jun 5", value: 600),
]

let data2 : [Value] = [
    .init(day: "Jun 1", value: -232),
    .init(day: "Jun 2", value: 250),
    .init(day: "Jun 3", value: -126),
    .init(day: "Jun 4", value: 376),
    .init(day: "Jun 5", value: 190),
]
