#import "@preview/glossarium:0.5.10": print-glossary

#import "/glossary_list.typ": glossary-list

// --- [ Glossary ] ------------------------------------------------------------

== Glossary

#set text(size: 18pt)

#columns(2)[
	#print-glossary(
		disable-back-references: true,
		show-all: false, // TODO: remove show-all
		glossary-list,
		entry-sortkey: e => lower(e.at("sort")),
	)
]
