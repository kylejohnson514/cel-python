Feature: "timestamps"
         "Timestamp and duration tests."


# "timestamp_conversions" -- "Conversions of timestamps to other types."

Scenario: "toInt_timestamp"
 When CEL expression "int(timestamp('2009-02-13T23:31:30Z'))" is evaluated
 Then value is Value(value_type='int64_value', value=1234567890)

Scenario: "toString_timestamp"
 When CEL expression "string(timestamp('2009-02-13T23:31:30Z'))" is evaluated
 Then value is Value(value_type='string_value', value='2009-02-13T23:31:30Z')

Scenario: "toType_timestamp"
 When CEL expression "type(timestamp('2009-02-13T23:31:30Z'))" is evaluated


# "duration_conversions" -- "Conversions of durations to other types."

Scenario: "toString_duration"
 When CEL expression "string(duration('1000000s'))" is evaluated
 Then value is Value(value_type='string_value', value='1000000s')

Scenario: "toType_duration"
 When CEL expression "type(duration('1000000s'))" is evaluated


# "timestamp_selectors" -- "Timestamp selection operators without timezones"

Scenario: "getDate"
 When CEL expression "timestamp('2009-02-13T23:31:30Z').getDate()" is evaluated
 Then value is Value(value_type='int64_value', value=13)

Scenario: "getDayOfMonth"
 When CEL expression "timestamp('2009-02-13T23:31:30Z').getDayOfMonth()" is evaluated
 Then value is Value(value_type='int64_value', value=12)

Scenario: "getDayOfWeek"
 When CEL expression "timestamp('2009-02-13T23:31:30Z').getDayOfWeek()" is evaluated
 Then value is Value(value_type='int64_value', value=5)

Scenario: "getDayOfYear"
 When CEL expression "timestamp('2009-02-13T23:31:30Z').getDayOfYear()" is evaluated
 Then value is Value(value_type='int64_value', value=43)

Scenario: "getFullYear"
 When CEL expression "timestamp('2009-02-13T23:31:30Z').getFullYear()" is evaluated
 Then value is Value(value_type='int64_value', value=2009)

Scenario: "getHours"
 When CEL expression "timestamp('2009-02-13T23:31:30Z').getHours()" is evaluated
 Then value is Value(value_type='int64_value', value=23)

Scenario: "getMilliseconds"
 When CEL expression "timestamp('2009-02-13T23:31:20.123456789Z').getMilliseconds()" is evaluated
 Then value is Value(value_type='int64_value', value=123)

Scenario: "getMinutes"
 When CEL expression "timestamp('2009-02-13T23:31:30Z').getMinutes()" is evaluated
 Then value is Value(value_type='int64_value', value=31)

Scenario: "getMonth"
 When CEL expression "timestamp('2009-02-13T23:31:30Z').getMonth()" is evaluated
 Then value is Value(value_type='int64_value', value=1)

Scenario: "getSeconds"
 When CEL expression "timestamp('2009-02-13T23:31:30Z').getSeconds()" is evaluated
 Then value is Value(value_type='int64_value', value=30)


# "timestamp_selectors_tz" -- "Timestamp selection operators with timezones"

Scenario: "getDate"
 When CEL expression "timestamp('2009-02-13T23:31:30Z').getDate('Australia/Sydney')" is evaluated
 Then value is Value(value_type='int64_value', value=14)

Scenario: "getDayOfMonth_name_pos"
 When CEL expression "timestamp('2009-02-13T23:31:30Z').getDayOfMonth('US/Central')" is evaluated
 Then value is Value(value_type='int64_value', value=12)

Scenario: "getDayOfMonth_numerical_pos"
 When CEL expression "timestamp('2009-02-13T23:31:30Z').getDayOfMonth('+11:00')" is evaluated
 Then value is Value(value_type='int64_value', value=13)

Scenario: "getDayOfMonth_numerical_neg"
 When CEL expression "timestamp('2009-02-13T02:00:00Z').getDayOfMonth('-2:30')" is evaluated
 Then value is Value(value_type='int64_value', value=11)

Scenario: "getDayOfMonth_name_neg"
 When CEL expression "timestamp('2009-02-13T02:00:00Z').getDayOfMonth('America/St_Johns')" is evaluated
 Then value is Value(value_type='int64_value', value=11)

Scenario: "getDayOfWeek"
 When CEL expression "timestamp('2009-02-13T23:31:30Z').getDayOfWeek('UTC')" is evaluated
 Then value is Value(value_type='int64_value', value=5)

Scenario: "getDayOfYear"
 When CEL expression "timestamp('2009-02-13T23:31:30Z').getDayOfYear('US/Central')" is evaluated
 Then value is Value(value_type='int64_value', value=43)

Scenario: "getFullYear"
 When CEL expression "timestamp('2009-02-13T23:31:30Z').getFullYear('-9:30')" is evaluated
 Then value is Value(value_type='int64_value', value=2009)

Scenario: "getHours"
 When CEL expression "timestamp('2009-02-13T23:31:30Z').getHours('2:00')" is evaluated
 Then value is Value(value_type='int64_value', value=1)

Scenario: "getMinutes"
 When CEL expression "timestamp('2009-02-13T23:31:30Z').getMinutes('Asia/Kathmandu')" is evaluated
 Then value is Value(value_type='int64_value', value=16)

Scenario: "getMonth"
 When CEL expression "timestamp('2009-02-13T23:31:30Z').getMonth('UTC')" is evaluated
 Then value is Value(value_type='int64_value', value=1)

Scenario: "getSeconds"
 When CEL expression "timestamp('2009-02-13T23:31:30Z').getSeconds('-00:00')" is evaluated
 Then value is Value(value_type='int64_value', value=30)


# "timestamp_equality" -- "Equality operations on timestamps."

Scenario: "eq_same"
 When CEL expression "timestamp('2009-02-13T23:31:30Z') == timestamp('2009-02-13T23:31:30Z')" is evaluated
 Then value is Value(value_type='bool_value', value=True)

Scenario: "eq_diff"
 When CEL expression "timestamp('2009-02-13T23:31:29Z') == timestamp('2009-02-13T23:31:30Z')" is evaluated
 Then value is Value(value_type='bool_value', value=False)

Scenario: "neq_same"
 When CEL expression "timestamp('1945-05-07T02:41:00Z') != timestamp('1945-05-07T02:41:00Z')" is evaluated
 Then value is Value(value_type='bool_value', value=False)

Scenario: "neq_diff"
 When CEL expression "timestamp('2000-01-01T00:00:00Z') != timestamp('2001-01-01T00:00:00Z')" is evaluated
 Then value is Value(value_type='bool_value', value=True)


# "duration_equality" -- "Equality tests for durations."

Scenario: "eq_same"
 When CEL expression "duration('123s') == duration('123s')" is evaluated
 Then value is Value(value_type='bool_value', value=True)

Scenario: "eq_diff"
 When CEL expression "duration('60s') == duration('3600s')" is evaluated
 Then value is Value(value_type='bool_value', value=False)

Scenario: "neq_same"
 When CEL expression "duration('604800s') != duration('604800s')" is evaluated
 Then value is Value(value_type='bool_value', value=False)

Scenario: "neq_diff"
 When CEL expression "duration('86400s') != duration('86164s')" is evaluated
 Then value is Value(value_type='bool_value', value=True)


# "timestamp_arithmetic" -- "Arithmetic operations on timestamps and/or durations."

Scenario: "add_duration_to_time"
 When CEL expression "timestamp('2009-02-13T23:00:00Z') + duration('240s') == timestamp('2009-02-13T23:04:00Z')" is evaluated
 Then value is Value(value_type='bool_value', value=True)

Scenario: "add_time_to_duration"
 When CEL expression "duration('120s') + timestamp('2009-02-13T23:01:00Z') == timestamp('2009-02-13T23:03:00Z')" is evaluated
 Then value is Value(value_type='bool_value', value=True)

Scenario: "add_duration_to_duration"
 When CEL expression "duration('600s') + duration('50s') == duration('650s')" is evaluated
 Then value is Value(value_type='bool_value', value=True)

Scenario: "subtract_duration_from_time"
 When CEL expression "timestamp('2009-02-13T23:10:00Z') - duration('600s') == timestamp('2009-02-13T23:00:00Z')" is evaluated
 Then value is Value(value_type='bool_value', value=True)

Scenario: "subtract_time_from_time"
 When CEL expression "timestamp('2009-02-13T23:31:00Z') - timestamp('2009-02-13T23:29:00Z') == duration('120s')" is evaluated
 Then value is Value(value_type='bool_value', value=True)

Scenario: "subtract_duration_from_duration"
 When CEL expression "duration('900s') - duration('42s') == duration('858s')" is evaluated
 Then value is Value(value_type='bool_value', value=True)


# "comparisons" -- "Comparisons on timestamps and/or durations."

Scenario: "leq_timestamp_true"
 When CEL expression "timestamp('2009-02-13T23:00:00Z') <= timestamp('2009-02-13T23:00:00Z')" is evaluated
 Then value is Value(value_type='bool_value', value=True)

Scenario: "leq_timestamp_false"
 When CEL expression "timestamp('2009-02-13T23:00:00Z') <= timestamp('2009-02-13T22:59:59Z')" is evaluated
 Then value is Value(value_type='bool_value', value=False)

Scenario: "leq_duration_true"
 When CEL expression "duration('200s') <= duration('200s')" is evaluated
 Then value is Value(value_type='bool_value', value=True)

Scenario: "leq_duration_false"
 When CEL expression "duration('300s') <= duration('200s')" is evaluated
 Then value is Value(value_type='bool_value', value=False)

Scenario: "less_timestamp_true"
 When CEL expression "timestamp('2009-02-13T23:00:00Z') < timestamp('2009-03-13T23:00:00Z')" is evaluated
 Then value is Value(value_type='bool_value', value=True)

Scenario: "less_duration_true"
 When CEL expression "duration('200s') < duration('300s')" is evaluated
 Then value is Value(value_type='bool_value', value=True)

Scenario: "geq_timestamp_true"
 When CEL expression "timestamp('2009-02-13T23:00:00Z') >= timestamp('2009-02-13T23:00:00Z')" is evaluated
 Then value is Value(value_type='bool_value', value=True)

Scenario: "geq_timestamp_false"
 When CEL expression "timestamp('2009-02-13T22:58:00Z') >= timestamp('2009-02-13T23:00:00Z')" is evaluated
 Then value is Value(value_type='bool_value', value=False)

Scenario: "geq_duration_true"
 When CEL expression "duration('200s') >= duration('200s')" is evaluated
 Then value is Value(value_type='bool_value', value=True)

Scenario: "geq_duration_false"
 When CEL expression "duration('120s') >= duration('200s')" is evaluated
 Then value is Value(value_type='bool_value', value=False)

Scenario: "greater_timestamp_true"
 When CEL expression "timestamp('2009-02-13T23:59:00Z') > timestamp('2009-02-13T23:00:00Z')" is evaluated
 Then value is Value(value_type='bool_value', value=True)

Scenario: "greater_duration_true"
 When CEL expression "duration('300s') > duration('200s')" is evaluated
 Then value is Value(value_type='bool_value', value=True)


# "duration_converters" -- "Conversion functions on durations. Unlike timestamps, we don't, e.g. select the 'minutes' field - we convert the duration to integer minutes."

Scenario: "get_hours"
 When CEL expression "duration('10000s').getHours()" is evaluated
 Then value is Value(value_type='int64_value', value=2)

Scenario: "get_milliseconds"
          "Need to import a variable to get milliseconds."
Given type_env parameter is TypeEnv(name='x', kind='primitive', type_ident='"google.protobuf.Duration"')
Given bindings parameter is Bindings(bindings=[{'key': 'x', 'value': ObjectValue(namespace='type.googleapis.com/google.protobuf.Duration', source=[{'special_value_clause': {'value': '123'}}, {'special_value_clause': {'value': '123456789'}}])}])
 When CEL expression "x.getMilliseconds()" is evaluated
 Then value is Value(value_type='int64_value', value=123123)

Scenario: "get_minutes"
 When CEL expression "duration('3730s').getMinutes()" is evaluated
 Then value is Value(value_type='int64_value', value=62)

Scenario: "get_seconds"
 When CEL expression "duration('3730s').getSeconds()" is evaluated
 Then value is Value(value_type='int64_value', value=3730)
