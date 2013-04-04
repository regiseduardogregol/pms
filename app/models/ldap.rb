class LDAP
	HOST = "ldap.itai.org.br"
	#cn=admins,ou=itai,
	BASE_COMPONENTS = "dc=org,dc=br"
	BASE_ROOT = "ou=itai,dc=org,dc=br"
	
	class << self
		
		# Faz a autenticação do usuário
		def authenticate(username, password)
			auth = Net::LDAP.new host: HOST, auth: {method: :simple, username: "uid=#{username},#{BASE_ROOT}", password: password}
			
			# Verifica se o usuário pertence ao grupo e se suas credenciais são válidas
			if auth.bind && authorized?(username)
				conn = new_connection

				# Retorna o objeto do usuário do LDAP
				conn.search(base: BASE_ROOT, filter: "(uid=#{username})")[0]
			else
				false # Usuário inválido
			end
		end

		private

		# Verifica se o usuário pertence ao grupo 'grupo-componentes' do LDAP
		def authorized?(username)
			conn = new_connection

			# Realiza o filtro dos usuários pelo 'memberuid'
			filter = Net::LDAP::Filter.eq("memberuid", username)

			# Retorna true caso o usuário pertença ao grupo, e false caso contrário
			not conn.search(base: BASE_COMPONENTS, filter: filter).empty?
		end

		# Cria uma conexão com o LDAP, como usuário anonymous
		def new_connection
			Net::LDAP.new host: HOST
		end
	end

end