import UIKit


enum CargoLoading {
    case Cargo_Load(kg: Int)
    case Cargo_Unload(kg: Int)
}

class Vehicle{
    enum WindowStatus {
        case Open
        case Closed
    }

    enum EngineStatus {
        case Started
        case Stopped
    }

    var Model: String
    var Prod_Year: Int
    var Window_Status: WindowStatus
    var Engine_Status: EngineStatus
    
    init(Model: String, ProdYear: Int, Window: WindowStatus, Engine: EngineStatus) {
        self.Model = Model
        self.Prod_Year = ProdYear
        self.Window_Status = Window
        self.Engine_Status = Engine
    }
    
    func vehicle_status() {
        
    }
}

class trunkCar: Vehicle{
    
    enum CargoLoading {
        case Cargo_Load(kg: Int)
        case Cargo_Unload(kg: Int)
    }
    
    let Trunk_Cap: Int
    var Cargo_Loaded: Int
    
    init(Model: String, ProdYear: Int, Trunk_Capacity: Int, Cargo_Loaded: Int, Window: WindowStatus, Engine: EngineStatus){
        
        self.Trunk_Cap = Trunk_Capacity
        
        if (Cargo_Loaded < Trunk_Capacity) && (Cargo_Loaded >= 0){
            self.Cargo_Loaded = Cargo_Loaded
        }else {
            print("Can't load \(Cargo_Loaded)kg.")
            self.Cargo_Loaded = 0
        }
        
        super.init(Model: Model, ProdYear: ProdYear, Window: Window, Engine: Engine)
    }
    
    func cargo_load(cargo_status: CargoLoading) {
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
    
    override func vehicle_status() {
        print("")
        print("Your trunk car information:")
        print("Car model: \(Model)")
        print("Year of production: \(Prod_Year)")
        print("Trunk capacity: \(Trunk_Cap)")
        print("Trunk is loaded at \(Cargo_Loaded). Can be loaded \(Trunk_Cap - Cargo_Loaded)kg more.")
        print("Window is \(Window_Status)")
        print("Engine is \(Engine_Status)")
    }
}

var ford = trunkCar(Model: "Ford F-150", ProdYear: 2015, Trunk_Capacity: 1000, Cargo_Loaded: 100, Window: .Closed, Engine: .Stopped)

ford.cargo_load(cargo_status: .Cargo_Load(kg: 90))
ford.Window_Status = .Open
ford.vehicle_status()

class sportCar: Vehicle{
    
    enum BurstUsing {
        case use(perc: Int)
        case charge(perc: Int)
    }
    
    var burst_cap = 100
    
    func burstUsing(burst: BurstUsing) {
        switch burst {
        case let .use(perc) where (perc > burst_cap && perc > 0 && perc <= 100):
            print("You're trying to use more burst you have. Please, recharge burst.")
        case let .use(perc) where (perc < 0):
            print("You can't use \(perc)% of burst")
        case .use where self.Engine_Status == .Stopped:
            print("Engine is stopped. Start your engine to use burst.")
        case let .use(perc):
            self.burst_cap = burst_cap - perc
            self.burst_status()
        case let .charge(perc) where perc + burst_cap > 100:
            print("You're trying to charge more than 100%")
            self.burst_cap = 100
            self.burst_status()
        case let .charge(perc) where perc < 0:
            print("You can't charge \(perc)%")
        case let .charge(perc):
            self.burst_cap = burst_cap + perc
            self.burst_status()
        }
    }
    
    func burst_status() {
        print("")
        print("You have \(burst_cap)% of burst.")
    }
    override func vehicle_status() {
        print("")
        print("Your sport car information:")
        print("Car model: \(Model)")
        print("Year of production: \(Prod_Year)")
        print("Burst: \(burst_cap)%")
        print("You've used \(100 - burst_cap)% of burst. You can use \(burst_cap)% of burst more.")
        print("Window is \(Window_Status)")
        print("Engine is \(Engine_Status)")
    }
}

var ferrari = sportCar(Model: "Ferrari F40", ProdYear: 1990, Window: .Closed, Engine: .Stopped)

ferrari.burst_status()

ferrari.burstUsing(burst: .use(perc: 50))

ferrari.Engine_Status = .Started
ferrari.burstUsing(burst: .use(perc: 50))

ferrari.burstUsing(burst: .charge(perc: 70))
ferrari.burstUsing(burst: .charge(perc: -10))

ferrari.vehicle_status()
