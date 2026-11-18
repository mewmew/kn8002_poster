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

		// (not considering adult neurogenesis).
		However, the fidelity of gene regulation and cell identity maintenance is impacted in ageing. Neurons are especially susceptible since most neurons are post-mitotic throughout adulthood.@2026_epigenetic_aging_yucel @2025_single_cell_transcriptomic_changes_in_ageing_human_brain_jeffries
	]
]

// === [ GRN image ] ===========================================================

// TODO: rename gap to grn-image?
#frame(tag: "gap")[
	#figure(
		image("/inc/gene_regulatory_network.png", width: 80%),
		caption: [#Glspl("GRN", first: false, update: false) specify #gls("G", display: "G") and #gls("TF", display: "TF") interactions.@2026_regvelo_wang],
	) <fig-grn>
]

// === [ Disruptions of GRNs ] =================================================

// TODO: rename description to disruptions?
#frame(tag: "description")[

	== Disruptions of GRNs during ageing

	A disruption of gene expression is observed during ageing, with reduced gene expression levels and gene-to-gene coordination across tissues.@2025_loss_of_gene_gene_coordination_in_aging_wang

	Loss of gene-to-gene coordination during ageing across tissues.

	A universal trend across different tissues, #todo[individual (rather than popilation based)]

	#lorem(10)@2025_brain_aging_and_rejuvenation_sun

	// verbatim: "transcriptomes of specific neurons are highly predictive of an individual’s age" (ref: 2024, Single-cell genomics and regulatory networks for 388 human brains)

	=== Rainwater

	A gradual loss of gene-to-gene coordination is observed during ageing across diverse tissues.

	As outlined in their proof of principle paper, there is a significant positive correlation between loss of gene-to-gene coordination and ageing.@2025_loss_of_gene_gene_coordination_in_aging_wang

	#todo[Molecular regulatory network, connecting cell-cell signalling and gene regulation.]

	// verbatim: "Notably, a transition point emerged at 24 years of age, after which compositional changes declined sharply, marking a shift from active developmental remodelling to relative cellular stabil- ity in the DLPFC" (ref: 2026, Lifespan single-cell transcriptomic atlas of the human prefrontal cortex)

	#todo[Predict suceptible genes in neuron cell (sub)types. Vulnerable. ALS@2026_transcriptomic_altas_brain_disoders_lee]

]

// === [ Interventions on GRNs ] ===============================================

// TODO: rename methods to interventions?
#frame(tag: "methods")[
	== Inference and in silico perturbation of GRNs

	#lorem(50)

	/*
	Single knock-ins have been used to restore age-related loss of regulatory information in #glspl("GRN").@2026_restoring_grns_with_knock_ins_mugler

	This offers a proof-of-principle that targetted interventions on #glspl("GRN") may be used for restoring gene regulation and potentially function in ageing.

	// rather than diminishing returns
	Furthermore, there are indications that multiple knock-ins could have approximately additive effects on restoration of gene regulation.@2026_restoring_grns_with_knock_ins_mugler
	*/

	//#todo[Furthermore, since regulatory effect diminishes based on distance within the GRN, and since most paths between the most restorative candidate knock-in genes are distanced far from each other (most shortest paths are 3 steps or more); multiple knock-ins are expected to have little overlapping effect; thus resulting in additative effect (rather than diminishing returns)].@2026_restoring_grns_with_knock_ins_mugler

	=== In silico perturbation

	#lorem(15)

	=== In vivo validation

	In their pivotal study, #emph[in silico] perturbations were used to predict changes in cell fate if key #glspl("TF") were disrupted. These predictions were later validated #emph[in vivo] using knock-out experiment in zebrafish.@2026_regvelo_wang

]

// === [ Illustrations ] =======================================================

#frame(tag: "illustration")[

	#figure(
		gen-image(image("/inc/regvelo.png")),
		caption: [RegVelo infers cell-type specific #glspl("GRN") from #gls("sc", update: false, first: false)-multiomic data. The inferred #glspl("GRN") are used to model cell fate probabilities and simulate the effects of #gls("TF", update: false, first: false)-perturbations #emph[in silico].@2026_regvelo_wang],
	) <fig-regvelo>

]

// === [ Outlook ] =============================================================

#frame(tag: "outlook")[
	#columns(2)[

		== Summary

		1. #Glspl("CRC") maintain cell identity via positive feedback loops in cell-type specific #glspl("GRN").

		2. Epigenetic ageing disrupts regulation of gene expressions, altering cell-type specific #glspl("GRN").

		3. Cell-type specific #glspl("GRN") can be inferred from #gls("sc") multiomic data (e.g. using RegVelo).

		== Future research

		#lorem(15)

		- Interventions on GRNs.

		- #lorem(5)

		- #lorem(20)

		#lorem(10)

		#colbreak()

		== References

		#set text(size: 14pt)

		#bibliography("references.bib", title: none, style: "spie")

		#include("/glossary.typ")
	]
]
