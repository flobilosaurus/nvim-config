local lspsignature_setup, lspsignature = pcall(require, "lsp_signature")
if not lspsignature_setup then
	return
end

lspsignature.setup({})
