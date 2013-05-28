function [ y00, y01, y10, y11 ] = analysis2d( h0, h1, x )
    
    [ a, b ] = analysis1d( h0, h1, x( :, 1 )' );
    y0 = a';
    y1 = b';
    for i = 2:size( x, 2 )
        [ a, b ] = analysis1d( h0, h1, x( :, i )' );
        y0( :, i ) = a';
        y1( :, i ) = b';
    end
    
    [ y00, y01 ] = analysis1d( h0, h1, y0( 1, : ) );
    [ y10, y11 ] = analysis1d( h0, h1, y1( 1, : ) );
    for i = 2:size( y0, 1 )
        [ y00( i, : ), y01( i, : ) ] = analysis1d( h0, h1, y0( i, : ) );
        [ y10( i, : ), y11( i, : ) ] = analysis1d( h0, h1, y1( i, : ) );
    end
end