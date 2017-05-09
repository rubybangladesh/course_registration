# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

c1 = Course.create(course_id: "CSE 3101", course_title: "Theory of Computation", credit: "2.0")
c2 = Course.create(course_id: "CSE 3103", course_title: "Microprocessors and Assembly Languages", credit: "3.0")
c3 = Course.create(course_id: "CSE 3104", course_title: "Microprocessors and Assembly Languages Laboratory", credit: "1.5")

s1 = Semester.create(sem_name: "Summer'15", status: "Done")
s2 = Semester.create(sem_name: "Fall'15", status: "Done")
s3 = Semester.create(sem_name: "Summer'16", status: "Current")
s4 = Semester.create(sem_name: "Fall'16", status: "Due")