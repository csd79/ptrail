(defsystem "ptrail"
  :description "Paper trail generatoire"
  :author      "Denes Cselovszki <denes.cselovszky@gmail.com>"
  :version     "0.49"
  :depends-on  ("cl-ppcre" "local-time" "str" "utils" "achar" "ccom4" "ccoffice" "cref" "wax")
  :serial      t
  :components  ((:file "package")
                (:file "fli-templates")
                (:file "ptrail")))
