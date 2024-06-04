function fitness = simple_fitness(individual)
% This is an example for a fitness funtion which would be used in a 
% Genetic Algorithm to minimize and evaluate the performance of the
% individuals
% Parameter individual  a Tuple with two variabbles 

    fitness = 100 *(individual(1)^2 - individual(2))^2 + (1-individual(1))^2;