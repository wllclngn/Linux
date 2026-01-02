;;; dome-theme.el // dome (v1.1), a scifi theme for GNUmacs
;; Copyright 2017-2021: wllclngn (https://github.com/wllclngn/GNUmacs-Themes/blob/master/dome-theme.el)
;; Copyright 2012-2020: Nicholas M. Van Horn (https://github.com/n3mo/cyberpunk-theme.el)

;; QUOTE:
;; "Things aren't different. Things are things," 'Neuromancer,' William Gibson.

;; STATEMENT:
;; dome theme is a fork of Nicholas M. Van Horn's Cyberpunk Theme.
;; As with the original, dome is designed for use with deftheme in
;; iterations of GNUmacs 24.1+. It is a stripped down (perhaps overly
;; simplified) fork which melds colors from my personal terminal's colors
;; and Cyberpunk's original appearance. The name has no literal meaning.

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

(deftheme dome "dome, a scifi theme for GNUmacs")

(defcustom dome-transparent-background nil
  "Make transparent background in terminal. (Workaround)")
(let ((class '((class color) (min-colors 32)))
      ;; dome palette
      (dome-red "#EA1717") ;; ERROR RED
      (dome-purple "#6A64FF") ;; MAC OS 9 PURP #2
      (dome-purp-cursor "#6B8CFF") ;; RiiiCK'S HAIR CURSOR
      (dome-purp-select "#4A4881") ;; MAC OS 9 PURP #1 SELECTION
      (dome-orange "#FFA561") ;; YABBA-DABBA-DOO-ORANGE-LAZARUS
      (dome-yellow "#FFEC87") ;; PASTEL YELLOW
      (dome-green "#00FFA6") ;; TERM' GREEN
      (dome-blue "#00A0FF") ;; OCEAN BLUE
      (dome-blue-2 "#217CFA") ;; MAC SELECTION BLUE
      (dome-gray "#242424") ;; DARK I
      (dome-gray-3 "#727272") ;; COMMENT GRAY
      (dome-gray-4 "#999999") ;; LITE II
      (dome-gray-5 "#181818") ;; BACKGROUND DARK II
      (dome-gray-6 "#121212") ;; FORE' MODELINE DARK III
      (dome-gray-7 "#282828") ;; DARK IV
      (dome-gray-8 "#C8C8C8") ;; TEXT TRUE
      (dome-gray-9 "#E7E7E7") ;; MODELINE TRUE
      (dome-white "#FFFFFF"))
  
 (custom-theme-set-faces
   'dome
   '(button ((t (:underline t))))
   `(link ((,class (:foreground ,dome-blue-2 :underline t :weight bold))))
   `(link-visited ((,class (:foreground ,dome-blue :underline t :weight normal))))
   `(blue ((,class (:foreground ,dome-green))))
   `(bold ((,class (:bold t))))
   `(border-glyph ((,class (nil))))
   `(buffers-tab ((,class (:background ,dome-gray-5 :foreground ,dome-white))))

   ;;; basic coloring
   `(default ((,class (:foreground ,dome-gray-8 :background ,dome-gray-5))))
   `(cursor ((,class (:background ,dome-purp-cursor))))
   `(escape-glyph-face ((,class (:foreground ,dome-red))))
   ;; `(fringe ((,class (:foreground ,dome-purp-cursor :background ,dome-gray-7))))
   `(header-line ((,class (:foreground ,dome-blue-2
                                       :background ,dome-gray-7
                                       :box (:line-width -1 :style released-button)))))
   `(highlight ((,class (:background ,dome-gray-4))))

   ;;; compilation
   `(compilation-column-face ((,class (:foreground ,dome-blue-2))))
   `(compilation-enter-directory-face ((,class (:foreground ,dome-blue-2))))
   `(compilation-error-face ((,class (:foreground ,dome-blue-2 :weight bold :underline t))))
   `(compilation-face ((,class (:foreground ,dome-purp-cursor))))
   `(compilation-info-face ((,class (:foreground ,dome-green))))
   `(compilation-info ((,class (:foreground ,dome-yellow :underline t))))
   `(compilation-leave-directory-face ((,class (:foreground ,dome-blue-2))))
   `(compilation-line-face ((,class (:foreground ,dome-blue-2))))
   `(compilation-line-number ((,class (:foreground ,dome-blue-2))))
   `(compilation-message-face ((,class (:foreground ,dome-green))))
   `(compilation-warning-face ((,class (:foreground ,dome-blue :weight bold :underline t))))

   ;;; grep
   `(grep-context-face ((,class (:foreground ,dome-gray-5 :background ,dome-blue-2))))
   `(grep-error-face ((,class (:foreground ,dome-red :weight bold :underline t))))
   `(grep-hit-face ((,class (:foreground ,dome-gray-5 :background ,dome-red))))
   `(grep-match-face ((,class (:foreground ,dome-gray-5 :background ,dome-blue-2))))
   `(match ((,class (:background ,dome-gray-5 :foreground ,dome-blue-2))))


   ;;; multiple-cursors
   `(mc/cursor-face ((,class (:inverse-video nil, :background ,dome-blue-2 :foreground ,dome-gray-5))))

   ;; faces used by isearch
   `(isearch ((,class (:foreground ,dome-gray-5 :background ,dome-blue-2))))
   `(isearch-fail ((,class (:background ,dome-blue-2))))
   
   `(lazy-highlight ((,class (:foreground ,dome-gray-5 :background ,dome-blue-2))))
   `(query-replace ((,class (:background ,dome-gray-4))))
   `(Highline-face ((,class (:background ,dome-yellow))))
   `(left-margin ((,class (nil))))
   `(toolbar ((,class (nil))))
   `(text-cursor ((,class (:background ,dome-blue-2 :foreground ,dome-gray-5))))

   `(menu ((,class (:foreground ,dome-purp-cursor :background ,dome-gray-6))))
   `(minibuffer-prompt ((,class (:foreground ,dome-blue-2 :background ,dome-gray-5))))
   ;;; mode-line
   `(mode-line
     ((,class (:foreground ,dome-gray-6
                           :background ,dome-gray-9
                           :box (:line-width -1 :color ,dome-gray-9)))))
   ;; `(mode-line-buffer-id ((,class (:foreground ,dome-blue-2 :weight bold))))
   `(mode-line-inactive
     ((,class (:foreground ,dome-gray-5
                           :background ,dome-gray-3
                           :box (:line-width -1 :color ,dome-green)))))
   `(region ((,class (:background ,dome-purp-select))))
   `(secondary-selection ((,class (:background ,dome-gray-7))))
   `(trailing-whitespace ((,class (:background ,dome-red))))
   `(vertical-border ((,class (:foreground ,dome-gray-4 :background ,dome-gray-5))))

   ;;; font lock
   `(font-lock-builtin-face ((,class (:foreground ,dome-green))))
   `(font-lock-comment-face ((,class (:foreground ,dome-gray-3 :italic t))))
   ;; `(font-lock-comment-delimiter-face ((,class (:foreground ,dome-blue-2)))) 
   `(font-lock-constant-face ((,class (:foreground ,dome-orange))))
   ;; `(font-lock-doc-face ((,class (:foreground ,dome-purple))))
   `(font-lock-doc-face ((,class (:foreground ,dome-blue))))
   `(font-lock-function-name-face ((,class (:foreground ,dome-blue-2))))
   `(font-lock-keyword-face ((,class (:foreground ,dome-green))))
   ;; `(font-lock-negation-char-face ((,class (:foreground ,dome-purp-cursor))))
   `(font-lock-preprocessor-face ((,class (:foreground ,dome-gray-4))))
   `(font-lock-string-face ((,class (:foreground ,dome-purple))))
   `(font-lock-type-face ((,class (:foreground ,dome-yellow))))
   `(font-lock-variable-name-face ((,class (:foreground ,dome-blue-2))))
   `(font-lock-warning-face ((,class (:foreground ,dome-red))))
   `(font-lock-reference-face ((,class (:foreground ,dome-gray-8))))
   `(font-lock-regexp-grouping-backslash ((,class (:foreground ,dome-blue))))
   `(font-lock-regexp-grouping-construct ((,class (:foreground ,dome-red))))

   `(c-annotation-face ((,class (:inherit font-lock-constant-face))))

   `(gui-element ((,class (:background ,dome-gray-4 :foreground ,dome-orange))))

   ;;; newsticker
   ;; These are currently placeholders that probably look terrible.
   ;; Someone who uses newsticker is welcome to change these
   `(newsticker-date-face ((,class (:foreground ,dome-purp-cursor))))
   `(newsticker-default-face ((,class (:foreground ,dome-purp-cursor))))
   `(newsticker-enclosure-face ((,class (:foreground ,dome-yellow))))
   `(newsticker-extra-face ((,class (:foreground ,dome-gray-7 :height 0.8))))
   `(newsticker-feed-face ((,class (:foreground ,dome-purp-cursor))))
   `(newsticker-immortal-item-face ((,class (:foreground ,dome-blue-2))))
   `(newsticker-new-item-face ((,class (:foreground ,dome-green))))
   `(newsticker-obsolete-item-face ((,class (:foreground ,dome-red))))
   `(newsticker-old-item-face ((,class (:foreground ,dome-gray-7))))
   `(newsticker-statistics-face ((,class (:foreground ,dome-purp-cursor))))
   `(newsticker-treeview-face ((,class (:foreground ,dome-purp-cursor))))
   `(newsticker-treeview-immortal-face ((,class (:foreground ,dome-blue-2))))
   `(newsticker-treeview-listwindow-face ((,class (:foreground ,dome-purp-cursor))))
   `(newsticker-treeview-new-face ((,class (:foreground ,dome-green :weight bold))))
   `(newsticker-treeview-obsolete-face ((,class (:foreground ,dome-red))))
   `(newsticker-treeview-old-face ((,class (:foreground ,dome-gray-7))))
   `(newsticker-treeview-selection-face ((,class (:foreground ,dome-blue-2))))

   ;;; external

   ;; full-ack
   `(ack-separator ((,class (:foreground ,dome-purp-cursor))))
   `(ack-file ((,class (:foreground ,dome-green))))
   `(ack-line ((,class (:foreground ,dome-blue-2))))
   `(ack-match ((,class (:foreground ,dome-blue :background ,dome-gray-7 :weigth bold))))

   ;; auctex
   `(font-latex-bold ((,class (:inherit bold))))
   `(font-latex-warning ((,class (:inherit font-lock-warning))))
   `(font-latex-sedate ((,class (:foreground ,dome-blue-2 :weight bold))))
   `(font-latex-string ((,class (:foreground ,dome-blue-2))))
   `(font-latex-title-4 ((,class (:inherit variable-pitch :weight bold))))
   `(font-latex-sectioning-0 ((,class (:foreground ,dome-green :background ,dome-gray-5 :scale 1.5))))
   `(font-latex-sectioning-1 ((,class (:foreground ,dome-green :background ,dome-gray-5 :scale 1.5))))

   ;; auto-complete
   `(ac-completion-face ((,class (:background ,dome-gray-3 :underline t))))
   `(ac-candidate-face ((,class (:background ,dome-gray-4 :foreground ,dome-gray-5))))
   `(ac-selection-face ((,class (:background ,dome-blue-2 :foreground ,dome-gray-5))))
   `(popup-tip-face ((,class (:background ,dome-gray-4 :foreground ,dome-white))))
   `(popup-scroll-bar-foreground-face ((,class (:background ,dome-gray-5))))
   `(popup-scroll-bar-background-face ((,class (:background ,dome-gray-4))))
   `(popup-isearch-match ((,class (:background ,dome-gray-5 :foreground ,dome-blue-2))))

   `(window-number-face ((,class (:background ,dome-gray-8 :foreground ,dome-green))))

   ;; company-mode
   `(company-tooltip ((,class (:background ,dome-gray-3 :foreground ,dome-blue-2))))
   `(company-tooltip-common ((,class (:inherit company-tooltip :foreground ,dome-green))))
   `(company-tooltip-common-selection ((,class (:inherit company-tooltip-selection :foreground ,dome-green))))
   `(company-tooltip-selection ((,class (:foreground ,dome-gray-5 :background ,dome-blue-2))))
   `(company-tooltip-annotation ((,class (:inherit company-tooltip :foreground ,dome-gray-5))))
   `(company-scrollbar-fg ((,class (:background ,dome-gray-5))))
   `(company-scrollbar-bg ((,class (:background ,dome-gray-4))))
   `(company-preview ((,class (:foreground ,dome-gray-8 :background ,dome-blue-2))))
   `(company-preview-common ((,class (:foreground ,dome-gray-8 :background ,dome-blue-2))))
   
   ;; diff
   `(diff-added ((,class (:foreground ,dome-blue-2))))
   `(diff-changed ((,class (:foreground ,dome-blue-2))))
   `(diff-removed ((,class (:foreground ,dome-red))))
   `(diff-header ((,class (:background ,dome-gray-7))))
   `(diff-file-header ((,class (:background ,dome-gray-7 :foreground ,dome-purp-cursor :bold t))))

   ;; ediff
   `(ediff-current-diff-Ancestor ((,class (:foreground ,dome-purp-cursor :background ,dome-blue-2))))
   `(ediff-current-diff-A ((,class (:foreground ,dome-purp-cursor :background ,dome-gray-7))))
   `(ediff-current-diff-B ((,class (:foreground ,dome-purp-cursor :background ,dome-gray-7))))
   `(ediff-current-diff-C ((,class (:foreground ,dome-purp-cursor :background ,dome-gray-7))))
   `(ediff-even-diff-Ancestor ((,class (:foreground ,dome-white :background ,dome-gray-7))))
   `(ediff-even-diff-A ((,class (:foreground ,dome-white :background ,dome-gray-7))))
   `(ediff-even-diff-B ((,class (:foreground ,dome-white :background ,dome-gray-7))))
   `(ediff-even-diff-C ((,class (:foreground ,dome-white :background ,dome-gray-7))))
   `(ediff-fine-diff-Ancestor ((,class (:foreground ,dome-gray-5 :background ,dome-blue-2))))
   `(ediff-fine-diff-A ((,class (:foreground ,dome-gray-5 :background ,dome-green))))
   `(ediff-fine-diff-B ((,class (:foreground ,dome-gray-5 :background ,dome-green))))
   `(ediff-fine-diff-C ((,class (:foreground ,dome-gray-5 :background ,dome-green))))
   `(ediff-odd-diff-Ancestor ((,class (:foreground ,dome-gray-5 :background ,dome-gray-3))))
   `(ediff-odd-diff-A ((,class (:foreground ,dome-gray-5 :background ,dome-gray-4))))
   `(ediff-odd-diff-B ((,class (:foreground ,dome-gray-5 :background ,dome-gray-4))))
   `(ediff-odd-diff-C ((,class (:foreground ,dome-gray-5 :background ,dome-gray-8))))

   ;; ert
   `(ert-test-result-expected ((,class (:foreground ,dome-yellow :background ,dome-gray-6))))
   `(ert-test-result-unexpected ((,class (:foreground ,dome-red :background ,dome-gray-6))))

   ;; eshell
   `(eshell-prompt ((,class (:foreground ,dome-green :weight bold))))
   `(eshell-ls-archive ((,class (:foreground ,dome-blue-2 :weight bold))))
   `(eshell-ls-backup ((,class (:inherit font-lock-comment))))
   `(eshell-ls-clutter ((,class (:inherit font-lock-comment))))
   `(eshell-ls-directory ((,class (:foreground ,dome-green :weight bold))))
   `(eshell-ls-executable ((,class (:foreground ,dome-red :weight bold))))
   `(eshell-ls-unreadable ((,class (:foreground ,dome-purp-cursor))))
   `(eshell-ls-missing ((,class (:inherit font-lock-warning))))
   `(eshell-ls-product ((,class (:inherit font-lock-doc))))
   `(eshell-ls-special ((,class (:foreground ,dome-blue-2 :weight bold))))
   `(eshell-ls-symlink ((,class (:foreground ,dome-orange :weight bold))))

   ;; flymake
   `(flymake-errline ((,class (:foreground ,dome-blue-2 :weight bold :underline t))))
   `(flymake-warnline ((,class (:foreground ,dome-blue :weight bold :underline t))))

   ;; flyspell
   `(flyspell-duplicate ((,class (:foreground ,dome-blue :weight bold :underline t))))
   `(flyspell-incorrect ((,class (:foreground ,dome-purp-select :weight bold :underline t))))

   ;; erc
   `(erc-action-face ((,class (:inherit erc-default-face))))
   `(erc-bold-face ((,class (:weight bold))))
   `(erc-current-nick-face ((,class (:foreground ,dome-green :weight bold))))
   `(erc-dangerous-host-face ((,class (:inherit font-lock-warning))))
   `(erc-default-face ((,class (:foreground ,dome-purp-cursor))))
   `(erc-direct-msg-face ((,class (:inherit erc-default))))
   `(erc-error-face ((,class (:inherit font-lock-warning))))
   `(erc-fool-face ((,class (:inherit erc-default))))
   `(erc-highlight-face ((,class (:inherit hover-highlight))))
   `(erc-input-face ((,class (:foreground ,dome-blue-2))))
   `(erc-keyword-face ((,class (:foreground ,dome-green :weight bold))))
   `(erc-nick-default-face ((,class (:foreground ,dome-blue-2 :weight bold))))
   `(erc-my-nick-face ((,class (:foreground ,dome-red :weigth bold))))
   `(erc-nick-msg-face ((,class (:inherit erc-default))))
   `(erc-notice-face ((,class (:foreground ,dome-blue-2))))
   `(erc-pal-face ((,class (:foreground ,dome-blue :weight bold))))
   `(erc-prompt-face ((,class (:foreground ,dome-blue :background ,dome-gray-6 :weight bold))))
   `(erc-timestamp-face ((,class (:foreground ,dome-purple))))
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
   `(gnus-summary-cancelled ((,class (:foreground ,dome-blue))))
   `(gnus-summary-high-ancient ((,class (:foreground ,dome-green))))
   `(gnus-summary-high-read ((,class (:foreground ,dome-blue-2 :weight bold))))
   `(gnus-summary-high-ticked ((,class (:foreground ,dome-blue :weight bold))))
   `(gnus-summary-high-unread ((,class (:foreground ,dome-purp-cursor :weight bold))))
   `(gnus-summary-low-ancient ((,class (:foreground ,dome-green))))
   `(gnus-summary-low-read ((t (:foreground ,dome-blue-2))))
   `(gnus-summary-low-ticked ((,class (:foreground ,dome-blue :weight bold))))
   `(gnus-summary-low-unread ((,class (:foreground ,dome-purp-cursor))))
   `(gnus-summary-normal-ancient ((,class (:foreground ,dome-green))))
   `(gnus-summary-normal-read ((,class (:foreground ,dome-blue-2))))
   `(gnus-summary-normal-ticked ((,class (:foreground ,dome-blue :weight bold))))
   `(gnus-summary-normal-unread ((,class (:foreground ,dome-purp-cursor))))
   `(gnus-summary-selected ((,class (:foreground ,dome-blue-2 :weight bold))))
   `(gnus-cite-1 ((,class (:foreground ,dome-blue))))
   `(gnus-cite-10 ((,class (:foreground ,dome-blue))))
   `(gnus-cite-11 ((,class (:foreground ,dome-blue-2))))
   `(gnus-cite-2 ((,class (:foreground ,dome-orange))))
   `(gnus-cite-3 ((,class (:foreground ,dome-orange))))
   `(gnus-cite-4 ((,class (:foreground ,dome-yellow))))
   `(gnus-cite-5 ((,class (:foreground ,dome-purple))))
   `(gnus-cite-6 ((,class (:foreground ,dome-blue-2))))
   `(gnus-cite-7 ((,class (:foreground ,dome-red))))
   `(gnus-cite-8 ((,class (:foreground ,dome-blue-2))))
   `(gnus-cite-9 ((,class (:foreground ,dome-blue-2))))
   `(gnus-group-news-1-empty ((,class (:foreground ,dome-blue-2))))
   `(gnus-group-news-2-empty ((,class (:foreground ,dome-yellow))))
   `(gnus-group-news-3-empty ((,class (:foreground ,dome-purple))))
   `(gnus-group-news-4-empty ((,class (:foreground ,dome-orange))))
   `(gnus-group-news-5-empty ((,class (:foreground ,dome-orange))))
   `(gnus-group-news-6-empty ((,class (:foreground ,dome-gray-7))))
   `(gnus-group-news-low-empty ((,class (:foreground ,dome-gray-7))))
   `(gnus-signature ((,class (:foreground ,dome-blue-2))))
   `(gnus-x ((,class (:background ,dome-purp-cursor :foreground ,dome-gray-6))))

   ;; helm
   `(helm-header
     ((,class (:foreground ,dome-blue-2
                           :background ,dome-gray-6
                           :underline nil
                           :box nil))))
   `(helm-source-header
     ((,class (:foreground ,dome-blue-2
                           :background ,dome-gray-7
                           :underline nil
                           :weight bold
                           :box (:line-width -1 :style released-button)))))
   `(helm-selection ((,class (:background ,dome-gray-7 :underline nil))))
   `(helm-selection-line ((,class (:background ,dome-gray-7))))
   `(helm-visible-mark ((,class (:foreground ,dome-gray-6 :background ,dome-blue))))
   `(helm-candidate-number ((,class (:foreground ,dome-yellow :background ,dome-gray-7))))

   ;; hl-line-mode
   `(hl-sexp-face ((,class (:background ,dome-gray-4))))
   `(hl-line-face ((,class (:background ,dome-gray-4))))

   ;; ido-mode
   `(ido-first-match ((,class (:foreground ,dome-blue-2 :background ,dome-gray-5))))
   `(ido-only-match ((,class (:foreground ,dome-blue-2 :background ,dome-gray-5))))
   `(ido-subdir ((,class (:foreground ,dome-gray-4 :backgroun ,dome-gray-5))))
   `(ido-indicator ((,class (:foreground ,dome-gray-5 :background ,dome-blue-2))))

   ;; js2-mode
   `(js2-warning-face ((,class (:foreground ,dome-blue))))
   `(js2-error-face ((,class (:foreground ,dome-red :weight bold))))
   `(js2-jsdoc-tag-face ((,class (:foreground ,dome-yellow))))
   `(js2-jsdoc-type-face ((,class (:foreground ,dome-yellow)))) ;;dome-blue-2))))
   `(js2-jsdoc-value-face ((,class (:foreground ,dome-yellow))))
   `(js2-function-param-face ((,class (:foreground ,dome-blue))))
   `(js2-external-variable-face ((,class (:foreground ,dome-blue))))

   ;; jabber-mode
   `(jabber-roster-user-away ((,class (:foreground ,dome-yellow))))
   `(jabber-roster-user-online ((,class (:foreground ,dome-orange))))
   `(jabber-roster-user-dnd ((,class (:foreground ,dome-red))))
   `(jabber-rare-time-face ((,class (:foreground ,dome-purple))))
   `(jabber-chat-prompt-local ((,class (:foreground ,dome-orange))))
   `(jabber-chat-prompt-foreign ((,class (:foreground ,dome-red))))
   `(jabber-activity-face((,class (:foreground ,dome-red))))
   `(jabber-activity-personal-face ((,class (:foreground ,dome-green))))
   `(jabber-title-small ((,class (:height 1.1 :weight bold))))
   `(jabber-title-medium ((,class (:height 1.2 :weight bold))))
   `(jabber-title-large ((,class (:height 1.3 :weight bold))))

   ;; linum-mode
   `(linum ((,class (:foreground ,dome-yellow :background ,dome-gray-6))))

   ;;linum-relative
   `(linum-relative-current-face ((,class (:inherit linum :foreground ,dome-white :weight bold))))

   ;; magit
   ;; magit headings and diffs
   `(magit-section-highlight ((t (:background ,dome-gray-7))))
   `(magit-section-heading ((t (:foreground ,dome-green :weight bold))))
   `(magit-section-heading-selection ((t (:foreground ,dome-red :weight bold))))
   `(magit-diff-file-heading           ((t (:weight bold))))
   `(magit-diff-file-heading-highlight ((t (:background ,dome-gray-7  :weight bold))))
   `(magit-diff-file-heading-selection ((t (:background ,dome-gray-7
                                            :foreground ,dome-orange :weight bold))))
   `(magit-diff-hunk-heading           ((t (:background ,dome-gray-6))))
   `(magit-diff-hunk-heading-highlight ((t (:background ,dome-gray-7))))
   `(magit-diff-hunk-heading-selection ((t (:background ,dome-gray-7
                                            :foreground ,dome-orange))))
   `(magit-diff-lines-heading          ((t (:background ,dome-orange
                                            :foreground ,dome-gray-7))))
   `(magit-diff-added                  ((t (:foreground ,dome-green))))
   `(magit-diff-added-highlight        ((t (:inherit magit-diff-added :weight bold))))
   `(magit-diff-removed                ((t (:foreground ,dome-blue-2))))
   `(magit-diff-removed-highlight      ((t (:inherit magit-diff-removed :weight bold))))
   `(magit-diff-context                ((t (:foreground ,dome-gray-8))))
   `(magit-diff-context-highlight      ((t (:inherit magit-diff-context :weight bold))))
   `(magit-diffstat-added   ((t (:inherit magit-diff-added))))
   `(magit-diffstat-removed ((t (:inherit magit-diff-removed))))
   ;; magit popup
   `(magit-popup-heading             ((t (:foreground ,dome-blue-2  :weight bold))))
   `(magit-popup-key                 ((t (:foreground ,dome-green :weight bold))))
   `(magit-popup-argument            ((t (:foreground ,dome-orange   :weight bold))))
   `(magit-popup-disabled-argument   ((t (:foreground ,dome-purp-cursor    :weight normal))))
   `(magit-popup-option-value        ((t (:foreground ,dome-orange  :weight bold))))
   ;; ;; magit process
   `(magit-process-ok    ((t (:foreground ,dome-purple  :weight bold))))
   `(magit-process-ng    ((t (:foreground ,dome-blue-2    :weight bold))))
   ;; ;; magit log
   `(magit-log-author    ((t (:foreground ,dome-blue-2))))
   `(magit-log-date      ((t (:foreground ,dome-gray-8))))
   `(magit-log-graph     ((t (:foreground ,dome-white))))
   ;; ;; magit sequence
   `(magit-sequence-pick ((t (:foreground ,dome-blue-2))))
   `(magit-sequence-stop ((t (:foreground ,dome-purple))))
   `(magit-sequence-part ((t (:foreground ,dome-blue-2))))
   `(magit-sequence-head ((t (:foreground ,dome-green))))
   `(magit-sequence-drop ((t (:foreground ,dome-blue))))
   `(magit-sequence-done ((t (:foreground ,dome-gray-3))))
   `(magit-sequence-onto ((t (:foreground ,dome-gray-3))))
   ;; ;; magit bisect
   `(magit-bisect-good ((t (:foreground ,dome-purple))))
   `(magit-bisect-skip ((t (:foreground ,dome-blue-2))))
   `(magit-bisect-bad  ((t (:foreground ,dome-blue))))
   ;; ;; magit blame
   `(magit-blame-heading ((t (:background ,dome-gray-7 :foreground ,dome-blue-2))))
   `(magit-blame-hash    ((t (:background ,dome-gray-7 :foreground ,dome-blue-2))))
   `(magit-blame-name    ((t (:background ,dome-gray-7 :foreground ,dome-blue-2))))
   `(magit-blame-date    ((t (:background ,dome-gray-7 :foreground ,dome-blue))))
   `(magit-blame-summary ((t (:background ,dome-gray-7 :foreground ,dome-orange
                                          :weight bold))))
   ;; ;; magit references etc
   `(magit-dimmed         ((t (:foreground ,dome-gray-7))))
   `(magit-hash           ((t (:foreground ,dome-gray-7))))
   `(magit-tag            ((t (:foreground ,dome-blue-2 :weight bold))))
   `(magit-branch-remote  ((t (:foreground ,dome-yellow  :weight bold))))
   `(magit-branch-local   ((t (:foreground ,dome-green   :weight bold))))
   `(magit-branch-current ((t (:foreground ,dome-blue-2   :weight bold :box t))))
   `(magit-head           ((t (:foreground ,dome-green   :weight bold))))
   `(magit-refname        ((t (:background ,dome-gray-7 :foreground ,dome-purp-cursor :weight bold))))
   `(magit-refname-stash  ((t (:background ,dome-gray-7 :foreground ,dome-purp-cursor :weight bold))))
   `(magit-refname-wip    ((t (:background ,dome-gray-7 :foreground ,dome-purp-cursor :weight bold))))
   `(magit-signature-good      ((t (:foreground ,dome-blue-2))))
   `(magit-signature-bad       ((t (:foreground ,dome-red))))
   `(magit-signature-untrusted ((t (:foreground ,dome-blue-2))))
   `(magit-cherry-unmatched    ((t (:foreground ,dome-orange))))
   `(magit-cherry-equivalent   ((t (:foreground ,dome-blue-2))))
   `(magit-reflog-commit       ((t (:foreground ,dome-blue-2))))
   `(magit-reflog-amend        ((t (:foreground ,dome-blue-2))))
   `(magit-reflog-merge        ((t (:foreground ,dome-blue-2))))
   `(magit-reflog-checkout     ((t (:foreground ,dome-green))))
   `(magit-reflog-reset        ((t (:foreground ,dome-red))))
   `(magit-reflog-rebase       ((t (:foreground ,dome-blue-2))))
   `(magit-reflog-cherry-pick  ((t (:foreground ,dome-blue-2))))
   `(magit-reflog-remote       ((t (:foreground ,dome-orange))))
   `(magit-reflog-other        ((t (:foreground ,dome-orange))))
   
   `(eval-sexp-fu-flash ((,class (:background ,dome-gray-8 :foreground ,dome-blue-2))))

   ;; message-mode
   `(message-cited-text ((,class (:inherit font-lock-comment))))
   `(message-header-name ((,class (:foreground ,dome-green))))
   `(message-header-other ((,class (:foreground ,dome-blue-2))))
   `(message-header-to ((,class (:foreground ,dome-blue-2 :weight bold))))
   `(message-header-from ((,class (:foreground ,dome-blue-2 :weight bold))))
   `(message-header-cc ((,class (:foreground ,dome-blue-2 :weight bold))))
   `(message-header-newsgroups ((,class (:foreground ,dome-blue-2 :weight bold))))
   `(message-header-subject ((,class (:foreground ,dome-blue :weight bold))))
   `(message-header-xheader ((,class (:foreground ,dome-blue-2))))
   `(message-mml ((,class (:foreground ,dome-blue-2 :weight bold))))
   `(message-separator ((,class (:inherit font-lock-comment))))

   ;; mew
   `(mew-face-header-subject ((,class (:foreground ,dome-blue))))
   `(mew-face-header-from ((,class (:foreground ,dome-blue-2))))
   `(mew-face-header-date ((,class (:foreground ,dome-blue-2))))
   `(mew-face-header-to ((,class (:foreground ,dome-red))))
   `(mew-face-header-key ((,class (:foreground ,dome-blue-2))))
   `(mew-face-header-private ((,class (:foreground ,dome-blue-2))))
   `(mew-face-header-important ((,class (:foreground ,dome-green))))
   `(mew-face-header-marginal ((,class (:foreground ,dome-purp-cursor :weight bold))))
   `(mew-face-header-warning ((,class (:foreground ,dome-red))))
   `(mew-face-header-xmew ((,class (:foreground ,dome-blue-2))))
   `(mew-face-header-xmew-bad ((,class (:foreground ,dome-red))))
   `(mew-face-body-url ((,class (:foreground ,dome-blue))))
   `(mew-face-body-comment ((,class (:foreground ,dome-purp-cursor :slant italic))))
   `(mew-face-body-cite1 ((,class (:foreground ,dome-blue-2))))
   `(mew-face-body-cite2 ((,class (:foreground ,dome-green))))
   `(mew-face-body-cite3 ((,class (:foreground ,dome-blue))))
   `(mew-face-body-cite4 ((,class (:foreground ,dome-blue-2))))
   `(mew-face-body-cite5 ((,class (:foreground ,dome-red))))
   `(mew-face-mark-review ((,class (:foreground ,dome-green))))
   `(mew-face-mark-escape ((,class (:foreground ,dome-blue-2))))
   `(mew-face-mark-delete ((,class (:foreground ,dome-red))))
   `(mew-face-mark-unlink ((,class (:foreground ,dome-blue-2))))
   `(mew-face-mark-refile ((,class (:foreground ,dome-blue-2))))
   `(mew-face-mark-unread ((,class (:foreground ,dome-blue-2))))
   `(mew-face-eof-message ((,class (:foreground ,dome-blue-2))))
   `(mew-face-eof-part ((,class (:foreground ,dome-blue-2))))

   ;; mic-paren
   `(paren-face-match ((,class (:foreground ,dome-orange :background ,dome-gray-6 :weight bold))))
   `(paren-face-mismatch ((,class (:foreground ,dome-gray-6 :background ,dome-blue-2 :weight bold))))
   `(paren-face-no-match ((,class (:foreground ,dome-gray-6 :background ,dome-red :weight bold))))

   ;; nav
   `(nav-face-heading ((,class (:foreground ,dome-blue-2))))
   `(nav-face-button-num ((,class (:foreground ,dome-orange))))
   `(nav-face-dir ((,class (:foreground ,dome-blue-2))))
   `(nav-face-hdir ((,class (:foreground ,dome-red))))
   `(nav-face-file ((,class (:foreground ,dome-purp-cursor))))
   `(nav-face-hfile ((,class (:foreground ,dome-red))))

   ;; mumamo
   `(mumamo-background-chunk-major ((,class (:background ,dome-gray-5))))
   `(mumamo-background-chunk-submode1 ((,class (:background ,dome-gray-5))))
   `(mumamo-background-chunk-submode2 ((,class (:background ,dome-gray-7))))
   `(mumamo-background-chunk-submode3 ((,class (:background ,dome-gray-7))))
   `(mumamo-background-chunk-submode4 ((,class (:background ,dome-gray-7))))

   ;; org-mode
   `(org-document-title ((,class (:foreground ,dome-orange :background ,dome-gray-5 :weight bold :height 1.5))))
   `(org-document-info ((,class (:foreground ,dome-orange :background ,dome-gray-5 :weight bold))))
   `(org-document-info-keyword ((,class (:foreground ,dome-gray-3 :background ,dome-gray-5))))
   `(org-agenda-date-today
     ((,class (:foreground ,dome-purp-select :slant italic :weight bold))) t)
   `(org-agenda-structure
     ((,class (:inherit font-lock-comment-face))))
   `(org-archived ((,class (:slant italic))))
   `(org-checkbox ((,class (:background ,dome-gray-3 :foreground ,dome-gray-5
                                   :box (:line-width 1 :style released-button)))))
   `(org-date ((,class (:foreground ,dome-orange :underline t))))
   `(org-done ((,class (:bold t :weight bold :foreground ,dome-blue-2
                              :box (:line-width 1 :style none)))))
   `(org-todo ((,class (:bold t :foreground ,dome-blue :weight bold
                              :box (:line-width 1 :style none)))))
   `(org-level-1 ((,class (:foreground ,dome-blue-2 :height 1.3))))
   `(org-level-2 ((,class (:foreground ,dome-blue-2 :height 1.2))))
   `(org-level-3 ((,class (:foreground ,dome-green :height 1.1))))
   `(org-level-4 ((,class (:foreground ,dome-blue-2))))
   `(org-level-5 ((,class (:foreground ,dome-blue))))
   `(org-level-6 ((,class (:foreground ,dome-blue-2))))
   `(org-level-7 ((,class (:foreground ,dome-yellow))))
   `(org-level-8 ((,class (:foreground ,dome-orange))))
   `(org-link ((,class (:foreground ,dome-orange :underline t))))
   `(org-tag ((,class (:bold t :weight bold))))
   `(org-column ((,class (:background ,dome-blue :foreground ,dome-gray-5))))
   `(org-column-title ((,class (:background ,dome-gray-7 :underline t :weight bold))))
   `(org-block ((,class (:foreground ,dome-purp-cursor :background ,dome-gray-7))))
   `(org-block-begin-line 
     ((,class (:foreground "#008ED1" :background ,dome-gray-7))))
   `(org-block-background ((,class (:background ,dome-gray-7))))
   `(org-block-end-line 
     ((,class (:foreground "#008ED1" :background ,dome-gray-7))))

   ;; `(org-deadline-announce ((,class (:foreground ,dome-blue-2))))
   ;; `(org-scheduled ((,class (:foreground ,dome-yellow))))
   ;; `(org-scheduled-previously ((,class (:foreground ,dome-red))))
   ;; `(org-scheduled-today ((,class (:foreground ,dome-green))))
   ;; `(org-special-keyword ((,class (:foreground ,dome-blue))))
   ;; `(org-table ((,class (:foreground ,dome-yellow))))
   ;; `(org-time-grid ((,class (:foreground ,dome-blue))))
   ;; `(org-upcoming-deadline ((,class (:inherit font-lock-keyword-face))))
   ;; `(org-warning ((,class (:bold t :foreground ,dome-red :weight bold :underline nil))))
   ;; `(org-formula ((,class (:foreground ,dome-blue))))
   ;; `(org-headline-done ((,class (:foreground ,dome-yellow))))
   ;; `(org-hide ((,class (:foreground ,dome-gray-7))))

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
   `(rainbow-delimiters-depth-1-face ((,class (:foreground ,dome-blue-2))))
   `(rainbow-delimiters-depth-2-face ((,class (:foreground ,dome-blue-2))))
   `(rainbow-delimiters-depth-3-face ((,class (:foreground ,dome-blue-2))))
   `(rainbow-delimiters-depth-4-face ((,class (:foreground ,dome-blue-2))))
   `(rainbow-delimiters-depth-5-face ((,class (:foreground ,dome-blue-2))))
   `(rainbow-delimiters-depth-6-face ((,class (:foreground ,dome-orange))))
   `(rainbow-delimiters-depth-7-face ((,class (:foreground ,dome-blue))))
   `(rainbow-delimiters-depth-8-face ((,class (:foreground ,dome-orange))))
   `(rainbow-delimiters-depth-9-face ((,class (:foreground ,dome-gray-8))))
   `(rainbow-delimiters-depth-10-face ((,class (:foreground ,dome-white))))
   `(rainbow-delimiters-depth-11-face ((,class (:foreground ,dome-green))))
   `(rainbow-delimiters-depth-12-face ((,class (:foreground ,dome-red))))

   ;; rpm-mode
   `(rpm-spec-dir-face ((,class (:foreground ,dome-blue-2))))
   `(rpm-spec-doc-face ((,class (:foreground ,dome-blue-2))))
   `(rpm-spec-ghost-face ((,class (:foreground ,dome-red))))
   `(rpm-spec-macro-face ((,class (:foreground ,dome-blue-2))))
   `(rpm-spec-obsolete-tag-face ((,class (:foreground ,dome-red))))
   `(rpm-spec-package-face ((,class (:foreground ,dome-red))))
   `(rpm-spec-section-face ((,class (:foreground ,dome-blue-2))))
   `(rpm-spec-tag-face ((,class (:foreground ,dome-green))))
   `(rpm-spec-var-face ((,class (:foreground ,dome-red))))

   ;; rst-mode
   `(rst-level-1-face ((,class (:foreground ,dome-blue))))
   `(rst-level-2-face ((,class (:foreground ,dome-purple))))
   `(rst-level-3-face ((,class (:foreground ,dome-orange))))
   `(rst-level-4-face ((,class (:foreground ,dome-blue))))
   `(rst-level-5-face ((,class (:foreground ,dome-orange))))
   `(rst-level-6-face ((,class (:foreground ,dome-yellow))))

   ;; show-paren
   `(show-paren-mismatch ((,class (:foreground ,dome-red :background ,dome-gray-5))))
   `(show-paren-match ((,class (:foreground ,dome-gray-5 :background ,dome-blue-2))))

   `(naeu-green-face ((,class (:foreground ,dome-blue-2 :background ,dome-gray-5))))
   `(naeu-pink-face ((,class (:foreground ,dome-blue-2 :background ,dome-gray-5))))
   `(naeu-blue-face ((,class (:foreground ,dome-orange :background ,dome-gray-5))))
   `(naeu-orange-face ((,class (:foreground ,dome-blue :background ,dome-gray-5))))
   `(naeu-red-face ((,class (:foreground ,dome-blue :background ,dome-gray-5))))
   `(naeu-grey-face ((,class (:foreground ,dome-gray :background ,dome-gray-5))))

   ;; SLIME
   `(slime-repl-inputed-output-face ((,class (:foreground ,dome-red))))

  ;;; ansi-term
   `(term-color-black ((,class (:foreground ,dome-gray-6
                                            :background ,dome-gray-7))))
   `(term-color-red ((,class (:foreground ,dome-blue-2
                                          :background ,dome-red))))
   `(term-color-green ((,class (:foreground ,dome-blue-2
                                            :background ,dome-yellow))))
   `(term-color-yellow ((,class (:foreground ,dome-blue
                                             :background ,dome-blue-2))))
   `(term-color-blue ((,class (:foreground ,dome-orange
                                           :background ,dome-orange))))
   `(term-color-magenta ((,class (:foreground ,dome-blue-2
                                              :background ,dome-red))))
   `(term-color-cyan ((,class (:foreground ,dome-orange
                                           :background ,dome-green))))
   `(term-color-white ((,class (:foreground ,dome-purp-cursor
                                            :background ,dome-gray-7))))
   `(term-default-fg-color ((,class (:inherit term-color-white))))
   `(term-default-bg-color ((,class (:inherit term-color-black))))

   ;; volatile-highlights
   `(vhl/default-face ((,class (:background ,dome-gray-4))))

   `(undo-tree-visualizer-active-branch-face ((,class (:foreground ,dome-blue-2 :background ,dome-gray-5))))

   ;; whitespace-mode
   `(whitespace-space ((,class (:background ,dome-gray-6 :foreground ,dome-gray-7))))
   `(whitespace-hspace ((,class (:background ,dome-gray-6 :foreground ,dome-gray-7))))
   `(whitespace-tab ((,class (:background ,dome-gray-6 :foreground ,dome-red))))
   `(whitespace-newline ((,class (:foreground ,dome-gray-7))))
   `(whitespace-trailing ((,class (:foreground ,dome-red :background ,dome-gray-6))))
   `(whitespace-line ((,class (:background ,dome-gray-7 :foreground ,dome-blue-2))))
   `(whitespace-space-before-tab ((,class (:background ,dome-blue :foreground ,dome-blue))))
   `(whitespace-indentation ((,class (:background ,dome-blue-2 :foreground ,dome-red))))
   `(whitespace-empty ((,class (:background ,dome-blue-2 :foreground ,dome-red))))
   `(whitespace-space-after-tab ((,class (:background ,dome-blue-2 :foreground ,dome-red))))

   ;; wanderlust
   `(wl-highlight-folder-few-face ((,class (:foreground ,dome-blue-2))))
   `(wl-highlight-folder-many-face ((,class (:foreground ,dome-blue-2))))
   `(wl-highlight-folder-path-face ((,class (:foreground ,dome-blue))))
   `(wl-highlight-folder-unread-face ((,class (:foreground ,dome-green))))
   `(wl-highlight-folder-zero-face ((,class (:foreground ,dome-purp-cursor))))
   `(wl-highlight-folder-unknown-face ((,class (:foreground ,dome-green))))
   `(wl-highlight-message-citation-header ((,class (:foreground ,dome-blue-2))))
   `(wl-highlight-message-cited-text-1 ((,class (:foreground ,dome-red))))
   `(wl-highlight-message-cited-text-2 ((,class (:foreground ,dome-yellow))))
   `(wl-highlight-message-cited-text-3 ((,class (:foreground ,dome-green))))
   `(wl-highlight-message-cited-text-4 ((,class (:foreground ,dome-green))))
   `(wl-highlight-message-header-contents-face ((,class (:foreground ,dome-blue-2))))
   `(wl-highlight-message-headers-face ((,class (:foreground ,dome-red))))
   `(wl-highlight-message-important-header-contents ((,class (:foreground ,dome-yellow))))
   `(wl-highlight-message-header-contents ((,class (:foreground ,dome-purple))))
   `(wl-highlight-message-important-header-contents2 ((,class (:foreground ,dome-yellow))))
   `(wl-highlight-message-signature ((,class (:foreground ,dome-blue-2))))
   `(wl-highlight-message-unimportant-header-contents ((,class (:foreground ,dome-purp-cursor))))
   `(wl-highlight-summary-answered-face ((,class (:foreground ,dome-green))))
   `(wl-highlight-summary-disposed-face ((,class (:foreground ,dome-purp-cursor
                                                         :slant italic))))
   `(wl-highlight-summary-new-face ((,class (:foreground ,dome-green))))
   `(wl-highlight-summary-normal-face ((,class (:foreground ,dome-purp-cursor))))
   `(wl-highlight-summary-thread-top-face ((,class (:foreground ,dome-blue-2))))
   `(wl-highlight-thread-indent-face ((,class (:foreground ,dome-blue-2))))
   `(wl-highlight-summary-refiled-face ((,class (:foreground ,dome-purp-cursor))))
   `(wl-highlight-summary-displaying-face ((,class (:underline t :weight bold))))

   ;; which-func-mode
   `(which-func ((,class (:foreground ,dome-yellow))))

   ;; yasnippet
   `(yas/field-highlight-face ((,class (:background ,dome-blue-2 :foreground ,dome-gray-5))))

   ;; enh-ruby-mode enh-ruby-op-face
   `(enh-ruby-op-face ((,class (:foreground ,dome-orange))))
   `(enh-ruby-heredoc-delimiter-face ((,class (:foreground ,dome-yellow))))
   `(enh-ruby-string-delimiter-face ((,class (:foreground ,dome-yellow))))
   `(enh-ruby-regexp-delimiter-face ((,class (:foreground ,dome-orange))))

   ;; yascroll
   `(yascroll:thumb-text-area ((,class (:background ,dome-gray-7))))
   `(yascroll:thumb-fringe ((,class (:background ,dome-gray-7 :foreground ,dome-gray-7))))
   )

  ;;; custom theme variables
  (custom-theme-set-variables
   'dome
   `(ansi-color-names-vector [,dome-gray-6 ,dome-blue-2 ,dome-blue-2 ,dome-blue
                                          ,dome-orange ,dome-blue-2 ,dome-orange ,dome-purp-cursor])
   ;; fill-column-indicator
   `(fci-rule-color ,dome-gray-7)))

;;;###autoload
(when load-file-name
  (add-to-list 'custom-theme-load-path
               (file-name-as-directory (file-name-directory load-file-name))))

(provide-theme 'dome)

;; Local Variables:
;; no-byte-compile: t
;; indent-tabs-mode: nil
;; eval: (when (fboundp 'rainbow-mode) (rainbow-mode +1))
;; End:

;;; dome-theme.el ends here.
