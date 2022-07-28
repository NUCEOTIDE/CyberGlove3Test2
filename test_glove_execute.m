%% Test Loop
n=0;
while n<5000
    %% Call the Mex file and obtain Glove Data 1 time
    iniData = Source_mxArray_1();
    iniData_linear = iniData(:);
    %% Format the Data into a 5x3 double precision array
    % for now we are not sure what is the cause of the incorrect array
    % formatting in matlab workspace. This is only a temporary fix as the 
    % time efficiency of the program is a concern.
    GloveData_last = zeros(5,3);
    GloveData_full = zeros(5, 3, 1);
    for index_m = 1 : 5
        for index_n = 1 : 3
            index = index_m * index_n;
            GloveData_last(index_m, index_n) = iniData_linear(index);
        end
    end
    GloveData_full = cat(3, GloveData_full, GloveData_last);
    n=n+1;

end