class OrderNotifier < ActionMailer::Base
  default from: "Sam Ruby <depot@example.org>"
  #default from: "pragprog@bravecoders.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.order_notifier.received.subject
  #
  def test
    mail to: "mouhcine.ouaziz@gmail.com", subject: 'test'
  end
  
  def received(order)
    @order = order

    mail to: order.email, subject: 'Pragmatic Store Order Confirmation'
  end
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.order_notifier.shipped.subject
  #
  def shipped(order)
    @order = order

    mail to: order.email, subject: 'Pragmatic Store Order Shipped'
  end
end
