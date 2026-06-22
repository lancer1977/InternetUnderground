# Activity Log

## 2026-06-21

- Broke the HAID revamp umbrella into three repo-local backlog cards for layout/typography, image cleanup, and asset structure.
- Added a Qwen-oriented spruce workflow note under `docs/workflows/` so local LLM assistance can be used in a controlled, page-by-page loop.
- Added a reusable prompt template and executable helper script for running local Qwen-based spruce passes.
- Added a batch helper plus starter target queue for running page spruce work across multiple archive pages.
- Added Docker fallback support to the Qwen helpers so the spruce workflow can run without a host-installed Ollama binary.
- Switched the Docker path to a persistent Ollama container so background model runs can be reused across spruce batches.
- Pulled `qwen2.5-coder` into the background Ollama container and used it to review the homepage for readability issues before applying a homepage spruce pass.
- Ran the local Qwen spruce loop on `iu/index.html` and applied a contrast/spacing/readability pass for the archive contents page.
- Ran the local Qwen spruce loop on `iu/webguide/index.html` and applied a readability pass focused on font size, contrast, and content breathing room.
- Ran the local Qwen spruce loop on `iu/contact/index.html` and applied a readability pass focused on contrast, spacing, and better use of the content column.
- Ran the local Qwen spruce loop on `iu/current/index.html` and applied a readability pass for the issue landing page after the model flagged the small fonts and fixed-width table layout.
- Rechecked the local Qwen container after the additional archive passes; `qwen2.5-coder` remains installed and available for further spruce runs.
- Ran the local Qwen spruce loop on `iu/archive/index.html` and applied a readability pass for the archive index using a wider shell, larger text, and softer contrast.
- Ran the local Qwen spruce loop on `iu/contest/index.html` and applied a readability pass for the contest page while preserving the long-form contest copy and rules text.
- Ran the local Qwen spruce loop on `iu/online/index.html` and applied a readability pass for the online page with a viewport meta tag, stronger typography, and a centered content shell.
- Broke the HAID work into implementation-sized backlog cards for landing pages, detail pages, and image/nav asset cleanup so the Qwen-assisted spruce loop has a concrete queue.
- Ran the local Qwen spruce loop on representative detail pages (`iu/online/imho/t_3-25-97.htm`, `iu/online/imho/a_6-25-97.htm`, and `iu/webguide/culture/index.html`) and applied the same responsive shell/readability treatment used on the landing pages.
- Identified the shared banner art candidates (`iu/online/imho/imho.gif`, `iu/webguide/wgmap.gif`, and `iu/navart/home.gif`) and split them into a dedicated backlog slice for derived HD cleanup.
- Generated a derived HD banner variant for `iu/online/imho/imho.gif` as `iu/online/imho/imho-hd.png` and rewired the online landing page to use it.
- Generated a derived HD banner variant for `iu/webguide/wgmap.gif` as `iu/webguide/wgmap-hd.png` and rewired the culture index to use it.
- Generated a derived HD banner variant for `iu/navart/home.gif` as `iu/navart/home-hd.png` and rewired the main hub pages to use it.
- Generated derived HD variants for `iu/navart/halfhome.gif` and `iu/navart/halfback.gif` and rewired representative archive/review entry pages to use them.
- Extended the HD half-nav migration to `iu/archive/issue2/index.html` so the archive entry pages keep moving onto the derived nav set.
- Extended the HD half-nav migration to `iu/archive/issue3/index.html` so the archive nav sweep continues across early issue pages.
- Extended the HD half-nav migration to `iu/archive/issue4/index.html` so the archive sweep keeps expanding across early issue pages.
- Extended the HD half-nav migration to `iu/archive/issue6/index.html` so the archive nav sweep now reaches the next issue block.
- Extended the HD half-nav migration to `iu/archive/issue7/index.html` so the archive nav sweep continues through the next issue block.
- Extended the HD half-nav migration to `iu/archive/issue8/index.html` so the archive nav sweep keeps advancing through later issue blocks.
- Extended the HD half-nav migration to `iu/archive/issue9/index.html` so the archive nav sweep now reaches the next issue block.
- Extended the HD half-nav migration to `iu/archive/issue10/index.html` so the archive nav sweep now reaches the next issue block.
- Extended the HD half-nav migration to `iu/archive/issue11/index.html` so the archive nav sweep now reaches the next issue block.
- Extended the HD half-nav migration to `iu/archive/issue12/index.html` so the archive nav sweep now reaches the next issue block.
- Extended the HD half-nav migration to `iu/archive/issue13/index.html` so the archive nav sweep now reaches the next issue block.
- Extended the HD half-nav migration to `iu/archive/issue15/index.html` so the archive nav sweep now reaches the next issue block.
- Extended the HD half-nav migration to `iu/archive/issue16/index.html` so the archive nav sweep now reaches the next issue block.
- Extended the HD home-banner migration to `iu/archive/issue17/index.html` so the final visible archive issue also uses the derived banner asset.
- Migrated the review index plus representative review pages (`iu/online/reviews/imk/index.html`, `iu/online/reviews/unix1/index.html`, and `iu/online/reviews/starfish/index.html`) onto the HD half-nav assets.
- Added derived WebGuide button assets (`wghome-hd.png`, `wgsearch-hd.png`, `wgback-hd.png`) and rewired `iu/webguide/rec/rc_fertnel.htm` to use them alongside the HD map banner.
- Extended the derived WebGuide button migration to `iu/webguide/rec/rc_cyberpets.htm` and `iu/webguide/rec/rc_russroul.htm` so the recommendation pages now have multiple HD examples.
- Extended the derived WebGuide button migration to `iu/webguide/rec/rc_inmchoc.htm` so the recommendation pages keep accumulating HD examples.
- Extended the derived WebGuide button migration to `iu/webguide/rec/rc_bsotlhp.htm` so the recommendation pages keep accumulating HD examples.
- Extended the derived WebGuide button migration to `iu/webguide/rec/rc_avenger.htm` so the recommendation pages keep accumulating HD examples.
- Extended the derived WebGuide button migration to `iu/webguide/rec/rc_fotday.htm` so the recommendation pages keep accumulating HD examples.
- Extended the derived WebGuide button migration to `iu/webguide/rec/rc_bigfootrp.htm` so the recommendation pages keep accumulating HD examples.
- Extended the derived WebGuide button migration to `iu/webguide/rec/rc_irishe.htm` so the recommendation pages keep accumulating HD examples.
- Extended the derived WebGuide button migration to `iu/webguide/rec/rc_mosiactg.htm` so the recommendation pages keep accumulating HD examples.
- Extended the derived WebGuide button migration to `iu/webguide/rec/rc_heatersw.htm`, `iu/webguide/rec/rc_patsbp.htm`, and `iu/webguide/rec/rc_foosbhp.htm` so the recommendation sweep keeps replacing the old banner/buttons with HD local assets.
- Extended the derived WebGuide button migration to `iu/webguide/rec/rc_bramt.htm` and `iu/webguide/rec/rc_chwire.htm` so the recommendation sweep keeps moving through the remaining legacy banner/button pages.
- Extended the derived WebGuide button migration to `iu/webguide/rec/rc_adze.htm` and `iu/webguide/rec/rc_asilvhp.htm` so the remaining recommendation pages keep converging on the HD banner/button set.
- Extended the derived WebGuide button migration to `iu/webguide/rec/rc_advcent.htm`, `iu/webguide/rec/rc_apottyp.htm`, and `iu/webguide/rec/rc_battlesw.htm` so the rec sweep keeps moving through the legacy banner/button pages.
- Extended the derived WebGuide button migration to `iu/webguide/rec/rc_bbfage.htm`, eliminating the last ISO-8859 outlier from the legacy banner/button set.
- Extended the derived WebGuide button migration to `iu/webguide/rec/rc_bradmanp.htm`, `iu/webguide/rec/rc_chibulhp.htm`, and `iu/webguide/rec/rc_dalemurp.htm` so the rec sweep keeps replacing the old banner/footer assets.
- Extended the derived WebGuide button migration to `iu/webguide/rec/rc_crayola.htm`, `iu/webguide/rec/rc_crapdivhp.htm`, `iu/webguide/rec/rc_dadas.htm`, and `iu/webguide/rec/rc_gridgrum.htm` so the legacy rec sweep keeps replacing the old banner/footer art.
- Extended the derived WebGuide button migration to `iu/webguide/rec/rc_ejedssr.htm`, `iu/webguide/rec/rc_fortuneg.htm`, `iu/webguide/rec/rc_hhgttg.htm`, and `iu/webguide/rec/rc_ichingr.htm` so the rec cleanup keeps trimming the remaining legacy banner/footer pages.
- Extended the derived WebGuide button migration to `iu/webguide/rec/rc_adoptac.htm`, `iu/webguide/rec/rc_ansmach.htm`, `iu/webguide/rec/rc_bartlist.htm`, and `iu/webguide/rec/rc_bpcb.htm` so the rec clean-up keeps replacing the old banner/footer art.
- Extended the derived WebGuide button migration to `iu/webguide/rec/rc_hhgossip.htm` and `iu/webguide/rec/rc_javasw.htm` so the rec sweep keeps replacing the legacy banner/footer art.
- Extended the derived WebGuide button migration to `iu/webguide/rec/rc_elbeg.htm`, `iu/webguide/rec/rc_grcahp.htm`, `iu/webguide/rec/rc_ibonej.htm`, and `iu/webguide/rec/rc_jackpot.htm` so the rec sweep keeps replacing the remaining legacy banner/footer art.
- Extended the derived WebGuide button migration to `iu/webguide/rec/rc_lhotelc.htm`, `iu/webguide/rec/rc_lipbalma.htm`, `iu/webguide/rec/rc_mexwres.htm`, and `iu/webguide/rec/rc_ccitw.htm` so the remaining rec pages keep converging on the HD banner/footer set.
- Extended the derived WebGuide button migration to `iu/webguide/rec/rc_swngot.htm` and `iu/webguide/rec/rc_surgames.htm` after skipping the non-existent `rc_sirnw.htm` path, so the live remaining set keeps shrinking.
- Extended the derived WebGuide button migration to `iu/webguide/rec/rc_ljswww.htm` and `iu/webguide/rec/rc_myboss.htm` after isolating them as the remaining live matches in that block.
- Extended the derived WebGuide button migration to `iu/webguide/rec/rc_pnbad.htm` and `iu/webguide/rec/rc_polonet.htm` after re-reading their current markup, keeping the legacy rec sweep moving.
- Extended the derived WebGuide button migration to `iu/webguide/rec/rc_rwssam.htm`, `iu/webguide/rec/rc_smalworld.htm`, and `iu/webguide/rec/rc_swordhp.htm` while leaving already-converted pages alone.
- Extended the derived WebGuide button migration to `iu/webguide/rec/rc_twott.htm` and `iu/webguide/rec/rc_vtlosi.htm` after filtering out the already-converted `rc_hhgttg.htm` page from the batch.
- Extended the derived WebGuide button migration to `iu/webguide/rec/rc_keepersl.htm`, `iu/webguide/rec/rc_llrnet.htm`, `iu/webguide/rec/rc_paragli.htm`, and `iu/webguide/rec/rc_caconhp.htm` so the remaining rec pages keep converging on the HD asset set.
- Extended the derived WebGuide button migration to `iu/webguide/rec/rc_fotdgg.htm`, `iu/webguide/rec/rc_fwgrapes.htm`, and `iu/webguide/rec/rc_rinjurp.htm` after filtering out the already-converted `rc_chwire.htm` and `rc_hhgttg.htm` pages from the candidate set.
- Extended the derived WebGuide button migration to `iu/webguide/rec/rc_balf.htm`, `iu/webguide/rec/rc_beckwor.htm`, and `iu/webguide/rec/rc_boogerp.htm` after filtering out the already-converted `rc_chibulhp.htm` page from the sampled cluster.
- Extended the derived WebGuide button migration to `iu/webguide/rec/rc_craianv.htm` and `iu/webguide/rec/rc_cwotd.htm`, while confirming `iu/webguide/rec/rc_dalemurp.htm` was already on the HD asset path.
- Extended the derived WebGuide button migration to `iu/webguide/rec/rc_dumbass.htm`, `iu/webguide/rec/rc_elvisshp.htm`, and `iu/webguide/rec/rc_fastball.htm` while confirming `iu/webguide/rec/rc_ejedssr.htm` was already on the HD asset path.
- Extended the derived WebGuide button migration to `iu/webguide/rec/rc_hawalkhp.htm` and `iu/webguide/rec/rc_hockeyia.htm`, keeping the remaining legacy rec surface moving toward the HD asset set.
- Extended the derived WebGuide button migration to `iu/webguide/rec/rc_jthome.htm` after re-reading the live markup; the other sampled page in that cluster was already on the HD asset path.
- Extended the derived WebGuide button migration to `iu/webguide/rec/rc_genparo.htm` and `iu/webguide/rec/rc_gillvillm.htm` after skipping already-converted pages in the sampled cluster.
- Extended the derived WebGuide button migration to `iu/webguide/rec/rc_ibonej.htm`, `iu/webguide/rec/rc_ichingr.htm`, and `iu/webguide/rec/rc_mill.htm` while leaving already-converted pages untouched.
- Extended the derived WebGuide button migration to `iu/webguide/rec/rc_ob95oaws.htm`, `iu/webguide/rec/rc_piermil.htm`, and `iu/webguide/rec/rc_readmlip.htm` so the remaining rec pages keep converging on the HD asset set.
- Extended the derived WebGuide button migration to `iu/webguide/rec/rc_muwb.htm`, `iu/webguide/rec/rc_cyranos.htm`, `iu/webguide/rec/rc_nsocchof.htm`, and `iu/webguide/rec/rc_phonetic.htm` so the remaining rec pages keep converging on the HD asset set.
- Extended the derived WebGuide button migration to `iu/webguide/rec/rc_sbxxx.htm`, `iu/webguide/rec/rc_adgrave.htm`, `iu/webguide/rec/rc_sortsnw.htm`, and `iu/webguide/rec/rc_aniotw.htm` so the remaining rec pages keep converging on the HD asset set.
- Extended the derived WebGuide button migration to `iu/webguide/rec/rc_got26o.htm`, `iu/webguide/rec/rc_rcmwi.htm`, and `iu/webguide/rec/rc_barcode.htm` so the remaining rec pages keep converging on the HD asset set.
- Extended the derived WebGuide button migration to `iu/webguide/rec/rc_stpst.htm`, `iu/webguide/rec/rc_santf.htm`, and `iu/webguide/rec/rc_hfit.htm` so the remaining rec pages keep converging on the HD asset set.
- Extended the derived WebGuide button migration to `iu/webguide/rec/rc_taurom.htm`, `iu/webguide/rec/rc_smillershp.htm`, and `iu/webguide/rec/rc_unscipoll.htm` so the remaining rec pages keep converging on the HD asset set.
- Extended the derived WebGuide button migration to `iu/webguide/rec/rc_tpoeyy.htm`, `iu/webguide/rec/rc_tpia.htm`, and `iu/webguide/rec/rc_whiffweb.htm` so the remaining rec pages keep converging on the HD asset set.
- Extended the derived WebGuide button migration to `iu/webguide/rec/rc_cardcollc.htm`, `iu/webguide/rec/rc_ibguide.htm`, and `iu/webguide/rec/rc_iwoptell.htm` so the remaining rec pages keep converging on the HD asset set.
- Extended the derived WebGuide button migration to `iu/webguide/rec/rc_stoopidbn.htm`, `iu/webguide/rec/rc_taotet.htm`, and `iu/webguide/rec/rc_cpitn.htm` so the remaining rec pages keep converging on the HD asset set.
- Extended the derived WebGuide button migration to `iu/webguide/rec/rc_zamboni.htm`, `iu/webguide/rec/rc_leonsptr.htm`, and `iu/webguide/rec/rc_adbackp.htm` so the remaining rec pages keep converging on the HD asset set.
- Extended the derived WebGuide button migration to `iu/webguide/rec/rc_drfunoc.htm`, `iu/webguide/rec/rc_mdogag.htm`, and `iu/webguide/rec/rc_unori.htm` so the remaining rec pages keep converging on the HD asset set.
- Extended the derived WebGuide button migration to `iu/webguide/rec/rc_xavenue.htm`, `iu/webguide/rec/rc_wfdt.htm`, and `iu/webguide/rec/rc_findafr.htm` so the remaining rec pages keep converging on the HD asset set.
- Extended the derived WebGuide button migration to `iu/webguide/rec/rc_tangledw.htm`, `iu/webguide/rec/rc_golfweb.htm`, and `iu/webguide/rec/rc_peacep.htm` so the remaining rec pages keep converging on the HD asset set.
- Extended the derived WebGuide button migration to `iu/webguide/rec/rc_mushroomhp.htm`, `iu/webguide/rec/rc_angusar.htm`, and `iu/webguide/rec/rc_nlfansg.htm` so the remaining rec pages keep converging on the HD asset set.
- Extended the derived WebGuide button migration to `iu/webguide/rec/rc_rcaomi.htm`, `iu/webguide/rec/rc_s200rg.htm`, and `iu/webguide/rec/rc_tnaag.htm` so the remaining rec pages keep converging on the HD asset set.
- Extended the derived WebGuide button migration to `iu/webguide/rec/rc_pyed.htm`, `iu/webguide/rec/rc_ianagrams.htm`, and `iu/webguide/rec/rc_itfotn.htm` so the remaining rec pages keep converging on the HD asset set.
- Extended the derived WebGuide button migration to `iu/webguide/rec/rc_smileys.htm`, `iu/webguide/rec/rc_underwired.htm`, and `iu/webguide/rec/rc_stejacg.htm` so the remaining rec pages keep converging on the HD asset set.
- Extended the derived WebGuide button migration to `iu/webguide/rec/rc_weigtrp.htm`, `iu/webguide/rec/rc_ultifrisp.htm`, and `iu/webguide/rec/rc_stadaar.htm` so the remaining rec pages keep converging on the HD asset set.
- Extended the derived WebGuide button migration to `iu/webguide/rec/rc_bmftsm.htm`, `iu/webguide/rec/rc_caoxlinc.htm`, and `iu/webguide/rec/rc_coolers.htm` so the remaining rec pages keep converging on the HD asset set.
- Extended the derived WebGuide button migration to `iu/webguide/rec/rc_wwwosport.htm`, `iu/webguide/rec/rc_mcioap.htm`, and `iu/webguide/rec/rc_cwsportr.htm` so the remaining rec pages keep converging on the HD asset set.
- Extended the derived WebGuide button migration to `iu/webguide/rec/rc_taglines.htm`, `iu/webguide/rec/rc_mushheav.htm`, and `iu/webguide/rec/rc_wwwosport.htm` and applied the same HD swap to the encoded `iu/webguide/rec/rc_timewaste.htm` page so the remaining rec pages keep converging on the HD asset set.
- Extended the derived WebGuide button migration to `iu/webguide/rec/rc_niagrav.htm`, `iu/webguide/rec/rc_lemonas.htm`, and `iu/webguide/rec/rc_webasketch.htm` so the remaining rec pages keep converging on the HD asset set.
- Extended the derived WebGuide button migration to `iu/webguide/rec/rc_pbfeildl.htm`, `iu/webguide/rec/rc_wtec.htm`, and `iu/webguide/rec/rc_dreamarch.htm` so the remaining rec pages keep converging on the HD asset set.
- Extended the derived WebGuide button migration to `iu/webguide/rec/rc_mtmoron.htm`, `iu/webguide/rec/rc_mushheav.htm`, and `iu/webguide/rec/rc_niagrav.htm` so the remaining rec pages keep converging on the HD asset set.
- Extended the derived WebGuide button migration to `iu/webguide/rec/rc_purityt.htm`, `iu/webguide/rec/rc_legoinfo.htm`, and `iu/webguide/rec/rc_fhgoalp.htm` so the remaining rec pages keep converging on the HD asset set.
- Extended the derived WebGuide button migration to `iu/webguide/rec/rc_godrp.htm`, `iu/webguide/rec/rc_mararts.htm`, and `iu/webguide/rec/rc_squbugz.htm` so the remaining rec pages keep converging on the HD asset set.
- Extended the derived WebGuide button migration to `iu/webguide/rec/rc_acompgen.htm`, `iu/webguide/rec/rc_anglerso.htm`, and `iu/webguide/rec/rc_sledogs.htm` so the remaining rec pages keep converging on the HD asset set.
- Extended the derived WebGuide button migration to `iu/webguide/rec/rc_kujnbn.htm`, `iu/webguide/rec/rc_nhlopenn.htm`, and `iu/webguide/rec/rc_htwumpus.htm` so the remaining rec pages keep converging on the HD asset set.

- Extended the derived WebGuide button migration to `iu/webguide/rec/rc_mararts.htm`, `iu/webguide/rec/rc_pbfeildl.htm`, and `iu/webguide/rec/rc_wtec.htm` so the remaining rec pages keep converging on the HD asset set.

- Extended the derived WebGuide button migration to `iu/webguide/rec/rc_taglines.htm`, `iu/webguide/rec/rc_tadude.htm`, and `iu/webguide/rec/rc_udun.htm` so the remaining rec pages keep converging on the HD asset set.

- Extended the derived WebGuide button migration to `iu/webguide/rec/rc_dreamarch.htm`, `iu/webguide/rec/rc_bloiacm.htm`, and `iu/webguide/rec/rc_majadve.htm` so the remaining rec pages keep converging on the HD asset set.

- Extended the derived WebGuide button migration to `iu/webguide/rec/rc_msgtpge.htm` and `iu/webguide/rec/rc_ticksdg.htm` so the remaining rec pages keep converging on the HD asset set.

- Extended the derived WebGuide button migration to `iu/webguide/rec/rc_wciameri.htm` and `iu/webguide/rec/rc_wstadia.htm` so the remaining rec pages keep converging on the HD asset set.

- Extended the derived WebGuide button migration to `iu/webguide/rec/rc_uaaws.htm` and `iu/webguide/rec/rc_skydivea.htm` so the remaining rec pages keep converging on the HD asset set.

- Extended the derived WebGuide button migration to `iu/webguide/rec/rc_squat.htm` and `iu/webguide/rec/rc_netnoose.htm` so the remaining rec pages keep converging on the HD asset set.

- Extended the derived WebGuide button migration to `iu/webguide/rec/rc_kookr.htm` and `iu/webguide/rec/rc_tenniss.htm` so the remaining rec pages keep converging on the HD asset set.

- Extended the derived WebGuide button migration to `iu/webguide/rec/rc_glidefs.htm` and `iu/webguide/rec/rc_coolem.htm` so the remaining rec pages keep converging on the HD asset set.

- Extended the derived WebGuide button migration to `iu/webguide/rec/rc_hashijc.htm` and `iu/webguide/rec/rc_wbizarre.htm` so the remaining rec pages keep converging on the HD asset set.

- Extended the derived WebGuide button migration to `iu/webguide/rec/rc_psoupk.htm` and `iu/webguide/rec/rc_dotss.htm` so the remaining rec pages keep converging on the HD asset set.

- Extended the derived WebGuide button migration to `iu/webguide/rec/rc_runningp.htm` and `iu/webguide/rec/rc_wordaday.htm` so the remaining rec pages keep converging on the HD asset set.

- Extended the derived WebGuide button migration to `iu/webguide/rec/rc_magicg.htm` and `iu/webguide/rec/rc_htsstdf.htm` so the remaining rec pages keep converging on the HD asset set.

- Extended the derived WebGuide button migration to `iu/webguide/rec/rc_fetishcafe.htm` and `iu/webguide/rec/rc_interneta.htm` so the remaining rec pages keep converging on the HD asset set.

- Extended the derived WebGuide button migration to `iu/webguide/rec/rc_sportsh.htm` and `iu/webguide/rec/rc_mrsailp.htm` so the remaining rec pages keep converging on the HD asset set.

- Extended the derived WebGuide button migration to `iu/webguide/rec/rc_pruhp.htm` and `iu/webguide/rec/rc_paintball.htm` so the remaining rec pages keep converging on the HD asset set.

- Extended the derived WebGuide button migration to `iu/webguide/rec/rc_nethackhp.htm` and `iu/webguide/rec/rc_tdibhist.htm` so the remaining rec pages keep converging on the HD asset set.

- Extended the derived WebGuide button migration to `iu/webguide/rec/rc_cvghp.htm` and `iu/webguide/rec/rc_madlib.htm` so the remaining rec pages keep converging on the HD asset set.

- Extended the derived WebGuide button migration to `iu/webguide/rec/rc_abhpers.htm` and `iu/webguide/rec/rc_dogsr.htm` so the remaining rec pages keep converging on the HD asset set.

- Extended the derived WebGuide button migration to `iu/webguide/rec/rc_netboy.htm` and `iu/webguide/rec/rc_hanggls.htm` so the remaining rec pages keep converging on the HD asset set.

- Extended the derived WebGuide button migration to `iu/webguide/rec/rc_roadtn.htm` and `iu/webguide/rec/rc_wootenwn.htm` so the remaining rec pages keep converging on the HD asset set.

- Extended the derived WebGuide button migration to `iu/webguide/rec/rc_skattin.htm` and `iu/webguide/rec/rc_amtraks.htm` so the remaining rec pages keep converging on the HD asset set.

- Extended the derived WebGuide button migration to `iu/webguide/rec/rc_htkaibfh.htm` and `iu/webguide/rec/rc_connect4.htm` so the remaining rec pages keep converging on the HD asset set.

- Extended the derived WebGuide button migration to `iu/webguide/rec/rc_autogp.htm` and `iu/webguide/rec/rc_bwcaw.htm` so the remaining rec pages keep converging on the HD asset set.

- Extended the derived WebGuide button migration to `iu/webguide/rec/rc_60tpf90.htm` and `iu/webguide/rec/rc_diycaws.htm` so the remaining rec pages keep converging on the HD asset set.

- Extended the derived WebGuide button migration to `iu/webguide/rec/rc_amiskin.htm` and `iu/webguide/rec/rc_splatrat.htm` so the remaining rec pages keep converging on the HD asset set.

- Extended the derived WebGuide button migration to `iu/webguide/rec/rc_ovtcoff.htm` and `iu/webguide/rec/rc_tcwfiles.htm` so the remaining rec pages keep converging on the HD asset set.

- Extended the derived WebGuide button migration to `iu/webguide/rec/rc_sjoejac.htm` and `iu/webguide/rec/rc_vipub.htm` so the remaining rec pages keep converging on the HD asset set.

- Extended the derived WebGuide button migration to `iu/webguide/rec/rc_confessb.htm` and `iu/webguide/rec/rc_cturtle.htm` so the remaining rec pages keep converging on the HD asset set.

- Extended the derived WebGuide button migration to `iu/webguide/rec/rc_twocroq.htm` and `iu/webguide/rec/rc_postsi.htm` so the remaining rec pages keep converging on the HD asset set.

- Extended the derived WebGuide button migration to `iu/webguide/rec/rc_spillus.htm` and `iu/webguide/rec/rc_fbft.htm` so the remaining rec pages keep converging on the HD asset set.

- Extended the derived WebGuide button migration to `iu/webguide/rec/rc_macrobo.htm` and `iu/webguide/rec/rc_halluci.htm` so the remaining rec pages keep converging on the HD asset set.

- Extended the derived WebGuide button migration to `iu/webguide/rec/rc_imillionp.htm` and `iu/webguide/rec/rc_houseb.htm` so the remaining rec pages keep converging on the HD asset set.

- Extended the derived WebGuide button migration to `iu/webguide/rec/rc_auto.htm` and `iu/webguide/rec/rc_butgg.htm` so the remaining rec pages keep converging on the HD asset set.

- Extended the derived WebGuide button migration to `iu/webguide/rec/rc_othello.htm` and `iu/webguide/rec/rc_sumoweb.htm` so the remaining rec pages keep converging on the HD asset set.

- Extended the derived WebGuide button migration to `iu/webguide/rec/rc_nbat10.htm` and `iu/webguide/rec/rc_riddledj.htm` so the remaining rec pages keep converging on the HD asset set.

- Extended the derived WebGuide button migration to `iu/webguide/rec/rc_womhock.htm` and `iu/webguide/rec/rc_ttmycat.htm` so the remaining rec pages keep converging on the HD asset set.

- Extended the derived WebGuide button migration to `iu/webguide/rec/rc_divot.htm` and `iu/webguide/rec/rc_juxtapos.htm` so the remaining rec pages keep converging on the HD asset set.

- Extended the derived WebGuide button migration to `iu/webguide/rec/rc_mlbphp.htm` and byte-safe updated `iu/webguide/rec/rc_popspeak.htm` so the remaining rec pages keep converging on the HD asset set.

- Extended the derived WebGuide button migration to `iu/webguide/rec/rc_tchessn.htm` and `iu/webguide/rec/rc_viperpg.htm` so the remaining rec pages keep converging on the HD asset set.

- Extended the derived WebGuide button migration to `iu/webguide/rec/rc_wlaf.htm` and `iu/webguide/rec/rc_sit80s.htm` so the remaining rec pages keep converging on the HD asset set.

- Extended the derived WebGuide button migration to rc_loversq.htm and rc_ricona.htm.

- Extended the derived WebGuide button migration to rc_hotnwbt.htm and rc_ikaraoke.htm.

- Extended the derived WebGuide button migration to rc_hairdp.htm and rc_csaard.htm.

- Broke the remaining HAID work into explicit backlog conventions for image cleanup, asset structure, and nav/banner asset candidates.

- Applied a conservative readability pass to iu/index.html using the local spruce workflow inputs.

- Applied a conservative readability pass to iu/webguide/index.html using the local spruce workflow inputs.

- Extended the derived WebGuide rec-page migration to rc_60tpf90.htm and rc_abhpers.htm with a small wrapper cleanup.

- Applied a conservative readability pass to iu/contact/index.html using the local spruce workflow inputs.

- Added a cleaner derived home banner at iu/navart/home-clean-hd.png and wired it into iu/search/index.html, iu/online/imho/index.html, and iu/contact/index.html.

- Wired the cleaner derived home banner into iu/webguide/index.html as the primary hub-facing version.

- Switched iu/contest/index.html to the cleaned derived home banner so the visible home-banner set is now consistently on the new asset.

- Switched iu/subfaq.htm and iu/online/imho/t_7-2-97.htm to the cleaned derived home banner.

- Switched iu/online/imho/a_6-25-97.htm, iu/online/imho/t_4-15-97.htm, and iu/online/imho/r_6-17-97.htm to the cleaned derived home banner.

- Replaced the remaining legacy home.gif references across the older IMHO pages with the cleaned derived home banner.

- Extended the derived WebGuide button migration to c_rahhp.htm, c_death.htm, and c_sag.htm.

- Bulk-migrated the remaining iu/webguide/culture/*.htm pages from the legacy wg*.gif nav set to the derived HD nav assets.

- Bulk-migrated iu/webguide/**/*.htm and .html from the legacy wg*.gif nav set to the derived HD nav assets.
