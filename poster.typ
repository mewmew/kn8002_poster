#let todo = highlight

#import "poster_setup.typ": poster, frame, foreground, background, palette, pad-mini

#import "@preview/cellpress-unofficial:0.1.2": cellpress-blue
#import "@preview/glossarium:0.5.10": register-glossary, make-glossary, gls, Gls, glspl, Glspl
#import "@preview/codetastic:0.2.2": qrcode

#let qr = block(
	inset: (left: 1cm),
	qrcode(
		"https://www.su.se/english/research/research-catalogue/research-groups/4/marek-bartosovics-research-group",
		width: 3cm,
		//colors: (palette.contrast.transparentize(97%), black),
		colors: (white, black),
		quiet-zone: 0,
	)
)

#let term(body) = {
	text(fill: palette.highlight.darken(40%))[#body]
}

#show ref: set text(fill: cellpress-blue)
#show link: set text(fill: cellpress-blue)
#show cite: set text(fill: cellpress-blue)
#show footnote: set text(fill: cellpress-blue)

#set list(spacing: 1em)

#set figure(supplement: "Fig")
#set figure.caption(separator: ".")

// figure-caption displays the caption of figures.
#let figure-caption(it) = context {
	// Left align caption if more than one line. Otherwise, center align.
	set text(size: 0.85em)
	align(
		center,
		block({
			set align(left)
			strong[#it.supplement~#it.counter.display(it.numbering)#it.separator]
			[ ]
			it.body
		})
	)
}

#show figure.caption: figure-caption

#show: make-glossary

// === [ Glossary ] ============================================================

#import "/glossary_list.typ": glossary-list

#register-glossary(glossary-list)

#show: poster.with(
	title: [Gene regulatory networks in maintenance of cell identity],
	subtitle: box(inset: 6mm)[Disruption during ageing and targetted interventions],
	authors: [
		Robin Eklind \
		#text(weight: "regular")[#emph[supervisor:]]
		#v(-0.7em)
		Marek Bartosovic
	],
	affiliation: [Stockholm University],
	qr-code: qr,
	//date: datetime.today().display(),
	cover-image: [
		#figure(
			image("/inc/core_regulatory_circuit.pdf", width: 85%),
			caption: [#Glspl("CRC", update: false, first: false) maintain cell identity via positive feedback loops in cell-type specific #glspl("GRN", update: false, first: false).@2024_cell_fate_determination_via_core_regulatory_complex_lee]
		) <fig-core_regulatory_circuit>

		#figure(
			image("/inc/epigenetic_aging.pdf"),
			// NOTE: text size hack to fit on one line.
			caption: text(size: 0.98em)[Epigenetic ageing disrupts regulation of gene expression, altering cell-type specific #glspl("GRN", update: false, first: false).@2026_epigenetic_aging_yucel],
		) <fig-epigenetic_aging>
	],
	credit: "Poster figures adapted from papers in reference list.",
	foreground: foreground,
	background: background,
)

#let gen-image(img) = {
	rect(fill: white, radius: 5mm)[#img]
}

// === [/ Glossary ] ===========================================================

// === [ Introduction ] ========================================================

#frame(tag: "introduction")[
	#columns(2)[

		== Journey in cell fate

		// TODO: use ref to molecular regulatory network figure (if added) instead
		// of @fig-core_regulatory_circuit.
		As cells journey during development across the epigenetic Waddingtonian landscape, their cell fate is guided by morphogens and cell-cell signalling that activate or repress genes, thus establishing and (re)shaping cell-type specific gene expressions (see @fig-core_regulatory_circuit).@2016_what_is_a_cell_type_arendt

		Such cell-type specific regulation of gene expression can be modelled using #glspl("GRN"), graph representations that capture the positive and negative interactions between #glspl("TF") and #glspl("G") (see @fig-grn).@2026_regvelo_wang

		//#todo[Meanwhile, the gene regulatory effects of cell-cell signalling can be modelled using molecular regulatory networks.]

		=== What is a cell type?

		A cell type can be characterised based on the genes it expresses, including:

		- #term[housekeeping genes]: \ universal cellular maintenance (e.g. energy metabolism)@2025_single_cell_transcriptomic_changes_in_ageing_human_brain_jeffries
		- #term[effector genes]: \ cell-type specific physiological functions (e.g. ion channels)@2026_dissecting_grns_coverning_cell_fate_ding
		- #term[terminal selector genes]: \ establish and maintain cell identity through coordinated regulation of #glspl("TF"), including regulation of downstream effector genes@2016_what_is_a_cell_type_arendt

		=== Maintenance of cell identity

		To establish and maintain cell identity, #glspl("TSG") express #glspl("TF") that maintain their own expression via positive feedback loops, as denoted by a #gls("CRC") within the #gls("GRN") of a given cell type (see @fig-core_regulatory_circuit).@2024_cell_fate_determination_via_core_regulatory_complex_lee @2016_what_is_a_cell_type_arendt

		Ingenious in its conceptual simplicity, the #gls("CRC") of a given cell type maintains its own expression, regulates the expression of cell-type specific effector genes and inhibits the #glspl("CRC") of alternative cell fates (see @fig-core_regulatory_circuit).@2024_cell_fate_determination_via_core_regulatory_complex_lee @2016_what_is_a_cell_type_arendt

		//Within the #gls("GRN") of a given cell type, the #gls("CRC") corresponds to a strongly connected component of the graph.

		In essence, this captures how a post-mitotic cell maintains its cell identity.@2016_what_is_a_cell_type_arendt

		However, in ageing the fidelity of gene regulation is diminished, thus impeding cell identity maintenance.@2026_epigenetic_aging_yucel @2025_loss_of_gene_gene_coordination_in_aging_wang

		//most neurons (not considering adult neurogenesis).
		Neurons are especially susceptible, since most neurons are post-mitotic throughout adulthood.@2026_epigenetic_aging_yucel @2025_single_cell_transcriptomic_changes_in_ageing_human_brain_jeffries @2025_loss_of_gene_gene_coordination_in_aging_wang
	]
]

// === [ GRN image ] ===========================================================

// TODO: rename gap to grn-image?
#frame(tag: "gap")[
	// NOTE: align bottom is a hack to enable more text in the second column of
	// the introduction to overflow into the 'gap' frame.
	#align(bottom)[
		#figure(
			image("/inc/gene_regulatory_network.png", width: 75%),
			caption: [#Glspl("GRN", first: false, update: false) specify #gls("G", display: "G") and #gls("TF", display: "TF") interactions.@2026_regvelo_wang],
		) <fig-grn>
	]
]

// === [ Disruptions of GRNs ] =================================================

// TODO: rename description to disruptions?
#frame(tag: "description")[

	== Disruptions of GRNs during ageing

	In ageing, a disruption of gene regulation is observed as a universal trend across different tissues, where reduced levels of gene expression and gene-to-gene coordination are significantly correlated with age.@2025_loss_of_gene_gene_coordination_in_aging_wang

	#[
		#set text(size: 0.8em)
		#quote(block: true, attribution: [#cite(<2026_epigenetic_aging_yucel>, form: "prose")])[#emph["In ageing cells, especially long-lived or non-dividing cells, chromatin architecture is progressively compromised."]]
	]

	//Measurable as higher Shannon entropy.

	//Importantly, individual (rather than population based) sc-multiomics have enabled insights into gene-to-gene coordination.

	Leading causes of epigenetic dysregulation in ageing (see @fig-epigenetic_aging) include:

	- #term[#box(inset: (right: -0.5cm))[Deterioration of nuclear architecture]] \ #box(inset: (right: -0.5cm))[weakened #gls("LAD", update: true, first: false) and #gls("TAD", update: true, first: false) boundaries@2026_epigenetic_aging_yucel]
	//loss of specificity in enhancer-promotor looping interactions

	- #term[Disruption of epigenetic memory] \ imbalance of #gls("PRC2", update: true, first: false)-#gls("KDM6", update: true, first: false) system@2026_epigenetic_aging_yucel
	//bistable PRC2-KDM6 system

	- #term[Nucleosome alterations] \ #box(inset: (right: -0.6cm))[histone variant H3.3 replaces H3.1/2@2026_epigenetic_aging_yucel]

	- #term[Transcription reprogramming] \ accessibility reduced to enhancers for #glspl("TSG") while increased for cross-lineage genes@2026_epigenetic_aging_yucel

	// verbatim: "miswiring often favours stress-responsive or developmental genes", "can initiate stable changes in transcriptional programmes" @2026_epigenetic_aging_yucel
	Collectively, epigenetic dysregulation causes a progressive loss of cell identity in ageing.@2026_epigenetic_aging_yucel

	//changes in chromatin accessability

	// TODO: use ref @2026_epigenetic_aging_yucel?

	//Ageing thus results in progressive loss of stable cell identity.@2025_loss_of_gene_gene_coordination_in_aging_wang

	// verbatim: "transcriptomes of specific neurons are highly predictive of an individual’s age" (ref: 2024, Single-cell genomics and regulatory networks for 388 human brains)

	// verbatim: "Notably, a transition point emerged at 24 years of age, after which compositional changes declined sharply, marking a shift from active developmental remodelling to relative cellular stability in the DLPFC" (ref: 2026, Lifespan single-cell transcriptomic atlas of the human prefrontal cortex)

	// verbatim: "spatial loss of gene expression correlates with increased transcriptional variability, enhancer promiscuity and the breakdown of cell identity maintenance" (ref: 2026, Systemic epigenetic dysregulation as a driver of ageing and a therapeutic target)
]

// === [ Interventions on GRNs ] ===============================================

// TODO: rename methods to interventions?
#frame(tag: "methods")[
	== Inference and in silico perturbation of GRNs

	With the rise of #gls("sc", update: true, first:false)-multiomics, gene regulatory dynamics during development, maturity, ageing and pathology are now being unravelled.@2022_cell_maturity_alvarez @2026_regvelo_wang

	There exist a huge variety of methods for inferring cell-type specific #glspl("GRN") from #gls("sc")-multiomic data (e.g. scRNA-seq, scATAC-seq), such as SCENIC+.@2023_grn_inference_with_sc_multiomics_badia @2026_regvelo_wang

	=== In silico perturbation

	RegVelo is a deep learning based method for modelling gene regulatory and RNA splicing interactions.@2026_regvelo_wang

	// (from literature or inferred)
	// (splicing kinetics)
	A prior #gls("GRN") and RNA velocity data inputs are used to simulate cell fate changes when performing #emph[in silico] perturbations of #glspl("TF") (see @fig-regvelo).@2026_regvelo_wang

	/*
	Single knock-ins have been used to restore age-related loss of regulatory information in #glspl("GRN").@2026_restoring_grns_with_knock_ins_mugler

	This offers a proof-of-principle that targetted interventions on #glspl("GRN") may be used for restoring gene regulation and potentially function in ageing.

	// rather than diminishing returns
	Furthermore, there are indications that multiple knock-ins could have approximately additive effects on restoration of gene regulation.@2026_restoring_grns_with_knock_ins_mugler
	*/

	//#todo[Furthermore, since regulatory effect diminishes based on distance within the GRN, and since most paths between the most restorative candidate knock-in genes are distanced far from each other (most shortest paths are 3 steps or more); multiple knock-ins are expected to have little overlapping effect; thus resulting in additative effect (rather than diminishing returns)].@2026_restoring_grns_with_knock_ins_mugler

	=== In vivo validation

	In their pivotal study, #emph[in silico] perturbations were used to predict changes in cell fate if key #glspl("TF") were disrupted. These predictions were later validated #emph[in vivo] using knock-out experiment in zebrafish.@2026_regvelo_wang

]

// === [ Illustrations ] =======================================================

#frame(tag: "illustration")[
	// NOTE: align bottom is a hack to enable more text in the "Disruptions of
	// GRNs during ageing" column to overflow into the 'illustration' frame.
	#align(bottom)[
		#figure(
			gen-image(image("/inc/regvelo.png", width: 80%)),
			caption: [RegVelo infers cell-type specific #glspl("GRN") from #gls("sc", update: false, first: false)-multiomic data. The inferred #glspl("GRN") are used to model cell fate probabilities and simulate the effects of #gls("TF", update: false, first: false)-perturbations #emph[in silico].@2026_regvelo_wang],
		) <fig-regvelo>
	]
]

// === [ Outlook ] =============================================================

#frame(tag: "outlook")[
	#columns(2)[

		== Summary

		1. #Glspl("CRC") maintain cell identity via positive feedback loops in cell-type specific #glspl("GRN").

		2. Epigenetic ageing disrupts regulation of gene expressions, altering cell-type specific #glspl("GRN").

		3. Cell-type specific #glspl("GRN") can be inferred from #gls("sc", display: "sc")-multiomic data (e.g. using RegVelo).

		4. #todo[#emph[In silico] perturbations #lorem(10)]

		== Future research

		#lorem(15)

		- Interventions on GRNs.

		- #todo[Predict suceptible genes in neuron cell (sub)types. Vulnerable. ALS@2026_transcriptomic_altas_brain_disoders_lee]

		- #todo[Restoration of feedback loops. Box 1 of @2026_epigenetic_aging_yucel]

		- #lorem(5)

		#lorem(10)

		#colbreak()

		== References

		#set text(size: 13pt)

		#bibliography("references.bib", title: none, style: "spie")

		#include("/glossary.typ")
	]
]
