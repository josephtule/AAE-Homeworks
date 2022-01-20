function iCr = findDCM(om,inc,th)
    col1 = [cos(om)*cos(th) - sin(om)*cos(inc)*sin(th);
        sin(om)*cos(th)+cos(om)*cos(inc)*sin(th);
        sin(inc)*sin(th)];
%     col2 = [-cos(om)*sin(th)-sin(om)*cos(inc)*cos(th);
%         -sin(om)*sin(th)+cos(om)*cos(inc)*cos(th);
%         sin(inc)*cos(th)];
    col3 = [sin(om)*sin(inc);
        -cos(om)*sin(inc);
        cos(inc)];
    
    col2 = cross(col3,col1);
    iCr = [col1 col2 col3];
end