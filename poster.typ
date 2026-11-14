#let todo = highlight

#import "poster_setup.typ": poster, frame, foreground, background, palette, pad-mini

#import "@preview/cellpress-unofficial:0.1.2": cellpress-blue
#import "@preview/hallon:0.1.4" as hallon: subfigure
#import "@preview/glossarium:0.5.10": register-glossary, make-glossary, gls, Gls, glspl, Glspl
#import "@preview/codetastic:0.2.2": qrcode

#let qr = block(
	inset: (left: 1cm),
	qrcode(
		"https://www.su.se/english/research/research-catalogue/research-groups/4/marek-bartosovics-research-group", // TODO: update to poster PDF/source code?
		width: 3cm,
		//colors: (palette.contrast.transparentize(97%), black),
		colors: (white, black),
		quiet-zone: 0,
	)
)

#show ref: set text(fill: cellpress-blue)
#show link: set text(fill: cellpress-blue)
#show cite: set text(fill: cellpress-blue)
#show footnote: set text(fill: cellpress-blue)

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

#show: hallon.style-figures.with(figure-caption: figure-caption)

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
			image("/inc/core_regulatory_circuit.pdf", width: 80%),
			caption: [#Gls("CRC") maintaining cell identity via positive feedback loop in cell-type specific #gls("GRN")@2024_cell_fate_determination_via_core_regulatory_complex_lee.]
		) <fig-core_regulatory_circuit>

		#figure(
			image("/inc/epigenetic_aging.pdf"),
			caption: [Epigenetic ageing disrupts cell-type specific regulation of gene expression@2026_epigenetic_aging_yucel.],
		) <fig-epigenetic_aging>

		// TODO: add RegVelo image.
		//#image("/inc/regvelo.png")
	], // TODO: replace cover image (or use PDF version)
	credit: "Poster figures adapted from papers in reference list.",
	foreground: foreground,
	background: background,
)

#let gen-image(img) = layout(container => {
	let width = 100%
	let aspect-ratio = 1 // 1.3
	let radius = 10pt
	let margin = 8mm
	let fill = luma(92%)
	let height = container.width * aspect-ratio
		rect(
			fill: white.transparentize(0%),
			width: width,
			height: height,
			radius: radius,
		)[
			#align(
				horizon + center,
				square(
					inset: 0pt,
					width: container.width - margin,
					stroke: none,
					fill: fill,
				)[#img]
			)
		]
	}
)

// === [/ Glossary ] ===========================================================

// === [ Introduction ] ========================================================

#frame(tag: "introduction")[
	#columns(2)[

		An gradual loss of gene-to-gene coordination is observed during ageing across diverse tissues.

		A universal trend across different tissues

		Loss of gene-to-gene coordination during ageing across tissues.

		As outlined in their proof of principle paper, age-related loss of gene coordination is #todo[correlated] with ageing @2025_loss_of_gene_gene_coordination_in_aging_wang.

		Neurons especially #todo[vulnerable/susceptible], since most are post-mitotic throughout life (only #todo[0.1%] adult neurogenensis).

		#Glspl("GRN"), #gls("TF"), #gls("G")

		#lorem(50) @2026_regvelo_wang

		#colbreak()

		#lorem(20)
	]
]

// === [ GRN image ] ===========================================================

// TODO: rename gap to grn-image?
#frame(tag: "gap")[
	#figure(
		image("/inc/gene_regulatory_network.png"),
		caption: [#Glspl("GRN", first: false, update: false) specify #gls("G", first: false, update: false) and #gls("TF", first: false, update: false) interactions.],
	) <fig-grn>
]

// === [ Disruptions of GRNs ] =================================================

// TODO: rename description to disruptions?
#frame(tag: "description")[

	== Disruptions of GRNs during ageing

	A disruption of gene expression is observed during ageing, with reduced gene expression levels and gene-to-gene coordination across tissues @2025_loss_of_gene_gene_coordination_in_aging_wang @2026_restoring_grns_with_knock_ins_mugler.

	#lorem(30)

	=== Rainwater

	#lorem(25)

]

// === [ Interventions on GRNs ] ===============================================

// TODO: rename methods to interventions?
#frame(tag: "methods")[
	== Interventions on GRNs

	Single knock-ins have been used to restore age-related loss of regulatory information in #glspl("GRN") @2026_restoring_grns_with_knock_ins_mugler.

	This offers a proof-of-principle that targetted interventions on #glspl("GRN") may be used for restoring gene regulation and potentially function in ageing.

	// rather than diminishing returns
	Furthermore, there are indications that multiple knock-ins could have approximately additive effects on restoration of gene regulation @2026_restoring_grns_with_knock_ins_mugler.

	//#todo[Furthermore, since regulatory effect diminishes based on distance within the GRN, and since most paths between the most restorative candidate knock-in genes are distanced far from each other (most shortest paths are 3 steps or more); multiple knock-ins are expected to have little overlapping effect; thus resulting in additative effect (rather than diminishing returns)] @2026_restoring_grns_with_knock_ins_mugler.

	=== Spring equinox

	#lorem(15)
]

// === [ Illustrations ] =======================================================

#frame(tag: "illustration")[

	#figure(
		grid(
			columns: 3,
			gutter: pad-mini * 1mm,
			subfigure(gen-image(rect(fill: aqua)), caption: [foo]),
			subfigure(gen-image(rect(fill: aqua)), caption: [foo]),
			subfigure(gen-image(rect(fill: aqua)), caption: [foo]),
		),
		gap: 1cm,
		caption: [foo],
	)

]

// === [ Outlook ] =============================================================

#frame(tag: "outlook")[
	#columns(2)[

		== Summary

		#lorem(3)

		#lorem(5)

		1. #lorem(10)

		2. #lorem(25)

		#lorem(10)

		== Future research

		#lorem(15)

		- #lorem(5)

		- #lorem(20)

		#lorem(10)

		== References

		#set text(size: 18pt)

		#bibliography("references.bib", title: none, style: "spie")

		#include("/glossary.typ")
	]
]
