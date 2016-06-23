# Esse teste deve acontecer depois do criar tópico e do criar comentário
# E também deve vir antes do editar tópico


Feature: Comment Denunciation
	To denounce a comment
	As a system user
	I would like denounce one specific comment


	Scenario: Denounce a specific comment
		Given I am logged on in topics of "OI Fixo" company page
		And I will click on "Dúvida" link
		And I am redirected to topic page
		And I will press on "Denunciar comentário" icon
		And I will confirm pressing 'OK'
		And I will press on "Tirar denúncia do comentário" icon
		Then I should see "Denunciar" icon

