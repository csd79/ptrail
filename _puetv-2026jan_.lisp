;;; ---------------------------------------------------------------
;;; PÚÉTV illetményelemek variációi:
;;; A :META beágyazott listában szereplõ értékek alapján azonosítjuk be az érvényes :ID-ket.
;;; A :NAME és :REFS beágyazott listákban lévõ értékek segítségével generáljuk a jogszabályi
;;; hivatkozás szövegét, ha az érvényes :ID-ket már azonosítottuk.


'(
  (:id   :havi-ill-gyakornok
   :name "Havi illetmény"
   :meta (:code ("1P00")
          :ps   ("B2")
          :lab  ("Gyakornok"))
   :refs ((:tv "1puetv" :par "98" :bek "1")
          (:tv "2puetv-vhr" :par "88" :bek "1")))
  
  
  (:id   :havi-ill-ped1-kutato
   :name "Havi illetmény"
   :meta (:code ("1P00")
          :ps   ("B2")
          :lab  ("Pedagógus I." "Pedagógus II." "Mesterpedagógus" "Kutatótanár"))
   :refs ((:tv "1puetv" :par "98" :bek "2")
          (:tv "2puetv-vhr" :par "88/A" :bek "1")))
  
  
  (:id   :mesterfok-illnov
   :name "Mesterfokozatért járó illetménynövekedés"
   :meta (:code ("1116")
          :ps   ("B2" "B8"))
   :refs ((:tv "2puetv-vhr" :par "95/A" :bek "1")))
  
  
  (:id   :egyes-tantrgy-illnov
   :name "Egyes tantárgyak után járó illetménynövekedés"
   :meta (:code ("1114")
          :ps   ("B2"))
   :refs ((:tv "2puetv-vhr" :par "95/A" :bek "2")
          (:tv "2puetv-vhr" :par "95/A" :bek "4")))
  
  
  (:id   :palyakezdes-illnov
   :name "Pályakezdés után járó illetménynövekedés"
   :meta (:code ("1113")
          :ps   ("B2")
          :lab  ("Gyakornok"))
   :refs ((:tv "2puetv-vhr" :par "95/A" :bek "6")))
  
  
  (:id   :eselyteremt-illr-terulet
   :name "Esélyteremtési illetményrész"
   :meta (:code ("1115")
          :ps   ("B2")
          :eila ("Kedvezményezett vagy felzárkózó településen történõ feladatellátás"))
   :refs ((:tv "1puetv" :par "98" :bek "5" :pont "a")
          (:tv "2puetv-vhr" :par "88" :bek "3")
          (:tv "2puetv-vhr" :par "88" :bek "4")
          (:tv "2puetv-vhr" :par "88" :bek "6")))
  
  
  (:id   :eselyteremt-illr-feladat
   :name "Esélyteremtési illetményrész"
   :meta (:code ("1115")
          :ps   ("B2")
          :eila ("IPR-program keretébe tartozó feladatellátás"))
   :refs ((:tv "1puetv" :par "98" :bek "5" :pont "b")
          (:tv "2puetv-vhr" :par "88" :bek "4")
          (:tv "2puetv-vhr" :par "88" :bek "5")
          (:tv "2puetv-vhr" :par "88" :bek "6")))
  
  
  (:id   :ter-illemeles-ped
   :name "Teljesítményértékelés alapján megállapított illetményemelés"
   :meta (:code ("1125")
          :ps   ("B2")
          :lab  ("Pedagógus I." "Pedagógus II." "Mesterpedagógus" "Kutatótanár"))
   :refs ((:tv "1puetv" :par "98" :bek "3")
          (:tv "5terill-182-2025-kr" :par "2" :bek "1")
          (:tv "5terill-182-2025-kr" :par "2" :bek "2")
          ))
  
  
  (:id   :ter-illemeles-pednoks
   :name "Teljesítményértékelés alapján megállapított illetményemelés"
   :meta (:code ("1125")
          :ps   ("B8")
          :lab  ("Pedagógus I." "Pedagógus II."))
   :refs ((:tv "1puetv" :par "98" :bek "3")
          (:tv "5terill-182-2025-kr" :par "2" :bek "1")
          (:tv "5terill-182-2025-kr" :par "2" :bek "2")
          ))
  
  
  (:id   :gyogyped-potl
   :name "Gyógypedagógiai pótlék"
   :meta (:code ("2587")
          :ps   ("B2" "B8" "B9"))
   :refs ((:tv "1puetv" :par "103" :bek "1")
          (:tv "1puetv" :mell "3" :pont "B")
          (:tv "2puetv-vhr" :par "90" :bek "3")
          (:tv "2puetv-vhr" :par "90" :bek "4a")))
  
  
  (:id   :diabetesz-ellat
   :name "Diabétesz ellátási pótlék"
   :meta (:code ("2598")
          :ps   ("B2" "B8" "B9"))
   :refs ((:tv "1puetv" :par "103" :bek "1")
          (:tv "1puetv" :mell "3" :pont "B")
          (:tv "2puetv-vhr"  :par "90" :bek "4")
          (:tv "3koznev-2011-cxc" :par "62" :bek "1b")))
  
  
  (:id   :nemzetisegi-potl
   :name "Nemzetiségi pótlék"
   :meta (:code ("2800")
          :ps   ("B2"))
   :refs ((:tv "1puetv" :par "103" :bek "1")
          (:tv "1puetv" :mell "3" :pont "B")
          (:tv "2puetv-vhr" :par "90" :bek "2")
          (:tv "2puetv-vhr" :par "90" :bek "4a")))
  
  
  (:id   :aj-thgond-prg
   :name "Arany János Tehetséggondozó Program pótléka"
   :meta (:code ("2586")
          :ps   ("B2"))
   :refs ((:tv "2puetv-vhr" :par "90" :bek "7")
          (:tv "4emmi-20-2012-viii31" :par "176" :bek "8")))
  
  
  (:id   :ofo-megbiz
   :name "Osztályfõnöki megbízási díj"
   :meta (:code ("2034")
          :ps   ("B2"))
   :refs ((:tv "1puetv" :par "102" :bek "1")
          (:tv "1puetv" :par "102" :bek "3" :pont "b")
          (:tv "2puetv-vhr" :par "90"  :bek "6")
          (:tv "2puetv-vhr" :par "90"  :bek "6a")))
  
  
  (:id   :koll-csopvez
   :name "Kollégiumi csoportvezetõi megbízási díj"
   :meta (:code ("2035")
          :ps   ("B2"))
   :refs ((:tv "1puetv" :par "102" :bek "1")
          (:tv "1puetv" :par "102" :bek "3" :pont "b")
          (:tv "2puetv-vhr" :par "90" :bek "6")
          (:tv "2puetv-vhr" :par "90" :bek "6a")))
  
  
  (:id   :tanszakvez
   :name "Tanszakvezetõi megbízási díj"
   :meta (:code ("2036")
          :ps   ("B2"))
   :refs ((:tv "1puetv" :par "102" :bek "1")
          (:tv "1puetv" :par "102" :bek "3" :pont "b")
          (:tv "2puetv-vhr" :par "90" :bek "6")
          (:tv "2puetv-vhr" :par "90" :bek "6a")))
  
  
  (:id   :mkkoz-vez
   :name "Munkaközösség-vezetõi megbízási díj"
   :meta (:code ("2037")
          :ps   ("B2"))
   :refs ((:tv "1puetv" :par "102" :bek "1")
          (:tv "1puetv" :par "102" :bek "3" :pont "c")
          (:tv "2puetv-vhr" :par "90" :bek "5")
          (:tv "2puetv-vhr" :par "90" :bek "6")
          (:tv "2puetv-vhr" :par "90" :bek "6a")))
  
  
  (:id   :cig
   :name "Címzetes igazgatói megbízási díj"
   :meta (:code ("2028")
          :ps   ("B2")
          :titl ("07"))
   :refs ((:tv "1puetv" :par "73" :bek "12")))
  
  
  (:id   :cfoig
   :name "Címzetes fõigazgatói megbízási díj"
   :meta (:code ("2026")
          :ps   ("B2")
          :titl ("08"))
   :refs ((:tv "1puetv" :par "73" :bek "12")))
  
  
  (:id   :ig
   :name "Igazgatói megbízási díj"
   :meta (:code ("2028")
          :ps   ("B2")
          :titl (""))
   :refs ((:tv "1puetv" :par "102" :bek "1")
          (:tv "1puetv" :par "102" :bek "2")))
  
  
  (:id   :foig
   :name "Fõigazgatói megbízási díj"
   :meta (:code ("2026")
          :ps   ("B2")
          :titl (""))
   :refs ((:tv "1puetv" :par "102" :bek "1")
          (:tv "1puetv" :par "102" :bek "2")))
  
  
  (:id   :ig-h
   :name "Igazgató-helyettesi megbízási díj"
   :meta (:code ("2029")
          :ps   ("B2"))
   :refs ((:tv "1puetv" :par "102" :bek "1")
          (:tv "1puetv" :par "102" :bek "3" :pont "a")))
  
  
  (:id   :foig-h
   :name "Fõigazgató-helyettesi megbízási díj"
   :meta (:code ("2027")
          :ps   ("B2"))
   :refs ((:tv "1puetv" :par "102" :bek "1")
          (:tv "1puetv" :par "102" :bek "3" :pont "a")))
  
  
  (:id   :tagint-ig
   :name "Tagintézmény-igazgatói megbízási díj"
   :meta (:code ("2030")
          :ps   ("B2"))
   :refs ((:tv "1puetv" :par "102" :bek "1")
          (:tv "1puetv" :par "102" :bek "4")))
  
  
  (:id   :integys-vez
   :name "Intézményegység-vezetõi megbízási díj"
   :meta (:code ("2031")
          :ps   ("B2"))
   :refs ((:tv "1puetv" :par "102" :bek "1")
          (:tv "1puetv" :par "102" :bek "4")))
  
  
  (:id   :tagint-ig-h
   :name "Tagintézményigazgató-helyettesi megbízási díj"
   :meta (:code ("2032")
          :ps   ("B2"))
   :refs ((:tv "1puetv" :par "102" :bek "1")
          (:tv "1puetv" :par "102" :bek "5")))
  
  
  (:id   :integys-vez-h
   :name "Intézményegységvezetõ-helyettesi megbízási díj"
   :meta (:code ("2033")
          :ps   ("B2"))
   :refs ((:tv "1puetv" :par "102" :bek "1")
          (:tv "1puetv" :par "102" :bek "5")))
  
  
  (:id   :pnoks-havi-ill-gyakornok
   :name "Havi illetmény"
   :meta (:code ("1P00")
          :ps   ("B8")
          :lab  ("Gyakornok"))
   :refs ((:tv "1puetv" :par "96" :bek "1")
          (:tv "1puetv" :par "96" :bek "2" :pont "a")
          (:tv "1puetv" :par "98" :bek "1")
          (:tv "2puetv-vhr" :par "88" :bek "1")))
  
  
  (:id   :havi-ill-ped1-2
   :name "Havi illetmény"
   :meta (:code ("1P00")
          :ps   ("B8")
          :lab  ("Pedagógus I." "Pedagógus II."))
   :refs ((:tv "1puetv" :par "96" :bek "1")
          (:tv "1puetv" :par "96" :bek "2" :pont "a")
          (:tv "1puetv" :par "98" :bek "2")
          (:tv "2puetv-vhr" :par "88/A" :bek "1")))
  
  
  (:id   :pnoks-noks-eselyt-illr
   :name "Esélyteremtési illetményrész"
   :meta (:code ("1115")
          :ps   ("B8" "B9"))
   :refs ((:tv "1puetv" :par "99" :bek "2")
          (:tv "1puetv" :par "98" :bek "5" :pont "a")
          (:tv "2puetv-vhr" :par "88" :bek "3")
          (:tv "2puetv-vhr" :par "88" :bek "4")
          (:tv "2puetv-vhr" :par "88" :bek "6")))
  
  
  (:id   :pnoks-noks-aj-thgond-prg
   :name "Arany János Tehetséggondozó Program pótléka"
   :meta (:code ("2586")
          :ps   ("B8" "B9"))
   :refs ((:tv "2puetv-vhr" :par "90" :bek "7")
          (:tv "4emmi-20-2012-viii31" :par "176" :bek "8"
           :megj "A jogszabályi rendelkezések a pedagógusokra vonatkoznak.")))
  
  
  (:id   :noks-havi-ill
   :name "Havi illetmény"
   :meta (:code ("1P00")
          :ps   ("B9"))
   :refs ((:tv "1puetv" :par "96" :bek "2" :pont "b")
          (:tv "1puetv" :par "99" :bek "1")
          (:tv "2puetv-vhr" :par "88" :bek "7")
          (:tv "2puetv-vhr" :par "95" :bek "1")))
  
  
  (:id   :mt-munkaber
   :name "Munkabér"
   :meta (:code ("1100")
          :ps   ("B1"))
   :refs ()))







;;; ---------------------------------------------------------------
;;; Az elõzõ lista :REFS beágyazott listáiban szereplõ :TV értékek járulékos adatai:
;;; rövidített név és teljes név.


'((:tv    "1puetv"
   :short "Púétv."
   :full  "pedagógusok új életpályájáról szóló 2023. évi LII. törvény (a továbbiakban: Púétv.)")
    
  (:tv    "2puetv-vhr"
   :short "Púétv. vhr."
   :full  "pedagógusok új életpályájáról szóló 2023. évi LII. törvény végrehajtásáról szóló 401/2023. (VIII. 30.) Korm. rendelet (a továbbiakban: Púétv. vhr.)")
    
  (:tv    "3koznev-2011-cxc"
   :short "???"
   :full  "nemzeti köznevelésrõl szóló 2011. évi CXC. törvény")
    
  (:tv    "4emmi-20-2012-viii31"
   :short "???"
   :full  "nevelési-oktatási intézmények mûködésérõl és a köznevelési intézmények névhasználatáról szóló 20/2012. (VIII. 31.) EMMI rendelet")

  (:tv    "5terill-182-2025-kr"
   :short "???"
   :full  "2024/2025. tanévi teljesítményértékelés alapján történõ illetmény kifizetésérõl és egyes köznevelési tárgyú kormányrendeletek módosításáról szóló 182/2025. (VI. 30.) Korm. rendelet")
  )







;;; ---------------------------------------------------------------
;;; A hivatkozások megjelenítésének sorrendje a :META / :CODE érték alapján.


'("1P00" "1116" "1114" "1113" "1115" "1125" "2587" "2598" "2800" "2586" "2034" "2035" "2036" "2037" "2028" "2026" "2029" "2027" "2030" "2031" "2032" "2033" "1100")
