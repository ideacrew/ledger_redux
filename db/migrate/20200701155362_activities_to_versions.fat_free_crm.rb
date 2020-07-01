# frozen_string_literal: true
# This migration comes from fat_free_crm (originally 20200502231454)
# This migration comes from fat_free_crm (originally 20120316045804)

class ActivitiesToVersions < ActiveRecord::Migration[4.2]
  def up
    events = {
      'created'     => 'create',
      'viewed'      => 'view',
      'updated'     => 'update',
      'deleted'     => 'destroy',
      'rejected'    => 'reject',
      'won'         => 'won',
      'completed'   => 'complete',
      'reassigned'  => 'reassign',
      'rescheduled' => 'reschedule'
    }

    activities = connection.select_all 'SELECT * FROM fat_free_crm_activities'
    activities.each do |activity|
      # commented and email activities don't translate well so ignore them
      next unless event = events[activity['action']]

      attributes = {
        item_id: activity['subject_id'],
        item_type: activity['subject_type'],
        whodunnit: activity['user_id'],
        event: event,
        created_at: activity['created_at']
      }
      version = Version.new
      attributes.each { |k, v| version.send("#{k}=", v) }
      version.save!
    end
  end

  def down
  end
end
