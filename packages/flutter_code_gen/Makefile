# Định nghĩa màu sắc và nền
RED    := \033[31m
GREEN  := \033[32m
YELLOW := \033[33m
BLUE   := \033[34m
PURPLE := \033[35m
CYAN   := \033[36m
WHITE  := \033[37m
BOLD   := \033[1m
UNDERLINE := \033[4m
RESET  := \033[0m

.PHONE: check-brefore-publish
check-brefore-publish:
	@echo "$(GREEN)Starting format code ... $(RESET)"
	dart format .
	@echo "$(GREEN)Starting analyze code ...$(RESET)"
	dart analyze
	@echo "$(GREEN)Starting test ...$(RESET)"
	flutter test
	@echo "$(GREEN)Starting check before publish ...$(RESET)"
	dart pub publish --dry-run
	@echo "$(GREEN)Starting generate document ...$(RESET)"
	dart doc
	@echo "$(GREEN)Clean project ...$(RESET)"
	flutter clean

.PHONE: test
test:
	flutter test

.PHONE: publish
publish:
	dart pub publish
