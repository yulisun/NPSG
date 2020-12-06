function DI_fusion = fuse_DI(DI_fw,DI_bw,opt)
if isfield(opt,'opt.t1_norm_pm') && isfield(opt,'opt.t2_norm_pm')
    DI_fusion = DI_fw/opt.t2_norm_pm + DI_bw/opt.t1_norm_pm ;
else
    DI_fusion = DI_fw/2 + DI_bw/2 ;
end

    