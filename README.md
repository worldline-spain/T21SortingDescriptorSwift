#T21SortingDescriptor
> Helper type to use Sorting Descriptors in an easy way.

[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-brightgreen.svg)](https://github.com/Carthage/Carthage)
[![CocoaPods compatible](https://img.shields.io/badge/pod-v2.3.0-blue.svg)](https://github.com/CocoaPods/CocoaPods)
[![Swift compatible](https://img.shields.io/badge/Swift-5.0-orange.svg)]()
[![Platform compatible](https://img.shields.io/badge/platform-iOS-lightgrey.svg)]()
[![License](https://img.shields.io/badge/license-Apache--2.0-blue.svg)]()
[![SwiftPM](https://img.shields.io/badge/Swift%20Package%20Manager-compatible-brightgreen.svg)](https://swift.org/package-manager/)

T21SortingDescriptorSwift provides a helper type to use Sorting Descriptors in an easy way. Sorting Descriptors can also be combined to create different sorting levels.

Swift standard language does not include the type SortDescriptor. We may use the Objective-C API NSSortDescrptor class, but this will lead into having to use NSArray for our collections (leading to ugly casts in the code and other stuff). 


## Installation

T21SortingDescriptorSwift is available through [Carthage](https://github.com/Carthage/Carthage), [CocoaPods](https://cocoapods.org) or [Swift Package Manager](https://swift.org/package-manager/).

### Carthage

To install T21SortingDescriptorSwift with Carthage, add the following line to your `Cartfile`.

```ruby
github "worldline-spain/T21SortingDescriptorSwift"
```

Then run `carthage update --no-use-binaries` command or just `carthage update`. For details of the installation and usage of Carthage, visit [its project page](https://github.com/Carthage/Carthage).


### CocoaPods

To install T21SortingDescriptorSwift with CocoaPods, add the following lines to your `Podfile`.

```ruby
source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '10.0' 
use_frameworks!

pod 'T21SortingDescriptorSwift'
```

Then run `pod install` command. For details of the installation and usage of CocoaPods, visit [its official website](https://cocoapods.org).

### Swift Package Manager
To integrate using Apple's Swift Package Manager, add the following as a dependency to your `Package.swift`.

```rubi
.package(url: "https://github.com/worldline-spain/T21SortingDescriptorSwift.git", .upToNextMajor(from: "2.3.0"))
```

For details of the installation and usage of Swift Package Manager, visit [its official website](https://swift.org/package-manager/).

## How to use

### Simple SortDescriptor

Create a simple SortDescriptor using a first function parameter to retrieve the desired key to compare, and then the comparing function as the second parameter. This approach gives a lot of freedom when fetching the keys from the objects.

In the following example we are sorting an array of Persons:

```swift
public class Person {
    
    public var age: Int
    public var name: String
    
    public init(_ age: Int, _ name: String) {
        self.age = age
        self.name = name
    }
}

let personsToSort = [Person(29,"Tom"),Person(10,"Jack"),Person(54,"Ana"),Person(24,"Maria")]
let sortingDescriptor: SortDescriptor<Person> = sortDescriptor({ $0.age })
let personsSortedByAge = personsToSort.sorted(by: sortingDescriptor)

/* Output
	Jack: 10
	Maria: 24
	Tom: 29
	Ana: 54
*/

```

### Combined SortDescriptor

In the following example we are combining 2 different sorting descriptors to apply 2 level sorting.

```swift
let personsToSort = [Person(29,"Tom"),Person(10,"Jack"),Person(54,"Ana"),Person(24,"Maria"),Person(24,"Aurora"),Person(29,"Daniel")]
let sortingDescriptorByAge: SortDescriptor<Person> = sortDescriptor({ $0.age }, >)
let sortingDescriptorByName: SortDescriptor<Person> = sortDescriptor(key: { $0.name }, String.localizedCaseInsensitiveCompare)
let combinedSortingDescriptor = combine(sortDescriptors: [sortingDescriptorByAge,sortingDescriptorByName])
let personsSortedByAgeAndName = personsToSort.sorted(by: combinedSortingDescriptor)

/* Output
	Ana: 54
	Daniel: 29
	Tom: 29
	Aurora: 24
	Maria: 24
	Jack: 10
*/

```

## Authors

* **Eloi Guzman Ceron** - *Initial work* 
* **Edwin Peña** - *Initial work*
* **Salvador Martin** - *Initial work*
* **Marcos Molero** - *Swift 5 integration, Carthage and Swift Package Manager integration*
* **Anan Sadiya** - *Swift 5 integration, Carthage and Swift Package Manager integration* 

See also the list of [contributors](https://github.com/your/project/contributors) who participated in this project.

## License

This project is licensed under the Apache 2.0 License - see the [LICENSE.md](LICENSE.md) file for details

## Acknowledgments

* To Worldline Spain iOS development team.
