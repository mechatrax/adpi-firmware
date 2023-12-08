DTC      = dtc
DTCFLAGS = -@ -I dts -O dtb
OVERLAYS = adpipro-cs0.dtbo adpipro-cs1.dtbo

all: $(OVERLAYS)

adpipro-cs0.dtbo: adpipro-cs0.dts
adpipro-cs1.dtbo: adpipro-cs1.dts

%.dtbo: %.dts
	$(DTC) $(DTCFLAGS) -o $@ $<

install: $(OVERLAYS)
	install -d $(DESTDIR)/boot/firmware/overlays
	install -m 644 $(OVERLAYS) $(DESTDIR)/boot/firmware/overlays

clean:
	rm -f *.dtbo
