var Notifications;

Notifications = class Notifications {
  constructor() {
    this.handleClick = this.handleClick.bind(this);
    this.handleSuccess = this.handleSuccess.bind(this);
    this.notifications = $("[data-behavior='notifications']");
    if (this.notifications.length > 0) {
      this.setup();
    }
  }

  setup() {
    $("[data-behavior='notifications-link']").on("click", this.handleClick);
    return $.ajax({
      url: "/notifications.json",
      datatype: "JSON",
      method: "GET",
      success: this.handleSuccess
    });
  }

  handleClick(e) {
    return $.ajax({
      url: "/notifications/mark_as_read",
      method: "POST",
      dataType: "JSON",
      success: function() {
        return $("[data-behavior='unread-count']").text(0);
      }
    });
  }

  handleSuccess(data) {
    var items;
    console.log(data);
    items = $.map(data, function(notification) {
      return `<li><a class='dropdown-item' href='${notification.url}'>${notification.actor} ${notification.action}</a></li>`;
    });
    $("[data-behavior='unread-count']").text(items.length);
    return $("[data-behavior='notification-items']").html(items);
  }

};

jQuery(function() {
  return new Notifications();
});
