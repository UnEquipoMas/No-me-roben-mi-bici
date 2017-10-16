class CantSeeTheFuture < ActiveModel::Validator
  def validate(report)
    if report.date > Date.today
      report.errors.add(:date,'no puede ser futura')
    elsif report.date==Date.today and report.hour.strftime( "%H%M" )>Time.zone.now.strftime( "%H%M" )
      report.errors.add(:hour, ' no puede ser futura')
    end
  end
end