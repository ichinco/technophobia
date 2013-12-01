# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

@language = TechnologyType.create(name:"language")
TechnologyProperty.create(display_name:"primary use", property_type:"text", technology_type_id:@language.id)
TechnologyProperty.create(display_name:"supported paradigms", property_type:"text", technology_type_id:@language.id)
TechnologyProperty.create(display_name:"compiler type", property_type:"text", technology_type_id:@language.id)
TechnologyProperty.create(display_name:"type system", property_type:"text", technology_type_id:@language.id)
TechnologyProperty.create(display_name:"memory management", property_type:"text", technology_type_id:@language.id)
TechnologyProperty.create(display_name:"concurrency support", property_type:"text", technology_type_id:@language.id)
TechnologyProperty.create(display_name:"supports pass by reference", property_type:"boolean", technology_type_id:@language.id)
TechnologyProperty.create(display_name:"supports pass by value", property_type:"boolean", technology_type_id:@language.id)

@framework = TechnologyType.create(name:"Web Framework")
TechnologyProperty.create(display_name:"Language", property_type:"technology", technology_type_id:@framework.id)
TechnologyProperty.create(display_name:"ORM", property_type:"technology", technology_type_id:@framework.id)
TechnologyProperty.create(display_name:"Paradigm", property_type:"text", technology_type_id:@framework.id)
TechnologyProperty.create(display_name:"Internationalization", property_type:"boolean", technology_type_id:@framework.id)
TechnologyProperty.create(display_name:"Localization", property_type:"boolean", technology_type_id:@framework.id)
TechnologyProperty.create(display_name:"Testing Framework", property_type:"technology", technology_type_id:@framework.id)
TechnologyProperty.create(display_name:"DB Migration Framework", property_type:"technology", technology_type_id:@framework.id)
TechnologyProperty.create(display_name:"Security Framework", property_type:"technology", technology_type_id:@framework.id)
TechnologyProperty.create(display_name:"Template Framework", property_type:"technology", technology_type_id:@framework.id)
TechnologyProperty.create(display_name:"Caching Framework", property_type:"technology", technology_type_id:@framework.id)
TechnologyProperty.create(display_name:"Build Tool", property_type:"technology", technology_type_id:@framework.id)
TechnologyProperty.create(display_name:"Dependency Manager", property_type:"technology", technology_type_id:@framework.id)

@build = TechnologyType.create(name:"Build Tool")
TechnologyProperty.create(display_name:"Built on language", property_type:"technology", technology_type_id:@build.id)
TechnologyProperty.create(display_name:"Specification language", property_type:"technology", technology_type_id:@build.id)

@dependencies = TechnologyType.create(name:"Dependency Manager")
TechnologyProperty.create(display_name:"Language or framework", property_type:"technology", technology_type_id:@dependencies.id)
TechnologyProperty.create(display_name:"Specification language", property_type:"technology", technology_type_id:@dependencies.id)

@ci = TechnologyType.create(name:"Continuous Integration Tool")
TechnologyProperty.create(display_name:"Build tools", property_type:"technology", technology_type_id:@ci.id)
TechnologyProperty.create(display_name:"Version control", property_type:"technology", technology_type_id:@ci.id)
TechnologyProperty.create(display_name:"Notification", property_type:"text", technology_type_id:@ci.id)
TechnologyProperty.create(display_name:"Integrates with", property_type:"technology", technology_type_id:@ci.id)

@job = TechnologyType.create(name:"Job Scheduler")
TechnologyProperty.create(display_name:"user interface", property_type:"text", technology_type_id:@job.id)
TechnologyProperty.create(display_name:"data storage", property_type:"text", technology_type_id:@job.id)
TechnologyProperty.create(display_name:"OS", property_type:"technology", technology_type_id:@job.id)

@package = TechnologyType.create(name:"Package Manager")
TechnologyProperty.create(display_name:"OS", property_type:"technology", technology_type_id:@package.id)

@orm = TechnologyType.create(name:"ORM")
TechnologyProperty.create(display_name:"Language or framework", property_type:"technology", technology_type_id:@orm.id)
TechnologyProperty.create(display_name:"Databases", property_type:"technology", technology_type_id:@orm.id)

@test = TechnologyType.create(name:"Testing Framework")
TechnologyProperty.create(display_name:"Language or framework", property_type:"technology", technology_type_id:@test.id)

@security = TechnologyType.create(name:"Security Framework")
TechnologyProperty.create(display_name:"Language or framework", property_type:"technology", technology_type_id:@security.id)

@template = TechnologyType.create(name:"Template Framework")
TechnologyProperty.create(display_name:"Language or framework", property_type:"technology", technology_type_id:@template.id)

@cache = TechnologyType.create(name:"Caching Framework")
TechnologyProperty.create(display_name:"Language or framework", property_type:"technology", technology_type_id:@cache.id)

@frontend = TechnologyType.create(name:"Front-end Framework")
TechnologyProperty.create(display_name:"Browser support", property_type:"browser", technology_type_id:@frontend.id)
TechnologyProperty.create(display_name:"Size", property_type:"text", technology_type_id:@frontend.id)
TechnologyProperty.create(display_name:"Feature Detection", property_type:"text", technology_type_id:@frontend.id)
TechnologyProperty.create(display_name:"Paradigm", property_type:"text", technology_type_id:@frontend.id)

@ide = TechnologyType.create(name:"IDE")
TechnologyProperty.create(display_name:"Languages", property_type:"technology", technology_type_id:@ide.id)
TechnologyProperty.create(display_name:"Frameworks", property_type:"technology", technology_type_id:@ide.id)
TechnologyProperty.create(display_name:"Version controls", property_type:"technology", technology_type_id:@ide.id)

@di = TechnologyType.create(name:"Dependency Injection Framework")
TechnologyProperty.create(display_name:"Language", property_type:"technology", technology_type_id:@di.id)
TechnologyProperty.create(display_name:"Specification language", property_type:"technology", technology_type_id:@di.id)

@etl = TechnologyType.create(name:"ETL Tool")
TechnologyProperty.create(display_name:"Databases", property_type:"technology", technology_type_id:@etl.id)
TechnologyProperty.create(display_name:"Language", property_type:"technology", technology_type_id:@etl.id)

@database = TechnologyType.create(name:"Database")
TechnologyProperty.create(display_name:"OS", property_type:"technology", technology_type_id:@database.id)
TechnologyProperty.create(display_name:"ACID", property_type:"boolean", technology_type_id:@database.id)
TechnologyProperty.create(display_name:"Referential Integrity", property_type:"boolean", technology_type_id:@database.id)
TechnologyProperty.create(display_name:"Transactions", property_type:"boolean", technology_type_id:@database.id)
TechnologyProperty.create(display_name:"Unicode support", property_type:"boolean", technology_type_id:@database.id)
TechnologyProperty.create(display_name:"type", property_type:"text", technology_type_id:@database.id)

@os = TechnologyType.create(name:"Operating System")
TechnologyProperty.create(display_name:"Package Managers", property_type:"technology", technology_type_id:@os.id)
TechnologyProperty.create(display_name:"Resource access control", property_type:"text", technology_type_id:@os.id)
TechnologyProperty.create(display_name:"Subsystem isolation mechanism", property_type:"text", technology_type_id:@os.id)
TechnologyProperty.create(display_name:"Integrated firewall", property_type:"boolean", technology_type_id:@os.id)
TechnologyProperty.create(display_name:"Filesystems supported", property_type:"technology", technology_type_id:@os.id)

@fs = TechnologyType.create(name:"Filesystem")
TechnologyProperty.create(display_name:"OSes", property_type:"technology", technology_type_id:@fs.id)
TechnologyProperty.create(display_name:"Hard links", property_type:"boolean", technology_type_id:@fs.id)
TechnologyProperty.create(display_name:"Symbolic links", property_type:"boolean", technology_type_id:@fs.id)
TechnologyProperty.create(display_name:"Block journaling", property_type:"boolean", technology_type_id:@fs.id)
TechnologyProperty.create(display_name:"Metadata-only journaling", property_type:"boolean", technology_type_id:@fs.id)

TechnologyType.create(name:"Virtual Machine")

@cloud = TechnologyType.create(name:"Cloud provider")
TechnologyProperty.create(display_name:"OSes supported", property_type:"technology", technology_type_id:@cloud.id)

@mapreduce = TechnologyType.create(name:"Map/Reduce implementation")
TechnologyProperty.create(display_name:"Languages", property_type:"technology", technology_type_id:@mapreduce.id)

@orch = TechnologyType.create(name:"IT orchestration framework")
TechnologyProperty.create(display_name:"Specification language", property_type:"technology", technology_type_id:@orch.id)

TechnologyType.create(name:"Code-hosting service")

@vcs = TechnologyType.create(name:"Version Control")
TechnologyProperty.create(display_name:"Respository model", property_type:"text", technology_type_id:@vcs.id)
TechnologyProperty.create(display_name:"Concurrency model", property_type:"text", technology_type_id:@vcs.id)
TechnologyProperty.create(display_name:"Storage method", property_type:"text", technology_type_id:@vcs.id)
TechnologyProperty.create(display_name:"Scope of change", property_type:"text", technology_type_id:@vcs.id)

@vcsgui = TechnologyType.create(name:"Version Control GUI")
TechnologyProperty.create(display_name:"Version Control", property_type:"technology", technology_type_id:@vcsgui.id)

@shell = TechnologyType.create(name:"Shell")
TechnologyProperty.create(display_name:"OS", property_type:"technology", technology_type_id:@shell.id)

TechnologyType.create(name:"Web server")

@dbs = TechnologyType.create(name:"Database management tool")
TechnologyProperty.create(display_name:"Databases supported", property_type:"technology", technology_type_id:@dbs.id)

TechnologyType.create(name:"Infrastructure Monitoring")

TechnologyType.create(name:"Realtime monitoring")

TechnologyType.create(name:"Business reporting tool")

TechnologyType.create(name:"Analytics tool")

TechnologyType.create(name:"Mail Server")

TechnologyType.create(name:"Mail Hosting Service")

TechnologyType.create(name:"CRM tool")

TechnologyType.create(name:"Cache")

@browser = TechnologyType.create(name:"Browser")
TechnologyProperty.create(display_name:"OS", property_type:"technology", technology_type_id:@browser.id)