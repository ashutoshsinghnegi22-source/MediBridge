from django.shortcuts import render


def csrf_failure(request, reason=""):
    """Custom CSRF failure view that shows a friendly message and a reload link."""
    context = {
        'reason': reason
    }
    return render(request, 'csrf_failure.html', context, status=403)
