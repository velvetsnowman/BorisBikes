Boris Bikes
=================

To play around with my code follow these instructions:

* In your terminal in the directory you wish run

```
* git clone https://github.com/velvetsnowman/BorisBikes.git
* cd BorisBikes
```

```
* require './lib/docking_station.rb'
* ClaphamStation = DockingStation.new
* bike1 = Bike.new
* bike2 = Bike.new
etc
```

* You can also instantiate DockingStation with an argument (n) to change the default capacity from 5 to n (ie. DockingStation.new(n))

```
ClaphamStation.dock(bike1)
```

```
ClaphamStation.release_bike
```

* For testing please run

```
* rspec
```

* Enjoy

```
As a person,
So that I can use a bike,
I'd like a docking station to release a bike.

As a person,
So that I can use a good bike,
I'd like to see if a bike is working
```

```
As a member of the public
So I can return bikes I've hired
I want to dock my bike at the docking station
```

```
As a member of the public
So I can decide whether to use the docking station
I want to see a bike that has been docked
```

```
As a member of the public,
So that I am not confused and charged unnecessarily,
I'd like docking stations not to release bikes when there are none available.
```

```
As a maintainer of the system,
So that I can control the distribution of bikes,
I'd like docking stations not to accept more bikes than their capacity.
```

```
As a system maintainer,
So that I can plan the distribution of bikes,
I want a docking station to have a default capacity of 20 bikes.
```

```
As a system maintainer,
So that busy areas can be served more effectively,
I want to be able to specify a larger capacity when necessary.
```

```
As a member of the public,
So that I reduce the chance of getting a broken bike in future,
I'd like to report a bike as broken when I return it.
```

```
As a maintainer of the system,
So that I can manage broken bikes and not disappoint users,
I'd like docking stations not to release broken bikes.
```

```
As a maintainer of the system,
So that I can manage broken bikes and not disappoint users,
I'd like docking stations to accept returning bikes (broken or not).

```
