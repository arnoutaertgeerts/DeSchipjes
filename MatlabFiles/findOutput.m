function [ variable ] = findOutput( filename, variablename, isVariable )
%FINDOUTPUTFUNC Finds an output from a Dymola outputfile
% first input: name of the datafile  
% second input: name of the variable
% third input: true if the asked is a variable, false if a parameter is
% asked

if isempty(isVariable)
    isVariable = true;
end


load(filename)          % name of the saved file
%load T1withSST.mat

name2 = name';               % twist for right spelling

position = 0;

for i = 1: length(name2(:,1))
    
    found = strcmp(strtrim(name2(i,:)),variablename);

    if found
        position = i;
    end
    
end

if position ==0
    error('Variable not found')
end

sec_position = abs(dataInfo(2,position));

if isVariable
    variable = data_2(sec_position,:);
end

if not(isVariable)
    variable = data_1(sec_position,:);
end

%figure;
%plot(variable)

end

