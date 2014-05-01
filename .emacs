;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;; Time-stamp: <2014-04-27 18:34:28 jimmy>
;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(desktop-save-mode)
(desktop-read)
(fset 'yes-or-no-p 'y-or-n-p)
(ido-mode t)
(package-initialize)

(add-to-list 'load-path "~/.emacs.d/modules/")

(add-to-list 'auto-mode-alist '("\\.screen.*\\'" . conf-mode))
(add-to-list 'auto-mode-alist '("\\.xsh\\'" . perl-mode))
(add-to-list 'auto-mode-alist '("rc$" . conf-mode))

(global-set-key (kbd "C-c C-k") 'kill-whole-line)
(global-set-key (kbd "C-x L") 'count-lines-region)

;;; Org-Mode Keys
(add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)

;;; FUNCTIONS Section
(fset 'par
   (lambda (&optional arg) "Keyboard macro." (interactive "p") (kmacro-exec-ring-item (quote ("h|par 79j
(global-set-key (kbd "M-p") 'par)

(defun latex-math-preview-ascii ()
  (interactive)
  (shell-command (format "%s %s" "brightmare" (shell-quote-argument
                           (replace-regexp-in-string "[
]+" " "
 (buffer-substring
  (region-beginning)
  (region-end)))))))

(defun espeak()
  (interactive)
  (shell-command-on-region
   (mark)
   (point)
   "/usr/bin/espeak --stdin -s 160 -ven+f2"))

(defun podchecker ()
  (interactive)
  (shell-command-on-region (mark)
               (point) "podchecker"))
(defun zsh-shell ()
  (interactive)
  (term "/bin/zsh")
  (rename-buffer "Zsh"))
;(zsh-shell)

(defun wtf (acronym)
  (interactive "swtf: ")
  (shell-command (concat "wtf" " " acronym)))

(defun quote-postgres (&optional b e)
  (interactive "r")
  (shell-command-on-region b e "piconv -f latin1 -t utf8 | uni2ascii -q -a7" t t))

(defun quote-mongodb (&optional b e)
  (interactive "r")
  (shell-command-on-region b e "piconv -f latin1 -t utf8 | uni2ascii -q -aU" t t))

;; ;;; vc-.el --- Extensions to `vc.el'.
;; (add-to-list 'load-path "~/.emacs.d/el-get/vc-/")
;; ;;; vc+.el --- Extensions for `vc.el'.
;; (add-to-list 'load-path "~/.emacs.d/el-get/vc+/")
;; (eval-after-load "vc" '(require 'vc+))

;;; ispell-stopwords.el --- use perl POD "=for stopwords" in ispell
(autoload 'ispell-stopwords "ispell-stopwords" nil t)

;;; windmove.el --- directional window-selection routines
(global-set-key (kbd "C-c <left>")  'windmove-left)
(global-set-key (kbd "C-c <right>") 'windmove-right)
(global-set-key (kbd "C-c <up>")    'windmove-up)
(global-set-key (kbd "C-c <down>")  'windmove-down)

;;; dired-async.el --- Copy/move/delete asynchronously in dired.
;;(eval-after-load "dired-aux" '(require 'dired-async))

;;; proced.el --- operate on system processes like dired
(global-set-key (kbd "C-x p") 'proced)

;;; tty-format.el --- text file backspacing and ANSI SGR as faces
(require 'tty-format)

;;; aumix-mode.el --- run the aumix program in a buffer
(autoload 'aumix "aumix-mode" nil t)

;;; mailcap-mode.el --- mailcap file editing mode
(autoload 'mailcap-mode "mailcap-mode" nil t)
(add-to-list 'auto-mode-alist '("/\\.?mailcap\\'" . mailcap-mode))

;;; bitlbee.el --- Help get Bitlbee (http://www.bitlbee.org) up and running.
(require 'bitlbee)

;;; emms.el --- The Emacs Multimedia System
(require 'emms-setup)
(emms-all)
(emms-default-players)
(emms-cache-disable)
(emms-volume-mode-minus)
(emms-mode-line-disable)

;;; web-mode.el --- major mode for editing html templates
(require 'web-mode)

;;; nginx-mode.el --- major mode for editing nginx config files
(require 'nginx-mode)

;;; vlf.el --- View Large Files
(require 'vlf)

;;; g.el --- Google Client
;(add-to-list 'load-path "~/.emacs.d/el-get/g-client/")
;(load-library "g")
;;;; deprecated?

;;; Sepia -- Simple Emacs-Perl InterAction: ugly, yet effective.
(add-to-list 'load-path "~/.emacs.d/sepia")
(setq sepia-perl5lib (list (expand-file-name "~/.emacs.d/sepia/lib")))
(defalias 'cperl-mode 'sepia-mode)
(require 'sepia)

;;; mmm-mode --- Allow Multiple Major Modes in a buffer
(require 'mmm-auto)

;;; sparql-mode.el --- Edit and interactively evaluate SPARQL queries.
(autoload 'sparql-mode "sparql-mode.el" "Major mode for editing SPARQL files" t)
(add-to-list 'auto-mode-alist '("\\.sparql$" . sparql-mode))

;;; tex-smart-umlauts.el --- Smart umlaut conversion for TeX.
;;(add-hook 'LaTeX-mode-hook #'tex-smart-umlauts-decode)

;;; langtool --- Grammer check utility using LanguageTool
(add-to-list 'load-path "~/.emacs.d/el-get/langtool/")
(require 'langtool)
(setq langtool-language-tool-jar "~/usr/share/LanguageTool/LanguageTool.jar")
;(setq langtool-java-bin "~/usr/java/jre1.7.0_17/bin/java")

;;; syslog-mode.el --- Mode for viewing system logfiles
(add-to-list 'load-path "~/.emacs.d/el-get/syslog-mode/")
(require 'syslog-mode)
(add-to-list 'auto-mode-alist '("/var/log.*\\'" . syslog-mode))

;;; ldap-mode.el --- major modes for editing LDAP schema and LDIF files
(require 'ldap-mode)

;; lang-refactor-perl.el --- Simple refactorings, primarily for Perl
(require 'lang-refactor-perl)

;; nagios-mode, an Emacs mode for Nagios <http://www.nagios.org/>
;; configuration files.
(add-to-list 'load-path "~/.emacs.d/el-get/nagios-mode/")
(require 'nagios-mode)

;;; apache-mode.el --- major mode for editing Apache configuration files
(autoload 'apache-mode "apache-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.htaccess\\'"   . apache-mode))
(add-to-list 'auto-mode-alist '("httpd\\.conf\\'"  . apache-mode))
(add-to-list 'auto-mode-alist '("srm\\.conf\\'"    . apache-mode))
(add-to-list 'auto-mode-alist '("access\\.conf\\'" . apache-mode))
(add-to-list 'auto-mode-alist '("sites-\\(available\\|enabled\\)/" . apache-mode))

;;; sqlite-dump.el --- view dump of sqlite database file
(autoload 'sqlite-dump "sqlite-dump" nil t)
(modify-coding-system-alist 'file "\\.sqlite\\'" 'raw-text-unix)
(add-to-list 'auto-mode-alist '("\\.sqlite\\'" . sqlite-dump))

;;; AUCTeX is  a comprehensive customizable integrated  environment for writing
;;; input  files   for  TeX, LaTeX,  ConTeXt, Texinfo, and  docTeX  using Emacs
;;; or XEmacs.
(add-to-list 'load-path "~/.emacs.d/el-get/auctex/")
(load "auctex.el" nil t t)
(require 'texmathp)

;;; eperiodic.el --- periodic table for Emacs
(add-to-list 'load-path "~/.emacs.d/el-get/eperiodic/")
(require 'eperiodic);

;;; ack.el --- Use ack where you might usually use grep.
(require 'ack)

;;; ansi-color.el --- translate ANSI escape sequences into faces
(require 'ansi-color)

;;; awk-it.el --- Little utility that combines awk and yasnippet.
(add-to-list 'load-path "~/.emacs.d/el-get/awk-it/")
(eval-after-load 'yasnippet '(require 'awk-it))

;;; babel.el --- interface to web translation services such as Babelfish
(add-to-list 'load-path "~/.emacs.d/el-get/babel/")
(autoload 'babel "babel"
  "Use a web translation service to translate the message MSG." t)
(autoload 'babel-region "babel"
  "Use a web translation service to translate the current region." t)
(autoload 'babel-as-string "babel"
  "Use a web translation service to translate MSG, returning a string." t)
(autoload 'babel-buffer "babel"
  "Use a web translation service to translate the current buffer." t)

;;; bc-mode.el --- BC code editing commands for Emacs
(add-to-list 'load-path "~/.emacs.d/el-get/bc-mode/")
(autoload 'bc-mode "bc-mode.el" "bc-mode" t 'nil)
(add-to-list 'auto-mode-alist '(".bc\\'" . bc-mode))
(add-to-list 'interpreter-mode-alist '("bc" . bc-mode))

;;; boxquote.el --- Quote text with a semi-box.
(add-to-list 'load-path "~/.emacs.d/el-get/boxquote/")
(require 'boxquote)

;;; cdlatex.el -- Fast input methods for LaTeX environments and math
(add-to-list 'load-path "~/.emacs.d/el-get/cdlatex-mode/")
(add-to-list 'load-path "~/.emacs.d/el-get/auctex/")
(require 'cdlatex)

;;; col-highlight.el --- Highlight the current column.
(add-to-list 'load-path "~/.emacs.d/el-get/col-highlight/")
(eval-after-load 'vline '(require 'col-highlight))

;;; column-marker.el --- Highlight certain character columns
(add-to-list 'load-path "~/.emacs.d/el-get/column-marker/")
(require 'column-marker)

;;; crontab-mode.el --- Mode for editing crontab files
(add-to-list 'load-path "~/.emacs.d/el-get/crontab-mode")
(require 'crontab-mode)
(add-to-list 'auto-mode-alist '("\\.cron\\(tab\\)?\\'" . crontab-mode))
(add-to-list 'auto-mode-alist '("cron\\(tab\\)?\\."    . crontab-mode))

;;; crosshairs.el --- Highlight the current line and column.
(add-to-list 'load-path "~/.emacs.d/el-get/crosshairs/")
(eval-after-load 'hl-line+ '(require 'crosshairs))

;;; css-mode.el --- Major mode for editing Cascading Style Sheets
(add-to-list 'load-path "~/.emacs.d/el-get/css-mode/")
(add-to-list 'auto-mode-alist '("\\.css\\'" . css-mode))
(autoload 'css-mode "css-mode" nil t)

;;; csv-mode.el --- major mode for editing comma-separated value files
(add-to-list 'auto-mode-alist '("\\.[Cc][Ss][Vv]\\'" . csv-mode))
  (autoload 'csv-mode "csv-mode"
   "Major mode for editing comma-separated value files." t)

;;; csv-nav.el --- navigate and edit CSV files
(require 'csv-nav)

;;; doc-mode.el --- a major-mode for highlighting a hierarchy structured text.
(add-to-list 'load-path "~/.emacs.d/el-get/doc-mode/")
(autoload 'doc-mode "doc-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.doc$" . doc-mode))
;;; asciidoc.el --- asciidoc text file development support
(add-to-list 'load-path "~/.emacs.d/el-get/asciidoc/")
(add-to-list 'auto-mode-alist '("\\.adoc$" . doc-mode))
(add-hook 'doc-mode-hook
      '(lambda ()
         (turn-on-auto-fill)
         (require 'asciidoc)))

;;; ecmascript-mode.el --- major mode for editing ECMAScript code
(add-to-list 'load-path "~/.emacs.d/el-get/ecmascript-mode/")
(require 'ecmascript-mode)

;;; el-get.el --- Manage the external elisp bits and pieces you depend upon
(add-to-list 'load-path "~/.emacs.d/el-get/el-get")
 (unless (require 'el-get nil t)
   (url-retrieve
    "https://raw.github.com/dimitri/el-get/master/el-get-install.el"
    (lambda (s)
      (end-of-buffer)
     (eval-print-last-sexp))))
;; (el-get 'sync)
;; (el-get 'wait)

;;; elisp-format.el --- Format elisp code
(add-to-list 'load-path "~/.emacs.d/el-get/elisp-format/")
(require 'elisp-format)

;;; ess-edit.el --- convenient editing of R code
(add-to-list 'load-path "~/.emacs.d/el-get/ess-edit/")
(require 'ess-edit)

;;; ess.el --- Emacs Speaks Statistics: statistical programming within Emacs
(require 'ess-site)
(autoload 'ess-rdired "ess-rdired" "View *R* objects in a dired-like buffer." t)
(require 'ess-rutils)

;;; essh.el --- a set of commands that emulate for bash what ESS is to R.
(add-to-list 'load-path "~/.emacs.d/el-get/essh/")
(require 'essh)
(defun essh-sh-hook ())
(add-hook 'sh-mode-hook 'essh-sh-hook)

;;; fetchmail-mode.el --- Mode for editing .fetchmailrc files
(add-to-list 'load-path "~/.emacs.d/el-get/fetchmail-mode/")
(autoload 'fetchmail-mode "fetchmail-mode.el"
  "Mode for editing .fetchmailrc files" t)
(setq auto-mode-alist (append '(("\..fetchmailrc$" . fetchmail-mode))
                  auto-mode-alist))

;;; gnuplot.el -- drive gnuplot from within emacs
(add-to-list 'load-path "~/.emacs.d/el-get/gnuplot/")
(autoload 'gnuplot-mode "gnuplot" "gnuplot major mode" t)
(autoload 'gnuplot-make-buffer "gnuplot" "open a buffer in gnuplot-mode" t)
(setq auto-mode-alist (append '(("\\.gp$" . gnuplot-mode)) auto-mode-alist))

;;; google-translate.el --- Emacs interface to Google Translate
(require 'google-translate)

;;; hl-line+.el --- Extensions to hl-line.el.
(add-to-list 'load-path "~/.emacs.d/el-get/hl-line+/")
(eval-after-load 'col-highlight '(require 'hl-line+))

;;; html-accent.el  ---  Function  that  replace  accented  char  by  its  html
;;; representation
(add-to-list 'load-path "~/.emacs.d/el-get/html-accent/")
(autoload 'html-accent "html-accent" "Accent HTML" t)
(autoload 'accent-html "html-accent" "HTML codes to accent" t)

;;; htmlize.el --- Convert buffer text and decorations to HTML.
(add-to-list 'load-path "~/.emacs.d/el-get/htmlize/")
(require 'htmlize)

;;; info+.el --- Extensions to `info.el'.
(add-to-list 'load-path "~/.emacs.d/el-get/info+/")
(require 'info+)

;;; irfc.el --- Interface for IETF RFC document.
(require 'irfc)
;; (add-to-list 'auto-mode-alist '("\\rfc[0-9]+\.txt\\'" . irfc-mode))

;;; js2-mode.el --- an improved JavaScript editing mode
(add-to-list 'load-path "~/.emacs.d/el-get/js2-mode/")
(require 'js2-mode)
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))

;;; json-mode.el --- Major mode for editing JSON files
(require 'json-mode)

;;; levenshtein.el --- Edit distance between two strings.
(add-to-list 'load-path "~/.emacs.d/el-get/levenshtein/")
(require 'levenshtein)

;;; lua-mode.el --- a major-mode for editing Lua scripts
(add-to-list 'load-path "~/.emacs.d/el-get/lua-mode/")
(autoload 'lua-mode "lua-mode" "Lua editing mode." t)
(add-to-list 'auto-mode-alist '("\\.lua$" . lua-mode))
(add-to-list 'interpreter-mode-alist '("lua" . lua-mode))

;;; magit.el --- control Git from Emacs
(require 'magit)
;;; magithub.el --- Magit extensions for using GitHub
(eval-after-load 'magit '(require 'magithub))

;;; markdown-mode.el --- Emacs Major mode for Markdown-formatted text files
(autoload 'markdown-mode "markdown-mode"
  "Major mode for editing Markdown files" t)
(setq auto-mode-alist (cons '("\\.md" . markdown-mode) auto-mode-alist))
;;; markdown-mode+.el --- extra functions for markdown-mode
(require 'markdown-mode+)

;;; memory-usage.el --- Analyze the memory usage of Emacs in various ways
(require 'memory-usage)

;;; mode-compile.el  ---  Smart  command   for  compiling  files  according  to
;;; major-mode.
(autoload 'mode-compile "mode-compile"
  "Command to compile current buffer file based on the major mode" t)
(global-set-key "\C-cc" 'mode-compile)
(autoload 'mode-compile-kill "mode-compile"
  "Command to kill a compilation launched by `mode-compile'" t)
(global-set-key "\C-ck" 'mode-compile-kill)

;;; muttrc-mode.el --- Major mode to edit muttrc under Emacs
(add-to-list 'load-path "~/.emacs.d/el-get/muttrc-mode/")
(autoload 'muttrc-mode "muttrc-mode.el" "Major mode to edit muttrc files" t)
(add-to-list 'auto-mode-alist '("\\.muttrc\\'"   . muttrc-mode))
(add-to-list 'auto-mode-alist '("\\.muttngrc\\'" . muttrc-mode))
(add-to-list 'auto-mode-alist '("\\abookrc\\'"   . muttrc-mode))
(add-to-list 'auto-mode-alist '("\\.mutt/.*\\'"  . muttrc-mode))

;;; num3-mode.el --- highlight groups of digits in long numbers
(require 'num3-mode)

;;; org-R.el --- Computing and data visualisation in Org-mode using R
(require 'org-R)

;;; org-panel.el --- Simple routines for us with bad memory
(require 'org-panel)
(eval-after-load 'org-mode 'org-pan)

;;; orgtbl-sqlinsert.el --- orgtbl to SQL insert statements.
(require 'orgtbl-sqlinsert)

;;; pandoc-mode.el --- Minor mode for interacting with Pandoc
(require 'pandoc-mode)

;;; pcre2el.el --- PCRE/Elisp/rx/SRE regexp syntax converter and utilities
(require 'pcre2el)

;;; perl-pod-coding.el --- coding system from =encoding in perl files
(require 'perl-pod-coding)

;;; perl-pod-gt.el --- helpers for Perl POD <> markup
(autoload 'perl-pod-gt-double "perl-pod-gt" nil t)
(autoload 'perl-pod-gt-single "perl-pod-gt" nil t)
(autoload 'perl-pod-gt-enable "perl-pod-gt")
(add-hook 'perl-mode-hook  'perl-pod-gt-enable)
(add-hook 'cperl-mode-hook 'perl-pod-gt-enable)
(add-hook 'pod-mode-hook   'perl-pod-gt-enable)

;;; perlcritic.el --- Call perlcritic in Emacs
(require 'perlcritic)
(global-set-key (kbd "C-c T") 'perlcritic)

;;; perlmonks.el --- A simple interface to www.perlmonks.org
(add-to-list 'load-path "~/.emacs.d/el-get/perlmonks/")
;(require 'perlmonks)

;;; perltidy.el --- Tidy perl code
(add-to-list 'load-path "~/.emacs.d/el-get/perltidy/")
(require 'perltidy)
(global-set-key (kbd "C-c t") 'perltidy-buffer)

;;; pod-mode.el --- Major mode for editing .pod-files
(autoload 'pod-mode "pod-mode" "Mode for editing POD files" t)
(add-to-list 'auto-mode-alist '("\\.pod$" . pod-mode))
(add-hook 'pod-mode-hook 'font-lock-mode)

;;; pst-format.el --- view perl Storable files as human readable text
(require 'pst-format)
(autoload 'pst-format-decode "pst-format")
(add-to-list 'format-alist
     '(pst-format
       "Perl \"Storable\" module data."
       "\\`\\(pst0\\|perl-store\\)"
       pst-format-decode
       pst-format-encode
       t
       nil))

;;; quickrun.el --- Run commands quickly
(add-to-list 'load-path "~/.emacs.d/el-get/quickrun/")
(require 'quickrun)

;;; regex-tool --- A regular expression evaluation tool for programmers
(add-to-list 'load-path "~/.emacs.d/el-get/regex-tool/")
(require 'regex-tool)

;;; remind-conf-mode.el --- A mode to help configure remind.
(autoload 'remind-conf-mode "remind-conf-mode" "Mode to help with remind files" t)
(add-to-list 'auto-mode-alist '("\\.reminders\\'"        . remind-conf-mode))
(add-to-list 'auto-mode-alist '("\\.remind/.*\\'"        . remind-conf-mode))

;;; remind-to-diary.el --- convert remind `simple calendar' output to diary format
(add-to-list 'load-path "~/.emacs.d/el-get/remind-to-diary/")
(require 'remind-to-diary)
(add-hook 'calendar-initial-window-hook 'remind-to-diary-run)
(add-hook 'diary-list-entries-hook 'remind-to-diary-run)
(add-hook 'diary-list-entries-hook 'diary-include-other-diary-files)

;;; rtf-mode.el --- Emacs major mode for viewing/editing raw RTF source
(add-to-list 'load-path "~/.emacs.d/el-get/rtf-mode/")
(require 'rtf-mode)

;;; sdcv.el --- Interface for sdcv (StartDict console version).
(add-to-list 'load-path "~/.emacs.d/el-get/sdcv/")
(eval-after-load 'showtip '(require 'sdcv))

;;; sgml-mode.el --- SGML- and HTML-editing modes
(defun xsh-edit-element (xsh-command)
  "Edit current XML element with XSH"
  (interactive "Mxsh2-command: ")
  (progn
    (sgml-backward-up-element)
    (let ((beg (point))
      (coding-system-for-read 'utf-8)
      (coding-system-for-write 'utf-8))
      (sgml-forward-element)
      (shell-command-on-region beg (point)
                   (concat "xsh2 -qP- " (shell-quote-argument
                             xsh-command) " | sed 1d")
                   t ))))

;;; showtip.el --- Show tip at cursor
(add-to-list 'load-path "~/.emacs.d/el-get/showtip/")
(require 'showtip)

;;; sparql-mode.el - Interactively evaluate SPARQL
(autoload 'sparql-mode "sparql-mode.el"  "Major mode for editing SPARQL files" t)
(add-to-list 'auto-mode-alist '("\\.sparql$" . sparql-mode))

;;; tidy.el --- Interface to the HTML Tidy program
(add-to-list 'load-path "~/.emacs.d/el-get/tidy/")
(autoload 'tidy-buffer "tidy" "Run Tidy HTML parser on current buffer" t)
(autoload 'tidy-build-menu  "tidy" "Install an options menu for HTML Tidy." t)
(autoload 'tidy-parse-config-file "tidy" "Parse the `tidy-config-file'" t)
(autoload 'tidy-save-settings "tidy" "Save settings to `tidy-config-file'" t)

;;; transpar.el --- Transpose paragraph text as a table.
(add-to-list 'load-path "~/.emacs.d/el-get/transpar/")
(require 'transpar)

;;; tsv-mode.el --- Major mode for edit table filesg
(add-to-list 'load-path "~/.emacs.d/el-get/tsv-mode/")
(autoload 'tsv-mode "tsv-mode" "A mode to edit table like file" t)
(autoload 'tsv-normal-mode "tsv-mode" "A minor mode to edit table like file" t)
(add-to-list 'auto-mode-alist '("\\.tsv$" . tsv-mode))

;;; tt-mode.el --- Emacs major mode for editing Template Toolkit files
(autoload 'tt-mode "tt-mode")
(setq auto-mode-alist (append '(("\\.tt$" . tt-mode))  auto-mode-alist))

;;; tty-format.el --- text file backspacing and ANSI SGR as faces
(eval-after-load 'ansi-color  '(require 'tty-format))
(eval-after-load 'tty-format '(add-hook 'find-file-hooks 'tty-format-guess))

;;; txt2tags-mode
(add-to-list 'load-path "~/.emacs.d/el-get/txt2tags-mode/")
(autoload 't2t-mode "txt2tags-mode" "Txt2tags Mode" t)

;;; unaccent.el --- Functions dealing with accented characters.
(add-to-list 'load-path "~/.emacs.d/el-get/unaccent")
(require 'unaccent)
(global-set-key "\M-'" 'unaccent-word)

;;; unfill.el --- The inverse of fill-paragraph and fill-region
(require 'unfill)

;;; vline.el --- show vertical line (column highlighting) mode.
(add-to-list 'load-path "~/.emacs.d/el-get/vline/")
(require 'vline)

;;; w3m.el --- an Emacs interface to w3m
(add-to-list 'load-path "~/.emacs.d/el-get/emacs-w3m/")
(require 'w3m-load)

;;; wget.el --- Interface program of wget on Emacs
(require 'wget)

;;; wgrep.el --- Writable grep buffer and apply the changes to files
(add-to-list 'load-path "~/.emacs.d/el-get/wgrep/")
(require 'wgrep)

;;; workgroups.el --- workgroups for windows (for Emacs)
(add-to-list 'load-path "~/.emacs.d/el-get/workgroups/")
(require 'workgroups)

;;; xs-mode.el --- A simple major mode for write perl XS code
(add-to-list 'load-path "~/.emacs.d/el-get/xs-mode/")
(autoload 'xs-mode "xs-mode" "Major mode for XS files" t)
(add-to-list 'auto-mode-alist '("\\.xs$" . xs-mode))

;;; yaml-mode.el --- Major mode for editing YAML files
(require 'yaml-mode)
(add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))
(add-to-list 'auto-mode-alist '("\\.yaml$" . yaml-mode))

;;; yasnippet.el --- Yet another snippet extension for Emacs.
(add-to-list 'load-path "~/.emacs.d/el-get/yasnippet/")
(require 'yasnippet)

;;; CUSTOMIZE Section
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(Info-additional-directory-list (quote ("~/usr/info/")))
 '(Man-width 80)
 '(ack-command "ack --noenv --color --pager='cat' --sort-files ")
 '(appt-audible nil)
 '(appt-display-diary nil)
 '(appt-display-format (quote window))
 '(aumix-mode-program "rexima")
 '(before-save-hook (quote (time-stamp)))
 '(browse-url-browser-function (quote w3m-browse-url))
 '(browse-url-generic-program nil)
 '(browse-url-text-browser "lynx")
 '(c-basic-offset 4)
 '(c-default-style (quote ((other . "gnu"))))
 '(column-number-mode t)
 '(cperl-highlight-variables-indiscriminately t)
 '(default-justification (quote full))
 '(delete-selection-mode t)
 '(describe-char-unidata-list t)
 '(desktop-load-locked-desktop t)
 '(desktop-save-mode t)
 '(diary-file "~/.diary")
 '(dired-listing-switches "-ahl")
 '(emms-info-functions (quote (emms-info-cueinfo emms-info-ogginfo emms-info-mp3info)))
 '(emms-info-mp3find-arguments (quote ("-p" "info-filename=%f\\ninfo-artist=%a\\ninfo-title=%t\\ninfo-album=%l\\ninfo-tracknumber=%n\\ninfo-year=%y\\ninfo-genre=%g\\ninfo-comment=%c\\ninfo-playing-time=%S\\ninfo-composer=%{TCOM}\\ninfo-text_by=%{TEXT}\\ninfo-orchestra=%{TPE2}\\ninfo-conductor=%{TPE3}\\ninfo-disk_n=%{TPOS}")))
 '(emms-info-mp3info-program-name "mp3info")
 '(emms-player-list (quote (emms-player-mplayer-playlist emms-player-mplayer)))
 '(emms-player-mplayer-command-name "/usr/bin/mplayer")
 '(emms-player-mplayer-parameters (quote ("-slave" "-quiet" "-really-quiet" "-vo" "null")))
 '(emms-player-mplayer-playlist-command-name "/usr/bin/mplayer")
 '(emms-playlist-mode-open-playlists nil)
 '(emms-source-file-default-directory /home/jimmy/var/storage/multimidia/music)
 '(erc-autoaway-idle-seconds 300)
 '(erc-autoaway-message "@moon")
 '(erc-autoaway-mode t)
 '(erc-autojoin-mode t)
 '(erc-fill-mode t)
 '(erc-frame-dedicated-flag t)
 '(erc-hide-list (quote ("JOIN" "PART" "QUIT")))
 '(erc-log-channels-directory "~/.erc/logs/")
 '(erc-log-insert-log-on-open t)
 '(erc-log-mode t)
 '(erc-log-write-after-insert t)
 '(erc-nick "jimmy")
 '(erc-play-sound nil)
 '(erc-port 6667)
 '(erc-prompt-for-password nil)
 '(erc-server "127.0.0.1")
 '(erc-track-remove-disconnected-buffers t)
 '(ess-directory "~/R/")
 '(ess-history-directory "~/R/")
 '(european-calendar-style t)
 '(fill-column 79)
 '(fill-nobreak-predicate (quote (fill-french-nobreak-p fill-single-word-nobreak-p)))
 '(google-translate-default-source-language "en")
 '(google-translate-default-target-language "pt")
 '(google-translate-enable-ido-completion t)
 '(indent-tabs-mode nil)
 '(irfc-assoc-mode t)
 '(latin1-display nil nil (latin1-disp))
 '(latin1-display-face (quote c-annotation-face))
 '(latin1-display-mnemonic t)
 '(latin1-display-ucs-per-lynx t nil (latin1-disp))
 '(ldif-attribute-face (quote default))
 '(make-backup-files nil)
 '(markdown-enable-math t)
 '(message-sendmail-extra-arguments (quote ("-a" "lists")))
 '(mutt-alias-file-list (quote ("~/.abook/mutt_alias")))
 '(newsticker-automatically-mark-items-as-old nil)
 '(newsticker-buffer-change-hook nil)
 '(newsticker-date-format "(%Y-%m-%dT%T%z)")
 '(newsticker-enable-logo-manipulations nil)
 '(newsticker-html-renderer (quote w3m-region))
 '(newsticker-justification nil)
 '(newsticker-keep-obsolete-items nil)
 '(newsticker-narrow-hook nil)
 '(newsticker-retrieval-method (quote extern))
 '(newsticker-start-hook (quote (newsticker-start-ticker)))
 '(newsticker-url-list (quote (("commandlinefu" "http://www.commandlinefu.com/feed/threeup" nil nil nil) ("cpanratings" "http://cpanratings.perl.org/index.rss" nil nil nil) ("effectiveperlprogramming" "http://www.effectiveperlprogramming.com/feed/" nil nil nil) ("inovacaotecnologica" "http://www.inovacaotecnologica.com.br/boletim/rss.xml" nil nil nil) ("perlhacks" "http://perlhacks.com/feed/" nil nil nil) ("perlnews" "http://perlnews.org/feed/" nil nil nil) ("perlsphere" "http://perlsphere.net/rss.xml" nil nil nil) ("planet.perl" "http://planet.perl.org/rss20.xml" nil nil nil) ("postgresql" "http://www.postgresql.org.br/rss.xml" nil nil nil) ("planeta.postgresql" "http://planeta.postgresql.org.br/atom.xml" nil nil nil) ("worg" "http://repo.or.cz/w/Worg.git/rss" nil nil nil) ("xsh" "http://xsh.sourceforge.net/news.rss" nil nil nil) ("common-lisp" "http://common-lisp.net/rss.xml" nil nil nil) ("common-lisp-recent" "http://common-lisp.net/recent-projects.xml" nil nil nil) ("aiyumi" "http://aiyumi.warpstar.net/pt/rss.xml" nil nil nil) ("tecnoveneno" "http://tecnoveneno.blogspot.com/feeds/posts/default" nil nil nil) ("slashdot" "http://rss.slashdot.org/Slashdot/slashdot" nil nil nil) ("blogs-perl" "http://blogs.perl.org/atom.xml" nil nil nil) ("fp2.com.br" "http://fp2.com.br/blog/index.php/feed/" nil nil nil) ("masteringemacs" "http://www.masteringemacs.org/feed/" nil nil nil) ("rbloggers" "http://feeds.feedburner.com/RBloggers" nil nil nil) ("emacswiki" "http://www.emacswiki.org/emacs/full.rss" nil nil nil) ("revista.espiritolivre" "http://www.revista.espiritolivre.org/feed" nil nil nil) ("postgresql.org" "http://www.postgresql.org/news.rss" nil nil nil) ("aiyumi" "http://aiyumi.warpstar.net/en/rss.xml" nil nil nil) ("ironman" "http://ironman.enlightenedperl.org/?feed=RSS" nil nil nil) ("PrePAN" "http://prepan.org/feed" nil nil nil) ("codata.org-blog" "http://codata.org/blog/feed/" nil nil nil) ("br-linux.org" "http://br-linux.org/feed.xml" nil nil nil))))
 '(newsticker-url-list-defaults nil)
 '(newsticker-use-full-width nil)
 '(newsticker-wget-arguments (quote ("--quiet" "--timeout=60" "--tries=3" "--max-redirect=1" "--output-document=-")))
 '(org-agenda-diary-file (quote diary-file))
 '(org-agenda-files (quote ("~/org-mode/curriculo.org" "/home/jimmy/org-mode/computer_science.org" "/home/jimmy/org-mode/database.org" "/home/jimmy/org-mode/emacs.org" "/home/jimmy/org-mode/geo.org" "/home/jimmy/org-mode/home.org" "/home/jimmy/org-mode/javascript.org" "/home/jimmy/org-mode/json.org" "/home/jimmy/org-mode/latex.org" "/home/jimmy/org-mode/misc.org" "/home/jimmy/org-mode/org-mode.org" "/home/jimmy/org-mode/perl.org" "/home/jimmy/org-mode/pim.org" "/home/jimmy/org-mode/r.org" "/home/jimmy/org-mode/sysadmin.org" "/home/jimmy/org-mode/vim.org" "/home/jimmy/org-mode/web.org" "/home/jimmy/org-mode/xml.org" "/home/jimmy/org-mode/xpath.org" "/home/jimmy/org-mode/xsh.org" "/home/jimmy/org-mode/yaml.org")))
 '(org-agenda-text-search-extra-files nil)
 '(org-alphabetical-lists t)
 '(org-attach-method (quote ln))
 '(org-babel-load-languages (quote ((emacs-lisp . t) (awk . t) (R . t) (calc . t) (fortran . t) (gnuplot . t) (haskell . t) (js . t) (latex . t) (org . t) (perl . t) (python . t) (scheme . t) (screen . t) (sh . t) (sql . t))))
 '(org-blog-directory "~/org-blog/")
 '(org-blog-unfinished-directory "~/org-blog/unfinished")
 '(org-confirm-babel-evaluate nil)
 '(org-confirm-elisp-link-function nil)
 '(org-confirm-shell-link-function nil)
 '(org-emphasis-regexp-components (quote ("     ('\"{" "-   .,:!?;'\")}\\" "    
" "." 1)))
 '(org-enforce-todo-dependencies t)
 '(org-entities-ascii-explanatory t)
 '(org-export-author-info t)
 '(org-export-babel-evaluate nil)
 '(org-export-creator-info t)
 '(org-export-default-language "pt-BR")
 '(org-export-html-postamble nil)
 '(org-export-html-style-include-default nil)
 '(org-export-html-style-include-scripts nil)
 '(org-export-htmlize-output-type (quote inline-css))
 '(org-export-language-setup (quote (("en" "Author" "Date" "Table of Contents" "Footnotes") ("ca" "Autor" "Data" "&Iacute;ndex" "Peus de p&agrave;gina") ("cs" "Autor" "Datum" "Obsah" "Pozn\341mky pod carou") ("da" "Ophavsmand" "Dato" "Indhold" "Fodnoter") ("de" "Autor" "Datum" "Inhaltsverzeichnis" "Fu&szlig;noten") ("eo" "A&#365;toro" "Dato" "Enhavo" "Piednotoj") ("es" "Autor" "Fecha" "&Iacute;ndice" "Pies de p&aacute;gina") ("fi" "Tekij&auml;" "P&auml;iv&auml;m&auml;&auml;r&auml;" "Sis&auml;llysluettelo" "Alaviitteet") ("fr" "Auteur" "Date" "Table des mati&egrave;res" "Notes de bas de page") ("hu" "Szerz&otilde;" "D&aacute;tum" "Tartalomjegyz&eacute;k" "L&aacute;bjegyzet") ("is" "H&ouml;fundur" "Dagsetning" "Efnisyfirlit" "Aftanm&aacute;lsgreinar") ("it" "Autore" "Data" "Indice" "Note a pi&egrave; di pagina") ("nl" "Auteur" "Datum" "Inhoudsopgave" "Voetnoten") ("no" "Forfatter" "Dato" "Innhold" "Fotnoter") ("nb" "Forfatter" "Dato" "Innhold" "Fotnoter") ("nn" "Forfattar" "Dato" "Innhald" "Fotnotar") ("pl" "Autor" "Data" "Spis tre&sacute;ci" "Przypis") ("sv" "F&ouml;rfattare" "Datum" "Inneh&aring;ll" "Fotnoter") ("pt-BR" "Autor" "Data de cria��o" "Sum�rio" "Refer�ncias"))))
 '(org-export-latex-classes (quote (("article" "\\documentclass[11pt]{article}" ("\\section{%s}" . "\\section*{%s}") ("\\subsection{%s}" . "\\subsection*{%s}") ("\\subsubsection{%s}" . "\\subsubsection*{%s}") ("\\paragraph{%s}" . "\\paragraph*{%s}") ("\\subparagraph{%s}" . "\\subparagraph*{%s}")) ("report" "\\documentclass[11pt]{report}" ("\\part{%s}" . "\\part*{%s}") ("\\chapter{%s}" . "\\chapter*{%s}") ("\\section{%s}" . "\\section*{%s}") ("\\subsection{%s}" . "\\subsection*{%s}") ("\\subsubsection{%s}" . "\\subsubsection*{%s}")) ("book" "\\documentclass[11pt]{book}" ("\\part{%s}" . "\\part*{%s}") ("\\chapter{%s}" . "\\chapter*{%s}") ("\\section{%s}" . "\\section*{%s}") ("\\subsection{%s}" . "\\subsection*{%s}") ("\\subsubsection{%s}" . "\\subsubsection*{%s}")) ("beamer" "\\documentclass{beamer}" org-beamer-sectioning) ("mycurriculum" "\\documentclass[11pt,a4paper]{article}
\\usepackage[top=1cm,left=2cm,right=2cm,bottom=0.1cm]{geometry}
\\usepackage{setspace}
\\linespread{0.1}
\\usepackage{amsfonts,graphicx}
\\usepackage[pdftex,
            pdfauthor={{{{AUTHOR}}}}~<{{{{EMAIL}}}}>,
            pdftitle={{{{TITLE}}}},
            pdfsubject={{{{DESCRIPTION}}}},
            pdfkeywords={{{{KEYWORDS}}}},
            pdfstartview=FitH,urlcolor=blue,colorlinks=true,bookmarks=true
           ]{hyperref}
\\usepackage[latin1]{inputenc}  % char encoding
\\pagestyle{empty}
\\frenchspacing      % no aditional spaces after periods
\\setlength{\\parskip}{8pt}\\parindent=0pt  % no paragraph indentation
\\renewcommand\\familydefault{\\sfdefault}
[NO-DEFAULT-PACKAGES]" ("\\section{%s}" . "\\section*{%s}") ("\\subsection{%s}" . "\\subsection*{%s}") ("\\subsubsection{%s}" . "\\subsubsection*{%s}") ("\\paragraph{%s}" . "\\paragraph*{%s}")))))
 '(org-export-preserve-breaks t)
 '(org-export-run-in-background t)
 '(org-export-with-LaTeX-fragments (quote verbatim))
 '(org-export-with-fixed-width t)
 '(org-export-with-section-numbers nil)
 '(org-fontify-emphasized-text t)
 '(org-fontify-quote-and-verse-blocks t)
 '(org-format-latex-options (quote (:foreground default :background default :scale 1.0 :html-foreground "Black" :html-background "Transparent" :html-scale 1.0 :matchers ("begin" "$1" "$$" "\\(" "\\["))))
 '(org-hide-emphasis-markers t)
 '(org-highlight-latex-fragments-and-specials t)
 '(org-list-indent-offset 0)
 '(org-pretty-entities nil)
 '(org-pretty-entities-include-sub-superscripts nil)
 '(org-publish-project-alist (quote (("tecnoveneno" :auto-preamble t :base-directory "~/tecnoveneno/working/org/" :base-extension "org" :body-only t :headline-levels 999 :html-extension "html" :html-preamble t :htmlized-source t :publishing-directory "~/tecnoveneno/working/html/" :publishing-function org-publish-org-to-html :recursive t :section-numbers nil :sub-superscript t :table-of-contents nil))))
 '(org-return-follows-link t)
 '(org-src-fontify-natively t)
 '(org-src-tab-acts-natively t)
 '(org-startup-folded (quote content))
 '(org-use-sub-superscripts (quote {}))
 '(package-archives (quote (("gnu" . "http://elpa.gnu.org/packages/") ("marmalade" . "http://marmalade-repo.org/packages/") ("melpa" . "http://melpa.milkbox.net/packages/") ("user42" . "http://download.tuxfamily.org/user42/elpa/packages/"))))
 '(perl-tab-always-indent t)
 '(proced-after-send-signal-hook (quote (proced-revert)))
 '(regex-tool-backend (quote emacs))
 '(save-interprogram-paste-before-kill nil)
 '(send-mail-function (quote sendmail-send-it))
 '(sendmail-program "/usr/bin/msmtp")
 '(sentence-end-without-period t)
 '(server-mode t)
 '(set-language-environment-hook (quote (url-set-mime-charset-string)))
 '(sh-other-keywords (quote ((bash sh-append bourne "bye" "logout" "select") (bourne sh-append sh "function") (csh sh-append shell "breaksw" "default" "end" "endif" "endsw" "foreach" "goto" "if" "logout" "onintr" "repeat" "switch" "then" "while") (es "break" "catch" "exec" "exit" "fn" "for" "forever" "fork" "if" "return" "throw" "while") (ksh88 sh-append bourne "select") (rc "break" "case" "exec" "exit" "fn" "for" "if" "in" "return" "switch" "while") (sh sh-append shell "done" "esac" "fi" "for" "in" "return" "7z" "7za" "7zr" "a2p" "a2ping" "a2ps" "aafire" "aainfo" "aalib" "aasavefont" "aatest" "abook" "ac" "acct" "accton" "ack" "acl" "aconnect" "addpart" "adduser" "adjtimex" "adventure" "afm2tfm" "agetty" "agrep" "aleph" "align" "allcm" "allneeded" "alsa-utils" "alsaconf" "alsactl" "alsamixer" "amidi" "amixer" "ange-ftp" "animate" "antiword" "aplay" "aplaymidi" "apropos" "arc" "arch" "arecordmidi" "arithmetic" "arp" "arpd" "arping" "aseqdump" "aseqnet" "ash" "aspell" "at" "atc" "atd" "atq" "atrm" "atrun" "aumix" "autoexpect" "autoinsert" "autopasswd" "autorevert" "b2m" "backgammon" "badblocks" "banner" "base64" "basename" "bash" "batch" "battlestar" "bban" "bcd" "bibtex" "bin" "bind" "blkid" "blockdev" "bootlogd" "bpe" "browse-url" "bs" "bsd-finger" "bsd-games" "buildhash" "bunzip2" "bzcat" "bzdiff" "bzgrep" "bzip2" "bzip2recover" "bzless" "bzmore" "c2ph" "cacademo" "cacafire" "cacaplay" "cacaserver" "cacaview" "caesar" "cal" "calc" "calculator" "calendar" "canfield" "card" "cat" "catdoc" "catppt" "cdda2wav" "cdparanoia" "cdrecord" "cdrtools" "centerim" "cfdisk" "cfscores" "chacl" "chage" "chattr" "chcon" "chcpu" "chfn" "chgpasswd" "chgrp" "chkdupexe" "chmod" "chown" "chpasswd" "chroot" "chrt" "chsh" "chvt" "cksum" "clear" "clisp" "clockdiff" "cm2rem" "cmp" "col" "colcrt" "collateindex.pl" "colrm" "column" "comm" "compare" "compile_et" "composeglyphs" "composite" "config_data" "conjure" "consoletype" "contrab" "convert" "corelist" "coreutils" "countmail" "cp" "cpan" "cpan2dist" "cpanm" "cpanp" "cpanp-run-perl" "cpio" "cribbage" "crond" "cryptdir" "csplit" "css" "ctags" "ctangle" "ctie" "ctrlaltdel" "cups" "curl" "cut" "cweave" "cytune" "date" "dc3dd" "dcron" "dd" "ddate" "deallocvt" "debugfs" "debugreiserfs" "decryptdir" "deformat-c" "deformat-sh" "delpart" "depmod" "devdump" "devtodo" "df" "dialog" "diff" "diff3" "diffpp" "diffstat" "diffutils" "dig" "dir" "dircolors" "dired" "dirname" "diskcopy" "dislocate" "dmesg" "dmidecode" "dmp" "dns" "doc-view" "docbook2dvi" "docbook2html" "docbook2man" "docbook2pdf" "docbook2ps" "docbook2rtf" "docbook2tex" "docbook2texi" "docbook2txt" "doctor" "dprofpp" "du" "dump-acct" "dump-utmp" "dumpe2fs" "dumpkeys" "dvd+rw-tools" "dvi2fax" "dvicopy" "dvihp" "dvilj" "dvilj2p" "dvilj4" "dvilj4l" "dvipdfm" "dvipdft" "dvipng" "dvips" "dvired" "dvitomp" "dvitype" "e2freefrag" "e2fsck" "e2fsprogs" "e2image" "e2pall" "e2undo" "ebb" "egrep" "eject" "elvfmt" "elvis" "elvtags" "emacs" "emacsclient" "enc2xs" "encapsulate" "encode_keychange" "enscript" "env" "epsffit" "epstopdf" "eshell" "espeak" "etags" "etex" "evim" "expand" "expect" "expectk" "expiry" "expr" "extractres" "factor" "faillog" "fallocate" "false" "faucet" "fbset" "fdformat" "fdisk" "fetchmail" "ffap" "fgconsole" "fgrep" "figlet" "file" "filefrag" "find" "find-file" "find2perl" "findaffix" "finder" "findfs" "findmnt" "findutils" "finger" "fish" "fixdlsrps" "fixfmps" "fixmacps" "fixnt" "fixproc" "fixps" "fixpsditps" "fixpspps" "fixscribeps" "fixtpps" "fixwfwps" "fixwpps" "fixwwps" "flock" "fmt" "fmtutil" "fmtutil-sys" "fold" "fontinst" "formail" "fortune" "free" "fromdos" "fsck" "fsck.cramfs" "fsck.ext2" "fsck.ext3" "fsck.ext4" "fsck.ext4dev" "fsck.minix" "fsfreeze" "fstab-decode" "fstfind" "fstrim" "ftp-rfc" "funzip" "fuser" "gawk" "genl" "getafm" "getfacl" "getkeycodes" "getmail" "getopt" "getpeername" "gftodvi" "gftopk" "gftype" "git" "gnuchess" "gomoku" "gpasswd" "grep" "grep-changelog" "groupadd" "groupdel" "groupmems" "groupmod" "groups" "grpck" "grpconv" "grpunconv" "gsftopk" "gunzip" "gzexe" "gzip" "h2ph" "h2xs" "halt" "hangman" "hdparm" "head" "hexdump" "hose" "host" "hostid" "hostname" "htop" "hunt" "huntd" "hwclock" "ibuffer" "icombine" "id" "identify" "ido" "iecset" "ifcfg" "ifconfig" "ifstat" "ijoin" "imagemagick" "img2txt" "import" "includeres" "info" "infocmp" "infokey" "infozip" "init" "initlog" "initscript" "insmod" "insmod.static" "install" "install-catalog" "install-info" "instmodsh" "ionice" "iostat" "ip" "ipcmk" "ipcrm" "ipcs" "ipf-mod.pl" "ipmaddr" "ipmask" "iproute2" "iptables" "iptraf" "iptunnel" "iputils" "isodebug" "isodump" "isoinfo" "isosize" "isovfy" "ispell" "join" "jw" "kbd" "kbd_mode" "kbdrate" "kibitz" "kill" "killall" "killall5" "kpseaccess" "kpsereadlink" "kpsestat" "kpsetool" "kpsewhere" "kpsewhich" "ksh" "last" "last-acct" "lastcomm" "lastlog" "lbdb" "ldap" "ldapcompare" "ldapdelete" "ldapexop" "ldapmodify" "ldapmodrdn" "ldappasswd" "ldapsearch" "ldapurl" "ldapwhoami" "ldattach" "less" "lessecho" "lesskey" "lesspipe.sh" "libcaca" "libnetcfg" "libxml2" "lilo" "line" "link" "links" "linum" "linuxdoc" "linuxdoc-tools" "ln" "lnstat" "loadunimap" "locate" "lockfile" "logger" "login" "logname" "logoutd" "logsave" "longlines" "look" "losetup" "lpunlock" "ls" "lsattr" "lsblk" "lscpu" "lsdev" "lsmod" "lsof" "lspci" "lsusb" "lua" "lynx" "lzmadec" "lzmainfo" "mag" "mailstat" "mailx" "makeindex" "makeinfo" "makempx" "makewhatis" "man" "man2dvi" "man2html" "mapscrn" "mc" "mcookie" "md5sum" "mech-dump" "mesg" "mf" "mf-nowin" "mft" "mib2c" "mib2c-update" "mii-tool" "mille" "mk_cmds" "mkafmmap" "mkdir" "mke2fs" "mkfifo" "mkfs" "mkfs.bfs" "mkfs.cramfs" "mkfs.minix" "mkindex" "mkisofs" "mklost+found" "mknod" "mkocp" "mkofm" "mkpasswd" "mkreiserfs" "mkswap" "mktemp" "mktemp-gnu" "mktexlsr" "mktexmf" "mktexpk" "mktextfm" "mkzftree" "modinfo" "modprobe" "module-init-tools" "mogrify" "monop" "montage" "more" "morse" "most" "mount" "mountpoint" "mpg123" "mplayer" "mpost" "mpstat" "mpto" "msmtp" "multitail" "multixterm" "munchlist" "mutt" "muttprint" "mv" "mysql" "namei" "nameif" "nc" "ncat" "ncftp" "ncurses" "ndiff" "net-snmp" "net-snmp-config" "net-snmp-create-v3-user" "net-tools" "net-utils" "netpipes" "netresolv" "netstat" "netwatch" "newer" "newsticker" "newusers" "nice" "nl" "nmap" "nohup" "nologin" "nproc" "nslookup" "nstat" "ntp" "number" "od" "odvicopy" "odvitype" "ogg123" "oggdec" "oggenc" "ogginfo" "ogonkify" "oleo" "omega" "omfonts" "onsgmls" "openjade" "openldap-client" "openssh" "openssl" "openvt" "osgml2xml" "osgmlnorm" "ospam" "ospcat" "ospent" "otangle" "otp2ocp" "outocp" "over" "p7zip" "par" "parallel" "partx" "passmass" "passwd" "paste" "patch" "patgen" "pathchk" "pciutils" "pcre" "pcregrep" "pcretest" "pdfetex" "pdffonts" "pdfimages" "pdfinfo" "pdflatex" "pdftexi2dvi" "pdftoabw" "pdftohtml" "pdftoppm" "pdftops" "pdftotext" "pdfxtex" "pdiff" "perl" "perlbug" "perlcritic" "perldb" "perldoc" "perlinfo" "perlivp" "perlthanks" "perltidy" "pfb2pfa" "pg" "phantasia" "piconv" "pidstat" "pig" "ping" "ping6" "pinky" "pivot_root" "pk2bm" "pkill" "pktogf" "pktype" "pl2pm" "play" "plipconfig" "pltotf" "pmap" "pod2cpanhtml" "pod2html" "pod2latex" "pod2man" "pod2text" "pod2usage" "podchecker" "podselect" "pom" "pooltype" "poppler" "postgresql" "ppt" "pr" "precat" "preunzip" "prezip" "prezip-bin" "primes" "printenv" "printf" "prlimit" "procinfo" "procmail" "procps" "prove" "ps" "ps2frag" "ps2pk" "ps4pdf" "psbook" "psfxtable" "pslatex" "psmandup" "psmerge" "psnup" "psresize" "psselect" "psset" "pstops" "pstree" "ptar" "ptardiff" "ptx" "pwck" "pwconv" "pwunconv" "quiz" "rain" "random" "rarp" "rarpd" "raw" "rawtime" "rcirc" "rcs-checkin" "rdev" "rdisc" "readcd" "readlink" "readprofile" "realpath" "rec" "recentf" "rect.el" "ref" "regex" "reiserfsck" "reiserfsprogs" "reiserfstune" "rem2html" "rem2ps" "remember" "remind" "rename" "renice" "reset" "resize2fs" "resize_reiserfs" "resizecons" "rev" "rexima" "rftp" "rlogin-cwd" "rm" "rmdir" "rmmod" "robots" "rot13" "route" "routef" "routel" "rsync" "rtacct" "rtcwake" "rtf2rtf" "rtmon" "rtpr" "ruler" "rumakeindex" "run-parts" "runcon" "runlevel" "rvnamed" "s2p" "sa" "sadf" "sail" "sar" "savelog" "sc" "scgcheck" "scp" "screen" "script" "scriptreplay" "sdcv" "sdiff" "sed" "sedsed" "seejpeg" "sem" "sendmail" "seq" "setarch" "setconsolefont" "setfacl" "setfont" "setkeycodes" "setleds" "setmetamode" "setpci" "setserial" "setsid" "setterm" "sfdisk" "sftp" "sgml" "sgml2info" "sgml2latex" "sgml2txt" "sgmldiff" "sgmlpre" "sgmlsasp" "sgmlspl" "sgmlwhich" "sha1sum" "sha224sum" "sha256sum" "sha384sum" "sha512sum" "shadow" "shasum" "showchar" "showconsolefont" "showkey" "shred" "shuf" "shutdown" "sjeng" "skel" "skill" "slabtop" "slattach" "sleep" "sliceprint" "slocate" "snake" "snmp" "snmpbulkget" "snmpbulkwalk" "snmpcheck" "snmpconf" "snmpdelta" "snmpdf" "snmpget" "snmpgetnext" "snmpnetstat" "snmpset" "snmpstatus" "snmptable" "snmptest" "snmptranslate" "snmptrap" "snmpusm" "snmpvacm" "snmpwalk" "snscore" "sockdown" "socklist" "sort" "sox" "soxi" "speaker-test" "splain" "split" "sql" "squid" "ss" "ssh" "ssh-add" "ssh-agent" "ssh-copy-id" "ssh-keygen" "ssh-keyscan" "sshd" "stat" "states" "stdbuf" "strace" "strfile" "strings" "stty" "su" "sudo" "sulogin" "sum" "svn" "svnadmin" "svndumpfilter" "svnlook" "svnserve" "svnsync" "svnversion" "swaplabel" "swapon" "switch_root" "sync" "sysctl" "sysstat" "sysvbanner" "sysvinit" "table" "tac" "tail" "tailf" "tangle" "tar" "taskset" "tc" "tclsh" "tcpdump" "tcsh" "teachgammon" "tee" "telnet" "tempfile" "tesseract" "tetex" "tex" "texdoc" "texdoctk" "texexec" "texi2dvi" "texi2dvi4a2ps" "texi2html" "texi2pdf" "texindex" "texinfo" "texlinks" "tftopl" "tic" "tidy" "tie" "tig" "time" "timed-read" "timed-run" "timelimit" "timeout" "tknewsbiff" "tkpasswd" "tload" "tmm" "todos" "toe" "top" "touch" "tput" "tr" "tracepath" "tracepath6" "traceroute" "traceroute6" "tramp" "traptoemail" "tre" "tree" "trek" "true" "truncate" "tryaffix" "tset" "tsort" "ttf2afm" "tty" "tune2fs" "tunelp" "txt2regex" "txt2tags" "ul" "umount" "uname" "unbuffer" "unexpand" "unicode_start" "unicode_stop" "uniq" "unlink" "unshare" "unzip" "unzipsfx" "updmap" "updmap-sys" "uptime" "urifind" "urlview" "usb-devices" "usbutils" "useradd" "userdel" "usermod" "users" "usleep" "util-linux-ng" "uuidgen" "vcut" "vdir" "vftovp" "view" "vim" "vimdiff" "vimtutor" "vipw" "visudo" "vmstat" "volname" "vorbis-tools" "vorbiscomment" "vptovf" "w" "w3m" "wall" "wargames" "watch" "wc" "weather" "weave" "wget" "whatis" "whereis" "which" "whitespace" "who" "whoami" "whois" "windmove" "wipefs" "woman" "word-list-compress" "workbone" "worm" "worms" "write" "wtf" "wump" "wvdial" "xargs" "xkibitz" "xls2csv" "xml" "xml2po" "xmlcatalog" "xmlif" "xmllint" "xmlto" "xpath" "xpstat" "xsubpp" "xx" "xxd" "xz" "xzdec" "xzdiff" "xzgrep" "xzless" "xzmore" "yes" "zcat" "zcmp" "zdiff" "zegrep" "zfgrep" "zforce" "zgrep" "zip" "zipcloak" "zipgrep" "zipnote" "zipsplit" "ziptool" "zless" "zmore" "znew" "zsh" "mongo" "mongodump" "mongorestore" "mongoexport" "mongoimport" "mongostat" "mongotop" "bsondump" "pandoc" "lp" "make" "./configure" "prove" "dzil" "iconv" "mysqldump" "mysqlimport" "csv2yaml" "xsh" "cpan" "uni2ascii" "vi" "nasm" "gcc" "ld") (shell "break" "case" "continue" "exec" "exit") (zsh sh-append bash "select" "foreach"))))
 '(show-paren-mode t)
 '(show-paren-style (quote parenthesis))
 '(show-trailing-whitespace t)
 '(sort-fold-case t)
 '(sql-mode-hook (quote (sql-highlight-ansi-keywords)))
 '(tab-always-indent (quote complete))
 '(tab-stop-list (quote (4 8 16 24 32 40 48 56 64 72 80 88 96 104 112 120)))
 '(tab-width 4)
 '(text-mode-hook (quote (text-mode-hook-identify)))
 '(track-eol t)
 '(truncate-partial-width-windows nil)
 '(unibyte-display-via-language-environment nil)
 '(uniquify-ask-about-buffer-names-p t)
 '(uniquify-buffer-name-style (quote forward) nil (uniquify))
 '(uniquify-min-dir-content 1)
 '(user-mail-address "jimmy.tty@gmail.com")
 '(vlf-batch-size 10240)
 '(w3m-fb-delete-frame-kill-buffers nil)
 '(w3m-fill-column 79)
 '(w3m-init-file nil)
 '(w3m-new-session-in-background t)
 '(w3m-new-session-url "about:")
 '(w3m-pop-up-windows nil)
 '(w3m-session-show-titles nil)
 '(w3m-show-graphic-icons-in-header-line nil)
 '(w3m-show-graphic-icons-in-mode-line nil)
 '(w3m-tab-track-mouse nil)
 '(w3m-tab-width 4)
 '(w3m-toggle-inline-images-permanently nil)
 '(w3m-track-mouse nil)
 '(w3m-use-form nil)
 '(w3m-use-tab-menubar nil)
 '(web-mode-enable-block-face t)
 '(web-mode-enable-heredoc-fontification t)
 '(wget-download-directory "~/work/")
 '(windmove-wrap-around t)
 '(woman-cache-level 3)
 '(woman-fill-column 79)
 '(yank-pop-change-selection nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(cperl-array-face ((t (:background "black" :foreground "cyan"))))
 '(cperl-hash-face ((t (:background "black" :foreground "cyan"))))
 '(num3-face-even ((t (:foreground "white" :weight bold))))
 '(org-level-4 ((t (:inherit outline-4 :foreground "red"))))
 '(org-link ((t (:inherit font-lock-doc-face))))
 '(org-verbatim ((t (:foreground "magenta")))))
(put 'upcase-region 'disabled nil)
(put 'narrow-to-page 'disabled nil)
(put 'downcase-region 'disabled nil)