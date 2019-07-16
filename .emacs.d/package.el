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
  :ensure t
)

;; Markdown Mode
(use-package markdown-mode
  :ensure t
  :commands (mardown-mode gfm-mode)
  :mode (
	 ("README\\.md\\'" . gfm-mode)
	 ("\\.md\\'" . markdown-mode)
	 ("\\.markdown'" . markdown-mode)
	 )
  :init (setq markdown-command "multimarkdown")
)

;; ido-vertical
(use-package ido-vertical-mode
  :ensure t
  :init (ido-vertical-mode 1)
  )
(setq ido-vertical-define-keys 'C-n-and-C-p-only)

;; SMEX
(use-package smex
  :ensure t
  :init (smex-initialize)
  :bind ("M-x" . smex)
  )


;; Evil mode
(use-package evil
  :ensure t
  :config (evil-mode 1)
  )

;; Vim Powerline for Emacs
(use-package powerline-evil
  :ensure t
  )
(use-package powerline
  :ensure t
  :init (powerline-evil-center-color-theme)
  )

;;(use-package smart-mode-line-powerline-theme
  ;;:ensure t)
;;(use-package smart-mode-line
  ;;:ensure t
  ;;:config
  ;;(setq sml/no-confirm-load-theme t)
  ;;(setq sml/apply-theme 'smart-mode-line-powerline-theme)
  ;;(sml/setup))

;; Yaml mode
(use-package yaml-mode
  :ensure t
  :mode ("\\.yml$" . yaml-mode))

;; Wakatime
(use-package wakatime-mode
  :ensure t
  :init (global-wakatime-mode)
  )

;; Number relative
(use-package nlinum-relative
  :ensure t
  :config
  (setq nlinum-relative-redisplay-delay 0)
  (setq nlinum-relative-ofset 0)
  (nlinum-relative-setup-evil)
  (add-hook 'prog-mode-hook 'nlinum-relative-mode)
  (add-hook 'text-mode-hook 'nlinum-relative-mode)
  (add-hook 'conf-mode-hook 'nlinum-relative-mode)
  )

;; Display preview color
(use-package rainbow-mode
  :ensure t
  :init (rainbow-mode 1)
  :config
  (add-hook 'conf-mode-hook 'rainbow-mode)
  ;;(add-hook 'prog-mode-hook 'rainbow-mode)
  ;;(add-hook 'text-mode-hook 'rainbow-mode)
  ;;(setq rainbow-mode 1)
  )
