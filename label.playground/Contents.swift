//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"


var newLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 300, height: 100))
newLabel.text = "HeyLabel"
newLabel.sizeToFit()

let fontSize: CGFloat = 22.0
//let font = UIFont.systemFont(ofSize: fontSize)
//UIFont.systemFont(ofSize: fontSize, weight: 25)
var newLabelTwo = UILabel(frame: CGRect(x: 0, y: 0, width: 20, height: 100))
newLabelTwo.text = "竖排文字"
newLabelTwo.lineBreakMode = NSLineBreakMode.byCharWrapping
newLabelTwo.numberOfLines = 0





func sizeHeightWithText(labelText: NSString, fontSize: CGFloat, textAttributes: [String: AnyObject]) -> CGRect {
    return labelText.boundingRect(with: CGSize(width: fontSize, height: 480), options: NSStringDrawingOptions.usesLineFragmentOrigin, attributes: textAttributes, context: nil)
}

let labelText = "竖排文字"



		