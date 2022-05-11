namespace :list do
  desc "Remove lists added by students"
  task destroy_extra: :environment do
    lists = List.where('id > ?', 40)
    lists.destroy_all
  end

end
