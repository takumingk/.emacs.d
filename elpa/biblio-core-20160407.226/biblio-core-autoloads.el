;;; biblio-core-autoloads.el --- automatically extracted autoloads
;;
;;; Code:


;;;### (autoloads (biblio-lookup) "biblio-core" "biblio-core.el"
;;;;;;  (22307 9902 174511 750000))
;;; Generated autoloads from biblio-core.el

(autoload 'biblio-lookup "biblio-core" "\
Perform a search using BACKEND, and QUERY.
Prompt for any missing or nil arguments.  BACKEND should be a
function obeying the interface described in the docstring of
`biblio-backends'.  Returns the buffer in which results will be
inserted.

\(fn &optional BACKEND QUERY)" t nil)

;;;***

;;;### (autoloads nil nil ("biblio-core-pkg.el") (22307 9902 280394
;;;;;;  218000))

;;;***

(provide 'biblio-core-autoloads)
;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; biblio-core-autoloads.el ends here
