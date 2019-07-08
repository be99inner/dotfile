;; Disable menu, toolbar, and scrollbar
(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)

;; Set line number
;;(global-linum-mode 1)

;; Auto reload file (when file is edited outside emacs)
(global-auto-revert-mode t)

;; Set encoding
(set-default-coding-systems 'utf-8)
(set-language-environment 'utf-8)
(set-selection-coding-system 'utf-8)

;; Configure repository
(setq package-enable-at-startup nil)
(when (load (expand-file-name "~/.emacs.d/repository.el")))

;; Install package
(when (load (expand-file-name "~/.emacs.d/package.el")))

;; Disable Startup message
(setq inhibit-startup-message t)

;; Disable bell ring
(setq ring-bell-function 'ignore)

;; Disable scrolling to move cursor to middle screen
(setq scroll-conservatively 100)

;; Set highlight cursor line
(when window-system (global-hl-line-mode t))

;; Disable swapfile (backup file)
(setq make-backups-file nil)
(setq auto-save-default nil)
;; Disable create lockfile
(setq create-lockfiles nil)
;; Set Backup Directory
(setq backup-directory-alist '(("" . "~/.emacs.d/backup")))

;; Ido mode
;; use ido mode with plugin ido-vertical in package.el
(setq ido-enable-flex-matching nil)
(setq ido-create-new-buffer 'always)
(setq ido-everywhere t)
(ido-mode 1)

;; evil configuration
(when (load (expand-file-name "~/.emacs.d/evil-config.el")))

;; Easy confirmation
(defalias 'yes-or-no-p 'y-or-n-p)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (spacemacs-dark)))
 '(custom-safe-themes
   (quote
    ("a27c00821ccfd5a78b01e4f35dc056706dd9ede09a8b90c6955ae6a390eb1c1e" "3c83b3676d796422704082049fc38b6966bcad960f896669dfc21a7a37a748fa" "bffa9739ce0752a37d9b1eee78fc00ba159748f50dc328af4be661484848e476" default)))
 '(package-archives
   (quote
    (("gnu" . "https://elpa.gnu.org/packages/")
     ("melpa" . "https://melpa.org/packages/"))))
 '(package-selected-packages
   (quote
    (nlinum-relative wakatime-mode evil smex ido-vertical-mode markdown-mode makrdown-mode try beacon spacemacs-theme spacemacs-themes which-key use-package)))
 '(wakatime-cli-path "/usr/bin/wakatime")
 '(wakatime-python-bin nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
