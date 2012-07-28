LoadPackage( "GradedRingForHomalg" );

Qs := HomalgFieldOfRationalsInDefaultCAS( ) * "s";
Qsxy := Qs * "x,y";
Ds := RingOfDerivations( Qsxy, "Ds,Dx,Dy" );

x := "x" / Ds;
y := "y" / Ds;

Dx := "Dx" / Ds;
Dy := "Dy" / Ds;

SetIsWeylRing( Ds, true );
SetCenter( Ds, Qs );
SetBaseRing( Ds, Qsxy );
SetCoefficientsRing( Ds, Qs );

SetRelativeIndeterminateCoordinatesOfRingOfDerivations( Ds, [ x, y ] );
ResetFilterObj( Ds, IndeterminateDerivationsOfRingOfDerivations );
SetIndeterminateDerivationsOfRingOfDerivations( Ds, [ Dx, Dy ] );

f_pq := "x^p + y*y^(q-1) + x*y^(q-1)";

PlaneCurve := function( p, q, r, t )
    return ( x^p + y^q + x^r * y^t ) / Ds;
end;

f := PlaneCurve( 2, 3, 4, 5 );

g := Concatenation( "(", String( f ), ")^s" );

LoadPackage( "D-Modules" );

F := InjectiveLeftModule( Ds );

A := HomalgRing( MatrixOfGenerators( F ) );

sec := Concatenation( "[", g, "]" );

sec := HomalgMatrix( sec, 1, 1, A );

Ann := Annihilator( g, 1, Ds );

Dsf := LeftSubmodule( [ f ] );

Annf := Ann + Dsf;

s := Indeterminate( Rationals, "s" );

b := IntersectWithSubalgebra( Annf, s );

factors := Collected( Factors( b ) );

Assert( 0, factors =
        [ [ s+5/6, 1 ], [ s+1, 1 ], [ s+7/6, 1 ] ] );