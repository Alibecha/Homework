/* 1. Создайте три простых класса с названиями A, B и C где С наследуется от B и B наследуется от А. В каждом инициализаторе класса вызовите метод print(“Я класс <Название класса>”) до и после super.init(). Создайте экземпляр класса С. Посмотрите и поразмышляйте порядок выполнения метода print в отладке.*/

/* 2. Добавьте деинициализаторы для каждого класса в предыдущем примере которые будут печатать “<Название класса> уничтожается”. Создайте экземпляр класса С в блоке do { } вот таким образом:
do {
let c = C()
}
Запустите ваш код, по окончанию блока do { } подсчет ссылок к объекту С будет равен нулю. Посмотрите в каком порядке классы деинициализируются. */

class A {
  init() {
    print("I am class A")
  }
    
    deinit {
        print("A")
    }
}

class B: A {
    override init() {
        print("I am class B")
        super.init() // 6
      print("I am class B")
    }
    
    deinit {
        print("B")
    }
}

class C: B {
    override init() {
        print("I am class C")
        super.init() // 12 - 14
      print("I am class C")
    }
    
    deinit {
        print("C is being removed from memory!")
    }
}
var c = C()

do {
c = C()
}


/* 3. Создайте класс собаки со свойствами имени и возраста собаки без значений по умолчанию. Добавьте инициализатор и метод woof() который должен печатать в отладке слово “wooof”. Наследуя с класса собаки создайте класс домашней собаки со свойством имени владельца собаки без значения по умолчанию. Добавьте инициализатор и переопределите метод woof() чтобы метод не только печатал в отладке слово “wooof” но еще и печатал слово “gaf gaf”. Добавьте вспомогательный инициализатор который принимает два параметра первый имя владельца второй экземпляр собаки. Создайте экземпляры обоих классов и вызовите метод woof() с каждого экземпляра. Создайте экземпляр домашней собаки используя вспомогательный инициализатор. */

class Dogs {
    var name: String
    var age: Int

    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
    func woof() {
        print("woof")
    }
}

class PetDog: Dogs {
    var ownerName: String
    init(name: String, age: Int, ownerName: String) {
        self.ownerName = ownerName
        super.init(name: name, age: age)
    }

    override func woof() {
        super.woof()
        print("gaf-gaf")
    }
    
    convenience init(owner: String, main: Dogs) {
        self.init(name: main.name, age: main.age, ownerName: owner)
    }
}
var class1 = Dogs(name: "Sharik", age: 24)
class1.woof()

var class2 = PetDog(name: "Sharik", age: 32, ownerName: "Donald")
class2.woof()

var example = PetDog.init(owner: "Sharik", main: class1)
example.woof()
