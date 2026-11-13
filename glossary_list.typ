#let todo = highlight

#import "@preview/glossarium:0.5.10": gls, Gls, glspl, Glspl

// register glossary
#let glossary-list = (
	// general
	(
		key: "iPSC",
		long: "induced pluripotent stem cell",
		//description: [differentiated cell "reprogrammed" to regain pluripotency, with the ability to differentiate into any cell type of the organism (but not the placenta)]
	),
	(
		key: "GRN",
		long: "gene regulatory network",
	),
	(
		key: "TF",
		long: "transcription factor",
	),
	(
		key: "G",
		long: "gene",
	),
	(
		key: "CoRC",
		long: "core regulatory complex",
		longplural: [core regulatory complexes],
		//description: [regulatory complex of terminal #gls("TF", plural: true, update: false, first: false) which help maintain cell identity and upregulate cell-type-specific effector genes],
	),
)
