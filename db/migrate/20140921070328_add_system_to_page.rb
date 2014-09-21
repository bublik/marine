class AddSystemToPage < ActiveRecord::Migration
  def up
    add_column :pages, :system, :boolean, default: false
    ['vacancies', 'crewing', 'feedback', 'home'].each do |url|
      page = Page.find_by(url: url) || Page.new()
      page.update(url: url,
                  title: url,
                  title_ru: url + ' RU',
                  content: "Content for #{url} EN",
                  content_ru: "Содержание #{url} RU",
                  system: true)
    end
  end

  def down
    remove_column :pages, :system
  end
end
