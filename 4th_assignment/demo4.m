x = im2double( imread( 'farm.jpg' ) );

[h0, h1, g0, g1 ] = orthonormalFilterBanks( [ 0.7071 0.7071 ] );

[ y00, y01, y10, y11 ] = analysis2d( h0, h1, x );

xhat = synthesis2d( g0, g1, y00, y01, y10, y11 );

L = 1;
figure( 1 )
subplot( 221 )
imshow( y00 / L );
subplot( 222 )
imshow( y01 / L );
subplot( 223 )
imshow( y10 / L );
subplot( 224 )
imshow( y11 / L );

figure( 2 )
subplot( 211 )
imshow( x );
subplot( 211 )
imshow( x );
subplot( 212 )
imshow( xhat );