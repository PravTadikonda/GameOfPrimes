function solution = Two_B(cardNums, targetNum)
% Finds a solution for a single hand of the game of Primes.
%   SOLUTION = N_A(CARDNUMS, TARGETNUM) returns a string description
%   of a solution to the given Primes problem or an empty string if no
%   solution is found, where the problem is defined by a vector of six
%   card numbers CARDNUMS and a single target number TARGETNUM.
%
%   For example, N_A([4 9 13 1 4 2], 157) might return the string
%   '9 * 13 + 4 * 2 * (4+1)'.
%
%   <ANY ADDITIONAL DOCUMENTATION>
%
%   by Kimberly Wolford, D'Miria Collins, Prav Tadikonda
%   Last updated <DATE>


% ask user for a number
prompt = 'Choose a number from 100 - 200 that''s relatively prime\n';
primeNum = input(prompt);
    % check if it's about prime (not divisible by 2 or 5)
    while (mod(primeNum,2) == 0 | mod(primeNum, 5) == 0)
        prompt2 = 'Sorry, your number is obviously a composite number. Try again, please.\n';
        primeNum = input(prompt2);
    end
%display(primeNum);
        
% randomly choose 6 different numbers






end

