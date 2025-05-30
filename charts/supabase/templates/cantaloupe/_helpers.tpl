{{/*
Expand the name of the chart.
*/}}
{{- define "supabase.cantaloupe.name" -}}
{{- default (print .Chart.Name "-cantaloupe") .Values.cantaloupe.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "supabase.cantaloupe.fullname" -}}
{{- if .Values.cantaloupe.fullnameOverride }}
{{- .Values.cantaloupe.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default (print .Chart.Name "-cantaloupe") .Values.cantaloupe.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "supabase.cantaloupe.selectorLabels" -}}
app.kubernetes.io/name: {{ include "supabase.cantaloupe.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "supabase.cantaloupe.serviceAccountName" -}}
{{- if .Values.cantaloupe.serviceAccount.create }}
{{- default (include "supabase.cantaloupe.fullname" .) .Values.cantaloupe.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.cantaloupe.serviceAccount.name }}
{{- end }}
{{- end }}
