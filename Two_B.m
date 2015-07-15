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
prompt = 'Choose a number from 100 to 200 that''s relatively prime\n';
primeNum = input(prompt);
    while (~isprime(primeNum) || primeNum < 100 || primeNum > 200)
        if (primeNum > 200)
            display('Whoops! The number is too large!')
        else if (primeNum < 100)
            display('Whoops! The number is too small!')
        else if (~isprime(primeNum))
            display('Whoops! You picked a composite number!')
            end
            end
        end
        prompt2 = 'Try again, please.\n';
        primeNum = input(prompt2);
    end

% randomly choose 6 different numbers and makes sure it works
dealAgain = true;
while(dealAgain)
    randNums = randperm(52,6);
    cards = [];
    for x = 1:numel(randNums)
        card = mod(randNums(x),13);
        if card == 0
            card = 13;
        end
        cards(x) = card;
    end

    display('These are the cards you are dealt:');
    disp(cards);

    %check if it's possible
    total = 1;
    for x = 1:numel(cards)
        total = total * cards(x);
    end
    if total < primeNum
        disp('This will not be possible. We will deal again.');
        dealAgain = true;
    else
        dealAgain = false;
    end
end

% Use brute force to check


end

