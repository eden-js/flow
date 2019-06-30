<flow-actions>
  <div class="btn-group btn-group-sm" role="group">
    <a href="/admin/flow/{ opts.row.get('_id') }/update" class="btn btn-primary" title="Update">
      <i class="fa fa-pencil-tag" />
    </a>
    <a href="/admin/flow/{ opts.row.get('_id') }/remove" class="btn btn-danger"  title="Delete">
      <i class="fa fa-times" />
    </a>
  </div>
</flow-actions>
