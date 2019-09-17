import Foundation



// Complete the repeatedString function below.
func repeatedString(s: String, n: Int) -> Int {
    
    let sLength = s.count
    
    if(s.filter { $0 == "a" }.count == sLength) {
        return n
    }
    
    let numberOfRepeats = n / sLength
    
    let lastStringLength = n % sLength
    
    var lastString = ""
    
    var occurrenciesOfA = s.filter { $0 == "a" }.count
    
    occurrenciesOfA *= numberOfRepeats
    
    if (lastStringLength != 0) {
        lastString = String(s.prefix(lastStringLength))
        occurrenciesOfA += lastString.filter { $0 == "a" }.count
    }
    
    return occurrenciesOfA
    
}

repeatedString(s: "aba", n: 100000)


let stdout = ProcessInfo.processInfo.environment["OUTPUT_PATH"]!
FileManager.default.createFile(atPath: stdout, contents: nil, attributes: nil)
let fileHandle = FileHandle(forWritingAtPath: stdout)!

guard let s = readLine() else { fatalError("Bad input") }

guard let n = Int((readLine()?.trimmingCharacters(in: .whitespacesAndNewlines))!)
    else { fatalError("Bad input") }

let result = repeatedString(s: s, n: n)

fileHandle.write(String(result).data(using: .utf8)!)
fileHandle.write("\n".data(using: .utf8)!)


