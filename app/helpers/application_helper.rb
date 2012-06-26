module ApplicationHelper
  def view_model(*args)
    options = args.extract_options!
    html = ''
    html += '<h3>Static Properties</h3>' if args.length > 0
    args.each do |property|
      property = property.to_s
      html += "
        <li class='nav-header' style='text-transform:none'><code>.#{property}</code></li>
        <li><span style='color:lightgray'>&mdash;</span> <span data-bind='text:#{property}'></span></li>"
    end
    if options[:observables].present?
      html += "<h3>Observables</h3>"
      options[:observables].each do |observable|
        observable = observable.to_s
        html += "
        <li class='nav-header' style='text-transform:none'><code>.#{observable}()</code></li>
        <li><span style='color:lightgray'>&mdash;</span> <span data-bind='text:#{observable}'></span></li>"
      end
    end
    if options[:functions].present?
      html += "<h3>Computed Observables</h3>"
      options[:functions].each do |computed|
        computed = computed.to_s
        html += "
        <li class='nav-header' style='text-transform:none'><code>.#{computed}()</code></li>
        <li><span style='color:lightgray'>&mdash;</span> <span data-bind='text:#{computed}'></span></li>"
      end
    end
    if options[:arrays].present?
      html += "<h3>Observable Arrays</h3>"
      options[:arrays].each do |arr|
        arr = arr.to_s
        html += "
        <li class='nav-header' style='text-transform:none'><code>.#{arr}()</code> &mdash; <code>.length => <span data-bind='text:#{arr}().length'></span></code></li>
        <li><pre style='background-color:white;color:black;' class='pre-scrollable' data-bind='text:FormatJSON(ko.toJS(#{arr}()))'></pre></li>"
      end
    end
    html
  end
end
