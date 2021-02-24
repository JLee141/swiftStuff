import UIKit

var todaysDate = Date()
let dateFormatter = DateFormatter()
dateFormatter.dateFormat = "dd" // "MMMM dd yyyy" for Month date year
dateFormatter.dateFormat = "MMddyyyy"

var todaysDateInt = Int(dateFormatter.string(from: todaysDate))
dateFormatter.string(from: todaysDate)
