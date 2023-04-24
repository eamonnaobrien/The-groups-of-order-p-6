freeze;
 

import "misc.m": NonQuadraticResidue, EasterfieldPair;


//List for Phi6

//list for Phi6 case 1
Phi6case1 := function(p)

    Z := Integers ();
    la := Z ! (NonQuadraticResidue (p)); // lambda

    F := FreeGroup (7);

    Alpha := [F.1, F.2, F.3, F.4, F.5];
    Beta := [F.6, F.7];

    family := [
    (Alpha[2],Alpha[3]) = Id(F),
    (Alpha[2],Alpha[4]) = Id(F),
    (Alpha[3],Alpha[4]) = Alpha[1],
    (Alpha[2],Alpha[5]) = Id(F),
    (Alpha[3],Alpha[5]) = Alpha[2],
    (Alpha[4],Alpha[5]) = Alpha[3],
    Beta[1]^(p^2) = Id(F),
    Beta[2]^p = Id(F),
    Beta[1]^p = Alpha[1],
    Beta[2] = Alpha[2]] cat
    &cat([[(Beta[i], Alpha[j]) = Id(F) : j in [1..5]]: i in [1..2]])
    cat &cat([[(Beta[i], Beta[j]) = Id(F) : j in [i + 1..2]]: i in [1..2]]);

    Pres := [];

    Q := quo < F | family, [
                   Alpha[4]^p = Id(F),
                   Alpha[5]^p = Id(F)
               ] >;
    Append (~Pres, Q);

    for x in [1,la] do
    Q := quo < F | family, [
                   Alpha[4]^p = Id(F),
                   Alpha[5]^p = Beta[1]^x
               ] >;
    Append (~Pres, Q);
    end for;

    Q := quo < F | family, [
                   Alpha[4]^p = Id(F),
                   Alpha[5]^p = Beta[2]
               ] >;
    Append (~Pres, Q);

    Q := quo < F | family, [
                   Alpha[4]^p = Beta[1],
                   Alpha[5]^p = Id(F)
               ] >;
    Append (~Pres, Q);

    for x in [1,la] do
    Q := quo < F | family, [
                   Alpha[4]^p = Beta[2]^x,
                   Alpha[5]^p = Id(F)
               ] >;
    Append (~Pres, Q);
    end for;

    for y in [1,la] do
     for x in [1,la] do
      Q := quo < F | family, [
                      Alpha[4]^p = Beta[2]^y,
                      Alpha[5]^p = Beta[1]^x
                  ] >;
      Append (~Pres, Q);
     end for;
    end for;

    for x in [1..(p-1)] do
    Q := quo < F | family, [
                   Alpha[4]^p = Beta[1]^x,
                   Alpha[5]^p = Beta[2]
               ] >;
    Append (~Pres, Q);
    end for;

    return [pQuotient(q,p,3):q in Pres];
end function;

//list for Phi6 case 2
Phi6case2 := function(p)

    w := PrimitiveRoot(p);

    Z := Integers ();
    la := Z ! (NonQuadraticResidue (p)); // lambda

    F := FreeGroup (8);

    Alpha := [F.1, F.2, F.3, F.4, F.5];
    Beta := [F.6, F.7, F.8];

    family := [
    (Alpha[2],Alpha[3]) = Id(F),
    (Alpha[2],Alpha[4]) = Id(F),
    (Alpha[3],Alpha[4]) = Alpha[1],
    (Alpha[2],Alpha[5]) = Id(F),
    (Alpha[3],Alpha[5]) = Alpha[2],
    (Alpha[4],Alpha[5]) = Alpha[3],
    Beta[1]^p = Id(F),
    Beta[2]^p = Id(F),
    Beta[3]^p = Id(F),
    Alpha[5]^(p^2) = Id(F),
    Alpha[4]^(p^2) = Id(F),
    Beta[1] = Alpha[1],
    Beta[2] = Alpha[2]] cat
    &cat([[(Beta[i], Alpha[j]) = Id(F) : j in [1..5]]: i in [1..3]])
    cat &cat([[(Beta[i], Beta[j]) = Id(F) : j in [i + 1..3]]: i in [1..3]]);

    Pres := [];

    Q := quo < F | family, [
                   Alpha[4]^p = Id(F),
                   Alpha[5]^p = Id(F)
               ] >;
    Append (~Pres, Q);

    Q := quo < F | family, [
                   Alpha[4]^p = Id(F),
                   Alpha[5]^p = Beta[3]
               ] >;
    Append (~Pres, Q);

    Q := quo < F | family, [
                   Alpha[4]^p = Id(F),
                   Alpha[5]^p = Beta[2]
               ] >;
    Append (~Pres, Q);

    for x in [1,la] do
    Q := quo < F | family, [
                   Alpha[4]^p = Id(F),
                   Alpha[5]^p = Beta[1]^x
               ] >;
    Append (~Pres, Q);
    end for;

    for x in [1,la] do
    Q := quo < F | family, [
                   Alpha[4]^p = Beta[2]^x,
                   Alpha[5]^p = Beta[3]
               ] >;
    Append (~Pres, Q);
    end for;

    Q := quo < F | family, [
                   Alpha[4]^p = Beta[1],
                   Alpha[5]^p = Beta[3]
               ] >;
    Append (~Pres, Q);

    Q := quo < F | family, [
                   Alpha[4]^p = Beta[1],
                   Alpha[5]^p = Beta[2]
               ] >;
    Append (~Pres, Q);

    Q := quo < F | family, [
                   Alpha[4]^p = Beta[2],
                   Alpha[5]^p = Beta[1]
               ] >;
    Append (~Pres, Q);

    for i in [1..(p-3) div 2] do
    Q := quo < F | family, [
                   Alpha[4]^p = Beta[1]^(w^i mod p),
                   Alpha[5]^p = Beta[2]
               ] >;
    Append (~Pres, Q);
    end for;

    for x in [1,la] do
    Q := quo < F | family, [
                   Alpha[4]^p = Beta[1],
                   Alpha[5]^p = (Beta[1]^x)*Beta[2]
               ] >;
    Append (~Pres, Q);
    end for;

    Q := quo < F | family, [
                   Alpha[4]^p = Beta[2],
                   Alpha[5]^p = Beta[1]^la
               ] >;
    Append (~Pres, Q);

    for i in [1..(p-2) by 2] do
    Q := quo < F | family, [
                   Alpha[4]^p = Beta[2]*Beta[1]^2,
                   Alpha[5]^p = Beta[1]^((w^i-1) mod p)
               ] >;
    Append (~Pres, Q);
    end for;

    return [pQuotient(q,p,3):q in Pres];
end function;

EasterfieldPhi6 := function(p)
   return Phi6case1(p) cat Phi6case2(p);
end function;
