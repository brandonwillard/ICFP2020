(setq make-backup-files nil)
(setq load-prefer-newer t)

(setq backtrace-line-length 0
      debug-on-error t)

(let ((default-directory (or (getenv "CASK_LIB_DIR") ".cask")))
  (normal-top-level-add-subdirs-to-load-path))

(require 'cask)

(cask-initialize "./")

(require 'f)

(setq working-dir (f-dirname (f-this-file)))
(add-to-list 'load-path working-dir)

(require 'org)
(require 'ox)
(require 'org-ref)
(require 'org-ref+)
(require 'ox-latex+)

(org-ref+-mode +1)

(setq org-export-allow-bind-keywords t)
(setq org-export-backends '(latex html))

(add-to-list 'org-babel-load-languages '(emacs-lisp . t))
(add-to-list 'org-babel-load-languages '(org . t))
(add-to-list 'org-babel-load-languages '(latex . t))
(add-to-list 'org-babel-load-languages '(python . t))

(org-babel-do-load-languages 'org-babel-load-languages org-babel-load-languages)

(setq org-latex-listings 'minted
      org-latex-prefer-user-labels t
      org-confirm-babel-evaluate nil
      org-latex-packages-alist '(("" "minted"))
      org-babel-default-inline-header-args '((:exports . "code") (:eval . "never") (:results . "none")))

(add-to-list 'org-publish-project-alist
             `("TeX"
               :base-directory ,working-dir
               :publishing-directory ,(getenv "TEX_DIR")
               :figure-dir ,(getenv "FIG_DIR")
               :base-extension "org"
               :include (,(f-full (getenv "PUB_FILE")))
               :publishing-function org-latex+-publish-to-latex))

(setq org-publish-use-timestamps-flag nil)

(pp org-publish-project-alist)
