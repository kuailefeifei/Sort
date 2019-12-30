function output = sortArray(input,sort_function)
%--------------------------------------------------------------------------
% FUNCTION    
% output = sortArray(input,sort_function)    
% This function shows different sort methods: 'quick_sort','bubble_sort',
% and 'merge_sort'. 'quick_sort' is suitable for the sort of an array that
% has 3 types of all elements, and time complexity of this method is O(n).
% 'bubble_sort' and 'merge_sort' are suitable for all arrays those are 1D
% array or matrix.
%--------------------------------------------------------------------------
% INPUT
% input                1D array or matrix. For the sort method 'quick_sort'  
%                      input must have 3 types of all elements.
%
% sort_function        char array. sort_function determines the type of
%                      used sort method. Current sort_function can only be
%                      'quick_sort', 'bubble_sort' or 'merge_sort'. Default
%                      sort_function is 'bubble_sort'.
% OUTPUT
% output               1D array or matrix after sort
%--------------------------------------------------------------------------
% Author               Kai HU
% Last Edited          30.12.2019
%--------------------------------------------------------------------------
    if nargin < 2
        sort_function = 'bubble_sort';
    end
    
    switch sort_function
        case 'quick_sort'
            c = 1;
            i = 1;
            j = numel(input);
            while c < j
                if input(c) == min(input)
                    [input(i),input(c)] = deal(input(c),input(i));
                    i = i + 1;
                    c = c + 1;
                elseif input(c) == max(input)
                    [input(c),input(j)] = deal(input(j),input(c));
                    j = j - 1;
                else
                    c = c + 1;
                end
            end
            output = input;
                
        case 'bubble_sort'
            for i = 1:numel(input)-1
                for j = 1:numel(input)-i
                    if input(j) > input(j + 1)
                        [input(j),input(j + 1)] = deal(input(j + 1),input(j));
                    end
                end
            end
            output = input;
            
        case 'merge_sort'
            output = mergesort(input);
            
        otherwise 
            error("Unsupported sort function!")
    end
end

function output = mergesort(input)
    if numel(input) <= 1
        output = input;
    else
        if rem(numel(input),2) == 0
            leftlist = input(1:numel(input)/2);   
        else
            leftlist = input(1:(numel(input) + 1)/2);
        end
        rightlist = input(numel(leftlist) + 1:numel(input));    
        leftlist = mergesort(leftlist);
        rightlist = mergesort(rightlist);
        output = merge(leftlist,rightlist);
    end
end

function output = merge(leftlist,rightlist)
    output = [];
    
    while ~isempty(leftlist) & ~isempty(rightlist)
        if leftlist(1) < rightlist(1)
            output = [output,leftlist(1)];
            leftlist(1) = [];
        else
            output = [output,rightlist(1)];
            rightlist(1) = [];
        end
    end
    
    if ~isempty(leftlist)
        output = [output,leftlist];
    end
    
    if ~isempty(rightlist)
        output = [output,rightlist];
    end
end
