import maji_countdownLibrary
import JavaScriptKit
import Foundation

var newyearCompo = DateComponents()
newyearCompo.year = 2024
newyearCompo.month = 1
newyearCompo.day = 1
newyearCompo.timeZone = TimeZone(abbreviation: "GMT+7")
newyearCompo.hour = 0
newyearCompo.minute = 0

// Create date from components
let calendar = Calendar.current
let targetDate = calendar.date(from: newyearCompo)
let fallbackDate = Date()

print(calendar.component(.day, from: targetDate ?? fallbackDate))

var document = JSObject.global.document

var txtElement = document.getElementById("countdown-txt")

extension Date {
    static func - (lhs: Date, rhs: Date) -> TimeInterval {
        return lhs.timeIntervalSinceReferenceDate - rhs.timeIntervalSinceReferenceDate
    }
}

func mainloop() {
    let tInterval = Date().distance(to: targetDate ?? fallbackDate)
    let date = Date(timeIntervalSinceReferenceDate: tInterval)

    let day = calendar.component(.day, from: date) - 2
    let hour = calendar.component(.hour, from: date) + 17
    let minutes = calendar.component(.minute, from: date)
    let seconds = calendar.component(.second, from: date)

    let finalTxt = String(format: "%d:%d:%d:%d", day, hour, minutes, seconds)

    txtElement.innerText = JSValue(stringLiteral: finalTxt)
}

document.body.onanimationiteration = .object(JSClosure { _ in
    mainloop()

    return .undefined
})