module RedesHelper

	def BuscaPessoas(id)

	dados = Rede.where(:parent_id => id)

		if dados

			html = '<ul>'

			dados.each do |dados_pessoas|

			html += '<li>'

			html += '<a href="'+redeslist_path(dados_pessoas.cadastro.id)+'">' + dados_pessoas.cadastro.nomepessoa + '</a>'

			html +=BuscaPessoas(dados_pessoas.id)

			html += '</li>'

			end

			html += '</ul>'
		end
			
		html = html.gsub('<ul></ul>', '')

		html.html_safe

	end
end
