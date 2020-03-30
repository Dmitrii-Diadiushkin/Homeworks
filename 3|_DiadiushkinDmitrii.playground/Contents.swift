import UIKit

enum WindowStatus {
    case Open
    case Closed
}

enum EngineStatus {
    case Started
    case Stopped
}

enum CargoLoading {
    case Cargo_Load(kg: Int)
    case Cargo_Unload(kg: Int)
}

struct Car{
    var Car_model: String
    var Prod_Year: Int
    var Trunk_Cap: Int
    var Cargo_Loaded: Int
    var Window_Status: WindowStatus
    var Engine_Status: EngineStatus
    
    init(CarModel: String, ProdYear: Int, Trunk_Capacity: Int, Cargo_Loaded: Int, Window: WindowStatus, Engine: EngineStatus) {
        self.Car_model = CarModel
        self.Prod_Year = ProdYear
        self.Trunk_Cap = Trunk_Capacity
        self.Window_Status = Window
        self.Engine_Status = Engine
        if (Cargo_Loaded < Trunk_Capacity) && (Cargo_Loaded >= 0){
            self.Cargo_Loaded = Cargo_Loaded
        }else {
            print("Can't load \(Cargo_Loaded)kg.")
            self.Cargo_Loaded = 0
        }
    }
    
    func loaded_cargo() {
        print("\(Cargo_Loaded)kg loaded in trunk")
    }
    
    func car_status() {
        print("")
        print("Car information:")
        print("Car model: \(Car_model)")
        print("Year of production: \(Prod_Year)")
        print("Trunk capacity: \(Trunk_Cap)")
        print("Trunk is loaded at \(Cargo_Loaded). Can be loaded \(Trunk_Cap - Cargo_Loaded)kg more.")
        print("Window is \(Window_Status)")
        print("Engine is \(Engine_Status)")
    }
    
    mutating func cargo_load(cargo_status: CargoLoading) {
        switch cargo_status {
        case let .Cargo_Load(massa) where (massa + Cargo_Loaded) > Trunk_Cap:
            print("Overload")
        case let .Cargo_Load(massa):
            self.Cargo_Loaded = Cargo_Loaded + massa
        case let .Cargo_Unload(massa) where (Cargo_Loaded - massa) < 0:
            print("You try to unload more than you have")
        case let .Cargo_Unload(massa):
            self.Cargo_Loaded = Cargo_Loaded - massa
        }
    }
}

struct Truck{
    var Truck_model: String
    var Prod_Year: Int
    var Trunk_Cap: Int
    var Cargo_Loaded: Int
    var Window_Status: WindowStatus
    var Engine_Status: EngineStatus
    
    init(TruckModel: String, ProdYear: Int, Trunk_Capacity: Int, Cargo_Loaded: Int, Window: WindowStatus, Engine: EngineStatus) {
        self.Truck_model = TruckModel
        self.Prod_Year = ProdYear
        self.Trunk_Cap = Trunk_Capacity
        self.Window_Status = Window
        self.Engine_Status = Engine
        if (Cargo_Loaded < Trunk_Capacity) && (Cargo_Loaded >= 0){
            self.Cargo_Loaded = Cargo_Loaded
        }else {
            print("Can't load \(Cargo_Loaded)kg.")
            self.Cargo_Loaded = 0
        }
    }
    
    func loaded_cargo() {
        print("\(Cargo_Loaded)kg loaded in trunk")
    }
    
    func truck_status() {
        print("")
        print("Truck information:")
        print("Truck model: \(Truck_model)")
        print("Year of production: \(Prod_Year)")
        print("Trunk capacity: \(Trunk_Cap)")
        print("Trunk is loaded at \(Cargo_Loaded). Can be loaded \(Trunk_Cap - Cargo_Loaded)kg more.")
        print("Window is \(Window_Status)")
        print("Engine is \(Engine_Status)")
    }
    
    mutating func cargo_load(cargo_status: CargoLoading) {
        switch cargo_status {
        case let .Cargo_Load(massa) where (massa + Cargo_Loaded) > Trunk_Cap:
            print("Overload")
        case let .Cargo_Load(massa):
            self.Cargo_Loaded = Cargo_Loaded + massa
        case let .Cargo_Unload(massa) where (Cargo_Loaded - massa) < 0:
            print("You try to unload more than you have")
        case let .Cargo_Unload(massa):
            self.Cargo_Loaded = Cargo_Loaded - massa
        }
    }
}
var AC = Car(CarModel: "AC", ProdYear: 2012, Trunk_Capacity: 500, Cargo_Loaded: 200, Window: .Closed, Engine: .Stopped)

AC.loaded_cargo()

AC.cargo_load(cargo_status: .Cargo_Load(kg: 300))
AC.loaded_cargo()

AC.cargo_load(cargo_status: .Cargo_Unload(kg: 501))
AC.loaded_cargo()

AC.Window_Status = .Open
AC.car_status()

AC.Engine_Status = .Started
AC.Prod_Year = 2015
AC.cargo_load(cargo_status: .Cargo_Unload(kg: 250))
AC.car_status()

var Scania = Truck(TruckModel: "Scania", ProdYear: 2005, Trunk_Capacity: 5000, Cargo_Loaded: 4000, Window: .Open, Engine: .Started)

Scania.truck_status()
