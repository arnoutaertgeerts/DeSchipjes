function x0 = initialize(T0,C,xuyName)
    % Find index of internal energy state using the keyword 'dynBal.U'
    [ny,nx] = size(C);
    j = 0;
    for i = 1:nx
        if ~isempty(strfind(xuyName(i,:),'dynBal.U'))
            j=j+1;
            ind_x(j) = i;
        end            
    end
    
    % Find index of zone temperature outputs using the keyword 'TSensor'
    nu = size(xuyName,1) - ny - nx;
    j = 0;
    for i = nx+nu+1:nx+nu+ny
        if ~isempty(strfind(xuyName(i,:),'TSensor'))
            j=j+1;
            ind_y(j) = i - (nx+nu);
        end            
    end
    
    % Set all states to T0
    x0 = T0.*ones(nx,1);
    
    % Correct the states of internal energy so that y(t=0) = T0
    x0(ind_x) = T0./diag(C(ind_y,ind_x));
end