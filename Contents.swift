import Foundation

//How we can create a simple custom operator, below there.

let firstName:String? = "Gülçin"
let lastName : String? = " Çetin"
let fullName = firstName + lastName

// Binary infix because it works with two parameters. it's an infix operator cuz it says in between two values.
func + (
    lhs : String?,
    rhs : String?
) -> String? {
    switch (lhs, rhs) {
    case (.none , .none):
        return nil
    case let (.some(value) , .none ),
        let (.none , .some(value)):
        return value
    case let (.some(lhs) , .some(rhs)):
        return lhs + rhs
    }
}

//Let's create an unary prefix operator.

prefix operator ^
prefix func ^ (value: String) -> String{
    value.uppercased()
}

let lowercaseName = "Gülçin Çetin"
let uppercaseName = ^lowercaseName

//Let's create an unary postfix operator.

postfix operator *
postfix func * (value : String) -> String {
    "*** \(value) ***"
}

let withStars = lowercaseName*

// We can also define our own custom binary infix operators on completely unrelated types.

struct Person {
    let name : String
}

struct Family {
    let members: [Person]
}

func + (
    lhs : Person,
    rhs : Person
) -> Family {
    Family(
        members: [
            lhs,
            rhs
        ]
    )
}

func + (
    lhs : Family,
    rhs : Person
) -> Family {
    var members = family.members
    members.append(rhs)
    return Family(
        members: members
    )
}

func + (
    lhs : Family,
    rhs : [Person]
) -> Family {
    var members = lhs.members
    members.append(contentsOf: rhs)
    return Family(
        members: members
    )
}

let mom = Person(name: "Mom")
let dad = Person(name: "Dad")
let son = Person(name: "Son")
let daughter1 = Person(name: "Daughter 1")
let daughter2 = Person(name: "Daughter 2")

let family = mom + dad
family.members.count

let familyWithSon = family + son
familyWithSon.members.count

let familyWithDaughters = familyWithSon + [
    daughter1,
    daughter2
]
familyWithDaughters.members.count




