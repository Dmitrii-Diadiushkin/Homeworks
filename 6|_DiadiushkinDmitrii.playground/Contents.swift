import UIKit

struct queue<Elem: Comparable>{
    var items = [Elem]()
    
    mutating func add (newElem: Elem){
        items.append(newElem)
    }
    
    mutating func next() {
        items.removeFirst()
        print("Queue moves. Next one is \(items.first!)")
    }
        
    mutating func sorting() -> [Elem]{
        return items.sorted(by: <)
    }
    
    func searching(itemToSearch: Elem){
        print("\(items.filter{$0 == itemToSearch}) found.")
    }
    
    subscript (index: Int) -> String?{
        return (index < items.count ? items[index] : nil) as? String
    }
}

var someQueue = queue<String>(items:["Jessy"])

someQueue.add(newElem: "Richard")
someQueue.add(newElem: "William")

print(someQueue.items)
someQueue.next()

print(someQueue.items)

someQueue.add(newElem: "John")
someQueue.add(newElem: "Adam")

print(someQueue.items)
print("Sorted: \(someQueue.sorting())")

someQueue.searching(itemToSearch: "Adam")

print(someQueue[0]!)
print(someQueue[4])
