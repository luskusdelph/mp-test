

// parser
capture program drop power_cmd_mvmixedpower_parse
program power_cmd_mvmixedpower_parse, sclass
version 17 
sreturn clear


syntax, [TRTSPEC(string) delta(numlist) PEFFectiveness(numlist) actualtrt(string) ara1(numlist) ara2(numlist) ONESided TWOSided  *]


if "`actualtrt'"!="" local attext " {it:but with actual} {hi:`actualtrt'} {it:treatment effect}"
if "`ara1'"!="" | "`ara2'"!="" local ara1ara2 "ara1 ara2"
if "`ara1'"!="" | "`ara2'"!="" local AR1AR2 AR1 AR2
if "`delta'"!="" local deltalab delta
if "`peffectiveness'"!="" local effcol peffectiveness
if "`peffectiveness'"!="" local efflab effect_pct 
if "`onesided'"!="" local subttext tested with one-sided alpha
if "`twosided'"!="" local subttext tested with two-sided alpha
if "`onesided'"=="" & "`twosided'"=="" local subttext tested with two-sided* alpha - *technically one-sided at {alpha/2}

sreturn local pss_numopts "delta PEFFectiveness ara1 ara2"
sreturn local pss_allcolnames "power N cont_N trt_N `deltalab' `effcol' alpha `ara1ara2' " 
sreturn local pss_collabels  `"power "total N" "cont N" "treat N" `deltalab' `efflab' alpha `AR1AR2'"'
sreturn local pss_title "for a {hi:multivariate} mixed model with {hi:`trtspec'} treatment effect parameterisation`attext':"
sreturn local pss_subtitle "`subttext'" 
end