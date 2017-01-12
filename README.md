#T21SortingDescriptor

T21SortingDescriptorSwift provides a helper type to use Sorting Descriptors in an easy way. Sorting Descriptors can also be combined to create different sorting levels.

Swift standard language does not include the type SortDescriptor. We may use the Objective-C API NSSortDescrptor class, but this will lead into having to use NSArray for our collections (leading to ugly casts in the code and other stuff). 

## Version 1.0.0


### Simple SortDescriptor

Create a simple SortDescriptor using a first function parameter to retrieve the desired key to compare, and then the comparing function as the second parameter. This approach gives a lot of freedom when fetching the keys from the objects.

In the following example we are sorting an array of Persons:

```

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

/*
Jack: 10
Maria: 24
Tom: 29
Ana: 54
*/

```

### Combined SortDescriptor

In the following example we are combining 2 different sorting descriptors to apply 2 level sorting.

```

let personsToSort = [Person(29,"Tom"),Person(10,"Jack"),Person(54,"Ana"),Person(24,"Maria"),Person(24,"Aurora"),Person(29,"Daniel")]
let sortingDescriptorByAge: SortDescriptor<Person> = sortDescriptor({ $0.age }, >)
let sortingDescriptorByName: SortDescriptor<Person> = sortDescriptor(key: { $0.name }, String.localizedCaseInsensitiveCompare)
let combinedSortingDescriptor = combine(sortDescriptors: [sortingDescriptorByAge,sortingDescriptorByName])
let personsSortedByAgeAndName = personsToSort.sorted(by: combinedSortingDescriptor)

/*
Ana: 54
Daniel: 29
Tom: 29
Aurora: 24
Maria: 24
Jack: 10
*/

```
