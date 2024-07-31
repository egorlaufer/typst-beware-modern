#import "@preview/beware-modern-cv:0.1.0": *

#show: beware-modern-cv.with(
  name: "Vasiliy Kondrat'yevich Kaylo",
  subtitle: "Welder",
  lang: "en",
  social: (
    email: "kaylo@example.com",
  ),
)

#intro([I am Vasiliy Kaylo, a seasoned welder known for my fairness and integrity.
I embody the spirit of hardworking individuals, tirelessly ensuring that my
honest labor is justly rewarded. I am stern but just, able to assert my position
with firm words and actions, and in critical situations, I am not afraid to take
more drastic measures. Loyal to my friends, I am always ready to lend a helping
hand in difficult times.])

= Education

#education(
  date: [June 1984],
  degree: [Diploma in Welding Technology],
  institution: [Technical College of Tikhvin],
)

= Skills

#cv-category-grid((
  "Welding": [Expertise in MIG, TIG, and stick welding],
  "Metallurgy": [Strong understanding of metals and their properties],
  "Conflict Resolution": [Effective at managing and resolving workplace conflicts],
  "Team Collaboration": [Proven ability to work well within a team and support colleagues.]
))

#cv-career-experience(
  positions: (
    (
      date: [2005 -- Present],
      employer: [Tikhvin Manufacturing Plant],
      title: [Welder],
      projects: (
        (
          short: [Welding],
          details: [Performed high-quality welding tasks under challenging conditions.]
        ),
        (
          short: [Safety],
          details: [Ensured the safety and efficiency of the welding process,
maintaining the highest standards of workmanship.]
        ),
        (
          short: [Team Colaboration],
          details: [Managed to resolve conflicts on the shop floor through
effective communication and decisive action.]
        ),
        (
          short: [Conflict Resolution],
          details: [Demonstrated exceptional resilience and dedication, even in
the face of personal and professional adversity.]
        )
      )
    ),

    (
      date: [1984 -- 2005],
      employer: [Luga Steelworks],
      title: [Welder],
      projects: (
        (
          short: [Welding],
          details: [Mastered a wide range of welding techniques, from basic to advanced, during this long tenure.]
        ),
        (
          short: [Workmanship],
          details: [Received multiple commendations for exceptional workmanship and dedication.]
        ),
      )
    )
  ),

  passions: (
    (
      icon: "scale-balanced",
      content: [I am deeply committed to ensuring that hardworking
individuals receive their due respect and rewards.]
    ),

    (
      icon: "kiwi-bird",
      content: [A firm believer in honesty and integrity, I strive to
maintain these values in all aspects of my life.]
    ),
  ),

  achievements: (
    (
      icon: "award",
      content: [Employee of the Year Award, 2015: Recognized for outstanding
performance and dedication at Tikhvin Manufacturing Plant.]
    ),

    (
      icon: "helmet-safety",
      content: [Safety Excellence Award, 2004: Honored for promoting and
implementing superior safety practices at Luga Steelworks.]
    ) 
  )
)

= Personal Projects

#cv-repo(
  name: [Metalworking-Techniques],
  description: [Tutorials on metalworking techniques, including DIY projects.],
  github: "visiliy-kondratyevich/Metalworking"
)

== Conference Talks

#cv-talk(
  date: [31 May, 2019],
  event: [Elektricheskaya Iskra],
  title: [Welding Safety and Best Practice],
  venue: [Tikhvin Dom Kultury]
)

== Hobbies
#cv-small-category-list((
  "Fishing": [I enjoy spending time by the river, fishing and reflecting.],
  "Metalworking": [I often engage in metalworking projects in my free time, creating practical and artistic pieces.],
  "Reading": [I have a keen interest in Russian literature, particularly works that explore themes of justice and societal structure.]
))

