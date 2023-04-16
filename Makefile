default: images

build/.make: \
	build/system_context.png \
	build/wallet_containers.png \
	build/bot_containers.png \
	build/chat_containers.png \
	build/transaction_flow.png
	touch $@

images: build/.make

build/%.png: src/%.puml src/std.puml
	mkdir -p $(dir $<)
	plantuml $< -o $(shell pwd)/build

.PHONY: images
