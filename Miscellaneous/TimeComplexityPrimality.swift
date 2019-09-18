import Foundation

// Complete the primality function below.
func primality(n: Int) -> String {
    
    if (n <= 1) {
        return "Not prime"
    }
    
    if (n <= 3) {
        return "Prime"
    }
    
    var i = 2
    while ( i*i <= n ) {
        if (n % i) == 0 {
            return "Not prime"
        }
        i = i + 1
    }

    return "Prime"

}

let stdout = ProcessInfo.processInfo.environment["OUTPUT_PATH"]!
FileManager.default.createFile(atPath: stdout, contents: nil, attributes: nil)
let fileHandle = FileHandle(forWritingAtPath: stdout)!

guard let p = Int((readLine()?.trimmingCharacters(in: .whitespacesAndNewlines))!)
    else { fatalError("Bad input") }

for pItr in 1...p {
    guard let n = Int((readLine()?.trimmingCharacters(in: .whitespacesAndNewlines))!)
        else { fatalError("Bad input") }
    
    let result = primality(n: n)
    
    fileHandle.write(result.data(using: .utf8)!)
    fileHandle.write("\n".data(using: .utf8)!)
}
