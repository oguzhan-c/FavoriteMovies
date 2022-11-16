import UIKit

UIFont.familyNames.forEach({ familyName in
    let fontNames = UIFont.fontNames(forFamilyName: familyName)
    print(familyName, fontNames)
})
