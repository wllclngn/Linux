;;; mondo2k-theme.el // mondo2k (v1.0), a scifi theme for GNU Emacs
;; Copyright 2017: willsi (https://github.com/wllclngn/GNUmacs-Themes/blob/master/mondo2k-theme.el)
;; Copyright 2012-2015: Nicholas M. Van Horn (https://github.com/n3mo/cyberpunk-theme.el)

;; QUOTE:
;; "Things aren't different. Things are things," 'Neuromancer,' William Gibson.

;; STATEMENT:
;; mondo2k theme is a fork of Nicholas M. Van Horn's Cyberpunk Theme.
;; As with the original, mondo2k is designed for use with deftheme in
;; iterations of GNU Emacs 24.1+. This theme, specifically, is a fork
;; which aims to update Cyberpunk's colors on a color-by-color basis.

;; GNU GENERAL PUBLIC LICENSE:
;; This file is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation; either version 2, or (at your option)
;; any later version.
;;
;; This file is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
;; GNU General Public License for more details.
;;
;; You should have received a copy of the GNU General Public License
;; along with GNU Emacs; see the file COPYING.  If not, write to
;; the Free Software Foundation, Inc., 59 Temple Place - Suite 330,
;; Boston, MA 02111-1307, USA.

(deftheme mondo2k "mondo2k, a scifi theme for GNU Emacs")

(defcustom mondo2k-transparent-background nil
  "Make transparent background in terminal. (Workaround)")
(let ((class '((class color) (min-colors 32)))
      ;; mondo2k palette
      (mondo2k-fg "#A9D3E9") ;; CURSOR RiiiCK'S HAIR GREY
      (mondo2k-red "#EA1717") ;; TRUE
      (mondo2k-pink "#E929D2") ;; TRUE
      (mondo2k-pink-2 "#DD0030") ;; DARK
      (mondo2k-purple "#6914B9") ;; TRUE // 6000BA
      (mondo2k-orange "#FFA561") ;; YABBA-DABBA-DOO-ORANGE-LAZARUS // #FF8C00
      (mondo2k-yellow "#FFD800") ;; GOLDEN
      (mondo2k-yellow-2 "#FBDE2D") ;; RICH
      (mondo2k-yellow-3 "#C8E63A") ;; LITE
      (mondo2k-green "#006400") ;; TRUE
      (mondo2k-green-2 "#2FFFA5") ;; TRON TERM'
      (mondo2k-green-3 "#61CE3C") ;; OOZE'S SECRET
      (mondo2k-green-4 "#22FF71") ;; RADIOACTIVITY
      (mondo2k-green-5 "#009B96") ;; KILBORN LATE
      (mondo2k-green-6 "#00D2BA") ;; DARK OLD TERM' II
      (mondo2k-blue "#217CFA") ;; TEXT TRUE
      (mondo2k-blue-2 "#00CDF0") ;; LITE // #326EFF
      (mondo2k-blue-3 "#06FFF0") ;; BRIGHT OLD TERM' I
      (mondo2k-magenta "#dc8cc3") ;; TRUE
      (mondo2k-gray "#242424") ;; DARK I
      (mondo2k-gray-2 "#E7E7E7") ;; LITE I
      (mondo2k-gray-3 "#727272") ;; COMMENT GRAY
      (mondo2k-gray-4 "#999999") ;; LITE II
      (mondo2k-gray-5 "#A7A7A7") ;; SELECTION
      (mondo2k-gray-6 "#080808") ;; BACKGROUND DARK II
      (mondo2k-gray-7 "#181818") ;; FORE' MODELINE DARK III
      (mondo2k-gray-8 "#282828") ;; DARK IV
      (mondo2k-white-1 "#FFFFFF"))
  
 (custom-theme-set-faces
   'mondo2k
   '(button ((t (:underline t))))
   `(link ((,class (:foreground ,mondo2k-yellow :underline t :weight bold))))
   `(link-visited ((,class (:foreground ,mondo2k-yellow-3 :underline t :weight normal))))
   `(blue ((,class (:foreground ,mondo2k-blue))))
   `(bold ((,class (:bold t))))
   `(border-glyph ((,class (nil))))
   `(buffers-tab ((,class (:background ,mondo2k-gray-6 :foreground ,mondo2k-white-1))))

   ;;; basic coloring
   `(default ((,class (:foreground ,mondo2k-gray-2 :background ,mondo2k-gray-6))))
   `(cursor ((,class (:background ,mondo2k-fg))))
   `(escape-glyph-face ((,class (:foreground ,mondo2k-red))))
   ;; `(fringe ((,class (:foreground ,mondo2k-fg :background ,mondo2k-gray-8))))
   `(header-line ((,class (:foreground ,mondo2k-yellow
                                       :background ,mondo2k-gray-8
                                       :box (:line-width -1 :style released-button)))))
   `(highlight ((,class (:background ,mondo2k-gray-4))))

   ;;; compilation
   `(compilation-column-face ((,class (:foreground ,mondo2k-yellow))))
   `(compilation-enter-directory-face ((,class (:foreground ,mondo2k-green))))
   `(compilation-error-face ((,class (:foreground ,mondo2k-pink-2 :weight bold :underline t))))
   `(compilation-face ((,class (:foreground ,mondo2k-fg))))
   `(compilation-info-face ((,class (:foreground ,mondo2k-blue))))
   `(compilation-info ((,class (:foreground ,mondo2k-green-6 :underline t))))
   `(compilation-leave-directory-face ((,class (:foreground ,mondo2k-green))))
   `(compilation-line-face ((,class (:foreground ,mondo2k-yellow))))
   `(compilation-line-number ((,class (:foreground ,mondo2k-yellow))))
   `(compilation-message-face ((,class (:foreground ,mondo2k-blue))))
   `(compilation-warning-face ((,class (:foreground ,mondo2k-yellow-2 :weight bold :underline t))))

   ;;; grep
   `(grep-context-face ((,class (:foreground ,mondo2k-gray-6 :background ,mondo2k-pink))))
   `(grep-error-face ((,class (:foreground ,mondo2k-red :weight bold :underline t))))
   `(grep-hit-face ((,class (:foreground ,mondo2k-gray-6 :background ,mondo2k-red))))
   `(grep-match-face ((,class (:foreground ,mondo2k-gray-6 :background ,mondo2k-pink))))
   `(match ((,class (:background ,mondo2k-gray-6 :foreground ,mondo2k-pink))))


   ;;; multiple-cursors
   `(mc/cursor-face ((,class (:inverse-video nil, :background ,mondo2k-pink :foreground ,mondo2k-gray-6))))

   ;; faces used by isearch
   `(isearch ((,class (:foreground ,mondo2k-gray-6 :background ,mondo2k-pink))))
   `(isearch-fail ((,class (:background ,mondo2k-pink-2))))
   
   `(lazy-highlight ((,class (:foreground ,mondo2k-gray-6 :background ,mondo2k-yellow))))
   `(query-replace ((,class (:background ,mondo2k-gray-4))))
   `(Highline-face ((,class (:background ,mondo2k-green-5))))
   `(left-margin ((,class (nil))))
   `(toolbar ((,class (nil))))
   `(text-cursor ((,class (:background ,mondo2k-yellow :foreground ,mondo2k-gray-6))))

   `(menu ((,class (:foreground ,mondo2k-fg :background ,mondo2k-gray-7))))
   `(minibuffer-prompt ((,class (:foreground ,mondo2k-green-2 :background ,mondo2k-gray-6))))
   ;;; mode-line
   `(mode-line
     ((,class (:foreground ,mondo2k-gray-7
                           :background ,mondo2k-gray-2
                           :box (:line-width -1 :color ,mondo2k-gray-2)))))
   ;; `(mode-line-buffer-id ((,class (:foreground ,mondo2k-yellow :weight bold))))
   `(mode-line-inactive
     ((,class (:foreground ,mondo2k-gray-6
                           :background ,mondo2k-gray-3
                           :box (:line-width -1 :color ,mondo2k-gray-2)))))
   `(region ((,class (:background ,mondo2k-gray-5))))
   `(secondary-selection ((,class (:background ,mondo2k-gray-8))))
   `(trailing-whitespace ((,class (:background ,mondo2k-red))))
   `(vertical-border ((,class (:foreground ,mondo2k-gray-4 :background ,mondo2k-gray-6))))

   ;;; font lock
   `(font-lock-builtin-face ((,class (:foreground ,mondo2k-blue))))
   `(font-lock-comment-face ((,class (:foreground ,mondo2k-gray-3 :italic t))))
   ;; `(font-lock-comment-delimiter-face ((,class (:foreground ,mondo2k-green)))) 
   `(font-lock-constant-face ((,class (:foreground ,mondo2k-blue-2))))
   ;; `(font-lock-doc-face ((,class (:foreground ,mondo2k-green-2))))
   `(font-lock-doc-face ((,class (:foreground ,mondo2k-yellow-2))))
   `(font-lock-function-name-face ((,class (:foreground ,mondo2k-pink))))
   `(font-lock-keyword-face ((,class (:foreground ,mondo2k-blue))))
   ;; `(font-lock-negation-char-face ((,class (:foreground ,mondo2k-fg))))
   `(font-lock-preprocessor-face ((,class (:foreground ,mondo2k-gray-4))))
   `(font-lock-string-face ((,class (:foreground ,mondo2k-green-2))))
   `(font-lock-type-face ((,class (:foreground ,mondo2k-green-6))))
   `(font-lock-variable-name-face ((,class (:foreground ,mondo2k-pink))))
   `(font-lock-warning-face ((,class (:foreground ,mondo2k-red))))
   `(font-lock-reference-face ((,class (:foreground ,mondo2k-gray-2))))
   `(font-lock-regexp-grouping-backslash ((,class (:foreground ,mondo2k-yellow-3))))
   `(font-lock-regexp-grouping-construct ((,class (:foreground ,mondo2k-red))))

   `(c-annotation-face ((,class (:inherit font-lock-constant-face))))

   `(gui-element ((,class (:background ,mondo2k-gray-4 :foreground ,mondo2k-blue-2))))

   ;;; newsticker
   ;; These are currently placeholders that probably look terrible.
   ;; Someone who uses newsticker is welcome to change these
   `(newsticker-date-face ((,class (:foreground ,mondo2k-fg))))
   `(newsticker-default-face ((,class (:foreground ,mondo2k-fg))))
   `(newsticker-enclosure-face ((,class (:foreground ,mondo2k-green-6))))
   `(newsticker-extra-face ((,class (:foreground ,mondo2k-gray-8 :height 0.8))))
   `(newsticker-feed-face ((,class (:foreground ,mondo2k-fg))))
   `(newsticker-immortal-item-face ((,class (:foreground ,mondo2k-green))))
   `(newsticker-new-item-face ((,class (:foreground ,mondo2k-blue))))
   `(newsticker-obsolete-item-face ((,class (:foreground ,mondo2k-red))))
   `(newsticker-old-item-face ((,class (:foreground ,mondo2k-gray-8))))
   `(newsticker-statistics-face ((,class (:foreground ,mondo2k-fg))))
   `(newsticker-treeview-face ((,class (:foreground ,mondo2k-fg))))
   `(newsticker-treeview-immortal-face ((,class (:foreground ,mondo2k-green))))
   `(newsticker-treeview-listwindow-face ((,class (:foreground ,mondo2k-fg))))
   `(newsticker-treeview-new-face ((,class (:foreground ,mondo2k-blue :weight bold))))
   `(newsticker-treeview-obsolete-face ((,class (:foreground ,mondo2k-red))))
   `(newsticker-treeview-old-face ((,class (:foreground ,mondo2k-gray-8))))
   `(newsticker-treeview-selection-face ((,class (:foreground ,mondo2k-yellow))))

   ;;; external

   ;; full-ack
   `(ack-separator ((,class (:foreground ,mondo2k-fg))))
   `(ack-file ((,class (:foreground ,mondo2k-blue))))
   `(ack-line ((,class (:foreground ,mondo2k-yellow))))
   `(ack-match ((,class (:foreground ,mondo2k-orange :background ,mondo2k-gray-8 :weigth bold))))

   ;; auctex
   `(font-latex-bold ((,class (:inherit bold))))
   `(font-latex-warning ((,class (:inherit font-lock-warning))))
   `(font-latex-sedate ((,class (:foreground ,mondo2k-yellow :weight bold))))
   `(font-latex-string ((,class (:foreground ,mondo2k-green))))
   `(font-latex-title-4 ((,class (:inherit variable-pitch :weight bold))))
   `(font-latex-sectioning-0 ((,class (:foreground ,mondo2k-blue :background ,mondo2k-gray-6 :scale 1.5))))
   `(font-latex-sectioning-1 ((,class (:foreground ,mondo2k-blue :background ,mondo2k-gray-6 :scale 1.5))))

   ;; auto-complete
   `(ac-completion-face ((,class (:background ,mondo2k-gray-3 :underline t))))
   `(ac-candidate-face ((,class (:background ,mondo2k-gray-4 :foreground ,mondo2k-gray-6))))
   `(ac-selection-face ((,class (:background ,mondo2k-pink :foreground ,mondo2k-gray-6))))
   `(popup-tip-face ((,class (:background ,mondo2k-gray-4 :foreground ,mondo2k-white-1))))
   `(popup-scroll-bar-foreground-face ((,class (:background ,mondo2k-gray-6))))
   `(popup-scroll-bar-background-face ((,class (:background ,mondo2k-gray-4))))
   `(popup-isearch-match ((,class (:background ,mondo2k-gray-6 :foreground ,mondo2k-pink))))

   `(window-number-face ((,class (:background ,mondo2k-gray-2 :foreground ,mondo2k-blue))))

   ;; company-mode
   `(company-tooltip ((,class (:background ,mondo2k-gray-3 :foreground ,mondo2k-yellow))))
   `(company-tooltip-common ((,class (:inherit company-tooltip :foreground ,mondo2k-blue))))
   `(company-tooltip-common-selection ((,class (:inherit company-tooltip-selection :foreground ,mondo2k-blue))))
   `(company-tooltip-selection ((,class (:foreground ,mondo2k-gray-6 :background ,mondo2k-pink))))
   `(company-tooltip-annotation ((,class (:inherit company-tooltip :foreground ,mondo2k-gray-6))))
   `(company-scrollbar-fg ((,class (:background ,mondo2k-gray-6))))
   `(company-scrollbar-bg ((,class (:background ,mondo2k-gray-4))))
   `(company-preview ((,class (:foreground ,mondo2k-gray-2 :background ,mondo2k-pink))))
   `(company-preview-common ((,class (:foreground ,mondo2k-gray-2 :background ,mondo2k-pink))))
   
   ;; diff
   `(diff-added ((,class (:foreground ,mondo2k-green))))
   `(diff-changed ((,class (:foreground ,mondo2k-yellow))))
   `(diff-removed ((,class (:foreground ,mondo2k-red))))
   `(diff-header ((,class (:background ,mondo2k-gray-8))))
   `(diff-file-header ((,class (:background ,mondo2k-gray-8 :foreground ,mondo2k-fg :bold t))))

   ;; ediff
   `(ediff-current-diff-Ancestor ((,class (:foreground ,mondo2k-fg :background ,mondo2k-pink))))
   `(ediff-current-diff-A ((,class (:foreground ,mondo2k-fg :background ,mondo2k-gray-8))))
   `(ediff-current-diff-B ((,class (:foreground ,mondo2k-fg :background ,mondo2k-gray-8))))
   `(ediff-current-diff-C ((,class (:foreground ,mondo2k-fg :background ,mondo2k-gray-8))))
   `(ediff-even-diff-Ancestor ((,class (:foreground ,mondo2k-white-1 :background ,mondo2k-gray-8))))
   `(ediff-even-diff-A ((,class (:foreground ,mondo2k-white-1 :background ,mondo2k-gray-8))))
   `(ediff-even-diff-B ((,class (:foreground ,mondo2k-white-1 :background ,mondo2k-gray-8))))
   `(ediff-even-diff-C ((,class (:foreground ,mondo2k-white-1 :background ,mondo2k-gray-8))))
   `(ediff-fine-diff-Ancestor ((,class (:foreground ,mondo2k-gray-6 :background ,mondo2k-pink))))
   `(ediff-fine-diff-A ((,class (:foreground ,mondo2k-gray-6 :background ,mondo2k-blue))))
   `(ediff-fine-diff-B ((,class (:foreground ,mondo2k-gray-6 :background ,mondo2k-blue))))
   `(ediff-fine-diff-C ((,class (:foreground ,mondo2k-gray-6 :background ,mondo2k-blue))))
   `(ediff-odd-diff-Ancestor ((,class (:foreground ,mondo2k-gray-6 :background ,mondo2k-gray-3))))
   `(ediff-odd-diff-A ((,class (:foreground ,mondo2k-gray-6 :background ,mondo2k-gray-4))))
   `(ediff-odd-diff-B ((,class (:foreground ,mondo2k-gray-6 :background ,mondo2k-gray-4))))
   `(ediff-odd-diff-C ((,class (:foreground ,mondo2k-gray-6 :background ,mondo2k-gray-2))))

   ;; ert
   `(ert-test-result-expected ((,class (:foreground ,mondo2k-green-6 :background ,mondo2k-gray-7))))
   `(ert-test-result-unexpected ((,class (:foreground ,mondo2k-red :background ,mondo2k-gray-7))))

   ;; eshell
   `(eshell-prompt ((,class (:foreground ,mondo2k-blue :weight bold))))
   `(eshell-ls-archive ((,class (:foreground ,mondo2k-magenta :weight bold))))
   `(eshell-ls-backup ((,class (:inherit font-lock-comment))))
   `(eshell-ls-clutter ((,class (:inherit font-lock-comment))))
   `(eshell-ls-directory ((,class (:foreground ,mondo2k-blue :weight bold))))
   `(eshell-ls-executable ((,class (:foreground ,mondo2k-red :weight bold))))
   `(eshell-ls-unreadable ((,class (:foreground ,mondo2k-fg))))
   `(eshell-ls-missing ((,class (:inherit font-lock-warning))))
   `(eshell-ls-product ((,class (:inherit font-lock-doc))))
   `(eshell-ls-special ((,class (:foreground ,mondo2k-yellow :weight bold))))
   `(eshell-ls-symlink ((,class (:foreground ,mondo2k-blue-2 :weight bold))))

   ;; flymake
   `(flymake-errline ((,class (:foreground ,mondo2k-pink-2 :weight bold :underline t))))
   `(flymake-warnline ((,class (:foreground ,mondo2k-yellow-2 :weight bold :underline t))))

   ;; flyspell
   `(flyspell-duplicate ((,class (:foreground ,mondo2k-yellow-2 :weight bold :underline t))))
   `(flyspell-incorrect ((,class (:foreground ,mondo2k-gray-5 :weight bold :underline t))))

   ;; erc
   `(erc-action-face ((,class (:inherit erc-default-face))))
   `(erc-bold-face ((,class (:weight bold))))
   `(erc-current-nick-face ((,class (:foreground ,mondo2k-blue :weight bold))))
   `(erc-dangerous-host-face ((,class (:inherit font-lock-warning))))
   `(erc-default-face ((,class (:foreground ,mondo2k-fg))))
   `(erc-direct-msg-face ((,class (:inherit erc-default))))
   `(erc-error-face ((,class (:inherit font-lock-warning))))
   `(erc-fool-face ((,class (:inherit erc-default))))
   `(erc-highlight-face ((,class (:inherit hover-highlight))))
   `(erc-input-face ((,class (:foreground ,mondo2k-yellow))))
   `(erc-keyword-face ((,class (:foreground ,mondo2k-blue :weight bold))))
   `(erc-nick-default-face ((,class (:foreground ,mondo2k-yellow :weight bold))))
   `(erc-my-nick-face ((,class (:foreground ,mondo2k-red :weigth bold))))
   `(erc-nick-msg-face ((,class (:inherit erc-default))))
   `(erc-notice-face ((,class (:foreground ,mondo2k-green))))
   `(erc-pal-face ((,class (:foreground ,mondo2k-orange :weight bold))))
   `(erc-prompt-face ((,class (:foreground ,mondo2k-orange :background ,mondo2k-gray-7 :weight bold))))
   `(erc-timestamp-face ((,class (:foreground ,mondo2k-green-2))))
   `(erc-underline-face ((t (:underline t))))

   ;; gnus
   `(gnus-group-mail-1 ((,class (:bold t :inherit gnus-group-mail-1-empty))))
   `(gnus-group-mail-1-empty ((,class (:inherit gnus-group-news-1-empty))))
   `(gnus-group-mail-2 ((,class (:bold t :inherit gnus-group-mail-2-empty))))
   `(gnus-group-mail-2-empty ((,class (:inherit gnus-group-news-2-empty))))
   `(gnus-group-mail-3 ((,class (:bold t :inherit gnus-group-mail-3-empty))))
   `(gnus-group-mail-3-empty ((,class (:inherit gnus-group-news-3-empty))))
   `(gnus-group-mail-4 ((,class (:bold t :inherit gnus-group-mail-4-empty))))
   `(gnus-group-mail-4-empty ((,class (:inherit gnus-group-news-4-empty))))
   `(gnus-group-mail-5 ((,class (:bold t :inherit gnus-group-mail-5-empty))))
   `(gnus-group-mail-5-empty ((,class (:inherit gnus-group-news-5-empty))))
   `(gnus-group-mail-6 ((,class (:bold t :inherit gnus-group-mail-6-empty))))
   `(gnus-group-mail-6-empty ((,class (:inherit gnus-group-news-6-empty))))
   `(gnus-group-mail-low ((,class (:bold t :inherit gnus-group-mail-low-empty))))
   `(gnus-group-mail-low-empty ((,class (:inherit gnus-group-news-low-empty))))
   `(gnus-group-news-1 ((,class (:bold t :inherit gnus-group-news-1-empty))))
   `(gnus-group-news-2 ((,class (:bold t :inherit gnus-group-news-2-empty))))
   `(gnus-group-news-3 ((,class (:bold t :inherit gnus-group-news-3-empty))))
   `(gnus-group-news-4 ((,class (:bold t :inherit gnus-group-news-4-empty))))
   `(gnus-group-news-5 ((,class (:bold t :inherit gnus-group-news-5-empty))))
   `(gnus-group-news-6 ((,class (:bold t :inherit gnus-group-news-6-empty))))
   `(gnus-group-news-low ((,class (:bold t :inherit gnus-group-news-low-empty))))
   `(gnus-header-content ((,class (:inherit message-header-other))))
   `(gnus-header-from ((,class (:inherit message-header-from))))
   `(gnus-header-name ((,class (:inherit message-header-name))))
   `(gnus-header-newsgroups ((,class (:inherit message-header-other))))
   `(gnus-header-subject ((,class (:inherit message-header-subject))))
   `(gnus-summary-cancelled ((,class (:foreground ,mondo2k-orange))))
   `(gnus-summary-high-ancient ((,class (:foreground ,mondo2k-blue))))
   `(gnus-summary-high-read ((,class (:foreground ,mondo2k-green :weight bold))))
   `(gnus-summary-high-ticked ((,class (:foreground ,mondo2k-orange :weight bold))))
   `(gnus-summary-high-unread ((,class (:foreground ,mondo2k-fg :weight bold))))
   `(gnus-summary-low-ancient ((,class (:foreground ,mondo2k-blue))))
   `(gnus-summary-low-read ((t (:foreground ,mondo2k-green))))
   `(gnus-summary-low-ticked ((,class (:foreground ,mondo2k-orange :weight bold))))
   `(gnus-summary-low-unread ((,class (:foreground ,mondo2k-fg))))
   `(gnus-summary-normal-ancient ((,class (:foreground ,mondo2k-blue))))
   `(gnus-summary-normal-read ((,class (:foreground ,mondo2k-green))))
   `(gnus-summary-normal-ticked ((,class (:foreground ,mondo2k-orange :weight bold))))
   `(gnus-summary-normal-unread ((,class (:foreground ,mondo2k-fg))))
   `(gnus-summary-selected ((,class (:foreground ,mondo2k-yellow :weight bold))))
   `(gnus-cite-1 ((,class (:foreground ,mondo2k-yellow-3))))
   `(gnus-cite-10 ((,class (:foreground ,mondo2k-yellow-2))))
   `(gnus-cite-11 ((,class (:foreground ,mondo2k-yellow))))
   `(gnus-cite-2 ((,class (:foreground ,mondo2k-blue-2))))
   `(gnus-cite-3 ((,class (:foreground ,mondo2k-blue-2))))
   `(gnus-cite-4 ((,class (:foreground ,mondo2k-green-3))))
   `(gnus-cite-5 ((,class (:foreground ,mondo2k-green-2))))
   `(gnus-cite-6 ((,class (:foreground ,mondo2k-green))))
   `(gnus-cite-7 ((,class (:foreground ,mondo2k-red))))
   `(gnus-cite-8 ((,class (:foreground ,mondo2k-pink-2))))
   `(gnus-cite-9 ((,class (:foreground ,mondo2k-pink-2))))
   `(gnus-group-news-1-empty ((,class (:foreground ,mondo2k-yellow))))
   `(gnus-group-news-2-empty ((,class (:foreground ,mondo2k-green-6))))
   `(gnus-group-news-3-empty ((,class (:foreground ,mondo2k-green-2))))
   `(gnus-group-news-4-empty ((,class (:foreground ,mondo2k-blue-2))))
   `(gnus-group-news-5-empty ((,class (:foreground ,mondo2k-blue-2))))
   `(gnus-group-news-6-empty ((,class (:foreground ,mondo2k-gray-8))))
   `(gnus-group-news-low-empty ((,class (:foreground ,mondo2k-gray-8))))
   `(gnus-signature ((,class (:foreground ,mondo2k-yellow))))
   `(gnus-x ((,class (:background ,mondo2k-fg :foreground ,mondo2k-gray-7))))

   ;; helm
   `(helm-header
     ((,class (:foreground ,mondo2k-green
                           :background ,mondo2k-gray-7
                           :underline nil
                           :box nil))))
   `(helm-source-header
     ((,class (:foreground ,mondo2k-yellow
                           :background ,mondo2k-gray-8
                           :underline nil
                           :weight bold
                           :box (:line-width -1 :style released-button)))))
   `(helm-selection ((,class (:background ,mondo2k-gray-8 :underline nil))))
   `(helm-selection-line ((,class (:background ,mondo2k-gray-8))))
   `(helm-visible-mark ((,class (:foreground ,mondo2k-gray-7 :background ,mondo2k-yellow-3))))
   `(helm-candidate-number ((,class (:foreground ,mondo2k-green-6 :background ,mondo2k-gray-8))))

   ;; hl-line-mode
   `(hl-sexp-face ((,class (:background ,mondo2k-gray-4))))
   `(hl-line-face ((,class (:background ,mondo2k-gray-4))))

   ;; ido-mode
   `(ido-first-match ((,class (:foreground ,mondo2k-pink :background ,mondo2k-gray-6))))
   `(ido-only-match ((,class (:foreground ,mondo2k-pink :background ,mondo2k-gray-6))))
   `(ido-subdir ((,class (:foreground ,mondo2k-gray-4 :backgroun ,mondo2k-gray-6))))
   `(ido-indicator ((,class (:foreground ,mondo2k-gray-6 :background ,mondo2k-pink))))

   ;; js2-mode
   `(js2-warning-face ((,class (:underline ,mondo2k-orange))))
   `(js2-error-face ((,class (:foreground ,mondo2k-red :weight bold))))
   `(js2-jsdoc-tag-face ((,class (:foreground ,mondo2k-green-5))))
   `(js2-jsdoc-type-face ((,class (:foreground ,mondo2k-green-3))))
   `(js2-jsdoc-value-face ((,class (:foreground ,mondo2k-green-6))))
   `(js2-function-param-face ((,class (:foreground ,mondo2k-green-6))))
   `(js2-external-variable-face ((,class (:foreground ,mondo2k-orange))))

   ;; jabber-mode
   `(jabber-roster-user-away ((,class (:foreground ,mondo2k-green-3))))
   `(jabber-roster-user-online ((,class (:foreground ,mondo2k-blue-2))))
   `(jabber-roster-user-dnd ((,class (:foreground ,mondo2k-red))))
   `(jabber-rare-time-face ((,class (:foreground ,mondo2k-green-2))))
   `(jabber-chat-prompt-local ((,class (:foreground ,mondo2k-blue-2))))
   `(jabber-chat-prompt-foreign ((,class (:foreground ,mondo2k-red))))
   `(jabber-activity-face((,class (:foreground ,mondo2k-red))))
   `(jabber-activity-personal-face ((,class (:foreground ,mondo2k-blue))))
   `(jabber-title-small ((,class (:height 1.1 :weight bold))))
   `(jabber-title-medium ((,class (:height 1.2 :weight bold))))
   `(jabber-title-large ((,class (:height 1.3 :weight bold))))

   ;; linum-mode
   `(linum ((,class (:foreground ,mondo2k-green-3 :background ,mondo2k-gray-7))))

   ;;linum-relative
   `(linum-relative-current-face ((,class (:inherit linum :foreground ,mondo2k-white-1 :weight bold))))

   ;; magit
   ;; magit headings and diffs
   `(magit-section-highlight ((t (:background ,mondo2k-gray-8))))
   `(magit-section-heading ((t (:foreground ,mondo2k-blue :weight bold))))
   `(magit-section-heading-selection ((t (:foreground ,mondo2k-red :weight bold))))
   `(magit-diff-file-heading           ((t (:weight bold))))
   `(magit-diff-file-heading-highlight ((t (:background ,mondo2k-gray-8  :weight bold))))
   `(magit-diff-file-heading-selection ((t (:background ,mondo2k-gray-8
                                            :foreground ,mondo2k-blue-2 :weight bold))))
   `(magit-diff-hunk-heading           ((t (:background ,mondo2k-gray-7))))
   `(magit-diff-hunk-heading-highlight ((t (:background ,mondo2k-gray-8))))
   `(magit-diff-hunk-heading-selection ((t (:background ,mondo2k-gray-8
                                            :foreground ,mondo2k-blue-2))))
   `(magit-diff-lines-heading          ((t (:background ,mondo2k-blue-2
                                            :foreground ,mondo2k-gray-8))))
   `(magit-diff-added                  ((t (:foreground ,mondo2k-blue))))
   `(magit-diff-added-highlight        ((t (:inherit magit-diff-added :weight bold))))
   `(magit-diff-removed                ((t (:foreground ,mondo2k-magenta))))
   `(magit-diff-removed-highlight      ((t (:inherit magit-diff-removed :weight bold))))
   `(magit-diff-context                ((t (:foreground ,mondo2k-gray-2))))
   `(magit-diff-context-highlight      ((t (:inherit magit-diff-context :weight bold))))
   `(magit-diffstat-added   ((t (:inherit magit-diff-added))))
   `(magit-diffstat-removed ((t (:inherit magit-diff-removed))))
   ;; magit popup
   `(magit-popup-heading             ((t (:foreground ,mondo2k-pink  :weight bold))))
   `(magit-popup-key                 ((t (:foreground ,mondo2k-blue :weight bold))))
   `(magit-popup-argument            ((t (:foreground ,mondo2k-blue-2   :weight bold))))
   `(magit-popup-disabled-argument   ((t (:foreground ,mondo2k-fg    :weight normal))))
   `(magit-popup-option-value        ((t (:foreground ,mondo2k-blue-2  :weight bold))))
   ;; ;; magit process
   `(magit-process-ok    ((t (:foreground ,mondo2k-green-2  :weight bold))))
   `(magit-process-ng    ((t (:foreground ,mondo2k-pink-2    :weight bold))))
   ;; ;; magit log
   `(magit-log-author    ((t (:foreground ,mondo2k-pink))))
   `(magit-log-date      ((t (:foreground ,mondo2k-gray-2))))
   `(magit-log-graph     ((t (:foreground ,mondo2k-white-1))))
   ;; ;; magit sequence
   `(magit-sequence-pick ((t (:foreground ,mondo2k-magenta))))
   `(magit-sequence-stop ((t (:foreground ,mondo2k-green-2))))
   `(magit-sequence-part ((t (:foreground ,mondo2k-pink))))
   `(magit-sequence-head ((t (:foreground ,mondo2k-blue))))
   `(magit-sequence-drop ((t (:foreground ,mondo2k-orange))))
   `(magit-sequence-done ((t (:foreground ,mondo2k-gray-3))))
   `(magit-sequence-onto ((t (:foreground ,mondo2k-gray-3))))
   ;; ;; magit bisect
   `(magit-bisect-good ((t (:foreground ,mondo2k-green-2))))
   `(magit-bisect-skip ((t (:foreground ,mondo2k-pink))))
   `(magit-bisect-bad  ((t (:foreground ,mondo2k-orange))))
   ;; ;; magit blame
   `(magit-blame-heading ((t (:background ,mondo2k-gray-8 :foreground ,mondo2k-green))))
   `(magit-blame-hash    ((t (:background ,mondo2k-gray-8 :foreground ,mondo2k-green))))
   `(magit-blame-name    ((t (:background ,mondo2k-gray-8 :foreground ,mondo2k-pink))))
   `(magit-blame-date    ((t (:background ,mondo2k-gray-8 :foreground ,mondo2k-yellow-2))))
   `(magit-blame-summary ((t (:background ,mondo2k-gray-8 :foreground ,mondo2k-blue-2
                                          :weight bold))))
   ;; ;; magit references etc
   `(magit-dimmed         ((t (:foreground ,mondo2k-gray-8))))
   `(magit-hash           ((t (:foreground ,mondo2k-gray-8))))
   `(magit-tag            ((t (:foreground ,mondo2k-pink :weight bold))))
   `(magit-branch-remote  ((t (:foreground ,mondo2k-green-3  :weight bold))))
   `(magit-branch-local   ((t (:foreground ,mondo2k-blue   :weight bold))))
   `(magit-branch-current ((t (:foreground ,mondo2k-green   :weight bold :box t))))
   `(magit-head           ((t (:foreground ,mondo2k-blue   :weight bold))))
   `(magit-refname        ((t (:background ,mondo2k-gray-8 :foreground ,mondo2k-fg :weight bold))))
   `(magit-refname-stash  ((t (:background ,mondo2k-gray-8 :foreground ,mondo2k-fg :weight bold))))
   `(magit-refname-wip    ((t (:background ,mondo2k-gray-8 :foreground ,mondo2k-fg :weight bold))))
   `(magit-signature-good      ((t (:foreground ,mondo2k-green))))
   `(magit-signature-bad       ((t (:foreground ,mondo2k-red))))
   `(magit-signature-untrusted ((t (:foreground ,mondo2k-yellow))))
   `(magit-cherry-unmatched    ((t (:foreground ,mondo2k-blue-2))))
   `(magit-cherry-equivalent   ((t (:foreground ,mondo2k-magenta))))
   `(magit-reflog-commit       ((t (:foreground ,mondo2k-green))))
   `(magit-reflog-amend        ((t (:foreground ,mondo2k-magenta))))
   `(magit-reflog-merge        ((t (:foreground ,mondo2k-green))))
   `(magit-reflog-checkout     ((t (:foreground ,mondo2k-blue))))
   `(magit-reflog-reset        ((t (:foreground ,mondo2k-red))))
   `(magit-reflog-rebase       ((t (:foreground ,mondo2k-magenta))))
   `(magit-reflog-cherry-pick  ((t (:foreground ,mondo2k-green))))
   `(magit-reflog-remote       ((t (:foreground ,mondo2k-blue-2))))
   `(magit-reflog-other        ((t (:foreground ,mondo2k-blue-2))))
   
   `(eval-sexp-fu-flash ((,class (:background ,mondo2k-gray-2 :foreground ,mondo2k-pink-2))))

   ;; message-mode
   `(message-cited-text ((,class (:inherit font-lock-comment))))
   `(message-header-name ((,class (:foreground ,mondo2k-blue))))
   `(message-header-other ((,class (:foreground ,mondo2k-green))))
   `(message-header-to ((,class (:foreground ,mondo2k-pink :weight bold))))
   `(message-header-from ((,class (:foreground ,mondo2k-yellow :weight bold))))
   `(message-header-cc ((,class (:foreground ,mondo2k-yellow :weight bold))))
   `(message-header-newsgroups ((,class (:foreground ,mondo2k-yellow :weight bold))))
   `(message-header-subject ((,class (:foreground ,mondo2k-orange :weight bold))))
   `(message-header-xheader ((,class (:foreground ,mondo2k-green))))
   `(message-mml ((,class (:foreground ,mondo2k-yellow :weight bold))))
   `(message-separator ((,class (:inherit font-lock-comment))))

   ;; mew
   `(mew-face-header-subject ((,class (:foreground ,mondo2k-orange))))
   `(mew-face-header-from ((,class (:foreground ,mondo2k-yellow))))
   `(mew-face-header-date ((,class (:foreground ,mondo2k-green))))
   `(mew-face-header-to ((,class (:foreground ,mondo2k-red))))
   `(mew-face-header-key ((,class (:foreground ,mondo2k-green))))
   `(mew-face-header-private ((,class (:foreground ,mondo2k-green))))
   `(mew-face-header-important ((,class (:foreground ,mondo2k-blue))))
   `(mew-face-header-marginal ((,class (:foreground ,mondo2k-fg :weight bold))))
   `(mew-face-header-warning ((,class (:foreground ,mondo2k-red))))
   `(mew-face-header-xmew ((,class (:foreground ,mondo2k-green))))
   `(mew-face-header-xmew-bad ((,class (:foreground ,mondo2k-red))))
   `(mew-face-body-url ((,class (:foreground ,mondo2k-orange))))
   `(mew-face-body-comment ((,class (:foreground ,mondo2k-fg :slant italic))))
   `(mew-face-body-cite1 ((,class (:foreground ,mondo2k-green))))
   `(mew-face-body-cite2 ((,class (:foreground ,mondo2k-blue))))
   `(mew-face-body-cite3 ((,class (:foreground ,mondo2k-orange))))
   `(mew-face-body-cite4 ((,class (:foreground ,mondo2k-yellow))))
   `(mew-face-body-cite5 ((,class (:foreground ,mondo2k-red))))
   `(mew-face-mark-review ((,class (:foreground ,mondo2k-blue))))
   `(mew-face-mark-escape ((,class (:foreground ,mondo2k-green))))
   `(mew-face-mark-delete ((,class (:foreground ,mondo2k-red))))
   `(mew-face-mark-unlink ((,class (:foreground ,mondo2k-yellow))))
   `(mew-face-mark-refile ((,class (:foreground ,mondo2k-green))))
   `(mew-face-mark-unread ((,class (:foreground ,mondo2k-pink-2))))
   `(mew-face-eof-message ((,class (:foreground ,mondo2k-green))))
   `(mew-face-eof-part ((,class (:foreground ,mondo2k-yellow))))

   ;; mic-paren
   `(paren-face-match ((,class (:foreground ,mondo2k-blue-2 :background ,mondo2k-gray-7 :weight bold))))
   `(paren-face-mismatch ((,class (:foreground ,mondo2k-gray-7 :background ,mondo2k-magenta :weight bold))))
   `(paren-face-no-match ((,class (:foreground ,mondo2k-gray-7 :background ,mondo2k-red :weight bold))))

   ;; nav
   `(nav-face-heading ((,class (:foreground ,mondo2k-yellow))))
   `(nav-face-button-num ((,class (:foreground ,mondo2k-blue-2))))
   `(nav-face-dir ((,class (:foreground ,mondo2k-green))))
   `(nav-face-hdir ((,class (:foreground ,mondo2k-red))))
   `(nav-face-file ((,class (:foreground ,mondo2k-fg))))
   `(nav-face-hfile ((,class (:foreground ,mondo2k-red))))

   ;; mumamo
   `(mumamo-background-chunk-major ((,class (:background ,mondo2k-gray-6))))
   `(mumamo-background-chunk-submode1 ((,class (:background ,mondo2k-gray-6))))
   `(mumamo-background-chunk-submode2 ((,class (:background ,mondo2k-gray-8))))
   `(mumamo-background-chunk-submode3 ((,class (:background ,mondo2k-gray-8))))
   `(mumamo-background-chunk-submode4 ((,class (:background ,mondo2k-gray-8))))

   ;; org-mode
   `(org-document-title ((,class (:foreground ,mondo2k-blue-2 :background ,mondo2k-gray-6 :weight bold :height 1.5))))
   `(org-document-info ((,class (:foreground ,mondo2k-blue-2 :background ,mondo2k-gray-6 :weight bold))))
   `(org-document-info-keyword ((,class (:foreground ,mondo2k-gray-3 :background ,mondo2k-gray-6))))
   `(org-agenda-date-today
     ((,class (:foreground ,mondo2k-gray-5 :slant italic :weight bold))) t)
   `(org-agenda-structure
     ((,class (:inherit font-lock-comment-face))))
   `(org-archived ((,class (:slant italic))))
   `(org-checkbox ((,class (:background ,mondo2k-gray-3 :foreground ,mondo2k-gray-6
                                   :box (:line-width 1 :style released-button)))))
   `(org-date ((,class (:foreground ,mondo2k-blue-3 :underline t))))
   `(org-done ((,class (:bold t :weight bold :foreground ,mondo2k-green
                              :box (:line-width 1 :style none)))))
   `(org-todo ((,class (:bold t :foreground ,mondo2k-orange :weight bold
                              :box (:line-width 1 :style none)))))
   `(org-level-1 ((,class (:foreground ,mondo2k-pink :height 1.3))))
   `(org-level-2 ((,class (:foreground ,mondo2k-yellow :height 1.2))))
   `(org-level-3 ((,class (:foreground ,mondo2k-blue :height 1.1))))
   `(org-level-4 ((,class (:foreground ,mondo2k-green))))
   `(org-level-5 ((,class (:foreground ,mondo2k-orange))))
   `(org-level-6 ((,class (:foreground ,mondo2k-pink))))
   `(org-level-7 ((,class (:foreground ,mondo2k-green-6))))
   `(org-level-8 ((,class (:foreground ,mondo2k-blue-2))))
   `(org-link ((,class (:foreground ,mondo2k-blue-2 :underline t))))
   `(org-tag ((,class (:bold t :weight bold))))
   `(org-column ((,class (:background ,mondo2k-yellow-3 :foreground ,mondo2k-gray-6))))
   `(org-column-title ((,class (:background ,mondo2k-gray-8 :underline t :weight bold))))
   `(org-block ((,class (:foreground ,mondo2k-fg :background ,mondo2k-gray-8))))
   `(org-block-begin-line 
     ((,class (:foreground "#008ED1" :background ,mondo2k-gray-8))))
   `(org-block-background ((,class (:background ,mondo2k-gray-8))))
   `(org-block-end-line 
     ((,class (:foreground "#008ED1" :background ,mondo2k-gray-8))))

   ;; `(org-deadline-announce ((,class (:foreground ,mondo2k-pink-2))))
   ;; `(org-scheduled ((,class (:foreground ,mondo2k-green-6))))
   ;; `(org-scheduled-previously ((,class (:foreground ,mondo2k-red))))
   ;; `(org-scheduled-today ((,class (:foreground ,mondo2k-blue))))
   ;; `(org-special-keyword ((,class (:foreground ,mondo2k-yellow-2))))
   ;; `(org-table ((,class (:foreground ,mondo2k-green-3))))
   ;; `(org-time-grid ((,class (:foreground ,mondo2k-orange))))
   ;; `(org-upcoming-deadline ((,class (:inherit font-lock-keyword-face))))
   ;; `(org-warning ((,class (:bold t :foreground ,mondo2k-red :weight bold :underline nil))))
   ;; `(org-formula ((,class (:foreground ,mondo2k-yellow-3))))
   ;; `(org-headline-done ((,class (:foreground ,mondo2k-green-6))))
   ;; `(org-hide ((,class (:foreground ,mondo2k-gray-8))))

   ;; outline
   `(outline-8 ((,class (:inherit default))))
   `(outline-7 ((,class (:inherit outline-8 :height 1.0))))
   `(outline-6 ((,class (:inherit outline-7 :height 1.0))))
   `(outline-5 ((,class (:inherit outline-6 :height 1.0))))
   `(outline-4 ((,class (:inherit outline-5 :height 1.0))))
   `(outline-3 ((,class (:inherit outline-4 :height 1.0))))
   `(outline-2 ((,class (:inherit outline-3 :height 1.0))))
   `(outline-1 ((,class (:inherit outline-2 :height 1.0))))

   ;; racket-mode
   `(racket-keyword-argument-face ((t (:inherit font-lock-constant-face))))
   `(racket-selfeval-face ((t (:inherit font-lock-type-face))))

   ;; rainbow-delimiters
   `(rainbow-delimiters-depth-1-face ((,class (:foreground ,mondo2k-pink-2))))
   `(rainbow-delimiters-depth-2-face ((,class (:foreground ,mondo2k-green))))
   `(rainbow-delimiters-depth-3-face ((,class (:foreground ,mondo2k-pink))))
   `(rainbow-delimiters-depth-4-face ((,class (:foreground ,mondo2k-yellow))))
   `(rainbow-delimiters-depth-5-face ((,class (:foreground ,mondo2k-green))))
   `(rainbow-delimiters-depth-6-face ((,class (:foreground ,mondo2k-blue-2))))
   `(rainbow-delimiters-depth-7-face ((,class (:foreground ,mondo2k-orange))))
   `(rainbow-delimiters-depth-8-face ((,class (:foreground ,mondo2k-blue-2))))
   `(rainbow-delimiters-depth-9-face ((,class (:foreground ,mondo2k-gray-2))))
   `(rainbow-delimiters-depth-10-face ((,class (:foreground ,mondo2k-white-1))))
   `(rainbow-delimiters-depth-11-face ((,class (:foreground ,mondo2k-blue))))
   `(rainbow-delimiters-depth-12-face ((,class (:foreground ,mondo2k-red))))

   ;; rpm-mode
   `(rpm-spec-dir-face ((,class (:foreground ,mondo2k-green))))
   `(rpm-spec-doc-face ((,class (:foreground ,mondo2k-green))))
   `(rpm-spec-ghost-face ((,class (:foreground ,mondo2k-red))))
   `(rpm-spec-macro-face ((,class (:foreground ,mondo2k-yellow))))
   `(rpm-spec-obsolete-tag-face ((,class (:foreground ,mondo2k-red))))
   `(rpm-spec-package-face ((,class (:foreground ,mondo2k-red))))
   `(rpm-spec-section-face ((,class (:foreground ,mondo2k-yellow))))
   `(rpm-spec-tag-face ((,class (:foreground ,mondo2k-blue))))
   `(rpm-spec-var-face ((,class (:foreground ,mondo2k-red))))

   ;; rst-mode
   `(rst-level-1-face ((,class (:foreground ,mondo2k-orange))))
   `(rst-level-2-face ((,class (:foreground ,mondo2k-green-2))))
   `(rst-level-3-face ((,class (:foreground ,mondo2k-blue-2))))
   `(rst-level-4-face ((,class (:foreground ,mondo2k-yellow-3))))
   `(rst-level-5-face ((,class (:foreground ,mondo2k-blue-2))))
   `(rst-level-6-face ((,class (:foreground ,mondo2k-green-5))))

   ;; show-paren
   `(show-paren-mismatch ((,class (:foreground ,mondo2k-red :background ,mondo2k-gray-6))))
   `(show-paren-match ((,class (:foreground ,mondo2k-gray-6 :background ,mondo2k-pink))))

   `(naeu-green-face ((,class (:foreground ,mondo2k-green :background ,mondo2k-gray-6))))
   `(naeu-pink-face ((,class (:foreground ,mondo2k-pink :background ,mondo2k-gray-6))))
   `(naeu-blue-face ((,class (:foreground ,mondo2k-blue-2 :background ,mondo2k-gray-6))))
   `(naeu-orange-face ((,class (:foreground ,mondo2k-yellow-2 :background ,mondo2k-gray-6))))
   `(naeu-red-face ((,class (:foreground ,mondo2k-orange :background ,mondo2k-gray-6))))
   `(naeu-grey-face ((,class (:foreground ,mondo2k-gray :background ,mondo2k-gray-6))))

   ;; SLIME
   `(slime-repl-inputed-output-face ((,class (:foreground ,mondo2k-red))))

  ;;; ansi-term
   `(term-color-black ((,class (:foreground ,mondo2k-gray-7
                                            :background ,mondo2k-gray-8))))
   `(term-color-red ((,class (:foreground ,mondo2k-pink-2
                                          :background ,mondo2k-red))))
   `(term-color-green ((,class (:foreground ,mondo2k-green
                                            :background ,mondo2k-green-3))))
   `(term-color-yellow ((,class (:foreground ,mondo2k-orange
                                             :background ,mondo2k-yellow))))
   `(term-color-blue ((,class (:foreground ,mondo2k-blue-2
                                           :background ,mondo2k-blue-2))))
   `(term-color-magenta ((,class (:foreground ,mondo2k-magenta
                                              :background ,mondo2k-red))))
   `(term-color-cyan ((,class (:foreground ,mondo2k-blue-2
                                           :background ,mondo2k-blue))))
   `(term-color-white ((,class (:foreground ,mondo2k-fg
                                            :background ,mondo2k-gray-8))))
   `(term-default-fg-color ((,class (:inherit term-color-white))))
   `(term-default-bg-color ((,class (:inherit term-color-black))))

   ;; volatile-highlights
   `(vhl/default-face ((,class (:background ,mondo2k-gray-4))))

   `(undo-tree-visualizer-active-branch-face ((,class (:foreground ,mondo2k-pink :background ,mondo2k-gray-6))))

   ;; whitespace-mode
   `(whitespace-space ((,class (:background ,mondo2k-gray-7 :foreground ,mondo2k-gray-8))))
   `(whitespace-hspace ((,class (:background ,mondo2k-gray-7 :foreground ,mondo2k-gray-8))))
   `(whitespace-tab ((,class (:background ,mondo2k-gray-7 :foreground ,mondo2k-red))))
   `(whitespace-newline ((,class (:foreground ,mondo2k-gray-8))))
   `(whitespace-trailing ((,class (:foreground ,mondo2k-red :background ,mondo2k-gray-7))))
   `(whitespace-line ((,class (:background ,mondo2k-gray-8 :foreground ,mondo2k-magenta))))
   `(whitespace-space-before-tab ((,class (:background ,mondo2k-orange :foreground ,mondo2k-orange))))
   `(whitespace-indentation ((,class (:background ,mondo2k-yellow :foreground ,mondo2k-red))))
   `(whitespace-empty ((,class (:background ,mondo2k-yellow :foreground ,mondo2k-red))))
   `(whitespace-space-after-tab ((,class (:background ,mondo2k-yellow :foreground ,mondo2k-red))))

   ;; wanderlust
   `(wl-highlight-folder-few-face ((,class (:foreground ,mondo2k-pink-2))))
   `(wl-highlight-folder-many-face ((,class (:foreground ,mondo2k-pink-2))))
   `(wl-highlight-folder-path-face ((,class (:foreground ,mondo2k-orange))))
   `(wl-highlight-folder-unread-face ((,class (:foreground ,mondo2k-blue))))
   `(wl-highlight-folder-zero-face ((,class (:foreground ,mondo2k-fg))))
   `(wl-highlight-folder-unknown-face ((,class (:foreground ,mondo2k-blue))))
   `(wl-highlight-message-citation-header ((,class (:foreground ,mondo2k-pink-2))))
   `(wl-highlight-message-cited-text-1 ((,class (:foreground ,mondo2k-red))))
   `(wl-highlight-message-cited-text-2 ((,class (:foreground ,mondo2k-green-3))))
   `(wl-highlight-message-cited-text-3 ((,class (:foreground ,mondo2k-blue))))
   `(wl-highlight-message-cited-text-4 ((,class (:foreground ,mondo2k-blue))))
   `(wl-highlight-message-header-contents-face ((,class (:foreground ,mondo2k-green))))
   `(wl-highlight-message-headers-face ((,class (:foreground ,mondo2k-red))))
   `(wl-highlight-message-important-header-contents ((,class (:foreground ,mondo2k-green-3))))
   `(wl-highlight-message-header-contents ((,class (:foreground ,mondo2k-green-2))))
   `(wl-highlight-message-important-header-contents2 ((,class (:foreground ,mondo2k-green-3))))
   `(wl-highlight-message-signature ((,class (:foreground ,mondo2k-green))))
   `(wl-highlight-message-unimportant-header-contents ((,class (:foreground ,mondo2k-fg))))
   `(wl-highlight-summary-answered-face ((,class (:foreground ,mondo2k-blue))))
   `(wl-highlight-summary-disposed-face ((,class (:foreground ,mondo2k-fg
                                                         :slant italic))))
   `(wl-highlight-summary-new-face ((,class (:foreground ,mondo2k-blue))))
   `(wl-highlight-summary-normal-face ((,class (:foreground ,mondo2k-fg))))
   `(wl-highlight-summary-thread-top-face ((,class (:foreground ,mondo2k-yellow))))
   `(wl-highlight-thread-indent-face ((,class (:foreground ,mondo2k-magenta))))
   `(wl-highlight-summary-refiled-face ((,class (:foreground ,mondo2k-fg))))
   `(wl-highlight-summary-displaying-face ((,class (:underline t :weight bold))))

   ;; which-func-mode
   `(which-func ((,class (:foreground ,mondo2k-green-6))))

   ;; yasnippet
   `(yas/field-highlight-face ((,class (:background ,mondo2k-pink :foreground ,mondo2k-gray-6))))

   ;; enh-ruby-mode enh-ruby-op-face
   `(enh-ruby-op-face ((,class (:foreground ,mondo2k-blue-3))))
   `(enh-ruby-heredoc-delimiter-face ((,class (:foreground ,mondo2k-green-3))))
   `(enh-ruby-string-delimiter-face ((,class (:foreground ,mondo2k-green-3))))
   `(enh-ruby-regexp-delimiter-face ((,class (:foreground ,mondo2k-blue-2))))

   ;; yascroll
   `(yascroll:thumb-text-area ((,class (:background ,mondo2k-gray-8))))
   `(yascroll:thumb-fringe ((,class (:background ,mondo2k-gray-8 :foreground ,mondo2k-gray-8))))
   )

  ;;; custom theme variables
  (custom-theme-set-variables
   'mondo2k
   `(ansi-color-names-vector [,mondo2k-gray-7 ,mondo2k-pink-2 ,mondo2k-green ,mondo2k-orange
                                          ,mondo2k-blue-2 ,mondo2k-magenta ,mondo2k-blue-2 ,mondo2k-fg])
   ;; fill-column-indicator
   `(fci-rule-color ,mondo2k-gray-8)))

;;;###autoload
(when load-file-name
  (add-to-list 'custom-theme-load-path
               (file-name-as-directory (file-name-directory load-file-name))))

(provide-theme 'mondo2k)

;; Local Variables:
;; no-byte-compile: t
;; indent-tabs-mode: nil
;; eval: (when (fboundp 'rainbow-mode) (rainbow-mode +1))
;; End:

;;; mondo2k-theme.el ends here.
