;; Disable menu, toolbar, and scrollbar
(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)

;; Set melpa repository
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


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (spacemacs-dark)))
 '(custom-safe-themes
   (quote
    ("bffa9739ce0752a37d9b1eee78fc00ba159748f50dc328af4be661484848e476" default)))
 '(package-archives
   (quote
    (("gnu" . "https://elpa.gnu.org/packages/")
     ("melpa" . "https://melpa.org/packages/"))))
 '(package-selected-packages
   (quote
    (markdown-mode makrdown-mode try beacon spacemacs-theme spacemacs-themes which-key use-package))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
