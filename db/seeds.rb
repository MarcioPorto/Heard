# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Category.create(name: 'Verbal Incident')
# Category.create(name: 'Physical Incident')
# Category.create(name: 'Other')

# Report.create(
#   latitude: 42.37051599999999,
#   longitude: -87.8517785,
#   description: 'Hello World!',
#   called_911: true,
#   category_id: 1,
#   ip_address: '123.45.67.89'
# )
# Report.create(
#   latitude: 44.4582983,
#   longitude: -93.161604,
#   description: 'None',
#   called_911: false,
#   category_id: 2,
#   ip_address: '987.65.43.21'
# )
# Report.create(
#   latitude: 51.503407,
#   longitude: -0.127592,
#   description: 'Ruthie is very tired (L-O-L LOL)',
#   called_911: false,
#   category_id: 3,
#   ip_address: '000.00.00.00'
# )
#
# Report.create(
#   latitude: 51.503407,
#   longitude: -0.127592,
#   description: 'Ruthie is very tired (L-O-L LOL)',
#   called_911: false,
#   category_id: 3,
#   ip_address: '::1'
# )

Answer.create(
  content: 'Comment 1',
  ip_address: 'lolololol',
  report_id: 10
)

Answer.create(
  content: 'Comment 2',
  ip_address: 'lolololol',
  report_id: 10
)

Answer.create(
  content: 'Comment 3',
  ip_address: 'lolololol',
  report_id: 10
)
