;; Use Packages
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

;; Spacemacs theme
(unless (package-installed-p 'spacemacs-theme)
  (package-refresh-contents)
  (package-install 'spacemacs-theme))

;; Whichkey
;; whichkey use for show keybinding on emacs on real-time
(use-package which-key
  :ensure t
  :init (which-key-mode))

;; Beacon
;; beacon use for easy to find your cursor
(use-package beacon
  :ensure t
  :init (beacon-mode 1))

;; Try
;; use try package for try some plugin
(use-package try
  :ensure t)

;; Markdown Mode
(use-package markdown-mode
  :ensure t
  :commands (mardown-mode gfm-mode)
  :mode (("README\\.md\\'" . gfm-mode)
	 ("\\.md\\'" . markdown-mode)
	 ("\\.markdown'" . markdown-mode))
  :init (setq markdown-command "multimarkdown"))

;; ido-vertical
(use-package ido-vertical-mode
  :ensure t
  :init (ido-vertical-mode 1))
(setq ido-vertical-define-keys 'C-n-and-C-p-only)

;; SMEX
(use-package smex
  :ensure t
  :init (smex-initialize)
  :bind ("M-x" . smex))


;; Evil mode
(use-package evil
  :ensure t
  :config (evil-mode 1))
