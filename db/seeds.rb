customer1 = Customer.create(first_name: 'John', last_name: 'Doe', email: 'john@gmail.com', address: '123 Main St')
customer2 = Customer.create(first_name: 'Jane', last_name: 'Doe', email: 'jane@gmail.com', address: '456 Main St')

subscription1 = Subscription.create(title: 'Monthly', price: 10.00, status: 'active', frequency: 6)
subscription2 = Subscription.create(title: 'Weekly', price: 5.00, status: 'active', frequency: 12)

tea1 = Tea.create(title: 'Green Tea', description: 'Green tea is a type of tea that is made from Camellia sinensis leaves and buds that have not undergone the same withering and oxidation process used to make oolong teas and black teas.', temperature: 180, brew_time: 3)
tea2 = Tea.create(title: 'Black Tea', description: 'Black tea is a type of tea that is more oxidized than oolong, green, and white teas. Black tea is generally stronger in flavor than other teas.', temperature: 212, brew_time: 5)
