#let with-idris(
  set-font: true,
  font-to-any-raw: false,
  iosevka-font: true,

  set-syntax: true,
  set-theme: true,
  dark-theme: false,
  box-when-light: false,
  lang: "idris",

  set-console: false,
  console-lang: "console",

  doc
) = {
  // Utils
  let code-box = block.with(
    inset: 8pt,
    radius: 5pt,
    width: 100%,
  )
  let dark-box(it) = code-box(
    fill: rgb("#0d1423"),
    text(fill: rgb("#b2bacc"), it)
  )
  let apply-if(cond, fun) = if cond {fun} else {x=>x}

  // Set font
  let text-args = if iosevka-font {(
    font: "Iosevka Extended",
    features: (calt: 0, IDRS: 1),
  )} else {(
    font: "Fira Code",
    features: (calt: 1, ss09: 1, ss03: 1, cv29: 1, cv24: 1),
  )}

  let set-font-if(cond) = apply-if(cond, it => {
    set text(..text-args)
    it
  })
  show raw: set-font-if(set-font and font-to-any-raw)
  show raw.where(lang: lang): set-font-if(set-font and not font-to-any-raw and set-theme)
  show raw.where(lang: console-lang): set-font-if(set-font and not font-to-any-raw and set-console)

  // Setup Idris language
  let syntax-args = (:)
  if set-syntax {
    syntax-args.syntaxes = "idris2.sublime-syntax"
  }
  let code-boxer = apply-if(set-theme,
    if dark-theme {
      syntax-args.theme = "panydocy-dark.tmTheme"
      dark-box
    } else {
      syntax-args.theme = "panydocy-light.tmTheme"
      apply-if(box-when-light, code-box.with(stroke: .6pt + black))
    }
  )
  show raw.where(lang: lang): set raw(..syntax-args)
  show raw.where(lang: lang): code-boxer

  // Setup console language
  let quote(str) = {
    str.replace(regex("[\\\\/@_*\-+~`<>]"), found => "\\" + found.text).replace(" ", "~").replace("\\\\#", "\\#")
  }
  let console-setter = apply-if(set-console, it => {
    show raw.line: it => eval(quote(it.text), mode: "markup")
    dark-box(it)
  })
  show raw.where(lang: console-lang): console-setter

  // Running the continuation
  doc
}
