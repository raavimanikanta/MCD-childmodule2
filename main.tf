data "newrelic_alert_policy" "foo" {
  name = "data_source_policy"
}


resource "newrelic_nrql_alert_condition" "foo" {
  # for_each={for i,data in var.condition_name_querydata: i => data}    // {for i, v in var.tenants:  i => v}
  
  
  count=length(var.condition_name_querydata)
  type                         = "baseline"
  account_id                   = 3627500
  name                         = "${lookup(var.condition_name_querydata[count.index],"name")}"
  policy_id                    = data.newrelic_alert_policy.foo.id
  description                  = "Alert when transactions are taking too long"
  enabled                      = true
  runbook_url                  = "https://www.example.com"
  violation_time_limit_seconds = 3600
  aggregation_method           = "event_flow"
  aggregation_delay            = 120
  slide_by                     = 30

  # baseline type only
  baseline_direction = "upper_only"

  nrql {
    query="${lookup(var.condition_name_querydata[count.index],"Nrql")}"
    # query = "SELECT percentile(duration, 95) FROM Transaction WHERE appName = 'FoodMe'"
  }

  critical {
    operator              = "above"
    threshold             ="${lookup(var.condition_name_querydata[count.index],"critical_threshold")}"
    threshold_duration    = "${lookup(var.condition_name_querydata[count.index],"critical_threshold_duration")}"
    threshold_occurrences = "all"
  }

  warning {
    operator              = "above"
    threshold             ="${lookup(var.condition_name_querydata[count.index],"warning_threshold")}"
    threshold_duration    = "${lookup(var.condition_name_querydata[count.index],"warning_threshold_duration")}"
    threshold_occurrences = "all"
  }
}