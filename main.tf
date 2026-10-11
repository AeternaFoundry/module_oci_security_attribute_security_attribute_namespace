resource "oci_security_attribute_security_attribute_namespace" "security_attribute_security_attribute_namespaces" {
  for_each = var.security_attribute_security_attribute_namespaces

  compartment_id = each.value.compartment_id
  description    = each.value.description
  name           = each.value.name
  defined_tags   = each.value.defined_tags
  freeform_tags  = each.value.freeform_tags
  is_retired     = each.value.is_retired

  dynamic "timeouts" {
    for_each = each.value.timeouts != null ? [each.value.timeouts] : []
    content {
      create = timeouts.value.create
      delete = timeouts.value.delete
      update = timeouts.value.update
    }
  }
}

