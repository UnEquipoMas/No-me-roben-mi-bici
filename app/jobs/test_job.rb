class TestJob < ApplicationJob
  queue_as :default

  def perform(name, email, report)
    MessageMailer.comentario_reporte(name, email, report).deliver_now
  end
end
