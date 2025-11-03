## Append model attributes to make them available in Antlers

If you have a model attribute, to make it available in json serializations or Livewire dehydration/hydrations, add it to the $appends property:

```JavaScript
class Schedule extends Model
{
	protected $appends = [
		'timespan',
	];
	[...]
	public function getTimespanAttribute() : string
	{
		[...]
		return $timespan;
	}
}
```

Then the attribute becomes available in Antlers:

`{{ schedule.timespan }}`