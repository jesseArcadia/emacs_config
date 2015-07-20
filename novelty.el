;; (╯°□°)╯︵ ┻━┻
(defun flip-table (num)
  "Animates flipping a table."
  (interactive "p")
  (let ((start-point (point))
	(anticipation (or num 4)))
    (insert "(°-°) ┬─┬ ")
    (sit-for anticipation)
    (delete-region start-point (point))
    (insert "(╯°□°)╯︵ ┻━┻ ")))

;; flip-pɹoʍ︵\(°□°\)
(defun flip-word (num)
  "Animates flipping the last word."
  (interactive "p")
    (let ((anticipation (or num 4)))
      (re-search-backward "\\(\\<\\w+\\>[.,!?]?\\)")
      (goto-char (match-end 0))
      (insert " (°-°)")
      (let ((post-face (point)))
	(sit-for anticipation)
	(replace-match (rotate-word (match-string-no-properties 0)))
	(delete-region (match-end 0) post-face))
      (insert "︵\\(°□°\\) ")))

;; used in flip-word
(defun rotate-word (string)
  (let ((flipped))
    (dolist (ascii-dec (string-to-list string))
      (setq flipped (cons
		     (unicode-to-char
		      (dec-to-upside-down-unicode ascii-dec))
		     flipped)))
    (concat flipped)))

;; used in rotate-word
(defun unicode-to-char (unicode)
  (string-to-number unicode 16))

;; used in rotate-word
(defun dec-to-upside-down-unicode (dec)
  (cond ((= dec 97) "0250")
	((= dec 98) "0071")
	((= dec 99) "0254")
	((= dec 100) "0070")
	((= dec 101) "01dd")
	((= dec 102) "025f")
	((= dec 103) "0253")
	((= dec 104) "0265")
	((= dec 105) "0131")
	((= dec 106) "027e")
	((= dec 107) "029e")
	((= dec 108) "006c")
	((= dec 109) "026f")
	((= dec 110) "0075")
	((= dec 111) "006f")
	((= dec 112) "0064")
	((= dec 113) "0062")
	((= dec 114) "0279")
	((= dec 115) "0073")
	((= dec 116) "0287")
	((= dec 117) "006e")
	((= dec 118) "028c")
	((= dec 119) "028d")
	((= dec 120) "0078")
	((= dec 121) "028e")
	((= dec 122) "007a")
	((= dec 65) "2200")
	((= dec 66) "10412")
	((= dec 67) "0186")
	((= dec 68) "15e1")
	((= dec 69) "018e")
	((= dec 70) "2132")
	((= dec 71) "2141")
	((= dec 72) "0048")
	((= dec 73) "0049")
	((= dec 74) "017f")
	((= dec 75) "029e")
	((= dec 76) "2142")
	((= dec 77) "0057")
	((= dec 78) "004e")
	((= dec 79) "004f")
	((= dec 80) "0500")
	((= dec 81) "038c")
	((= dec 82) "1d1a")
	((= dec 83) "0053")
	((= dec 84) "22a5")
	((= dec 85) "2229")
	((= dec 86) "039b")
	((= dec 87) "004d")
	((= dec 88) "0058")
	((= dec 89) "2144")
	((= dec 90) "005a")
	((= dec 48) "0030")
	((= dec 49) "21c2")
	((= dec 50) "218a")
	((= dec 51) "218b")
	((= dec 52) "3123")
	((= dec 53) "078e")
	((= dec 54) "0039")
	((= dec 55) "3125")
	((= dec 56) "0038")
	((= dec 57) "0036")
	((= dec 38) "214b")
	((= dec 45) "203e")
	((= dec 63) "00bf")
	((= dec 33) "00a1")
	((= dec 34) "201e")
	((= dec 39) "002c")
	((= dec 46) "02d9")
	((= dec 44) "0027")
	((= dec 59) "061b")
	(t nil)))
