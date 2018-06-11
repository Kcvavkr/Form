import Vapor
import FluentProvider
import Sessions
import SMTP
import Transport
import Foundation

final class Routes: RouteCollection {
    let view: ViewRenderer
    init(_ view: ViewRenderer) {
        self.view = view
    }

    func build(_ builder: RouteBuilder) throws {
        /// GET /
        

        builder.get("") { req in
            
            return try self.view.make("index.html")
        }
        
        builder.post("") { request in
            var count = 0
            guard let name = request.data["SchoolName"]?.string else {
                print("name not  found")
                throw Abort.badRequest
            }
            guard let event = request.data["Event"]?.string else {
                throw Abort.badRequest
            }
			guard let gender = request.data["Gender"]?.string else {
				throw Abort.badRequest()
			}
            guard let category = request.data["Category"]?.string else {
                throw Abort.badRequest
            }
            guard let p1 = request.data["P1Name"]?.string else {
                throw Abort.badRequest
            }
            guard let p1Age = request.data["P1DOB"]?.string else {
                throw Abort.badRequest
            }
            
            let p2 = request.data["P2Name"]?.string ?? ""
            let p3 = request.data["P3Name"]?.string ?? ""
            let p4 = request.data["P4Name"]?.string ?? ""
            let p5 = request.data["P5Name"]?.string ?? ""
            let p6 = request.data["P6Name"]?.string ?? ""
            let p7 = request.data["P7Name"]?.string ?? ""
            let p8 = request.data["P8Name"]?.string ?? ""
            let p9 = request.data["P9Name"]?.string ?? ""
            let p10 = request.data["P10Name"]?.string ?? ""
            
            let p2Age = request.data["P2DOB"]?.string ?? ""
            let p3Age = request.data["P3DOB"]?.string ?? ""
            let p4Age = request.data["P4DOB"]?.string ?? ""
            let p5Age = request.data["P5DOB"]?.string ?? ""
            let p6Age = request.data["P6DOB"]?.string ?? ""
            let p7Age = request.data["P7DOB"]?.string ?? ""
            let p8Age = request.data["P8DOB"]?.string ?? ""
            let p9Age = request.data["P9DOB"]?.string ?? ""
            let p10Age = request.data["P10DOB"]?.string ?? ""
            
            if event != "football" && event != "basketball" {
                if category == "u12" {
                    return try self.view.make("index.html")
                }
            }
            
			let school = School(name: name, event: event, category: category, gender: gender, p1: p1, p2: p2, p3: p3, p4: p4, p5: p5, p6: p6, p7: p7, p8: p8, p9: p9, p10: p10, p1Age: p1Age, p2Age: p2Age, p3Age: p3Age, p4Age: p4Age, p5Age: p5Age, p6Age: p6Age, p7Age: p7Age, p8Age: p8Age, p9Age: p9Age, p10Age: p10Age)
            
            try school.save()
            

            return try self.view.make("Submitted.html")
            
            
        }
        
        builder.get("Database/Search") { req in
            return try self.view.make("DB.html")
        }
        
        
        builder.get("Team", ":id") { req in
            var json = JSON();
            guard let id = req.parameters["id"]?.int else {
                throw Abort.badRequest
            }
            
            guard let school = try School.find(id) else {
                throw Abort.notFound
            }
            
            try json.set("id", school.id?.int ?? 0)
            try json.set("school", school.name)
            try json.set("sport", school.event)
            
            return json
        }
        
        builder.get("Teams/Count") { req in
            let count = try School.count()
            var json = JSON()
            try json.set("count", count)
            return json
        }
        
        
        builder.get("moreInfo", ":id") { req in
            guard let id = req.parameters["id"]?.int else {
                throw Abort.badRequest
            }
            
            guard let school = try School.find(id) else {
                throw Abort.notFound
            }
            
            return try self.view.make("Team", ["school": school.name, "p1": school.p1, "DOB1": school.p1Age,
                                                "p2": school.p2, "DOB2": school.p2Age,
                                                "p3": school.p3, "DOB3": school.p3Age,
                                                "p4": school.p4, "DOB4": school.p4Age,
                                                "p5": school.p5, "DOB5": school.p5Age,
                                                "p6": school.p6, "DOB6": school.p6Age,
                                                "p7": school.p7, "DOB7": school.p7Age,
                                                "p8": school.p8, "DOB8": school.p8Age,
                                                "p9": school.p9, "DOB9": school.p9Age,
                                                "p10": school.p10, "DOB10": school.p10Age,
                                                "888888": "#888888",
												"sport": school.event, "category": school.category, "gender": school.gender])
        }
        
        
       
        
        
        
    }
}
