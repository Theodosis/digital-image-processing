function [ h0, h1, g0, g1 ] = orthonormalFilterBanks( h )
    h0 = h;
    g0 = h0( end:-1:1 );
    
    g1 = - ( (-1) .^ ( 1 : ( size( g0, 2 ) ) ) ) .* g0( [ end - 1 : -1 : 1, end ] );
    h1 = g1( end:-1:1 );
end