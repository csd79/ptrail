;;; -*- Mode: Common-Lisp; Author: denes.cselovszky@gmail.com -*- 

(in-package "CL-USER")
(load "c:\\Users\\cselovszkid\\.lispworks")
(asdf:load-system "ptrail")

(in-package "PTRAIL")
(setf *independent-exe* t)
(lw:deliver 'ptrail-start
    "c:\\Users\\cselovszkid\\common-lisp\\ptrail\\ptrail_v0.47.exe"
    5
    :interface :capi
    :console :io
    :multiprocessing t
    :icon-file "c:\\Users\\cselovszkid\\common-lisp\\wax\\img\\wax.ico"
    :keep-symbols '(*appdir* *independent-exe*)
    :packages-to-keep-externals '(ptrail wax ccoffice) ; fn-s called indirectly - wax might not be needed, try without it!
    :keep-package-manipulation t
    :keep-function-name :all
    :keep-eval t
    :keep-lisp-reader t
    :symbol-names-action nil
    :startup-bitmap-file nil
    :kill-dspec-table nil
    :keep-conditions :all
    :keep-debug-mode t
    :keep-load-function t
    :compact t
    )
