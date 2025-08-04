// #import "@preview/zh-kit:0.1.0": *
// #show: doc => setup-base-fonts(doc)
#set text(font: "思源黑體")
#set block(spacing: 0pt)
// #set grid(stroke: green)

#let 渐变底色 = gradient.linear(
  rgb("7ecbf1"),
  rgb("8f82ba"),
  rgb("ed9ebd"),
  rgb("ef9b76"),
  rgb("fef59a"),
  rgb("89c797"),
)

#set page(height: 5.4cm, width: 8.4cm, background: {
  grid(
    columns: 1fr,
    rows: (1cm, 2pt, 2pt, 1fr),
    box(height: 1cm, width: 100%, fill: 渐变底色),
    box(),
    box(height: 2pt, width: 100%, fill: 渐变底色),
    box(),
  )
})

#let 标签盒(title, content) = {
  grid(
    align: left,
    columns: 1,
    rows: 2,
    block(
      fill: black,
      width: 1cm,
      inset: 2pt,
      align(
        center,
        text(title, size: 5pt, weight: "extrabold", fill: white),
      ),
    ),
    v(5pt) + content,
  )
}

#let 角色卡(name, img, date: none, en: none, logo: none, scale: 1) = {
  align(center, grid(
    align: (center, left),
    columns: (3cm, 1fr),
    rows: (0.5cm, 0.5cm, 1fr, 1fr),
    column-gutter: 10pt,
    row-gutter: 3pt,
    grid.cell(
      rowspan: 4,
      block(
        radius: 4pt,
        clip: true,
        fill: white,
        stroke: 1pt + 渐变底色,
        image(img, width: 3cm, height: 4cm, fit: "cover"),
      ),
    ),
    block(
      text(
        "CHARACTER'S CARD",
        size: 10pt,
        weight: "thin",
        fill: white,
      ),
    ),
    block(image("meis-black.png", height: 0.5cm)),
    grid(
      columns: (1fr, 1fr),
      rows: 1fr,
      gutter: 1em,
      align: (left, center),
      标签盒(
        "NAME",
        block(
          text(name, size: 11pt, weight: "bold", fill: black),
        )
          + if en != none { v(5pt) + block(text(en, size: 6pt, fill: black, font: "Yuanti SC")) } else {},
      ),
      if date != none {
        标签盒("DATE", block(
          text(date, size: 11pt, weight: "bold", fill: black),
        ))
      },
    ),
    if logo != none {
      标签盒("FROM", block(
        image(logo, height: 1cm),
      ))
    },
  ))
}

#角色卡(
  "虹野 ゆめ",
  "yume.jpeg",
  date: "3/3",
  en: "Yume Nijino",
  logo: "logo-aikatsustars.png",
)

#角色卡(
  "浮波柚葉",
  "浮波柚叶_立绘.png",
  date: "11/2",
  en: "Ukinami Yuzuha",
  logo: "logo-zzz.png",
)
