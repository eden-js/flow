<flow-action-model-set>
  <div class="card card-flowing card-{ opts.element.color || 'primary' } mb-3 { opts.elementClass }">
    <div class="card-header">
      <div class="card-icon">
        <i class={ opts.element.icon } />
      </div>

      { opts.element.title }

    </div>
    <div class="card-body">
      Set the value(s) of this Model to:

      <div class="key-value mt-2">
        <div class="row mb-2" each={ set, i in (opts.element.config || {}).sets || [] }>
          <div class="col-5 pr-0">
            <input class="form-control bg-light" ref="key" value={ set.key } type="text" onchange={ onChange } placeholder="Key" />
          </div>
          <div class="col-5 pr-0">
            <div class="input-group">
              <div class="input-group-prepend">
                <button class="btn btn-outline-secondary dropdown-toggle" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                  { capitalize(set.type || 'text') }
                </button>
                <div class="dropdown-menu">
                  <button class="dropdown-item" onclick={ onType } data-type="text">Text</button>
                  <button class="dropdown-item" onclick={ onType } data-type="number">Number</button>
                  <button class="dropdown-item" onclick={ onType } data-type="boolean">Boolean</button>
                </div>
              </div>
              <input class="form-control bg-light" ref="value" value={ set.value } type="text" onchange={ onChange } placeholder="Value" />
            </div>
          </div>
          <div class="col-2">
            <button class="btn btn-block btn-danger" onclick={ onRemoveSet }>
              <i class="fa fa-times" />
            </button>
          </div>
        </div>

        <div class="row">
          <div class="ml-auto col-2">
            <button class="btn btn-block btn-success" onclick={ onAddSet }>
              <i class="fa fa-plus" />
            </button>
          </div>
        </div>
      </div>
    </div>
  </div>

  <script>

    /**
     * capitilize string
     */
    capitalize(s) {
      // check typeof
      if (typeof s !== 'string') return '';

      // return uppercase
      return s.charAt(0).toUpperCase() + s.slice(1);
    }

    /**
     * on change timing
     *
     * @param {Event} e
     */
    onAddSet(e) {
      // prevent
      e.preventDefault();
      e.stopPropagation();

      // set values
      if (!opts.element.config) opts.element.config = {};
      if (!opts.element.config.sets) opts.element.config.sets = [];

      // push
      opts.element.config.sets.push({});

      // set element
      opts.setElement(opts.element.uuid, {
        config : opts.element.config,
      });

      // update
      this.update();
    }

    /**
     * on remove set
     *
     * @param {Event} e
     */
    onRemoveSet(e) {
      // prevent
      e.preventDefault();
      e.stopPropagation();

      // splice out
      opts.element.config.sets.splice(e.item.i, 1);

      // set element
      opts.setElement(opts.element.uuid, {
        config : opts.element.config,
      });

      // update
      this.update();
    }

    /**
     * on remove set
     *
     * @param {Event} e
     */
    onChange(e) {
      // set value
      opts.element.config.sets[e.item.i][jQuery(e.target).attr('ref')] = e.target.value;

      // set element
      opts.setElement(opts.element.uuid, {
        config : opts.element.config,
      });

      // update
      this.update();
    }

    /**
     * on remove set
     *
     * @param {Event} e
     */
    onType(e) {
      // set value
      opts.element.config.sets[e.item.i].type = jQuery(e.target).attr('data-type');

      // set element
      opts.setElement(opts.element.uuid, {
        config : opts.element.config,
      });

      // update
      this.update();
    }

  </script>
</flow-action-model-set>