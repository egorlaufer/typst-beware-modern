#import "@preview/fontawesome:0.2.1": *

#let beware-modern-blue = rgb(50, 82, 122)

#let heading-line(line-fr, title-fr, title) = {
  set text(weight: "regular", size: 12.4pt)
  set block(above: 6pt, below: 3pt)
  grid(
    columns: (line-fr, title-fr),
    gutter: 0pt,
    inset: 4pt,
    align: horizon,
    [#box(fill: beware-modern-blue, radius: 1em, width: 21mm, height: 0.18em)],
    align(left, text(fill: beware-modern-blue, title))
  )
}

#let subheading-line(line-fr, title-fr, title) = {
  set text(weight: "regular", size: 10pt)
  set block(above: 2pt, below: 2pt)
  grid(
    columns: (line-fr, title-fr),
    gutter: 0pt,
    inset: 4pt,
    align: horizon,
    [#line(length: 21mm, stroke: (paint: beware-modern-blue, thickness: 0.04em, dash: "dashed"))],
    align(left, text(fill: beware-modern-blue, title))
  )
}

#let cv-repo(name: [], description: [], github: []) = {
  set block(below: 0pt)

  place(
    right,
    dy: 3pt,
    text(
      8pt,
      fill: luma(25%),
      [#text(baseline: 1pt, fa-icon("github")) #link("https://github.com/" + github)[#github]]
    )
  )

  table(
    columns: (1fr, 7fr),
    stroke: none,
    align(right, name),
    description
  )
}

#let cv-talk(date: [], title: [], event: [], venue: []) = {
  set block(below: 0pt)
  set text(8pt)

  place(right, dy: 4pt, text(8pt, fill: luma(25%), [#fa-icon("location-dot") #venue]))
  table(
    columns: (1fr, 7fr),
    stroke: none,
    align(right, date),
    [#strong(title), #emph(event)]
  )
}

#let _header(
  title: [],
  subtitle: [],
  socials: (:),
) = {
  let titleStack = stack(
    dir: ttb,
    spacing: 1em,
    text(size: 14.4pt, weight: "bold", title),
    text(size: 10pt, weight: "bold", subtitle),
    block(below: 2pt),
  )

  let social(icon, link_prefix, username) = [
    #fa-icon(icon) #link(link_prefix + username)[#username]
  ]

  let socialsList = ()
  if "location" in socials {
    socialsList.push([ #fa-icon("globe") #socials.location ])
  }
  if "phone" in socials {
    socialsList.push(social("phone", "tel:", socials.phone))
  }
  if "email" in socials {
    socialsList.push(social("envelope", "mailto:", socials.email))
  }
  if "web" in socials {
    socialsList.push(social("globe", "https://", socials.web))
  }
  if "github" in socials {
    socialsList.push(social("github", "https://github.com/", socials.github))
  }
  if "linkedin" in socials {
    socialsList.push(social("linkedin", "https://linkedin.com/in/", socials.linkedin))
  }

  let socialStack = stack(
    dir: ltr,
    spacing: 1.5em,
    ..socialsList,
  )

  place(
    right,
    text(8pt, fill: luma(25%), socialStack),
  )

  block(
    below: 4pt,
    stack(
      dir: ltr,
      titleStack,
    )
  )

}

#let beware-modern-cv(
  name: [],
  subtitle: [CV],
  social: (:),
  color: beware-modern-blue,
  lang: "en",
  font: ("New Computer Modern"),
  body,
) = [
  #set page(
    paper: "a4",
    margin: (
      top: 10mm,
      bottom: 4mm,
      left: 10mm,
      right: 10mm,
    ),
  )
  #set text(
    font: font,
    lang: lang,
    size: 10pt,
  )

  #show heading.where(level: 1): it => {
    heading-line(1fr, 7fr, it.body)
  }

  #show heading.where(level: 2): it => {
    subheading-line(1fr, 7fr, it.body)
  }

  #_header(title: name, subtitle: subtitle, socials: social)

  #body
]

#let intro(content) = {
  block(
    width: 94%,
    text(10pt, hyphenate: true, content)
  )
}

#let education(date: [], degree: [], institution: []) = {
  set block(below: 0pt)
  table(
    columns: (1fr, 7fr),
    stroke: none,
    align(right, date),
    [#strong(degree), #emph(institution)]
  ) 
}

#let cv-entry(
  date: [],
  title: [],
  employer: [],
  projects: []
) = {
  grid(
    columns: (1fr),
    table(
      gutter: 0pt,
      inset: (y: 1pt, x: 0pt),
      stroke: none,
      columns: (4fr, 1fr),
      [#if employer != [] {
        [#strong(title), #emph(employer)]
      } else {
        [#strong(title)]
      }],
      align(horizon + right, text(6pt, [#fa-icon("calendar") #date]))
    ),
    block(
      inset: (y: 0.5em),
      for p in projects [#block(text(8pt, hyphenate: true, [#strong(p.short): #p.details]))]
    )
  )
}

#let cv-small-entry-with-date(date: [], name: [], description: []) = {
  set block(below: 0pt)
  set text(8pt)
  table(
    columns: (1fr, 7fr),
    stroke: none,
    align(right, date),
    [#text(weight: "bold", name), #text(description)]
  )
}

#let cv-category-grid(items) = {
  let args = ()
  for (category, content) in items {
    args.push(align(right, text(weight: "bold", category)))
    args.push(emph(content))
  }
  
  set block(below: 0pt)
  table(
    columns: (1fr, 3fr, 1fr, 3fr),
    stroke: none, 
    ..args
  )
}

#let cv-small-category-list(items) = {
  set text(8pt)
  let args = ()
  for (category, content) in items {
    args.push(align(right, text(weight: "bold", category)))
    args.push(emph(content))
  }
  set block(below: 0pt)
  table(
    columns: (1fr, 3fr, 1fr, 3fr),
    stroke: none,
    ..args
  )
}

#let cv-two-column(left, right) = {
  block(
    above: 6pt,
    grid(
      columns: (5fr, 3fr),
      gutter: 0pt,
      column-gutter: 10pt,
      inset: 0pt,
      left,
      right
    )
  )
}

#let cv-career-experience(positions: (), passions: (), achievements: ()) = {
  let positions-list = ()
  for p in positions {
    positions-list.push(cv-entry(
      date: p.date,
      employer: p.employer,
      title: p.title,
      projects: p.projects
    ))
  }
  
  let passions-list = ()
  for p in passions {
    passions-list.push(grid(
      columns: (1fr, 9fr),
      row-gutter: 10pt,
      text(10pt, fa-icon(p.icon)),
      text(8pt, p.content)
    ))
  }
  let passions-list-formatted = passions-list.intersperse(
    grid.cell(
      align(
        center,
        line(
          length: 95%,
          stroke: (paint: beware-modern-blue, thickness: 0.04em, dash: "dashed")
        )
      )
    )
  )

  let achievements-list = ()
  for a in achievements {
    achievements-list.push(grid(
      columns: (1fr, 9fr),
      row-gutter: 10pt,
      text(10pt, fa-icon(a.icon)),
      text(8pt, a.content)
    ))
  }
  let achievements-list-formatted = achievements-list.intersperse(
    grid.cell(
      align(
        center,
        line(
          length: 95%,
          stroke: (paint: beware-modern-blue, thickness: 0.04em, dash: "dashed")
        )
      )
    )
  )
  cv-two-column(
    [
      #block(
        below: 6pt,
        heading-line(1fr, 4fr, "Experience")
      )
      #list(..positions-list)
    ],

    [
      #block(
        below: 6pt,
        heading-line(1fr, 2fr, "Passions")
      )

      #block(
        below: 9pt,
        grid(
          columns: (100%),
          row-gutter: 10pt,
          ..passions-list-formatted
        )
      )

      #block(
        below: 6pt,
        heading-line(1fr, 2fr, "Achievements")
      )

      #block(
        below: 9pt,
        grid(
          columns: (100%),
          row-gutter: 10pt,
          ..achievements-list-formatted
        )
      )
    ]
  )
}
