function dict --argument-names id action key value
  set --local id (string escape --style=var $id)
  set --local keys_ref _dict_{$id}_keys
  set --local values_ref _dict_{$id}_values
  set --query --global $keys_ref || set --global $keys_ref
  set --query --global $values_ref || set --global $values_ref
  set --local keys $$keys_ref
  set --local values $$values_ref
  contains $key $keys && set --local index (contains --index $key $keys)
  switch $action
  case set
    if set --query --local index
      set {$values_ref}[$index] $value
    else
      set --append $keys_ref $key
      set --append $values_ref $value
    end
  case get
    set --query --local index && echo $values[$index]
  case delete
    set --query --local index \
      && set --erase {$keys_ref}[$index] \
      && set --erase {$values_ref}[$index]
  case \*
    test -n "$keys" || return
    for i in (seq (count $keys))
      echo $keys[$i] $values[$i]
    end
  end
end
