# moodle-observability-stack
A hands-on observability project to learn SRE fundamentals through real-world monitoring, logging, and distributed tracing. This stack helps detect and troubleshoot performance and availability issues in a self-hosted Moodle LMS environment.

## Problem Case

The issues addressed in this project are based on my personal experience as a student in a school that uses Moodle LMS. Before switching to Moodle, the school used Canvas LMS. Canvas is a managed platform offered as a service, and it provided a smooth and reliable experience for students.

After the transition to Moodle, several usability and performance issues became noticeable, especially during peak usage periods. Since Moodle is self-hosted, these issues are often related to limited system visibility and poor monitoring.

The goal of this project is to improve the Moodle LMS experience by introducing observability, so administrators can clearly understand system behavior, detect problems early, and know when to scale infrastructure resources up or down. This ultimately helps make the platform more reliable and improves the student experience.

### Student-Facing Issues

* Slowness and poor performance during peak hours

* Internal Server Error (HTTP 500) when submitting quizzes or assignments

* Pages taking a long time to load

### Observability Gaps Being Addressed

These issues are broken down into key observability problems:

* Lack of visibility into Moodle application latency and request performance.

* Missing end-to-end performance and reliability metrics

* No early indicators for resource exhaustion and service degradation

* Limited visibility into database, cache, and background task health