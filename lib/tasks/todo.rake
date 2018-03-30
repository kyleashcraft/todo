namespace :todo do
  desc "Delete items older than seven days"
  task delete_expired: :environment do
    items = Item.where("created_at <= ?", Time.now - 7.days)
    count = items.count
    if items.destroy_all
      puts "#{count} items deleted."
    end
  end

end
