require 'multitenant_redtastic/version'

module MultitenantRedtastic
  ::Redtastic::Connection.class_eval do
    class << self
      def namespace
        "#{schema_name}#{'_' + @namespace if @namespace}"
      end

      def schema_name
        ActiveRecord::Base.connection.schema_search_path.gsub(/[^0-9A-Za-z]/, '')
      end
    end
  end
end
