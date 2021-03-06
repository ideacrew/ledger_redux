# frozen_string_literal: true

require 'dry-types'

module LedgerRedux
  module Types
    send(:include, Dry.Types())
    send(:include, Dry::Logic)

    # Dublin Core Metadata

    DcmiType            = Types::Coercible::Symbol.default('text'.freeze).enum(
      :collection,            # A collection is an aggregation of items. The term collection means that the resource is described as a group; its parts may be separately described and navigated.
      :dataset,               # A dataset is information encoded in a defined structure (for example, lists, tables, and databases), intended to be useful for direct machine processing.
      :event,                 # An event is a non-persistent, time-based occurrence. Metadata for an event provides descriptive information that is the basis for discovery of the purpose, location, duration, responsible agents, and links to related events and resources. The resource of type event may not be retrievable if the described instantiation has expired or is yet to occur. Examples - exhibition, web-cast, conference, workshop, open-day, performance, battle, trial, wedding, tea-party, conflagration.
      :image,                 # An image is a primarily symbolic visual representation other than text. For example - images and photographs of physical objects, paintings, prints, drawings, other images and graphics, animations and moving pictures, film, diagrams, maps, musical notation. Note that image may include both electronic and physical representations.
      :interactive_resource,  # An interactive resource is a resource which requires interaction from the user to be understood, executed, or experienced. For example - forms on web pages, applets, multimedia learning objects, chat services, virtual reality.
      :service,               # A service is a system that provides one or more functions of value to the end-user. Examples include: a photocopying service, a banking service, an authentication service, interlibrary loans, a Z39.50 or Web server.
      :software,              # oftware is a computer program in source or compiled form which may be available for installation non-transiently on another machine. For software which exists only to create an interactive environment, use interactive instead.
      :sound,                 # A sound is a resource whose content is primarily intended to be rendered as audio. For example - a music playback file format, an audio compact disc, and recorded speech or sounds.
      :text,                  # A text is a resource whose content is primarily words for reading. For example - books, letters, dissertations, poems, newspapers, articles, archives of mailing lists. Note that facsimiles or images of texts are still of the genre text.
    )

    DcmiNamespaces      = Types::Coercible::Symbol.enum(
      "http://purl.org/dc/elements/1.1/",
      "http://purl.org/dc/terms/",
      "http://purl.org/dc/dcmitype/",
      "http://purl.org/dc/dcam/"
    )

    AccountKind = Types::Coercible::Symbol.enum(:accounts_receivable)

    ConsentKind         = Types::Coercible::Symbol.enum(:text_message, :email_message, :electronic_notices, :lab_results)
    GenderKind          = Types::Coercible::Symbol.enum(:male, :female, :other, :unknown)

    YesNoUnknownKind    = Types::Coercible::Symbol.default(:no).enum(:yes, :no, :unknown, :refused)
    YesNoPartialKind    = Types::Coercible::Symbol.default(:no).enum(:yes, :no, :partial, :refused)
    YesNoKind           = Types::Coercible::Symbol.default(:no).enum(:yes, :no)
    AttestationKind     = Types::Coercible::Symbol.enum(:yes_no)
    GuideKind           = Types::Coercible::Symbol.enum(:internal, :external)

    InjuryOrIllnessKind = Types::Coercible::Symbol.default(:other_illness).enum(:injury, :skin_disorder, :respiratory_condition, :poisoning, :hearing_loss, :other_illness)
    CaseOutcomeKind     = Types::Coercible::Symbol.enum(:death, :away_from_work, :job_transfer_or_restriction, :other_recordable_cases)

    EmploymentKind            = Types::Coercible::Symbol.enum(:employed, :unemployed, :unemployed_covid, :retired, :unable_to_work, :student, :minor, :unknown)
    ContactSettingKind        = Types::Coercible::Symbol.enum(:home, :school, :dahy_care, :workplace, :place_of_worship, :shelter, :health_medical_care, :travel_or_transit, :retail)
    HealthCareSettingKind     = Types::Coercible::Symbol.enum(:hospital, :ambulatory_care, :first_responder, :urgent_care, :long_term_care, :hospice)
    PreExistingConditionKind  = Types::Coercible::Symbol.enum(:chronic_lung_disease, :diabetes, :severe_obesity, :cvd, :chronic_renal_disease, :chronic_liver_disease, :immunocompromised, :pregnant)
    CongregateSettingKind     = Types::Coercible::Symbol.enum(:corrections, :dorm, :group_home, :multi_family_hh, :multi_generational_hh)
    LocationKind              = Types::Coercible::Symbol.enum(:congregate_settings, :correctional_facilities, :workplaces, :health_care, :schools_and_childcare, :homeless_shelters)

    HighRiskOccupationKind    = Types::Coercible::Symbol.enum(:first_responder, :health_care_worker, :law_enforcement)

    SymptomKind               = Types::Coercible::Symbol.enum(:fever, :cough, :shortness_of_breath, :diarrhea, :headache,
                                                              :muscle_ache, :chills, :sore_throat, :vomiting, :abdominal_pain,
                                                              :loss_of_taste, :loss_of_smell, :nasal_congestion, :malaise, :fatigue)

    ContactAddressKind  = Types::Coercible::String.default("Business").enum("Billing", "Shipping", "Work", "Home", 'Business')
    # E.164 Standard
    PhoneNumber       = Types::String.constrained(format: /^\+(?:[0-9] ?){6,14}[0-9]$/)
    # PhoneNumber       = Types::String.constrained(format: /^\+\d{1,3}\s\d{1,14}(\s\d{1,13})$/)
    # PhoneNumber       = Types::String.constrained(format: /^\+\d{1,3}\s\d{1,14}(\s\d{1,13})?/)

    Email             = Types::String.constrained(format: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i)
    EmailOrString     = Types::Email | Types::String

    Serializers       = Types::String.default('yaml_serializer'.freeze).enum('yaml_serializer', 'xml_serializer')
    Stores            = Types::String.default('file_store'.freeze).enum('file_store')

    CallableDate      = Types::Date.default { Date.today }
    CallableDateTime  = Types::DateTime.default { DateTime.now }

    HashOrNil         = Types::Hash | Types::Nil
    StringOrNil       = Types::String | Types::Nil


    RequiredString    = Types::Strict::String.constrained(min_size: 1)
    StrippedString    = Types::String.constructor(&:strip)
    SymbolOrString    = Types::Symbol | Types::String
    NilOrString       = Types::Nil | Types::String

    CoercedInteger    = Types::Coercible::Integer | Types::Coercible::Float.constructor(&:to_i)

    StrictSymbolizingHash = Types::Hash.schema({}).strict.with_key_transform(&:to_sym)

    Callable   = Types.Interface(:call)

  end
end
