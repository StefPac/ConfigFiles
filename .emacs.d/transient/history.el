((magit-commit nil)
 (magit-diff
  ("--no-ext-diff" "--stat"))
 (magit-log
  ("-n256" "--graph" "--decorate")
  (("--" "README.md")))
 (magit-submodule nil))
