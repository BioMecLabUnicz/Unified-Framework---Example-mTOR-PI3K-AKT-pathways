function dy = mTorODE(x0, p)


    u = p(1);
    delta_c = p(2);
    k1 = p(3);
    v1 = p(4);
    Km6 = p(5);
    k3 = p(6);
    delta_pip3 = p(7);
    delta_mtorc2 = p(10);
    k2 = p(8);
    Km1 = p(9);
    delta_akt = p(13);
    k4 = p(11);
    Km2 = p(12);
    delta_tsc = p(14);
    v2 = p(15);
    Km4 = p(16);
    delta_mtorc1 = p(17);
    v3 = p(18);
    Km5 = p(19);
    delta_s6k1 = p(22);
    k7 = p(20);
    Km3 = p(21);
    
    irs1_pi3k = x0(1);
    pip3 = x0(2);
    mtorc2  = x0(3);
    akt = x0(4);
    tsc1 = x0(5);
    mtorc1 = x0(6);
    s6k1 = x0(7);

    dirs1_pi3k_dt = u - (delta_c + k1)*irs1_pi3k + v1/(Km6 + s6k1);
    dpip3_dt = k1*irs1_pi3k -(delta_pip3 + k3)*pip3;
    dmtorc2_dt = -delta_mtorc2*mtorc2 + k2*pip3/(Km1 + pip3);
    dakt_dt = -delta_akt*akt + k3*pip3 + k4*mtorc2/(Km2 + mtorc2);
    dtsc1_dt = -delta_tsc*tsc1 + v2/(Km4 + akt);
    dmtorc1_dt = -delta_mtorc1*mtorc1 + v3/(Km5 + tsc1);
    ds6k1_dt = -delta_s6k1*s6k1 +k7*mtorc1/(Km3 + mtorc1);

    dy = [dirs1_pi3k_dt; dpip3_dt; dmtorc2_dt; dakt_dt; dtsc1_dt; dmtorc1_dt; ds6k1_dt];
end















