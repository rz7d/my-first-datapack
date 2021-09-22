interface TradingData {
    AskPrice?: number;
    BidPrice?: number;
}

interface Accessory {
    Type: "Accessory";
    Bonus?: Bonus;
    Effects?: AccessoryEffect[];
    RollData?: {
        IsRolled: boolean;
        Bonus: RollDataEntry<Bonus>;
        Effects: Array<Omit<AccessoryEffect, "Value"> & RollDataEntry<Pick<AccessoryEffect, "Value">>>;
    };
}

interface RollDataValue<T> {
    Min: T;
    Max: T;
}

type RollDataEntry<T> = {
    [Property in keyof T]: RollDataValue<T[Property]>
};

interface Bonus {
    Health: number;
    Mana: number;
    Attack: number;
    Defense: number;
    Intelligence: number;
}

interface ManaAccessoryEffect {
    Type: "Mana";
    Value: {
        RegenInterval: number;
        RegenAmount: number;
        RegenScaledBy: "Constant" | "Capacity" | "CurrentMana"; // 0 = None, 1 = by Capacity (Max Mana), 2 = by Current Mana
    }
}

// TODO: union types
type EquipmentData = Accessory;
type AccessoryEffect = ManaAccessoryEffect;

interface CompoundTag {
    TradingData?: TradingData;
    EquipmentData?: EquipmentData[];
    display?: { Name: string }
}

const EXAMPLE_DATA: CompoundTag = {
    TradingData: {
        AskPrice: 5000,
        BidPrice: 100
    },
    EquipmentData: [{
        Type: "Accessory",
        Bonus: {
            Health: 9999,
            Mana: 100,
            Attack: -9999,
            Defense: -9999,
            Intelligence: -100
        },
        Effects: [
            {
                Type: "Mana",
                Value: {
                    RegenAmount: 1,
                    RegenInterval: 1,
                    RegenScaledBy: "CurrentMana"
                }
            }
        ]

    }]
}

// const json = JSON.stringify(EXAMPLE_DATA, (key, value) => {
//     if (key === "RegenScaledBy") {
//         value = ["Constant", "Capacity", "CurrentMana"].indexOf(value);
//     }
//     if (typeof(value) === "string") {
//         value = `'${value}'`;
//     }
//     return value;
// }).replace(`"`, "");

// console.log(EXAMPLE_DATA);
// console.log(json);
console.dir(EXAMPLE_DATA, { depth: null });


// Output: {TradingData: {SellPrice: 20}, EquipmentData:[{Type: 'Accessory', Bonus: {Mana: 10}, Effects: [{Type: 'Mana', Value: {RegenInterval: 45, RegenAmount: 1, RegenScaledByCapacity: true}}]}], display:{Name:'\"Mana Booster (Common)\"'}}
