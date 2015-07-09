function solution = Two_A(cardNums, targetNum)
    % N_A  Finds a solution for a single hand of the game of Primes.
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
    %
[cardNums, targetNum] = Set_Up();    %Gets the parameters from Set_Up()
end  % end of function

function [cardsDealt, primeNum] = Set_Up()
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

prompt = 'Enter a prime number between 100 and 200.   ';
n = input(prompt);
while ~isprime(n) || n<100 || n>200;
    prompt = 'Try again.   ';
    n = input(prompt);
end
arr = [];
while length(arr)<6;
    %random number num
    num = randi([1 13],1,1);
    if length(arr)<= 0;
        arr =[arr num];
    else
        %make sure no num used more than 4 times
        i=1;
        count=0;
        while i<=length(arr);
            if arr(i)==num;
                count = count+1;
            end
            i = i + 1;
        end
        if count<4;
            arr = [arr num];
        end
    end
end
cardsDealt = arr;
primeNum=n;
end
