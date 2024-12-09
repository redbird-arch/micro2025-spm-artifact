
microcode = '''
def macroop VPXORD_XMM_XMM {
    mxor xmm0, xmm0v, xmm0m
    mxor xmm1, xmm1v, xmm1m
    vclear dest=xmm2, destVL=16
};

def macroop VPXORD_XMM_M {
    ldfp ufp1, seg, sib, disp, dataSize=8
    ldfp ufp2, seg, sib, "DISPLACEMENT + 8", dataSize=8
    mxor xmm0, xmm0v, ufp1
    mxor xmm1, xmm1v, ufp2
    vclear dest=xmm2, destVL=16
};

def macroop VPXORD_XMM_P {
    rdip t7
    ldfp ufp1, seg, riprel, disp, dataSize=8
    ldfp ufp2, seg, riprel, "DISPLACEMENT + 8", dataSize=8
    mxor xmm0, xmm0v, ufp1
    mxor xmm1, xmm1v, ufp2
    vclear dest=xmm2, destVL=16
};

def macroop VPXORD_YMM_YMM {
    mxor xmm0, xmm0v, xmm0m
    mxor xmm1, xmm1v, xmm1m
    mxor xmm2, xmm2v, xmm2m
    mxor xmm3, xmm3v, xmm3m
    vclear dest=xmm4, destVL=32
};

def macroop VPXORD_YMM_M {
    ldfp ufp1, seg, sib, disp, dataSize=8
    ldfp ufp2, seg, sib, "DISPLACEMENT + 8", dataSize=8
    ldfp ufp3, seg, sib, "DISPLACEMENT + 16", dataSize=8
    ldfp ufp4, seg, sib, "DISPLACEMENT + 24", dataSize=8
    mxor xmm0, xmm0v, ufp1
    mxor xmm1, xmm1v, ufp2
    mxor xmm2, xmm2v, ufp3
    mxor xmm3, xmm3v, ufp4
    vclear dest=xmm4, destVL=32
};

def macroop VPXORD_YMM_P {
    rdip t7
    ldfp ufp1, seg, riprel, disp, dataSize=8
    ldfp ufp2, seg, riprel, "DISPLACEMENT + 8", dataSize=8
    ldfp ufp3, seg, riprel, "DISPLACEMENT + 16", dataSize=8
    ldfp ufp4, seg, riprel, "DISPLACEMENT + 24", dataSize=8
    mxor xmm0, xmm0v, ufp1
    mxor xmm1, xmm1v, ufp2
    mxor xmm2, xmm2v, ufp3
    mxor xmm3, xmm3v, ufp4
    vclear dest=xmm4, destVL=32
};

def macroop VPXORD_ZMM_ZMM {
    mxor xmm0, xmm0v, xmm0m
    mxor xmm1, xmm1v, xmm1m
    mxor xmm2, xmm2v, xmm2m
    mxor xmm3, xmm3v, xmm3m
    mxor xmm4, xmm4v, xmm4m
    mxor xmm5, xmm5v, xmm5m
    mxor xmm6, xmm6v, xmm6m
    mxor xmm7, xmm7v, xmm7m
};

def macroop VPXORD_ZMM_M {
    ldfp ufp1, seg, sib, disp, dataSize=8
    ldfp ufp2, seg, sib, "DISPLACEMENT + 8", dataSize=8
    ldfp ufp3, seg, sib, "DISPLACEMENT + 16", dataSize=8
    ldfp ufp4, seg, sib, "DISPLACEMENT + 24", dataSize=8
    ldfp ufp5, seg, sib, "DISPLACEMENT + 32", dataSize=8
    ldfp ufp6, seg, sib, "DISPLACEMENT + 40", dataSize=8
    ldfp ufp7, seg, sib, "DISPLACEMENT + 48", dataSize=8
    ldfp ufp8, seg, sib, "DISPLACEMENT + 56", dataSize=8
    mxor xmm0, xmm0v, ufp1
    mxor xmm1, xmm1v, ufp2
    mxor xmm2, xmm2v, ufp3
    mxor xmm3, xmm3v, ufp4
    mxor xmm4, xmm4v, ufp5
    mxor xmm5, xmm5v, ufp6
    mxor xmm6, xmm6v, ufp7
    mxor xmm7, xmm7v, ufp8
};

def macroop VPXORD_ZMM_P {
    rdip t7
    ldfp ufp1, seg, riprel, disp, dataSize=8
    ldfp ufp2, seg, riprel, "DISPLACEMENT + 8", dataSize=8
    ldfp ufp3, seg, riprel, "DISPLACEMENT + 16", dataSize=8
    ldfp ufp4, seg, riprel, "DISPLACEMENT + 24", dataSize=8
    ldfp ufp5, seg, riprel, "DISPLACEMENT + 32", dataSize=8
    ldfp ufp6, seg, riprel, "DISPLACEMENT + 40", dataSize=8
    ldfp ufp7, seg, riprel, "DISPLACEMENT + 48", dataSize=8
    ldfp ufp8, seg, riprel, "DISPLACEMENT + 56", dataSize=8
    mxor xmm0, xmm0v, ufp1
    mxor xmm1, xmm1v, ufp2
    mxor xmm2, xmm2v, ufp3
    mxor xmm3, xmm3v, ufp4
    mxor xmm4, xmm4v, ufp5
    mxor xmm5, xmm5v, ufp6
    mxor xmm6, xmm6v, ufp7
    mxor xmm7, xmm7v, ufp8
};

'''
