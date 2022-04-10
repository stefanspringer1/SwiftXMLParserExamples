import Foundation

let fileManager = FileManager.default

fileManager.changeCurrentDirectoryPath(fileManager.currentDirectoryPath + "/Samples")
print("cwd: [\(fileManager.currentDirectoryPath)]")

let entPath = "external1.ent"
if fileManager.fileExists(atPath: entPath) {
    print("\(entPath) exists")
}
else {
    print("missing \(entPath)")
}

var docPaths = [
    ("test0.xml", "original test case"),
    /*("test1.xml", "short doctype declaration, external entity declared and used"),
    ("test2.xml", "short doctype declaration, external entity declared, but only an (undeclared) internal entity used"),
    ("test3.xml", "like test1.xml, but with more complete doctype declaration"),
    ("test4.xml", "like test2.xml, but with more complete doctype declaration"),*/
]

docPaths.forEach { docPath, description in
    print("\n----- \(docPath): \(description) ------\n")
    do {
        let content = try String(contentsOf: URL(fileURLWithPath: docPath), encoding: .utf8)
        print(content)
        
        print("\n1) parse without resolving external external entity by delegate:\n")
        parse(fileURLWithPath: docPath)
        
        print("\n2) parse with resolving external external entity by delegate:\n")
        parseWithResolve(fileURLWithPath: docPath)
    }
    catch {
        print("MISSIMNG FILE \(docPath)")
    }
}
