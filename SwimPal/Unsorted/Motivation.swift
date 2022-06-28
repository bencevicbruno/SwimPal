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
    
    static var sampleKarlo = Motivation(motivation: "Kakav sam ja trening sinoć odradio...", quotee: "Karlo Adžić", imageURL: "www.google.com", placeholderName: "sample_karlo")
    static var sampleBruno = Motivation(motivation: "Eat pasta and you'll get fasta!", quotee: "Bruno Fratus", imageURL: "www.google.com", placeholderName: "sample_bruno")
    static var sampleMichael = Motivation(motivation: "I am speed. Yes.", quotee: "Michale Phelps", imageURL: "www.google.com", placeholderName: "sample_michael")
    
    static var samples = [sampleKarlo, sampleBruno, sampleMichael]
}
