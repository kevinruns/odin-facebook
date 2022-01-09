json.array! @notifications do |notification|
  json.id notification.id
  json.actor notification.actor.user_name
  json.action notification.action.humanize.downcase

  #json.notifiable notification.notifiable
  json.url friends_index_path
end