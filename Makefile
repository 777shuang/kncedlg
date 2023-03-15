7SWINUTIL=7swinutil
KNCEUTIL=knceutil
ifeq ($(OUTPUT),)
	OUTPUT=kncedlg
endif

$(OUTPUT).dll: knceappdlg.o kncecapkeydlg.o kncedirdlg.o kncedlg.o kncefiledlg.o kncefontdlg.o kncewaitbox.o kncedlg.res.o $(7SWINUTIL)/$(7SWINUTIL).dll $(KNCEUTIL)/$(KNCEUTIL).dll
	arm-mingw32ce-g++ -s -O3 -march=armv5tej -mcpu=arm926ej-s -shared -o $@ $^

knceappdlg.o: knceappdlg.cpp kncedlg.hpp
	arm-mingw32ce-g++ -s -O3 -march=armv5tej -mcpu=arm926ej-s -c -o $@ $<

kncecapkeydlg.o: kncecapkeydlg.cpp kncedlg.hpp
	arm-mingw32ce-g++ -s -O3 -march=armv5tej -mcpu=arm926ej-s -c -o $@ $<

kncedirdlg.o: kncedirdlg.cpp kncedlg.hpp
	arm-mingw32ce-g++ -s -O3 -march=armv5tej -mcpu=arm926ej-s -c -o $@ $<

kncedlg.o: kncedlg.cpp kncedlg.hpp
	arm-mingw32ce-g++ -s -O3 -march=armv5tej -mcpu=arm926ej-s -c -o $@ $<

kncefiledlg.o: kncefiledlg.cpp kncedlg.hpp
	arm-mingw32ce-g++ -s -O3 -march=armv5tej -mcpu=arm926ej-s -c -o $@ $<

kncefontdlg.o: kncefontdlg.cpp kncedlg.hpp
	arm-mingw32ce-g++ -s -O3 -march=armv5tej -mcpu=arm926ej-s -c -o $@ $<

kncewaitbox.o: kncewaitbox.cpp kncedlg.hpp
	arm-mingw32ce-g++ -s -O3 -march=armv5tej -mcpu=arm926ej-s -c -o $@ $<

kncedlg.res.o:
	arm-mingw32ce-windres kncedlg.res -o $@

$(7SWINUTIL)/$(7SWINUTIL).dll: $(7SWINUTIL)
	make -C $(7SWINUTIL) --eval=OUTPUT=$(7SWINUTIL)

$(KNCEUTIL)/$(KNCEUTIL).dll: $(KNCEUTIL)
	make -C $(KNCEUTIL) --eval=OUTPUT=$(KNCEUTIL)