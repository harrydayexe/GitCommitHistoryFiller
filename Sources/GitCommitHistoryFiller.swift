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
        for try await line in commitDataFile.lines {
            print(line)
        }
    }
}
