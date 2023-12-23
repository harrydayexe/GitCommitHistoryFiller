//
//  GitCommitHistoryFiller.swift
//
//
//  Created by Harry Day on 22/12/2023
//
//
//  Twitter: https://twitter.com/harrydayexe
//  Github: https://github.com/harrydayexe

import Foundation
import ArgumentParser
import GitKit

@available(macOS 12.0, *)
@main
struct GitCommitHistoryFiller: AsyncParsableCommand {
    static var configuration = CommandConfiguration(
        abstract: "A utility to generate a Git repo from a csv file of dates and number of commits"
    )
    
    @Argument(
        help: "A csv file to read commit data from",
        completion: .file(), transform: URL.init(fileURLWithPath:))
    var commitDataFile: URL
    
    @Flag(name: .shortAndLong, help: "Include extra information in the output.")
    var verbose = false
    
    func run() async throws {
        let git = Git(path: "./Output/")
        try git.run(.cmd(.initialize))
        let dateParser = DateFormatter()
        dateParser.dateFormat = "dd/MM/yyyy"
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "E, d MMM yyyy HH:mm:ss Z"
        
        for try await line in commitDataFile.lines {
            print("Processing line: \(line)")
            let tokens = line.components(separatedBy: ",")
            let date = dateParser.date(from: tokens[0])!
            if let numOfCommits = Int(tokens[1]) {
                for i in 0..<numOfCommits {
                    try git.run(.raw("commit --allow-empty --date='\(dateFormatter.string(from: date))' -m 'Commit number \(i+1) on \(tokens[0])'"))
                }
            }
        }
    }
}
