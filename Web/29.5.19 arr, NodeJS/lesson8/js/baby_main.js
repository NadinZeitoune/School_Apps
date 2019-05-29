window.onload = function () {
    createCars();
}

function createCars() {
    console.log("cars");
    let newCar = new Car("mazda", "silver");
    newCar.addToHtml();

    let newTruck = new Truck("volvo", "black", "10T");
    newTruck.addToHtml();
    newTruck.addKgToHtml();

    let newPlane = new Plane("Jumbo", "white");
    newPlane.setKmh("800 Kmh");
    newPlane.addKmhToHtml();
}