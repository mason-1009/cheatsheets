# Install and manage Node dependencies for linting
install:
	npm install

update:
	npm update

# Performs linting while ignore non-Markdown files
lint:
	npx markdownlint '**/*.md' --ignore node_modules
