//
//  Extensions.swift
//  FantasyRacers
//
//  Created by Chris Home on 11/06/2016.
//  Copyright © 2016 Christoher Fonseka. All rights reserved.
//

import Foundation

extension Array
{
    private func uniquePermutations(_ listA: [Element], listB: [Element], output: inout [[Element]], withPredicate predicate: (([Element]) -> Bool)?)
    {
        if let unwrappedPredicate = predicate
        {
            if (unwrappedPredicate(listA))
            {
                output.append(listA)
            }
        }
        else
        {
            output.append(listA)
        }

        if (!listB.isEmpty)
        {
            for (index, element) in listB.enumerated()
            {
                var newA = listA; newA.append(element)
                var newB = listB; newB.removeSubrange(0...index)

                uniquePermutations(newA, listB: newB, output: &output, withPredicate: predicate)
            }
        }
    }

    func uniquePermutations() -> [[Element]]
    {
        var output = [[Element]]()
        uniquePermutations([], listB: self, output: &output, withPredicate: nil)
        return output
    }

    func uniquePermutations(withPredicate predicate: @escaping ([Element]) -> Bool)  -> [[Element]]
    {
        var output = [[Element]]()
        uniquePermutations([], listB: self, output: &output, withPredicate: predicate)
        return output
    }
}
