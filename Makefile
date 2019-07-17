DTC      = dtc
DTCFLAGS = -@ -I dts -O dtb
OVERLAYS = adpipro-cs0.dtbo adpipro-cs1.dtbo

all: $(OVERLAYS)

adpipro-cs0.dtbo: adpipro-cs0.dts
adpipro-cs1.dtbo: adpipro-cs1.dts

%.dtbo: %.dts
	$(DTC) $(DTCFLAGS) -o $@ $<

install: $(OVERLAYS)
	install -d $(DESTDIR)/boot/overlays
	install -m 644 $(OVERLAYS) $(DESTDIR)/boot/overlays

clean:
	rm -f *.dtbo
