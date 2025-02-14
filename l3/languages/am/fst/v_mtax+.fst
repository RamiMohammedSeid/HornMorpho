-> start

## Set the part of speecn
start -> pos   [:]     [pos=v]

# No conjunction or preposition
pos   -> neg   [:]     [cj1=None,pp=None,-rel,-sub,-def,rl=[-p,-acc],-ye]

## CONJUNCTIONS (+sub is redundant)
pos   -> neg    >>cnj1+<<
# salle, etc.
pos   -> obj  >>irr_conj+<<

## PREPOSITIONS (+sub is redundant)
# Needed because rel prefix is different in Am imperf following prep
pos   -> rel1  >>prep+<<
# Relative with no preposition
pos   -> rel   [:]      [pp=None,+sub,+rel,rl=[-p]]

## RELATIVE PREFIX (+sub is redundant)
rel -> rel1    <ye:ye>   [+rel,pp=None,+sub,rl=[-p],+ye]
# alternate prefix when nothing precedes
rel -> rel1    [':]    [tm=imf,+rel,pp=None,+sub,rl=[-p],-ye]
# second prefix for imperfective
rel1 -> neg    <m_I:m_(rel)->  [tm=imf]
rel1 -> neg    <:(rel)->     [tm=prf];[tm=prs]

## NEGATIVE PREFIX
neg -> neg_a      [a]    [+neg,ax=None]
neg_a -> sbjp     [:]     [tm=imf];[tm=j_i]
neg_a -> sbjp     <l:l(neg1)->    [tm=prf]
# Affirmative
neg ->  sbjp      [:]     [-neg]
# alle affirmative and negative, present
neg -> obj     >>alle+<<

## SUBJECT PREFIX
# Prefix only for imperfective and jussive
sbjp -> stem      [:]    [tm=prf];[tm=ger];[tm=j_i,sb=[+p2],-neg]
sbjp -> sbjp*     [:]    [tm=imf];[tm=j_i,sb=[-p2]];[tm=j_i,+neg]
# When nothing precedes the subject prefix
sbjp* -> sbjp0    [:]    [-sub,-neg]
# 'sebr, 'nsebr
sbjp0 -> sbjp1    [':]   [tm=imf,sb=[+p1],ob=[-p1]];[tm=j_i,sb=[+p1,+plr],ob=[-p1]]
sbjp0 -> sbjp1    [:]    [tm=j_i,sb=[-p1]];[tm=j_i,sb=[+p1,-plr]];[tm=imf,sb=[-p1]]
# Another prefix precedes the subject prefix
sbjp* -> sbjp1    [:]    [+sub];[+neg]
# 1s l: jussive and imperf neg 
sbjp1 -> stem     <l:l(sb=1s)->   [tm=j_i,sb=[+p1,-plr],ob=[-p1],-neg]
sbjp1 -> stem     <l:l(neg1,sb=1s)->   [tm=imf,sb=[+p1,-plr],ob=[-p1],+neg]
# y: 3sm and 3p
sbjp1 -> stem     <y:y(sb=3sm|3p)->   [sb=[-p1,-p2,+plr],-neg]; [sb=[-p1,-p2,-plr,-fem],-neg]
sbjp1 -> stem     <y:y(neg1,sb=3sm|3p)->   [sb=[-p1,-p2,+plr],+neg]; [sb=[-p1,-p2,-plr,-fem],+neg]
# Unless at the beginning of the word or negative, there is no overt 1s prefix, except in jussive
sbjp1 -> stem     <:'(sb=1s)->    [tm=imf,sb=[+p1,-plr],ob=[-p1],-neg]
# t, n: 1p, 2, 3sf
sbjp1 -> stem     <t:t(sb=2|3sf)->        [sb=[+p2,-p1],ob=[-p2],-neg];[sb=[-plr,-p1,-p2,+fem],-neg]
sbjp1 -> stem     <t:t(neg1,sb=2|3sf)->   [sb=[+p2,-p1],ob=[-p2],+neg];[sb=[-plr,-p1,-p2,+fem],+neg]
sbjp1 -> stem     <n:'n(sb=1p)->           [sb=[+plr,+p1,-p2],ob=[-p1],-neg]
sbjp1 -> stem     <n:n(neg1,sb=1p)->      [sb=[+plr,+p1,-p2],ob=[-p1],+neg]

## STEM

# Irregular
stem -> stem0     [:{]
stem0 -> stem1    +irr_stem+

# Regular stem
stem0 -> tmp    >>v_stem+<<

# Template
tmp -> tmp_end     >>tmp<<

tmp_end -> stem_feats   [:}]

# End of stem+template
stem_feats -> sbjs  >>stem_feats<<

### SUBJECT SUFFIXES AND OBJECT INFIXES
sbjs -> sbjs_i        [:]    [tm=imf];[tm=j_i]
sbjs -> sbjs_p        [:]    [tm=prf];[tm=ger]

## IMPERFECTIVE, JUSSIVE/IMPERATIVE
# 2/3 plural; go directly to obj
sbjs_i -> obj        <u:-u(sb=2p|3p)>   [sb=[-p1,+plr],ob=[+expl]];[sb=[-p1,+plr],+def];[sb=[-p1,+plr],ob=[-expl],ax=None]
# 2sf; go directly to obj; palatalize previous consonant; don't show the palatalization character
sbjs_i -> obj        <8i:-i(sb=2sf)>   [sb=[+p2,-p1,+fem,-plr,-frm]]
# No suffix: 1s, 2sm, 3s, 1p; 23p when there is no obj and aux
sbjs_i -> sbjs_i0     [:]    [sb=[+p2,-p1,-plr,-fem,-frm]];[sb=[+p1,-p2,-plr]];[sb=[-p1,-p2,-plr]];[sb=[+p1,-p2,+plr]];[sb=[-p1,+plr],tm=imf,ax=al,ob=[-expl],-def]
# Infixes for objects when there is no sbj suffix; -e- for 1s/p, 3sm, 2s frm; -0- for 2p, 3p, prp, 3sf, 2s frm, no obj; -I- for 2s
# -e- for -n, -N, -w, optionally for -wo(t)
sbjs_i0 -> obj        <e:-e(inf)>   [ob=[+p1,-p2,-prp,+expl]];[ob=[-p1,-p2,-plr,-fem,-prp,+expl]];[ob=[-p1,+p2,-plr,+frm,+expl]];[+def,ob=[-expl]]
# -I- for -h, -x, optionally for -wo(t)
sbjs_i0 -> obj        [I:]   [ob=[+p2,+expl,-plr,-prp]]
# No infix for -at, -ac_ew, -ac_hu
sbjs_i0 -> obj        [:]    [ob=[-expl],-def];[ob=[-p1,+plr,+expl]];[ob=[+prp,+expl]];[ob=[+p2,+expl,+plr,]];[ob=[-p1,-p2,-plr,+fem,+expl]]

## PERFECTIVE
# 3sm
sbjs_p -> obj         <e:-e(sb=3sm)>   [tm=prf,sb=[-p1,-p2,-plr,-fem]]
# 1s, 2sm: Ck, Vh; represent as 'h' in output
sbjs_p -> sbjs_pk     <7:-h>   [tm=prf,sb=[-plr]]
# 1s
sbjs_pk -> sbjs_pk1   <u:u(sb=1s)>   [sb=[+p1,-p2],ob=[-p1]]
# kuNN possible when there's no object
sbjs_pk1 -> negs_aux  <N_>
sbjs_pk1 -> obj       [:]
# 2sm: infix for objects other than prep and for definite suffix
sbjs_pk -> obj        <e:(sb=2sm)-e(inf)>   [sb=[-p1,+p2,-fem],ob=[-prp,-p2,+expl]];[sb=[-p1,+p2,-fem],ob=[-expl],+def,+rel,+sub]
sbjs_pk -> obj        <:(sb=2sm)>    [sb=[-p1,+p2,-fem,-frm],ob=[-expl]];[sb=[-p1,+p2,-fem,-frm],ob=[-p2,+prp,+expl]]
# 2sf, no infix
sbjs_p -> obj         <x:-x(sb=2sf)>   [tm=prf,sb=[-p1,+p2,-plr,+fem,-frm],ob=[-p2]]
# 3sf, no infix
sbjs_p -> obj        <ec_:-ec_(sb=3sf)>  [tm=prf,sb=[-p1,-p2,-plr,+fem]]
# 1p, infix for 3sm obj and 2s frm, and +def
sbjs_p -> sbjs_pn     <n:-n(sb=1p)>   [tm=prf,sb=[+p1,+plr],ob=[-p1]]
sbjs_pn -> obj        <e:-e(inf)>   [ob=[-prp,-p1,-p2,-plr,+expl]];[ob=[-p1,+p2,-plr,+frm,-prp,+expl]];[ob=[-expl],+def,+rel,+sub]
sbjs_pn -> obj        [:]      [ob=[-expl],-def];[ob=[+prp,+expl]];[ob=[+plr,-prp,+expl]];[ob=[+p2,-plr,-prp,-frm,+expl]];[ob=[-p2,-plr,-prp,+fem,+expl]]
# 2p: prf or ger
sbjs_p -> obj      <ac_hu:-ac_hu(sb=2p)>  [sb=[+p2,-p1,+plr],ob=[-p2]]
# 3p
sbjs_p -> obj         <u:-u(sb=3p)>   [tm=prf,sb=[-p1,-p2,+plr]]

# GERUNDIVE
# 1; geminate and palatalize previous consonant; don't show the palatalization character
sbjs_p -> obj         <_8E:-_E(sb=1p)> [tm=ger,sb=[+p1,-p2,-plr],ob=[-p1]]
sbjs_p -> sbj_g1p     <en:-en(sb=2p)>  [tm=ger,sb=[+p1,-p2,+plr],ob=[-p1]]
# 1p: infix for 2frm (handle later as prefix before -wo(t)?); 3sm
sbj_g1p -> obj        <e:-e(inf)>   [ob=[-prp,-p1,+expl]];[ob=[-p1,+p2,-plr,+frm,-prp,+expl]]
sbj_g1p -> obj        [:]    [ob=[-expl],-def];[ob=[+expl,-p2,+fem,-plr,-prp]];[ob=[+plr,-prp,+expl]];[ob=[+expl,+p2,-frm,-prp]];[ob=[+expl,+prp]]
# 2s (plural same as perfective)
sbjs_p -> sbj_g2m     <eh:-eh(sb=2sm)>  [tm=ger,sb=[+p2,-p1,-plr,-fem,-frm],ob=[-p2]]
# 2sm: infix for 1 objects, non-prep
sbj_g2m -> obj        <e:-e(inf)>   [ob=[-prp,+p1,+expl]]
sbj_g2m -> obj        [:]    [ob=[-expl]];[ob=[-p2,+prp,+expl]];[ob=[-prp,-p1,-p2,+expl]]
sbjs_p -> obj         <ex:-ex(sb=2sf)>  [tm=ger,sb=[+p2,-p1,-plr,+fem,-frm],ob=[-p2]]
# 3
sbjs_p -> obj         <o:-o(sb=3sm)>   [tm=ger,sb=[-p2,-p1,-plr,-fem]]
sbjs_p -> obj         <a:-a(sb=3sf)>   [tm=ger,sb=[-p2,-p1,-plr,+fem]]
sbjs_p -> obj        <ew:-ew(sb=3p)>  [tm=ger,sb=[-p2,-p1,+plr]]

### OBJECT SUFFIXES
# No object; not definite
obj -> negs_aux          [:]    [ob=[-expl],-def]
# 3sm suffix doubles as definite marker for relative clauses
obj -> def3sm0           [:]    [ob=[-expl],+def,+rel,+sub]
# obj -> negs_aux       <3:-3> [ob=[-expl],+def,+rel,+sub]
# Explicit objects, also definite if relative
obj -> obj0            [:]    [ob=[+expl],+def,+rel];[ob=[+expl],-def,-rel]
# Prepositional
obj0 -> objs1       <b_:-b_(prep2)>  [ob=[+prp,+b,-l]]
obj0 -> objs1       <l_:-l_(prep2)>  [ob=[+prp,+l,-b]]
# Non-prepositional
obj0 -> objs1          [:]    [ob=[-prp]]
# Pronouns
objs1  -> negs_aux     <N_:-N_(ob=1s)>  [ob=[+p1,-p2,-plr]]
objs1  -> negs_aux     <h:-h(ob=2sm)>   [ob=[-p1,+p2,-plr,-fem,-frm]]
objs1  -> negs_aux     <x:-x(ob=2sf)>   [ob=[-p1,+p2,-plr,+fem,-frm]]
objs1  -> negs_aux    <et:-et(ob=3sm)>     [ob=[-p1,-p2,-plr,-fem,+prp]]
# 3sm allomorphs: w, ew, t
objs1  ->  def3sm0    [:]        [ob=[-p1,-p2,-plr,-fem,-prp]]
objs1  -> negs_aux    <at:-at(ob=3sf)>   [ob=[-p1,-p2,-plr,+fem]]
objs1  -> negs_aux     <n:-n(ob=1p)>    [ob=[+p1,-p2,+plr]]
objs1  -> negs_aux   <ac_hu:-ac_hu(ob=2p)> [ob=[-p1,+p2,+plr,-frm]]
objs1  -> negs_aux   <ac_ew:-ac_ew(ob=3p)> [ob=[-p1,-p2,+plr]]
objs1  -> objs_2frm    <wo:-wo(ob=2F)>  [ob=[-p1,+p2,-plr,+frm]]
objs_2frm -> negs_aux  [:;t:]
## def, 3sm_obj
# 3sm and 1s subjects
def3sm0 -> def3sm_3sm    [:]     [sb=[-p1,-p2,-fem,-plr]]
def3sm0 -> def3sm_1s     [:]     [sb=[+p1,-p2,-plr]]
def3sm_3sm -> def3sm_w   [:]     [tm=prf];[tm=imf];[tm=j_i]
def3sm_3sm -> def3sm_t   [:]     [tm=ger]
def3sm_1s -> def3sm_w    [:]     [tm=imf];[tm=j_i];[tm=ger]
def3sm_1s -> def3sm_t    [:]     [tm=prf]
# other subjects
def3sm0 -> def3sm_w      [:]     [sb=[+p2,-p1,-plr]];[sb=[-p1,-p2,+fem,-plr]];[sb=[+p1,-p2,+plr]]
def3sm0 -> def3sm_t      [:]     [sb=[+p2,-p1,+plr]];[sb=[-p1,-p2,+plr]]
def3sm_w -> negs_aux    <3:-w(def|ob=3sm)>
def3sm_t -> negs_aux    <3:-t(def|ob=3sm)>

## NEGATIVE SUFFIX (required if verb is independent) or AUXILIARY VERB or ACCUSATIVE
# AUX; can't cooccur with +neg or +sub
negs_aux -> aux1  <al:-al>   [tm=imf,-sub,-neg,ax=al];[tm=ger,ax=al]
# ysebral, ysebrutal, sebrehal, sebrexal, sebrenal, sebracchWal, sebrewal
aux1  -> cj2      <:(aux)>        [sb=[-p1,-p2,-fem,-plr]];[sb=[-p1,-p2,+plr],ob=[+expl]];[tm=ger,sb=[+plr]];[tm=ger,sb=[+p2]]
aux1  -> cj2      <_ehu:_ehu(aux,sb=1s)>     [sb=[+p1,-p2,-plr]]
aux1  -> cj2      <_eh:_eh(aux,sb=2sm)>      [tm=imf,sb=[+p2,-p1,-plr,-fem,-frm]]
aux1  -> cj2      <_ex:_ex(aux,sb=2sf)>      [tm=imf,sb=[+p2,-p1,-plr,+fem,-frm]]
aux1  -> cj2      <_ec_:_ec_(aux,sb=3sf)>     [sb=[-p2,-p1,-plr,+fem]]
aux1  -> cj2      <_en:_en(aux,sb=1p)>      [tm=imf,sb=[+p1,-p2,+plr]]
aux1  -> cj2      <_ac_hu:_ac_hu(aux,sb=2p)>   [tm=imf,sb=[-p1,+p2,+plr]]
aux1  -> cj2      <_u:_u(aux,sb=3p)>       [tm=imf,sb=[-p1,-p2,+plr],ob=[-expl]]
negs_aux -> noaux  [:]       [ax=None]
# NEGATIVE
noaux -> cj2  <Im:-m(neg2)>         [+neg,-sub,tm=prf];[+neg,-sub,tm=imf];[+neg,-sub,tm=prs]
# ACCUSATIVE
noaux -> cj2  <In:-n(acc)>        [+rel,+acc,pp=None,rl=[-p,+acc]]
# No negs_aux: juss_imp; imprf, prs, or prf: -neg,-ax,-acc; +neg,-ax,+sub,-acc
noaux -> cj2  [:]            [tm=j_i]; [tm=ger]; [tm=imf,-neg,-acc,rl=[-acc]]; [tm=imf,+neg,+sub,-acc,rl=[-acc]]; [tm=prs,-neg,-acc,rl=[-acc]]; [tm=prs,+neg,+sub,-acc,rl=[-acc]]; [tm=prf,-neg,-acc,rl=[-acc]]; [tm=prf,+neg,+sub,-acc,rl=[-acc]]

## CONJUNCTIVE SUFFIXES
cj2 -> end     >>cnj2+<<
cj2 -> end  [:]               [cj2=None]

end ->
