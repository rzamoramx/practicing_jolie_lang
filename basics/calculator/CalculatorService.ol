
// import interface
from CalculatorInterfaceModule import CalculatorInterface

// once we imported the contract 
// define the service
service CalculatorService {
    // define the ports (inputs) before
    inputPort CalculatorPort {
        location: "socket://localhost:8000"
        protocol: http { format = "json" }
        interfaces: CalculatorInterface
    }

    // sdefine behaviour
    main {
        // sum operator (aka method)
        [ sum(request)(response) {
            for (t in request.term) {
                response = response + t
            }
        }]

        // subtraction
        [ sub(request)(response) {
            response = request.minuend - request.subtraend
        }]

        // multiplication
        [ mul(request)(response) {
            response = 1
            for (f in request.factor) {
                response = response * f
            }
        }]
        
        // division
        [ div(request)(response) {
            response = request.dividend / request.divisor
        }]
    }
}