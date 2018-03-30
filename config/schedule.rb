every :hour do
  rake "todo:delete_expired"
end
