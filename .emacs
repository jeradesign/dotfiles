; John Brewer's .emacs file.

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(backup-by-copying t)
 '(backup-directory-alist '((".*" . "~/.emacsbackups")))
 '(confirm-kill-emacs 'y-or-n-p)
 '(kept-new-versions 10)
 '(ns-pop-up-frames t)
 '(package-selected-packages '(swift-mode use-package))
 '(read-file-name-completion-ignore-case nil)
 '(vc-make-backup-files t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "White" :foreground "Black" :inverse-video nil :box nil :strike-through nil :extend nil :overline nil :underline nil :slant normal :weight normal :height 120 :width normal :foundry "nil" :family "Andale Mono")))))

;; Set up frame ---------------------------------------------------------------

(setq default-frame-alist '((top . 4) (left . 58) (width . 120) (height . 50)))
(setq frame-title-format "%b <%f>")
(tool-bar-mode -1)
(setq inhibit-startup-screen t)

;; Customize modeline ---------------------------------------------------------

(setq column-number-mode t)

(require 'uniquify)
(setq uniquify-buffer-name-style 'post-forward-angle-brackets)

;; Look and feel stuff --------------------------------------------------------

;; Don't quit emacs when I hit C-x C-c _if_ running in a window.
(if window-system
    (global-set-key "\C-x\C-c" 'server-edit))

;; Don't "suspend" emacs when I accidentally hit ctrl-z!
(global-unset-key "\C-z")

;; delete (not kill) selected text when I type over it
(delete-selection-mode t)

;; word wrap
(setq-default word-wrap t)

;; Ediff ----------------------------------------------------------------------

;; keep ediff from popping up its own control frame
(setq ediff-window-setup-function 'ediff-setup-windows-plain)
(setq ediff-split-window-function 'split-window-horizontally)

;; Flyspell -------------------------------------------------------------------

(setq ispell-program-name "/opt/homebrew/bin/ispell")
(add-hook 'text-mode-hook 'flyspell-mode)

;; Use *Notes* Buffer which is rememebered between sessions
(setq initial-buffer-choice 'remember-notes)
(setq remember-notes-buffer-name "\*scratch\*")
(setq remember-data-file "~/emacs-notes.txt")
(remember-notes)

;;; Add MELPA as a package source
(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(package-initialize)

;;; Bootstrap `use-package'
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-when-compile
  (require 'use-package))

;;; Locate sourcekit-lsp
(defun find-sourcekit-lsp ()
  (or (executable-find "sourcekit-lsp")
      (and (eq system-type 'darwin)
           (string-trim (shell-command-to-string "xcrun -f sourcekit-lsp")))
      "/usr/local/swift/usr/bin/sourcekit-lsp"))

;; Swift editing support
(use-package swift-mode
    :ensure t
    :mode "\\.swift\\'"
    :interpreter "swift")


;; Emacs server ---------------------------------------------------------------

(server-start)
