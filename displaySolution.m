function displaySolution( solution, iterations, tolerance, correct_solution, timed, verbosity, method )
% Formats output and provides solution parameters and information

if nargin<7
   method = 'The';
end

% disp('___________________________________')
disp(' ')

if verbosity>=1
    round_error = abs(log10(tolerance))-1;
    if ~strcmp(method, 'The')
        disp([method,' solution:'])
    end
end

solution(:,end)

if verbosity>=1

    if isequal(round(solution(:,end),round_error),round(correct_solution,round_error))
        disp([method, ' solution is correct'])
    else disp([method, ' solution is incorrect:'])
        correct_solution
    end
end
if verbosity>=2
    if ~isequal(solution(:,end),correct_solution)
        disp([method,' solution is inaccurate by a maximum difference of ',...
            num2str(max(abs(solution(:,end)-correct_solution)))])
    end
    relative_norm = max(abs(solution(:,end) - solution(:,end-1)))/ max(abs(solution(:,end)));
    disp([method, ' solution has a norm of ', num2str(relative_norm)])
    disp([method, ' solution was calculated in ', num2str(timed), ' seconds'])
end
if verbosity>=1
    disp([method, ' solution converged within ', num2str(iterations), ' iterations'])
end

end