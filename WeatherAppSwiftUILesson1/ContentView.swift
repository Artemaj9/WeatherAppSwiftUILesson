//
//  ContentView.swift
//  WeatherAppSwiftUILesson1
//
//  Created by Artem on 17.11.2022.
//

import SwiftUI

struct ContentView: View {
    @State private var isNight = false
    var body: some View {
        ZStack {
            BackgroundView(isNight: $isNight)
            VStack {
              CityTextView(cityName: "Moscow, Ru")
                
                MainWeatherStatusView(imageName: isNight ? "moon.stars.fill" : "cloud.sun.fill",temperature: 12)
                HStack (spacing: 15) {
                   WeatheDayView(dayOfWeek: "TUE",
                                 imageName: "cloud.sun.fill",
                                 temperature: 14)
                    WeatheDayView(dayOfWeek: "WED",
                                  imageName: "sun.max.fill",
                                  temperature: 12)
                    WeatheDayView(dayOfWeek: "THU",
                                  imageName: "wind.snow",
                                  temperature: -4)
                    WeatheDayView(dayOfWeek: "FRI",
                                  imageName: "sun.haze.fill",
                                  temperature: 4)
                    WeatheDayView(dayOfWeek: "SAT",
                                  imageName: "cloud.rain.fill",
                                  temperature: 3)
                    }
                    
                Spacer()
                
                Button {
                    isNight.toggle()
                } label: {
                  WeatherButton(title: "Change Day Time",
                                textColor: isNight ? .black : .blue,
                                backgroundColor: .white)
                    
                }
                
                Spacer()
            }
        }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct WeatheDayView: View {
    
    var dayOfWeek: String
    var imageName: String
    var temperature: Int
    var body: some View {
        VStack {
            Text(dayOfWeek)
                .font(.system(size: 16, weight: .medium, design: .default))
                .foregroundColor(.white)
                .padding()
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
            Text("\(temperature)°")
                .font(.system(size: 27, weight: .medium))
                .foregroundColor(.white)
        }
    }
}

struct BackgroundView: View {
    @Binding var isNight: Bool
    
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [isNight ? .black : .blue, isNight ? .gray : Color("lightBlue")]),
                       startPoint: .topLeading,
                       endPoint: .bottomTrailing)
            .edgesIgnoringSafeArea(.all)
    }
}

struct CityTextView: View {
    var cityName: String
    
    var body: some View {
        Text(cityName)
            .font(.system(size: 32, weight: .medium, design: .default))
            .foregroundColor(.white)
            .padding()
    }
}

struct MainWeatherStatusView: View {
    var imageName: String
    var temperature: Int
    
    
    var body: some View {
        VStack(spacing:10) {
        Image(systemName: imageName)
            .renderingMode(.original)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 180, height: 180)
            
        Text("\(temperature)°")
            .font(.system(size: 65, weight: .medium))
            .foregroundColor(.white)
    }
        .padding(.bottom, 40)
    }
}



