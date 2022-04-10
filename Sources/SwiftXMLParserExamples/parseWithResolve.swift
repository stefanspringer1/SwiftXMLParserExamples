import Foundation

class MyParserDelegateWithResolve: MyParserDelegate {
    
    // Sent by a parser object to its delegate when it encounters a given external entity with a specific system ID.
    override func parser(_ parser: XMLParser, resolveExternalEntityName name: String, systemID: String?) -> Data? {
        print("resolve external entity name: name \"\(name)\", system id \"\(systemID ?? "")\"")
        return nil
    }
}

func parseWithResolve(
    fileURLWithPath: String
) {
    let url = URL(fileURLWithPath: fileURLWithPath)
    if let xmlParser = XMLParser(contentsOf: url) {
        
        xmlParser.shouldResolveExternalEntities = true // has to be set to true to get the declaration
        xmlParser.externalEntityResolvingPolicy = XMLParser.ExternalEntityResolvingPolicy.never
        
        let myParserDelegate = MyParserDelegateWithResolve() // just prints
        xmlParser.delegate = myParserDelegate
        xmlParser.parse()
    }
}
