(setq use-dialog-box nil
      visible-bell t
      inhibit-startup-message t
      column-number-mode t
      global-revert-non-file-buffers t)

;; reloads file when it changes on disk
(global-auto-revert-mode 1)

;; saves minibuffer history
(savehist-mode 1)

;; saves position in file
(save-place-mode 1)

;; removes visual elements from UI
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

;; line numbers
(global-display-line-numbers-mode 1)
(setq display-line-numbers-type 'relative)

;; styling
(add-to-list 'custom-theme-load-path "~/.emacs.d/elpa/moe-theme-1.0.2/")
(load-theme 'moe-dark t)
(hl-line-mode 1)
(set-face-attribute 'default nil :height 180)

(add-hook 'window-setup-hook 'toggle-frame-maximized t)

;; recent files
(recentf-mode 1)
(setq recentf-max-menu-items 25)
(setq recentf-max-saved-items 25)
(global-set-key "\C-x\ \C-r" 'recentf-open)

;; default style of files
(setq c-default-style '(
      (java-mode . "java")
      (awk-mode . "awk")
      (c-mode . "k&r")
      (other . "gnu"))
      )
(setq c-basic-offset 2)
(setq indent-tabs-mode nil)

;; backup files
(setq backup-directory-alist `(("." . "~/.emacs-backups"))
      backup-by-copying t
      delete-old-versions t
      kept-new-versions 6
      kept-old-versions 2
      version-control t)

;; electric mode
(electric-pair-mode 1)

;; melpa
(require 'package)
(add-to-list 'package-archives
      '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

;; packages

;; vertical minibuffer
(use-package vertico
  :ensure t
  :custom
  (vertico-resize t)
  :init
  (vertico-mode))

;; descriptive minibuffer
(use-package marginalia
  :ensure t
  :init
  (marginalia-mode))

;; magit
(use-package magit
  :ensure t
  :init
  (message "Loading Magit!")
  :config
  (message "Loaded Magit!")
  :bind (("C-x g" . magit-status)
	 ("C-x C-g" . magit-status)))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages '(use-package marginalia vertico magit moe-theme)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
