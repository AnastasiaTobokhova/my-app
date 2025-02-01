{{/*
Создаёт значение по умолчанию для имени приложения.
*/}}
{{- define "my-app.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Создаёт полное имя (fully qualified name) для объекта, используя имя чарта и имя релиза.
*/}}
{{- define "my-app.fullname" -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- if .Values.fullnameOverride -}}
  {{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
  {{- printf "%s-%s" $name .Release.Name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}

{{/*
Генерирует стандартные метки для ресурсов Helm-чарта.
*/}}
{{- define "my-app.labels" -}}
app.kubernetes.io/name: {{ .Chart.Name }}
helm.sh/chart: {{ .Chart.Name }}-{{ .Chart.Version | replace "+" "_" }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end -}}

{{/*
Генерирует метки для селектора ресурсов.
*/}}
{{- define "my-app.selectorLabels" -}}
app: {{ .Chart.Name }}
{{- end -}}


