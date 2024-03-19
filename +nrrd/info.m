function info = info(filename)
    % read a nrrd file
    info = nhdr_nrrd_read(filename, false);
        
    end