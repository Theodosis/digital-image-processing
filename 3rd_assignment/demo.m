x = checkerboard(8);
v = 0.01 * randn(size(x));
h = fspecial('motion', 21, 11);
y0 = imfilter(x, h, 'circular');
y = y0 + v;



h2 = padarray( h, size( y ) - size( h ), 'post' );
xinv = ifft2( fft2( y ) ./ fft2( h2 ) );
xinv0 = ifft2( fft2( y0 ) ./ fft2( h2 ) );


min = inf;

for k = 1100:1:1400
    xhat = wienfilt2( y, h, k );
    J(k - 1099) = sum( sum( ( ( xinv0 - xhat ) .^ 2 ) ) ) / sum( size( x ) );
    if J( k - 1099 ) < min
        min = J( k - 1099 );
        minid = k;
    end
end

xhat = wienfilt2( y, h, minid );

figure( 1 );
plot( 1100:1:1400, J );

figure( 2 );
subplot(231); imshow(x);
title('x = original image');
subplot(232); imshow(y/max(y(:)));
title('y = blured and noisy');
subplot(233); imshow(xinv0/max(xinv0(:)));
title('xinv0 = inverse filtering noiseless output');
subplot(234); imshow(xinv/max(xinv(:)));
title('xinv = inverse filtering noisy output');
subplot(235); imshow(xhat/max(xhat(:)));
title('xhat = Wiener filtering output');