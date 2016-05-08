;;; biblio-autoloads.el --- automatically extracted autoloads
;;
;;; Code:


;;;### (autoloads (biblio-arxiv-lookup) "biblio-arxiv" "biblio-arxiv.el"
;;;;;;  (22307 9903 210511 776000))
;;; Generated autoloads from biblio-arxiv.el

(add-hook 'biblio-init-hook #'biblio-arxiv-backend)

(autoload 'biblio-arxiv-lookup "biblio-arxiv" "\
Start an arXiv search for QUERY, prompting if needed.

\(fn &optional QUERY)" t nil)

(defalias 'arxiv-lookup 'biblio-arxiv-lookup)

;;;***

;;;### (autoloads (biblio-crossref-lookup) "biblio-crossref" "biblio-crossref.el"
;;;;;;  (22307 9903 302511 778000))
;;; Generated autoloads from biblio-crossref.el

(add-hook 'biblio-init-hook #'biblio-crossref-backend)

(autoload 'biblio-crossref-lookup "biblio-crossref" "\
Start a CrossRef search for QUERY, prompting if needed.

\(fn &optional QUERY)" t nil)

(defalias 'crossref-lookup 'biblio-crossref-lookup)

;;;***

;;;### (autoloads (biblio-dblp-lookup) "biblio-dblp" "biblio-dblp.el"
;;;;;;  (22307 9903 346511 780000))
;;; Generated autoloads from biblio-dblp.el

(add-hook 'biblio-init-hook #'biblio-dblp-backend)

(autoload 'biblio-dblp-lookup "biblio-dblp" "\
Start a DBLP search for QUERY, prompting if needed.

\(fn &optional QUERY)" t nil)

(defalias 'dblp-lookup 'biblio-dblp-lookup)

;;;***

;;;### (autoloads (biblio-dissemin--register-action biblio-dissemin-lookup)
;;;;;;  "biblio-dissemin" "biblio-dissemin.el" (22307 9903 394511
;;;;;;  781000))
;;; Generated autoloads from biblio-dissemin.el

(autoload 'biblio-dissemin-lookup "biblio-dissemin" "\
Retrieve a record by DOI from Dissemin, and display it.
Interactively, or if CLEANUP is non-nil, pass DOI through
`biblio-cleanup-doi'.

\(fn DOI &optional CLEANUP)" t nil)

(defalias 'dissemin-lookup 'biblio-dissemin-lookup)

(autoload 'biblio-dissemin--register-action "biblio-dissemin" "\
Add Dissemin to list of `biblio-selection-mode' actions.

\(fn)" nil nil)

(add-hook 'biblio-selection-mode-hook #'biblio-dissemin--register-action)

;;;***

;;;### (autoloads (doi-insert-bibtex) "biblio-doi" "biblio-doi.el"
;;;;;;  (22307 9903 270511 778000))
;;; Generated autoloads from biblio-doi.el

(autoload 'doi-insert-bibtex "biblio-doi" "\
Insert BibTeX entry matching DOI.

\(fn DOI)" t nil)

;;;***

;;;### (autoloads (biblio-hal-lookup) "biblio-hal" "biblio-hal.el"
;;;;;;  (22307 9903 234511 777000))
;;; Generated autoloads from biblio-hal.el

(add-hook 'biblio-init-hook #'biblio-hal-backend)

(autoload 'biblio-hal-lookup "biblio-hal" "\
Start a HAL search for QUERY, prompting if needed.

\(fn &optional QUERY)" t nil)

(defalias 'hal-lookup 'biblio-hal-lookup)

;;;***

;;;### (autoloads nil nil ("biblio-pkg.el" "biblio.el") (22307 9903
;;;;;;  442532 738000))

;;;***

(provide 'biblio-autoloads)
;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; biblio-autoloads.el ends here
