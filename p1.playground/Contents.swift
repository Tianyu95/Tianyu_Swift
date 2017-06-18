//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"


class NumberParser {
    func singleNumberToChinese(number: Character) -> String {
        switch number {
        case "0":
            return "零"
        case "1":
            return "一"
        case "2":
            return "二"
        case "3":
            return "三"
        case "4":
            return "四"
        case "5":
            return "五"
        case "6":
            return "六"
        case "7":
            return "七"
        case "8":
            return "八"
        case "9":
            return "九"
        default:
            return ""
        }
    }
}

let convertor = NumberParser()
let zeroString = convertor.singleNumberToChinese(number: "0")


class NumbersParser: NumberParser {
    
    static let sharedInstance = NumbersParser()
    
    func numberToChinese(number: Int) -> String {
        let numbers = String(number).characters
        var finalString = ""
        for singleNumber in numbers {
            let string = singleNumberToChinese(number: singleNumber)
            finalString = "\(finalString)\(string)"
        }
        return finalString
    }
}
let conventor = NumbersParser()
let yearString = conventor.numberToChinese(number: 2015)

//单例
let numbersString = NumbersParser.sharedInstance.numberToChinese(number: 2015)

class YearParser: NumbersParser {
    static let sharedYearParserInstance = YearParser()
    
    override func numberToChinese(number: Int) -> String {
        let numbersString = super.numberToChinese(number: number)
        return "\(numbersString)年"
    }
}
let yearsString = YearParser.sharedYearParserInstance.numberToChinese(number: 2015)



//protocol
protocol SleepDelegate {
    func canISleep() -> Bool
}

class Human: SleepDelegate {
    func canISleep() -> Bool {
        return false
    }
}
class Cat {
    var delegate: SleepDelegate?
    
    func wantsToSleep() {
        if let master = delegate {
            if master.canISleep() {
                print("Go To Sleep")
            } else {
                print("No")
            }
        }
    }
}
let myCar = Cat()
myCar.delegate = Human()
myCar.wantsToSleep()


//enum
enum China: Int {
    case Guangzhou = 0
    case Beijing
    var description: String {
        switch self {
        case .Guangzhou:
            return "广州"
        case .Beijing:
            return "北京"
        }
    }
}
class City {
    var name = China.Guangzhou
}
let guangzhou = City()
print(guangzhou.name.description)


let polygonPath = UIBezierPath()
polygonPath.move(to: CGPoint(x: 162, y: 93))
polygonPath.addLine(to: CGPoint(x: 230.48, y: 142.75))
polygonPath.addLine(to: CGPoint(x: 204.32, y: 223.25))
polygonPath.addLine(to: CGPoint(x: 119.68, y: 223.25))
polygonPath.addLine(to: CGPoint(x: 93.52, y: 142.75))
polygonPath.close()




let starPath = UIBezierPath()
starPath.move(to: CGPoint(x: 162, y: 82))
starPath.addLine(to: CGPoint(x: 191.27, y: 124.71))
starPath.addLine(to: CGPoint(x: 240.94, y: 139.35))
starPath.addLine(to: CGPoint(x: 209.36, y: 180.39))
starPath.addLine(to: CGPoint(x: 210.79, y: 232.15))
starPath.addLine(to: CGPoint(x: 162, y: 214.8))
starPath.addLine(to: CGPoint(x: 113.21, y: 232.15))
starPath.addLine(to: CGPoint(x: 114.64, y: 180.39))
starPath.addLine(to: CGPoint(x: 83.06, y: 139.35))
starPath.addLine(to: CGPoint(x: 132.73, y: 124.71))
starPath.close()


