# Fluentd-Docker


FluentD Token--

dt0c01.3O2WJLGJALHSYDRMMCQMM4KQ.Z2BFULKHYZBLAT36WWJCDYVQ7IENCYBVWM2WJ6XHPBQWTNO4EMM2LX2W3WV6WO67


--command to run docker container with fluentd logging---

td-agent -c td-agent.conf

docker run --log-driver=fluentd sha256:d2fb6d7e23f2c8002e3f04c47ec5ec2a7dff92184d4b132fb6c87dd3f3b3f17f


```
<source>
  @type forward
  port 24224
  bind 0.0.0.0
</source>

<filter docker.container_id.sha256:d2fb6d7e23f2c8002e3f04c47ec5ec2a7dff92184d4b132fb6c87dd3f3b3f17f>
  @type record_transformer
  enable_ruby
  <record>
    severity   ERROR
    timestamp  ${record['log'].match(/^(\d{2}:\d{2}:\d{2}\.\d{3})/)[1]}
    message    ${record['log'].match(/-- (.*)/)[1]}
    log        Content
  </record>
</filter>

<match docker.container_id.sha256:d2fb6d7e23f2c8002e3f04c47ec5ec2a7dff92184d4b132fb6c87dd3f3b3f17f>
  @type              dynatrace
  active_gate_url    https://knoldus-vostro-3590:9999/e/xfp70958/api/v2/logs/ingest
  api_token          dt0c01.JI4UW4CNQSFX5ZNEH55WRC73.OIE3KJHXCZAUXCYNBS6BU2C6YMY3YZEPTALFZDDF4COJL4TUIQXF5PTOXLMTJJLX
  ssl_verify_none    true
  inject_timestamp   false
</match>
```
