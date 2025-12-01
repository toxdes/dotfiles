;; Disable ui-elements
(setq inhibit-startup-message t)
(scroll-bar-mode -1) 
(tool-bar-mode -1) 
(tooltip-mode -1)
(menu-bar-mode -1)
(setq-default tab-width 2)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
	 '(company counsel doom-modeline doom-themes evil evil-collection
						 evil-escape general go-mode hydra ivy ivy-rich js-mode
						 json-mode lsp-mode lsp-ui magit rainbow-delimiters smex
						 typescript-mode web-mode)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; disable annoying keybindings
(global-unset-key (kbd "C-u"))
(global-unset-key (kbd "C-j"))
(global-unset-key (kbd "C-k"))


;; set horizontal margin
(set-fringe-mode 10)

;; flash screen instead of the bubble sound
(setq visible-bell t)

;; set font
(set-face-attribute 'default nil :font "Iosevka Nerd Font SemiBold 12")

;; enable packages
(require 'package)

;; set package archives
(setq package-archives '(("melpa" . "https://melpa.org/packages/")
												 ("melpa-stable" . "https://stable.melpa.org/packages/")
												 ("org" . "https://orgmode.org/elpa/")
												 ("elpa" . "https://elpa.gnu.org/packages/")))
(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))

(unless (package-installed-p 'use-package) (package-install 'use-package))
(require 'use-package)
(setq use-package-always-ensure t)

(use-package doom-modeline
  :config
	(setq doom-modeline-icon t)
	(setq doom-modeline-indent-info nil)
	(setq doom-modeline-height 24) ;; increase for better spacing
	(setq doom-modeline-total-line-number nil)
  :init (doom-modeline-mode 1))
(use-package rainbow-delimiters
  :hook (prog-mode . rainbow-delimiters-mode))

(set-face-attribute 'mode-line nil :font "Iosevka Nerd Font Extended SemiBold 11")
(set-face-attribute 'mode-line-inactive nil :font "Iosevka Nerd Font Extended SemiBold 11")

(use-package doom-themes
  :config
  (load-theme 'doom-solarized-dark t))


(setq evil-insert-state-cursor '(hbar . 3))  ; horizontal bar cursor 2px high



(use-package ivy
  :diminish
  :bind (("C-s" . swiper)
				 :map ivy-minibuffer-map
				 ("TAB" . ivy-alt-done)
				 ("C-l" . ivy-alt-done)
				 ("C-j" . ivy-next-line)
				 ("C-k" . ivy-previous-line)
				 :map ivy-switch-buffer-map
				 ("C-j" . ivy-next-line)
				 ("C-k" . ivy-previous-line)
				 ("C-l" . ivy-done)
				 ("C-d" . ivy-switch-buffer-kill)
				 :map ivy-reverse-i-search-map
				 ("C-k" . ivy-previous-line)
				 ("C-j" . ivy-next-line)
				 ("C-d" . ivy-reverse-i-search-kill))
  :config
  (ivy-mode 1))

(use-package counsel
  :bind
  (("M-x" .  counsel-M-x)
   ("C-x b" . counsel-ibuffer)
   ("C-x C-f" . counsel-find-file)
   :map minibuffer-local-map
   ("C-r" . 'counsel-minibuffer-history))
  :config
  (setq ivy-initial-inputs-alist nil))

(use-package company
  :after lsp-mode
  :hook (lsp-mode . company-mode)
  :bind
  :config
  (setq company-tooltip-margin 2
        company-tooltip-align-annotations t
        company-tooltip-limit 10
				company-format-margin-function nil
				company-idle-delay 0.0
				company-minimum-prefix-length 1))

(use-package evil
  :init
  (setq evil-want-keybinding nil)
	(setq evil-want-C-u-scroll t)
  :config
  (evil-mode 1))

(use-package evil-escape
  :after evil
  :config
	(setq evil-escape-key-sequence "kj")
	(setq evil-escape-excluded-states '(normal visual replace emacs motion))
  (evil-escape-mode 1))

(use-package evil-collection
  :after evil
  :config
  (evil-collection-init))

(use-package ivy-rich
  :init
  (ivy-rich-mode 1))

(use-package which-key
  :init (which-key-mode)
  :diminish which-key-mode
  :config
  (setq which-key-idle-delay 1))

(use-package general
  :after evil
  :config
  (general-create-definer vaib/leader-keys
    :keymaps '(normal insert visual)
    :prefix "SPC" 
    :global-prefix "C-SPC"))

(use-package smex)

(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
;; This is your old M-x.
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)

(vaib/leader-keys
  "t" '(:ignore t :which-key "quick-config")
  "tt" '(counsel-load-theme :which-key "choose theme")
  "ts" '(hydra-text-scale/body :which-key "scale text")
  "tr" '(eval-buffer :which-key "eval buffer")
  "F" '(find-file :which-key "find file")
  "r" '(counsel-rg :which-key "grep text")
  "R" '(query-replace-regexp :which-key "query-replace regex")
  "b" '(project-find-file :which-key "find project file")
  "f" '(ivy-switch-buffer :which-key "switch buffers")
	"=" '(vaib/indent-whole-buffer :which-key "indend-all")
  "g" '(magit-status :which-key "git-status"))

(defun vaib/indent-whole-buffer ()
  (interactive)
  (save-excursion
    (indent-region (point-min) (point-max))))

;; ctrl+enter opens buffer in vertical spli
(defun ivy-switch-buffer-split-right ()
  "Open buffer in a vertical split when selecting a buffer."
  (interactive)
  (ivy-quit-and-run
		(split-window-right)  ; Vertical split (on the right)
		(other-window 1)      ; Move focus to the new window
		(ivy-call)))  ; Open the buffer selected by ivyt
(define-key ivy-minibuffer-map (kbd "<C-return>") 'ivy-switch-buffer-split-right)

(use-package hydra)

(use-package magit)

(use-package lsp-mode
  :commands (lsp lsp-deferred)
  :init
  (setq lsp-keymap-prefix "C-l")
  :config
	(set-face-attribute 'lsp-face-highlight-textual nil :background "#13383C" :foreground "#268BD2")
  (setq gc-cons-threshold 300000000)
	(setq lsp-headerline-breadcrumb-enable nil)
  (lsp-enable-which-key-integration t))

(use-package lsp-ui
  :after lsp-mode
  :custom
  (lsp-ui-doc-position 'at-point)
  (lsp-ui-doc-alignment 'window)
  (lsp-ui-doc-use-childframe t)
  (lsp-ui-doc-show-with-cursor nil)
  (lsp-ui-doc-show-with-mouse nil)
  :config
  (defun vaib/lsp-ui-doc-hide-on-esc ()
    (interactive)
    (when (lsp-ui-doc--visible-p)
      (lsp-ui-doc-hide)))

  :bind
  (:map lsp-mode-map
        ("C-l SPC" . lsp-ui-doc-show)
        ("<escape>" . vaib/lsp-ui-doc-hide-on-esc)))

(use-package python
  :hook (python-mode . lsp-deferred))

(use-package go-mode
  :hook ((go-mode . lsp-deferred)
         (go-mode . (lambda ()
                      (setq tab-width 2
                            indent-tabs-mode t)))))

;; Set up before-save hooks to format buffer and add/delete imports.
;; Make sure you don't have other gofmt/goimports hooks enabled.
(defun lsp-go-install-save-hooks ()
  (add-hook 'before-save-hook #'lsp-format-buffer t t)
  (add-hook 'before-save-hook #'lsp-organize-imports t t))
(add-hook 'go-mode-hook #'lsp-go-install-save-hooks)

(use-package typescript-mode
  :mode "\\.ts\\'"
  :hook (typescript-mode . lsp-deferred))


(use-package web-mode
  :ensure t
  :mode ("\\.tsx\\'" "\\.jsx\\'")
  :hook (web-mode . lsp-deferred))

;; JSON
(use-package json-mode
  :ensure t
  :hook (json-mode . lsp-deferred))

(add-hook 'c-mode-hook #'lsp-deferred)
(add-hook 'c++-mode-hook #'lsp-deferred)


(defhydra hydra-text-scale (:timeout 4)
	"scale text"
	("j" text-scale-increase "in")
	("k" text-scale-decrease "out")
	("f" nil "finish" :exit t))

(column-number-mode)
(setq display-line-numbers-type 'relative)
(global-display-line-numbers-mode t)
;; Keybinds
(global-set-key (kbd "<escape>") 'keyboard-escape-quit)
(global-set-key (kbd "C-p") 'counsel-switch-buffer)

(set-frame-parameter nil 'alpha-background 100)  ;; 0 = fully transparent, 100 = opaque
(add-to-list 'default-frame-alist '(alpha-background . 100))
(setq-default line-spacing 0.2)  ;; Adjust 0.2 to increase/decrease spacing

(defun open-alacritty-at-project-root ()
  (interactive)
  (let ((default-directory (project-root (project-current t))))
    (start-process "alacritty" nil "alacritty")))

(global-set-key (kbd "M-RET") #'open-alacritty-at-project-root)

(defun vaib/go-to-definition ()
	(interactive)
	(if (bound-and-true-p lsp-mode)
			(lsp-find-definition)
		(xref-find-definitions (thing-at-point 'symbol t))))

(define-key prog-mode-map (kbd "C-<return>") #'vaib/go-to-definition)

(defun vaib/create-file-in-project ()
  (interactive)
  (let* ((project-root (project-root (project-current t)))
         (input (read-string "Path (relative to project): "))
         (full-path (expand-file-name input project-root)))
    (make-directory (file-name-directory full-path) t)
    (find-file full-path)))

(global-set-key (kbd "M-n") #'vaib/create-file-in-project)

(setq auto-save-file-name-transforms '((".*" "~/.emacs-saves/" t)))
(setq lock-file-name-transforms '((".*" "~/.emacs-saves/" t)))
(setq backup-directory-alist '((".*" . "~/.emacs-saves/")))


;; override theme colors - solarized-dark
(set-face-attribute 'region nil :background "#859000" :foreground "#002B36")
(set-face-attribute 'lazy-highlight nil :background "#859000" :foreground "#002B36")
(set-face-attribute 'ivy-current-match nil :background "#859000" :foreground "#002B36")
(set-face-attribute 'ivy-minibuffer-match-face-2 nil :background "#D33682" :foreground "#002B36")
(set-face-attribute 'line-number-current-line nil :background "#13383C" :foreground "#2384C6")
