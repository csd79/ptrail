;;; Kinevezések, egyoldalú és kétoldalú kinevezésmódosítások kitöltése
;;; B2, B8 és B9 személyi körök részére
;;; ISO 8859-2, CR LF



;;; Parameters ---------------------------------------------------

()



;;; Descriptions -------------------------------------------------

(

 (
  :field      "Iktatószám"
  :target     ""
  :row-args   ("SZTSZ")
  :literals   ()
  :plist-keys (:file-nums)
  :generator  (lambda (sztsz file-nums)
                (let ((row (select-row file-nums
                            #'(lambda (row)
                                (= (parse-number sztsz)
                                   (parse-number (xcref row "SZTSZ")))))))
                   (if (and row
                            (not (zerop (xarray-indexed-height row))))
                     (xcref row "Iktatószám")
                     "………………")))
  :injector   set-bookmark
  )


 (
  :field      "TK neve az elsõ oldal fejlécében"
  :target     ""
  :row-args   ("Vállalat hosszú megnevezése")
  :literals   ()
  :plist-keys (:tk-leaders)
  :generator  (lambda (tkn tk-leaders)
                (let ((tk (tks-row tk-leaders tkn "TK")))  ; TKS-ROW fn-t át kell írni hogy ne obj-ban keressen
                  (when tk
                    (astring-upcase (first (str:words tk))))))
  :injector   set-bookmark-in-first-page-header ;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  )


 (
  :field      "TK székhely az elsõ oldal láblécében"
  :target     ""
  :row-args   ("Vállalat hosszú megnevezése")
  :literals   ()
  :plist-keys (:tk-leaders)
  :generator  (lambda (tkn tk-leaders)
                (tks-row tk-leaders tkn "Székhely") ;;;;;;;;;;;;;;;;;;
  :injector   set-bookmark-in-first-page-footer ;;;;;;;;;;;;;;;;;;;;;;;
  )


 (
  :field      "Törzskönyvi azonosító szám az elsõ oldal láblécében"
  :target     ""
  :row-args   ("Vállalat hosszú megnevezése")
  :literals   ()
  :plist-keys (:tk-leaders)
  :generator  (lambda (tkn tk-leaders)
                (let ((tsz (tks-row tk-leaders tkn "Törzsszám")))
                  (when tsz (round tsz))))
  :injector   set-bookmark-in-first-page-footer ;;;;;;;;;;;;;;;;;;;;;;;
  )


 (
  :field      "Foglalkoztatott neve a címzésben"
  :target     ""
  :row-args   ("Név")
  :literals   ()
  :plist-keys ()
  :generator  clean-name
  :injector   set-bookmark
  )


 (
  :field      "Foglalkoztatott születési neve a címzésben"
  :target     ""
  :row-args   ("Születési vezetéknév" "Születési utónév" "2.születési utónév")
  :literals   ()
  :plist-keys ()
  :generator  (lambda (surname first-name middle-name)
                (clean-name (str:unwords
                             (list surname first-name middle-name))))
  :injector   set-bookmark
  )


 (
  :field      "Foglalkoztatott születési helye és ideje a címzésben"
  :target     ""
  :row-args   ("Születési hely" "Születési dátum")
  :literals   ()
  :plist-keys ()
  :generator  (lambda (place-of-birth date-of-birth)
                (concatenate 'string (clean-city place-of-birth) ", "
                             (excel-date-string date-of-birth :words t)))
  :injector   set-bookmark
  )


 (
  :field      "Foglalkoztatott anyja neve a címzésben"
  :target     ""
  :row-args   ("Anya" "Anyja keresztneve" "Anyja 2.keresztneve")
  :literals   ()
  :plist-keys ()
  :generator  (lambda (surname first-name middle-name)
                (clean-name (str:unwords
                             (list surname first-name middle-name))))
  :injector   set-bookmark
  )


 (
  :field      "Kinevezés jellegéhez kapcsolódó jogszabályi hivatkozás"
  :target     ""
  :row-args   ("Kinevezés/szerzõdés jellege")
  :literals   ()
  :plist-keys ()
  :generator  (lambda (type)
                (if (string= type "Határozatlan id.kine")
                  ""
                  "és 40. § (1)-(3) bekezdése "))
  :injector   set-bookmark
  )


 (
  :field      "Belépés dátuma"
  :target     ""
  :row-args   ("Belépés dátuma")
  :literals   ()
  :plist-keys ()
  :generator  (lambda (d)
                (excel-date-string d :words t))
  :injector   set-bookmark
  )


 (
  :field      "TK (foglalkoztató) neve"
  :target     ""
  :row-args   ("Vállalat hosszú megnevezése")
  :literals   ()
  :plist-keys ()
  :generator  (lambda (tkn)
                (add-article
                 (first (str:words a))))
  :injector   set-bookmark
  )


 (
  :field      "Kinevezés jellege"
  :target     ""
  :row-args   ("Kinevezés/szerzõdés jellege" "Szerz.vége" "Hely.dolg.neve.")
  :literals   ()
  :plist-keys ()
  :generator  (lambda (form end-date replaced)
                (if (string= form "Határozatlan id.kine")
                  "határozatlan idejû"
                  (format nil "~a tartósan távollévõ helyettesítése céljából határozott ideig, várhatóan ~a napjáig tartó"
                          (if (empty-cell-p replaced)
                            "………………"
                            (astring-capitalize replaced))
                          (if (empty-cell-p end-date)
                            "………………"
                            (excel-date-string end-date :words t)))))
  :injector   set-bookmark
  )


 (
  :field      "Próbaidõ"
  :target     ""
  :row-args   ("SZK" "Belépés dátuma" "Próbaidõ  vége")
  :literals   ()
  :plist-keys ()
  :generator  (lambda (szk bd pv)
                (let* ((pv-str (if (empty-cell-p pv)
                                 "………"
                                 (excel-date-string pv :words t)))
                       (period (concatenate 'string
                                            (excel-date-string bd :words t) " napjától " pv-str))
                       (b1-prob (concatenate 'string
                                             "^MA munka törvénykönyvérõl szóló 2012. évi I. törvény (a továbbiakban: Mt.) 45. § (5) bekezdése alapján a felek " period " napjáig terjedõ próbaidõt kötnek ki, amely idõtartam alatt a munkaviszonyt az Mt. 79. § (1) bekezdésének a) pontja alapján bármelyik fél azonnali hatályú felmondással – indokolás nélkül – megszüntetheti.^M^M"))
                       (bx-prob (concatenate 'string
                                             "^MA Púétv. 41. § (1) bekezdése alapján " period " napjáig tartó próbaidõt kötök ki, amely idõtartam alatt a köznevelési foglalkoztatotti jogviszonyt a Púétv. 41. § (4) bekezdése és 46. § (2) bekezdésének a) pontja alapján bármelyik fél indokolás nélkül azonnali hatállyal megszüntetheti.^M^M")))
                  (if (string= szk "B1")
                    (if (empty-cell-p pv)
                      ""
                      b1-prob)
                  ;; Other categories of personel
                  (if (empty-cell-p pv)
                    "^MA …-jogszabály-… alapján próbaidõ nem köthetõ ki.^M^M"
                    bx-prob))))
  :injector   set-bookmark
  )


 (
  :field      "Munkakör"
  :target     ""
  :row-args   (:y)
  :literals   ()
  :plist-keys ()
  :generator  (lambda (mk)
                (str:unwords (str:words
                  (str:trim mk))))
  :injector   set-bookmark
  )


 (
  :field      "Munkavégzés helye"
  :target     ""
  :row-args   ("szervezeti egys hosszú megnev." "Szervezeti egység OM azonosító"
               "Szerv.egység feladat ellát hel")
  :literals   ()
  :plist-keys (:kir-file)
  :generator  (lambda (a b c kir-file)
                (if (and (not (empty-cell-p b))
                         (not (empty-cell-p c))
                         kir-file)
                  ;; Taking data from the KIR spreadsheet
                  (let ((kir-row
                         (select-row
                          kir-file
                          #'(lambda (row)
                              (and 
                               (= (parse-number b) (parse-number (xcref row "OM azonosító")))
                               (= (parse-number c) (parse-number
                                                    (xcref row "A feladatellátási hely sorszáma"))))))))
                    (if (and kir-row (not (xarray-zero-index-p kir-row)))
                      (xcref kir-row "A feladatellátási hely megnevezése")
                      (str:unwords (str:words (str:trim a)))))
                  ;; Taking data from SAP
                  (str:unwords (str:words (str:trim a)))))
  :injector   set-bookmark
  )


 (
  :field      "Munkavégzési hely címe"
  :target     ""
  :row-args   ("Szervezeti egység OM azonosító" "Szerv.egység feladat ellát hel")
  :literals   ()
  :plist-keys (:kir-file)
  :generator  (lambda (a b kir-file)
                (if (and (not (empty-cell-p a))
                         (not (empty-cell-p b))
                         (string/= kir-file ""))
                  ;; Feladatellátási hely címe
                  (let ((kir-row (select-row
                                  kir-file
                                  #'(lambda (row)
                                      (and 
                                       (= (parse-number a) (parse-number (xcref row "OM azonosító")))
                                       (= (parse-number b) (parse-number
                                                            (xcref row "A feladatellátási hely sorszáma"))))))))
                    (if (and kir-row
                             (not (xarray-zero-index-p kir-row)))
                      (format nil "~D ~a, ~a"
                              (round (xcref kir-row "A feladatellátási hely irányítószáma"))
                              (xcref kir-row "A feladatellátási hely települése")
                              (xcref kir-row "A feladatellátási hely pontos címe"))
                      "cím"))
                  ;; Nincs cím
                  "cím"))
  :injector   set-bookmark
  )


 (
  :field      "Heti munkaidõ (óra)"
  :target     ""
  :row-args   ("Heti óra")
  :literals   ()
  :plist-keys ()
  :generator  (lambda (mi)
                (if (= mi (round mi))
                  (format nil "~d" (round mi))
                  (str:replace-first "." "," (format nil "~,2f" mi))))
  :injector   set-bookmark
  )


 (
  :field      "Teljes/rész/csökkentett munkaidõ" ; Többször volt hívva. Átírni!
  :target     ""
  :row-args   ("Heti óra")
  :literals   ()
  :plist-keys ()
  :generator  (lambda (mi)
                (if (= mi 40)
                  "teljes munkaidõ "
                  "")
  :injector   set-bookmark
  )


 (
  :field      "FEOR szám"
  :target     ""
  :row-args   ("FEOR-sz.s.")
  :literals   ()
  :plist-keys ()
  :generator  (lambda (feor)
                (str:unwords (str:words
                  (str:trim feor))))
  :injector   set-bookmark
  )


 (
  :field      "Besorolási fokozat"
  :target     ""
  :row-args   ("Bérrendsz. csop név")
  :literals   ()
  :plist-keys ()
  :generator  (lambda (bf)
                (str:unwords (str:words
                  (str:trim bf))))
  :injector   set-bookmark
  )


 (
  :field      "Gyakornoki idõ"
  :target     ""
  :row-args   ("Bérrendsz. csop név" "Belépés dátuma" "Határidõ")
  :literals   ()
  :plist-keys ()
  :generator  (lambda (besor bd vh)
                (let ((bd-str (excel-date-string bd :words t))
                      (vh-str (if (empty-cell-p vh)
                                "………………"
                                (excel-date-string vh :words t))))
                  (if (string= besor "Gyakornok")
                    (concatenate 'string
                                 "^MA  pedagógusok új életpályájáról szóló 2023. évi LII. törvény végrehajtásáról szóló 401/2023. (VIII. 30.) Korm. rendelet (a továbbiakban: Púétv. vhr.) 37. § (1)-(13) bekezdése alapján az Ön gyakornoki ideje " bd-str " napjától ………………  napjáig tart, minõsítõ vizsgát " vh-str " napjáig köteles tenni. Amennyiben a minõsítõ vizsgája sikeres, a Púétv. vhr. 37. § (8) bekezdése alapján Önt Pedagógus I. fokozatba kell besorolni.^M^M")
                    "")))
  :injector   set-bookmark
  )


 (
  :field      "Kétoldalú illetménymódosítás kezdõdátuma"
  :target     ""
  :row-args   ()
  :literals   ()
  :plist-keys (:mod-start)
  :generator  identity
  :injector   set-bookmark
  )


 (
  :field      "Jogszabályi hivatkozás illetmény megállapításához"
  :target     ""
  :row-args   ("SZK" "Bérrendsz. csop név" "Esélyteremtési illetményrészre" "CÍm")
  :literals   ()
  :plist-keys (:fees :coderefs :codenames)
  :generator  (lambda (szk bes eila titl fees coderefs codenames)
                (let* ((fees*  (remove-incorrect-1125 fees)) ; használja obj-ot, átírni!
                       (deftvs (if (string= bes "Gyakornok")
                                 '("1puetv" "2puetv-vhr")
                                 '("1puetv")))
                       (codes  (mapcar #'(lambda (fee) (getf fee :code)) fees*))
                       (fees/  (cref::fees coderefs :codes codes :ps szk :lab bes :eila eila :titl titl))
                       (text   (cref::convert fees/ coderefs codenames deftvs)))
                  text))
  :injector   set-bookmark
  )


 (
  :field      "Jogszabályi hivatkozás teljesítményértékeléshez"
  :target     ""
  :row-args   ("SZK" "Bérrendsz. csop név" "Esélyteremtési illetményrészre" "CÍm")
  :literals   ()
  :plist-keys (:fees :coderefs)
  :generator  (lambda (szk bes eila titl fees coderefs)
                (let/ ((fees* (remove-incorrect-1125 fees obj))
                       (codes (mapcar #'(lambda (fee) (getf fee :code)) fees*))
                       (fees/  (cref::fees coderefs :codes codes :ps szk :lab bes :eila eila :titl titl)))
                  (if (or (member :ter-illemeles-ped fees/)
                          (member :ter-illemeles-pednoks fees/))
                    ", a 2024/2025. tanítási évre vonatkozó teljesítményértékelésének eredményére"
                    "")))
  :injector   set-bookmark
  )


 (
  :field      "Illetményelemek listája"
  :target     ""
  :row-args   ("Belépés dátuma" "Szerz.vége" "Esélyteremtési illetményrészre")
  :literals   ()
  :plist-keys (:fees :mod-start)
  :generator  (lambda (bd hiv eila fees mod-start)
                (let* ((fees*   (remove-incorrect-1125 fees))
                       (ordered (sort-fees fees* cref::*puetv-b1b2b8b9-illetmenyelemek-current-sorrend*))
                       (total   0)
                       (digest  (mapcar #'(lambda (fee)
                                            (destructuring-bind (&key code name sum measure end titl cstart) fee
                                              (declare (ignore name))
                                              (incf total sum)
                                              (append
                                               ;; Ill.e. megnevezés
                                                  ;; CREF FORRÁS OBJ-BAN????
                                               (list (fee-name code eila titl cref::*puetv-b1b2b8b9-illetmenyelemek-current*)
                                                     ;; Összeg
                                                     (currency sum))
                                               ;; Megállapítás idõszak kezdete:
                                               ;;   Havi ill., mesterfok vagy TÉR: nem kell feltüntetni.
                                               (cond ((member code '("1P00" "1116" "1125") :test #'string=)
                                                      nil)
                                                     ;; Esélyteremtési v. egyes tantárgyak után járó:
                                                     ;;   belépés dátuma vagy tanévkezdet (amelyik késõbbi)
                                                     ((member code '("1114" "1115") :test #'string=)
                                                      (list
                                                       (if (> (hudate->unitime (excel-date bd))
                                                              (hudate->unitime (parse-hudate mod-start)))
                                                         (excel-date-string bd :words t)
                                                         mod-start)))
                                                     ;; Egyébként: ill.érvényesség kezdete; ha nincs: belépés dátuma.
                                                    (t (list (excel-date-string (or cstart bd) :words t))))
                                               ;; Vége dátum:
                                               ;;   Esélyteremtési v. egyes tantárgyak után járó:
                                               ;;     ha határozott idõ vége meg van adva és kisebb mint tanév vége:
                                               ;;       hat.idõ vége
                                               ;;     különben:
                                               ;;       tanév vége
                                               (cond ((member code '("1114" "1115") :test #'string=)
                                                      (let ((end (apply #'ccoffice:date-to-excel-serial 
                                                                        (school-year-end (parse-hudate
                                                                                          (get-state obj :mod-start))))))
                                                        (list (excel-date-string
                                                               (if (empty-cell-p hiv)
                                                                 end
                                                                 (min end hiv))
                                                               :words t))))
                                                     ;; Egyébként, ha nem havi illetmény, és az ill.érv.vége
                                                     ;;   meg van adva és nem 9999.12.31:
                                                     ;;     ill.érv. vége
                                                     ((and
                                                       (string/= code "1P00")
                                                       (not (empty-cell-p end))
                                                       (/= end 2958465))
                                                      (list (excel-date-string end :words t)))
                                                     ;; Egyébként: nem kell feltüntetni.
                                                     ;; TÖMEGES RÖGZÍTÉSNÉL GYAKRAN HATÁROZOTT IDÕ VÉGE UTÁN DÁTUM
                                                     ;; KERÜLT RÖGZÍTÉSRE ÉRVÉNYESSÉG VÉGEKÉNT, EZÉRT NEM JELENIK MEG!!!
                                                     (t nil)))))
                                        ordered))
                       (lines  '()))
                  (dolist (cookin digest)
                    (destructuring-bind (name sum &optional measure end) cookin
                      (push (format nil "~a:~C~a~CFt~C" name #\tab sum #\tab #\return) lines)
                      (when measure
                        (if end
                          (push (format nil "megállapításának idõszaka: ~a napjától ~a napjáig~C" measure end #\return) lines)
                          (push (format nil "megállapításának idõszaka: ~a napjától~C" measure #\return) lines)))))
                  (push (format nil "Illetmény összesen:~C~a~CFt" #\tab (currency total) #\tab) lines)
                  (apply #'concatenate 'string
                         (nreverse lines)))))
  :injector   set-bookmark
  )


 (
  :field      "Helységnév az aláírásban"
  :target     ""
  :row-args   ("Vállalat hosszú megnevezése")
  :literals   ()
  :plist-keys (:tk-leaders)
  :generator  (lambda (tkn tk-leaders)
                (tks-row tk-leaders tkn "Helységnév"))
  :injector   set-bookmark
  )


 (
  :field      "TK igazgató"
  :target     ""
  :row-args   ("Vállalat hosszú megnevezése")
  :literals   ()
  :plist-keys (:tk-leaders)
  :generator  (lambda (tkn tk-leaders)
                (tks-row tk-leaders tkn "TK ig"))
  :injector   set-bookmark
  )


 (
  :field      "Gazdasági vezetõ"
  :target     ""
  :row-args   ("Vállalat hosszú megnevezése")
  :literals   ()
  :plist-keys (:tk-leaders)
  :generator  (lambda (tkn tk-leaders)
                (tks-row tk-leaders tkn "Gazdasági vez."))
  :injector   set-bookmark
  )


 (
  :field      "Foglalkoztatott neve az aláírásban"
  :target     ""
  :row-args   ("Név")
  :literals   ()
  :plist-keys ()
  :generator  clean-name
  :injector   set-bookmark
  )


 (
  :field      "TK neve"
  :target     ""
  :row-args   ("Vállalat hosszú megnevezése")
  :literals   ()
  :plist-keys ()
  :generator  (lambda (tkn)
                (add-article (first (str:words tkn))))
  :injector   set-bookmark
  )


 (
  :field      "TK székhely"
  :target     ""
  :row-args   ("Vállalat hosszú megnevezése")
  :literals   ()
  :plist-keys (:tk-leaders)
  :generator  (lambda (tkn tk-leaders)
                (tks-row tk-leaders tkn "Székhely"))
  :injector   set-bookmark
  )


 (
  :field      "Törzsszám"
  :target     ""
  :row-args   ("Vállalat hosszú megnevezése")
  :literals   ()
  :plist-keys (:tk-leaders)
  :generator  (lambda (tkn tk-leaders)
                (let ((tsz (tks-row tk-leaders tkn "Törzsszám")))
                  (when tsz (round tsz))))
  :injector   set-bookmark
  )


 (
  :field      "Valamilyen jogsz. hivatkozás a bérminimum alapján?"
  :target     ""
  :row-args   ("Heti óra")
  :literals   ()
  :plist-keys (:fees)
  :generator  (lambda (ho fees)
                (let* ((sum  (getf (first fees) :sum))
                       (prop (* 100 (round (* (/ sum ho) 40) 100))))
                  (if (< prop 348800)
                    ""
                    ", valamint a pedagógusok új életpályájáról szóló 2023. évi LII. törvény (a továbbiakban: Púétv.) végrehajtásáról szóló 401/2023. (VIII. 30.) Korm. rendelet 95. § (1) bekezdése")))
  :injector   set-bookmark
  )


 (
  :field      "Púétv. hosszú vagy rövid megnevezés"
  :target     ""
  :row-args   ("Heti óra")
  :literals   ()
  :plist-keys (:fees)
  :generator  (lambda (ho fees)
                (let* ((sum  (getf (first fees) :sum))
                       (prop (* 100 (round (* (/ sum ho) 40) 100))))
                  (if (< prop 348800)
                    "pedagógusok új életpályájáról szóló 2023. évi LII. törvény"
                    "Púétv.")))
  :injector   set-bookmark
  )


 (
  :field      "Kitti elõzõ jogviszonyok"
  :target     ""
  :row-args   ("SZTSZ" "Jv.kezd.fiz.fokozathoz" "Jv.kezd.jubileumhoz" "Jv.kezd.végkielégítéshez")
  :literals   ()
  :plist-keys (:prevrels)
  :generator  (lambda (sztsz date-cl date-bonus date-sever prevrels)
                (let ((found (select-row prevrels #'(lambda (row)
                                                      (let ((s (xcref row "Szem.ügyi törzsszám")))
                                                        (and (not (empty-cell-p s))
                                                             (= (parse-number sztsz)
                                                                (parse-number s))))))))
                  (if (and found (not (zerop (xarray-indexed-height found))))
                    (let ((result (make-string-output-stream)))
                      ;; Korábbi jogviszonyok
                      (do-xarows (row r found)
                        (destructuring-bind (year month day)
                            (mapcar #'(lambda (col) (xcref row col)) '(7 8 9))
                          (let ((all  (format nil "~a év ~a hó ~a nap" year month day))
                                (none (format nil "0 év 0 hó 0 nap")))
                            (destructuring-bind (classification jubilee-bonus severance-pay)
                                (mapcar #'(lambda (col) (not (empty-cell-p (xcref row col)))) '(14 11 18))
                              (apply #'format result "~a~%Jogviszony idõtartama: ~a naptól ~a napig~%Megszûnés módja: ~a~%Elismert jogcím:~%"
                                     (mapcar #'(lambda (col fn)
                                                 (funcall fn (xcref row col)))
                                             '(6 4 5 12)
                                             (list #'identity #'excel-date-string #'excel-date-string #'identity)))
                              (apply #'format result " - besoroláshoz: ~a~% - jubileumi jutalomhoz, felmentési idõhöz: ~a~% - végkielégítéshez: ~a~%~%"
                                     (mapcar #'(lambda (valid)
                                                 (if valid all none))
                                             (list classification jubilee-bonus severance-pay)))))))
                      ;; Kezdõdátumok
                      (apply #'format result "A közalkalmazotti jogviszonyának számított kezdõ idõpontja~% - besoroláshoz: ~a~% - jubileumi jutalomra való jogosultsághoz, felmentési idõhöz: ~a~% - végkielégítés megállapításához: ~a~%"
                             (mapcar #'excel-date-string (list date-cl date-bonus date-sever)))
                      ;; Eredmény
                      (get-output-stream-string result))
                    "<><><>")))
  :injector   set-bookmark
  )

)
