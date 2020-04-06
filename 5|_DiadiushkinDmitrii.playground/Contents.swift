import UIKit

enum WindowStatus {
    case Open, Closed
}

enum EngineStatus {
    case Started, Stopped
}

protocol Car{
    var Model: String {get}
    var Prod_Year: Int {get}
    var Window_Status: WindowStatus {get set}
    var Engine_Status: EngineStatus {get set}
    
    mutating func engineAction(Action: EngineStatus)
}

extension Car{
    mutating func engineAction(Action: EngineStatus) {
        switch Action {
        case .Stopped where Action == self.Engine_Status:
            print("Engine already stopped\n")
        case .Stopped:
            self.Engine_Status = Action
            print("Engine stopped\n")
        case .Started where Action == self.Engine_Status:
            print("Engine already started\n")
        case .Started:
            self.Engine_Status = Action
            print("Engine started\n")
        }
    }
    mutating func windowAction(Action: WindowStatus){
        switch Action {
        case .Open where Action == self.Window_Status:
            print("Window already open\n")
        case .Open:
            self.Window_Status = Action
            print("Window opened\n")
        case .Closed where Action == self.Window_Status:
            print("Window already closed\n")
        case .Closed:
            self.Window_Status = Action
            print("Window closed\n")
        }
    }
}

class tankCar: Car{
    
    let Model: String
    let Prod_Year: Int
    var Window_Status: WindowStatus = .Closed
    var Engine_Status: EngineStatus = .Stopped
    
    let Tank_Cap: Int
    var Tank_Load: Int
    
    init(Mod: String, Prod: Int, Tank_Capacity TankCap: Int, TankLoad: Int) {
        self.Model = Mod
        self.Prod_Year = Prod
        self.Tank_Cap = TankCap
        
        if (TankLoad < TankCap) && (TankLoad >= 0){
            self.Tank_Load = TankLoad
        }else {
            print("Can't load \(TankLoad)l.\n")
            self.Tank_Load = 0
        }
    }
}

extension tankCar: CustomStringConvertible {
    var description: String {
        return "Truck model: \(Model)\nProduction year: \(Prod_Year)\nTank loading: \(Tank_Load)/\(Tank_Cap) l.\nEngine is \(Engine_Status). Window is \(Window_Status).\n"
    }
    
    enum TankLoading {
        case Tank_Load(kg: Int)
        case Tank_Unload(kg: Int)
    }
    
    func tankLoad(tank_status: TankLoading) {
        switch tank_status {
        case let .Tank_Load(volume) where (volume + Tank_Load) > Tank_Cap:
            print("You're trying to load more than you can.\n")
        case let .Tank_Load(volume):
            self.Tank_Load = Tank_Load + volume
            print("You loaded \(volume) l. Now loaded \(Tank_Load)/\(Tank_Cap) l.\n")
        case let .Tank_Unload(volume) where (Tank_Load - volume) < 0:
            print("You try to unload more than you have\n")
        case let .Tank_Unload(volume):
            self.Tank_Load = Tank_Load - volume
            print("You unloaded \(volume) l. Now loaded \(Tank_Load)/\(Tank_Cap) l.\n")
        }
    }
    
}

var Man = tankCar(Mod: "Man", Prod: 2015, Tank_Capacity: 20000, TankLoad: 2000)

Man.engineAction(Action: .Started)
Man.engineAction(Action: .Started)
Man.engineAction(Action: .Stopped)
Man.engineAction(Action: .Stopped)

Man.tankLoad(tank_status: .Tank_Load(kg: 19000))
Man.tankLoad(tank_status: .Tank_Load(kg: 17000))

Man.tankLoad(tank_status: .Tank_Unload(kg: 20000))
Man.tankLoad(tank_status: .Tank_Unload(kg: 19000))
print(Man.description)

class sportCar: Car{
    let Model: String
    let Prod_Year: Int
    var Window_Status: WindowStatus = .Closed
    var Engine_Status: EngineStatus = .Stopped
    
    
    var burst_cap = 100
    
    init(Mod: String, Prod: Int) {
        self.Model = Mod
        self.Prod_Year = Prod
    }
}

extension sportCar: CustomStringConvertible {
    var description: String {
        return "Car model: \(Model)\nProduction year: \(Prod_Year)\nBurst status: \(burst_cap)/100%\nEngine is \(Engine_Status). Window is \(Window_Status).\n"
    }
    
    enum BurstUsing {
        case use(perc: Int)
        case charge(perc: Int)
    }
    
    func burstUsing(burst: BurstUsing) {
        switch burst {
        case let .use(perc) where (perc > burst_cap && perc > 0 && perc <= 100):
            print("You're trying to use more burst you have. Please, recharge burst.\n")
        case let .use(perc) where (perc < 0):
            print("You can't use \(perc)% of burst\n")
        case .use where self.Engine_Status == .Stopped:
            print("Engine is stopped. Start your engine to use burst.\n")
        case let .use(perc):
            self.burst_cap = burst_cap - perc
            print("You used \(perc)% of burst.")
            self.burst_status()
        case let .charge(perc) where perc + burst_cap > 100:
            print("You're trying to charge more than 100%")
            self.burst_cap = 100
            self.burst_status()
        case let .charge(perc) where perc < 0:
            print("You can't charge \(perc)%\n")
        case let .charge(perc):
            self.burst_cap = burst_cap + perc
            print("You charged \(perc)% of burst.")
            self.burst_status()
        }
    }
    
    func burst_status() {
        print("Burst status:\(burst_cap)/100%.\n")
    }
}

var Auston = sportCar(Mod: "Auston Martin DB9", Prod: 2007)

Auston.burstUsing(burst: .use(perc: 60))
Auston.engineAction(Action: .Started)
Auston.burstUsing(burst: .use(perc: 60))
Auston.burstUsing(burst: .use(perc: 60))

Auston.burstUsing(burst: .charge(perc: -100))
Auston.burstUsing(burst: .charge(perc: 40))
Auston.burstUsing(burst: .charge(perc: 40))

print(Auston.description)
