And (/^I will press \"Excluir\" link for the comment that I want to delete$/) do
	find(".delete-Robot").click
end

Then (/^My comment should be deleted/) do
	expect(page).to_not have_content("Comentário teste")
end