import Foundation

// Complete the countingValleys function below.
func countingValleys(n: Int, s: String) -> Int {
    
    var ar = Array(s)
    var path = 0
    var count = 0
    
    for i in 0...ar.count-1
    {
        if(ar[i] == "U")
        {
            if(path < 0 && path+1 == 0)
            {
                count += 1
            }
            path += 1
        }
        else if(ar[i] == "D") {
            path -= 1
        }
    }
    
    return count
}

let stdout = ProcessInfo.processInfo.environment["OUTPUT_PATH"]!
FileManager.default.createFile(atPath: stdout, contents: nil, attributes: nil)
let fileHandle = FileHandle(forWritingAtPath: stdout)!

guard let n = Int((readLine()?.trimmingCharacters(in: .whitespacesAndNewlines))!)
    else { fatalError("Bad input") }

guard let s = readLine() else { fatalError("Bad input") }

let result = countingValleys(n: n, s: s)

fileHandle.write(String(result).data(using: .utf8)!)
fileHandle.write("\n".data(using: .utf8)!)
