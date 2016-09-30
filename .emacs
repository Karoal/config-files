(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "mononoki" :foundry "UKWN" :slant normal :weight normal :height 90 :width normal)))))

;; Personal configuration starts here.
(setq user-full-name "Karol Ciszek")
(setq user-mail-address "karol.ciszek15@imperial.ac.uk")

;; Common Lisp
(require 'cl)

(load "package")
(package-initialize)
(add-to-list 'package-archives
	     '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives
	     '("melpa" . "http://melpa.org/packages/") t)
(setq package-archive-enable-alist '(("melpa" deft magit)))

(defvar abedra/packages '(ac-slime
                          auto-complete
                          autopair
			  base16-theme
                          clojure-mode
                          coffee-mode
                          csharp-mode
                          deft
                          erlang
                          feature-mode
			  fill-column-indicator
			  fireplace
                          flycheck
                          gist
                          go-autocomplete
                          go-eldoc
                          go-mode
                          graphviz-dot-mode
                          haml-mode
                          haskell-mode
                          htmlize
                          idris-mode
                          magit
                          markdown-mode
                          marmalade
                          nodejs-repl
                          o-blog
                          org
                          paredit
                          php-mode
                          puppet-mode
			  pymacs
			  pyvenv
                          restclient
                          rvm
                          scala-mode
                          smex
                          sml-mode
                          web-mode
                          writegood-mode
                          yaml-mode)
  "Default packages")

(defun abedra/packages-installed-p ()
  (loop for pkg in abedra/packages
        when (not (package-installed-p pkg)) do (return nil)
        finally (return t)))

(unless (abedra/packages-installed-p)
  (message "%s" "Refreshing package database...")
  (package-refresh-contents)
  (dolist (pkg abedra/packages)
    (when (not (package-installed-p pkg))
      (package-install pkg))))

;; Theme configuration
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(column-number-mode t)
 '(custom-safe-themes
   (quote
    ("b4ec581daad15aa7020b722523dc6bcea850bfbdbe31bfeb11c45ea51899bd75" "ad68cb14359254795c6b96d76334aaacb739c04f64a4a8567964d4a20aa723d2" "930227e22122d1881db7c2c1ae712dcf715697a1c4d9864f8107a2c3c2da9f8b" "f2503f0a035c2122984e90eb184185769ee665de5864edc19b339856942d2d2d" "b1bcb837df0455af8e91114b7a3bddfa084cde32ceb16b1b468d5e5e8605a835" "59ca830d4df5e79503b79103485d28c6a578ca14d526ffc6a43596808daf1282" "76bd62f6ce376bf0597fab7f478eaa98cd94a7b41f0ae46de63a958fbe99c1d9" "2162da67ce86c514aff010de1b040fb26663ca42afebc2de26515d741121c435" "a7b47876e5da7cac6f5e61cca7a040a365ca2c498823654bd4076add8edf34c5" "f245c9f24b609b00441a6a336bcc556fe38a6b24bfc0ca4aedd4fe23d858ba31" "82cbb553a225b75ee49901fa06562941fbfe5e6fed24cda985e7ea59af7ddc80" "d5aac94c0051c3acec2b274347b343372b4e64c3e226be7b7c56725ea26b1ba8" "0b6645497e51d80eda1d337d6cabe31814d6c381e69491931a688836c16137ed" "b110da1a5934e91717b5c490709aba3c60eb4595194bbf9fdcbb97d247c70cfa" "101a10b15bbbd0d5a0e56e4773e614962197886780afb2d62523a63a144ad96c" "d43120398682953ef18fd7e11e69c94e44d39bb2ab450c4e64815311542acbff" "aed73c6d0afcf2232bb25ed2d872c7a1c4f1bda6759f84afc24de6a1aec93da8" "8e3f020f1ce69cfa0c1ebee4e198feb28dd7eb31b7d77927e9c790819210c654" "6916fa929b497ab630e23f2a4785b3b72ce9877640ae52088c65c00f8897d67f" default)))
 '(package-selected-packages
   (quote
    (fireplace yaml-mode writegood-mode web-mode solarized-theme sml-mode smex scala-mode rvm rope-read-mode restclient pyvenv pymacs puppet-mode php-mode paredit o-blog nodejs-repl marmalade markdown-mode magit idris-mode htmlize haskell-mode haml-mode graphviz-dot-mode go-eldoc go-autocomplete gist flycheck fill-column-indicator feature-mode erlang deft csharp-mode coffee-mode clojure-mode base16-theme autopair ac-slime)))
 '(show-paren-mode t)
 '(tool-bar-mode nil))

(if window-system
    (load-theme 'base16-ocean-dark t)
  (load-theme 'wombat t))

;; Scratch-buffer
(setq inhibit-splash-screen t
      inital-scratch-message nil)
;;    initial-major-mode 'org-mode)

;; Line numbers
;; (global-linium-mode 1)

(scroll-bar-mode -1)
(tool-bar-mode -1)
(menu-bar-mode 1)

;; Mode line settings
(display-time-mode 1)
(setq-default mode-line-format
              '("%e" mode-line-front-space
                ;; Standard info about the current buffer
                mode-line-mule-info
                mode-line-client
                mode-line-modified
                mode-line-remote
                mode-line-frame-identification
                mode-line-buffer-identification " " mode-line-position
                ;; Some specific information about the current buffer:
                lunaryorn-projectile-mode-line ; Project information
                (vc-mode lunaryorn-vc-mode-line) ; VC information
                (flycheck-mode flycheck-mode-line) ; Flycheck status
                (multiple-cursors-mode mc/mode-line) ; Number of cursors
                ;; Misc information, notably battery state and function name
                " "
                mode-line-misc-info
                ;; And the modes, which I don't really care for anyway
                " " mode-line-modes mode-line-end-spaces))

;; Let emacs treat highlighted text just like other editors do.
(delete-selection-mode t)
(transient-mark-mode t)
(setq x-select-enable-clipboard t)

(setq-default indicate-empty-lines t)
(when (not indicate-empty-lines)
  (toggle-indicate-empty-lines))

;; Get rid of tabs :)
(setq tab-width 4
      indent-tabs-mode nil)

;; Org mode
(setq org-log-done t
      org-startup-folded t
      org-agenda-show-log t)
(add-hook 'org-mode-hook
          (lambda ()
            (flyspell-mode)))
(add-hook 'org-mode-hook
          (lambda ()
            (writegood-mode)))
(define-key global-map "\C-ca" 'org-agenda)
(setq org-agenda-files (list "~/org/personal.org"
			     "~/org/notes.org"))


;; Assorted keybindings (due Aaron Bedra)
(global-set-key (kbd "RET") 'newline-and-indent)
(global-set-key (kbd "C-;") 'comment-or-uncomment-region)
(global-set-key (kbd "M-/") 'hippie-expand)
(global-set-key (kbd "C-+") 'text-scale-increase)
(global-set-key (kbd "C--") 'text-scale-decrease)
(global-set-key (kbd "C-c C-k") 'compile)
(global-set-key (kbd "C-x g") 'magit-status)

;; Misc
(setq echo-keystrokes 0.1
      use-dialog-box nil
      visible-bell t)
(show-paren-mode t)

;; Utils setup
;;

;; Smex is an extension to M-x
(setq smex-save-file (expand-file-name ".smex-items" user-emacs-directory))
(smex-initialize)
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)

;; Ido provides a nice way to navigate the filesystem
(ido-mode nil)
(setq ido-enable-flex-matching t
      ido-use-virtual-buffers t)

(setq column-number-mode t)

;; Autopair closes braces as soon as they are opened.
(require 'autopair)
(autopair-mode t)
(autopair-global-mode t)

(require 'auto-complete-config)
(ac-config-default)

;; Flyspell is the default Emacs spellchecker.
(setq flyspell-issue-welcome-flag nil)
(if (eq system-type 'darwin)
    (setq-default ispell-program-name "/usr/local/bin/aspell")
  (setq-default ispell-program-name "/usr/bin/aspell"))
(setq-default ispell-list-command "list")

(require 'fill-column-indicator)
(define-globalized-minor-mode
 global-fci-mode fci-mode (lambda () (fci-mode 1)))
(global-fci-mode t)
(set-fill-column 80)

; python-mode
; use IPython
(setq-default py-shell-name "ipython")
(setq-default py-which-bufname "IPython")
; use the wx backend, for both mayavi and matplotlib
(setq py-python-command-args
  '("--gui=wx" "--pylab=wx" "-colors" "Linux"))
(setq py-force-py-shell-name-p t)
; switch to the interpreter after executing code
(setq py-shell-switch-buffers-on-execute-p t)
(setq py-switch-buffers-on-execute-p t)
; don't split windows
(setq py-split-windows-on-execute-p nil)
; try to automagically figure out indentation
(setq py-smart-indentation t)

; pymacs
(autoload 'pymacs-apply "pymacs")
(autoload 'pymacs-call "pymacs")
(autoload 'pymacs-eval "pymacs" nil t)
(autoload 'pymacs-exec "pymacs" nil t)
(autoload 'pymacs-load "pymacs" nil t)
(autoload 'pymacs-autoload "pymacs")

; Emacs Speaks Statistics
; (require 'ess-site)
