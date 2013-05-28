function xhat = wienfilt2( y, h, K )
    h = padarray( h, size( y ) - size( h ), 'post' );
    Y = fft2( y );
    H = fft2( h );
    % H = psf2otf( h, size( Y ) );
    G = conj( H ) ./ ( abs( H ) .^ 2 + 1 / K );
    
    xhat = ifft2( G .* Y );
end