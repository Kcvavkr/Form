import Vapor
import Fluent
import FluentProvider

final class School: Model {
    
    var name: String
    var event: String
    var category: String
    var p1: String
    var p2: String?
    var p3: String?
    var p4: String?
    var p5: String?
    var p6: String?
    var p7: String?
    var p8: String?
    var p9: String?
    var p10: String?
    
    var p1Age: String
    var p2Age: String?
    var p3Age: String?
    var p4Age: String?
    var p5Age: String?
    var p6Age: String?
    var p7Age: String?
    var p8Age: String?
    var p9Age: String?
    var p10Age: String?


    let storage = Storage()
    
    init(row: Row) throws {
        name = try row.get("name")
        event = try row.get("event")
        category = try row.get("category")
        p1 = try row.get("p1")
        p2 = try row.get("p2")
        p3 = try row.get("p3")
        p4 = try row.get("p4")
        p5 = try row.get("p5")
        p6 = try row.get("p6")
        p7 = try row.get("p7")
        p8 = try row.get("p8")
        p9 = try row.get("p9")
        p10 = try row.get("p10")
        
        p1Age = try row.get("p1Age")
        p2Age = try row.get("p2Age")
        p3Age = try row.get("p3Age")
        p4Age = try row.get("p4Age")
        p5Age = try row.get("p5Age")
        p6Age = try row.get("p6Age")
        p7Age = try row.get("p7Age")
        p8Age = try row.get("p8Age")
        p9Age = try row.get("p9Age")
        p10Age = try row.get("p10Age")

        
    }
    
    init(name: String, event: String, category: String, p1: String, p2: String?, p3: String?, p4: String?, p5: String?, p6: String?, p7: String?, p8: String?, p9: String?, p10: String?, p1Age: String, p2Age: String?, p3Age: String?, p4Age: String?, p5Age: String?, p6Age: String?, p7Age: String?, p8Age: String?, p9Age: String?, p10Age: String?) {
        self.name = name
        self.event = event
        self.category = category
        
        self.p1 = p1
        self.p2 = p2
        self.p3 = p3
        self.p4 = p4
        self.p5 = p5
        self.p6 = p6
        self.p7 = p7
        self.p8 = p8
        self.p9 = p9
        self.p10 = p10
        
        self.p1Age = p1Age
        self.p2Age = p2Age
        self.p3Age = p3Age
        self.p4Age = p4Age
        self.p5Age = p5Age
        self.p6Age = p6Age
        self.p7Age = p7Age
        self.p8Age = p8Age
        self.p9Age = p9Age
        self.p10Age = p10Age
    }
    
    func makeRow() throws -> Row {
        var row = Row()
        try row.set("name", name)
        try row.set("event", event)
        try row.set("category", category)
        
        try row.set("p1", p1)
        try row.set("p2", p2)
        try row.set("p3", p3)
        try row.set("p4", p4)
        try row.set("p5", p5)
        try row.set("p6", p6)
        try row.set("p7", p7)
        try row.set("p8", p8)
        try row.set("p9", p9)
        try row.set("p10", p10)
        
        try row.set("p1Age", p1Age)
        try row.set("p2Age", p2Age)
        try row.set("p3Age", p3Age)
        try row.set("p4Age", p4Age)
        try row.set("p5Age", p5Age)
        try row.set("p6Age", p6Age)
        try row.set("p7Age", p7Age)
        try row.set("p8Age", p8Age)
        try row.set("p9Age", p9Age)
        try row.set("p10Age", p10Age)

        return row
    }
    
    
}


extension School: Preparation {
    static func prepare(_ database: Database) throws {
        try database.create(self) { schools in
            schools.id()
            schools.string("name")
            schools.string("event")
            schools.string("category")
            
            schools.string("p1")
            schools.string("p2")
            schools.string("p3")
            schools.string("p4")
            schools.string("p5")
            schools.string("p6")
            schools.string("p7")
            schools.string("p8")
            schools.string("p9")
            schools.string("p10")
            
            schools.string("p1Age")
            schools.string("p2Age")
            schools.string("p3Age")
            schools.string("p4Age")
            schools.string("p5Age")
            schools.string("p6Age")
            schools.string("p7Age")
            schools.string("p8Age")
            schools.string("p9Age")
            schools.string("p10Age")

        }
    }
    
    static func revert(_ database: Database) throws {
        try database.delete(self)
    }
}
