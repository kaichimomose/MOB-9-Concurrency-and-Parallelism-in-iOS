import Foundation
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true

// Identify the critical section

func sleepOnTheBed() {
    print("Good night!")
}
var roomIsAvailable = true

let serialQueue = DispatchQueue(label: "serialQueue")

// We booking rooms in a hotel
// Enter if the room is available
// Thread A ---->

if (roomIsAvailable) {
    // Room is ocupado
    roomIsAvailable = false
    sleepOnTheBed()
    roomIsAvailable = true
} else {
    // Room is not available, wait or do something else
    print("Room is not available")
}

if (roomIsAvailable) {
    // Room is ocupado
    roomIsAvailable = false
    sleepOnTheBed()
    roomIsAvailable = true
} else {
    // Room is not available, wait or do something else
    print("Room is not available")
}

//serialQueue.sync {
//    if (roomIsAvailable) {
//        // Room is ocupado
//        roomIsAvailable = false
//        sleepOnTheBed()
//        roomIsAvailable = true
//    } else {
//        // Room is not available, wait or do something else
//        print("Room is not available")
//    }
//
//    if (roomIsAvailable) {
//        // Room is ocupado
//        roomIsAvailable = false
//        sleepOnTheBed()
//        roomIsAvailable = true
//    } else {
//        // Room is not available, wait or do something else
//        print("Room is not available")
//    }
//}

// Thread B ---->
//DispatchQueue.global().asyncAfter(deadline: .now() + 3) {
//    if (roomIsAvailable) {
//        // Room is ocupado
//        roomIsAvailable = false
//        sleepOnTheBed()
//        roomIsAvailable = true
//    } else {
//        // Room is not available, wait or do something else
//        print("Room is not available")
//    }
//}







