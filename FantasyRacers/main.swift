//
//  main.swift
//  FantasyRacers
//
//  Created by Chris Home on 11/06/2016.
//  Copyright © 2016 Christoher Fonseka. All rights reserved.
//

import Foundation

func doTheThing()
{
    do
    {
        let csv     = try FileGrabber.getFantasyRacersCSV()
        let drivers = try CSV.parse (csv)
        
        let data = Database(drivers: drivers)
        
        let top = data.getTopTeams(.monaco, top: 3, teamValue: 50.0, teamSize: 4)
        
        for team in top
        {
            let points = Database.getTotalPoints(team, location: .monaco)
            let value  = Database.getTotalValue (team, location: .monaco)
            print("\(team) = \(points) = \(value)")
        }
    }
        
    catch FileGrabber.FileError.fileNotFound  { print("File Not Found")  }
    catch FileGrabber.FileError.fileReadError { print("File Read Error") }
    catch CSV.CSVError.dataParseError         { print("Data Read Error") }
    catch { print("Unknown Error") }
    
}

print("Running")

doTheThing();
