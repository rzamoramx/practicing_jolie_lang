
// import interface
from CalculatorInterfaceModule import CalculatorInterface

// once we imported the contract 
// define the service
service CalculatorService {
    // define the exeution mode before, exists three modes
    // single (default), this means the service will serve only one request and then it's stop
    // concurrent, this means the service will serve multiple and concurrent requests
    // sequential, this means the service will serve multiple requests but, one by one
    execution { concurrent }

    // define the ports (inputs)
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

        // exit
        [ shutdown()() ]{
            exit
        }
    }
}