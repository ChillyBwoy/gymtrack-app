//
//  CalendarView.swift
//  gymtrack-app
//
//  Created by Eugene Cheltsov on 06.05.2020.
//  Copyright © 2020 Eugene Cheltsov. All rights reserved.
//

import SwiftUI

fileprivate extension DateFormatter {
    static var month: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMMM"
        return formatter
    }

    static var monthAndYear: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMMM yyyy"
        return formatter
    }
}

fileprivate extension Calendar {
  func generateDates(inside interval: DateInterval, matching components: DateComponents) -> [Date] {
    var dates: [Date] = []

    dates.append(interval.start)

    enumerateDates(
      startingAfter: interval.start,
      matching: components,
      matchingPolicy: .nextTime
    ) { date, _, stop in
      if let date = date {
        if date < interval.end {
          dates.append(date)
        } else {
          stop = true
        }
      }
    }
    return dates
  }
}

fileprivate struct WeekView<Content>: View where Content: View {
  @Environment(\.calendar) var calendar
  
  let week: Date
  let content: (Date) -> Content
  
  init(week: Date, @ViewBuilder content: @escaping (Date) -> Content) {
    self.week = week
    self.content = content
  }
  
  private var days: [Date] {
    guard let weekInterval = calendar.dateInterval(of: .weekOfYear, for: week) else {
      return []
    }
    
    return calendar.generateDates(
      inside: weekInterval,
      matching: DateComponents(hour: 0, minute: 0, second: 0))
  }
  
  var body: some View {
    HStack {
      ForEach(days, id: \.self) { date in
        HStack {
          if self.calendar.isDate(self.week, equalTo: date, toGranularity: .month) {
            self.content(date)
          } else {
            self.content(date).hidden()
          }
        }
      }
    }
  }
}

fileprivate struct MonthView<Content>: View where Content: View {
  @Environment(\.calendar) var calendar
  
  let month: Date
  let content: (Date) -> Content
  
  init(month: Date, @ViewBuilder content: @escaping (Date) -> Content) {
    self.month = month
    self.content = content
  }
  
  private var weeks: [Date] {
    guard let monthInterval = calendar.dateInterval(of: .month, for: month) else {
      return []
    }
    
    return calendar.generateDates(
      inside: monthInterval,
      matching: DateComponents(hour: 0, minute: 0, second: 0, weekday: 1))
  }
  
  private var header: some View {
    let component = calendar.component(.month, from: month)
    let formatter = component == 1 ? DateFormatter.monthAndYear : .month
    return Text(formatter.string(from: month))
      .font(.title)
      .padding()
  }
  
  var body: some View {
    VStack {
      header
      ForEach(weeks, id: \.self) { week in
        WeekView(week: week, content: self.content)
      }
    }
  }
}

struct CalendarView<Content>: View where Content: View {
  @Environment(\.calendar) var calendar

  let interval: DateInterval
  let content: (Date) -> Content
  
  init(interval: DateInterval, @ViewBuilder content: @escaping (Date) -> Content) {
    self.interval = interval
    self.content = content
  }
  
  private var months: [Date] {
    calendar.generateDates(inside: interval, matching: DateComponents(day: 1, hour: 0, minute: 0, second: 0))
  }
  
  var body: some View {
    ScrollView(.vertical, showsIndicators: false) {
      VStack {
        ForEach(months, id: \.self) { month in
          MonthView(month: month, content: self.content)
        }
      }
    }
  }
}

struct CalendarView_Previews: PreviewProvider {
  static var previews: some View {
    let calendar = Calendar.current
    var year: DateInterval {
        calendar.dateInterval(of: .year, for: Date())!
    }
    
    return CalendarView(interval: year) { date in
      Text("30")
        .hidden()
        .padding(8)
        .background(Color.blue)
        .clipShape(Circle())
        .padding(.vertical, 4)
        .overlay(
            Text(String(calendar.component(.day, from: date)))
        )
    }
  }
}
