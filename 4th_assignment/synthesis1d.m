function [ xhat ] = synthesis1d( g0, g1, y0, y1 )

    w0 = zeros( 1, size( y0, 2 ) * 2 );
    w0( 2:2:( size( y0, 2 )  * 2 ) ) = y0;
    w1 = zeros( 1, size( y1, 2 ) * 2 );
    w1( 2:2:( size( y1, 2 )  * 2 ) ) = y1;
    
    
    g0 = padarray( g0', size( w0, 2 ) - size( g0, 2 ), 'post' )';
    g1 = padarray( g1', size( w1, 2 ) - size( g1, 2 ), 'post' )';
    
    W0 = fft( w0 );
    W1 = fft( w1 );
    G0 = fft( g0 );
    G1 = fft( g1 );
    R0 = G0 .* W0;
    R1 = G1 .* W1;
    
    r0 = ifft( R0 );
    r1 = ifft( R1 );
    
    xhat = r0 + r1;
    
end