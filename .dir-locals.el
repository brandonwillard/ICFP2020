((nil . ((org-publish-project-alist . (("tex"
                                        ;; :base-directory "project/src/org"
                                        ;; :publishing-directory "project/output"
                                        ;; :figure-dir "project/figures"
                                        :base-extension "org"
                                        :include ("mk-for-statistics.org")
                                        :exclude ".*"
                                        :publishing-function org-latex+-publish-to-latex
                                        )
                                       ("all" :components ("tex")))))))
