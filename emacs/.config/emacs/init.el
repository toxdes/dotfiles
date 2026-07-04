;; MELPA
(require 'package)
(setq package-archives '(("melpa" . "https://melpa.org/packages/")
			 ("gnu" . "https://elpa.gnu.org/packages/")))
(package-initialize)

;; Disable UI elements
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(setq inhibit-startup-screen t)
(setq initial-buffer-choice t)
(setq-default indent-tabs-mode t)
(setq-default tab-width 2)

;; Colorscheme
(use-package solarized-theme
  :ensure t
  :config
  (load-theme 'solarized-dark t))
(with-eval-after-load 'solarized-theme
  (set-face-foreground 'line-number-current-line (face-foreground 'font-lock-string-face))
  (set-face-attribute 'mode-line nil :underline nil))

;; Whitespaces
(use-package whitespace
  :ensure nil
  :config
  ())

;; ENV Vars
(use-package exec-path-from-shell
  :ensure t
  :config
  (exec-path-from-shell-initialize)
  ;; Explicitly copy variables needed for GPG
  (exec-path-from-shell-copy-env "GPG_AGENT_INFO")
  (exec-path-from-shell-copy-env "SSH_AUTH_SOCK"))

;; GPG
(setq epg-pinentry-mode 'loopback)

;; Ido & Smex
(use-package ido
  :ensure nil
  :config
  (ido-mode 1)
  (setq ido-enable-flex-matching t)
  (setq ido-everywhere t)
  (setq ido-use-filename-at-point t))

(use-package smex
  :ensure t
  :after ido
  :config
  (smex-initialize)
  (global-set-key (kbd "M-x") 'smex)
  (global-set-key (kbd "M-X") 'smex-major-mode-commands)
  (global-set-key (kbd "C-c C-c M-x") 'execute-extended-command))

;; Magit 
(use-package magit
  :ensure t
  :bind (("C-c g" . magit-status)))

;; Yasnippet & Company
(use-package yasnippet
  :ensure t
  :config
  (yas-global-mode 1))

(use-package company
  :ensure t
  :init
  (global-company-mode 1)
  :config
  (add-to-list 'company-backends 'company-yasnippet))

;; Languages
(use-package go-mode
  :ensure t)

;; Font
(set-face-attribute 'default nil :font "IosBerkMono-11")
(set-face-attribute 'line-number nil :font "IosBerkMonoMedium-11")
;; Line height
(setq-default line-spacing 0.0)    



;; Relative line numbers
(global-display-line-numbers-mode 1)
(setq display-line-numbers 'relative)


;; Highlight current line
(global-hl-line-mode 1)
(with-eval-after-load 'hl-line
  (set-face-background 'line-number-current-line (face-background 'hl-line)))

;; Shift+arrow keys to move between windows
(windmove-default-keybindings)

;; Custom file for changes to config done by emacs
(setq custom-file "~/.config/emacs/custom.el")
(load custom-file 'noerror)
