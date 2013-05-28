orange = imread( '060520-4575.x.jpg' );
orange = sum( orange, 3 ) / 3;
%figure;
%imshow( bayer2rgb( orange, size( orange, 1 ), size( orange, 2 ), 1 ) );
%title( 'Nearest Neibuhr' );


figure;
imshow( bayer2rgb( orange, size( orange, 1 ), size( orange, 2 ), 2 ) );
title( 'Bilinear Interpolation' );
