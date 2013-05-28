function [ z ] = econv2( x, y )
    m = size( x, 1 ) + size( y, 1 ) - 1;
    n = size( x, 2 ) + size( y, 2 ) - 1;
    
    X = fft2( x );
    Y = fft2( y );
    
    
    X = padarray( X, [ m - size( X, 1 ), n - size( X, 2 ) ], 0, 'post' );
    Y = padarray( Y, [ m - size( Y, 1 ), n - size( Y, 2 ) ], 0, 'post' );
    
    
    z = ifft2( X .* Y );
end

