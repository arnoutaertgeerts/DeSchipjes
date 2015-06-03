function [ variable ] = findOutput( filename, variablename )
%FINDOUTPUTFUNC Finds an output from a Dymola outputfile
% first input: name of the datafile  
% second input: name of the variable
% third input: true if the asked is a variable, false if a parameter is
% asked


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

typeVar = abs(dataInfo(1,position));
sec_position = abs(dataInfo(2,position));

if typeVar == 1 % parameter
    %data_1(sec_position,:)
    var = data_1(sec_position,:);
    variable = var(1);
elseif typeVar == 2 || typeVar == 0
    variable = data_2(sec_position,:);
end

%figure;
%plot(variable)

end

