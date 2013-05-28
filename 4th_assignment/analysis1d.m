function [ y0, y1 ] = analysis1d( h0, h1, x )
    h0 = padarray( h0', size( x, 2 ) - size( h0, 2 ), 'post' )';
    h1 = padarray( h1', size( x, 2 ) - size( h1, 2 ), 'post' )';
    
    H0 = fft( h0 );
    H1 = fft( h1 );
    X = fft( x );

    yy0 = ifft( H0 .* X );
    yy1 = ifft( H1 .* X );
    y0 = yy0( 2:2:size( yy0, 2 ) );
    y1 = yy1( 2:2:size( yy1, 2 ) );
end