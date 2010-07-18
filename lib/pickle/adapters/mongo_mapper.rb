# MongoID adapter for Pickle
require 'mongo_mapper'

module MongoMapper #:nodoc:
  module Document
    module PickleAdapter
      include Pickle::Adapter::Base

      # Do not consider these to be part of the class list
      def self.except_classes
        @@except_classes ||= []
      end

      # Gets a list of the available models for this adapter
      def self.model_classes
        @@model_classes ||= ObjectSpace.each_object(Class).select {|klass| klass.ancestors.include?(MongoMapper::Document) || klass.ancestors.include?(MongoMapper::EmbeddedDocument)}
      end

      # get a list of column names for a given class
      def self.column_names(klass)
        #klass.column_names
        klass.keys.keys.to_a
      end

      # Get an instance by id of the model
      def self.get_model(klass, id)
        klass.find(id)
      end

      # Find the first instance matching conditions
      def self.find_first_model(klass, conditions)
        klass.first(conditions)
      end

      # Find all models matching conditions
      def self.find_all_models(klass, conditions)
        klass.all(:conditions => conditions)
      end
    end
  end
end

module MongoMapper #:nodoc:
  module EmbeddedDocument
    module PickleAdapter
      include Pickle::Adapter::Base

      # Do not consider these to be part of the class list
      def self.except_classes
        @@except_classes ||= []
      end

      # Gets a list of the available models for this adapter
      def self.model_classes
        @@model_classes ||= ObjectSpace.each_object(Class).select {|klass| klass.ancestors.include?(MongoMapper::Document) || klass.ancestors.include?(MongoMapper::EmbeddedDocument)}
      end

      # get a list of column names for a given class
      def self.column_names(klass)
        #klass.column_names
        klass.keys.keys
      end

      # Get an instance by id of the model
      def self.get_model(klass, id)
        klass.find(id)
      end

      # Find the first instance matching conditions
      def self.find_first_model(klass, conditions)
        klass.first(conditions)
      end

      # Find all models matching conditions
      def self.find_all_models(klass, conditions)
        klass.all(:conditions => conditions)
      end
    end
  end
end
