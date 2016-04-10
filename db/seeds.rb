# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Category.create(name: 'Verbal Incident')
Category.create(name: 'Physical Incident')
Category.create(name: 'Other')

Report.create(
  latitude: 44.461267,
  longitude: -93.156157,
  description: 'Someone yelled at me from a car.',
  called_911: false,
  category_id: 1,
  ip_address: '123.45.67.89'
)
Report.create(
  latitude: 44.4582983,
  longitude: -93.161604,
  description: 'Someone followed me for a few blocks.',
  called_911: false,
  category_id: 3,
  ip_address: '987.65.43.21'
)

Answer.create(
  content: 'The same thing happened to me on that street.',
  ip_address: '987.65.43.21',
  report_id: 1
)
Answer.create(
  content: "I'd never walk on that street alone.",
  ip_address: '123.45.67.89',
  report_id: 2
)
