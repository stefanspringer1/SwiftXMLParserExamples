# SwiftXMLParserExamples

Project with some examples of using the XMLParser from Swift Foundation.

The XML samples used are in the subdirectory `Samples`.

Run with the current directoy set to the project directory, e.g. run the script `run.sh`.

What I wouild like to achieve:

- Report all entity declarations.
- If possible, report the other information in the doctype declaration besides the internal subset (public and system identifiers for the document).
- Report all entities as they are used, even if they are not declared, do not resolve any of them.
- Do not try to validate the document, and do not report an error for any entity that is used but not declared.

See the output of the program for the errors.