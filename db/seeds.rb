manager_data = [{ username: 'Riki', password: '123456789' }, { username: 'Bill', password: '123456789' }]
manager_data.each do |manager|
  Manager.create(username: manager[:username], password: manager[:password])
end

FactoryBot.create(:ticket)

department_names = ['Cell Phones', 'TV & Home Theaters', 'Musical Instruments', 'Computers & Tablets']

department_names.each { |name| Department.create(name: name) }
