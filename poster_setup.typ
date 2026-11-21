#import "@preview/stockholm-syndrome:0.1.0": stockholm-syndrome, stockholm-syndrome-setup, _page-foreground, _page-background, theme-helper

#import "@preview/cellpress-unofficial:0.1.2": cellpress-blue, cellpress-red

#let paper-width  =  720 //  72 cm
#let paper-height = 1000 // 100 cm

#let custom-container = (
	x: 0,
	y: 0,
	width:  paper-width,  //  72 cm
	height: paper-height, // 100 cm
)

#let pad           =  35 //  3.5 cm
#let pad-mini      =   5 //  0.5 cm
#let pad-mid       =  25 //  2.5 cm
#let pad-half-side =  10 //  1.0 cm
#let side-width    = 300 // 30 cm

// full = pad + side-width + pad-mid + pad-mid + side-width + pad = 720 (72 cm)
// full = 35  + 300        + 25      + 25      + 300        + 35  = 720 (72 cm)

#let half-side-width = side-width/2 - pad-half-side // 300/2 - 10 = 140 (14 cm)

// --- [ left side ] -----------------------------------------------------------

// (width: 300, height: 45)
#let title-width  = side-width
#let title-height = 45

// (width: 300, height: 25)
#let subtitle-width  = side-width
#let subtitle-height = 25

// (width: 295, height: 10)
#let details-width  = side-width - pad-mini // 300 - 5 = 295 (29.5 cm)
#let details-height = 10

// (width: 300, height: 835)
#let intro-width  = side-width

#let title-x    = pad            // 35     = 35 (3.5 cm)
#let subtitle-x = pad            // 35     = 35 (3.5 cm)
#let details-x  = pad + pad-mini // 35 + 5 = 40 (4.0 cm)
#let intro-x    = pad            // 35     = 35 (3.5 cm)

#let title-y    = pad                                    // 35           =  35  (3.5 cm)
#let subtitle-y = title-y + title-height + pad-mini      // 35 + 45 + 5  =  85  (8.5 cm)
#let details-y  = subtitle-y + subtitle-height + pad-mid // 85 + 25 + 5  = 115 (11.5 cm)
#let intro-y    = details-y + details-height + pad-mid   // 115 + 10 + 5 = 130 (13.0 cm)

#let intro-height = paper-height - intro-y - pad // 1000 - 130 - 35 = 835 (83.5 cm)

// --- [ right side ] ----------------------------------------------------------

#let ride-side-x = pad + side-width + pad-mid + pad-mid // 35 + 300 + 25 + 25 = 385 (38.5 cm)

// TODO: rename description to ageing?

// (width: 140, height: 345)
#let description-width  = half-side-width // 140 (14.0 cm)
#let description-height = 345             // 345 (34.5 cm)

// TODO: rename methods to silico?

// (width: 140, height: 345)
#let methods-width  = half-side-width // 140 (14.0 cm)
#let methods-height = 345             // 345 (34.5 cm)

// (width: 300, height: 170)
#let illustration-width  = side-width // 300 (30.0 cm)
#let illustration-height = 170        // 170 (17.0 cm)

#let description-x  = ride-side-x                                         // 385              = 385 (38.5 cm)
#let methods-x      = description-x + description-width + 2*pad-half-side // 385 + 140 + 2*10 = 545 (54.5 cm)
#let illustration-x = ride-side-x                                         // 385              = 385 (38.5 cm)
#let outlook-x      = ride-side-x                                         // 385              = 385 (38.5 cm)

#let description-y  = pad                                               // 35             =  35  (3.5 cm)
#let methods-y      = pad                                               // 35             =  35  (3.5 cm)
#let illustration-y = description-y + description-height + pad-mid      // 35 + 345 + 25  = 405 (40.5 cm)
#let outlook-y      = illustration-y + illustration-height + pad-mid    // 405 + 170 + 25 = 600 (60.0 cm)

// (width: 300, height: 365)
#let outlook-width  = side-width                     // 300             = 300 (30.0 cm)
#let outlook-height = paper-height - outlook-y - pad // 1000 - 600 - 35 = 365 (36.5 cm)

#let custom-frames = (
	// left side
	title: (
		x:      title-x,
		y:      title-y,
		width:  title-width,
		height: title-height,
	),
	subtitle: (
		x:      subtitle-x,
		y:      subtitle-y,
		width:  subtitle-width,
		height: subtitle-height,
	),
	details: (
		x:      details-x,
		y:      details-y,
		width:  details-width,
		height: details-height,
	),
	introduction: (
		x:      intro-x,
		y:      intro-y,
		width:  intro-width,
		height: intro-height,
	),
	// right side
	description: (
		x:      description-x,
		y:      description-y,
		width:  description-width,
		height: description-height,
	),
	methods: (
		x:      methods-x,
		y:      methods-y,
		width:  methods-width,
		height: methods-height,
	),
	illustration: (
		x:      illustration-x,
		y:      illustration-y,
		width:  illustration-width,
		height: illustration-height,
	),
	outlook: (
		x:      outlook-x,
		y:      outlook-y,
		width:  outlook-width,
		height: outlook-height,
	),
)

#let palette = (
	base:      luma(10%),
	fg:        black,
	bg:        white,
	highlight: cellpress-red,
	contrast:  cellpress-blue,
	melon:     orange.lighten(80%),
)

#let custom-theme = theme-helper(
	palette: palette,
	fonts: (
		base: "Source Sans Pro",
		raw:  "Source Code Pro",
		math: (
			"Fira Math",
			"New Computer Modern Math", // safe fallback
		),
	),
	overrides: (
		text: (
			title: (
				size: 60pt,
				weight: "semibold",
				features: (smcp: 0, c2sc: 0, onum: 0),
			),
			subtitle: (
				size: 51pt,
				weight: "regular",
				features: (smcp: 0, c2sc: 0, onum: 0),
				style: "italic",
			),
			author: (
				size: 30pt,
				weight: "semibold",
				fill: black,
			),
			affiliation: (
				size: 28pt,
				features: (smcp: 0, c2sc: 0, onum: 0),
				fill: black,
			),
			date: (
				fill: black,
			),
			heading: (
				size: 40pt,
				weight: "semibold",
				features: (smcp: 0, c2sc: 0, onum: 0),
			),
			subheading: (
				size: 34pt,
				features: (smcp: 0, c2sc: 0, onum: 0),
				style: "italic",
			),
			introduction: (
				size: 26pt,
			),
			default: (
				size: 26pt,
			),
		),
		par: (
			introduction: (justify: true),
			outlook:      (justify: true),
		),
	),
)

#let debug-boxes = true
#let debug-boxes = false

#let foreground = _page-foreground(frames: none)
#if debug-boxes {
	foreground = _page-foreground(frames: custom-frames)
}

#let background = _page-background(
	theme:     custom-theme,
	frames:    custom-frames,
	container: custom-container,
)

#let (poster, frame) = stockholm-syndrome-setup(
	theme:     custom-theme,
	frames:    custom-frames,
	container: custom-container,
)
