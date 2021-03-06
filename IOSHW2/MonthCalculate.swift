//
//  MonthCalculate.swift
//  IOSHW2
//
//  Created by wuyue on 3/5/16.
//  Copyright © 2016 wuyue. All rights reserved.
//

import Foundation

class MonthCalculate: NSObject{
    static let monthArray = ["Jan","Feb", "Mar", "Apr","May","June", "July", "Aug", "Sept", "Oct", "Nov", "Dec"]
    
    
    
    
    class func getDaysCount(month:Int, year:Int)->Int{
        switch (month) {
        case 1:
            return 31
        case 3:
            return 31
        case 4:
            return 30
        case 5:
            return 31
        case 6:
            return 30
        case 7:
            return 31
        case 8:
            return 31
        case 9:
            return 30
        case 10:
            return 31
        case 11:
            return 30
        case 12:
            return 31
        default:
            break
        }
        if(year % 400 == 0 || (year % 100 != 0 && year % 4 == 0))
        {
            return 29
        }
        else {
            return 28
        }
    }
    
    class func getLastMonth(passInDate: NSDateComponents)->NSDateComponents{
        let newMonthYearComponents = passInDate.copy() as! NSDateComponents
        if passInDate.month == 1 {
            newMonthYearComponents.setValue(12, forComponent: NSCalendarUnit.Month)
            newMonthYearComponents.setValue(passInDate.year - 1, forComponent: NSCalendarUnit.Year)
        } else {
            newMonthYearComponents.setValue(passInDate.month - 1, forComponent: NSCalendarUnit.Month)
            newMonthYearComponents.setValue(passInDate.year, forComponent: NSCalendarUnit.Year)
        }
        return newMonthYearComponents
    }
    
    class func getNextMonth(passInDate: NSDateComponents)->NSDateComponents{
        let newMonthYearComponents = passInDate.copy() as! NSDateComponents
        if passInDate.month == 12 {
            newMonthYearComponents.setValue(1, forComponent: NSCalendarUnit.Month)
            newMonthYearComponents.setValue(passInDate.year + 1, forComponent: NSCalendarUnit.Year)
        } else {
            newMonthYearComponents.setValue(passInDate.month + 1, forComponent: NSCalendarUnit.Month)
            newMonthYearComponents.setValue(passInDate.year, forComponent: NSCalendarUnit.Year)
        }
        return newMonthYearComponents
    }
    
    
    class func getStartIndex(passDate : NSDateComponents)->Int{
        let month = passDate.month
        let year = passDate.year
        var baseNumber:Int
        var startIndex:Int
        if(year % 400 == 0 || (year % 100 != 0 && year % 4 == 0))
        {
            switch (month) {
            case 1:
                baseNumber = 0
                
            case 2:
                baseNumber = 3
                
            case 3:
                baseNumber = 4
                
            case 4:
                baseNumber = 0
                
            case 5:
                baseNumber = 2
                
            case 6:
                baseNumber = 5
                
            case 7:
                baseNumber = 0
                
            case 8:
                baseNumber = 3
                
            case 9:
                baseNumber = 6
                
            case 10:
                baseNumber = 1
                
            case 11:
                baseNumber = 4
                
            case 12:
                baseNumber = 6
                
            default:
                baseNumber = 0
            }
            startIndex = (year + year/4 + year/400 - year/100 - 2 + baseNumber + 1) % 7
        }
        else
        {
            switch (month) {
            case 1:
                baseNumber = 0
            case 2:
                baseNumber = 3
            case 3:
                baseNumber = 3
            case 4:
                baseNumber = 6
            case 5:
                baseNumber = 1
            case 6:
                baseNumber = 4
            case 7:
                baseNumber = 6
            case 8:
                baseNumber = 2
            case 9:
                baseNumber = 5
            case 10:
                baseNumber = 0
            case 11:
                baseNumber = 3;
                break;
            case 12:
                baseNumber = 5
            default:
                baseNumber = 0
            }
            startIndex = (year + year/4 + year/400 - year/100 - 1 + baseNumber + 1) % 7
        }
        return startIndex
    }
}