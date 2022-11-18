//
//  Motivation.swift
//  SwimPal
//
//  Created by Bruno Benčević on 22.06.2022..
//

import Foundation

struct Motivation {
    let motivation: String
    let quotee: String
    let imageURL: String
    let placeholderName: String?
    
    static var sampleBruno = Motivation(motivation: "Eat pasta and you'll get fasta!", quotee: "Bruno Fratus", imageURL: "www.google.com", placeholderName: "sample_bruno")
    static var sampleMichael = Motivation(motivation: "I am speed. Yes.", quotee: "Michael Phelps", imageURL: "www.google.com", placeholderName: "sample_michael")
    
    static var samples = [sampleBruno, sampleMichael]
}
