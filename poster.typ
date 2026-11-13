#import "poster_setup.typ": poster, foreground, background

#show: poster.with(
	title: [Gene regulatory networks in maintenance of cell identity],
	subtitle: box(inset: 6mm)[Disruption during aging and targetted interventions],
	authors: [
		Robin Eklind \
		#text(weight: "regular")[#emph[supervisor:]]
		#v(-0.7em)
		Marek Bartosovic
	],
	affiliation: [Stockholm University],
	//qr-code: qr,
	//date: datetime.today().display(),
	cover-image: image("/inc/regvelo.png"), // TODO: replace cover image (or use PDF version)
	credit: "Poster figures adapted from papers in reference list.",
	foreground: foreground,
	background: background,
)
