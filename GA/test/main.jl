using Evolutionary

# Defining Rosenbrock function
f(x) = (1.0 - x[1])^2 + 100.0 * (x[2] - x[1]^2)^2
g(x) = 0.5 - (sin((x[1]^2 + x[2]^2)^(1/2))) - 0.5

# Defining Object function

## for single-objective optimization
soofun(x) = x[1] + x[2]

## for multi-objective optimization
moofun(x) = [x[1], x[2]+1]

## if multi-objective optimization has one parameter

function mooFun(F, x)
    F[1] = x
    F[2] = x + 1
    F
end

# Perform Optimization

x_0 = [π, -12.56];

lx = [0.125, 0.1, 0.1, 0.125]
ux = [5.0, 10.0, 10.0, 5.0]
mthd = GA(populationSize = 120, ɛ = 0.03, crossoverRate=0.8, mutationRate=0.01, selection=rouletteinv, crossover=LX(0.0,4.0), mutation = PM(lx,ux,1.0))

CMAES_res = Evolutionary.optimize(f, x_0, CMAES())
GA_res =  Evolutionary.optimize(f, x_0, mthd)
