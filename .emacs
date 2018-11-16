(require 'package)

;; Melpa package manager
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/"))

(setq package-enable-at-startup nil)
(package-initialize)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("aaffceb9b0f539b6ad6becb8e96a04f2140c8faa1de8039a343a4f1e009174fb" default)))
 '(package-selected-packages
   (quote
    (magit helm evil-snipe dracula-theme linum-relative markdown-mode use-package evil-visual-mark-mode))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-when-compile
  (require 'use-package))

;; Theme
(load-theme 'dracula)

;; Disable scroll bar
(scroll-bar-mode -1)

;; Load desktop session on startup
(desktop-save-mode 1)

;; Evil-mode
(require 'evil)
(evil-mode t)

;;;; Emulate Vim's C-u (insert mode is wonky...)
;;;; https://stackoverflow.com/a/23715631/845275
(define-key evil-normal-state-map (kbd "C-u") 'evil-scroll-up)
(define-key evil-visual-state-map (kbd "C-u") 'evil-scroll-up)
(define-key evil-insert-state-map (kbd "C-u")
  (lambda ()
    (interactive)
    (evil-delete (point-at-bol) (point))))

;;;; esc quits everything...
(define-key evil-normal-state-map [escape] 'keyboard-quit)
(define-key evil-visual-state-map [escape] 'keyboard-quit)
(define-key minibuffer-local-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-ns-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-completion-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-must-match-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-isearch-map [escape] 'minibuffer-keyboard-quit)

;;;; Same as vim-sneak: use "s" to search for 2 chars
(require 'evil-snipe)
(evil-snipe-mode +1)

;; Helm
;;;; Easier buffer navigation with Helm
(define-key evil-ex-map "b " 'helm-mini)
(define-key evil-ex-map "e" 'helm-find-files)

;; Relative line numbering ala Vim
(require 'linum-relative)

;;;; Use native relative mode (Emacs 26+)
(setq linum-relative-backend 'display-line-numbers-mode)
(linum-relative-global-mode)

(use-package markdown-mode
  :ensure t)

(setq markdown-indent-on-enter 'indent-and-new-item)

