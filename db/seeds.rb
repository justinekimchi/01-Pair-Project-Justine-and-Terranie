
c1 = Customer.create(name: "Daphne Blake", address: "2222 Haunted House Lane", phone_number: 4078808608, email: "daphneb@gmail.com")
c2 = Customer.create(name: "Fred Jones", address: "3333 Marigold Street", phone_number: 8325558878, email: "freddyj@hotmail.com")
c3 = Customer.create(name: "Velma Dinkley", address: "7777 Austin Powers Drive", phone_number: 9873256721, email: "queenv@yahoo.com")
c4 = Customer.create(name: "Shaggy Rogers", address: "5555 Reina Boulevard", phone_number: 6785554321, email: "shaggman@gmail.com")

v1 = Vehicle.create(make: "Ford", model: "F150", customer_id: 1, vehicle_type: "Truck")
v2 = Vehicle.create(make: "Ford", model: "Courier", customer_id: 1, vehicle_type: "Van")
v3 = Vehicle.create(make: "Nissan", model: "Sentra", customer_id: 2, vehicle_type: "Sedan")
v4 = Vehicle.create(make: "Chevrolet", model: "Corvette", customer_id: 3, vehicle_type: "Coupe")
v5 = Vehicle.create(make: "Toyota", model: "Tundra", customer_id: 4, vehicle_type: "Truck")

p1 = Package.create(name: "Exterior Auto Detailing" , features: "Hand washing and drying, waxing and buffing, rim cleaning and polishing, degreasing and debugging." , price: 100)
p2 = Package.create(name: "Interior Auto Detailing", features: "Seat cleaing, interior surface cleaning, floor cleaning, and deodorizing", price: 100)
p3 = Package.create(name: "Protective Restorative Treatments", features: "Headlight restoration, engine wash, exterior coating, and minor dent repair", price: 100)

s1 = Service.create(customer_id: c1, vehicle_id: v1, package_id: p1)
s2 = Service.create(customer_id: c1, vehicle_id: v2, package_id: p2)
s3 = Service.create(customer_id: c1, vehicle_id: v2, package_id: p3)
s4 = Service.create(customer_id: c2, vehicle_id: v3, package_id: p1)
s5 = Service.create(customer_id: c3, vehicle_id: v4, package_id: p1)
s6 = Service.create(customer_id: c4, vehicle_id: v5, package_id: p2)