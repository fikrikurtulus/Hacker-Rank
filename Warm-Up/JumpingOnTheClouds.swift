import Foundation

// Complete the jumpingOnClouds function below.
func jumpingOnClouds(c: [Int]) -> Int {
    
    let n = c.count
    var steps = 0
    
    if(n < 2 || n > 100 ||  c[0] != 0 || c[n-1] != 0) {
        return 0
    }
    
    var i = 0
    while(i<n) {
        
        if(c[i] != 0 && c[i] !=  1) {
            return 0
        }
        
        if(i+1 == n-1)
        {
            steps += 1
        } else if(i+2 < n) {
            
            if(c[i]==0  && c[i+1]==1 && c[i+2] == 0)
            {
                steps += 1
                i += 1
            }
            else if(c[i]==0 && c[i+1]==0 && c[i+2]==0)
            {
                steps += 1
                i += 1
            }
            else if(c[i]==0 && c[i+1]==0 && c[i+2]==1)
            {
                steps+=2
                i += 2
            }
            else if(c[i]==0 && c[i+1]==0)
            {
                steps += 1
                i += 1
            }
        }
        i += 1
    }
    return steps
}

jumpingOnClouds(c: [0,0,0,0,1,0])

let stdout = ProcessInfo.processInfo.environment["OUTPUT_PATH"]!
FileManager.default.createFile(atPath: stdout, contents: nil, attributes: nil)
let fileHandle = FileHandle(forWritingAtPath: stdout)!

guard let n = Int((readLine()?.trimmingCharacters(in: .whitespacesAndNewlines))!)
    else { fatalError("Bad input") }

guard let cTemp = readLine() else { fatalError("Bad input") }
let c: [Int] = cTemp.split(separator: " ").map {
    if let cItem = Int($0.trimmingCharacters(in: .whitespacesAndNewlines)) {
        return cItem
    } else { fatalError("Bad input") }
}

guard c.count == n else { fatalError("Bad input") }

let result = jumpingOnClouds(c: c)

fileHandle.write(String(result).data(using: .utf8)!)
fileHandle.write("\n".data(using: .utf8)!)
