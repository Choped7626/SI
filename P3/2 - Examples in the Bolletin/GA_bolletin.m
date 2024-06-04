clear all;
close all;

%%

%%%%%%%%%%%%%%%%%
% First example %
%%%%%%%%%%%%%%%%%

FitnessFunction = @simple_fitness;             % Define the handler to be used
numberOfvariables =2;                         % Define the number of variables to test

%Calling the genetic algorithm by default
[x, fval] = ga(FitnessFunction,numberOfvariables)


%% 

%%%%%%%%%%%%%%%%%%
% Second example %
%%%%%%%%%%%%%%%%%%

% Pre inizialization of the variables
ii = [-2:0.1:2];
jj = [-2:0.1:2];

return_shu = zeros(size(ii,2), size(jj,2));


for indx_i = 1:size(ii,2)
    for indx_j = 1:size(jj,2)
        return_shu(indx_i, indx_j) = shufcn([indx_i, indx_j]);
    end
end

surfc(ii, jj, return_shu)                                     % Show the function to minimize


%%  Now let's use it as the fitness function

FitnessFunction = @shufcn;             
numberOfvariables =2;

[x, Fval, exitFlag, Output] = ga(FitnessFunction, numberOfvariables);

fprintf("Number of Generations: %d\n", Output.generations)
fprintf("Number of Fitness Evaluations: %d\n", Output.funccount)
fprintf("Best value:  %d\n:", Fval)


%% Now let's test some other options and show some plots

opts = gaoptimset('PlotFcns',{ @gaplotbestf, @gaplotstopping});
[x, Fval, exitFlag, Output] = ga(FitnessFunction, numberOfvariables, opts)


%%  Change the stop criteria;
opts = gaoptimset(opts,'Generations',150,'StallGenLimit', 100);
[x, Fval, exitFlag, Output] = ga(FitnessFunction, numberOfvariables, opts)

fprintf("Number of Generations: %d\n", Output.generations)
fprintf("Number of Fitness Evaluations: %d\n", Output.funccount)
fprintf("Best value:  %d\n:", Fval)

%% Change the PopulationSize and inicialization

opts = gaoptimset(opts,'PopulationSize', 10);

opts = gaoptimset(opts,'PopInitRange', [-1 0; 1 2]);

[x, Fval, exitFlag, Output] = ga(FitnessFunction, numberOfvariables, opts)

fprintf("Number of Generations: %d\n", Output.generations)
fprintf("Number of Fitness Evaluations: %d\n", Output.funccount)
fprintf("Best value:  %d\n:", Fval)

%% Comparison between two executions to check the random operator

[x, Fval, exitFlag, Output] = ga(FitnessFunction, numberOfvariables);
fprintf('Fist population best value: %d\n', Fval);

[x, Fval, exitFlag, Output] = ga(FitnessFunction, numberOfvariables);
fprintf('Second population best value: %d\n', Fval);

%% Change the options of the evolution

opts = gaoptimset(opts,'SelectionFcn', @selectiontournament);
opts = gaoptimset(opts,'CrossoverFcn', @crossoversinglepoint);
opts = gaoptimset(opts,'CrossoverFraction', 0.9);
opts = gaoptimset(opts,'MutationFcn', {@mutationuniform, 0.1});

[x, Fval, exitFlag, Output] = ga(FitnessFunction, numberOfvariables,opts);
	
fprintf('Number of Generations: %d\n', Output.generations);
fprintf('Number of Fitness Evaluations: %d\n', Output.funccount);
fprintf('Best value:  %d\n', Fval);

