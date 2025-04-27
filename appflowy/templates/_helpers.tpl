{{/*
Expand the name of the chart.
*/}}
{{- define "appflowy-cloud.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end }}

{{/*
Create a fullname for all resources.
*/}}
{{- define "appflowy-cloud.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else }}
{{- printf "%s-%s" .Release.Name (include "appflowy-cloud.name" .) | trunc 63 | trimSuffix "-" -}}
{{- end }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "appflowy-cloud.labels" -}}
helm.sh/chart: {{ .Chart.Name }}-{{ .Chart.Version | replace "+" "_" }}
app.kubernetes.io/name: {{ include "appflowy-cloud.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/version: {{ .Chart.AppVersion }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "appflowy-cloud.selectorLabels" -}}
app.kubernetes.io/name: {{ include "appflowy-cloud.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
