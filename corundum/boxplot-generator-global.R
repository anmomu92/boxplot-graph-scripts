# We create the list of scripts that we want to run
script_list <- c(
  "switch-iperf3-boxplot-generator-tcp.R",
  "switch-iperf3-boxplot-generator-udp-0.R",
  "switch-iperf3-boxplot-generator-udp-10000.R",
  "switch-netperf-boxplot-generator-tcp.R",
  "switch-netperf-boxplot-generator-udp-208KB.R",
  "switch-netperf-boxplot-generator-udp-150MB.R",
  "switch-nuttcp-boxplot-generator-tcp.R",
  "switch-nuttcp-boxplot-generator-udp-0.R",
  "switch-nuttcp-boxplot-generator-udp-10000.R",
  "iperf3-boxplot-generator-tcp.R",
  "iperf3-boxplot-generator-udp-0.R",
  "iperf3-boxplot-generator-udp-10000.R",
  "netperf-boxplot-generator-tcp.R",
  "netperf-boxplot-generator-udp-208KB.R",
  "netperf-boxplot-generator-udp-150MB.R",
  "nuttcp-boxplot-generator-tcp.R",
  "nuttcp-boxplot-generator-udp-0.R",
  "nuttcp-boxplot-generator-udp-10000.R"
)

for(script in script_list) {
  cat(paste("Script: ", script, "\n"))
  if(!file.exists(script)){
    cat("File does not exist: ", script, "\n")
  }else{
    cat("Running: ", script, "\n")
    source(script)
  }
}