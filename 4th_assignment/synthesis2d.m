function [ xhat ] = synthesis2d( g0, g1, y00, y01, y10, y11 )

    y0 = synthesis1d( g0, g1, y00( 1, : ), y01( 1, : ) );
    y1 = synthesis1d( g0, g1, y10( 1, : ), y11( 1, : ) );
    
    
    for i = 2 : size( y00, 1 )
        y0( i, : ) = synthesis1d( g0, g1, y00( i, : ), y01( i, : ) );
        y1( i, : ) = synthesis1d( g0, g1, y10( i, : ), y11( i, : ) );
    end
    
    xhat = synthesis1d( g0, g1, y0( :, 1 )', y1( :, 1 )' )';
    for i = 2 : size( y00, 2 ) + size( y10, 2 )
        xhat( :, i ) = synthesis1d( g0, g1, y0( :, i )', y1( :, i )' )';
    end
end