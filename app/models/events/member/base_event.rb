class Events::Member::BaseEvent < Lib::BaseEvent
  self.table_name = "member_events"

  belongs_to :member, class_name: "::Member", autosave: false
end