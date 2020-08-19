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

  end
end