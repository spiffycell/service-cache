job "postgres" {
  datacenters = ["us-east-1"]
  type = "service"

  update {
    max_parallel = 1
    min_healthy_time = "5s"
    healthy_deadline = "3m"
    auto_revert = false
  }


  group "postgres" {
    count = 1

    service {
      port = "http"

      check {
        type     = "tcp"
        interval = "10s"
        timeout  = "2s"
      }
    }

    task "postgres" {
      driver = "docker"

      config {
        image = "postgres"
	network_mode = "host"
	port_map {
	  db = 5432
	}
      }

      env {
        POSTGRES_USER = "${POSTGRES_USER}"
        POSTGRES_PASSWORD = "${POSTGRES_PASSWORD}"
        POSTGRES_HOST = "${POSTGRES_HOST}"
	POSTGRES_PORT = "${POSTGRES_PORT}"
	POSTGRES_DB = "${POSTGRES_DB}"
      }

      resources {
        cpu    = 500 # MHz
        memory = 128 # MB
      }
    }
  }
}
