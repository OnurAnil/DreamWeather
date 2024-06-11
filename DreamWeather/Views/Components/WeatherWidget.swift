//
//  WeatherWidget.swift
//  DreamWeather
//
//  Created by Onur Anıl on 11.06.2024.
//

import SwiftUI

struct WeatherWidget: View {
    var forecast: Forecast
    
    var body: some View {
        ZStack(alignment: .bottom, content: {
            //MARK: Trapeziod
            Trapezoid()
                .fill(Color.weatherWidgetBackground)
                .frame(width: 342, height: 174)
            
            //MARK: Content
            HStack(alignment: .bottom) {
                VStack(alignment: .leading, spacing: 8) {
                    // MARK: Forecast Tempature
                    Text("\(forecast.temperature)°")
                        .font(.system(size: 64))
                    
                    VStack(alignment: .leading, spacing: 2) {
                        //MARK: Forecast Tempature Range
                        Text("H:\(forecast.high)°  L:\(forecast.low)")
                            .font(.footnote)
                            .foregroundStyle(.secondary)
                        
                        //MARK: Forecast Location
                        Text(forecast.location)
                            .font(.body)
                            .lineLimit(1)
                    }
                }
                
                Spacer()
                
                VStack(alignment: .trailing, spacing: 0) {
                    //MARK: Forecast Large Icon
                    Image("\(forecast.icon) large")
                        .padding(.trailing, 4)
                    
                    //MARK: Weather
                    Text(forecast.weather.rawValue)
                        .font(.footnote)
                        .padding(.trailing, 24)
                }
                
            }
            .foregroundColor(.white)
            .padding(.bottom, 20)
            .padding(.leading, 20)
        })
        .frame(width: 342, height: 184, alignment: .bottom)
    }
}

#Preview {
    WeatherWidget(forecast: Forecast.cities[0])
        .preferredColorScheme(.dark)
}
